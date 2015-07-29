# The Ruby Line - v1 Sinatra
Making your DC commute a little less painful. Get to where you need to go. Know what's coming next.

Built in Sinatra as part of a collaborative project with a Front-End Student from The Iron Yard. You can find that repo under a [slightly different name](https://github.com/bellawoo/Ruby-Line-Sinatra "Ruby Line, Sinatra version").

This project was later ported to Rails and adapted for iOS app development purposes. You can find that repo under ["Green Apple Line."](https://github.com/bellawoo/Green-Apple-Line "Green Apple Line")

I loved working on this project so much that I decided to add even more features. The full product will be featured at The Iron Yard May 2015 cohort Demo Day as my final project.

## Features

WMATA Metrorail predictions

'''/estimates/train'''

Must pass parameters as '''lat''' and '''long'''

This pulls data for arrival predictions for the station closest to a fixed location. Location is based on latitude and longitude and must be passed in as parameters.

Capital BikeShare information

'''/estimates/bike'''

Must pass parameters as '''lat''' and '''long'''

This pulls data for dock and bike availabilities for the 5 closest docking stations to a fixed location. Location is based on latitude and longitude and must be passed in as parameters.


Fare Estimate Calculator

Get real time fare estimates for yourself or a group of people from one destination to another. Determine if it's worth your time to save a dollar or two by riding WMATA or if it's peak of the peak and calling an Uber might be more worth it.

Fare is calculated from two given location points (a starting and an end point) given in latitude and longitude. Total fare includes consideration of how many people are in your group and lets you decide how to proceed.

WMATA Metrorail fare calculator

'''/fares/train'''

Must pass parameters as '''lat1''','''long1''','''lat2''','''long2'''

Despite the fact that #unsuckmetrodc isn't actually going to unsuck itself anytime soon, it's still one of the most economical ways to get around. Use this to pull fare information based on the closest metro stations to your start and end locations.

Uber fare estimate

Must pass parameters as '''lat1''','''long1''', '''lat2''', '''long2'''

Sometimes, it's just more economical for your group to take an Uber or hail a cab than to take the metro. But what if there's surge pricing? Is the Metro on peak right now? Use this to compare the fares to determine if Uber is right for your next trip.

## Deprecated

WMATA Bus predictions

Part of the original app design and implemented in development, the WMATA API returns too many results for incoming buses for my personal Heroku account and signifiantly slowed performance time. As this is now maintained as a personal project, I have opted to remove this feature from production. As implemented, this pulls data for arrival predictions for bus stops within a given radius of a fixed location. Location is based on latitude and longitude and must be passed in as parameters.
