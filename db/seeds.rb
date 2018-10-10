# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'rest-client'
require 'pry'

def seed_posts_and_comments
    reddit_page = JSON.parse(RestClient.get('https://www.reddit.com/r/AskReddit/comments/80phz7/with_all_of_the_negative_headlines_dominating_the.json'))
    comments_array = []
    # post title is a[0]['data']['children'][0]['data']['title']
    # post author is a[0]['data']['children'][0]['data']['author']
    # comment author is a[1]['data']['children'][0]['data']['author']
    # comment content is a[1]['data']['children'][0]['data']['body']
    post_title = reddit_page[0]['data']['children'][0]['data']['title']
    post_author = reddit_page[0]['data']['children'][0]['data']['author']
    all_parent_comments = reddit_page[1]['data']['children'].each do |comment|
        comments_array << {
            'username': comment['data']['author'],
            'password': 'password',
            'content': comment['data']['body'],
            'upvotes': comment['data']['score'].to_i + rand(comment['data']['score']).to_i,
            'downvotes': comment['data']['score'].to_i - rand(comment['data']['score']).to_i
        }
    end
    
    binding.pry
    {'post_title': post_title, 'post_author': post_author, 'comments': comments_array}
end

seed_data = seed_posts_and_comments

