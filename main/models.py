from __future__ import unicode_literals
from django.db import models


class main(models.Model):
    name = models.CharField(max_length=50)
    def __str__(self):
        return self.name

class user(models.Model):
    fullname = models.CharField(max_length=50)
    username = models.CharField(max_length=20)
    email = models.TextField(max_length=50)
    gender = models.TextField(max_length=20)
    age = models.IntegerField()
    number = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    image = models.FileField(upload_to='profile_images', default='logo.jpg')
    def __str__(self):
        return self.fullname

class location(models.Model):
    name = models.CharField(max_length=100)
    lattitude = models.FloatField()
    longitude = models.FloatField()
    serial = models.IntegerField(default=1)
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
    date = models.DateField()
    start_point = models.CharField(max_length=50)
    destination = models.CharField(max_length=50)
    time = models.CharField(max_length=50)
    class_type = models.CharField(max_length=20)
    tickets = models.IntegerField()
    cost = models.FloatField()
    status = models.CharField(max_length=20,default='unpaid')
    def __str__(self):
        return self.number      
            

class seat(models.Model):
    booking_id = models.CharField(max_length=50)
    occupied = models.IntegerField()
    date = models.DateField()
    start_point = models.CharField(max_length=50)
    destination = models.CharField(max_length=50)
    time = models.CharField(max_length=50)
    def __str__(self):
        return self.start_point
