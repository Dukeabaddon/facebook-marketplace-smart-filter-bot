# facebook-marketplace-smart-filter-bot

<p align="center">
	<img src="docs/assets/workflow-demo.gif" alt="Marketplace Bot demo" width="900" />
</p>

<p align="center">
	Facebook Marketplace smart filter bot for n8n that cuts through noisy listings and sends only relevant results to Telegram and Discord.
</p>

<p align="center">
	<img src="https://img.shields.io/badge/n8n-1F4B99?style=for-the-badge&logo=n8n&logoColor=white" alt="n8n" />
	<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />
	<img src="https://img.shields.io/badge/Apify-111111?style=for-the-badge&logo=apify&logoColor=white" alt="Apify" />
	<img src="https://img.shields.io/badge/Telegram-26A5E4?style=for-the-badge&logo=telegram&logoColor=white" alt="Telegram" />
	<img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord" />
	<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=111111" alt="JavaScript" />
</p>

## Why this exists

Facebook Marketplace searches often return bait listings, miscategorized posts, or items that only loosely match the search term. This bot is built to reduce that noise.

It checks both the title and description context against your keyword and spec rules, then filters by price before sending the results to your chosen channels.

## What it solves

If you are tired of spending time scrolling through fake posts, wrong variants, or sellers using keyword spam, this workflow narrows the feed to items that actually match what you want.

## Features

- Smart filtering across keyword, specs, and price range
- Pagination support with `/more`
- Telegram onboarding flow for quick searches
- Discord and Telegram result delivery
- Open-source friendly config with environment variables

## Demo

Place the GIF at `docs/assets/workflow-demo.gif`.

Recommended demo shot: search something specific like `MacBook Air M1`, then show the bot returning only the matching listings instead of general MacBook noise.

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

1. Run the Docker container from this repo.
2. Copy `.env.example` to `.env`.
3. Fill `.env` with your runtime values.
4. In n8n, create your own Apify, Discord, and Telegram credentials, then select them on the workflow nodes.
5. Import [workflows/facebook-marketplace-bot.workflow.json](workflows/facebook-marketplace-bot.workflow.json) into n8n.
6. Trigger the bot in Telegram with `/start`.

## Configuration rules

- Keep personal credentials out of the workflow export.
- Put deploy-specific IDs in `.env` and reference them from n8n.
- Add new channels by extending `.env.example` and documenting the new variable.
- Keep the workflow fork-friendly so anyone can clone it and plug in their own accounts.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
