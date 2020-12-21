from django.contrib import admin
from analytics.models import Accounts, Users, Conversations, Channels

admin.site.register(Accounts)
admin.site.register(Users)
admin.site.register(Conversations)
admin.site.register(Channels)