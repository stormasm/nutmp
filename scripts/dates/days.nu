def days [yr_start, yr_end] {
  echo $yr_start..$yr_end | each {
    let yr = $it;

    echo 1..12 | each {
      let month = $it;

      echo 1..31 | each {
        echo $(= `{{$yr}}-{{$month}}-{{$it}}`)
      }
    }
  } | str to-datetime | uniq | group-by date -f "%Y"
}

days 2015 2020  | get "2015".364 "2016".365 "2017".364 "2018".364 "2019".364 "2020".365 | wrap date | insert str { get date | date format "%Y-%m-%d" }
