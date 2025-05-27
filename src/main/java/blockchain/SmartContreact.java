package blockchain;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.Utf8String;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.BaseEventResponse;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple3;
import org.web3j.tuples.generated.Tuple4;
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
public class SmartContreact extends Contract {
    public static final String BINARY = "60806040525f5f553480156011575f5ffd5b50610c188061001f5f395ff3fe608060405234801561000f575f5ffd5b506004361061004a575f3560e01c806380f052d81461004e578063c1e4158614610081578063d4868baa1461009d578063e8824299146100cf575b5f5ffd5b6100686004803603810190610063919061056a565b6100ed565b6040516100789493929190610653565b60405180910390f35b61009b600480360381019061009691906107d0565b610244565b005b6100b760048036038101906100b2919061056a565b610363565b6040516100c693929190610846565b60405180910390f35b6100d7610521565b6040516100e49190610889565b60405180910390f35b6001602052805f5260405f205f91509050805f015490806001018054610112906108cf565b80601f016020809104026020016040519081016040528092919081815260200182805461013e906108cf565b80156101895780601f1061016057610100808354040283529160200191610189565b820191905f5260205f20905b81548152906001019060200180831161016c57829003601f168201915b50505050509080600201805461019e906108cf565b80601f01602080910402602001604051908101604052809291908181526020018280546101ca906108cf565b80156102155780601f106101ec57610100808354040283529160200191610215565b820191905f5260205f20905b8154815290600101906020018083116101f857829003601f168201915b505050505090806003015f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16905084565b5f5f8154809291906102559061092c565b919050555060405180608001604052805f5481526020018381526020018281526020013373ffffffffffffffffffffffffffffffffffffffff1681525060015f5f5481526020019081526020015f205f820151815f015560208201518160010190816102c19190610b13565b5060408201518160020190816102d79190610b13565b506060820151816003015f6101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055509050507f1514f95cd8320176cd4de8b67a3494e77b3dfa3c5d9c7698523216784e3559265f548383336040516103579493929190610653565b60405180910390a15050565b6060805f5f60015f8681526020019081526020015f206040518060800160405290815f820154815260200160018201805461039d906108cf565b80601f01602080910402602001604051908101604052809291908181526020018280546103c9906108cf565b80156104145780601f106103eb57610100808354040283529160200191610414565b820191905f5260205f20905b8154815290600101906020018083116103f757829003601f168201915b5050505050815260200160028201805461042d906108cf565b80601f0160208091040260200160405190810160405280929190818152602001828054610459906108cf565b80156104a45780601f1061047b576101008083540402835291602001916104a4565b820191905f5260205f20905b81548152906001019060200180831161048757829003601f168201915b50505050508152602001600382015f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815250509050806020015181604001518260600151935093509350509193909250565b5f5481565b5f604051905090565b5f5ffd5b5f5ffd5b5f819050919050565b61054981610537565b8114610553575f5ffd5b50565b5f8135905061056481610540565b92915050565b5f6020828403121561057f5761057e61052f565b5b5f61058c84828501610556565b91505092915050565b61059e81610537565b82525050565b5f81519050919050565b5f82825260208201905092915050565b8281835e5f83830152505050565b5f601f19601f8301169050919050565b5f6105e6826105a4565b6105f081856105ae565b93506106008185602086016105be565b610609816105cc565b840191505092915050565b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f61063d82610614565b9050919050565b61064d81610633565b82525050565b5f6080820190506106665f830187610595565b818103602083015261067881866105dc565b9050818103604083015261068c81856105dc565b905061069b6060830184610644565b95945050505050565b5f5ffd5b5f5ffd5b7f4e487b71000000000000000000000000000000000000000000000000000000005f52604160045260245ffd5b6106e2826105cc565b810181811067ffffffffffffffff82111715610701576107006106ac565b5b80604052505050565b5f610713610526565b905061071f82826106d9565b919050565b5f67ffffffffffffffff82111561073e5761073d6106ac565b5b610747826105cc565b9050602081019050919050565b828183375f83830152505050565b5f61077461076f84610724565b61070a565b9050828152602081018484840111156107905761078f6106a8565b5b61079b848285610754565b509392505050565b5f82601f8301126107b7576107b66106a4565b5b81356107c7848260208601610762565b91505092915050565b5f5f604083850312156107e6576107e561052f565b5b5f83013567ffffffffffffffff81111561080357610802610533565b5b61080f858286016107a3565b925050602083013567ffffffffffffffff8111156108305761082f610533565b5b61083c858286016107a3565b9150509250929050565b5f6060820190508181035f83015261085e81866105dc565b9050818103602083015261087281856105dc565b90506108816040830184610644565b949350505050565b5f60208201905061089c5f830184610595565b92915050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52602260045260245ffd5b5f60028204905060018216806108e657607f821691505b6020821081036108f9576108f86108a2565b5b50919050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52601160045260245ffd5b5f61093682610537565b91507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8203610968576109676108ff565b5b600182019050919050565b5f819050815f5260205f209050919050565b5f6020601f8301049050919050565b5f82821b905092915050565b5f600883026109cf7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff82610994565b6109d98683610994565b95508019841693508086168417925050509392505050565b5f819050919050565b5f610a14610a0f610a0a84610537565b6109f1565b610537565b9050919050565b5f819050919050565b610a2d836109fa565b610a41610a3982610a1b565b8484546109a0565b825550505050565b5f5f905090565b610a58610a49565b610a63818484610a24565b505050565b5b81811015610a8657610a7b5f82610a50565b600181019050610a69565b5050565b601f821115610acb57610a9c81610973565b610aa584610985565b81016020851015610ab4578190505b610ac8610ac085610985565b830182610a68565b50505b505050565b5f82821c905092915050565b5f610aeb5f1984600802610ad0565b1980831691505092915050565b5f610b038383610adc565b9150826002028217905092915050565b610b1c826105a4565b67ffffffffffffffff811115610b3557610b346106ac565b5b610b3f82546108cf565b610b4a828285610a8a565b5f60209050601f831160018114610b7b575f8415610b69578287015190505b610b738582610af8565b865550610bda565b601f198416610b8986610973565b5f5b82811015610bb057848901518255600182019150602085019450602081019050610b8b565b86831015610bcd5784890151610bc9601f891682610adc565b8355505b6001600288020188555050505b50505050505056fea2646970667358221220e9ce8c60c5aaa0d69ff84b2fe5bf14da2e8b5a6d84192f19fa49b71b328f4a9764736f6c634300081e0033\n";

