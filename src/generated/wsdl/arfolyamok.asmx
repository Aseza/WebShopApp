<?xml version="1.0" encoding="utf-8"?><wsdl:definitions name="MNBArfolyamServiceSoapImpl" targetNamespace="http://tempuri.org/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:wsx="http://schemas.xmlsoap.org/ws/2004/09/mex" xmlns:i0="http://www.mnb.hu/webservices/" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" xmlns:wsa10="http://www.w3.org/2005/08/addressing" xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy" xmlns:wsap="http://schemas.xmlsoap.org/ws/2004/08/addressing/policy" xmlns:msc="http://schemas.microsoft.com/ws/2005/12/wsdl/contract" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:wsam="http://www.w3.org/2007/05/addressing/metadata" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://tempuri.org/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsaw="http://www.w3.org/2006/05/addressing/wsdl" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"><wsdl:import namespace="http://www.mnb.hu/webservices/" location="http://www.mnb.hu/arfolyamok.asmx?wsdl=wsdl0"/><wsdl:types/><wsdl:binding name="CustomBinding_MNBArfolyamServiceSoap" type="i0:MNBArfolyamServiceSoap"><soap:binding transport="http://schemas.xmlsoap.org/soap/http"/><wsdl:operation name="GetCurrencies"><soap:operation soapAction="http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetCurrencies" style="document"/><wsdl:input name="GetCurrenciesRequest"><soap:body use="literal"/></wsdl:input><wsdl:output name="GetCurrenciesResponse"><soap:body use="literal"/></wsdl:output><wsdl:fault name="StringFault"><soap:fault name="StringFault" use="literal"/></wsdl:fault></wsdl:operation><wsdl:operation name="GetCurrencyUnits"><soap:operation soapAction="http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetCurrencyUnits" style="document"/><wsdl:input name="GetCurrencyUnitsRequest"><soap:body use="literal"/></wsdl:input><wsdl:output name="GetCurrencyUnitsResponse"><soap:body use="literal"/></wsdl:output><wsdl:fault name="StringFault"><soap:fault name="StringFault" use="literal"/></wsdl:fault></wsdl:operation><wsdl:operation name="GetCurrentExchangeRates"><soap:operation soapAction="http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetCurrentExchangeRates" style="document"/><wsdl:input name="GetCurrentExchangeRatesRequest"><soap:body use="literal"/></wsdl:input><wsdl:output name="GetCurrentExchangeRatesResponse"><soap:body use="literal"/></wsdl:output><wsdl:fault name="StringFault"><soap:fault name="StringFault" use="literal"/></wsdl:fault></wsdl:operation><wsdl:operation name="GetDateInterval"><soap:operation soapAction="http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetDateInterval" style="document"/><wsdl:input name="GetDateIntervalRequest"><soap:body use="literal"/></wsdl:input><wsdl:output name="GetDateIntervalResponse"><soap:body use="literal"/></wsdl:output><wsdl:fault name="StringFault"><soap:fault name="StringFault" use="literal"/></wsdl:fault></wsdl:operation><wsdl:operation name="GetExchangeRates"><soap:operation soapAction="http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetExchangeRates" style="document"/><wsdl:input name="GetExchangeRatesRequest"><soap:body use="literal"/></wsdl:input><wsdl:output name="GetExchangeRatesResponse"><soap:body use="literal"/></wsdl:output><wsdl:fault name="StringFault"><soap:fault name="StringFault" use="literal"/></wsdl:fault></wsdl:operation><wsdl:operation name="GetInfo"><soap:operation soapAction="http://www.mnb.hu/webservices/MNBArfolyamServiceSoap/GetInfo" style="document"/><wsdl:input name="GetInfoRequest"><soap:body use="literal"/></wsdl:input><wsdl:output name="GetInfoResponse"><soap:body use="literal"/></wsdl:output><wsdl:fault name="StringFault"><soap:fault name="StringFault" use="literal"/></wsdl:fault></wsdl:operation></wsdl:binding><wsdl:service name="MNBArfolyamServiceSoapImpl"><wsdl:port name="CustomBinding_MNBArfolyamServiceSoap" binding="tns:CustomBinding_MNBArfolyamServiceSoap"><soap:address location="http://www.mnb.hu/arfolyamok.asmx"/></wsdl:port></wsdl:service></wsdl:definitions>