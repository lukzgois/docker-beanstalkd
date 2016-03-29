# Docker Beanstalkd Image

Image for docker with [Beanstalkd][beanstalkd] and [beanstalkd-cli][beanstalkd-cli].

## Usage

### Usage with docker:

Run a container and forward the port **11300**.

```sh
$ docker run -d -p 11300:11300 lukz/beanstalkd:latest
```

### Usage with [azk][azk]:
```js
systems({
    ...
    "beanstalkd": {
        // More images:  http://images.azk.io
        image: {"docker": "lukz/php-beanstalkd"},
        workdir: "/azk/#{manifest.dir}",
        shell: "/bin/bash",
        wait: {"retry": 20, "timeout": 1000},
        scalable: {"default": 1},
        http: {
            // app.dev.azk.io
            domains: [ "#{system.name}.#{azk.default_domain}" ]
        },
        ports: {
            // exports global variables
            http: "11300/tcp",
        },
        envs: {
            // set instances variables
            PORT: "11300",
        },
    },
});
```

## License

This images is distributed under the [MIT License][license]

[license]: https://github.com/lukzgois/docker-beanstalkd/blob/master/LICENSE
[beanstalkd]: https://github.com/kr/beanstalkd
[beanstalkd-cli]: https://github.com/schickling/beanstalkd-cli
[azk]: http://www.azk.io/