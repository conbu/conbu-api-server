@location = {}
@location[:floor_2] = [
  :"2-1",
  :"2-2",
  :"2-3",
  :"2-4",
  :"2-5",
  :"2-6",
  :"2-7",
]

@location[:floor_5] = [
  :"5-1",
  :"5-2",
  :"5-3",
]

@location[:all] = @location[:floor_2] + @location[:floor_5]

@location[:all] = @location[:all].sort

