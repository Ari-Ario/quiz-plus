# MySQL exercise with PDO

## Start


### Docker

1. start the Container:

```bash
docker compose up
```

2. stop the Container:

```bash
docker compose down
```

3. open phpMyAdmin, URL:

```bash
http://localhost:8080/
```

4. open index.php , URL:

```bash
http://localhost:8000/
```

**Stop all Docker Containers plus extra commands**

```bash
docker stop $(docker ps -a -q)
```

```bash
docker rm $(docker ps -a -q)
```

```bash
docker-compose down --rmi all -v
```
