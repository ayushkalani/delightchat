# Generated by Django 3.1.4 on 2020-12-21 18:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('analytics', '0003_auto_20201220_2044'),
    ]

    operations = [
        migrations.AlterField(
            model_name='conversationsrecepients',
            name='closed',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='conversationsrecepients',
            name='owner',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='conversationsrecepients',
            name='replied',
            field=models.BooleanField(default=False),
        ),
    ]
