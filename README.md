# EchoAI — Zoom Meeting TL;DRs

![Docker Pulls](https://img.shields.io/badge/docker-ghcr.io%2Fallisondw%2Fechoai-blue)

_EchoAI is a privacy-friendly CLI tool that summarizes your Zoom meetings using the OpenAI API._

This repo contains the **launcher scripts** for EchoAI, with the heavy lifting done in Docker.

---

## Installation

### 1. Download the CLI script

```bash
curl -sSL https://raw.githubusercontent.com/allisondw/echoai/main/echoai -o /usr/local/bin/echoai
chmod +x /usr/local/bin/echoai
```

### 2. (One-time) Set up your OpenAI API key

```bash
curl -sSL https://raw.githubusercontent.com/allisondw/echoai/main/echoai-config.sh -o echoai-config.sh
chmod +x echoai-config.sh
./echoai-config.sh
```

This saves your key to `~/.echoai-api-key` for future runs.

---

## Requirements

- [Docker installed](https://www.docker.com/products/docker-desktop/)
- OpenAI API key ([get one](https://platform.openai.com/account/api-keys))
- Your Zoom transcripts saved in: `~/Documents/Zoom/`

EchoAI will find them automatically.

---

## Usage

### Show most recent meetings

```bash
echoai
```

Displays your 10 most recent meetings with:
- Timestamp
- Inferred topic
- Top 3 speakers

Pick a number to summarize.

---

### Search meetings by keyword

```bash
echoai Q3 Andrew Walsh 07-24-2025
```

Matches your search terms against:
- Meeting titles
- Speaker names
- Folder dates

Then shows the closest matches to pick from.

---

### Outputs

EchoAI will:
- Generate a **.summary.txt** file next to your transcript
- Cache a **.title.txt** file with inferred title + speakers
- Print everything to the terminal

---

## Security

- Your API key is stored only in `~/.echoai-api-key` (chmod 600)
- No data is saved inside the Docker container
- All transcript summarization happens locally, with API calls only to OpenAI

---

## What’s inside the container?

EchoAI runs:

```bash
docker run -it --rm \
  -v "$HOME/Documents/Zoom:/zoom" \
  -e OPENAI_API_KEY="$OPENAI_API_KEY" \
  ghcr.io/allisondw/echoai:latest \
  --zoom-dir /zoom [--list-recent 10 | --search ...]
```

…but you don't have to type that. Just run:

```bash
echoai
```

---

## Feedback? Questions?

Open an issue on this repo or message [@allisondw](https://github.com/allisondw).
