package API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class GeoLocator {
	public static String getLocation(String ip) {
        try {
            //String accessKey = "e28134592e685aa00f1d287b8e4f6d34";
            String accessKey = "API-KEY";
            String urlStr = "http://api.ipapi.com/api/" + ip + "?access_key=" + accessKey;

			URL url = new URL(urlStr);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            System.out.println(response.toString());
            if (accessKey=="API-KEY") {
            return "{\"ip\": \"197.200.233.77\", \"type\": \"ipv4\", \"continent_code\": \"AF\", \"continent_name\": \"Africa\", \"country_code\": \"DZ\", \"country_name\": \"Algeria\", \"region_code\": \"01\", \"region_name\": \"Adrar\", \"city\": \"Ben Aknoun\", \"zip\": \"16306\", \"latitude\": 36.766998291015625, \"longitude\": 3.0169999599456787, \"msa\": null, \"dma\": null, \"radius\": \"0\", \"ip_routing_type\": \"fixed\", \"connection_type\": \"dsl\", \"location\": {\"geoname_id\": 2505015, \"capital\": \"Algiers\", \"languages\": [{\"code\": \"ar\", \"name\": \"Arabic\", \"native\": \"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629\"}], \"country_flag\": \"https://assets.ipstack.com/flags/dz.svg\", \"country_flag_emoji\": \"\\ud83c\\udde9\\ud83c\\uddff\", \"country_flag_emoji_unicode\": \"U+1F1E9 U+1F1FF\", \"calling_code\": \"213\", \"is_eu\": false}}\n";
            
            }

            return response.toString();

        } catch (Exception e) {
        	return null;
             }
    }
}
