# Bower
## A package manager for web
### http://bower.io/
프론트엔드를 위한 패키지 관리자입니다. 사용하면 안 사용할 때보다 좋습니다. 

### Getting started

#### Prerequistes
node, npm, git이 설치되어 있어야 합니다.

#### Install Bower 

```bash
$ npm install -g bower
```

#### Install packages

```bash
# installs the project dependencies listed in bower.json
$ bower install
# registered package
$ bower install jquery
# GitHub shorthand
$ bower install desandro/masonry
# Git endpoint
$ bower install git://github.com/user/package.git
# URL
$ bower install http://example.com/script.js
```
Bower로 설치한 패키지는 현재 위치 기준으로 `bower_components/` 하위 디렉토리에 저장됩니다. 

#### Use packages
아래처럼 상대경로로 지정해 주면 끝. 
```html
<script src="bower_components/jquery/dist/jquery.min.js"></script>
```
#### Search packages
http://bower.io/search/

#### Save packages
```bash
# generate bower.json
$ bower init
# add package to bower.json automatically
$ bower isntall <package> --save
```