# WebShopApp
	1)This is a web app that uses a WebService (SOAP Protocol) to get and exchange rate value and uses it to convert 
	HUF to EUR.
	2)The key factor is that we have 4 types of products, the first two (Salami & Toy car) have only one 
	discount possible and that’s the 2-3 type. which means if you get two pieces you'll get the third for free
	while the latter two (Chestnut & cucumber) have two discounts possible, the 2-3 type, and another type called 
	MegaPack where you get a discount of 6000 HUF in the case of buying 12 pieces, 
	3)I’ve used the method “GetCurrentExchangeRate” for it’s simplicity, I noticed that the response is just a String,
	and not full XML tags, so it can’t be parsed by the JAXB marshaller, that’s why 
	I created another class(StringToXMLAndSearch) to parse the string and retrieve the correct rate, EUR.
	4)I used log4j for debugging purposes
	5)there is a CheckBox at the bottom of the ‘render’ page to show the corresponding values in EUR.
	6) Focus was more on functionality, less on design, second page is not quite responsive.
  7) prices are distributed as following :<br/>
+----------+----------+-------------------+<br/>
|#Name    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #Price &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   | #MegaPack Discount <br/>
+----------+----------+-------------------+<br/>
|Salami   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2000 HUF|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No  <br/>
+----------+----------+-------------------+<br/>
| Toy Car  &nbsp;&nbsp;&nbsp; | 3000 HUF |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No<br/>
+----------+----------+-------------------+<br/>
| Cucumber | 2800 HUF|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yes    <br/>
+----------+----------+-------------------+<br/>
| Chestnut&nbsp; | 1000 HUF | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes <br/>
+----------+----------+-------------------+<br/>
