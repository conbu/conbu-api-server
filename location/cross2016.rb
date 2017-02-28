@location = {}
@location[:group_dai] = [
  :"35-3",
  :"36-7",
  :"36-8",
  :"36-9",
]

@location[:group_ab] = [
  :"35-4",
  :"35-6",
  :"36-10",
  :"36-11",
  :"36-12",
]

@location[:group_cd] = [
  :"36-3",
  :"36-4",
  :"36-5",
  :"36-6",
]

@location[:group_e] = [
  :"36-1",
  :"36-2",
]

@location[:group_ent] = [
  :"35-7",
]

@location[:group_other] = [
  :"35-1",
  :"35-2",
  :"35-5",
]

@location[:group_noc] = [
  :"35-8",
]

@location[:all] = @location[:group_dai] + @location[:group_ab] + @location[:group_cd] + @location[:group_e] + @location[:group_ent] + @location[:group_other] + @location[:group_noc]

@location[:all] = @location[:all].sort

