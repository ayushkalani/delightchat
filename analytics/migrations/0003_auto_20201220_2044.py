# Generated by Django 3.1.4 on 2020-12-20 20:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('analytics', '0002_auto_20201220_2037'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='channels',
            unique_together={('account', 'name')},
        ),
    ]