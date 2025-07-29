#!/bin/bash

echo "Let's set up your OpenAI API key for EchoAI."
read -s -p "Enter your OpenAI API key (input hidden): " api_key
echo ""

CONFIG_PATH="$HOME/.echoai-api-key"

# save key securely
echo "$api_key" > "$CONFIG_PATH"
chmod 600 "$CONFIG_PATH"

echo "API key saved to $CONFIG_PATH"