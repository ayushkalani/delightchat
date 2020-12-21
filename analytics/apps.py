from django.apps import AppConfig
from django.db.models.signals import post_save

class AnalyticsConfig(AppConfig):
    name = 'analytics'

    def ready(self):
        import analytics.signals