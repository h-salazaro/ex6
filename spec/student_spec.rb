describe Demo::Student do
  
  let(:student) { Demo::Student.new("Mike") }

  it 'assigns attributes properly' do
    expect(student.name).to eq "Mike"
  end

end
