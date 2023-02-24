# defmodule WaitingRoom.Repo.Migrations.CreateUser do
#   use Ecto.Migration

#   def change do
#     create table(:users) do
#         add :first_name, :string
#         add :health_num, :integer
#         add :last_name, :string
#         add :phone, :integer
#         add :created_by, references(':admins')
#     end
#   end
# end
