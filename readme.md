<h1>
What this script does
</h1>

If you're not very technical, or even if you are and are struggling to setup digitalcriminal's scraper, this script will automatically setup the working environment to run start_ofd.py.

<em> <strong> This will not configure your profiles for scraping, nor will it configure your scraper settings. You must do that on your own. The Readme.md at DC's repo is detailed enough that you should be able to do that. I will include my own guide for good measure. </strong> </em>

This script works by using the chocolatey package manager.

This will automatically install the following programs/python packages:

Chocolatey: https://chocolatey.org <br>
git: https://gitforwindows.org <br>
Python: https://www.python.org <br>

aiohttp <br>
aiohttp_socks <br>
alembic <br>
beautifulsoup4 <br>
jsonpickle <br>
lxml <br>
mergedeep <br>
psutil <br>
python-dateutil <br>
python-socks[asyncio] <br>
requests <br>
selenium <br>
selenium-wire==2.1.2 <br>
sqlalchemy==1.4.20 <br>
tqdm <br>
ujson <br>
urllib3 <br>
user_agent <br>
win32-setctime

<h1>
Run the script
</h1>

In order to run the script put the script where you want the onlyfans folder to be, hold shift and right click DCinstall.ps1 and click `run with powershell`

Each time you're asked for Security warnings use [A]. This is script execution policy to protect you from background running powershell scripts.

<h1>
Guide
</h1>


<hr>
<h3>
Config
</h3>
<hr>

First you'll be told that the config file has been made. If you don't want to you don't have to change anything and can just press enter, but if you want these are my recommended changes:

https://github.com/DIGITALCRIMINAL/OnlyFans#exit_on_completion <br>
replace `"exit_on_completion": false,` <br>
with    `"exit_on_completion": true,` 

and

https://github.com/DIGITALCRIMINAL/OnlyFans#auto_site_choice <br>
replace `"auto_site_choice": "",` <br>
with    `"auto_site_choice": "onlyfans",`

<strong> If you want to change where content is stored, move it with this option: </strong>

https://github.com/DIGITALCRIMINAL/OnlyFans#download_directories <br>
`"download_directories": [".sites"]` <br>
Replace ".sites" <br>
`"download_directories": ["D:/new/folder"]` (Only use "/" <strong> NOT </strong> "\\")

<strong> You can also change the minimum amount of space a drive needs: </strong>

https://github.com/DIGITALCRIMINAL/OnlyFans#min_drive_space <br>
`"min_drive_space": 0,` <br>
replace "0" with the number of GB <br>
`"min_drive_space": 100,` (make whatever you want)

<strong><em>Make sure you make these changes EXACTLY as shown (case sensitive and all)
Save that file if you made changes and return to the script and press enter. </em></strong>
<hr>
<h3>
Auth.json
</h3>
<hr>

You can use either the network debugger in your browser or
https://GitHub.com/M-rcus/Onlyfans-Cookie-Helper

digitalcriminal's readme will tell you how to get this information: https://github.com/DIGITALCRIMINAL/OnlyFans#running-the-app-locally


Starting with `Open and edit:`<br>
To open the network debugger. press Ctrl + shift + I and click on the network tab and press F5.
In the filter type api, and find the init request. Click on it and on the side open `headers`, scroll to `Request headers`.

Copy `cookie` and `User agent` values to the auth.json file.

When you're finished with your auth file should look like the below JSON.<br>
<strong><em>Note the spacing, the spaces are important for the syntax. </em></strong>

```
{
    "auth": {
    "username": "default",
    "cookie": "auth_id=1439; sess=sk6kcueishgj; auth_hash=; auth_uniq_1439=uAr6ydwEdI6OAGoBfw8Lk; auth_uid_14394957=uAr6ydwEdUEgXXkHujpmLk;",
    "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0",
    "email": "",
    "password": "",
    "hashed": false,
    "support_2fa": true,
    "active": true
  }
}
```

Once all is done, hit enter and follow the script. It will scrape everything for you.

To quit running the script (after it finishes) press Ctrl + C (you will not need to do this if you make the recommended changes to the config file)

To run the script again, open your file explorer, go back to the onlyfans folder and double click on start_ofd.py
To update the script, open your file explorer to the onlyfans folder, hold shift + right click and open powershell window there, then run:` git pull`