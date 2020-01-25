### Steps on setting up Local Development machine.


- Make sure that Docker is setup and the docker process is running on the machine.
- Use the following command to build the docker image locally 
	`$  docker build -t  msn_shiksha/latest .`
>Note : msn_shiksha/latest is the name of the image which is built locally. Ideally this can be anything on your local setup.
- The previous step takes a considerable amount of time when building for the first time. Note that docker image is to be built only when the Dockerfile changes.
- In order to launch the docker container navigate to the source code root directory and run the following command
	`$ docker run -it --volume $PWD:/home/project msn_shiksha/latest`
	>NOTE: Run this command only from the source code root directory only as it maps the current directory to the docker container.
- This launches you onto the terminal of the container. The source code directory of the volume is mapped on to /home/project. Navigate to the /home/project directory and run the springboot app using
 	`$ mvn spring-boot:run`
