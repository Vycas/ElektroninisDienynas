require 'rake'
require 'spec/rake/spectask'
 
desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('examples_with_rcov') do |t|
  t.spec_files = FileList['*_spec.rb']
  t.rcov = true
  t.rcov_opts = ['-i', 'user.rb,admin.rb,student.rb,course.rb,mark.rb,teacher.rb']
end
 
