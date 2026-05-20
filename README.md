# Facebook Marketplace Smart Filter Bot

<p align="center">
	<img src="docs/assets/workflow-demo.gif" alt="Marketplace Bot demo" width="900" />
</p>

<p align="center">
	Rule-based smart automation for Facebook Marketplace that filters noisy listings and delivers only relevant results to Telegram and Discord.
</p>

<p align="center">
	<img src="https://img.shields.io/badge/n8n-1F4B99?style=for-the-badge&logo=n8n&logoColor=white" alt="n8n" />
	<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />
	<img src="https://img.shields.io/badge/Apify-111111?style=for-the-badge&logo=apify&logoColor=white" alt="Apify" />
	<img src="https://img.shields.io/badge/Telegram-26A5E4?style=for-the-badge&logo=telegram&logoColor=white" alt="Telegram" />
	<img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord" />
	<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=111111" alt="JavaScript" />
</p>

## Overview

Facebook Marketplace search results are often polluted with keyword-stuffed bait listings and irrelevant variants. This project solves that by routing search forms through an automated pipeline. It leverages Apify to scrape raw results, evaluates them using regex and conditional JavaScript filtering, and routes clean data to Discord and Telegram.

## Architecture

1. **Trigger**: Telegram webhook intercepts chat commands (`/start` or `/more`).
2. **Scraper**: n8n orchestrates queries to Apify's Marketplace actor.
3. **Filter**: Custom JavaScript logic strips irrelevant or keyword-stuffed postings based on title, description context, and price bounds.
4. **Delivery**: Cleaned JSON payloads are formatted and broadcast to Discord channels and Telegram users.

## Features

- Smart filtering across keyword, specs, and price range
- Pagination support with `/more`
- Telegram onboarding flow for quick searches
- Discord and Telegram result delivery
- Clean, fork-friendly env configuration

## Environment variables

Copy `.env.example` to `.env` and set the runtime values for your install.

| Variable | Purpose |
|---|---|
| `N8N_PORT` | n8n container port |
| `APIFY_ACTOR_ID` | Marketplace scraper actor ID |
| `DISCORD_GUILD_ID` | Discord server ID |
| `DISCORD_CHANNEL_ID` | Discord channel ID |
| `TELEGRAM_CHAT_ID` | Telegram chat ID |

## Setup

1. Copy `.env.example` to `.env` and fill the variables.
2. Build and run the n8n container locally:
   ```bash
   docker build -t fb-market-bot .
   docker run -p 5678:5678 --env-file .env fb-market-bot
   ```
3. Create your Apify, Discord, and Telegram credentials inside n8n.
4. Import [workflows/facebook-marketplace-bot.workflow.json](workflows/facebook-marketplace-bot.workflow.json) into your n8n workspace.
5. Trigger the bot in Telegram via `/start`.

## Repository structure

```text
.
├── Dockerfile
├── LICENSE
├── README.md
├── .env.example
├── workflows/
│   └── facebook-marketplace-bot.workflow.json
└── docs/
    └── assets/
        └── workflow-demo.gif
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
