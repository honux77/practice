# nodejs child process module

## intro 및 예제코드

`child_process` 모듈은 자식 프로세스를 생성하는 방법을 제공한다.
popen(3)이랑 비슷하지만 완전 똑같지는 않다고 한다.
보통 `child_process.spawn()` 함수를 이용해서 원하는 바이너리 프로그램을 실행할 수 있다.

예제 코드를 보면 바로 이해가 될 것이다.

```js
const { spawn } = require('child_process');
const ls = spawn('ls', ['-lh', './']);

ls.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

ls.stderr.on('data', (data) => {
  console.log(`stderr: ${data}`);
});

ls.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});
```
예제 코드에서 spawn()을 사용해서 ls 명령을 실행한다. 배열에는 command line arguments 들이 들어간다.

결과는 bash에서 `ls -lh ./`를 실행한 결과와 거의 동일하다.

## 기타 특징

- spawn()은 비동기로 동작하므로 event loop를 블로킹하지 않다. 동기화 메소드f를 사용하고 싶다면 spawnSync()를 사용하자.

## 추가 메소드

- 편의를 위해 다양한 메소드를 제공한다. 설명은 생략한다.

## 참고링크

- https://nodejs.org/dist/latest-v10.x/docs/api/child_process.html

