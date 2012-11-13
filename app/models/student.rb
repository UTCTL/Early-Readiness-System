class Student < ActiveRecord::Base
	validates :name, :address1, :city, :state, :zip, :residency, :email, :birthday, :highschool, :presence => true
	validate :oneExamPerSubject
	validates_uniqueness_of :eid


	belongs_to :gender
	belongs_to :highschool, :foreign_key => "highschool_id"
	belongs_to :district, :autosave => true

	has_many :scores
	has_many :exams, :through => :scores

	has_many :question_responses
	has_many :questions, :through => :question_responses

	has_many :interested_universities
	has_many :universities, :through => :interested_universities

	accepts_nested_attributes_for :question_responses, :questions, :gender, :exams, :scores, :highschool, :district

	scope :accepted, where(:accepted => true)
	scope :has_scores, joins(:scores).merge(Exam.has_score).group(:eid)
	scope :needs_scores, joins(:scores).merge(Exam.pending_score).group(:eid)
	scope :male, where(:gender_id => 1)
	scope :female, where(:gender_id => 2)
	scope :ut, joins(:universities).merge(University.ut)
	scope :a_m, joins(:universities).merge(University.a_m)


	def self.exam_ids(query)
		joins(:scores).merge Score.where(:exam_id => query).group(:eid)
	end


	 search_methods :exams, :accepted, :has_scores, :needs_scores, :male, :female, :ut, :a_m

  	#helper vaildation method
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




