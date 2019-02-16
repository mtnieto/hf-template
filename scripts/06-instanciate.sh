ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/petrocracks.com/orderers/orderer.petrocracks.com/msp/tlscacerts/tlsca.petrocracks.com-cert.pem
CORE_PEER_LOCALMSPID="cepsaMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/cepsa.petrocracks.com/peers/peer0.cepsa.petrocracks.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/cepsa.petrocracks.com/users/Admin@cepsa.petrocracks.com/msp
CORE_PEER_ADDRESS=peer0.cepsa.petrocracks.com:7051
CHANNEL_NAME=petrochannel
CORE_PEER_TLS_ENABLED=true


verifyResult () {
	if [ $1 -ne 0 ] ; then
		echo "!!!!!!!!!!!!!!! "$2" !!!!!!!!!!!!!!!!"
                echo "================== ERROR !!! FAILED to execute End-2-End Scenario =================="
		echo
   		exit 1
	fi
}
instantiateChaincode () {
	# while 'peer chaincode' command can get the orderer endpoint from the peer (if join was successful),
	# lets supply it directly as we know it using the "-o" option

		peer chaincode instantiate -o orderer.petrocracks.com:7050 --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n mycontract -v 1.0 -c '{"Args":["init","a","100","b","200"]}' >&log.txt

	res=$?
	cat log.txt
	verifyResult $res "Chaincode instantiation on PEER on channel '$CHANNEL_NAME' failed"
	echo "===================== Chaincode Instantiation on PEER on channel '$CHANNEL_NAME' is successful ===================== "
	echo
}

instantiateChaincode
