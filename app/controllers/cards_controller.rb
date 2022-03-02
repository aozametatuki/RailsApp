# 読書カード管理アプリ
class CardsController < ApplicationController

  layout 'cards'

  # 全データ一覧表示ページ
  def index
    # 全データを検索
    @cards = Card.all
  end

  # 指定データの表示ページ
  def show
    # 指定されたidを検索
    @card = Card.find(params[:id])
  end

  # 新しいデータの作成ページ
  def add
    if request.post? then
      # 新しいデータを挿入
      Card.create(card_params)
      goback
    else
      # 新しいインスタンスを作成
      @card = Card.new
    end
  end

  # 指定データの編集ページ
  def edit
    @card = Card.find(params[:id])
    if request.patch? then
      # データを更新
      @card.update(card_params)
      goback
    end
  end

  # 指定データの削除ページ
  def delete
    # 指定データを削除
    Card.find(params[:id]).destroy
    goback
  end

  private
  def card_params
    params.require(:card).permit(:title, :author, :price, :publisher, :memo)
  end

  # リダイレクト
  def goback
    redirect_to '/cards'
  end

end
