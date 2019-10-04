
#Project Structure and Docker configuration

##Project Structure:
![Microservice architecture](/docs/structure.png)


##[Install docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- This links to the Ubuntu Linux distro, choose yours
- Test the installation by getting the version (should be Docker version 19.03.2 or latest):
```bash
    sudo docker -v
```
- Make sure everything is fine by downloading the hello-world image from docker hub and running it:
```bash
    sudo docker run hello-world
```
- **OPTIONAL**: If you don't want to type 'sudo' everytime you write a command (trust me you don't) do [this](https://docs.docker.com/install/linux/linux-postinstall/). Again, this is for Linux, pick your own OS.

##[Install docker-compose](https://docs.docker.com/compose/install/)
- tl;dr: If you're on linux:
    ```bash
    docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```
    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```
- tl;dr: If you're on macOS, I think compose comes natively with docker so check it on the next step
- Test the installation (should be 1.24.1 or latest):
    ```bash
    docker-compose --version
    ```

##Run the code on docker
- Things should already be configured so here are the main steps and commands you should know: 
- To run the code, you must be on the root project folder, in the same level as the docker-compose.yaml file. Run:
    ```bash
    docker-compose up
    ```
- This builds our custom image and runs it on port 1000. localhost:1000 gets you there.
- To check all you images:
    ```bash
    docker images
    ```
- To check all you running containers:
    ```bash
    docker ps
    ```
- To check all running and dead containers:
    ```bash
    docker container ls -a
    ```
- To remove all your dead containers:
    ```bash
    docker container prune
    ```
- To remove all your unused images:
    ```bash
    docker image prune
    ```
- To remove absolutely everything and start fresh:
    ```bash
    docker system prune
    ```
[That's it :D](https://www.youtube.com/watch?v=Q3bbsDJWlXQ)