class Doctor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end 
    
    def Doctor.all
        @@all
    end
    
    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end
  
    def appointments
        Appointment.all.select do |appt|
            appt.doctor == self
        end
    end
    
    def patients
        patients = self.appointments.collect do |appt|
            appt.patient
        end
        patients.uniq
    end

end