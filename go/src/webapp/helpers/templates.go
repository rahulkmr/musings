package helpers

import (
    "os"
    "net/http"
    "html/template"
    "path/filepath"
    s "webapp/settings"
)

var (
    tmpl *template.Template
    templateFiles = []string{}
)

func RenderTemplate(w http.ResponseWriter, tmpl_name string, data interface{}) {
    err := tmpl.ExecuteTemplate(w, tmpl_name, data)
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
    }
}

func parseTemplate(path string, info os.FileInfo, err error) error {
    ext := filepath.Ext(path)
    if ext == s.TemplateExt {
        templateFiles = append(templateFiles, path)
    }
    return nil
}

func init() {
    filepath.Walk("views", parseTemplate)
    tmpl = template.Must(template.ParseFiles(templateFiles...))
}
