import requests
import json
import random

def get_random_image_url(reddit_response):
    parsed_posts = reddit_response['data']['children']
    only_images = [post['data']['preview']['images'][0]['source']['url'] for post in parsed_posts]
    return random.choice(only_images)

def get_wallpapers():
    url = "https://www.reddit.com/r/WidescreenWallpaper/new.json?&limit=100"
    result = requests.get(url, headers = {'User-agent': 'get-wallpaper-by-squiter'})

    if result.status_code == 200:
        return get_random_image_url(json.loads(result.text))
    else:
        print("deu ruim hein?", result.status_code, result.text)

print(get_wallpapers())
