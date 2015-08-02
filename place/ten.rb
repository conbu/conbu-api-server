

@place = {}
@place[:entrance] = [
  :ap001,
  :ap101,
]

@place[:unice] = [
  :ap002,
  :ap003,
  :ap004,
  :ap102,
  :ap103,
  :ap104,
]

@place[:unit] = [
  :ap005,
  :ap006,
  :ap007,
  :ap008,
  :ap009,
  :ap010,
  :ap105,
  :ap106,
  :ap107,
  :ap108,
  :ap109,
  :ap110,
]

@place[:saloon] = [
  :ap011,
  :ap012,
  :ap013,
  :ap111,
  :ap112,
]

@place[:total] = [
  :ap014, :ap015, :ap016,
  :ap113, :ap114, :ap115, :ap116,
] + @place[:entrance] + @place[:unice] + @place[:unit] + @place[:saloon]
@place[:total] = @place[:total].sort
