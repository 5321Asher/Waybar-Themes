#!/bin/bash

# Get weather data from wttr.in
# You can change the location by replacing the city name or using your location code
LOCATION="Vaughan"  # Change this to your location

# Fetch weather data
weather_data=$(curl -s "wttr.in/${LOCATION}?format=j1")

if [ $? -ne 0 ] || [ -z "$weather_data" ]; then
    echo '{"text":"N/A","tooltip":"Weather data unavailable"}'
    exit 0
fi

# Parse JSON data
temp=$(echo "$weather_data" | jq -r '.current_condition[0].temp_C')
feels_like=$(echo "$weather_data" | jq -r '.current_condition[0].FeelsLikeC')
condition=$(echo "$weather_data" | jq -r '.current_condition[0].weatherDesc[0].value')
humidity=$(echo "$weather_data" | jq -r '.current_condition[0].humidity')
wind_speed=$(echo "$weather_data" | jq -r '.current_condition[0].windspeedKmph')
wind_dir=$(echo "$weather_data" | jq -r '.current_condition[0].winddir16Point')

# Format output
text="${temp}°C"
tooltip="${condition}\nTemperature: ${temp}°C\nFeels like: ${feels_like}°C\nHumidity: ${humidity}%\nWind: ${wind_speed} km/h ${wind_dir}"

# Output JSON for Waybar
echo "{\"text\":\"${text}\",\"tooltip\":\"${tooltip}\"}"
