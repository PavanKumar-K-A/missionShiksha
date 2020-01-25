### Steps to configure Github PersonalToken

- Navigate to www.github.com and login to your account.
- Navigate to Settings -> DeveloperSettings->Personal Access Tokens ->Generate New Token.
- Select the first option i.e **repo**
- Click on **Generate**. Ensure that the token which is generate is copied and saved securly. The generated token cannot be retrieved back but instead a new one has to be generated if lost.

**DO NOT SHARE THE TOKEN WITH ANYONE**
- Use the following command to set the env_variable 
	`$ export GIT_TOKEN= <your_personal_token>`


### Steps on setting up Local Development machine.


- Make sure that Docker is setup and the docker process is running on the machine.
- Use the following command to build the docker image locally 
	`$  docker build --build-arg GIT_TOKEN=${GIT_TOKEN} -t  msn_shiksha/latest .`
>Note : msn_shiksha/latest is the name of the image which is built locally. Ideally this can be anything on your local setup.
- The previous step takes a considerable amount of time when building for the first time. Note that docker image is to be built only when the Dockerfile changes.
- In order to launch the docker container navigate to the source code root directory and run the following command
	`$ docker run -it --volume $PWD:/home/project msn_shiksha/latest`
	>NOTE: Run this command only from the source code root directory only as it maps the current directory to the docker container.
- This launches you onto the terminal of the container. The source code directory of the volume is mapped on to /home/project. Navigate to the /home/project directory and run the springboot app using
 	`$ mvn spring-boot:run`
