# CONBU API Server


## End Points

```
/v1/associations/:location/:band
```

location is AP name or location name.

location name should be 'entrance', 'unice', 'unit', 'saloon' at Ten.

band is '2_4GHz', '5_0GHz' or 'both'.

for example

```
/v1/associations/all/both
```

```
/v1/associations/ap102/2_4GHz
```

```
/v1/associations/entrance/5_0GHz
```

