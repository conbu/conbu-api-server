@location = {}
@location[:floor_2] = [
  :"AP01",
  :"AP02",
  :"AP03",
  :"AP04",
  :"AP05",
  :"AP06",
]

@location[:floor_3] = [
  :"AP07",
  :"AP08",
  :"AP09",
  :"AP10",
  :"AP11",
]
@location[:all] = @location[:floor_2] + @location[:floor_3]

@location[:all] = @location[:all].sort
