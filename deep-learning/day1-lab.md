### Deep Learning for Everybody day1

========

### https://hunkim.github.io/ml/

#### install guide for mac

* https://www.tensorflow.org/versions/r0.11/get_started/os_setup.html#pip-installation

```bash
# install guide for macos
# python3, macox with CPU, virtualenv

# install pip and virtualenv
# Mac OS X
$ sudo easy_install pip
$ sudo easy_install --upgrade six
$ sudo pip install --upgrade virtualenv

# create virtual env directory
$ virtualenv --system-site-packages ~/tensorflow

# activate environment
# actually, my shell is zsh but it seems to work well
$ source ~/tensorflow/bin/activate  # If using bash

# install tensorflow
# Mac OS X, CPU only, Python 3.4 or 3.5:
# Python 3
(tensorflow)$ export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.11.0rc1-py3-none-any.whl
(tensorflow)$ pip3 install --upgrade $TF_BINARY_URL
```
