import tensorflow as tf

hello = tf.constant('Hello, tensorflow');

print(hello)

sess = tf.Session()

print(sess.run(hello))
