# richsflights
Flight price tracking project

## Motivation
This was a project done for my mobile development class in college. I am a huge aviation fan and I wanted to take on a project that would be able to show my skills in iOS. The project also served as a way for me to search for flight prices without the fear of the price being jacked up because of trackers used on most flight booking websites. I named the project after my college professor (anything to get extra credit..lol).

## Screenshots
<p align="center">
  <img src="Screenshots/homeScreen.png" alt="Home screen" width="375" height="812">
  <img src="Screenshots/emptySelectionScreen.png" alt="Empty airport search screen" width="375" height="812">
  <img src="Screenshots/searchInAction.png" alt="Airport search screen showing result of running JFK search query" width="375" height="812">
  <img src="Screenshots/dateSelection.png" alt="Date selection screen" width="375" height="812">
</p>

## Build issues
The project was built to run on iOS 12 and has not been updated to cater for the changes made in the most recent operating systems. The search API's used in this application have been slightly changed so any searches made in the application will result in a blank response. There is an updated version of the application available [here](https://github.com/masterstoney/RichFlights-2.0).

## Architecture
Application was built using the MVC archirecture.

## Tech and Frameworks
All programming was done in Swift. The user interface was built programmatically using UIKit. Application also makes use of SQLite as the database service for the names of all the airports in the world.
