output bigip_1_host {
  value = "${module.bigip_1.f5_username}@${module.bigip_1.mgmtPublicIP}"
  
}
output bigip_2_host {
  value = "${module.bigip_2.f5_username}@${module.bigip_2.mgmtPublicIP}"
  
}
output bigip_username {
  value = "${module.bigip_2.f5_username}"
  
}
output bigip_1_mgmtIP {
  value = "https://${module.bigip_1.mgmtPublicIP}"
  
}
output bigip_2_mgmtIP {
  value = "https://${module.bigip_2.mgmtPublicIP}"
  
}
output bigip_password {
  value = module.bigip_2.bigip_password
  sensitive = true
}
output webapp_external_IP {
  value = "http://${google_compute_forwarding_rule.fwd.ip_address}"
  
}
output webapp_internal_IP {
  value = "http://172.16.100.129"
  
}
