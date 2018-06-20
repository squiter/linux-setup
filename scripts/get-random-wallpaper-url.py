import requests
import json
import random

def get_random_image_url(reddit_response):
    parsed_posts = reddit_response['data']['children']
    posts_with_preview = [post['data'] for post in parsed_posts if has_attribute(post['data'], 'preview')]
    only_images = [post['preview']['images'][0]['source']['url'] for post in posts_with_preview]
    return random.choice(only_images)

def get_wallpapers():
    url = "https://www.reddit.com/r/WidescreenWallpaper/new.json?&limit=100"
    result = requests.get(url, headers = {'User-agent': 'get-wallpaper-by-squiter'})

    if result.status_code == 200:
        return get_random_image_url(json.loads(result.text))
    else:
        print("deu ruim hein?", result.status_code, result.text)

def has_attribute(data, attribute):
    return attribute in data and data[attribute] is not None

print(get_wallpapers())
