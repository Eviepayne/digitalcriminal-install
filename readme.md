In order to run the script please open powershell as admin, then copy and paste the following:

> set-executionpolicy unrestricted

Once this is done without errors, you can right click the install.ps1 file and select 'run with powershell'
Follow the scripts instructions as they come along.
You'll be told eventually that the main script will be run. Once that happens, follow the below guide:

First you'll be told that the config file has been made. If you don't want to you don't have to change anything, but if you want these are my recommended changes:

replace|` "exit_on_completion": false,`
with   |` "exit_on_completion": true,`

and

replace|` "auto_site_choice": "",`
with   |` "auto_site_choice": "onlyfans",`

! Make sure you make these changes EXACTLY as shown (case sensitive and all)
Save that file if you made changes and return to the script and press enter.

You'll then be told that your auth.json file has been made. You will need to enter your information here.
This is the easier option but the network debugger is definitely the best way to get your info: https://GitHub.com/M-rcus/Onlyfans-Cookie-Helper
The readme will tell you how to get this information. To open the network debugger. press Ctrl + shift + I and click on the network tab and refresh the onlyfans page.
once you find the init file in network debugger follow the rest of the readme.

When you're finished with your auth file should look like the below JSON. Note the spacing, the spaces are important for the syntax. 

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
To update the script, open your file explorer to the onlyfans folder, hold shift + right click and open powershell window there, then run: git pull