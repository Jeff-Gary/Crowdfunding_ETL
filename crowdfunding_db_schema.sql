CREATE TABLE "campaign" (
	"cf_id" INT NOT NULL PRIMARY KEY,
	"contact_id" INT NOT NULL,
	"company_name" VARCHAR(50) NOT NULL,
	"description" VARCHAR(150) NOT NULL,
	"goal" FLOAT NOT NULL,
	"pledged" FLOAT NOT NULL,
	"outcome" VARCHAR(25) NOT NULL,
	"backers_count" INT NOT NULL,
	"country" VARCHAR(5) NOT NULL,
	"currency" VARCHAR(5) NOT NULL,
	"launch_date" DATE NOT NULL,
	"end_date" DATE NOT NULL,
	"category_id" VARCHAR(50),
	"subcategory_id" VARCHAR(50)	
)


CREATE TABLE "category" (
	"category_id" VARCHAR(50) NOT NULL PRIMARY KEY,
	"category" VARCHAR(50) NOT NULL
)


CREATE TABLE "subcategory" (
	"subcategory_id" VARCHAR(50) NOT NULL PRIMARY KEY,
	"subcategory" VARCHAR(50) NOT NULL
)


CREATE TABLE "contacts" (
	"contact_id" INT NOT NULL PRIMARY KEY,
	"first_name" VARCHAR(25) NOT NULL,
	"last_name" VARCHAR(25) NOT NULL,
	"email" VARCHAR(50) NOT NULL
)

ALTER TABLE "campaign" 
ADD CONSTRAINT "fk_campaign_contact_id" 
FOREIGN KEY ("contact_id") 
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" 
ADD CONSTRAINT "fk_campaign_category_id" 
FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" 
ADD CONSTRAINT "fk_campaign_subcategory_id" 
FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

SELECT * FROM campaign;

SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM contacts;