@location = {}
# 1F Large exhibition hall
@location[:track_1] = [
  :"AP-101",
  :"AP-102",
  :"AP-103",
  :"AP-104",
  :"AP-105",
  :"AP-106",
]

# 2F Small exhibition hall
@location[:track_2] = [
  :"AP-009",
  :"AP-010",
  :"AP-011",
  :"AP-012",
  :"AP-013",
  :"AP-109",
  :"AP-110",
]

# 4F Convention hall Ume
@location[:track_3] = [
  :"AP-020",
  :"AP-022",
  :"AP-111",
]

# 4F Convention hall Washi
@location[:track_4] = [
  :"AP-021",
  :"AP-023",
  :"AP-112",
]

# 3F Special conference room
@location[:track_5] = [
  :"AP-016",
  :"AP-017",
  :"AP-018",
  :"AP-019",
]

# 6F Room C
@location[:track_6] = [
  :"AP-028",
  :"AP-029",
]

# 6F Room D
@location[:workshop_1] = [
  :"AP-030",
  :"AP-031",
]

# 6F Room E
@location[:workshop_2] = [
  :"AP-032",
]

@location[:all] = [
  # 1F
  ## FoodCoat
  :"AP-004",
  :"AP-006",
  :"AP-108",
  ## Sponsor
  :"AP-001",
  :"AP-005",
  :"AP-003",
  :"AP-107",
  ## Reception
  :"AP-002",
  ## Room AB
  :"AP-007",
  :"AP-008",
  # 2F
  ## Lobby1
  :"AP-014",
  :"AP-015",
  # 4F
  ## Lobby2
  :"AP-024",
  :"AP-025",
  :"AP-026",
  ## Japanese style room
  :"AP-027",
  ## Japanese style room
] + @location[:track_1] + @location[:track_2] + @location[:track_3] + @location[:track_4] + @location[:track_5] + @location[:track_6] + @location[:workshop_1] + @location[:workshop_2]

@location[:all] = @location[:all].sort
