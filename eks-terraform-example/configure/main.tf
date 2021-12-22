#--Build Namespaces
resource "kubernetes_namespace" "tinfoilcluster" {
    count    = length(var.namespace_names)
    metadata {
        name = var.namespace_names[count.index]
        labels = {
          name = var.namespace_names[count.index]
        }
    }
}
