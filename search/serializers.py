from rest_framework import serializers

from .models import Genre, Book

class GenreSerializer(serializers.ModelSerializer):
	class Meta:
		model = Genre
		fields = "__all__"

class BookSerializer(serializers.ModelSerializer):
	class Meta:
		model = Book
		fields = "__all__"