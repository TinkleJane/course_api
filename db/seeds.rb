# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.delete_all
Student.delete_all
Course.delete_all

puts 'create teachers'
teacher1 = Teacher.create!(name: 'Mr Li')
teacher2 = Teacher.create!(name: 'Mrs Xd')
teacher99 = Teacher.create!(name: 'SuperTeacher')

puts 'create students'
student1 = Student.create!(name: 'Lily')
student2 = Student.create!(name: 'Lucy')
student3 = Student.create!(name: 'Jane')

students = []
courses = []
puts 'create 50 students for testing overcount'
50.times do |i|
  students << Student.create!(name: "student_name_#{i}")
end

puts 'create 3 courses for testing overcount'
3.times do |i|
  courses << Course.create!(name: "course_name_#{i}", teacher_id: teacher99.id)
end

puts 'create course_relationships for testing overcount'
3.times do |i|
  50.times do |j|
    CourseRelationship.create!(course_id: courses[i].id, student_id: students[j].id)
  end
end

puts 'reset_counters'
Course.pluck(:id).each do |i|
  Course.reset_counters(i, :course_relationships)
end

puts 'create courses for student1'
course1 = teacher1.courses.create!(name: 'Math')
course2 = teacher1.courses.create!(name: 'English')
course3 = teacher2.courses.create!(name: 'Physics')

puts 'student has many courses'
course1.students << student1
course1.students << student2
course2.students << student3
course3.students << student3
