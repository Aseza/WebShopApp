package controllers;

import generated.wsdl.GetCurrentExchangeRatesRequestBody;
import generated.wsdl.GetCurrentExchangeRatesResponseBody;
import generated.wsdl.GetExchangeRatesRequestBody;
import generated.wsdl.GetExchangeRatesResponseBody;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import classes.Order;
import classes.StringToXMLandSearch;
import classes.ExchangeGetter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXBElement;;

@org.springframework.stereotype.Controller
public class Controller {
	//Wiring configuration Bean
	@Autowired
	@Qualifier("ExchangeRateServiceBean")
	private ExchangeGetter eXchange;
	
	//Creating list of items, and an Exchange rate variable
	List<Order> allItems;
	private double rate;
	private final static String CURRENCY = "EUR";
	
	//wiring a new instance of the request and response Class
	@Autowired
	private GetCurrentExchangeRatesRequestBody request;
	private JAXBElement<GetCurrentExchangeRatesResponseBody> response;
	//creating two variables of the types of discounts
	private int discount2_3Value = 0;
	private int discountMegaPackValue = 0;
	
	//Log4j, for debugging
	private final Logger logger = Logger.getLogger(Controller.class);

	// Function that adds items to list, consumer will chose to buy one of
		// these.
		@ModelAttribute("itemList")
		public List<String> setItems() {
			List<String> items = new ArrayList<>();
			items.add("Salami");
			items.add("Toy Car");
			items.add("Cucumber");
			items.add("Chestnut");
			return items;
		}
		
	@RequestMapping("/")
	public ModelAndView hello(@ModelAttribute("itemList") List itemsList) {

		ModelAndView mv = new ModelAndView("index");
		mv.addObject("itemsList", itemsList);
		
		//setting the request + saving the response
		eXchange.setRequest(request);
		response = eXchange.getExchangeRates();
		
		//if Response is null => webservice error==> redirect to error page
		if (response == null){
			logger.error("response is null, very likely it's a web service error, usually internet connection unavailable");
		 return new ModelAndView("redirect:/errorPage");
		}
		else 
			rate = new StringToXMLandSearch().getRate(response.getValue().getGetCurrentExchangeRatesResult().getValue(), CURRENCY);
		
		return mv;
	}

	

	public void addToListToBeDisplayed(String name, int numberOfPieces, int price, String discountType) {
		int freeItemsValue;
		int total;
		int boxesNumber;

		// check if discount2_3 is available OR MegaPack is available with quantity less 12 pieces
		if (discountType.equals("discount2_3") || (discountType.equals("discountMegaPack_OR_discount2_3") && numberOfPieces < 12)) {

			freeItemsValue = (numberOfPieces / 3) * price;
			total = price * numberOfPieces;
			discount2_3Value += freeItemsValue;
			allItems.add(new Order(freeItemsValue, total, name, numberOfPieces));

			//if Mega pack is available
		} else {

			boxesNumber = numberOfPieces / 12;
			freeItemsValue = boxesNumber * 6000;
			total = numberOfPieces * price;
			discountMegaPackValue += freeItemsValue;
			allItems.add(new Order(freeItemsValue, total, name, numberOfPieces));
		}

	}

	//Mapping render page, outputting  results
	@RequestMapping("/render")
	public ModelAndView render(@RequestParam("Salami") int salami_numberOfPieces, @RequestParam("Toy Car") int toy_car_numberOfPieces,
			@RequestParam("Cucumber") int cucumber_numberOfPieces, @RequestParam("Chestnut") int chestnut_numberOfPieces) {
		ModelAndView mv = new ModelAndView("render");
		allItems = new ArrayList<Order>();
		//reset these values after each render
		discount2_3Value = 0;
		discountMegaPackValue = 0;
		
		//adding items to a list
		addToListToBeDisplayed("Salami", salami_numberOfPieces, 2000, "discount2_3");
		addToListToBeDisplayed("Toy Car", toy_car_numberOfPieces, 3000, "discount2_3");
		addToListToBeDisplayed("Cucumber", cucumber_numberOfPieces, 2800, "discountMegaPack_OR_discount2_3");
		addToListToBeDisplayed("Chestnut", chestnut_numberOfPieces, 1000, "discountMegaPack_OR_discount2_3");
		
		//adding items with some params to view
		mv.addObject("allItems", allItems);
		mv.addObject("rate", rate);
		mv.addObject("discount2_3Value", discount2_3Value);
		mv.addObject("discountMegaPackValue", discountMegaPackValue);

		return mv;
	}
	
	//error page
	@RequestMapping("errorPage")
	public String error(){
		return "errorPage";
		
	}
}
