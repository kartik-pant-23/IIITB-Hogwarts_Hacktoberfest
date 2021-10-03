
##  Steps to set up

After cloning the repository follow the given steps to setup the backend locally.

1.  Install the dependencies
```
cd backend/
npm install
```
2.  Create a file called `nodemon.json`, which will contain your database url. This file will look like this -

```JSON
{
	"env": {
		"DB_URL": "YOUR-DATABASE-URL"
	}
}
```
3.  To get the database url, create a project on mongodb atlas. Create new database and inside that create a collection called groups. You can insert following 4 groups to get started with.
```
{"_id":{"$oid":"61556b0643b3c71da2e11b17"},"name":"Inventors","numOfMembers":{"$numberInt":"0"},"tagline":"It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.","group_score":{"$numberInt":"0"},"chat":[],"group_logo":"https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg"}
{"_id":{"$oid":"61556d0a43b3c71da2e11b18"},"name":"Decoders","numOfMembers":{"$numberInt":"0"},"tagline":"The truth. It is a beautiful and terrible thing, and should therefore be treated with great caution.","group_score":{"$numberInt":"0"},"chat":[],"group_logo":"https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/decoders_logo.jpg"}
{"_id":{"$oid":"61556dd643b3c71da2e11b19"},"name":"Nerdz","numOfMembers":{"$numberInt":"0"},"tagline":"It is our choices, that show what we truly are, far more than our abilities.","group_score":{"$numberInt":"0"},"chat":[],"group_logo":"https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/nerdz_logo.jpg"}
{"_id":{"$oid":"6155708143b3c71da2e11b1b"},"name":"Techlers","umOfMembers":{"$numberInt":"0"},"tagline":"Hearing voices no one else can hear isn’t a good sign, even in the wizarding world.","group_score":{"$numberInt":"0"},"chat":[],"group_logo":"https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/techlers_logo.jpg"}
```
4. Click on connect app, and you will get your database url, paste it into `nodemon.json`.
5. Now start the sever, with the command `npm run dev`
6. Going to your browser `http://localhost:3000/` you should see a message like `{ "message": "Server up and running!" }`
