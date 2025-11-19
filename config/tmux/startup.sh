#!/bin/bash

tmux new-session -A -s or-yam -c ~/Developer -n "ZSH" -d

tmux new-session -A -s tikal -c ~/projects/Tikal -n "ZSH" -d

tmux new-session -A -s verbit -c ~/projects/verbit/ai-service-web -n "insights" -d \; \
  new-window -n "insights-review" -c ~/projects/verbit/ai-service-web-reviews/ \; \
  new-window -n "ZSH" -c ~/projects/verbit \; \
  select-window -t 1
