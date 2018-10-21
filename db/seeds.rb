
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'rest-client'


# Subforum.destroy_all
# User.destroy_all 
# Post.destroy_all 
# Comment.destroy_all

# 10.times do 
#     Subforum.create(name: Faker::Lorem.words(1)[0], description: Faker::Lorem.sentences(1)[0])
# end

# 5.times do 
#     User.create(username: Faker::Name.first_name, password: 'password')
# end

# subforum_ids = Subforum.all.map do |subforum| subforum.id end 

# user_ids = User.all.map do |user| user.id end

# Subforum.all.each do |subforum|
#     5.times do 
#         Post.create(title: Faker::Lorem.sentences(1)[0], content: Faker::Lorem.paragraphs(1)[0], user_id: user_ids.sample, subforum_id: subforum.id)
#     end
# end

# Post.all.each do |post|
#     5.times do 
#         c = Comment.create(content: Faker::Lorem.paragraphs(1)[0], user_id: user_ids.sample, post_id: post.id)
#         c.replies << Comment.create(content: Faker::Lorem.paragraphs(1)[0], user_id: user_ids.sample, post_id: post.id, parent_id: c.id)
#     end
# end
Post.all.each do |post|
    post.update(upvotes: rand(1000), downvotes: rand(1000))
end

Comment.all.each do |comment|
    comment.update(upvotes: rand(1000), downvotes: rand(1000))
end
# s1 = Subforum.create(name: 'Movies', description: 'All about movies')
# s2 = Subforum.create(name: 'Sports', description: 'All about sports')

# u1 = User.create(username: 'user1', password: 'password')
# u2 = User.create(username: 'user2', password: 'password')

# p1 = Post.create(title: 'first post', user: u1, subforum: s1, upvotes: 10, downvotes: 5)
# p2 = Post.create(title: 'second post', user: u2, subforum: s2, upvotes: 10, downvotes: 5)

# c1 = Comment.create(content: 'first comment', user: u1, post: p1, upvotes: 20, downvotes: 10)
# c2 = Comment.create(content: 'second comment', user: u2, post: p2, upvotes: 20, downvotes: 10)

# def seed_posts_and_comments
#     reddit_page = JSON.parse(RestClient.get('https://www.reddit.com/r/AskReddit/comments/80phz7/with_all_of_the_negative_headlines_dominating_the.json'))
#     comments_array = []
#     # post title is a[0]['data']['children'][0]['data']['title']
#     # post author is a[0]['data']['children'][0]['data']['author']
#     # comment author is a[1]['data']['children'][0]['data']['author']
#     # comment content is a[1]['data']['children'][0]['data']['body']
#     post_title = reddit_page[0]['data']['children'][0]['data']['title']
#     post_author = reddit_page[0]['data']['children'][0]['data']['author']
#     all_parent_comments = reddit_page[1]['data']['children'].each do |comment|
#         comments_array << {
#             'username': comment['data']['author'],
#             'password': 'password',
#             'content': comment['data']['body'],
#             'upvotes': comment['data']['score'].to_i + rand(comment['data']['score']).to_i,
#             'downvotes': comment['data']['score'].to_i - rand(comment['data']['score']).to_i
#         }
#     end
    
#     binding.pry
#     {'post_title': post_title, 'post_author': post_author, 'comments': comments_array}
# end

# seed_data = seed_posts_and_comments

