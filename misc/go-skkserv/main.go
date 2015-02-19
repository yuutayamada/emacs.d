// https://github.com/akiym/go-skkserv
// https://www.google.co.jp/ime/cgiapi.html
package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"net/http"
	"net/url"

	"code.google.com/p/mahonia"
	"github.com/akiym/go-skkserv"
)

// From skk-server.el
// skkserv の起動オプションは下記の通り。
//     skkserv [-d] [-p NNNN] [JISHO]
//     `-d'     ディバッグ・モード
//     `-p NNNN'     通信用のポート番号としてNNNNを使う.
//     `~/JISYO'     ~/JISYOを辞書として利用.
var port string

func init() {
	p := flag.String("p", "55200", "Port number")
	debug := flag.Bool("d", false, "debug flag")
	flag.Parse()
	if *debug {
		fmt.Println("Debug...")
	}
	port = ":" + string(*p)
}

type GoogleIMESKK struct{}

func (s *GoogleIMESKK) Request(text string) ([]string, error) {
	words, err := Transliterate(text)
	if err != nil {
		return nil, err
	}
	return words, nil
}

// You can specify euc-jp as well.
var enc = mahonia.NewEncoder("utf8")

func Transliterate(text string) (words []string, err error) {
	text = enc.ConvertString(text)
	v := url.Values{"langpair": {"ja-Hira|ja"}, "text": {text + ","}}
	resp, err := http.Get("http://www.google.com/transliterate?" + v.Encode())
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	dec := json.NewDecoder(resp.Body)
	var w [][]interface{}
	if err := dec.Decode(&w); err != nil {
		return nil, err
	}
	for _, v := range w[0][1].([]interface{}) {
		word := v.(string)
		result, ok := enc.ConvertStringOK(word)
		if ok {
			words = append(words, result)
		}
	}
	return words, nil
}

func main() {
	var server = skkserv.NewServer(port, &GoogleIMESKK{})
	server.Run()
}
