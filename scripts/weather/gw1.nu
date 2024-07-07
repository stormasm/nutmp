###################################################
## Weather Script based on IP Address v1.0
###################################################
def locations [] {
    [
        [location city_column state_column country_column lat_column lon_column];
        ["http://ip-api.com/json/" city region countryCode lat lon]
        ["https://ipapi.co/json/" city region_code country_code latitude longitude]
        # ["https://freegeoip.app/json/" city region_code country_code latitude longitude] # doesn't appear to be free any longer
        ["https://ipwhois.app/json/" city region country_code  latitude longitude]
    ]
}

def get_my_location [index: int] {
    let loc_json = (http get (locations | select $index).0.location)
    let city_column = (locations | select $index).0.city_column
    let state_column = (locations | select $index).0.state_column
    let country_column = (locations | select $index).0.country_column
    let lat_column = (locations | select $index).0.lat_column
    let lon_column = (locations | select $index).0.lon_column

    # echo $loc_json
    if ($city_column | str length) > 1 {
        if ($state_column | str length) > 1 {
            if ($country_column | str length) > 1 {
                let lookup_state = ($loc_json | get ($state_column))
                if ($lookup_state | str length) > 2 {
                    let state = (state_abbrev_lookup $lookup_state)
                    $"($loc_json | get ($city_column)),($state),($loc_json | get ($country_column))"
                } else {
                    $"($loc_json | get ($city_column)),($loc_json | get ($state_column)),($loc_json | get ($country_column))"
                }
            } else {
                $"($loc_json | get ($city_column)),($loc_json | get ($state_column))"
            }
        } else {
            $"($loc_json | get ($city_column))"
        }
    } else {
        "No City Found"
    }
}

def get_location_by_ip [locIdx: int, token: string] {
    let URL_QUERY_LOCATION = "https://api.openweathermap.org/geo/1.0/direct"
    let location = (get_my_location $locIdx)
    let url = $"($URL_QUERY_LOCATION)?q=($location)&limit=5&appid=($token)"
    print $url
    http get $url
}

def show-error [msg label err] {
    let span = (metadata $err).span;
    error make {msg: $msg, label: {text: $label, span: $span } }
}

def get_weather_by_ip [locIdx: int, token: string] {
    # units
    # f = imperial aka Fahrenheit
    # c = metric aka Celsius
    let URL_WEATHER = "https://api.openweathermap.org/data/2.5/weather"
    let coords = (get_location_by_ip $locIdx $token)
    if ($coords | length) > 1 {
        show-error "Error getting location" "There were more than one locations found" $coords
    }

    let units = "imperial"
    let url = $"($URL_WEATHER)?lat=($coords.lat.0)&lon=($coords.lon.0)&units=($units)&appid=($token)"
    print $url
    let weather = (http get $url)
    {
        'Weather Location': $"($weather.name), ($weather.sys.country)"
        Longitude: $weather.coord.lon
        Latitude: $weather.coord.lat
        Temperature: $"($weather.main.temp | into string -d 1) °F"
        'Feels Like': $"($weather.main.feels_like | into string -d 1) °F"
        Humidity: $weather.main.humidity
        Pressure: $weather.main.pressure
        Emoji: (get_icon_from_table $weather.weather.main.0)
    }
}

def weather_emoji_table [] {
    {
        Clear: (char sun)
        Clouds: (char clouds)
        Rain: (char rain)
        Fog: (char fog)
        Mist: (char mist)
        Haze: (char haze)
        Snow: (char snow)
        Thunderstorm: (char thunderstorm)
    }
}

def get_icon_from_table [w] {
    weather_emoji_table | get $w
}

# Get the local weather by ip address
export def gw [] {
    let token = "85a4e3c55b73909f42c6a23ec35b7147"
    get_weather_by_ip 0 $token
}

def state_abbrev_lookup [state_name: string] {
    # Weather Location 3 does not return state name abbreviations
    # so we have to convert a state full name to a state abbreviation
    let lookup_table = {
        Alabama: AL
        Alaska: AK
        Arizona: AZ
        Arkansas: AR
        California: CA
        Colorado: CO
        Connecticut: CT
        Delaware: DE
        Florida: FL
        Georgia: GA
        Hawaii: HI
        Idaho: ID
        Illinois: IL
        Indiana: IN
        Iowa: IA
        Kansas: KS
        Kentucky: KY
        Louisiana: LA
        Maine: ME
        Maryland: MD
        Massachusetts: MA
        Michigan: MI
        Minnesota: MN
        Mississippi: MS
        Missouri: MO
        Montana: MT
        Nebraska: NE
        Nevada: NV
        'New Hampshire': NH
        'New Jersey': NJ
        'New Mexico': NM
        'New York': NY
        'North Carolina': NC
        'North Dakota': ND
        Ohio: OH
        Oklahoma: OK
        Oregon: OR
        Pennsylvania: PA
        'Rhode Island': RI
        'South Carolina': SC
        'South Dakota': SD
        Tennessee: TN
        Texas: TX
        Utah: UT
        Vermont: VT
        Virginia: VA
        Washington: WA
        'West Virginia': WV
        Wisconsin: WI
        Wyoming: WY
    }

    $lookup_table | get $state_name
}

# $emoji_dict | get "803"
# get_emoji_by_id "613"
# $emoji_dict | describe is a record with 50 fields
# $emoji_dict | values | length
# $emoji_dict | columns | length
def get_emoji_by_id [id] {
        let emoji_dict = ({
        "200": "⚡", "201": "⚡", "202": "⚡", "210": "⚡", "211": "⚡", "212": "⚡", "221": "⚡", "230": "⚡",
        "231": "⚡", "232": "⚡",
        "300": "☔", "301": "☔", "302": "☔", "310": "☔", "311": "☔",
        "312": "☔", "313": "☔", "314": "☔", "321": "☔",
        "500": "☔", "501": "☔", "502": "☔", "503": "☔", "504": "☔",
        "511": "☔", "520": "☔", "521": "☔", "522": "☔", "531": "☔",
        "600": "❄️", "601": "❄️", "602": "❄️", "611": "❄️", "612": "❄️",
        "613": "❄️", "615": "❄️", "616": "❄️", "620": "❄️", "621": "❄️",
        "622": "❄️",
        "701": "🌫️", "711": "🌫️", "721": "🌫️", "731": "🌫️", "741": "🌫️", "751": "🌫️", "761": "🌫️", "762": "🌫️",
        "771": "🌫️",
        "781": "🌀",
        "800": "☀️",
        "801": "🌤️", "802": "🌤️", "803": "☁️", "804": "☁️",
    })

    ($emoji_dict | get $id)
}

get_weather_by_ip 0 "85a4e3c55b73909f42c6a23ec35b7147"
