variable "resource_groups" {
    description = "All resource groups"
    type        = list(string)
    default     = ["tinfoil_network_rg",
                 "tinfoil_compute_rg",
                 "tinfoil_storage_rg",
                 "tinfoil_images_rg",
                 "tinfoil_database_rg"]
}