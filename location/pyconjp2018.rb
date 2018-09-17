@ap_name_pattern = "AP[0-9]{3}"

@location = {}
# 1F Large exhibition hall
@location[:floor_1] = [
  :"AP101",
  :"AP102",
  :"AP103",
  :"AP104",
  :"AP105",
  :"AP106",
  :"AP107",
  :"AP108",
]
@location[:ab] = [
  :"AP109",
  :"AP110",
]

# 2F Small exhibition hall
@location[:floor_2] = [
  :"AP201",
  :"AP202",
  :"AP203",
  :"AP204",
]

# 3F Special conference room
@location[:floor_3] = [
  :"AP301",
  :"AP302",
]

# 4F Convention hall
@location[:floor_4] = [
  :"AP401",
  :"AP402",
  :"AP403",
  :"AP404",
  :"AP405",
  :"AP406",
]
@location[:lobby] = [
  :"AP407",
]

# 4F Staff room
@location[:staff] = [
  :"AP408",
]

# 6F
@location[:floor_6c] = [
  :"AP601",
]
@location[:floor_6d] = [
  :"AP602",
  :"AP603",
]
@location[:floor_6e] = [
  :"AP604",
]

@location[:all] = @location[:floor_1] + @location[:ab] + @location[:floor_2] + @location[:floor_3] + @location[:floor_4] + @location[:lobby] + @location[:staff] + @location[:floor_6c] + @location[:floor_6d] + @location[:floor_6e]

@location[:all] = @location[:all].sort

