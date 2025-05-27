package blockchain;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collections;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/LFDT-web3j/web3j/tree/main/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 1.7.0.
 */
@SuppressWarnings("rawtypes")
public class BycoffeContact extends Contract {
    public static final String BINARY = "6080604052348015600f57600080fd5b50610aa48061001f6000396000f3fe60806040526004361061004a5760003560e01c806314435ac81461004f5780636904c94d1461006b5780638da5cb5b14610096578063a6c3e6b9146100c1578063a8db2445146100ec575b600080fd5b610069600480360381019061006491906105ed565b610115565b005b34801561007757600080fd5b50610080610467565b60405161008d919061063b565b60405180910390f35b3480156100a257600080fd5b506100ab61048d565b6040516100b89190610665565b60405180910390f35b3480156100cd57600080fd5b506100d66104b3565b6040516100e3919061063b565b60405180910390f35b3480156100f857600080fd5b50610113600480360381019061010e91906105ed565b6104d7565b005b600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1603610184576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161017b906106dd565b60405180910390fd5b600073ffffffffffffffffffffffffffffffffffffffff16600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1603610215576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161020c90610749565b60405180910390fd5b60003411610258576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161024f906107b5565b60405180910390fd5b806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555060006064601e346102a9919061080e565b6102b3919061087f565b9050600081346102c391906108b0565b905060008060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168260405161030c90610915565b60006040518083038185875af1925050503d8060008114610349576040519150601f19603f3d011682016040523d82523d6000602084013e61034e565b606091505b5050905080610392576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161038990610976565b60405180910390fd5b6000600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16846040516103da90610915565b60006040518083038185875af1925050503d8060008114610417576040519150601f19603f3d011682016040523d82523d6000602084013e61041c565b606091505b5050905080610460576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610457906109e2565b60405180910390fd5b5050505050565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1603610546576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161053d90610a4e565b60405180910390fd5b80600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050565b600080fd5b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b60006105ba8261058f565b9050919050565b6105ca816105af565b81146105d557600080fd5b50565b6000813590506105e7816105c1565b92915050565b6000602082840312156106035761060261058a565b5b6000610611848285016105d8565b91505092915050565b60006106258261058f565b9050919050565b6106358161061a565b82525050565b6000602082019050610650600083018461062c565b92915050565b61065f816105af565b82525050565b600060208201905061067a6000830184610656565b92915050565b600082825260208201905092915050565b7f496e76616c696420617574686f72206164647265737300000000000000000000600082015250565b60006106c7601683610680565b91506106d282610691565b602082019050919050565b600060208201905081810360008301526106f6816106ba565b9050919050565b7f436f6d70616e792061646472657373206e6f7420736574000000000000000000600082015250565b6000610733601783610680565b915061073e826106fd565b602082019050919050565b6000602082019050818103600083015261076281610726565b9050919050565b7f596f752063616e2774207469702077697468203020616d6f756e740000000000600082015250565b600061079f601b83610680565b91506107aa82610769565b602082019050919050565b600060208201905081810360008301526107ce81610792565b9050919050565b6000819050919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b6000610819826107d5565b9150610824836107d5565b9250828202610832816107d5565b91508282048414831517610849576108486107df565b5b5092915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601260045260246000fd5b600061088a826107d5565b9150610895836107d5565b9250826108a5576108a4610850565b5b828204905092915050565b60006108bb826107d5565b91506108c6836107d5565b92508282039050818111156108de576108dd6107df565b5b92915050565b600081905092915050565b50565b60006108ff6000836108e4565b915061090a826108ef565b600082019050919050565b6000610920826108f2565b9150819050919050565b7f4661696c656420746f2073656e642074697020746f20617574686f7200000000600082015250565b6000610960601c83610680565b915061096b8261092a565b602082019050919050565b6000602082019050818103600083015261098f81610953565b9050919050565b7f4661696c656420746f2073656e642074617820746f20636f6d70616e79000000600082015250565b60006109cc601d83610680565b91506109d782610996565b602082019050919050565b600060208201905081810360008301526109fb816109bf565b9050919050565b7f496e76616c696420636f6d70616e792061646472657373000000000000000000600082015250565b6000610a38601783610680565b9150610a4382610a02565b602082019050919050565b60006020820190508181036000830152610a6781610a2b565b905091905056fea26469706673582212208165b317b4c1e89598d868c72f16ccaf42dc615d7b1271e6e5c84d5a5423b52964736f6c634300081e0033\n";

    private static String librariesLinkedBinary;

    public static final String FUNC_AUTHOR = "author";

    public static final String FUNC_COMPANY = "company";

    public static final String FUNC_OWNER = "owner";

    public static final String FUNC_SETCOMPANY = "setCompany";

    public static final String FUNC_TIPAUTHOR = "tipAuthor";

    @Deprecated
    protected BycoffeContact(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected BycoffeContact(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected BycoffeContact(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected BycoffeContact(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<String> author() {
        final Function function = new Function(FUNC_AUTHOR, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<String> company() {
        final Function function = new Function(FUNC_COMPANY, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<String> owner() {
        final Function function = new Function(FUNC_OWNER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setCompany(String _company) {
        final Function function = new Function(
                FUNC_SETCOMPANY, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, _company)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> tipAuthor(String _author, BigInteger weiValue) {
        final Function function = new Function(
                FUNC_TIPAUTHOR, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, _author)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    @Deprecated
    public static BycoffeContact load(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        return new BycoffeContact(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static BycoffeContact load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new BycoffeContact(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static BycoffeContact load(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        return new BycoffeContact(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static BycoffeContact load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new BycoffeContact(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static RemoteCall<BycoffeContact> deploy(Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        return deployRemoteCall(BycoffeContact.class, web3j, credentials, contractGasProvider, getDeploymentBinary(), "");
    }

    @Deprecated
    public static RemoteCall<BycoffeContact> deploy(Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(BycoffeContact.class, web3j, credentials, gasPrice, gasLimit, getDeploymentBinary(), "");
    }

    public static RemoteCall<BycoffeContact> deploy(Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(BycoffeContact.class, web3j, transactionManager, contractGasProvider, getDeploymentBinary(), "");
    }

    @Deprecated
    public static RemoteCall<BycoffeContact> deploy(Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(BycoffeContact.class, web3j, transactionManager, gasPrice, gasLimit, getDeploymentBinary(), "");
    }

    

    private static String getDeploymentBinary() {
        if (librariesLinkedBinary != null) {
            return librariesLinkedBinary;
        } else {
            return BINARY;
        }
    }
}
