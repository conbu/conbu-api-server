# vim: set et sts=2 sw=2 ts=2 fdm=marker ft=ruby :
# author: TAKANO Mitsuhiro a.k.a. @takano32
#

@location = {}
@location[:track_a] = [
  :ap017,
  :ap018,
  :ap019,
  :ap020,
  :ap105,
  :ap106,
  :ap107,
  :ap108,
  :ap109,
  :ap110,
  :ap111,
  :ap112,
]

@location[:track_b] = [
  :ap009,
  :ap010,
  :ap103,
]

@location[:track_c] = [
  :ap014,
  :ap104,
]

@location[:track_d] = [
  :ap001,
  :ap002,
  :ap101,
]

@location[:track_e] = [
  :ap003,
  :ap004,
  :ap102,
]

@location[:all] = [
  # 6F
  # # Reception
  :ap005,
  # # Lobby
  :ap006,
  # 7F
  # # Reception
  :ap007,
  :ap008,
  # # Lobby1
  :ap011,
  :ap012,
  # # Lobby2
  :ap015,
  :ap016,
] + @location[:track_a] + @location[:track_b] + @location[:track_c] + @location[:track_d] + @location[:track_e]

@location[:all] = @location[:all].sort
