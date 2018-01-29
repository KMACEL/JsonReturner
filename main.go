package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	var filePath string
	var jsonName string
	args := os.Args[1:]
	for index, argsElem := range args {
		if argsElem == "-p" {
			//	fmt.Println("File Path : ", args[index+1])
			filePath = args[index+1]
		}
		if argsElem == "-n" {
			//		fmt.Println("Name :", args[index+1])
			jsonName = args[index+1]
		}
	}
	var jsonVariable map[string]interface{}
	jsonData, _ := ioutil.ReadFile(filePath)
	//	fmt.Printf("Full JSON Data : ", string(jsonData))

	json.Unmarshal(jsonData, &jsonVariable)
	fmt.Println(jsonVariable[jsonName])

}
