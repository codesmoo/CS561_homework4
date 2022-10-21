const express = require('express')
const app = express()
const port = 3000

app.get('/data/2.5/weather', (req, res) => {
  res.json({
    "coord": {
      "lon": -123.262,
      "lat": 44.5623
    },
    "weather": [
      {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon": "01d"
      }
    ],
    "base": "stations",
    "main": {
      "temp": 298.91,
      "feels_like": 298.61,
      "temp_min": 297.59,
      "temp_max": 300.22,
      "pressure": 1013,
      "humidity": 41
    },
    "visibility": 10000,
    "wind": {
      "speed": 3.09,
      "deg": 50
    },
    "clouds": {
      "all": 0
    },
    "dt": 1665782078,
    "sys": {
      "type": 2,
      "id": 2009551,
      "country": "US",
      "sunrise": 1665757615,
      "sunset": 1665797445
    },
    "timezone": -25200,
    "id": 5720727,
    "name": "Corvallis",
    "cod": 200
  })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})