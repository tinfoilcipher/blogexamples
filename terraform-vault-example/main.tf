resource "random_password" "azuresecrets" {
    length  = 32
    special = true
    count   = "${length(var.secret_keys)}"
}

resource "vault_generic_secret" "azuresecrets" {
    path      = "<kv_store_path>/<secret_name>"
    count     = "${length(var.secret_keys)}"
    data_json = <<EOT
    {
    "${var.secret_keys[0]}": "${random_password.azuresecrets.0.result}",
    "${var.secret_keys[1]}": "${random_password.azuresecrets.1.result}",
    "${var.secret_keys[2]}": "${random_password.azuresecrets.2.result}",
    "${var.secret_keys[3]}": "${random_password.azuresecrets.3.result}",
    "${var.secret_keys[4]}": "${random_password.azuresecrets.4.result}"
    }
    EOT
}
