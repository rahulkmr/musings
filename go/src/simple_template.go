package main

import (
    "text/template"
    "os"
    "log"
)

func main() {
    const letter = `
Dear {{ .Name }},
{{ if .Attended }}
It was a pleasure to see you at the wedding.
{{ else }}
It is a shame you couldn't make it to the wedding.
{{ end }}
{{ with .Gift }}Thank you for the lovely {{ . }}.{{ end }}
Best wishes,
Josie
`
    type Rcpt struct {
        Name, Gift string
        Attended bool
    }
    var rcpts = []Rcpt{
        {"Aunt Mildred", "bone china tea set", true},
        {"Uncle John", "moleskin pants", false},
        {"Cousin Rodney", "", false},
    }
    t := template.Must(template.New("letter").Parse(letter))
    for _, r := range rcpts {
        err := t.Execute(os.Stdout, r)
        if err != nil {
            log.Println("executing template: ", err)
        }
    }
}
