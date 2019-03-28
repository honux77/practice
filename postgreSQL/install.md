# 우분투 18.04에 postgreSQL 18.04 설치하기

## quick guide

### 설치 

```bash
sudo apt update -y
sudo apt install postgresql postgresql-contrib
```

### 실행 확인 관리자 접속

```
# 리눅스 계정 전환
sudo -i -u postgres 
# 클라이언트 접속
psql 
\q
```

### 사용자 및 디비 생성

- pgadmin 같은 GUI툴을 이용해서 생성해도 된다. 

```
createuser lucas --interactive
createdb lucas
```

### 외부 접속 허용하기

- `/etc/postgresql/10/main` 의 파일 수정 필요 

```
sudo -i
cd /etc/postgresql/10/main
vi postgresql.conf
```
listen_addresses 부분을 아래처럼 고친다. 

> listen_addresses = '*'

```
vi pg_hba.conf
```

"host    all             all             127.0.0.1/32            md5" 이 부분을 아래처럼 고친다.

> host    all             all             0.0.0.0/0            md5

## 요점

- 설치시에 기본으로 리눅스 사용자 postgres가 생긴다.
- 보통 postgres는 리눅스 사용자 = 디비 사용자 = 디비이름으로 정해진다.
- 리눅스 사용자를 굳이 생성할 필요는 없고, 디비 사용자와 디비 이름이 같을 필요는 없다. 
- 외부 접속 허용이 필요하다.

## 참고링크

- https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04
- https://bosnadev.com/2015/12/15/allow-remote-connections-postgresql-database-server/
