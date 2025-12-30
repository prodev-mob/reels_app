# Flutter Reels Demo

This Flutter project demonstrates a simple implementation of a Reels-like feature, inspired by popular social media platforms. It includes basic functionality such as swiping between different videos, playing and pausing videos, and displaying likes and comments.

## Features

- **Swiping Videos**: Users can swipe vertically to navigate between different videos.
- **Video Playback**: Videos can be played, paused, and resumed.
- **Likes and Comments**: Each video displays the number of likes and comments it has received.
- **Customizable**: Easily customize the appearance and behavior of the Reels component to fit your app's design.

## Getting Started

## 1. Dependencies
- Add below dependencies in pubspec.yaml
```
  cupertino_icons: ^1.0.6
  cached_network_image: ^3.4.1
  card_swiper: ^3.0.1
  intl: ^0.20.2
  video_player: ^2.9.5
  animate_do: ^4.2.0
  sqflite_android: 2.4.1
```
## 2. Code SetUp
- Intial Code SetUp

  - Intialize 0 and play
  - if(stories.length > 1) then intialize 1

- Previous Stage
  - Stop the [index] player
  - Dispose [index + 1] player
  - Initialize [index - 2] player
  - play [index -1] player

- Next Stage
  - Stop the [index] player
  - Dispose [index - 1] player
  - Intialize [index + 2] player
  - Play [index + 1] player
  
## Videos

https://github.com/prodev-mob/reels_app/assets/97152083/61b0a99d-b7b5-4657-b427-a66a9bb65cf6

