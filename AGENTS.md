# Codex instructions

## Goal
Make this fork easy to run and maintain with Codex. The product goal is to turn recent YouTube videos from selected channels into polished long-form articles and an EPUB ebook.

## Setup
1. Work from the repository root.
2. Create and activate a local virtual environment when possible:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Copy `.env.example` to `.env` if needed. Never commit `.env` or secrets.

## Required credentials
The current implementation expects a YouTube Data API key and an Anthropic API key. Treat them as local secrets. Do not print them in logs or PRs.

## Primary workflow
Run the full pipeline with:
```bash
python main.py
```

Useful supporting entry points may include channel editing and the dashboard as documented in `README.md` and `SKILL.md`.

## Validation
Before proposing changes:
1. Install dependencies in the active environment.
2. Run `python -m compileall .` to catch syntax errors.
3. Run the smallest relevant pipeline step or `python main.py` when credentials/network access are available.
4. Verify generated EPUB output opens successfully when ebook-generation code changes.
5. Never commit `.env`, API keys, Gmail app passwords, generated private email data, or user-specific credentials.

## Product preferences for this fork
Prefer readable, high-signal articles over transcript-like summaries. Preserve source video links and important names/technical terms. When asked to customize output, support Chinese, English, or bilingual ebooks and technical AI-focused channel sets.

## Important files
- `SKILL.md`: intended agent workflow.
- `main.py`: full pipeline entry point.
- `get_videos.py`: YouTube discovery.
- `get_transcripts.py`: transcript extraction.
- `write_articles.py`: LLM transformation.
- `send_email.py`: EPUB creation/email delivery.
- `channels.txt`: selected channels.

## Working style
Use small, reviewable changes. Prefer a branch + PR over direct changes to `main`. If replacing the Anthropic dependency with another model/provider, isolate provider-specific code and keep the rest of the pipeline unchanged where practical.