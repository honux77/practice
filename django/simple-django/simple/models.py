from django.db import models
from django.utils import timezone

# Create your models here.
class Memo(models.Model):
    name = models.CharField(max_length=30)
    text = models.TextField()
    published_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "%s, %s" % (self.name, self.text)
