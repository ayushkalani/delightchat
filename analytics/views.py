from django.http import HttpResponse
from rest_framework import viewsets
from .models import Conversations, AdminReports
from .serializers import ConversationsSerializer, AdminReportsSerializer

def dashboard(request):
    return HttpResponse("Hello, world. You're at the polls index.")

# class ConversationUpdateView(generics.UpdateAPIView):
#     # rest ...

# class ConversationsViewSet(viewsets.ModelViewSet):
#     queryset = Conversations.objects.all()
#     serializer_class = ConversationsSerializer

# class AdminReportsViewSet(viewsets.ModelViewSet):
#     queryset = AdminReports.objects.all()
#     serializer_class = AdminReportsSerializer