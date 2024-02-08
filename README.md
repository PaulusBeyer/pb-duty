# qb-duty

Script for toggle duty on customs created jobs for QB Framework

## Open config.lua
In this file, you can enable the script in debug mode to clearly see the points in IC form, and you can select which TextUI script you want to use.
```lua
Config = {}
Config.Debug = true -- true for show grids of point IC false for disable (debug purpose)
Config.TextUI = 'okoktextui'  -- 'qb-core' or 'okoktextui'
```

To be able to set up new points, you will need to copy the code and paste it, replacing the label number and the respective values.
```lua
Config.Duty = {
    [1] = {
            name = 'customjob1', 
            coords = vector4(1801.13, -1342.85, 98.15, 0.0),
    },
    [2] = {
            name = 'customjob2', 
            coords = vector4(1801.13, -1342.85, 98.15, 0.0),
    }
}
```



