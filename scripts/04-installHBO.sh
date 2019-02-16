ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/petrocracks.com/orderers/orderer.petrocracks.com/msp/tlscacerts/tlsca.petrocracks.com-cert.pem
CORE_PEER_LOCALMSPID="repsolMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/repsol.petrocracks.com/peers/peer0.repsol.petrocracks.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/repsol.petrocracks.com/users/Admin@repsol.petrocracks.com/msp
CORE_PEER_ADDRESS=peer0.repsol.petrocracks.com:7051
CHANNEL_NAME=petrochannel
CORE_PEER_TLS_ENABLED=true
peer chaincode install -n mycontract -v 1.0 -p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 >&log.txt
cat log.txt
