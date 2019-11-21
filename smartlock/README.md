# Smartlock example
```
sudo apt install golang-go
go get github.com/fullstorydev/grpcurl
go install github.com/fullstorydev/grpcurl/cmd/grpcurl
export PATH=$PATH:$HOME:/go/bin:$HOME/iotex-arm/smartlock/bin
sudo iotex-arm/smartlock/bin/configGpio
switchlock 1
switchlock 0
check
```
