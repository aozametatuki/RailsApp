# Q&Aサイト Question
class QuestionsController < ApplicationController

  # 共通処理
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # 共通レイアウト指定
  layout 'Q&A'

  # 全データ一覧表示
  def index
    @questions = Question.all.order created_at: :desc
  end

  # 指定ページの表示
  def show
    @answer = Answer.new
    @answer.question_id = params[:id]
  end

  # 新規作成
  def new
    @question = Question.new
  end

  # 不使用
  def edit
    redirect_to '/questions'
  end

  # 新規作成
  def create
    # questionインスタンスを作成
    @question = Question.new(question_params)
    respond_to do |format|
      # データの保存に成功した場合
      if @question.save
        format.html { redirect_to '/questions' }
        format.json { render :show, status: :created, location: @question }
      # 保存に失敗した場合
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # 不使用
  def update
    redirect_to '/questions'
  end

  # 不使用
  def destroy
    redirect_to '/questions'
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :name, :finished)
  end
end
