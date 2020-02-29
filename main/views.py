from django.http import HttpResponse,JsonResponse
from django.shortcuts import render, get_object_or_404,redirect
from .models import user,main,location,ticket,booking,routes
from django.views.generic import TemplateView
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm

class HomeView(TemplateView):
    template_name="index.html"

    def get_context_data(self, **kwargs):
       context=super().get_context_data(**kwargs)
       context['name']="Nahid Salekin"
       context['email']="khannahid64@gmail.com"

       return context

class Login(TemplateView):
    template_name="login.html"

class About(TemplateView):
    template_name="about.html"

class Ticket(TemplateView):
    template_name="ticket.html"    
 
def Location(request):
    all_info = location.objects.all()
    base_fare = 5
    for start in all_info:
        start_point = start.name
        location1 = location.objects.get(name=start_point)
        lat1 = location1.lattitude
        lon1 = location1.longitude
        for dest in all_info:
            destination = dest.name
            if start_point==destination:
                continue
            location2 = location.objects.get(name=destination)
            lat2 = location2.lattitude
            lon2 = location2.longitude
            distance = calculate_distance(lat1,lon1,lat2,lon2)
            price = distance*base_fare
            price = float("{0:.2f}".format(price))
            count = routes.objects.filter(start_point=start_point,destination=destination).count()
            if count == 0:
                new = routes(start_point=start_point,destination=destination,distance=distance,price=price)
                new.save()
            else:
                update = routes.objects.get(start_point=start_point,destination=destination)
                update.distance = distance
                update.price =  price
                update.save()    

    return render(request,"station.html",{'all_info':all_info})

def logout(request):
    del request.session["auth"]
    return render(request,"login.html")


def user_login(request):
    username = request.POST["username"]
    password = request.POST["password"]
    all_info = user.objects.all()
    loggedin=False

    for info in all_info:
        if((username == info.username or username == info.email) and password == info.password):
            loggedin=True
            break
 
    if loggedin == True:
        request.session["auth"] = "yes"
        return render(request,"index.html")
    else:
        return render(request,"login.html")   

    

    

def submit_user(request):
    fullname = request.POST["fullname"]
    username = request.POST["fullname"]
    email = request.POST["email"]
    gender = request.POST["gender"]
    number = request.POST["number"]
    password = request.POST["password"]

    main_info = user(fullname=fullname,username=username,email=email,gender=gender,number=number,password=password)
    main_info.save()
    messages.add_message(request, messages.INFO, 'Registration Succesfull.') 

    return render(request,"login.html")

def add_location(request):    
    name = request.POST["name"]
    lat = request.POST["lat"]
    lng = request.POST["lng"]

    address = location(name=name,lattitude=lat,longitude=lng)
    address.save()
    messages.add_message(request, messages.INFO, '*New Location Added*') 
    all_info = location.objects.all()
    return render(request,"station.html",{'all_info':all_info})

import json
def show_place(request):
    place = []    
    all_info = location.objects.all()
    for data in all_info:
        place.append(data.name)
    place = json.dumps(place)
    return JsonResponse(place, safe=False)
        
def remove(request):
    if request.method == 'POST':
        curr_place = request.POST["curr_place"]
        place_from_db = location.objects.filter(name=curr_place)
        place_from_db.delete()
        print(curr_place)
    return HttpResponse("")

def ticket_info(request):
    # info = ticket.objects.all()
    return render(request,"ticket_info.html")

def current_price(request):
    if request.method == 'POST':
        class_type = request.POST["data1"]
        current = ticket.objects.get(class_type=class_type)
        data = json.dumps({
        'price': current.price,
        'slots': current.slots})
        return JsonResponse(data,content_type='application/json',safe=False)
    return HttpResponse("0")    

def update_price(request):
    price = request.POST["price"]
    slots = request.POST["slots"]
    class_type = request.POST["class_type"]
    base_fare = float(0)
    count = ticket.objects.filter(class_type=class_type).count()
    if count == 0:
        new = ticket(price=price,slots=slots,class_type=class_type,base_fare=base_fare)
        new.save()
    else:
        update = ticket.objects.get(class_type=class_type)
        update.price = price
        update.slots = slots
        update.save()    
    return render(request,"ticket_info.html")


def ticket_availability(request):
    if request.method == 'POST':
        start_pont = request.POST["start_point"]
        destination = request.POST["destination"]
        date = request.POST["date"]
        class_type = request.POST["class_type"]
        time = request.POST["time"]
        count = booking.objects.filter(start_pont=start_pont,destination=destination,date=date,class_type=class_type,time=time).count()
        
        if count==0:
            tickets = ticket.objects.get(class_type=class_type)
            print(tickets.price)
            base_fare = tickets.base_fare
            price = tickets.price
            tickets = tickets.slots
            total = base_fare+price

            data = json.dumps({
            'price': total,
            'tickets': tickets})
            return JsonResponse(data,content_type='application/json',safe=False)
        else:
                
    return HttpResponse("0")

def calculate_distance(lat1,lon1,lat2,lon2):
    from math import sin, cos, sqrt, atan2, radians
    R = 6373.0

    lat1 = radians(lat1)
    lon1 = radians(lon1)
    lat2 = radians(lat2)
    lon2 = radians(lon2)
    dlon = lon2 - lon1
    dlat = lat2 - lat1

    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    distance = R * c
    distance = float("{0:.2f}".format(distance))
    return distance    