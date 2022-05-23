common_config = {
  region = "{{ region }}"
}

environment = [
  {
    name = "{{ environment }}"
    terraform_state_bucket = "{{ bucket }}"
    terraform_lock_db = "{{ dynamodb }}"
  },
]
