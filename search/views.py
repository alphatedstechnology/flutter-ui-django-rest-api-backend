from django.shortcuts import render
from .models import Book
from rest_framework import generics, filters
from .serializers import BookSerializer
# Create your views here.

class BookSearchAPI(generics.ListCreateAPIView):
	filter_backends = (filters.SearchFilter,)
	search_fields = ['name',]
	queryset = Book.objects.all()
	serializer_class = BookSerializer
