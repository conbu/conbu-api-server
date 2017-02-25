@location = {}
@location[:trac_a] = [
  :"1",
  :"2",
  :"3",
  :"4",
  :"5",
  :"6",
  :"7",
]

@location[:trac_b] = [
  :"8",
  :"9",
  :"10",
  :"11",
]

@location[:lobby] = [
  :"12",
]

@location[:corridor] = [
  :"13",
]

@location[:all] = @location[:trac_a] + @location[:trac_b] + @location[:lobby] + @location[:corridor]

@location[:all] = @location[:all].sort

