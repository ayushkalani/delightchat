from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Accounts, Users, Conversations, ConversationsRecepients, Channels, AdminReports

@receiver(post_save, sender=Conversations)
def update_reports_metrics(sender, instance, created, **kwargs):
    breakpoint()
    if created:
        AdminReports.objects.create(user=instance)
