### Deep Learning for Everybody day1

========

### https://hunkim.github.io/ml/

#### Lecture 3 

##### Linear Regression

* https://youtu.be/Hax03rCn3UI
* training을 통해 model 생성, 생성된 model을 통해 값을 예측 
* 가설을 linear하게 세우는 방법, 매우 효과적인 경우가 많다. 
* H(x) = wx + b 일 때 가장 적절한 w와 b를 추정
* Cost function: 실제 값과 추정치들의 distance를 측정한 값. Cost가 최소가 되도록 w와 b를 선택해야 함 

```
cost = average(H(xi) - yi)^2)
```

#### Lab

* https://github.com/FuZer/Study_TensorFlow/tree/master/01%20-%20LinearRegression 
* linear regression 예제 코드
* 예제 2번에서는 학습한 모델을 기반으로 실제 값을 예측하기 위해 placeholder 를 적용하였다. 

