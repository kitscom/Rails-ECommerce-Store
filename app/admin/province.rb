ActiveAdmin.register Province do
permit_params :name, :gst, :pst, :qst, :hst


  index do
      column :name
     
      column :gst do |rate|
          number_to_currency rate.gst
        end
        column :pst do |rate|
          number_to_currency rate.pst
        end
        column :hst do |rate|
          number_to_currency rate.hst
        end
        column :qst do |rate|
          number_to_currency rate.qst
        end
  end
end
