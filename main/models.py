from __future__ import unicode_literals
from django.db import models

# Create your models here.


class main(models.Model):
    name = models.CharField(max_length=50)
    def __str__(self):
        return self.name

class user(models.Model):
    fullname = models.CharField(max_length=50)
    username = models.CharField(max_length=20)
    email = models.TextField(max_length=20)
    gender = models.TextField(max_length=20)
    age = models.IntegerField()
    number = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    def __str__(self):
        return self.fullname

class location(models.Model):
    name = models.CharField(max_length=100)
    lattitude = models.FloatField()
    longitude = models.FloatField()
    def __str__(self):
        return self.name    

class ticket(models.Model):
    price = models.FloatField()
    slots = models.IntegerField()
    class_type = models.TextField()
    base_fare = models.FloatField()
    def __str__(self):
        return self.class_type

class booking(models.Model):
    id = models.CharField(primary_key=True,max_length=50)
    number = models.CharField(max_length=20)
    date = models.DateTimeField()
    start_point = models.CharField(max_length=50)
    destination = models.CharField(max_length=50)
    time = models.TimeField()
    class_type = models.CharField(max_length=20)
    tickets = models.IntegerField()
    cost = models.FloatField()
    def __str__(self):
        return self.number      

class routes(models.Model):
    id = models.AutoField(primary_key=True)
    start_point = models.CharField(max_length=50)
    destination = models.CharField(max_length=50)
    distance = models.FloatField()
    price = models.FloatField()
    def __str__(self):
        return self.start_point+" to "+self.destination              