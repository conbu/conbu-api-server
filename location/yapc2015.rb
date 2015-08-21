# vim: set et sts=2 sw=2 ts=2 fdm=marker ft=ruby :
# author: TAKANO Mitsuhiro a.k.a. @takano32
#

@location = {}
@location[:track_a] = [
  :"AP-017",
  :"AP-018",
  :"AP-019",
  :"AP-020",
  :"AP-105",
  :"AP-106",
  :"AP-107",
  :"AP-108",
  :"AP-109",
  :"AP-110",
  :"AP-111",
  :"AP-112",
]

@location[:track_b] = [
  :"AP-009",
  :"AP-010",
  :"AP-103",
]

@location[:track_c] = [
  :"AP-014",
  :"AP-104",
  :"AP-134",
]

@location[:track_d] = [
  :"AP-001",
  :"AP-002",
  :"AP-101",
  :"AP-023",
]

@location[:track_e] = [
  :"AP-003",
  :"AP-004",
  :"AP-102",
  :"AP-022",
]

@location[:all] = [
  # 6F
  # # Reception
  :"AP-005",
  # # Lobby
  :"AP-006",
  # 7F
  # # Reception
  :"AP-007",
  :"AP-008",
  # # Lobby1
  :"AP-011",
  :"AP-012",
  # # Lobby2
  :"AP-015",
  :"AP-016",
] + @location[:track_a] + @location[:track_b] + @location[:track_c] + @location[:track_d] + @location[:track_e]

@location[:all] = @location[:all].sort
