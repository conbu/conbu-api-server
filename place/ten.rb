

@place = {}
@place[:entrance] = [
  :ap101,
]

@place[:unice] = [
  :ap102,
  :ap103,
  :ap104,
]

@place[:unit] = [
  :ap001,
  :ap105,
  :ap106,
  :ap107,
  :ap108,
  :ap109,
]

@place[:saloon] = [
  :ap110,
  :ap111,
  :ap112,
]

@place[:all] = @place[:entrance] + @place[:unice] + @place[:unit] + @place[:saloon]
@place[:all] = @place[:all].sort

