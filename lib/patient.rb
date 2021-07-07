class Patient
    attr_reader
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select do |visit|
            visit.patient == self
        end
    end

    def doctors
        appointments.map do |visit|
            visit.doctor
        end
    end
end