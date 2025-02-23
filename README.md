# up-runtime

Docker runtime for the UNIX programming class. ***Modified for Windows users***.

## How to use it

- Clone this repo

- Change the line endings of the `./debian/entrypoint.sh` file to `LF` (Unix line endings).

- Build the required image `upclass/runtime` using the command:
  ```
  docker build -t upclass/runtime ./debian
  ```
  You only need to do this once, unless the files placed in the `debian` folder is modified.

- Create the runtime instance using the command:
  ```
  ./start.bat
  ```
  The script will create a docker container named `up-runtime`. It will create the docker container using a default username and password of `upclass` and `password`. Alternatively, you can log into the docker container using the following command:

  ```
  ssh -p 22222 <your-username>@localhost
  ```

  ***Please note that the script must be run as a regular user.*** Ensure that your environment allows a regular user to run the `docker` command. By default, it works with Docker Desktop on macOS or a Windows terminal with WSL integration. For Linux users, you may need to add the current user to the `docker` group.

  You only need to do this once. The container will automatically start when the docker service is started.

- Stop the runtime
  ```
  docker stop up-runtime
  ```

- Destroy the runtime
  ```
  docker rm up-runtime
  ```
  You may also want to delete the `./home` directory created in the same directory of this repo.

- Destroy the image for the runtime
  ```
  docker rmi upclass/runtime
  ```

