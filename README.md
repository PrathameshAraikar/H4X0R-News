# H4X0R News

H4X0R News is a news aggregator app that uses the Hacker News API to display the latest and trending news articles. The app is built using SwiftUI and it is compatible with iOS devices.

## Features

- The app fetches data from the Hacker News API and displays the news articles in a list.
- Each news article is displayed with its title and the number of points it has received from the community.
- Tapping on a news article opens up a detail view that displays the article's URL using a WKWebView.

## Architecture

The app follows the Model-View-ViewModel (MVVM) architectural pattern. The app's UI is built using SwiftUI, which provides a declarative way of building the user interface. The ViewModel is responsible for fetching data from the API and providing it to the View. The Model consists of the data structures used to represent the data fetched from the API.
