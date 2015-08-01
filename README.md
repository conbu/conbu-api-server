# CONBU API Server


## End Points

```
/v1/:location/associations/:band
```

location is AP name or location name.

location name should be 'entrance', 'unice', 'unit', 'saloon' at Ten.

band is '2_4GHz', '5_0GHz' or 'both'.

for example

```
/v1/all/associations/both
```

```
/v1/ap102/associations/2_4GHz
```

```
/v1/entrance/5_0GHz
```

