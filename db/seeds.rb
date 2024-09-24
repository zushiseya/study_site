# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email: "james@examle.com") do |user|
  user.name = "james"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end 

lucas = User.find_or_create_by!(email: "lucas@exmple.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Post.find_or_create_by!(title: "世界恐慌") do |post|
  post.text = '1930年代にアメリカを皮切りに世界的に起こった深刻な経済恐慌のことである。世界恐慌の時期は国によって異なるが、ほとんどの国では1929年に始まり、1930年代後半まで続いた。
                それは20世紀の中で最も長く、最も深く、最も広範な不況であった。世界恐慌により日本国内で起きた不況のことを昭和恐慌という。世界恐慌は、世界経済がいかに激しく衰退するかの例として一般的に使われている'
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.user = olivia
end

Post.find_or_create_by!(title: "冷戦") do |post|
  post.text = '第二次世界大戦後の世界を二分した西側諸国（アメリカ合衆国を盟主とする資本主義・自由主義陣営）と、東側諸国（ソビエト連邦を盟主とする共産主義・社会主義陣営）との対立構造。
               主に米ソ関係を軸に展開した。米ソ冷戦や東西冷戦とも呼ばれる。「冷戦」とは、戦火を交えない戦争、つまり米ソが武力で直接には衝突しないという意味であるが、
               冷戦下では朝鮮戦争、ベトナム戦争、ソ連・アフガン戦争のように両国が介入して東西各勢力を支援する代理戦争が多数勃発した。'
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.user = james
end

Post.find_or_create_by!(title: "リーマン・ショック") do |post|
  post.text = 'アメリカ合衆国で住宅市場の悪化によるサブプライム住宅ローン危機がきっかけとなり投資銀行のリーマン・ブラザーズ・ホールディングスが2008年9月15日に経営破綻し、
               そこから連鎖的に世界金融危機が発生した事象である。これは1929年に起きた世界恐慌以来の世界的な大不況である。'
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post3.jpg")
  post.user = lucas
end