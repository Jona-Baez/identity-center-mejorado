#https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/identitystore.html

import boto3
client = boto3.client('identitystore')

lista_group_names = ["op-latam-dev-readers-quicksight"]
for group_name in lista_group_names:
    response = client.create_group(
        IdentityStoreId='d-90679af3fe',
        DisplayName=group_name,
        Description="op-latam-dev-readers-quicksight"
    )
    print("✅ Se ha creado un nuevo grupo con el nombre:", group_name)