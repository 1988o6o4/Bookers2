class SearchController < ApplicationController
  def search
  @modle = params["search"] ["model"]
  # ＃選択したモデルを@modleに代入
  @value = params["search"] ["value"]
  # ＃検索にかけた文字列を@valueに代入
  @how = params["search"] ["how"]
  # ＃検索した検索方法を＠howに代入
  @dates = search_for(@how, @modle, @value)
  # ＃search_forの引数にインスタント変数を定義、@datesに最終検索結果が入る
  end

private

def match(modle,value)
  # search＿forでhowがmatchだった場合の処理
  if modle == 'user'
  # ＃modleがuserだった場合の処理
   User.where(name: value)
  # ＃whereで文字列が完全一致する名前を探す
  elsif modle == 'book'
   Book.where(title: value)
  end
end
def forward(modle,value)
  if modle == 'user'
    User.where("name LIKE ?", "#{value}%")
              # ＃カラム名　　　　値
  elsif modle == 'book'
    Book.where("title LIKE ?", "#{value}%")
  end
end
def backward(modle,value)
  if modle == 'user'
    User.where("name LIKE ?", "%#{value}")
  elsif modle == 'book'
    Book.where("title LIKE ?", "%#{value}")
  end
end
def partical(modle,value)
  if modle == 'user'
    User.where("name LIKE ?", "%#{value}%")
  elsif modle == 'book'
    Book.where("title LIKE ?", "%#{value}%")
  end
end
def search_for(how,modle,value)
# ＃searchアクションで定義した情報が引数に入っている
 case how
# ＃検索方法のhowの中身がどれなのかwhenの条件分岐から探す処理
 when 'match'
  match(modle, value)
  # ＃検索方法の引数に（modle、value）
  # ＃例えばhowがmatchならdef matchの処理を行う
 when 'forward'
  forward(modle, value)
 when 'backward'
  backward(modle, value)
 when 'partical'
  partical(modle, value)
 end
end

end
