#!/bin/bash

# load or prompt for the API key
if [ -z "$OPENAI_API_KEY" ]; then
  if [ -f "$HOME/.echoai-api-key" ]; then
    OPENAI_API_KEY=$(< "$HOME/.echoai-api-key")
    echo "Using saved API key from ~/.echoai-api-key"
  else
    read -s -p "Enter your OpenAI API key (input hidden): " OPENAI_API_KEY
    echo ""
  fi
fi

# determine CLI mode
if [ "$#" -eq 0 ]; then
  echo "Showing your 10 most recent zoom meetings..."
  SEARCH_FLAG="--list-recent 10"
else
  SEARCH_FLAG="--search $*"
fi

# run the dockerized CLI
docker run -it --rm \
  -v "$HOME/Documents/Zoom:/zoom" \
  -e OPENAI_API_KEY="$OPENAI_API_KEY" \
  ghcr.io/allisondw/echoai:latest \
  --zoom-dir /zoom $SEARCH_FLAG