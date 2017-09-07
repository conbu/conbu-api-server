@location = {}
@location[:group_dai] = [
  :"AP35-3",
  :"AP36-4",
  :"AP36-5",
  :"AP36-6",
]

@location[:group_ab] = [
  :"AP35-4",
  :"AP35-6",
  :"AP35-9",
  :"AP35-10",
  :"AP36-7",
]

@location[:group_cd] = [
  :"AP35-8",
  :"AP35-12",
  :"AP36-2",
  :"AP36-3",
]

@location[:group_e] = [
  :"AP36-1",
  :"AP35-11",
]

@location[:group_ent] = [
  :"AP35-7",
]

@location[:group_other] = [
  :"AP35-1",
  :"AP35-2",
  :"AP35-5",
]

@location[:group_noc] = [
  :"AP35-8",
]

@location[:all] = @location[:group_dai] + @location[:group_ab] + @location[:group_cd] + @location[:group_e] + @location[:group_ent] + @location[:group_other] + @location[:group_noc]

@location[:all] = @location[:all].sort

