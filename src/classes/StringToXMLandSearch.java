package classes;

import java.io.StringReader;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.log4j.Logger;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
// Parse xml string and get rate.
public class StringToXMLandSearch {

	double rate = 0.0f;
	private final Logger logger = Logger.getLogger(StringToXMLandSearch.class);

	public double getRate(String xmlString, final String currency) {
		try {
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser saxParser = factory.newSAXParser();
			DefaultHandler handler = new DefaultHandler() {

				boolean euroFound = false;

				public void startElement(String uri, String localName, String qName, Attributes attributes)
						throws SAXException {

					if (qName.equalsIgnoreCase("Rate")) {
						for (int i = 0; i < attributes.getLength(); i++) {
							if (attributes.getValue(i).equals(currency))
								euroFound = true;
						}
					}
				}

				public void characters(char ch[], int start, int length) throws SAXException {
					if (euroFound) {
						rate = Double.parseDouble(new String(ch, start, length).replaceFirst(",", "."));
						euroFound = false;
					}
				}
			};

			saxParser.parse(new InputSource(new StringReader(xmlString)), handler);
			return rate;
		} catch (Exception e) {
			logger.error("Can't get the corret exchange rate, chosing a default value of 314, HUF==>EUR");
		}
		return 314f;
	}

}