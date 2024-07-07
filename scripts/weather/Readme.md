
```rust
http get https://api.openweathermap.org/data/2.5/weather?lat=44.5645659&lon=-123.2620435&units=imperial&appid=85a4e3c55b73909f42c6a23ec35b7147
```

#### gw1

This is the first script in the series. It is a simple script that uses the `http` command to get the current weather for a specific location. The location is determined by the latitude and longitude coordinates. The coordinates used in this script are for Corvallis, Oregon.

#### gw2

This is the second script in the series. It is used to get the forecast data
which goes out seven days.

#### get-weather.nu

This is the original script from the nushell *nu_scripts* [repo](https://github.com/nushell/nu_scripts/tree/main/modules/weather).
