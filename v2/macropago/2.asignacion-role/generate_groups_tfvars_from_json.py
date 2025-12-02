import os
import json

groups_dir = "./roles" #groups_dir = "./groups"
output_file = "roles.tfvars"

with open(output_file, "w") as out:
    out.write('identity_store_id = "d-9067cf940b"\n\n')
    out.write("groups_config = [\n")
    for filename in os.listdir(groups_dir):
        if filename.endswith(".json"):
            with open(os.path.join(groups_dir, filename)) as f:
                group = json.load(f)

                out.write("  {\n")

                # Lista de cuentas
                if "accounts" in group:
                    out.write("    accounts = [\n")
                    for acc in group["accounts"]:
                        out.write(f'      "{acc.strip()}",\n')
                    out.write("    ],\n")

                # Campos string
                out.write(f'    group_name = "{group["group_name"].strip()}",\n')
                out.write(f'    permission_set_name = "{group["permission_set_name"].strip()}",\n')
                description = group.get("group_description", f'Grupo generado para {group["group_name"]}')
                out.write(f'    group_description = "{description.strip()}",\n')

                # aws_managed_policies
                out.write("    aws_managed_policies = [\n")
                for policy in group.get("aws_managed_policies", []):
                    out.write(f'      "{policy.strip()}",\n')
                out.write("    ],\n")

                # custom_managed_policies
                out.write("    custom_managed_policies = [\n")
                for policy in group.get("custom_managed_policies", []):
                    out.write(f'      "{policy.strip()}",\n')
                out.write("    ],\n")

                # gmail_users
                out.write("    gmail_users = [\n")
                for user in group.get("gmail_users", []):
                    out.write(f'      "{user.strip()}",\n')
                out.write("    ]\n")

                out.write("  },\n")
    out.write("]\n")

print("✅ Roles concatenados")