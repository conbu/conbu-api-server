@location = {}
@location[:floor_2] = [
  :"AP2-1",
  :"AP2-2",
  :"AP2-3",
  :"AP2-4",
  :"AP2-5",
  :"AP2-6",
  :"AP2-7",
  :"AP2-8",
]

@location[:floor_3] = [
  :"AP3-1",
  :"AP3-2",
  :"AP3-3",
  :"AP3-4",
  :"AP3-5",
  :"AP3-6",
  :"AP3-7",
  :"AP3-8",
  :"AP3-9",
  :"AP3-10",
  :"AP3-11",
]
@location[:all] = @location[:floor_1] + @location[:floor_2]

@location[:all] = @location[:all].sort