    private static String librariesLinkedBinary;

    public static final String FUNC_BLOGCOUNT = "blogCount";

    public static final String FUNC_BLOGS = "blogs";

    public static final String FUNC_CREATEBLOG = "createBlog";

    public static final String FUNC_GETBLOG = "getBlog";

    public static final Event BLOGCREATED_EVENT = new Event("BlogCreated", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Address>() {}));
    ;

    @Deprecated
    protected SmartContreact(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected SmartContreact(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected SmartContreact(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected SmartContreact(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public List<BlogCreatedEventResponse> getBlogCreatedEvents(TransactionReceipt receipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(BLOGCREATED_EVENT, receipt);
        ArrayList<BlogCreatedEventResponse> responses = new ArrayList<>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            BlogCreatedEventResponse typedResponse = new BlogCreatedEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.id = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.title = (String) eventValues.getNonIndexedValues().get(1).getValue();
            typedResponse.content = (String) eventValues.getNonIndexedValues().get(2).getValue();
            typedResponse.author = (String) eventValues.getNonIndexedValues().get(3).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public static BlogCreatedEventResponse getBlogCreatedEventFromLog(Log log) {
        Contract.EventValuesWithLog eventValues = staticExtractEventParametersWithLog(BLOGCREATED_EVENT, log);
        BlogCreatedEventResponse typedResponse = new BlogCreatedEventResponse();
        typedResponse.log = log;
        typedResponse.id = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
        typedResponse.title = (String) eventValues.getNonIndexedValues().get(1).getValue();
        typedResponse.content = (String) eventValues.getNonIndexedValues().get(2).getValue();
        typedResponse.author = (String) eventValues.getNonIndexedValues().get(3).getValue();
        return typedResponse;
    }

    public Flowable<BlogCreatedEventResponse> blogCreatedEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(log -> getBlogCreatedEventFromLog(log));
    }

    public Flowable<BlogCreatedEventResponse> blogCreatedEventFlowable(
            DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(BLOGCREATED_EVENT));
        return blogCreatedEventFlowable(filter);
    }

    public RemoteFunctionCall<BigInteger> blogCount() {
        final Function function = new Function(FUNC_BLOGCOUNT, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteFunctionCall<Tuple4<BigInteger, String, String, String>> blogs(BigInteger param0) {
        final Function function = new Function(FUNC_BLOGS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Address>() {}));
        return new RemoteFunctionCall<Tuple4<BigInteger, String, String, String>>(function,
                new Callable<Tuple4<BigInteger, String, String, String>>() {
                    @Override
                    public Tuple4<BigInteger, String, String, String> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple4<BigInteger, String, String, String>(
                                (BigInteger) results.get(0).getValue(), 
                                (String) results.get(1).getValue(), 
                                (String) results.get(2).getValue(), 
                                (String) results.get(3).getValue());
                    }
                });
    }

    public RemoteFunctionCall<TransactionReceipt> createBlog(String _title, String _content) {
        final Function function = new Function(
                FUNC_CREATEBLOG, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Utf8String(_title), 
                new org.web3j.abi.datatypes.Utf8String(_content)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<Tuple3<String, String, String>> getBlog(BigInteger _id) {
        final Function function = new Function(FUNC_GETBLOG, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_id)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Address>() {}));
        return new RemoteFunctionCall<Tuple3<String, String, String>>(function,
                new Callable<Tuple3<String, String, String>>() {
                    @Override
                    public Tuple3<String, String, String> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<String, String, String>(
                                (String) results.get(0).getValue(), 
                                (String) results.get(1).getValue(), 
                                (String) results.get(2).getValue());
                    }
                });
    }

    @Deprecated
    public static SmartContreact load(String contractAddress, Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        return new SmartContreact(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static SmartContreact load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new SmartContreact(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static SmartContreact load(String contractAddress, Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        return new SmartContreact(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static SmartContreact load(String contractAddress, Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new SmartContreact(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static RemoteCall<SmartContreact> deploy(Web3j web3j, Credentials credentials,
            ContractGasProvider contractGasProvider) {
        return deployRemoteCall(SmartContreact.class, web3j, credentials, contractGasProvider, getDeploymentBinary(), "");
    }

    @Deprecated
    public static RemoteCall<SmartContreact> deploy(Web3j web3j, Credentials credentials,
            BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(SmartContreact.class, web3j, credentials, gasPrice, gasLimit, getDeploymentBinary(), "");
    }

    public static RemoteCall<SmartContreact> deploy(Web3j web3j,
            TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(SmartContreact.class, web3j, transactionManager, contractGasProvider, getDeploymentBinary(), "");
    }

    @Deprecated
    public static RemoteCall<SmartContreact> deploy(Web3j web3j,
            TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(SmartContreact.class, web3j, transactionManager, gasPrice, gasLimit, getDeploymentBinary(), "");
    }

    

    private static String getDeploymentBinary() {
        if (librariesLinkedBinary != null) {
            return librariesLinkedBinary;
        } else {
            return BINARY;
        }
    }

    public static class BlogCreatedEventResponse extends BaseEventResponse {
        public BigInteger id;

        public String title;

        public String content;

        public String author;
    }
}
