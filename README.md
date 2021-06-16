# Whether Sweater
## About
Whether sweater is a mock backend for an application that allows users to schedule trips and provides basic information regarding the trip specifically, the registration, login, background image service, forecast data, and creating a trip with travel time and weather

## Table of contents
[**About**](#about) |
[**Versions**](#versions) |
[**Setup**](#setup) |
[**Endpoints**](#endpoints) |
[**Examples**](#examples) |
[**Tests**](#running-the-tests) |
[**Deployment**](#deployment) |
[**Developers**](#developers) |
[**Acknowledgements**](#acknowledgements) 

## Getting Started
Visit us on [Heroku](https://joeyh-whether-sweater.herokuapp.com/) or on [Local Host 3000](http://localhost:3000/) to get started with the steps below.

## Versions
* Ruby 2.5.3
* Rails 5.2.5

## Setup
If you are running this API locally, follow the steps below:
  1. Fork and clone this repo
  2. Install gem packages by running `bundle`
  3. Setup the database: `rails db:(drop,create,migrate)` or `rails db:setup`
  4. Run command `rails s` and navigate to http://localhost:3000 to consume API endpoints below

If you are running the API via [Heroku](https://joeyh-whether-sweater.herokuapp.com/), simply consume endpoints below.

## Endpoints
The following are all API endpoints. Note, some endpoints have optional or required query parameters.
- All endpoints run off base connector http://localhost:3000 on local or https://downdraft-backend.herokuapp.com/ on Heroku

### forecast:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/forecast`                             | Retrieve forecast by providing a city name.                     

### background images:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/background`                             | return an image by providing a location name |


### user createa:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `post`    | `/api/v1/users`                             |Provide email, password, and confirmation to create a user and return an api key                      |


### Session create:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `post`    | `/api/v1/sessions`                             | Provide user validation and and api key when passing email and password                      |

## Examples

### A forecast for Denver, Colorado:

```

    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-06-16T04:29:00.000+00:00",
                "sunrise": "2021-06-15T11:31:27.000+00:00",
                "sunset": "2021-06-16T02:29:39.000+00:00",
                "temperature": 78.66,
                "feels_like": 77.95,
                "humidity": 37,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "broken clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "datetime": "06/15/2021",
                    "sunrise": "2021-06-15T11:31:27.000+00:00",
                    "sunset": "2021-06-16T02:29:39.000+00:00",
                    "max_temp": 100.36,
                    "min_temp": 72.9,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "datetime": "06/16/2021",
                    "sunrise": "2021-06-16T11:31:30.000+00:00",
                    "sunset": "2021-06-17T02:30:01.000+00:00",
                    "max_temp": 98.28,
                    "min_temp": 74.3,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "datetime": "06/17/2021",
                    "sunrise": "2021-06-17T11:31:35.000+00:00",
                    "sunset": "2021-06-18T02:30:20.000+00:00",
                    "max_temp": 98.64,
                    "min_temp": 71.87,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "datetime": "06/18/2021",
                    "sunrise": "2021-06-18T11:31:41.000+00:00",
                    "sunset": "2021-06-19T02:30:38.000+00:00",
                    "max_temp": 88.99,
                    "min_temp": 70.59,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "datetime": "06/19/2021",
                    "sunrise": "2021-06-19T11:31:50.000+00:00",
                    "sunset": "2021-06-20T02:30:54.000+00:00",
                    "max_temp": 88.72,
                    "min_temp": 67.51,
                    "conditions": "light rain",
                    "icon": "10d"
                }
            ],
            "hourly_weather": [
                {
                    "datetime": "04:00:00 AM",
                    "temperature": 78.66,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "datetime": "05:00:00 AM",
                    "temperature": 79.21,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "datetime": "06:00:00 AM",
                    "temperature": 79.25,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "datetime": "07:00:00 AM",
                    "temperature": 78.53,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "datetime": "08:00:00 AM",
                    "temperature": 77.52,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "datetime": "09:00:00 AM",
                    "temperature": 76.41,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "datetime": "10:00:00 AM",
                    "temperature": 75.54,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "datetime": "11:00:00 AM",
                    "temperature": 74.84,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                }
            ]
        }
    }
}
```

### A roadtrip create:

```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "austrailia",
            "travel_time": "00:00:00",
            "weather_at_eta": {
                "temperature": 64.89,
                "conditions": "clear sky"
            }
        }
    }
}

```

## Running the Tests

Run all tests in application with `bundle exec rspec`. When test is complete, run `open coverage` to see where tests are being run and where they are not.


## Deployment

- To run this app locally, run `rails s` and navigate to `http://localhost:3000/` in your browser.
- To run this app on Heroku, go to https://joeyh-whether-sweater.herokuapp.com/
## Built Using
- Ruby on Rails

## Developer

* Joey Haas [GitHub](https://github.com/joeyh92989) • [LinkedIn](https://www.linkedin.com/in/haasjoseph/)


## Acknowledgments

Thank you to Open Weather, Unsplash, and Mapqeust for allowing us to use your API's. Thanks Turing School of Software and Engineering for helping me come up with the idea for this application, and thank you for reading through this project!
