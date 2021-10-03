## Steps to set up
This part talk about setting up the app. If you work with APIs then you will also need to setup the backend. You will need to add `important_strings.dart` inside `lib/` folder. It will consist of-
```DART
const String BASE_URL = "YOUR-IP-ADDRESS:3000";
const String HOME = "home";

const String REGISTER = "users/register";
const String LOGIN = "users/login";
```
Before working with the backend you will have to set it up following the instructions given in the `README.md` file for backend. After starting the server, base url for server will be `YOUR-IP-ADDRESS:3000`. For example, if your IP Address is `192.168.18.8`, then your `BASE_URL` will be `192.168.18.8:3000`.

## Backend Responses
If you are facing difficulty in setting up the backend, then some of the backend responses are given below.
* **Register ( POST - users/register/ )**
	* Request Body -
	```JSON
	{	
		name: "Test User",
		email: "test@user.com",
		password: "secret"	
	}
	```
	* Response Body - 
	```JSON
	{
		"message": "User created!",
		"createdUser": {
			"name": "Test User",
			"email": "test@user.com",
			"password": "$2a$04$pk5laAB.TXFFQqfFHRzQg.tyPP9MwAeGLjXJQITtsnHxtnEco/gE.",
			"group": {
				"_id": "61556b0643b3c71da2e11b17",
				"name": "Inventors",
				"numOfMembers": 0,
				"tagline": "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.",
				"group_score": 0,
				"chat": [],
				"group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg"
			},
			"score": 0,
			"about": "",
			"id_facebook": "",
			"id_instagram": "",
			"id_linkedin": "",
			"id_github": "",
			"id_twitter": "",
			"id_youtube": "",
			"id_personal": "",
			"_id": "615960791e2ef7e4c9e653d6",
			"createdAt": "2021-10-03T07:49:13.621Z",
			"updatedAt": "2021-10-03T07:49:13.621Z",
			"__v": 0
		},
	"token": "eyJhbGciOiJIUzI1NiJ9.NjE1OTYwNzkxZTJlZjdlNGM5ZTY1M2Q2.tGiZ2xQTIQnNcfrZXfCJsapZbAOdTPSUjPdg_Nq6PK8"
	}
	```
* **Login ( POST - users/login/ )**
	* Request Body - 
	```JSON
	{
		"email": "test@user.com",
		"password": "secret"
	}
	```
	* Response -
	```JSON
	{
		"message": "Login successful!",
		"token": "eyJhbGciOiJIUzI1NiJ9.NjE1NmI0ZmNiZWUzMGQxZmZiM2E4MDg4.6OHz8RFmZPGuR2_xO1LHubtmAHCqaPQOJf7TJ3lBksU"
	}
	```
* **Home Page Data ( GET - home/ )**
```JSON
{
    "message": "Data loaded!",
    "groups": [
        {
            "_id": "61556b0643b3c71da2e11b17",
            "name": "Inventors",
            "numOfMembers": 0,
            "tagline": "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.",
            "group_score": 0,
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg"
        },
        {
            "_id": "61556d0a43b3c71da2e11b18",
            "name": "Decoders",
            "numOfMembers": 0,
            "tagline": "The truth. It is a beautiful and terrible thing, and should therefore be treated with great caution.",
            "group_score": 0,
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/decoders_logo.jpg"
        },
        {
            "_id": "61556dd643b3c71da2e11b19",
            "name": "Nerdz",
            "numOfMembers": 0,
            "tagline": "It is our choices, that show what we truly are, far more than our abilities.",
            "group_score": 0,
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/nerdz_logo.jpg"
        },
        {
            "numOfMembers": 0,
            "_id": "6155708143b3c71da2e11b1b",
            "name": "Techlers",
            "umOfMembers": 0,
            "tagline": "Hearing voices no one else can hear isn’t a good sign, even in the wizarding world.",
            "group_score": 0,
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/techlers_logo.jpg"
        }
    ],
    "projects": [
        {
            "_id": "6156c790f72d3fb2bb7420b0",
            "project_url": "https://github.com/space-voyager-21/space-voyager",
            "project_title": "Space Voyager",
            "banner_url": "https://user-images.githubusercontent.com/79041510/134652654-3e9c740c-3b67-4a52-8809-0760c9c55364.png",
            "author_year": "2nd Year",
            "author_uid": {
                "_id": "6156c6f930999ea64222e308",
                "name": "Mohit Khairnar"
            },
            "__v": 0
        },
        {
            "_id": "6156c8a1dd04fbbd21fa2622",
            "project_url": "https://github.com/akk312000/Movie-Recommender",
            "project_title": "Movie Recommender",
            "banner_url": "https://analyticsindiamag.com/wp-content/uploads/2020/08/stars-movies-1200x670-1.jpg",
            "author_year": "3rd Year",
            "author_uid": {
                "_id": "6156c82ddd04fbbd21fa261f",
                "name": "Ashish Kashyap"
            },
            "__v": 0
        },
        {
            "_id": "6156c8fbdd04fbbd21fa2624",
            "project_url": "https://github.com/kartik-pant-23/IIITB-Hogwarts",
            "project_title": "IIITB-Hogwarts",
            "banner_url": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg",
            "author_year": "3rd Year",
            "author_uid": {
                "_id": "6156b4fcbee30d1ffb3a8088",
                "name": "Kartik Pant"
            },
            "__v": 0
        }
    ]
}
```
* **Groups Data ( GET - groups/ )**
```JSON
{
    "message": "Succesful!",
    "data": [
        {
            "_id": "61556b0643b3c71da2e11b17",
            "name": "Inventors",
            "numOfMembers": 0,
            "tagline": "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.",
            "group_score": 0,
            "chat": [],
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg"
        },
        {
            "_id": "61556d0a43b3c71da2e11b18",
            "name": "Decoders",
            "numOfMembers": 0,
            "tagline": "The truth. It is a beautiful and terrible thing, and should therefore be treated with great caution.",
            "group_score": 0,
            "chat": [],
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/decoders_logo.jpg"
        },
        {
            "_id": "61556dd643b3c71da2e11b19",
            "name": "Nerdz",
            "numOfMembers": 0,
            "tagline": "It is our choices, that show what we truly are, far more than our abilities.",
            "group_score": 0,
            "chat": [],
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/nerdz_logo.jpg"
        },
        {
            "numOfMembers": 0,
            "_id": "6155708143b3c71da2e11b1b",
            "name": "Techlers",
            "umOfMembers": 0,
            "tagline": "Hearing voices no one else can hear isn’t a good sign, even in the wizarding world.",
            "group_score": 0,
            "chat": [],
            "group_logo": "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/techlers_logo.jpg"
        }
    ]
}
```

