# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ユーザー
user1 = User.find_or_create_by!(email_address: "test1@example.com") do |user|
  user.name = "テストユーザー1"
  user.password = "password"
  user.introduction = "2児のママです。"
end

user2 = User.find_or_create_by!(email_address: "test2@example.com") do |user|
  user.name = "テストユーザー2"
  user.password = "password"
  user.introduction = "よろしくお願いします！"
end

user3 = User.find_or_create_by!(email_address: "test3@example.com") do |user|
  user.name = "テストユーザー3"
  user.password = "password"
  user.introduction = "育児奮闘中です！"
end

# 投稿
5.times do |i|
  Post.find_or_create_by!(
    title: "テスト投稿#{i + 1}",
    user: user1
  ) do |post|
    post.body = "これはテスト投稿です。"
  end
end

5.times do |i|
  Post.find_or_create_by!(
    title: "サンプル投稿#{i + 1}",
    user: user2
  ) do |post|
    post.body = "みなさんよろしくお願いします！"
  end
end

5.times do |i|
  Post.find_or_create_by!(
    title: "今日の育児#{i + 1}",
    user: user3
  ) do |post|
    post.body = "今日も一日頑張りました！"
  end
end