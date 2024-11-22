import requests
import json

url = "https://www.youtube.com/watch?v=wJiMnEsd9sQ"
data = {"video_url": "https://www.youtube.com/watch?v=vl6jn-DdafM"}
response = requests.post(url, json=data, headers={"Content-Type": "application/json"})
print(json.dumps(response.json(), indent=4, ensure_ascii=False))
