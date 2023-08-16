# Instagram Clone

This project is an Instagram clone, a social media platform that allows users to share photos, connect with friends, and explore a world of visual content. The clone closely emulates the core features and user interface of the popular Instagram application.

## Features

- **User Authentication**: Users can sign up, log in, and securely manage their accounts. 
- **Profile Management**: Users can create and update their profiles, including profile pictures, usernames, description, and other personal information.
- **Photo Sharing**: Users can upload photos from their devices. They can also like and comment on photos uploaded by other users.
- **News Feed**: The home screen displays a feed of photos and updates from users the logged-in user follows. 
- **Search Functionality**: Users can search for other users, hashtags, and content, making it easy to find and connect with friends and interests.
- **Follow and Unfollow**: Users can follow and unfollow other users to curate their feed and stay updated on their friends' activities.

## Technologies Used

- **Frontend**: HTML, CSS(Bootstrap), JavaScript 
- **Backend**: Ruby on Rails
- **Database**: PostgreSQL 
- **Authentication**: Devise
- **Image Storage**: Cloud storage service (e.g., Amazon S3)

## Getting Started

1. Clone the repository: `git clone https://github.com/hamadhassanintern/Instagram-Clone.git`
2. Navigate to the project directory: `cd Instagram-Clone`
3. Install dependencies for frontend and backend: `bundle install`
4. Run the frontend and backend servers concurrently: `rails server`
5. Access the app in your browser at `http://localhost:3000`.

## Application Dependences 

* **Ruby version**

  ```bash
  ruby-3.2.2
  ```

* **Rails version**

  ```bash
  gem 'rails', '~> 7.0.7'
  ```

* **Rubocop Configuration** 

  ```bash
  group :development, :test do
    gem 'rubocop'
    gem 'rubocop-performance'
    gem 'rubocop-rails'
    gem 'rubocop-minitest' # or gem 'rubocop-rspec' depending on your test suite
  end
  ```

  And than create `.rubocop.yml` file at root fo your project and add following to it:

  ```bash
  require: 
    - rubocop-performance
    - rubocop-rails
    - rubocop-rspec # or rubocop-minitest
   
   
  AllCops:
    # Exclude auto-generated files by Rails
    TargetRubyVersion: 2.7
    TargetRailsVersion: 5.2
    Exclude:
      - 'db/schema.rb'
      - 'node_modules/**/*'
      - 'vendor/bundle/**/*'
      - 'bin/**/*'
      
  Layout/LineLength:
    Max: 120
    
  Metrics/MethodLength:
    Max: 23
  
  Metrics/BlockLength:
    Exclude:
      - config/**/*
      - spec/**/*
  
  Lint/AmbiguousBlockAssociation:
    Exclude:
      - spec/**/*
  
  Style/Documentation:
    Enabled: false
  ```

* **Important Gem**

  ```bash
  # PostgreSQL
  gem 'pg', '~> 1.1'
  # Use Bootstrap
  gem 'bootstrap', '~> 5.0.2'
  # User auth
  gem 'devise', '~> 4.9'
  # file upload
  gem 'carrierwave', '~> 3.0'
  # cloud services library :: image upload Amzon S3
  gem 'fog-aws'
  # image resizing
  gem 'mini_magick', '~> 4.12'
   #local ENV vars
  gem 'figaro'
  
  ```
