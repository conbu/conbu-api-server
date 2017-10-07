@ap_name_pattern = "AP[0-9]{3}"

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
  :"AP108",
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
  :"AP404",
  :"AP405",
  :"AP406",
]
@location[:track_5] = [
  :"AP401",
  :"AP403",
]

# 6F
@location[:track_6] = [
  :"AP601",
]
@location[:track_7] = [
  :"AP602",
]

@location[:all] = @location[:track_1] + @location[:track_2] + @location[:track_3] + @location[:track_4] + @location[:track_5] + @location[:track_6] + @location[:track_7] + @location[:sponsor] + @location[:satellite] + @location[:lobby]

@location[:all] = @location[:all].sort

