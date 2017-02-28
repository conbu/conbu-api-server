@location = {}
# 1F Large exhibition hall
@location[:track_1] = [
  :"AP101",
  :"AP102",
  :"AP103",
  :"AP104",
  :"AP105",
  :"AP106",
]
@location[:sponsor] = [
  :"AP107",
  :"AP108",
  :"AP109",
  :"AP110",
]
@location[:satellite] = [
  :"AP111",
  :"AP112",
]

# 2F Small exhibition hall
@location[:track_2] = [
  :"AP201",
  :"AP202",
  :"AP203",
  :"AP204",
  :"AP205",
  :"AP206",
  :"AP207",
]

# 3F Special conference room
@location[:track_3] = [
  :"AP301",
  :"AP302",
]

# 4F Convention hall
@location[:lobby] = [
  :"AP407",
]
@location[:track_4] = [
  :"AP405",
  :"AP406",
  :"AP407",
]
@location[:track_5] = [
  :"AP401",
  :"AP402",
  :"AP403",
]

@location[:noc] = [
  :"AP408",
]

# 6F
@location[:track_6] = [
  :"AP601",
]
@location[:track_7] = [
  :"AP602",
]
@location[:track_8] = [
  :"AP604",
]
@location[:waiting] = [
  :"AP605",
]

@location[:all] = @location[:track_1] + @location[:track_2] + @location[:track_3] + @location[:track_4] + @location[:track_5] + @location[:track_6] + @location[:track_7] + @location[:track_8] + @location[:sponsor] + @location[:satellite] + @location[:lobby] + @location[:noc] + @location[:waiting]

@location[:all] = @location[:all].sort
