### 📦 Módulo Terraform: `iam-sso-group`

Este módulo permite crear de forma dinámica:

- Grupos en AWS Identity Center (SSO)
- Permission Sets
- Asignaciones de Permission Sets a cuentas AWS
- Asociaciones de políticas (AWS y personalizadas)
- Vinculación de usuarios (por correo) a grupos

---

### 🔧 Variables requeridas

| Variable                  | Tipo          | Descripción                                                  |
|---------------------------|---------------|--------------------------------------------------------------|
| `identity_store_id`       | `string`      | ID del Identity Store (comienza con `d-90679af3fe`)                 |
| `aws_account_id`          | `string`      | Cuenta AWS donde se asignará el permission set               |
| `group_name`              | `string`      | Nombre del grupo en AWS SSO                                  |
| `permission_set_name`     | `string`      | Nombre del permission set                                    |
| `aws_managed_policies`    | `set(string)` | ARNs de políticas administradas (ej. AmazonS3ReadOnlyAccess) |
| `custom_managed_policies` | `set(string)` | Nombres de políticas IAM personalizadas                      |
| `gmail_users`             | `set(string)` | Correos de usuarios a asignar al grupo                       |

---

### 👷‍♂️ Composición de cambios en los roles

Los cambios en roles para Identity Center, esta divido en dos pasos: 1.politicas-por-cuenta y 2.asignacion-por-role

- 1.politicas-por-cuenta: 
Aqui hay una carpeta para cada cuenta, todas tendrán su main y mas archivos tf en las que se definen cada una de las politicas por servicio para cada role, por ejemplo: op-dev-architect-to-apigateway-2129
Entonces, cualquier cambio en el permiso de servicio por role, deben editarse en su archivo tf correspondiente

- 2.asignacion-por-role
Aqui esta la carpeta "groups" y dentro de ella estan los json que definen cada role para las diferentes cuenta, por ejemplo: op-dev-architect-37597.
Cada json esta contruido por el ID de la cuenta, el groupname, el permission set, las politicas administradas y la invocacion de las politicas personalidas que estan en el paso 1, ademas de los correos de las personas que tendrán asignado ese role.

---

### 🗒️ Edición politicas para cada role
Esta se realiza en el paso 1 (1.politicas-por-cuenta)
Si es necesario editar alguna politica de un role, es aqui donde debes editar.

1️⃣ Entra a la carpeta correspondiente de la cuenta
2️⃣ Edita el archivo tf de la politica correspondiente 
3️⃣ Crea tus access key en IC de la cuenta donde haras el cambio en la polotica y guardalas en aws/credentials
4️⃣ Ejecuta Terraform
    terraform init
    terraform plan 
    terraform apply


### 👤 Edicion y asignación de role
Esta se realiza en el paso 2 (2.asignacion-por-role)
Si requieres cambiar las politicas por role o asignar o quitar usuarioa de los roles, es aqui
1️⃣ Entra a la carpeta groups
2️⃣ Edita el archivo jsontf del role correspondiente 
3️⃣ Crea tus access key en IC en la cuenta de shared services y guardalas en aws/credentials
4️⃣ Ejecuta python generate_groups_tfvars.py
5️⃣ Ejecuta terraform
    terraform init
    terraform plan -var-file="groups.tfvars"
    terraform apply -var-file="groups.tfvars"
