package org.nuxeo.canal.plus.bean;

import java.util.Arrays;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jboss.seam.annotations.Name;
import org.nuxeo.ecm.core.api.ClientException;
import org.nuxeo.ecm.core.api.DocumentModel;

@Name("dateActionsBean")
public class DateActionsBean {
	
	public static final Log log = LogFactory.getLog(DateActionsBean.class);
	
	public String getTempsEcoule(DocumentModel doc, String propertyName) throws ClientException {
		Object value = doc.getPropertyValue(propertyName);
		if (value == null) { 
			return "N/A";
		}
		if (!(value instanceof GregorianCalendar)) {
			return "Bad selector " + propertyName + ". Waiting a GregorianCalendar for " + doc.toString();
		}
		long delay = (new GregorianCalendar()).getTime().getTime() - ((GregorianCalendar)value).getTime().getTime();
		int seconds = (int) (delay / 1000) % 60 ;
		int minutes = (int) ((delay / (1000*60)) % 60);
		int hours   = (int) ((delay / (1000*60*60)) % 24); 
		int days   = (int) (delay / (1000*60*60*24));
		
		StringBuilder result = new StringBuilder();
		
		if (days > 0) {
			result.append(String.format("%d jour(s)", days));
		}
		if (hours > 0) {
			if (result.length() > 0) {
				result.append(", ");
			}
			result.append(String.format("%d heure(s)", hours));
		}
		if (minutes > 0) {
			if (result.length() > 0) {
				result.append(", ");
			}
			result.append(String.format("%d min(s)", minutes));
		}
		if (seconds > 0 ) {
			if (result.length() > 0) {
				result.append(", ");
			}
			result.append(String.format("%d sec(s)", seconds));
		}
		
		return result.toString();
		
	}

	public String getTempsEcoule(DocumentModel doc, String propertyName, String states) throws ClientException {
		List<String> statesList = Arrays.asList(states.split(","));
		
		if (statesList.contains(doc.getCurrentLifeCycleState())) {
			return "N/A";
		}
		return getTempsEcoule(doc, propertyName);
	}

	public String getColor(DocumentModel doc, String propertyName, long limitForRed, long limitForYellow, long limitForBlue, long limitForGreen, String states) throws ClientException {
		List<String> statesList = Arrays.asList(states.split(","));
		
		if (statesList.contains(doc.getCurrentLifeCycleState())) {
			return "";
		}
		
		return getColor(doc, propertyName, limitForRed, limitForYellow, limitForBlue, limitForGreen);
		
	}

	public String getColor(DocumentModel doc, String propertyName, long limitForRed, long limitForYellow, long limitForBlue, long limitForGreen) throws ClientException {
		Object value = doc.getPropertyValue(propertyName);
		if (value == null) { 
			return "";
		}
		if (!(value instanceof GregorianCalendar)) {
			log.error("Bad selector " + propertyName + ". Waiting a GregorianCalendar for " + doc.toString());
			return "";
		}
		long delay = (new GregorianCalendar()).getTime().getTime() - ((GregorianCalendar)value).getTime().getTime();
		
		if (delay > limitForRed) {
			return "red";
		}

		if (delay > limitForYellow) {
			return "yellow";
		}

		if (delay > limitForBlue) {
			return "blue";
		}

		if (delay > limitForGreen) {
			return "green";
		}
		return "";

	}

}
