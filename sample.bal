import wso2/choreo.sendemail;

import ballerina/http;

public function main() returns error? {
    http:Client httpEndpoint = check new (url = "https://api.getgeoapi.com");

    json getResponse = check httpEndpoint->get(path = "/v2/currency/convert?api_key=9e589099241dba17a6343ade4f11ddb3a19ce0c6&from=EUR&to=GBP&amount=10&format=json");
    json rate = check getResponse.rates.GBP.rate;
    json date = check getResponse.updated_date;
    string output = "EUR->GBP Rate" + date.toString() + "|" + rate.toString();
    sendemail:Client sendemailEp = check new ();
    string sendEmailResponse = check sendemailEp->sendEmail(recipient = "shailaja.g@infosys.com", subject = "EUR->GBP Rate", body = output);
}
