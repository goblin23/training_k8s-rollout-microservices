//go:build fail
// +build fail

package main

func init() {
	shouldDie = true
}
