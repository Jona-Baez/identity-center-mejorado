import boto3
import botocore.exceptions

client = boto3.client('identitystore')

identity_store_id = 'd-90679af3fe'
grupos = ["44a83498-a0e1-70f1-77e2-2a2f102f1d1e"]
correos = [
    "jortega@flap.com.mx"
]

def obtener_user_id_por_correo(correo):
    try:
        response = client.list_users(
            IdentityStoreId=identity_store_id,
            Filters=[{
                'AttributePath': 'UserName',  # o 'Emails.value' si el UserName no es el correo
                'AttributeValue': correo
            }]
        )
        users = response.get('Users', [])
        if users:
            return users[0]['UserId']
        else:
            print(f"❌ No se encontró el usuario con correo: {correo}")
            return None
    except botocore.exceptions.ClientError as e:
        print(f"❌ Error al buscar el ID del usuario {correo}: {e}")
        return None

for grupo in grupos:
    for correo in correos:
        user_id = obtener_user_id_por_correo(correo)
        if user_id:
            try:
                response = client.create_group_membership(
                    IdentityStoreId=identity_store_id,
                    GroupId=grupo,
                    MemberId={'UserId': user_id}
                )
                print(f"✅ Miembro agregado: {correo} (ID: {user_id}) al grupo: {grupo}")
            except botocore.exceptions.ClientError as e:
                if e.response['Error']['Code'] == 'ConflictException':
                    print(f"⚠️ El usuario {correo} ya es miembro del grupo {grupo}.")
                else:
                    print(f"❌ Error al agregar {correo} al grupo {grupo}: {e}")