# Static Blog

![Comments](https://img.shields.io/github/issues-raw/tarampampam/blog-discussions.svg?label=comments)

Static blog, generated using [hugo][hugo].

## System requirements

- `docker >= 18.0` _(install: `curl -fsSL get.docker.com | sudo sh`)_
- `make >= 4.1` _(install: `apt-get install make`)_

## Usage

### Create new post

For a making new blog post, execute in your terminal:

```bash
$ make new-post
```

### Start local server

For a starting web-server with auto-reload feature, run:

```bash
$ make start
```

And open in your favorite browser [127.0.0.1:1313](http://127.0.0.1:1313/).

> If you use Google Chrome web browser, you may want to install [livereload extension][livereload].

[hugo]:https://gohugo.io/
[livereload]:https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
