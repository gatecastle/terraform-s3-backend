provider "aws" {
  # The security credentials for AWS Account A.
  access_key = "{{ access_key }}"
  secret_key = "{{ secret_key }}"
  region     = "{{ region  }}"

  assume_role {
    # The role ARN within Account B to AssumeRole into. Created in step 1.
    role_arn    = "arn:aws:iam::{{ account }}:role/{{ role }}"
  }
}
