class Student < ActiveRecord::Base
	validates :name, :address1, :city, :state, :zip, :residency, :email, :birthday, :highschool, :presence => true
	validate :oneExamPerSubject
	validates_uniqueness_of :eid

	belongs_to :gender

	has_many :scores
	has_many :exams, :through => :scores

	has_many :question_responses
	has_many :questions, :through => :question_responses

	has_many :interested_universities
	has_many :universities, :through => :interested_universities

	accepts_nested_attributes_for :question_responses, :questions, :gender, :exams, :scores

	
  # Alias for <tt>acts_as_taggable_on :tags</tt>:
  #acts_as_taggable
  #acts_as_taggable_on :state, :zip, :residency, :gender, :highschool, :universities, :exams


	def oneExamPerSubject
		@subjects = Subject.all
		@oneInEach = true
		@exams = self.exams

			@subjects.each do |subject|
			@oneInThisSubject = false
			@exams.each do |exam|
				if exam.subject == subject
					@oneInThisSubject = true;
					#str = 'There is One In ' + subject.name + ' and it is ' + exam.subject.name + ' ' +exam.name
					#errors.add(:exams, str)
				end
				if @oneInThisSubject
					break
				end
			end
			if @oneInThisSubject == false
				@oneInEach = false
			end
		end

		if @oneInEach == false
			errors.add(:exams, "Must have one exam from each subject")
		end
	end
end




