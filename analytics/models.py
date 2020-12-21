from django.db import models
NEW = "New"
REPLIED = "Replied"
CLOSED = "Closed"

class Accounts(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Users(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        unique_together = (('account', 'email'),)


class Conversations(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    creater = models.ForeignKey(Users, on_delete=models.CASCADE)
    channel = models.ForeignKey('Channels', on_delete=models.CASCADE)
    status = models.IntegerField(default=0)
    due_at = models.DateTimeField('date', blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def get_status(self):
        if self.status == 0:
            return NEW
        elif self.status == 1:
            return REPLIED
        elif self.status == 2:
            return CLOSED

class ConversationsRecepients(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    conversation = models.ForeignKey(Conversations, on_delete=models.CASCADE)
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    owner = models.BooleanField(default=False)
    replied = models.BooleanField(default=False)
    closed = models.BooleanField(default=False)
    last_replied_at = models.DateTimeField('date')
    closed_at = models.DateTimeField('date')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class ConversationsReplied(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    conversation = models.ForeignKey(Conversations, on_delete=models.CASCADE)
    replied_at = models.DateTimeField('date')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Channels(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        unique_together = (('account', 'name'),)

class AdminReports(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    monthly_new_conversations = models.IntegerField(default=0, blank=True)
    weekly_new_conversations = models.IntegerField(default=0, blank=True)
    daily_new_conversations = models.IntegerField(default=0, blank=True)
    monthly_replied_conversations = models.IntegerField(default=0)
    weekly_replied_conversations = models.IntegerField(default=0)
    daily_replied_conversations = models.IntegerField(default=0)
    monthly_closed_conversations = models.IntegerField(default=0)
    weekly_closed_conversations = models.IntegerField(default=0)
    daily_closed_conversations = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)