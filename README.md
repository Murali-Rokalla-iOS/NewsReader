# News Reader App

## Overview

The News Reader App is a simple iOS application that fetches news articles from the News API and displays them in a user-friendly interface. Users can browse articles, read the full content, bookmark articles for later reading, and filter news by category.

## Features

- Browse a list of news articles with titles and summaries.
- Read the full content of an article by tapping on it.
- Bookmark articles for later reading.
- Filter news by 4 categories.

## Technologies Used

- Swift
- SwiftUI
- URLSession for networking
- Codable for JSON parsing
- XCTest for unit testing

## Implementation Choices

### Architecture

The app is structured using the MVVM (Model-View-ViewModel) design pattern, which separates the UI from the business logic, making it easier to manage state and test components.

### Models
Create models in the `ArticleModel` class
- **ResponseData**: Represents the API response containing a list of articles.
- **Article**: Represents a news article.

### Networking

- **NetworkManager**: Handles API requests and fetches articles from the News API. It uses a completion handler to return results asynchronously.

### ViewModel

- **NewsReaderViewModel**: Manages the state of articles and handles filtering. It uses a `NetworkServiceProtocol` to fetch articles, allowing for easier testing with mock services.

### Views

- **NewsReaderView**: Displays a list of articles and includes bookmark and filter buttons.
- **DetailNewsReaderView**: Displays the full content of a selected article.

## Testing Strategy

### Unit Testing

The app includes unit tests for the following components:

1. **NetworkManagerTests**: Tests the functionality of the `NetworkService` class.
   - `testFetchArticlesSuccess`: Validates successful API calls return non-empty article lists.
   - `testFetchArticlesFailure`: Ensures that invalid category requests result in errors.

2. **NewsReaderViewModelTests**: Tests the `NewsReaderViewModel` class.
   - `testFetchArticlesSuccess`: Verifies that the view model fetches articles correctly using a mock service.
   - `testFetchArticlesFailure`: Checks that the filtering functionality works as intended.
   - `testToggleBookmark`: this method correctly adds or removes an article from bookmarks.
   - `testAllBookmarkedArticles`: Test retrieving all bookmarked articles.

### Mocking

A `MockNewsReaderDelegate` class is used to simulate network responses for unit tests, allowing for isolation of tests from real API calls.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/NewsReaderApp.git
   cd NewsReaderApp
