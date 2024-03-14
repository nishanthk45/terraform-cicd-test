variable "mime_types" {
  default = {
    html  = "text/html"
    css   = "text/css"
    ttf   = "font/ttf"
    js    = "application/javascript"
    map   = "application/javascript"
    json  = "application/json"
    png   = "image/png"
    txt   = "text/plain"
    buildinfo = "text/plain"
    inv      = "application/octet-stream"
  }
}
