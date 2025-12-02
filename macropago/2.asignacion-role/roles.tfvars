identity_store_id = "d-9067cf940b"

groups_config = [
  {
    accounts = [
      "637423349711",
      "488675217017",
    ],
    group_name = "cloudadmin",
    permission_set_name = "cloudadmin",
    group_description = "Grupo generado para cloudadmin",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "cloudadmin",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
  {
    accounts = [
      "909817713082",
    ],
    group_name = "developer-3082",
    permission_set_name = "developer-3082",
    group_description = "Grupo generado para developer-3082",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "developer-to-apigateway-3082",
      "developer-to-s3-3082",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
  {
    accounts = [
      "488675217017",
    ],
    group_name = "developer-7017",
    permission_set_name = "developer-7017",
    group_description = "Grupo generado para developer-7017",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "developer-to-apigateway-7017",
      "developer-to-s3-7017",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
  {
    accounts = [
      "637423349711",
    ],
    group_name = "developer-9711",
    permission_set_name = "developer-9711",
    group_description = "Grupo generado para developer-9711",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "developer-to-apigateway-9711",
      "developer-to-s3-9711",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
  {
    accounts = [
      "909817713082",
    ],
    group_name = "soc-3082",
    permission_set_name = "soc-3082",
    group_description = "Grupo generado para soc-3082",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "soc-to-cloudtrail-3082",
      "soc-to-securityhub-3082",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
  {
    accounts = [
      "488675217017",
    ],
    group_name = "soc-7017",
    permission_set_name = "soc-7017",
    group_description = "Grupo generado para soc-7017",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "soc-to-cloudtrail-7017",
      "soc-to-securityhub-7017",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
  {
    accounts = [
      "637423349711",
    ],
    group_name = "soc-9711",
    permission_set_name = "soc-9711",
    group_description = "Grupo generado para soc-9711",
    aws_managed_policies = [
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    ],
    custom_managed_policies = [
      "soc-to-cloudtrail-9711",
      "soc-to-securityhub-9711",
    ],
    gmail_users = [
      "94jjba@gmail.com",
    ]
  },
]
