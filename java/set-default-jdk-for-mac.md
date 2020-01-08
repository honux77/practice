# mac에서 자바 기본 버전 설정하기

## 설치된 버전 확인

```bash
/usr/libexec/java_home -V
```

여기서 기본으로 설정하고자 하는 버전의 버전을 기억해 놓는다. 가장 끝 버전은 생략해도 된다. 

예) 1.8.0_231 또는 1.8

## JAVA_HOME 설정

`java_home -v <버전>` 명령을 이용해서 JAVA_HOME 환경변수를 설정한다. 해당 내용을 .bashrc 나 .zshrc 파일에 추가한다.

```bash
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
```

## PATH에 추가

PATH 환경변수에 JAVA_HOME/bin 을 추가한다.

```bash
export PATH=$PATH:$JAVA_HOME/bin
```

## 부록: mac에서 자바 특정 버전 삭제하기

- 아래 명령에서 버전만 삭제할 버전으로 바꾸자

```bash
sudo rm -rf /Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk
```
