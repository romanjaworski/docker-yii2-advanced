# docker-yii2-advanced
Docker Yii2 advanced project with working tests

What is it?
-----------

This is a really quick solution for running Yii2 advanced template with working tests.

Instalation
-----------

1. Install for your system [docker](https://www.docker.com/) and [docker compose](https://www.docker.com/) software.
2. Clone this repository
    ```
    $ git clone https://github.com/romanjaworski/docker-yii2-advanced.git
    ```
    > Note: Windows users should clone this repository under user directory C:/Users/user 
    
    Before next step please change [github api token](https://github.com/blog/1509-personal-api-tokens) in .env file
3. Go into cloned directory and run project

    ```
    $ cd docker-yii2-advanced
    $ ./run.sh
    ```
4. Add line in your host file
    
    ```
    192.168.99.100  frontend.dev backend.dev
    ```