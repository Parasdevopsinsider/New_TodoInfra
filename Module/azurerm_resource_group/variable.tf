variable "rg_dev1" {
type = map(object({
    rg_name = string
    location = string
    managed_by = string
    tags = map(string)
}))
}
