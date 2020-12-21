from django.urls import include, path
from rest_framework import routers
from . import views
router = routers.DefaultRouter()

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

urlpatterns = [
    path('', include(router.urls)),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]