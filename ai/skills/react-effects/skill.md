---
name: react-effects
description: Identify and eliminate unnecessary useEffect calls in React components. Use when reviewing React code, refactoring components, writing new React components, or when the user asks about useEffect, data flow, re-renders, or state synchronization. Also triggers when you see useEffect patterns during code review, PR review, or when the user mentions "too many re-renders", "stale state", "effect chains", or "race conditions" in React context.
allowed-tools: Read, Glob, Grep, Edit
user-invocable: true
---

# React Effects Audit

Effects synchronize with external systems (DOM APIs, network, third-party widgets). No external system → no Effect. Unnecessary Effects cause extra render cycles and state sync bugs.

For each `useEffect`, ask: **"Is this synchronizing with something outside of React?"**

- Transforming data for rendering → compute during render
- Responding to a user event → event handler
- Syncing with DOM API / WebSocket / third-party widget → Effect
- Fetching data while component is visible → Effect (but prefer framework/custom hook)

## Patterns to Flag

### 1. Derived state → compute during render

`useState` + `useEffect` that sets state from props/state. Delete both, compute inline. Use `useMemo` only if computation is expensive (>1ms).

```jsx
// Bad                                    // Good
const [fullName, setFullName] = useState('');   const fullName = firstName + ' ' + lastName;
useEffect(() => {
  setFullName(firstName + ' ' + lastName);
}, [firstName, lastName]);
```

### 2. Event logic in Effects → event handler

Effect runs because state changed, but real trigger was user action. If it runs "because the user did X," it's an event handler.

```jsx
// Bad: fires on mount too                // Good
useEffect(() => {                         function handleBuyClick() {
  if (product.isInCart)                     addToCart(product);
    showNotification('Added!');             showNotification('Added!');
}, [product]);                            }
```

### 3. Resetting state on prop change → `key`

```jsx
// Bad                                    // Good
useEffect(() => {                         <Profile userId={userId} key={userId} />
  setComment('');
}, [userId]);
```

### 4. Adjusting partial state on prop change → derive it

Store an ID, derive the object. No sync needed.

```jsx
// Bad                                    // Good
useEffect(() => {                         const [selectedId, setSelectedId] = useState(null);
  setSelection(null);                     const selection = items.find(i => i.id === selectedId) ?? null;
}, [items]);
```

### 5. Effect chains → compute during render + event handlers

Multiple Effects where each sets state triggering the next. Each link = extra render. Move derived values to render, actions to event handlers.

```jsx
// Bad: 3 Effects chaining setState       // Good
useEffect(() => {/*card→gold*/}, [card]);  const isGameOver = round > 5;
useEffect(() => {/*gold→round*/}, [...]);  function handlePlaceCard(nextCard) {
useEffect(() => {/*round→over*/}, [...]);    setCard(nextCard);
                                             if (nextCard.gold) { /* update counts */ }
                                           }
```

### 6. Notifying parent → call in same event

```jsx
// Bad: onChange fires a render late       // Good: batched in one pass
useEffect(() => {                         function updateToggle(nextIsOn) {
  onChange(isOn);                            setIsOn(nextIsOn);
}, [isOn, onChange]);                        onChange(nextIsOn);
                                          }
```

Consider whether the child needs internal state at all — fully controlled components are simpler.

### 7. Data up to parent → lift the fetch

Child fetches then pushes data up via Effect → parent should own the fetch and pass data down. Data flows down in React.

### 8. External store → `useSyncExternalStore`

Manual `addEventListener`/`removeEventListener` Effects syncing external state → use `useSyncExternalStore` instead. It handles concurrent rendering edge cases.

### 9. Data fetching without cleanup → add `ignore` flag

Fetching Effects without cleanup cause race conditions. Always return a cleanup that sets `ignore = true`. Better: extract to a custom hook or use a framework.

### 10. App init in `useEffect(fn, [])` → module-level guard

Breaks under Strict Mode double-mount. Use `let didInit = false` guard or run at module scope: `if (typeof window !== 'undefined') { checkAuthToken(); }`

## Output Format

Per file, classify each `useEffect` as:
- **Unnecessary** — remove, with specific replacement
- **Legitimate** — external sync, no change needed
- **Improvable** — legitimate but missing cleanup or could use a better API

```
### `Component.tsx`
**L14-18** — Unnecessary: derived state → compute inline
**L32-37** — Legitimate: syncs with Mapbox instance
**L45-52** — Improvable: fetch missing cleanup for race conditions
```
