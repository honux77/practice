# Practice powershell command and script

## 참고링크

- https://blog.netwrix.com/2018/02/21/windows-powershell-scripting-tutorial-for-beginners/

### 코딩 테스트용 간단 스크립트

-입력: input.txt
-출력: output.txt
- Test-Code.ps1

```
Get-Content input.txt | python solution.py > output.txt
Compare-Object (Get-Content answer.txt) (Get-Content output.txt)
```
