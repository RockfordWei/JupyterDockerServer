# Jupyter Notebook Docker Server for TensorFlow

This is a stand alone Jupyter notebook server docker configuration, with an integration with TensorFlow CPU version.

## Quick Start

Before `git clone` or download this project, please make sure that docker service is running on local computer.

### Build Docker Image

``` bash
$ docker-compose build
```

The command will build a docker image based on Ubuntu 16.04 with Python 3.5+ and TensorFlow/Jupyter, etc.

**NOTE** During the installation, there could be a possible warning like the following, but I would suggest to ignore it since the upgrade on pip itself has some knonw issues on jupyter.

``` bash
You are using pip version 8.1.1, however version 10.0.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```


### Run Server

``` bash
$ docker-compose up
```

If success, some random link should print out in the terminal like this:

``` bash
http://4e2a38a20392:8888/?token=6aff5dc5 ....
```

Then you can copy this url and replace the prefix with `http://localhost:8888/?token=...` to open it in your browser

**TIPS** You can change the default port `8888` by replacing it all in the `docker-compose.yml` file.


### Stop

To turn it off, just go to the same project folder:

``` bash
$ docker-compose down
```

### Extra Python 3 Libraries

If "module not found", just go `Dockerfile` to add more `RUN pip3 install --upgrade <the missing module name>` as need.

### Content

All your work in this stand alone server will be saved into the `content` folder, by default. Check docker-composer.yml for detail.

## Support

Please feel free to contact me by linkedin [https://www.linkedin.com/in/rockfordwei/](https://www.linkedin.com/in/rockfordwei/)