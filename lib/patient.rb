require "pry"
class Patient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def Patient.all
        @@all
    end
    
    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end
   
    def appointments
        Appointment.all.select do |appt|
            appt.patient == self
        end
    end
 
    def doctors
        docs = self.appointments.collect do |appt|
            appt.doctor
        end
        docs.uniq
    end

end