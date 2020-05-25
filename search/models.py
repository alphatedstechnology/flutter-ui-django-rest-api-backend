from django.db import models

# Create your models here.
class Genre(models.Model):
	name = models.CharField(max_length=60)

	def __str__(self):
		return self.name

class Book(models.Model):
	name = models.CharField(max_length=60)
	price = models.DecimalField(decimal_places=2, max_digits=4)
	genre = models.ForeignKey(Genre, on_delete=models.CASCADE)

	def __str__(self):
		return self.name

