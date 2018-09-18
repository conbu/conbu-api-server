@location = {}
@location[:floor_2] = [
  :"AP1",
  :"AP2",
  :"AP3",
  :"AP4",
  :"AP5",
  :"AP6",
]

@location[:floor_3] = [
  :"AP7",
  :"AP8",
  :"AP9",
  :"AP10",
  :"AP11",
]
@location[:all] = @location[:floor_2] + @location[:floor_3]

@location[:all] = @location[:all].sort
