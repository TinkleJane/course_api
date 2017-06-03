class AddCourseRelationshipsCountToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_relationships_count, :integer, default: 0

    Course.pluck(:id).each do |i|
      Course.reset_counters(i, :course_relationships)
    end
  end
end
