#!/bin/sh
contract=`cat ./build/__LogFileReceiver_sol_LogReceiver.bin`
contract="0x$contract"
account="0xFDE1aD0e810b95BF8441584169cc91d6b5133E5B"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from":"'"$account"'", "to":null, "gas":"0x24A22","gasPrice":"0x0", "data":"'"$contract"'"}], "id":1}' -H 'Content-Type: application/json' http://10.50.0.2:22000