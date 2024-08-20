json.extract! employee, :id, :name, :cpf, :date_of_birth, :admission_date, :termination, :role_id, :department_id, :sector_id, :address, :phone, :pension, :nature_id, :situation_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
