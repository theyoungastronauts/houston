# Generated by Django 4.0 on 2022-12-05 15:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('connect', '0002_follow'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='follow',
            options={'ordering': ['-created_at'], 'verbose_name': 'user follow', 'verbose_name_plural': 'user follows'},
        ),
    ]
