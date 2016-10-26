import tensorflow as tf

sess = tf.Session()

# a, b, and c is operation, not constant
a = tf.constant(2)
b = tf.constant(3)

c = a + b

print(c)

print(sess.run(c))
