terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
  token                    = "y0_AgAEA7qgw6hpAATuwQAAAADhHktlNS5m9vmiTDixzOpkes6jpu1m748"
  cloud_id                 = "b1g5n126gr584nnqqt2h"
  folder_id                = "b1gddp1e85vunop76vcr"
}
