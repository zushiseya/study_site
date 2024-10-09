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
  post.problem = "①世界恐慌はニューヨークの株式市場における株価の大暴落が発端だと言われていますが、このニューヨークの街の名前は何と言うか答えてください。

                  ②世界恐慌の最中、イギリスやフランスなどの植民地を有する「持てる国」は本国と植民地の間で排他的な経済圏を形成していきましたが、このような経済を何と言うでしょうか？

                  ③世界恐慌の最中、ソ連はスターリン主導の下、計画経済に基づいてある計画を進めていました。この計画は何と言うか答えてください。

                  ④世界恐慌の最中、植民地や資源に乏しい「持たざる国」ではある思想が主にドイツやイタリアなどの国々で広まり、侵略によって新たな植民地を獲得しようとする動きが出てきました。
                  このドイツやイタリアで急速に台頭してきた思想とは何かをカタカナ5文字若しくは漢字4文字で答えて下さい。"
  post.explanation = "①ウォール街

                      ②ブロック経済
                      イギリスでは労働党のラムゼイ・マクドナルドが挙国一致内閣を組織し、スターリング（ポンド）＝ブロックを、フランスでは社会党のレオン・ブルムが人民戦線内閣を組織し、フラン＝ブロックを形成していきました。
                      
                      ③五カ年計画
                      五カ年計画の実態は、農民から穀物を安く買い上げ輸出することで外貨を獲得し、その利益によって工業化を推進するというものでした。
                      これによってホロドモールと呼ばれる大飢餓が起きてしまいました。
                      
                      ④ファシズム（全体主義）
                      ファシズムの定義については広義なものから狭義なものまで幅広く厳密な定義が難しいですが、イタリアのムッソリーニやドイツのヒトラーなどの代表例のように、権威主義体制の極致、極端な独裁体制や個人に対する規制、国益第一・民族主義などの特徴が散見されます。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.user = olivia
end

Post.find_or_create_by!(title: "冷戦") do |post|
  post.text = '第二次世界大戦後の世界を二分した西側諸国（アメリカ合衆国を盟主とする資本主義・自由主義陣営）と、東側諸国（ソビエト連邦を盟主とする共産主義・社会主義陣営）との対立構造。
               主に米ソ関係を軸に展開した。米ソ冷戦や東西冷戦とも呼ばれる。「冷戦」とは、戦火を交えない戦争、つまり米ソが武力で直接には衝突しないという意味であるが、
               冷戦下では朝鮮戦争、ベトナム戦争、ソ連・アフガン戦争のように両国が介入して東西各勢力を支援する代理戦争が多数勃発した。'
  post.problem = "①冷戦はいつ始まり、いつ終わりましたか？
                  
                  ②冷戦時代に結成された軍事同盟を2つ挙げ、それぞれどの国々が加盟していたか説明しなさい。"
  post.explanation = "①冷戦は第二次世界大戦が終わった1947年頃から始まり、1991年にソビエト連邦が崩壊したことで終結しました。
                       冷戦はアメリカ合衆国を中心とする資本主義陣営と、ソビエト連邦を中心とする共産主義陣営との間で行われた軍事的・政治的・経済的な対立です。直接的な戦争（熱戦）は起こらなかったため「冷戦」と呼ばれます。
                     
                     ②NATO（北大西洋条約機構）: 1949年にアメリカ合衆国、カナダ、西ヨーロッパ諸国（イギリス、フランス、イタリア、ベルギーなど）が結成した軍事同盟です。冷戦中、資本主義陣営の防衛協力体制を築くために結成されました。
　　　　　　　　　　　ワルシャワ条約機構: 1955年にソ連と東ヨーロッパ諸国（ポーランド、東ドイツ、チェコスロバキア、ハンガリーなど）が結成した軍事同盟で、NATOに対抗するための共産主義陣営の防衛組織です。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.user = james
end

Post.find_or_create_by!(title: "リーマン・ショック") do |post|
  post.text = 'アメリカ合衆国で住宅市場の悪化によるサブプライム住宅ローン危機がきっかけとなり投資銀行のリーマン・ブラザーズ・ホールディングスが2008年9月15日に経営破綻し、
               そこから連鎖的に世界金融危機が発生した事象である。これは1929年に起きた世界恐慌以来の世界的な大不況である。'
  post.problem = "①リーマンショックが発生したのは何年ですか？
                  
                  ②リーマンショックの原因となった金融商品は何ですか？
                  
                  ③リーマンショック後、各国政府が取った主な対策を2つ挙げなさい"
  post.explanation = "①リーマンショックは2008年9月15日に発生しました。この日、アメリカの大手投資銀行リーマン・ブラザーズが経営破綻し、これが世界的な金融危機の引き金となりました。リーマンショックは、不動産バブルの崩壊や過剰なサブプライムローン（信用度の低い個人への住宅ローン）が原因で、金融市場に大混乱をもたらしました。
                      
                      ②リーマンショックの原因となった主な金融商品は「サブプライムローン」と、それを元にした「モーゲージ担保証券（MBS）」や「債務担保証券（CDO）」です。

                      ・サブプライムローン: 信用力の低い借り手に対して融資された住宅ローン。住宅価格の上昇を前提に多くの人々に貸し出されたが、価格が下落すると多くの借り手が返済不能に陥りました。
                      ・MBSやCDO: サブプライムローンを元にした証券化商品で、これが世界中の金融機関に販売されました。住宅価格の下落に伴い、これらの証券の価値が急落し、金融市場全体が混乱しました。
                      
                      ③1.金融機関への公的資金注入（ベイルアウト）: 多くの国では金融機関が破綻しないように政府が公的資金を注入し、経営を支援しました。アメリカでは、銀行を救済するために数百億ドル規模の資金が投入され、金融システムの安定が図られました。
                       2.経済刺激策の実施: 各国は金融危機による景気後退を防ぐために、インフラ投資や減税、低金利政策などの経済刺激策を打ち出しました。これにより企業や個人の消費・投資を促し、景気回復を目指しました。"
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post3.jpg")
  post.user = lucas
end  