class PeopleController < ApplicationController

  def index
    @msg = 'Person data.'
    @data = Person.all
  end

  # 表示
  def show
    @msg = "Indexed data."
    # 指定されたidを検索
    @data = Person.find(params[:id])
  end

  # 追加
  def add
    @msg = "add new data."
    # オブジェクトを作成
    @person = Person.new
  end

  # 作成
  def create
    # postの場合
    if request.post? then
      # データ追加を実行
      Person.create(person_params)
    # post以外の場合
    end
    # リダイレクトを実行
    redirect_to '/people'
  end

  # 編集
  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    # 指定されたidで検索
    @person = Person.find(params[:id])
  end

  # 更新
  def update
    # 指定されたidで検索
    obj = Person.find(params[:id])
    # 更新を実行
    obj.update(person_params)
  end

  # 削除
  def delete
    # 指定されたidで検索
    obj = Person.find(params[:id])
    # 削除を実行
    obj.destroy
    # リダイレクトを実行
    redirect_to '/people'
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end

end
