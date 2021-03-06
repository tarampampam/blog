---
title: "Скрипт создания зеркала обновлений для Eset Nod32 на Linux"
aliases:
  - /dev/make-nod32-mirror.html
date: 2014-04-12T18:02:00Z
featured_image: /images/posts/nod32upd-wide.jpg
tags:
- antivirus
- bash
- cron
- eset
- habr
- linux
- nod32
- updates mirror
---

> Данная статья является копией [публикации на хабре](https://habr.com/post/232163/).
>
> У этого поста есть продолжение. Пожалуйста, перейдите [по этой ссылке]({{< ref "make-nod32-mirror-updated.md" >}}).

Если вы занимаетесь администрированием, велика вероятность что рано или поздно встанет вопрос — «На клиентских машинах стоит антивирус Nod32, надо бы создать для них единое зеркало обновлений». И тут возможны несколько путей развития сюжета:

<!--more-->

1. «Сервер на Windows, денег достаточно». Тут всё довольно просто — покупаем лицензию, ставим нужный дистрибутив NOD32 на сервер, настраиваем, радуемся. Вариант более мифический, так как крайне редко, когда на IT «денег достаточно».
1. «Сервер на Windows, денег **не** достаточно». Тут возможны варианты. Начиная от использования варезных лицензий, до ручного скриптинга и использования Linux-решений ([cygwin](https://www.cygwin.com/) в помощь).
1. «Сервер на Linux». Деньги в этом случае особого значения просто не имеют. У нас есть руки, есть голова, и есть желание сделать всё довольно качественно и надежно.

Вот третий вариант мы сейчас и рассмотрим.

### Установка

Скачиваем крайнюю версию и распаковываем:

```bash
$ cd /tmp
$ wget https://github.com/tarampampam/nod32-update-mirror/archive/master.zip
$ unzip master.zip; cd ./nod32-update-mirror-master/
```

Переносим набор скриптов в директорию недоступную “извне”, но доступную для пользователя, который будет его запускать:

```bash
$ mv -f ./nod32upd/ /home/
```

Переходим в новое расположение скриптов и выполняем их настройку:

```bash
$ cd /home/nod32upd/
$ nano ./settings.cfg
```

Даем права на запуск скриптов:

```bash
$ chmod +x ./*.sh
```

Проверяем наличие unrar, если планируем обновляться с официальных зеркал Eset NOD32:

```bash
$ type -P unrar
```

Выполняем пробный запуск:

```bash
$ ./update.sh
```

### Настройка

Актуальные параметры настройки смотрите в `README.md` файле репозитрия. Обновлять данные в нескольких местах \- делл не благодарное, поэтому \- просто внимательнее читай readme файл.

### Особенности

- Если произошла ошибка при обновлении с сервера, который указан, например, в `updServer0` \- производится попытка обновиться с сервера, указанного в `updServer1`, `updServer2`..`updServer10`;
- Скачивает только обновленные файлы обновлений (проверка выполняется с помощью `wget --timestamping`);
- Умеет поддерживать в актуальном состоянии только лишь файл update.ver, не скачивая сами файлы обновлений (при этом зеркало работает, но загрузка происходит не с вашего сервера, а с сервера-источника обновлений);
- В комплекте идет заготовка для веб-интерфейса зеркала обновления (директория `./webface`).

### Ссылки

- **[Скачать](https://github.com/tarampampam/nod32-update-mirror/archive/master.zip)**
- **[GitHub](https://github.com/tarampampam/nod32-update-mirror)**
