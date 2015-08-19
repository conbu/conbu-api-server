# vim: set et sts=2 sw=2 ts=2 fdm=marker ft=ruby :
# author: TAKANO Mitsuhiro a.k.a. @takano32
#

@place = {}
@place[:track_a] = [
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

@place[:track_b] = [
  :ap009,
  :ap010,
  :ap103,
]

@place[:track_c] = [
  :ap014,
  :ap104,
]

@place[:track_d] = [
  :ap001,
  :ap002,
  :ap101,
]

@place[:track_e] = [
  :ap003,
  :ap004,
  :ap102,
]

@place[:all] = [
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
] + @place[:track_a] + @place[:track_b] + @place[:track_c] + @place[:track_d] + @place[:track_e]

@place[:all] = @place[:all].sort
