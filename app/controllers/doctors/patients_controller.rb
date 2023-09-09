require 'date'

class Doctors::PatientsController < ApplicationController
  def registration_graph
    registration_data = Patient.group("DATE(created_at)").count
    @registration_data = {}

    registration_data.each do |date, count|
      formatted_date = date.strftime('%Y-%m-%d')
      @registration_data[formatted_date] = count
    end

    g = Gruff::Line.new
    g.title = 'Patients Registered vs Days'
    g.labels = @registration_data.keys
    g.data('Patients Registered', @registration_data.values)
    g.write(Rails.root.join('public', 'registration_graph.png'))

    @chart_image_path = '/registration_graph.png'
  end
end
