desc "This task is called by the Heroku scheduler add-on"
task :delete_past_orders => :environment do
  puts "Deleting old orders..."
  
  two_weeks_ago = 2.week.ago.in_time_zone('Eastern Time (US & Canada)').beginning_of_day

  orders = Order.with_deleted.where(created_at: 20.years.ago..two_weeks_ago)
  orders.each { |order| order.really_destroy! }

  puts "Done deleting old orders."
end