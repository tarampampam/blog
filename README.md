# Static Blog

[![Test][badge_test]][link_actions]
[![Publish][badge_publish]][link_actions]
![Last commit][badge_last_commit]
[![Comments][badge_comments]][link_issues]

Static blog, generated using [hugo][hugo].

## System requirements

- `docker >= 18.0` _(install: `curl -fsSL get.docker.com | sudo sh`)_
- `make >= 4.1` _(install: `apt-get install make`)_

## Usage

### Create a new post

For a making new blog post, execute in your terminal:

```shell script
$ make new-post
```

### Start local server

For a starting web-server with auto-reload feature, run:

```shell script
$ make start
```

And open in your favorite browser [127.0.0.1:1313](http://127.0.0.1:1313/).

> If you use Google Chrome web browser, you may want to install [livereload extension][livereload].

## Deploy

Any changes, pushed into `master` branch will be automatically deployed _(be careful with this shit, think **twice** before pushing)_.

PRs is strongly recommended for any changes.

[badge_comments]:https://img.shields.io/github/issues-raw/tarampampam/blog.svg?label=comments&maxAge=60
[badge_test]:https://img.shields.io/github/workflow/status/tarampampam/blog/test?label=test&maxAge=60
[badge_publish]:https://img.shields.io/github/workflow/status/tarampampam/blog/publish?label=publish&maxAge=60
[badge_last_commit]:https://img.shields.io/github/last-commit/tarampampam/blog/master?label=last%20update&maxAge=60
[link_issues]:https://github.com/tarampampam/blog/issues
[link_actions]:https://github.com/tarampampam/blog/actions
[hugo]:https://gohugo.io/
[livereload]:https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
