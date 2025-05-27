package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.math.BigInteger;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.RawTransactionManager;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.DefaultGasProvider;

import DAO.UserDAO;
import blockchain.BycoffeContact;


public class donate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String referrer = request.getHeader("referer");
		Web3j web3j;
	    Credentials credentials;
		String address = request.getParameter("address");
		String key = request.getParameter("key");
        BigInteger amount = new BigInteger(request.getParameter("amount"));
		String authId = request.getParameter("authId");
		try {
            web3j = Web3j.build(new HttpService("http://127.0.0.1:7545"));
            String AutherAddress= UserDAO.getAtherADDRESSById(authId);
            credentials = Credentials.create(key);
            
            String contractAddress = address; 

            BycoffeContact contract = BycoffeContact.load(
            		contractAddress,
                web3j,
                credentials,
                new DefaultGasProvider()
            );
            
            var companie = contract.setCompany("0x0aC77B7B2Bc4A6b8e1E70C363Bde50490f579Fed").send();
           var tipReceipt = contract.tipAuthor(AutherAddress,amount).send();
           response.sendRedirect(referrer);
            
        } catch (Exception e) {
            e.printStackTrace(); 
        }
	}

}
