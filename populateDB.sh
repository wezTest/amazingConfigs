#!/bin/bash
# DB Script To Remove Data And Populate With Production Like Questions And Answers
HOST="$1"
USERNAME="$2"
PASSWORD="$3"
DATABASE_SCHEMA="$4"
ARR=($(mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" -Nse "show tables like 'forum%'" "$DATABASE_SCHEMA"))
echo "${ARR[@]}" 
for table in "${ARR[@]}"
do
if [[ "$table" == *"migrations"* || "$table" == *"users"* ]]; then
    echo "Not removing data from $table"
else
    echo "Removing data from table $table"
    mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" -e "SET FOREIGN_KEY_CHECKS=0;truncate table $table" "$DATABASE_SCHEMA";
fi
done
echo "################ CREATING QUESTION 1 #######################"
CURRENT_DATE=$(date +%Y-%m-%d_%H-%M-%S)
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_questions(user_id,text,detail,created_at,updated_at) VALUES (185094,'What are the next steps to take while waiting for my #samples to arrive from China?','Can someone please help me to confirm the next steps. I am waiting on my samples to arrive, and dont want to waste time... what are my next steps?? Should I be working on my #branding and #packaging? @DennisTowler could you advise which courses would help me specifically with this please? ','$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('samples',0,'$CURRENT_DATE','$CURRENT_DATE'), ('branding',0,'$CURRENT_DATE','$CURRENT_DATE'),  ('packaging',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_questions_tags(question_id,tag_id,created_at,updated_at) VALUES (1,1,'$CURRENT_DATE','$CURRENT_DATE'), (1,2,'$CURRENT_DATE','$CURRENT_DATE'), (1,3,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA"

echo "################ CREATING ANSWERS AND VOTES FOR QUESTION 1 #######################"
CURRENT_DATE=$(date +%Y-%m-%d_%H-%M-%S)
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_answers(user_id,question_id,text,votes,created_at,updated_at) VALUES (185094,'1','Always take action and keep working other things. Sure you can start on your listing so once you have your samples evaluated and confirmed you will proceed you will already have a jump on it. Once you create the listing in #SellerCentral you will get the FNSKU barcode. You will need to get the UPC code as well - You may want to watch @Christie_Nachtrab course on #BarcodesAndAmazonBrandRegistry as well. You should put your brand or logo at least on your packaging. The product package needs to include Made In China. If that is not on the product packaging you can have issue when importing into the USA.',1,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('sellercentral',0,'$CURRENT_DATE','$CURRENT_DATE'), ('barcodesandamazonbrandregistry',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_tags(answer_id,tag_id,created_at,updated_at) VALUES (1,4,'$CURRENT_DATE','$CURRENT_DATE'), (1,5,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_votes(answer_id,user_id,created_at,updated_at) VALUES (1,186712,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA"

echo "################ CREATING QUESTION 2 #######################"
CURRENT_DATE=$(date -v -1d '+%Y-%m-%d_%H-%M-%S')
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_questions(user_id,text,detail,created_at,updated_at) VALUES (186712,'Are there corresponding courses that go with #brandGenesis that I should be taking while setting up my #Amazon business?','It seems that every episode of #brandGenesis has corresponding courses that go with each episode. Why aren''t these courses listed with each episode? It''s hard to find these courses unless you have the exact title or author. Can someone point me in direction of what courses I should take in conjunction with Brand Genesis and can someone tell me where I can find the  #lessonResources for each lesson?','$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('brandgenesis',0,'$CURRENT_DATE','$CURRENT_DATE'), ('amazon',0,'$CURRENT_DATE','$CURRENT_DATE'), ('lessonresources',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_questions_tags(question_id,tag_id,created_at,updated_at) VALUES (2,6,'$CURRENT_DATE','$CURRENT_DATE'), (2,7,'$CURRENT_DATE','$CURRENT_DATE'), (2,8,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA"

echo "################ CREATING ANSWERS AND VOTES FOR QUESTION 2 #######################"
CURRENT_DATE=$(date -v -1d '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_1H=$(date -v -60M '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_2H=$(date -v -120M '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_3H=$(date -v -180M '+%Y-%m-%d_%H-%M-%S')
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_answers(user_id,question_id,text,votes,created_at,updated_at) VALUES (186712,'2','We are working on giving you a clearer path or #playlist of what courses to take that correlate with #brandGenesis. Will do our best to make that available sooner rather than later.In the meantime, is there anything in particular that you''re looking for? I''m happy to give you some suggestions, if you let me know where you are in the process.For the #lessonResources and spreadsheets, I''d just do your best to emulate what Matt is working from using excel or google sheets.',2,'$CURRENT_DATE','$CURRENT_DATE'), (185094,'2','We''re not providing Matt''s #spreadsheets, but you don''t need to create anything fancy. You just need copy his headers.These are the rows he''s created for the product search:Product, Amazon URL, Category, Best Seller Rank, Selling Price, # of Reviews, Product Weight (lbs). And here''s what you can use to stay organized with your suppliers. Item, Supplier, Cost, Payment Method, Shipping Company, Product (s)Don''t feel like you need to copy Matt''s spreadsheets exactly. Feel free to customize them to your needs',3,'$CURRENT_DATE','$CURRENT_DATE'), (174238,'2','With regards to courses that can be taken in conjunction with #brandGenesis course, this is what I''d recommend: #CompleteGuideToAmazonSellerCentralSetup by @RichHenderson,#AmazonProductSelectionBlueprint by @RichHenderson and @ChristieNachtrab, #TheInsiderBlueprintToSourcingFromChina by @MarkHoung, #AmazonBarcodesandBrandRegistery by @ChristieNachtrab, #AmazonConversionMaximizer by @KarynThomas and #AmazonProductReviewEvolution by @RichHenderson',1,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('playlist',0,'$CURRENT_DATE','$CURRENT_DATE'), ('spreadsheets',0,'$CURRENT_DATE','$CURRENT_DATE'), ('completeguidetoamazonsellercentralsetup',0,'$CURRENT_DATE','$CURRENT_DATE'), ('amazonproductselectionblueprint',0,'$CURRENT_DATE','$CURRENT_DATE'), ('theinsiderblueprinttosourcingfromchina',0,'$CURRENT_DATE','$CURRENT_DATE'), ('amazonbarcodesandbrandregistery',0,'$CURRENT_DATE','$CURRENT_DATE'), ('amazonconversionmaximizer',0,'$CURRENT_DATE','$CURRENT_DATE'),  ('amazonproductreviewevolution',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_tags(answer_id,tag_id,created_at,updated_at) VALUES (2,6,'$CURRENT_DATE','$CURRENT_DATE'), (2,8,'$CURRENT_DATE','$CURRENT_DATE'),(2,9,'$CURRENT_DATE','$CURRENT_DATE'), (3,10,'$CURRENT_DATE','$CURRENT_DATE'), (4,11,'$CURRENT_DATE','$CURRENT_DATE'), (4,12,'$CURRENT_DATE','$CURRENT_DATE'), (4,13,'$CURRENT_DATE','$CURRENT_DATE') ,(4,14,'$CURRENT_DATE','$CURRENT_DATE'), (4,15,'$CURRENT_DATE','$CURRENT_DATE'), (4,16,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_votes(answer_id,user_id,created_at,updated_at) VALUES (2,185094,'$CURRENT_DATE','$CURRENT_DATE'), (2,174238,'$CURRENT_DATE','$CURRENT_DATE'), (3,185094,'$CURRENT_DATE','$CURRENT_DATE'), (3,174238,'$CURRENT_DATE','$CURRENT_DATE'), (3,186411,'$CURRENT_DATE','$CURRENT_DATE'),(4,186326,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA"

echo "################ CREATING QUESTION 3 #######################"
CURRENT_DATE=$(date -v -10d '+%Y-%m-%d_%H-%M-%S')
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_questions(user_id,text,detail,created_at,updated_at) VALUES (185094,'Amazon #CategoryApproval application for Health, Beauty & Personal Care.','I have been trying to get an approval for the Gated Category of #HealthBeautyandPersonalCare. I have been struggling to get clear instructions regarding the Invoices required. The #AmazonGatingTeam have been very little help, every time I have had a discussion with them, they were very unclear as to what was needed and why they denied the application. Can anyone please offer their assistance or share their experiences regarding the application process and how best to go about it?','$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('categoryapproval',0,'$CURRENT_DATE','$CURRENT_DATE'), ('healthbeautyandpersonalcare',0,'$CURRENT_DATE','$CURRENT_DATE'), ('amazongatingteam',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_questions_tags(question_id,tag_id,created_at,updated_at) VALUES (3,17,'$CURRENT_DATE','$CURRENT_DATE'), (3,18,'$CURRENT_DATE','$CURRENT_DATE'), (3,19,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA" 

echo "################ CREATING ANSWERS AND VOTES FOR QUESTION 3 #######################"
CURRENT_DATE=$(date -v -10d '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_9=$(date -v -9d '+%Y-%m-%d_%H-%M-%S')
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_answers(user_id,question_id,text,votes,created_at,updated_at) VALUES (186411,'3','Amazon likes to keep you in the dark regarding what their requirements are so it''s difficult to know exactly what the #CategoryApproval requirements are as far as quantity, etc.It''s been pretty firmly established that you need the following on any invoice you submit:An invoice from a wholesaler, not a retail sales receipt, Date of transaction (should be recent, past 30 days is best), The Company Name and Address, Contact Info and Logo on the invoice, The word \"Invoice\" on the invoice. Your bill to and ship to Name, address and contact info (phone and email is best), The item(s) you bought (must be in category you''re trying to get ungated for).That''s about the only suggestions I can give you at this time. Best wishes and please reply to let us know if this works to get you ungated',0,'$CURRENT_DATE','$CURRENT_DATE'), (186326,'3','I spoke with Amazon today and they requested the quantity of each invoice needs to be a minimum of at least 30 items.  Also all invoices need to be scanned as pictures and not as PDF documents.',0,'$CURRENT_DATE_9','$CURRENT_DATE_9'), (186284,'3','@JackieStrine Thanks for the information on #ungating. Is there any company that can help with ungating in the Amazon #restrictedcategories? Also, I assume you have to buy the items from the wholesalers to get the invoice required by Amazon.',3,'$CURRENT_DATE','$CURRENT_DATE'), (184580,'3','You need to make sure that you include an invoice from a wholesaler, not a just a retail sales receipt. The invoice needs to have the word ''Invoice'' on it, and be issued within the last 30 days.',1,'$CURRENT_DATE','$CURRENT_DATE'), (184163,'3','Make sure your include a photo of your invoice and not a PDF document.  It should include the quantity of items and price. Lastly, print out the receipt and take a high quality photo of it. You can take the photo with your phone and upload it to the application for #ungating instead of a PDF.',2,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('ungating',0,'$CURRENT_DATE','$CURRENT_DATE'), ('restrictedcategories',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_tags(answer_id,tag_id,created_at,updated_at) VALUES (5,17,'$CURRENT_DATE','$CURRENT_DATE'), (7,20,'$CURRENT_DATE','$CURRENT_DATE'), (7,21,'$CURRENT_DATE','$CURRENT_DATE'), (9,20,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_votes(answer_id,user_id,created_at,updated_at) VALUES (7,185094,'$CURRENT_DATE','$CURRENT_DATE'), (7,174238,'$CURRENT_DATE','$CURRENT_DATE'), (7,185094,'$CURRENT_DATE','$CURRENT_DATE'), (8,174238,'$CURRENT_DATE','$CURRENT_DATE'), (9,186411,'$CURRENT_DATE','$CURRENT_DATE'),(9,186326,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA"


echo "################ CREATING QUESTION 4 #######################"
CURRENT_DATE=$(date -v -32d '+%Y-%m-%d_%H-%M-%S')
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_questions(user_id,text,detail,created_at,updated_at) VALUES (185094,'Can anyone help with Patent search tips?','Does anyone have any tips on patentSearches for doing the search yourself?I''ve searched google for a product I''m interested in and I can''t seem to find any patents on it.Also what if there is a patent on a product in Europe? Can an identical item be sold in the USA?','$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA" 

echo "################ CREATING ANSWERS AND VOTES FOR QUESTION 4 #######################"
CURRENT_DATE=$(date -v -32d '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_31=$(date -v -31d '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_30=$(date -v -30d '+%Y-%m-%d_%H-%M-%S')
CURRENT_DATE_29=$(date -v -29d '+%Y-%m-%d_%H-%M-%S')
mysql -h "$HOST" -u "$USERNAME" --password="$PASSWORD" \
-e "INSERT INTO forum_answers(user_id,question_id,text,votes,created_at,updated_at) VALUES (186712,'4','You can go to www.uspto.gov. in the search field - enter patent search. The next page will come with a link for searches.',0,'$CURRENT_DATE','$CURRENT_DATE'), (186411,'4','If you do find a patent for it in Europe and not in the USA - then you may want to review it and consider contacting a person who has experience with #IntellectualProperty and #Patents',4,'$CURRENT_DATE','$CURRENT_DATE'), (186326,'4','You can also always ask the supplier if they are aware of any patents.',1,'$CURRENT_DATE_31','$CURRENT_DATE_31'), (184580,'4','If you are not sure, contact an IP attorney and ask for their advice.',1,'$CURRENT_DATE_30','$CURRENT_DATE_30'), (184163,'4','Make sure your include a photo of your invoice and not a PDF document.  It should include the quantity of items and price. Lastly, print out the receipt and take a high quality photo of it. You can take the photo with your phone and upload it to the application for #ungating instead of a PDF.',0,'$CURRENT_DATE_29','$CURRENT_DATE_29');" \
-e "INSERT INTO forum_tags(name,is_auto_suggested,created_at,updated_at) VALUES ('intellectualproperty',0,'$CURRENT_DATE','$CURRENT_DATE'), ('patents',0,'$CURRENT_DATE','$CURRENT_DATE');" \
-e "INSERT INTO forum_answers_tags(answer_id,tag_id,created_at,updated_at) VALUES (11,21,'$CURRENT_DATE','$CURRENT_DATE'), (11,22,'$CURRENT_DATE','$CURRENT_DATE');"  \
-e "INSERT INTO forum_answers_votes(answer_id,user_id,created_at,updated_at) VALUES (11,185094,'$CURRENT_DATE','$CURRENT_DATE'),(11,184163,'$CURRENT_DATE_31','$CURRENT_DATE_31'),(11,182763,'$CURRENT_DATE','$CURRENT_DATE'),(11,174238,'$CURRENT_DATE','$CURRENT_DATE'), (12,185094,'$CURRENT_DATE','$CURRENT_DATE'), (13,174238,'$CURRENT_DATE','$CURRENT_DATE');" "$DATABASE_SCHEMA"
