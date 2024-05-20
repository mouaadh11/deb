import requests

# Define the data as a dictionary
data = {"sid": 1}

# Set the URL
url = "http://localhost:3000/DDIG/SDPR"

# Send the POST request with JSON data
response = requests.post(url, json=data)

# Check for successful response
if response.status_code == 200:
  print("Request successful!")
  # Access the response content (if applicable)
  # response_content = response.json()
  # print(response_content)
else:
  print("Error:", response.status_code)
  print(response.text)  # Might contain error details
