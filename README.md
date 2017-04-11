### Steps to setup latest moodle on a docker based LAMP environment:
1. On your local machine run this git command:

`git clone https://github.com/ymnoor21/docker-moodle.git`

2. CD into docker-moodle/ directory.

3. Build the image: 

   `docker build -t moodle .`

4. Create container and note the container id after running this command:

   `docker run -d -p 8080:8080 moodle`

5. Replace the container id with: 

   `docker exec -it <container id from step 2> /bin/bash`

6. You will be taken to the container shell prompt. Now type the following command and press enter:

   `./init.sh`

7. It will install all the necessary software and setup moodle environment.

8. After the installation finishes. Browse 

   `http://localhost:8080/moodle/`

9. You'll see moodle installation page. Press Next.

10. Change "Data directory" from 

   `/var/www/moodledata` to `/var/moodledata`

11. Press Next.

12. Press Next.

13. Change settings if you need to:

	a. Database host: `localhost`
	
	b. Database name: `moodle`
	
	c. Database user: `moodle`
	
	d. Database password: `moodle`
	
	e. Database port: `3306`

14. Press Next.

15. Press Continue.

16. Press Continue.

17. The installer will run some scripts and will probably take couple of minutes to finish. So hang tight.

18. Press Continue.

19. Change Username to your name: `macgyver` (or whatever your name is)

20. Now change the password by clicking on the link `Click to enter text`. I'd set it to something simple. Ex: `Admin32!`. So please remember the username, password combination.

21. Add Email Address to your school email. Ex: `somebody@someinstitude.edu`

22. You can continue to fill out other empty boxes but they are not required fields. So I wouldn't bother.

23. So now Press `Update Profile`.

24. Type `Full site name`, `Short name for site`. Change Default Timezone to `America/Los_Angeles`. Change noreply address to your email address. Ex: `somebody@someinstitude.edu`

25. Press `Save Changes`.

26. Congratulations. You're done installing moodle. You should be in admin panel now. Explore and Enjoy.

