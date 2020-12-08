# cerebrate-docker

Cerebrate docker image.

### How to install
1. Clone this repository
2. Run `sudo ./init.sh`
3. Run `sudo ./start.sh`
4. Visit `localhost:8080`
    - Credentials `admin` and `Password1234`
5. Have fun :)

### How to update code & rebuild everything?
1. Work in ./app/cerebrate & update your code
2. Run `sudo ./build-image.sh`
3. Run `sudo ./stop.sh`
4. Run `sudo ./start.sh`
5. Same as 4. above.

### How to stop this infrastructure?
1. Run `sudo ./stop.sh`

### How to remove?
1. Run `sudo ./remove.sh`
