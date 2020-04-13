from django.http import HttpResponse,HttpResponseRedirect,JsonResponse
from django.shortcuts import render, get_object_or_404,redirect
from .models import user,main,location,ticket,booking,routes,seat_list
from django.db.models import Q
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
from datetime import datetime
import time
def profile(request):
    u = user.objects.get(username=request.session['username'])
    total = booking.objects.filter(number=u.number).count()
    if total != 0:    
        last = booking.objects.filter(number=u.number).latest('date')
        last = last.date
        today = datetime.now()    
        active = booking.objects.filter(Q(number=u.number,date__gt = today) | Q(number=u.number,date=today))
    else:
        last = "..." 
        active = ""   
    return render(request,"profile.html",{'fullname': u.fullname,'username': u.username,'email': u.email,'gender': u.gender,'age': u.age,'number': u.number,'password': u.password,'total': total,'last': last,'active': active})

def users(request):
    u = user.objects.all()
    return render(request,"users.html",{'all_user':u})


def update_profile(request):
    fullname = request.POST["fullname"]
    username = request.POST["username"]
    email = request.POST["email"]
    age = request.POST["age"]
    gender = request.POST["gender"]
    number = request.POST["number"]
    password = request.POST["password"]
    u = user.objects.get(username=username)
    u.fullname = fullname
    u.email = email
    u.gender = gender
    u.number = number
    u.age = age
    u.password = password
    u.save()
    total = booking.objects.filter(number=u.number).count()    
    if total != 0:    
        last = booking.objects.filter(number=u.number).latest('date')
        last = last.date
        today = datetime.now()  
        active = booking.objects.filter(Q(number=u.number,date__gt = today) | Q(number=u.number,date=today))
    else:
        last = "..."  
    messages.add_message(request, messages.INFO, 'Update Complete.')
    return render(request,"profile.html",{'fullname': u.fullname,'username': u.username,'email': u.email,'gender': u.gender,'age': u.age,'number': u.number,'password': u.password,'total': total,'last': last,'active': active})

def booking_list(request):
    all_booking = booking.objects.all()
    all_user = user.objects.all()
    return render(request,"booking_list.html",{'all_booking': all_booking,'all_user': all_user})    


def check_ticket(request):
    info = ticket.objects.all()
    slots = 0
    for init in info:
        slots = slots+init.slots
    slots = int(slots/2)    

    return render(request,"ticket.html",{'tickets': range(slots),'capacity': slots*2})
 
def Location(request):
    all_info = location.objects.all()    
    return render(request,"station.html",{'all_info':all_info})

def calculate_price(start_point,destination,price_per_km):
    location1 = location.objects.get(name=start_point)
    lat1 = location1.lattitude
    lon1 = location1.longitude
    location2 = location.objects.get(name=destination)
    lat2 = location2.lattitude
    lon2 = location2.longitude
    distance = calculate_distance(lat1,lon1,lat2,lon2)
    price = distance*price_per_km
    price = round(price)
    return distance, price

def logout(request):
    try:
        del request.session['username']
    except KeyError:
        pass
    return render(request,"login.html")


def user_login(request):
    username = request.POST["username"]
    password = request.POST["password"]
    count = user.objects.filter(username=username).count()
    if count!=0:
        u = user.objects.get(username=username)
        if u.password == password:
            request.session['username'] = u.username
            return render(request,"index.html")
    
    messages.add_message(request, messages.INFO, 'Wrong User') 
    return render(request,"login.html")   

def submit_user(request):
    fullname = request.POST["fullname"]
    username = request.POST["username"]
    email = request.POST["email"]
    gender = request.POST["gender"]
    age = request.POST["age"]
    number = request.POST["number"]
    password = request.POST["password"]
    count = user.objects.filter(Q(username=username) | Q(email=email) | Q(number=number)).count()
    if count == 0:
        main_info = user(fullname=fullname,username=username,email=email,gender=gender,age=age,number=number,password=password)
        main_info.save()
        messages.add_message(request, messages.INFO, 'Registration Successful.')
    else:
        messages.add_message(request, messages.INFO, 'Registration Failed! User Already exists.')
        
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
        start_point = request.POST["start_point"]
        destination = request.POST["destination"]
        date = request.POST["date"]
        class_type = request.POST["class_type"]
        time = request.POST["time"]
        count = booking.objects.filter(start_point=start_point,destination=destination,date=date,class_type=class_type,time=time).count()
        info = ticket.objects.get(class_type=class_type)
        distance, base_fare = calculate_price(start_point,destination,info.price)
        price = base_fare
        tickets= 0
        if count==0:
            tickets = info.slots
        else:
            total = 0
            ticket_info = booking.objects.filter(start_point=start_point,destination=destination,date=date,class_type=class_type,time=time)
            for passenger in ticket_info:
                total = total + passenger.tickets
            tickets = info.slots - total
            if tickets <= 0:
                tickets = 0
        data = json.dumps({'distance': distance,'price': price,'tickets': tickets})
        return JsonResponse(data,content_type='application/json',safe=False)           
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
        
