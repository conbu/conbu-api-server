@location = {}
@location[:room_a] = [
  :"36-5",
  :"36-6",
  :"36-8",
  :"36-9",
  :"36-10",
]

@location[:room_b] = [
  :"36-2",
  :"36-3",
  :"36-4",
  :"36-5",
  :"36-6",
]

@location[:room_c] = [
  :"35-1",
  :"36-1",
]

@location[:room_d] = [
  :"35-6",
  :"35-7",
]

@location[:passage] = [
  :"35-2",
  :"35-4",
  :"35-5",
  :"35-8",
  :"35-9",
]

@location[:lt] = [
  :"36-10",
  :"36-11",
]

@location[:noc] = [
  :"35-12",
]

@location[:all] = @location[:room_a] + @location[:room_b] + @location[:room_c] + @location[:room_d] + @location[:passage] + @location[:lt] + @location[:noc]

@location[:all] = @location[:all].sort
