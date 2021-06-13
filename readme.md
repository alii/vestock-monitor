# vestock-monitor

I wanted to learn vlang and figured writing a restock monitor for supreme would be a fun project to build. I've written a few before, but this was really just to learn the language and if it actually functions running restocks at scale then that is probably a bonus.

To build it, ensure you have v installed and run `v -prod main.v`. Then you can open the binary as you would any other. Make a `.env` file with the following values and watch it go brr

```dotenv
# Webhook id
DISCORD_ID=
# Webhook token
DISCORD_TOKEN=
```
