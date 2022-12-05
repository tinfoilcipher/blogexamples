resource "null_resource" "run_script" {
    #--Trigger should apply only when script changes
    triggers = {
        script_hash = filemd5(var.file_watch)
    }
    
    #--Run script when the configuration file has changed
    provisioner "local-exec" {
        command = "bash ./${var.script_location}"
    }
}