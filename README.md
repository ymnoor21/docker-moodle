Run these following commands:

1. Pull moodle image: 
`docker pull ymnoor21/moodle`

2. Create container and note the container id after running this command:
`docker run -d -p 8080:8080 ymnoor21/moodle`

3. Replace the container id with: 
`docker exec -it <container id from step 2> /bin/bash`

4. You will be taken to the container shell prompt. Now type the following command and press enter:
`./init.sh`

5. It will install all the necessary software and setup moodle environment.

6. After the installation finishes. Browse `http://localhost:8080/moodle/`

7. You'll see moodle installation page. Press Next.

8. Change "Data directory" from `/var/www/moodledata` to `/var/moodledata`

9. Press Next.

10. Press Next.

11. Change settings if you need to:
	a. Database host: `localhost`
	b. Database name: `moodle`
	c. Database user: `moodle`
	d. Database password: `moodle`
	e. Database port: `3306`

12. Press Next.

13. Press Continue.

14. Press Continue.

15. The installer will run some scripts and will probably take couple of minutes to finish. So hang tight.

16. Press Continue.

17. Change Username to your name: `macgyver` (or whatever your name is)

18. Now change the password by clicking on the link `Click to enter text`. I'd set it to something simple. Ex: `Admin32!`. So please remember the username, password combination.

19. Add Email Address to your school email. Ex: `somebody@someinstitude.edu`

20. You can continue to fill out other empty boxes but they are not required fields. So I wouldn't bother.

21. So now Press `Update Profile`.

22. Type `Full site name`, `Short name for site`. Change Default Timezone to `America/Los_Angeles`. Change noreply address to your email address. Ex: `somebody@someinstitude.edu`

23. Press `Save Changes`.

24. Congratulations. You're done installing moodle. You should be in admin panel now. Explore and Enjoy.

