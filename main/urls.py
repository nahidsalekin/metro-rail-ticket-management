from django.urls import path,re_path
from . import views
urlpatterns = [
    path('',views.HomeView.as_view(),name='home'),
     path('login/',views.Login.as_view(),name='login'),
     path('about/',views.About.as_view(),name='about'),
     path('ticket/',views.Ticket.as_view(),name='ticket'),
     path('loaction/',views.Location,name='location'),
     path('submit_user/',views.submit_user,name='submit_user'),
     path('user_login/',views.user_login,name='user_login'),
     path('add_location/',views.add_location,name='add_location'),
     path('show_place/',views.show_place,name='show_place'),
     path('remove/',views.remove,name='remove'),
     path('ticket_info/',views.ticket_info,name='ticket_info'),
     path('update_price/',views.update_price,name='update_price'),
     path('current_price/',views.current_price,name='current_price'),
     path('ticket_availability/',views.ticket_availability,name='ticket_availability'),
     path('logout/',views.logout,name='logout'),

     

]

