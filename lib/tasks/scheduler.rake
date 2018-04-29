desc "This task is called by the Heroku scheduler add-on"
task :delete_past_orders => :environment do
  puts "Deleting old orders..."
  
  one_week_ago = 1.week.ago.in_time_zone('Eastern Time (US & Canada)').beginning_of_day

  orders = Order.with_deleted.where(created_at: 19.years.ago..one_week_ago)
  orders.each { |order| order.really_destroy! }

  puts "Done deleting old orders."
end