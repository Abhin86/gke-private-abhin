resource "google_compute_instance" "private_vm" {
  name         = var.vm_name
  machine_type = var.machine_type 
  zone         = var.zone
  tags         = ["private-vm"]

  boot_disk {
    initialize_params{
      image = var.vm_image
    }
  }
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    network = var.vpc_name
    subnetwork = var.subnet_names[0]
  }
  
  service_account {
    email  = "kube12@kubernetes2-410610.iam.gserviceaccount.com" #var.account[1]
    scopes = ["cloud-platform"]
  }
}
