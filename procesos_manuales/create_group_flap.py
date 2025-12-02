#https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/identitystore.html

import boto3
client = boto3.client('identitystore')

lista_group_names = ["fl-mx-prod-iam-role-soc-team-ext"]
for group_name in lista_group_names:
    response = client.create_group(
        IdentityStoreId='d-90678ac96e',
        DisplayName=group_name,
        Description=group_name
    )
    print("Se ha creado un nuevo grupo con el nombre:", group_name)



