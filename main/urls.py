from django.urls import path,re_path
from . import views
urlpatterns = [
    path('',views.HomeView.as_view(),name='home'),
     path('login/',views.Login.as_view(),name='login'),
     path('about/',views.About.as_view(),name='about'),
     path('profile/',views.profile,name='profile'),
     path('upload_image/',views.upload_image,name='upload_image'),
     path('users/',views.users,name='users'),
     path('update_profile/',views.update_profile,name='update_profile'),
     path('check_ticket/',views.check_ticket,name='check_ticket'),
     path('loaction/',views.Location,name='location'),
     path('submit_user/',views.submit_user,name='submit_user'),
     path('user_login/',views.user_login,name='user_login'),
     path('add_location/',views.add_location,name='add_location'),
     path('show_place/',views.show_place,name='show_place'),
     path('remove/',views.remove,name='remove'),
     path('ticket_info/',views.ticket_info,name='ticket_info'),
     path('update_price/',views.update_price,name='update_price'),
     path('current_price/',views.current_price,name='current_price'),
     path('purchase/',views.purchase,name='purchase'),
     path('cancel_reservation/',views.cancel_reservation,name='cancel_reservation'),
     path('cancel_reservation_admin/',views.cancel_reservation_admin,name='cancel_reservation_admin'),
     path('ticket_availability/',views.ticket_availability,name='ticket_availability'),
     path('confirm_booking/',views.confirm_booking,name='confirm_booking'),
     path('occupied_seat/',views.occupied_seat,name='occupied_seat'),
     path('booking_list/',views.booking_list,name='booking_list'),
     path('my_booking/',views.my_booking,name='my_booking'),
     path('payment/',views.payment,name='payment'),
     path('logout/',views.logout,name='logout'),

     

]

