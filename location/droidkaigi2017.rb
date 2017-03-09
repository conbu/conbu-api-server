@location = {}
@location[:room_1] = [
  :"AP01",
  :"AP02",
  :"AP03",
  :"AP04",
]
@location[:room_2] = [
  :"AP05",
  :"AP06",
]
@location[:room_3] = [
  :"AP10",
  :"AP11",
  :"AP12",
  :"AP13",
  :"AP14",
]
@location[:room_4] = [
  :"AP15",
  :"AP16",
]
@location[:room_5] = [
  :"AP17",
]
@location[:room_6] = [
  :"AP18",
]
@location[:lobby] = [
  :"AP07",
]
@location[:sponsor] = [
  :"AP19",
]
@location[:speaker] = [
  :"AP09",
]

@location[:all] = @location[:room_1] + @location[:room_2] + @location[:room_3] + @location[:room_4] + @location[:room_5] + @location[:room_6] + @location[:lobby] + @location[:sponsor] + @location[:speaker]

@location[:all] = @location[:all].sort
