from django.contrib import admin
from .models import main,user,location,ticket,booking,routes

# Register your models here.

admin.site.register(main)
admin.site.register(user)
admin.site.register(location)
admin.site.register(ticket)
admin.site.register(booking)
admin.site.register(routes)