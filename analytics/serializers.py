from rest_framework import serializers
from .models import Accounts, Users, Conversations, ConversationsRecepients, Channels, AdminReports

class AccountsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Accounts
        fields = '__all__'

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = '__all__'

class ConversationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Conversations
        fields = '__all__'

class ConversationsRecepientsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConversationsRecepients
        fields = '__all__'

class ChannelsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Channels
        fields = '__all__'

class AdminReportsSerializer(serializers.ModelSerializer):
    class Meta:
        model = AdminReports
        fields = '__all__'
