package rest.utils;


import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import util.Constants;

public class RESTClient {
    public static final Logger LOGGER = LoggerFactory.getLogger(RESTClient.class);
    private static final String BASE_PATH = "/RESTapi";

    static {
        RestAssured.baseURI = Constants.INV_URL;
        RestAssured.basePath = BASE_PATH;
        RestAssured.authentication = RestAssured.preemptive().basic("karamfilovs@gmail.com", "123456");
    }

    public static Response get(String endpoint, String clientId) {
        Response response = RestAssured.given().contentType(ContentType.JSON).log().all().get(endpoint + "/" + clientId);
        LOGGER.info("Get Response:" + response.getBody().asString());
        return response;
    }

    public static Response delete(String endpoint, String clientId) {
        Response response = RestAssured.given().contentType(ContentType.JSON).log().all().delete(endpoint + "/" + clientId);
        LOGGER.info("Delete Response:" + response.getBody().asString());
        return response;
    }

    public static Response post(String endpoint, String body) {
        Response response = RestAssured.given().body(body).contentType(ContentType.JSON).log().all().post(endpoint);
        LOGGER.info("Post Response:" + response.getBody().asString());
        return response;
    }

}
