Get-Content input.txt | python solution.py > output.txt
Compare-Object (Get-Content answer.txt) (Get-Content output.txt)