ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/petrocracks.com/orderers/orderer.petrocracks.com/msp/tlscacerts/tlsca.petrocracks.com-cert.pem
CORE_PEER_LOCALMSPID="cepsaMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/cepsa.petrocracks.com/peers/peer0.cepsa.petrocracks.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/cepsa.petrocracks.com/users/Admin@cepsa.petrocracks.com/msp
CORE_PEER_ADDRESS=peer0.cepsa.petrocracks.com:7051
CHANNEL_NAME=petrochannel
CORE_PEER_TLS_ENABLED=true
ORDERER_SYSCHAN_ID=syschain
peer channel create -o orderer.petrocracks.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/petrochannel.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA >&log.txt
cat log.txt
