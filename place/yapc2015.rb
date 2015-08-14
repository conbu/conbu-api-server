

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

__END__
YAPC:
 6F:
  Reception:
   AP-005
  Lobby:
   AP-006
  D Track:
   AP-001
   AP-002
   AP-101
  E Track:
   AP-003
   AP-004
   AP-102
 7F:
  Reception:
   AP-007
   AP-008
  Lobby1:
   AP-011
   AP-012
  Lobby2:
   AP-015
   AP-016
  A Track:
   AP-017
   AP-018
   AP-019
   AP-020
   AP-105
   AP-106
   AP-107
   AP-108
   AP-109
   AP-110
   AP-111
   AP-112
  B Track:
   AP-009
   AP-010
   AP-103
  C Track:
   AP-014
   AP-104

