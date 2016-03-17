module StudentsHelper
  def student_house_color(student)
    house_name = student.house.name
    class_name = { "Alpha" => "warning", "Kappa" => "info", "Omega" => "primary", "Trinity" => "success"}
  return class_name[house_name]
  end
end
