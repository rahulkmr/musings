// Copyright 2009 The Go Authors.  All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// igo is the beginning of a Go interpreter, building upon the facilities
// provided by go-eval and adding code completion and commands history thanks
// to go-readline.
package main

import (
	"bitbucket.org/binet/go-eval/pkg/eval"
	"bitbucket.org/binet/go-readline/pkg/readline"
	"flag"
	"fmt"
	"go/ast"
	"go/parser"
	"go/scanner"
	"go/token"
	"io/ioutil"
	"os"
	"path"
)

var fset = token.NewFileSet()
var filename = flag.String("f", "", "file to run")

func init() {
	readline.ParseAndBind("tab: complete")
	readline.ParseAndBind("set show-all-if-ambiguous On")
	//readline.SetAttemptedCompletionFunction()
	fmt.Println(`
********************************
** Interactive Go interpreter **
********************************

`)
	readline.ReadHistoryFile(path.Join(os.Getenv("HOME"), ".go.history"))
}

func atexit() {
	readline.WriteHistoryFile(path.Join(os.Getenv("HOME"), ".go.history"))
}

func main() {
	defer atexit()

	flag.Parse()
	w := eval.NewWorld()
	if *filename != "" {
		data, err := ioutil.ReadFile(*filename)
		if err != nil {
			fmt.Println(err.Error())
			os.Exit(1)
		}
		file, err := parser.ParseFile(fset, *filename, data, 0)
		if err != nil {
			fmt.Println(err.Error())
			os.Exit(1)
		}
		files := []*ast.File{file}
		code, err := w.CompilePackage(fset, files, "main")
		if err != nil {
			if list, ok := err.(scanner.ErrorList); ok {
				for _, e := range list {
					fmt.Println(e.Error())
				}
			} else {
				fmt.Println(err.Error())
			}
			os.Exit(1)
		}
		code, err = w.Compile(fset, "main()")
		if err != nil {
			fmt.Println(err.Error())
			os.Exit(1)
		}
		_, err = code.Run()
		if err != nil {
			fmt.Println(err.Error())
			os.Exit(1)
		}
		os.Exit(0)
	}

	var ierr error = nil // previous interpreter error
	ps1 := "igo> "
	ps2 := "...  "
	prompt := &ps1
	codelet := ""
	// initialize main package
	{
		codelet := "package main\n"
		f, err := parser.ParseFile(fset, "input", codelet, 0)
		code, err := w.CompilePackage(fset, []*ast.File{f}, "main")
		if err == nil {
			code.Run()
		}
	}
	for {
		line := readline.ReadLine(prompt)
		if line == nil {
			break //os.Exit(0)
		}
		if *line == "" || *line == ";" {
			// no more input
			prompt = &ps1
		}
		codelet += *line
		readline.AddHistory(codelet)
		code, err := w.Compile(fset, codelet+";")
		if err != nil {
			if ierr != nil && prompt == &ps1 {
				fmt.Println(err.Error())
				fmt.Printf("(error %T)\n", err)
				// reset state
				codelet = ""
				ierr = nil
				prompt = &ps1
				continue
			}
			// maybe multi-line command ?
			prompt = &ps2
			ierr = err
			codelet += "\n"
			continue
		}
		v, err := code.Run()
		if err != nil {
			fmt.Println(err.Error())
			fmt.Printf("(error %T)\n", err)
			codelet = ""
			continue
		}
		if v != nil {
			fmt.Println(v.String())
		}
		//	resetstate:
		// reset state
		codelet = ""
		ierr = nil
	}
}
