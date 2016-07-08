describe Demo::School do
  
  let(:school) { Demo::School.new }

  it 'has zero courses on initialize' do
    expect(school.courses.length).to eq 0
  end

  it 'list courses' do
    course = Demo::Course.new("Rails101", 20)
    school.courses << course
    school.courses << course
    school.courses << course
    school.courses << course
    school.courses << course
    expect(school.courses.length).to eq 5
  end

end
