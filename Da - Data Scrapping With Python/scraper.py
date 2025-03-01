import requests
from bs4 import BeautifulSoup
import csv

url = "http://quotes.toscrape.com"
response = requests.get(url)

if response.status_code == 200:
    soup = BeautifulSoup(response.text, "html.parser")

    # Open CSV file to store data
    with open("quotes.csv", "w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(["Quote", "Author", "Tags"])  # Headers

        quotes = soup.find_all("div", class_="quote")
        for quote in quotes:
            text = quote.find("span", class_="text").text
            author = quote.find("small", class_="author").text
            tags = ", ".join([tag.text for tag in quote.find_all("a", class_="tag")])
            writer.writerow([text, author, tags])  # Writing to CSV

    print("Quotes saved successfully in quotes.csv ✅")

else:
    print(f"Failed to retrieve the page. Status code: {response.status_code}")

