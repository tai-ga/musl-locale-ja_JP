musl-locale-ja_JP
=================
locale ja_JP for [musl-libc](https://www.musl-libc.org/)

* Docker version 20.10.13, build a224086
* GNU Make 3.81

## help

```
> make help
build                          docker build ja_JP.UTF-8
run                            docker run
```

## run

```
> make run
docker run --rm -it alpinelocale
~ # su - root
efcf6476b24a:~# cal
     3月 2022
日 月 火 水 木 金 土
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

efcf6476b24a:~#
```

## build

```
> make build
docker build -t alpinelocale .
[+] Building 0.1s (11/11) FINISHED
 => [internal] load build definition from Dockerfile 0.0s
	:
	:
	:
```
