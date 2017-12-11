package classes;

import generated.wsdl.GetCurrentExchangeRatesRequestBody;
import generated.wsdl.GetCurrentExchangeRatesResponseBody;


import javax.xml.bind.JAXBElement;

import org.apache.log4j.Logger;
import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import controllers.Controller;

public class ExchangeGetter extends WebServiceGatewaySupport {
	GetCurrentExchangeRatesRequestBody request = null;
	JAXBElement<GetCurrentExchangeRatesResponseBody> response;
	
	//Logger
	private final Logger logger = Logger.getLogger(ExchangeGetter.class);

	@SuppressWarnings("unchecked")
	public JAXBElement<GetCurrentExchangeRatesResponseBody> getExchangeRates() {
		try{
		response = (JAXBElement<GetCurrentExchangeRatesResponseBody>) getWebServiceTemplate().marshalSendAndReceive(
				"http://www.mnb.hu/arfolyamok.asmx", request,
				new SoapActionCallback("http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetCurrentExchangeRates"));
		}catch(Exception e){
			logger.info("Intentionally returning a null response, will be caught in controller");
		}
		return response;
	}

	public GetCurrentExchangeRatesRequestBody getRequest() {
		return request;
	}

	public void setRequest(GetCurrentExchangeRatesRequestBody request) {
		this.request = request;
	}

}