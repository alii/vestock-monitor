module util

import structs
import net.http
import json
import os

struct MessageEmbed {
	title string
	description string
}

struct WebhookMessage {
	content string
	embeds []MessageEmbed
}

pub fn send_webhook(products []structs.MobileStockProduct) {
	discord_id := os.getenv('DISCORD_ID')
	discord_token := os.getenv('DISCORD_TOKEN')

	url := 'https://discord.com/api/webhooks/$discord_id/$discord_token'

	body := json.encode(WebhookMessage{
		content: "hello world",
		embeds: [],
	})

	http.fetch(url, http.FetchConfig{
		method: .post,
		data: body,
		header: http.new_header({
			key: .content_type,
			value: 'application/json'
		})
	}) or { panic(err) }
}