import re
def confirm_booking(request):
    if request.method == 'POST':
        start_point = request.POST["start_point"]
        destination = request.POST["destination"]
        date = request.POST["date"]
        class_type = request.POST["class_type"]
        time = request.POST["time"]
        quantity = int(request.POST["quantity"])
        seat_index = request.POST["seat_index"]
        cost = request.POST["price"]
        id = request.POST["id"]
        u = user.objects.get(username=request.session['username'])
        number = u.number
        count = booking.objects.filter(id=id).count()
        if count!= 0:
            return HttpResponse("")
        confirm = booking(id=id,number=number,start_point=start_point,destination=destination,date=date,class_type=class_type,time=time,cost=cost,tickets=quantity)
        confirm.save()
        temp = []
        temp = re.findall('\d+', seat_index)
        for index in temp:
            count = seat_list.objects.filter(occupied=index,start_point=start_point,destination=destination,date=date,time=time).count()
            if count !=0:
                continue
            seat_index = seat_list(occupied=index,start_point=start_point,destination=destination,date=date,time=time)
            seat_index.save()  
    return render(request,"ticket.html")

def purchase(request):
    if request.method == 'POST':
        start_point = request.POST["start_point"]
        destination = request.POST["destination"]
        class_type = request.POST["class_type"]
        time = request.POST["time"]
        date = request.POST["date"]
        seat_no = request.POST["seat_no"]
        seat_no = seat_no[:-1]
        seat_index = request.POST["seat_index"]
        quantity = request.POST["tickets"]
        seats = quantity + " (" + seat_no + ")"
        quantity = int(quantity)
    
        info = ticket.objects.get(class_type=class_type)
        distance, base_fare = calculate_price(start_point,destination,info.price)
        price = quantity*base_fare
        return render(request,"purchase.html",{'from':start_point,'to':destination,'distance':distance,'date':date,'time':time,'seats':seats,'quantity':quantity,'price':price,'seat_index':seat_index,'class_type':class_type}) 
    return render(request,"purchase.html")

def cancel_reservation(request):
    if request.method == 'POST':
        start_point = request.POST["start_point"]
        destination = request.POST["destination"]
        date = request.POST["date"]
        time = request.POST["time"]
        u = user.objects.get(username=request.session['username'])
        booking.objects.filter(start_point=start_point,destination=destination,date=date,time=time,number=u.number).delete()
        total = booking.objects.filter(number=u.number).count()
        if total != 0:    
            last = booking.objects.filter(number=u.number).latest('date')
            last = last.date
            today = datetime.now()    
            active = booking.objects.filter(Q(number=u.number,date__gt = today) | Q(number=u.number,date=today))
        else:
            last = "..."    
        messages.add_message(request, messages.INFO, 'Reservation Cancelled.')    
        return render(request,"profile.html",{'fullname': u.fullname,'username': u.username,'email': u.email,'gender': u.gender,'age': u.age,'number': u.number,'password': u.password,'total': total,'last': last,'active': active})
    return render(request,"index.html")

def cancel_reservation_admin(request):
    if request.method == 'POST':
        start_point = request.POST["start_point"]
        destination = request.POST["destination"]
        date = request.POST["date"]
        time = request.POST["time"]
        number = request.POST["number"]
        print(number)
        booking.objects.filter(start_point=start_point,destination=destination,date=date,time=time,number=number).delete()
        all_booking = booking.objects.all()
        all_user = user.objects.all()
        return render(request,"booking_list.html",{'all_booking': all_booking,'all_user': all_user})    
    return render(request,"index.html")

def occupied_seat(request):
    if request.method == 'POST':    
        start_point = request.POST["start_point"]
        destination = request.POST["destination"]
        time = request.POST["time"]
        date = request.POST["date"]
        index = []
        all_seat = seat_list.objects.filter(start_point=start_point,destination=destination,time=time,date=date)
        for seat in all_seat:
            index.append(seat.occupied)
        index = json.dumps(index)
        return JsonResponse(index, safe=False)   
    return HttpResponse("0")