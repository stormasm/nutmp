def skip1 [] {
  let nl = $(char newline)
  echo $nl | str collect
}

def skip2 [] {
  let nl = $(char newline)
  echo $nl | str collect
  echo $nl | str collect
}
