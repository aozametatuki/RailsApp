# Q&Aサイト Answer
class AnswersController < ApplicationController

  # 共通処理
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  # 共通レイアウト
  layout 'Q&A'

  # 不使用
  def index
    redirect_to '/questions'
  end

  # 不使用
  def show
    redirect_to '/questions'
  end

  # 新規作成
  def new
    @answer = Answer.new
  end

  # 不使用
  def edit
    redirect_to '/questions'
  end

  # 新規作成
  def create
    # answerインスタンスを作成
    @answer = Answer.new(answer_params)
    respond_to do |format|
      # データの保存に成功した場合
      if @answer.save
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
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :content, :name)
    end
end
