# Delivery-Expenses-App

1) Download the repository
2)Create the database
3)Edit the credentials in the web.xml based on the created database
4) Build and run the Program



------Create the database-----


CREATE TABLE expenses (`ID` INT NOT NULL AUTO_INCREMENT, `ITEM` VARCHAR(100), `DESCRIPTION` VARCHAR(100), `ITEMSOURCE` VARCHAR(100), `PRICE` DOUBLE, `DATERECIEVED` VARCHAR(100), PRIMARY KEY (`ID`));
