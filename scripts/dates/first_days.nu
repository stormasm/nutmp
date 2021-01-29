def first-days [yr_start, yr_end] {
  echo $yr_start..$yr_end | each {
    let yr = $it;

    echo 1..12 | each {
      echo $(= `{{$yr}}-{{$it}}-1`)
    } | str to-datetime
  }
}

first-days 2020 2021 | date format "%Y-%b-%d" | shuffle | keep 2
