describe Demo::Course do
  
  let(:course) { Demo::Course.new("Rails101", 30) }

  it 'assigns attributes' do
    expect(course).to be_a Demo::Course
  end

  it 'students is set to 0 on initialize' do
    expect(course.students.length).to eq 0
  end

  it 'lists students' do
    4.times do
      course.add_student Demo::Student.new( Faker::Name.name )
    end

    expect(course.students.length).to eq 4
  end

end
