BEGIN;
--
-- Create model Accounts
--
CREATE TABLE "analytics_accounts" ("id" serial NOT NULL PRIMARY KEY, "account_id" integer NOT NULL, "created_at" timestamp with time zone NOT NULL, "updated_at" timestamp with time zone NOT NULL);
--
-- Create model Channels
--
CREATE TABLE "analytics_channels" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(200) NOT NULL, "created_at" timestamp with time zone NOT NULL, "updated_at" timestamp with time zone NOT NULL, "account_id" integer NOT NULL);
--
-- Create model Conversations
--
CREATE TABLE "analytics_conversations" ("id" serial NOT NULL PRIMARY KEY, "status" integer NOT NULL, "due_at" timestamp with time zone NOT NULL, "created_at" timestamp with time zone NOT NULL, "updated_at" timestamp with time zone NOT NULL, "metadata" jsonb NOT NULL, "account_id" integer NOT NULL, "channel_id" integer NOT NULL);
--
-- Create model Users
--
CREATE TABLE "analytics_users" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(200) NOT NULL, "email" varchar(200) NOT NULL, "created_at" timestamp with time zone NOT NULL, "updated_at" timestamp with time zone NOT NULL, "account_id" integer NOT NULL);
--
-- Create model ConversationsReplied
--
CREATE TABLE "analytics_conversationsreplied" ("id" serial NOT NULL PRIMARY KEY, "replied_at" timestamp with time zone NOT NULL, "created_at" timestamp with time zone NOT NULL, "updated_at" timestamp with time zone NOT NULL, "account_id" integer NOT NULL, "conversation_id" integer NOT NULL, "user_id" integer NOT NULL);
--
-- Create model ConversationsRecepients
--
CREATE TABLE "analytics_conversationsrecepients" ("id" serial NOT NULL PRIMARY KEY, "owner" boolean NOT NULL, "replied" boolean NOT NULL, "closed" boolean NOT NULL, "last_replied_at" timestamp with time zone NOT NULL, "closed_at" timestamp with time zone NOT NULL, "created_at" timestamp with time zone NOT NULL, "updated_at" timestamp with time zone NOT NULL, "account_id" integer NOT NULL, "conversation_id" integer NOT NULL, "user_id" integer NOT NULL);
--
-- Add field creater to conversations
--
ALTER TABLE "analytics_conversations" ADD COLUMN "creater_id" integer NOT NULL CONSTRAINT "analytics_conversati_creater_id_dbc2c3dc_fk_analytics" REFERENCES "analytics_users"("id") DEFERRABLE INITIALLY DEFERRED; SET CONSTRAINTS "analytics_conversati_creater_id_dbc2c3dc_fk_analytics" IMMEDIATE;
--
-- Add field conversation to channels
--
ALTER TABLE "analytics_channels" ADD COLUMN "conversation_id" integer NOT NULL CONSTRAINT "analytics_channels_conversation_id_b5d5fcec_fk_analytics" REFERENCES "analytics_conversations"("id") DEFERRABLE INITIALLY DEFERRED; SET CONSTRAINTS "analytics_channels_conversation_id_b5d5fcec_fk_analytics" IMMEDIATE;
--
-- Add field user to channels
--
ALTER TABLE "analytics_channels" ADD COLUMN "user_id" integer NOT NULL CONSTRAINT "analytics_channels_user_id_9fdf2bd8_fk_analytics_users_id" REFERENCES "analytics_users"("id") DEFERRABLE INITIALLY DEFERRED; SET CONSTRAINTS "analytics_channels_user_id_9fdf2bd8_fk_analytics_users_id" IMMEDIATE;
--
-- Create model AdminReports
--
CREATE TABLE "analytics_adminreports" ("id" serial NOT NULL PRIMARY KEY, "account_id" integer NOT NULL);
ALTER TABLE "analytics_channels" ADD CONSTRAINT "analytics_channels_account_id_ea160927_fk_analytics_accounts_id" FOREIGN KEY ("account_id") REFERENCES "analytics_accounts" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "analytics_channels_account_id_ea160927" ON "analytics_channels" ("account_id");
ALTER TABLE "analytics_conversations" ADD CONSTRAINT "analytics_conversati_account_id_5cacbe4a_fk_analytics" FOREIGN KEY ("account_id") REFERENCES "analytics_accounts" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "analytics_conversations" ADD CONSTRAINT "analytics_conversati_channel_id_94fd1dae_fk_analytics" FOREIGN KEY ("channel_id") REFERENCES "analytics_channels" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "analytics_conversations_account_id_5cacbe4a" ON "analytics_conversations" ("account_id");
CREATE INDEX "analytics_conversations_channel_id_94fd1dae" ON "analytics_conversations" ("channel_id");
ALTER TABLE "analytics_users" ADD CONSTRAINT "analytics_users_account_id_070d0b9c_fk_analytics_accounts_id" FOREIGN KEY ("account_id") REFERENCES "analytics_accounts" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "analytics_users_account_id_070d0b9c" ON "analytics_users" ("account_id");
ALTER TABLE "analytics_conversationsreplied" ADD CONSTRAINT "analytics_conversati_account_id_f07b3c9b_fk_analytics" FOREIGN KEY ("account_id") REFERENCES "analytics_accounts" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "analytics_conversationsreplied" ADD CONSTRAINT "analytics_conversati_conversation_id_afb3a35f_fk_analytics" FOREIGN KEY ("conversation_id") REFERENCES "analytics_conversations" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "analytics_conversationsreplied" ADD CONSTRAINT "analytics_conversati_user_id_a14c387d_fk_analytics" FOREIGN KEY ("user_id") REFERENCES "analytics_users" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "analytics_conversationsreplied_account_id_f07b3c9b" ON "analytics_conversationsreplied" ("account_id");
CREATE INDEX "analytics_conversationsreplied_conversation_id_afb3a35f" ON "analytics_conversationsreplied" ("conversation_id");
CREATE INDEX "analytics_conversationsreplied_user_id_a14c387d" ON "analytics_conversationsreplied" ("user_id");
ALTER TABLE "analytics_conversationsrecepients" ADD CONSTRAINT "analytics_conversati_account_id_a4fc75d0_fk_analytics" FOREIGN KEY ("account_id") REFERENCES "analytics_accounts" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "analytics_conversationsrecepients" ADD CONSTRAINT "analytics_conversati_conversation_id_8e206c9e_fk_analytics" FOREIGN KEY ("conversation_id") REFERENCES "analytics_conversations" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "analytics_conversationsrecepients" ADD CONSTRAINT "analytics_conversati_user_id_45b91d94_fk_analytics" FOREIGN KEY ("user_id") REFERENCES "analytics_users" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "analytics_conversationsrecepients_account_id_a4fc75d0" ON "analytics_conversationsrecepients" ("account_id");
CREATE INDEX "analytics_conversationsrecepients_conversation_id_8e206c9e" ON "analytics_conversationsrecepients" ("conversation_id");
CREATE INDEX "analytics_conversationsrecepients_user_id_45b91d94" ON "analytics_conversationsrecepients" ("user_id");
CREATE INDEX "analytics_conversations_creater_id_dbc2c3dc" ON "analytics_conversations" ("creater_id");
CREATE INDEX "analytics_channels_conversation_id_b5d5fcec" ON "analytics_channels" ("conversation_id");
CREATE INDEX "analytics_channels_user_id_9fdf2bd8" ON "analytics_channels" ("user_id");
ALTER TABLE "analytics_adminreports" ADD CONSTRAINT "analytics_adminrepor_account_id_ec0c9cfc_fk_analytics" FOREIGN KEY ("account_id") REFERENCES "analytics_accounts" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "analytics_adminreports_account_id_ec0c9cfc" ON "analytics_adminreports" ("account_id");
COMMIT;

python manage.py shell
from analytics.models import Accounts, Users

 a = Accounts.objects.create()


 python manage.py makemigrations analytics
 python manage.py sqlmigrate analytics 0003
 python manage.py migrate



 Hey Ayush, sorry for not being very clear in the documentation. Here are the clarifications

1. I did not intend to imply that there cannot be any aggregation at all. We just wanted it to be kept at a minimum. For instance you could store aggregated data hourly or daily. This way you can still use agg functions but the number of rows on which it is performed are less. You are also free to use an external Key-value service like redis for any further optimization.

2. We would prefer to keep things simple at this point and not use too many services that require their own maintenance and monitoring. But we might Redshift in which case it should be compatible with postgres so correct me if I am wrong but moving to Redshift should be as simple as changing the DB endpoint ?

3. We are not guarnteeing exact real-time metrics so you are free to queue up the events and process them asynchronously. If the data updates 15 min late that should be fine


1:last_quarter
1:last_month
1:last_week
1:last_day
1:today

from analytics.models import Conversations, Accounts, Users, Channels
 a = Accounts.objects.get(pk=2)
 u = Users.objects.get(pk=2) 
 ch = Channels.objects.get(pk=1) 
 c = Conversations(account=a, creater=u, channel=ch)
