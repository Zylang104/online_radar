# online radar esp
![](https://github.com/Zylang104/online_radar/blob/main/arsenalgameplaywhitradar.gif)
it's a website radar esp for roblox executor that sends http request to a local website to show externally on a website the radar (so the player position).
on the luau script there are those options:
*   teamcheck (so it only displays all the other teams that isn't yours, if the game you wanna play has a different system for teamcheck then disable this and modify the script to have another check in what team you are)
*    team color (it displays the team color of all the players, might not work whit all games)
On the website you can only zoom in and out based on your preferences.
**Fell free to make a pull request if you want to add something or simply improve my system.**

## How to run it
to run it first you need to run on your executor (it needs to have request/http_request function) this script:
```loadstring(game:HttpGet("https://raw.githubusercontent.com/Zylang104/online_radar/head/main/radar.lua",true))()```
then for running the server there are many ways but the easiest for me is to install [Visual Studio Code](https://code.visualstudio.com/download),
install [python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python), 
on powershell do those commands: ```pip install flask flask_cors```, clone the repository doing on the powershell ```git clone https://github.com/the_zylang/online_radar.git```,
open it on visual studio code and then run the server.py script. If you need any help do a pull request or contact me on discord (@the_zylang).
