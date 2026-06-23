provider "google" {
  project = var.project_id
  region  = var.region
}

module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 12.3"

  project_id = var.project_id

  names  = ["first", "second"]
  prefix = "my-storage-2026"   # must be unique

  set_admin_roles = true
  admins = ["user:anjlikanaujiya02@gmail.com"]

  versioning = {
    first = true
  }

  bucket_admins = {
    second = "user:anjlikanaujiya02@gmail.com"
  }
}
