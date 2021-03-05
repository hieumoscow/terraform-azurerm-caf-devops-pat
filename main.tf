provider "docker" {}
provider "external" {}
# https://medium.com/@Joachim8675309/docker-the-terraform-way-a7c16b5f59ed
resource "docker_container" "patgen" {
  name    = "terraformpatgen"
  image   = "hieunhu/azdopatgenerator:latest"
  restart = "no"
  env = [
    "VSTSPATGEN_ACCOUNT=hieunhutest",
    "VSTSPATGEN_TENANTID=hieunhutest.onmicrosoft.com",
    "VSTSPATGEN_CLIENTID=e89cc627-6462-4389-941c-705d02bcba4a",
    "VSTSPATGEN_CLIENTSECRET=P5Yk@Iqln-rM/H.7dJ3P3B=y7V9:=hMk",
    "VSTSPATGEN_USERNAME=admin@hieunhutest.onmicrosoft.com",
    "VSTSPATGEN_SCOPE=vso.work,vso.work_write",
    "VSTSPATGEN_PASSWORD=V565zqtg!",
    "VSTSPATGEN_EXPIRY=2018-05-13T07:44:12Z"
  ]
  #   command = ["dotnet", "VstsPatGenerator.dll", "-list"]
}


# output "container_logs" {
#   value = data.external.output
# }

# data "external" "output" {
#   #   program = ["bash", "-c", "azresourceshow--ids ${lookup(azurerm_template_deployment.ase.outputs, "id")}/capacities/virtualip--query '{internalIpAddress: internalIpAddress}' | jq-c"]
#   program    = ["docker", "exec", "terraformpatgen", "dotnet", "VstsPatGenerator.dll"]
#   depends_on = [docker_container.patgen]
# }

