package main

import (
	"os"

	"github.com/hsngerami/hsnburrowbeat/cmd"
)

func main() {
	if err := cmd.RootCmd.Execute(); err != nil {
		os.Exit(1)
	}
}
