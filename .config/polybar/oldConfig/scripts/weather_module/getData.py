import json
import requests

def fetchJson(city, api_key):

    base_url = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + api_key

    response = requests.get(base_url)

    json_res = json.loads(response.content.decode('utf-8'))

    return json_res
