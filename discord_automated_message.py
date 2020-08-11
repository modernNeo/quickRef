import discord
import asyncio
import random
import json
import requests

client = discord.Client()

async def background_loop():
    await client.wait_until_ready()
    while not client.is_closed:
        channel = client.get_channel("the channel number goes here")
        await client.send_message(channel, "this is the message")
        await asyncio.sleep(10)

client.loop.create_task(background_loop())
client.run(email, password)