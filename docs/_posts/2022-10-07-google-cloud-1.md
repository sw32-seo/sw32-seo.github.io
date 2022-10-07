---
layout: post
title:  "Google Cloud 정착기-1"
---
- [서론](#서론)
- [GPU 사용료](#gpu-사용료)
  - [AWS](#aws)
  - [Google Cloud](#google-cloud)
  - [비교](#비교)
- [Deep Learning 서비스](#deep-learning-서비스)
- [Training Materials.](#training-materials)
- [JAX와의 호환](#jax와의-호환)
- [결론](#결론)


# 서론
최근 저는 회사에서 Deep learning 모델을 이용한 MVP를 만들면서 동시에 어떤 클라우드를 사용해서 이 MVP를 학습 시킬지 고민이 많았습니다. 아마 다른 인공지능 관련 스타트업 종사자 분들도 Amazaon Web Service(AWS)와 Google Cloud 중에서 고민하실 것 같습니다. 그래서 제 경험을 공유하고자 합니다.

물론 Azure와 Naver에서도 클라우드에서 가속기를 제공합니다. 하지만 Azure는 한국에 A100 GPU가 없었고, Naver는 아직 태동기라고 생각해서 저는 AWS와 Google Cloud를 비교해보았습니다.

제가 가장 중요하게 생각한 것은 네가지 입니다.
1. GPU 사용료
2. Deep Learnin에 맞는 서비스가 얼마나 있는가?
3. 관련된 교육은 잘 되어 있는가?
4. JAX와 호환성

# GPU 사용료
좋은 가격에 좋은 GPU를 쓰면 좋겠죠. 제일 첫번째로 알아본 조건입니다.

## AWS
AWS에서 제공하는 가장 좋은 딥러닝용 GPU는 V100이고 4개를 on-demend로 사용할때 12.24USD입니다. [link](https://aws.amazon.com/ko/ec2/instance-types/p3/)

## Google Cloud
Google Cloud는 A100이 가장 좋은 GPU이고 4개를 on-demend로 사용한다고 하면 16.43USD입니다. V100의 경우 대략 동일한 조건이면 13.22 USD네요. [link](https://cloud.google.com/products/calculator/#id=75c81209-52af-4421-aac0-c753dd258bb4) (계산기로 나온 값에서 할인을 되돌리고 GPU 4개 가격으로 환산했습니다.)

## 비교
어라 AWS에는 A100이 없네요? 그리고 대부분 리뷰에서도 Google Cloud가 AWS에 비해서 비싸다는 말을 많이 하시더라구요. V100만 써도 된다면 AWS가 당연히 좋은 선택으로 보입니다. 이외에 다른 클라우드 서비스와 연동이 필요한 경우라면 비용면에서 AWS가 좋은 선택일 것 같습니다. 국내 많은 스타트업들이 AWS를 사용하는데는 이유가 있겠죠. 엑셀러레이터와 연계해서 크레딧을 주기도 한다고 합니다.

# Deep Learning 서비스
두 회사 모두 다양한 인공지능 관련 솔루션을 제공합니다. 두 회사 모두 이 분야에서 중점적으로 밀고 있는 것은 Machine Learning모델을 전공자가 아니더라도 빠르게 구축할 수 있도록 돕는 것입니다. 그런데 저는 이미지, 음성, 비디오, 텍스트 그 어떤 데이터도 아니다 보니 이 부분에서는 이점이 보이지 않았습니다. 다만 재현성 및 평가를 정확하게 하는 것이 중요했기 때문에 주로 MLOps, 특히 experiment traking을 염두에 두었습니다. AWS는 **SageMaker**, Google Cloud는 **Vertex AI**로 명명하고 있는 이 솔루션들은 사용해보지 않고서는 우열을 가리기가 어려웠습니다.

# Training Materials.
자사 클라우드로 끌어들이는 가장 좋은 방법중 하나는 사용하는 방법을 알려주어서 일단 사용하게 만드는 것이지요. 두 회사 모두 이 점을 잘 알고 있어서인지, 교육 자료에 있어서도 매우 방대한 양을 자랑했습니다. 하나씩 따라할 수 있는 튜토리얼들도 많았구요. 오히려 이건 어떤 클라우드를 사용할지 결정한 후에 보아도 되겠다 싶었습니다.
여담이지만 Coursera에서 Andrew Ng 교수님의 DeepLearning.AI가 제공하는 강좌들은 대부분 AWS와 연계되어 있는 것 같네요.

# JAX와의 호환
위에 까지 보았을 때는 AWS의 승리...로 보였는데, 제가 Google Cloud를 선택하게 된 것은 어떻게 보면 JAX가 컸던 것 같습니다. 처음에는 TensorFlow로 시작해서 Pytorch로 넘어왔다가 이제는 JAX를 활용한 연구를 하려고 하다보니 JAX에 대한 호환성이 중요했습니다.
물론 JAX도 NVIDIA 계열의 GPU만 되면 별 문제 없이 쓸 수 있기는 합니다만, Google의 Vertex AI에서는 실험적이지만 JAX용 image를 제공하기도 하고 JAX를 Serving하는데도 살짝 진심인 느낌?이 있었습니다([link](https://cloud.google.com/tpu/docs/run-calculation-jax)).

그렇다고 AWS도 JAX에 관심이 없지는 않습니다. AWS기술 블로그에 JAX를 AWS에서 사용하는 방법이 소개되어 있네요([link](https://aws.amazon.com/ko/blogs/machine-learning/training-and-deploying-deep-learning-models-using-jax-with-amazon-sagemaker/)).

# 결론
그래서 결론적으로는 Google Cloud을 먼저 써보기로 하였습니다. 글을 쓰다보니 내가 왜 AWS를 안쓰고 Google Cloud를 썼나 싶기는 하네요;; 

다음 글에서는 Google Cloud에서 Compute Engine과 Vertex AI를 세팅하면서 생긴 삽질을 공유해볼까 합니다.