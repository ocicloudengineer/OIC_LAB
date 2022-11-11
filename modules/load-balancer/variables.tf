variable "compartment_id" {
  type        = string
  description = "Compartment ID"
}

variable "load_balancer_name" {
  type        = string
  description = "Nome do Load Balancer"
}

variable "load_balancer_shape" {
  type        = string
  description = "Shape do Load Balancer"
}

variable "load_balancer_hostname" {
  type        = string
  description = "Hostname do Load Balancer"
}

variable "listener_name" {
  type        = list(any)
  description = "Nome do Listener"
  default     = []
}

variable "listener_ssl_name" {
  type        = list(any)
  description = "Nome do SSL Listener"
  default     = []
}

variable "listener_port" {
  type        = list(any)
  description = "Listener Port"
}

variable "listener_ssl_port" {
  type        = list(any)
  description = "Listener SSL Port"
  default     = []
}

variable "listener_protocol" {
  type        = list(any)
  description = "Listener Protocol"
  default     = []
}

variable "listener_ssl_protocol" {
  type        = list(any)
  description = "Listener SSL Protocol"
  default     = []
}

variable "backend_ip_address" {
  type        = list(any)
  description = "IP Address do Backend"
}

variable "backend_port" {
  type        = list(any)
  description = "Porta Backend"
}

variable "backend_ssl_port" {
  type        = list(any)
  description = "Porta SSL Backend"
  default     = []
}

variable "backend_set_name" {
  type        = list(any)
  description = ""
  default     = []
}

variable "backend_set_policy" {
  type        = string
  description = ""
}

variable "certificate_name" {
  type        = string
  default     = "SSL_Certificate"
  description = "Nome do Certificado"
}

variable "certificate" {
  type    = list(any)
  default = [""]
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = ""
}

variable "load_balancer_subnet_ids" {
  type    = list(any)
  default = [""]
}

variable "listener_ssl_verify_depth" {
  type    = string
  default = "1"
}

variable "listener_ssl_verify_peer_certificate" {
  type    = string
  default = "false"
}

variable "load_balancer_ip_mode" {
  type        = string
  default     = "IPV4"
  description = "Modo IP do Load Balancer"
}

variable "load_balancer_is_private" {
  type        = bool
  default     = true
  description = "Load Balancer é Privado."
}

variable "load_balancer_network_security_group_ids" {
  type        = list(any)
  default     = []
  description = "Lista de Security Groups"
}

variable "nosecure_update_checker" {
  type        = list(any)
  default     = []
  description = ""
}

variable "secure_update_checker" {
  type        = list(any)
  default     = []
  description = ""
}


variable "certificate_ca_certificate" {
  type        = string
  default     = ""
  description = "Conteudo do Certificado CA"
}

variable "backend_certificate" {
  type        = bool
  default     = false
  description = "Se o certificado será adicionado ao backend"
}


variable "certificate_passphrase" {
  type        = string
  default     = ""
  description = "Password do Certificado"
}

variable "certificate_private_key" {
  type        = string
  default     = ""
  description = "Certificado Privado"
}

variable "certificate_public_certificate" {
  type        = string
  default     = ""
  description = "Certificado Publico"
}

variable "listener_idle_timeout" {
  type        = string
  default     = "60"
  description = "Idle Timeout"
}

variable "backend_backup" {
  type    = bool
  default = false
}

variable "backend_drain" {
  type    = bool
  default = false
}

variable "backend_offline" {
  type    = bool
  default = false
}

variable "backend_weight" {
  type    = number
  default = 1
}

variable "backend_set_protocol" {
  type        = list(any)
  description = "Backend Set Protocol"
  default     = []
}

variable "backend_set_interval_ms" {
  type    = string
  default = "60"
}

variable "backend_set_port" {
  type    = list(any)
  default = [""]
}

variable "backend_set_ssl_port" {
  type    = list(any)
  default = [""]
}

variable "backend_set_body_regex" {
  type    = string
  default = ""
}

variable "backend_set_retries" {
  type    = string
  default = "3"
}

variable "backend_set_return_code" {
  type    = string
  default = "200"
}

variable "backend_set_timeout_in_millis" {
  type    = number
  default = 1000
}

variable "backend_set_url_path" {
  type    = string
  default = ""
}

variable "backend_set_cookie_name" {
  type    = string
  default = ""
}

variable "backend_set_disable_fallback" {
  type    = string
  default = "false"
}

variable "backend_set_domain" {
  type    = string
  default = ""
}

variable "backend_set_is_http_only" {
  type    = string
  default = "false"
}

variable "backend_set_is_secure" {
  type    = string
  default = "false"
}

variable "backend_set_max_age_in_seconds" {
  type    = string
  default = "100"
}

variable "backend_set_path" {
  type    = string
  default = ""
}

variable "backend_set_ssl_verify_depth" {
  type    = string
  default = "1"
}

variable "backend_set_ssl_verify_peer_certificate" {
  type    = string
  default = "false"
}

variable "path_route_enable" {
  type    = bool
  default = false
}

variable "path_route_set_name" {
  type        = string
  default     = ""
  description = "Path Route Set Name"
}

variable "path_route_set" {
  type = list(any)
}

variable "rule_set_enable" {
  type    = bool
  default = false
}

variable "rule_set_items" {
  type    = list(any)
  default = []
}

variable "rule_set_name" {
  type    = string
  default = ""
}

variable "common_tags_values" {
  description = "Mapa com as tags que serão aplicadas na instnacia."
  type        = map(string)
  default = {
    "Environment"  = ""
    "Owner"        = ""
    "Creator"      = ""
    "Label"        = ""
    "SO"           = ""
    "Project"      = ""
    "Organization" = ""
    "Service"      = ""
    "CostCenter"   = ""
    "IDContabil"   = ""
    "Region"       = ""
    "Namespace"    = "REQUIRED"
  }
}

/*variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}*/
