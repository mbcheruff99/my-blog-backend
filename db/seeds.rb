# require "faker"
# Post.delete_all
# User.delete_all

# puts "🔑  Creating users…"
# admin = User.create!(
#   name:  "Admin User",
#   email: "admin@example.com",
#   password:              "password",
#   password_confirmation: "password",
#   admin: true
# )

# 10.times do
#   User.create!(
#     name:  Faker::Name.name,
#     email: Faker::Internet.unique.email,  # works on any Faker version
#     password:              "password",
#     password_confirmation: "password"
#   )
# end

# Post.create!(title: "Innovative Synergy Solutions", body: "Our team is dedicated to providing groundbreaking solutions that redefine industry standards. With a focus on efficiency and innovation, we continuously push boundaries to deliver exceptional results.", image: "https://picsum.photos/640/480?random=1", user_id: 1)
# Post.create!(title: "Revolutionizing Market Strategies", body: "By leveraging data-driven insights and cutting-edge technology, we help businesses navigate complex market landscapes with confidence and precision.", image: "https://picsum.photos/640/480?random=2", user_id: 2)
# Post.create!(title: "Next-Gen Productivity Tools", body: "Our latest software suite empowers teams to collaborate seamlessly, enhancing productivity while streamlining workflows for maximum efficiency.", image: "https://picsum.photos/640/480?random=3", user_id: 3)
# Post.create!(title: "Sustainable Growth Tactics", body: "Sustainability is at the core of our growth strategies. We prioritize eco-friendly practices while ensuring long-term success for businesses and communities alike.", image: "https://picsum.photos/640/480?random=4", user_id: 4)
# Post.create!(title: "AI-Powered Business Insights", body: "Harnessing the power of artificial intelligence, our solutions provide deep insights into market trends, customer behavior, and operational efficiencies.", image: "https://picsum.photos/640/480?random=5", user_id: 5)
# Post.create!(title: "Breakthroughs in Cloud Computing", body: "Our cloud solutions offer unparalleled scalability, security, and performance, making digital transformation smoother and more accessible than ever.", image: "https://picsum.photos/640/480?random=6", user_id: 2)
# Post.create!(title: "Empowering Remote Workforces", body: "With the shift to remote work, our tools ensure seamless communication, project management, and team collaboration across the globe.", image: "https://picsum.photos/640/480?random=7")
# Post.create!(title: "Cybersecurity in the Modern Era", body: "Protecting sensitive data is our top priority. Our advanced security protocols safeguard businesses from cyber threats and ensure compliance with industry standards.", image: "https://picsum.photos/640/480?random=8", user_id: 4)
# Post.create!(title: "Blockchain and the Future of Finance", body: "Decentralized finance is reshaping the financial world. Our expertise in blockchain technology helps businesses stay ahead in this rapidly evolving sector.", image: "https://picsum.photos/200?random=9", user_id: 1)

# db/seeds.rb

# Clear existing data (optional - useful for resetting)
Post.destroy_all
User.destroy_all

# --- Users ---
puts "Creating users..."

admin = User.create!(
  name: "Admin User",
  email: "admin@test.com",
  password: "password",
  admin: true
)

user1 = User.create!(
  name: "Maria Santos",
  email: "maria@test.com",
  password: "password",
  admin: false
)

user2 = User.create!(
  name: "Tony Ramirez",
  email: "tony@test.com",
  password: "password",
  admin: false
)

puts "Users created!"

# --- Posts ---
puts "Creating posts..."

posts = [
  { title: "Chamorro Red Rice", body: "body Juan", image: 1 },
  { title: "Garlic Butter Shrimp", body: "body Maria", image: 2 },
  { title: "Beef Tinaktak", body: "body Tony", image: 3 },
  { title: "Chicken Kelaguen", body: "body Lina", image: 4 },
  { title: "BBQ Short Ribs", body: "body Ray", image: 5 },
  { title: "Lumpia", body: "body Ann", image: 6 }
]

posts.each do |post_data|
  Post.create!(
    title: post_data[:title],
    body: post_data[:body],
    image: "https://picsum.photos/640/480?random=#{post_data[:image]}",
    user: [admin, user1, user2].sample  # randomly assign an owner
  )
end

puts "posts created!"
puts "Seeding complete!"