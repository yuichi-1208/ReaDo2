class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]

  def index
    @summaries = Summary.all
  end

  def new
    @summary = Summary.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @summary = @book.summaries.build(summary_params)
    # @summary.user_id = current_user.id
    if @summary.save
      # calc_level
      # current_user.update(level: @read_level.floor)
      redirect_to summaries_path, notice: t('view.create_notice')
    else
      render :new
    end
  end


  def show
    # if current_user
    #   @favorite = current_user.favorites.find_by(summary_id: @summary.id)
    # end
    # @comments = @summary.comments.order(created_at: :desc)
    # @comment = @summary.comments.build
  end

  def edit
    @book = @summary.book
  end

  def update
    if @summary.update(summary_params)
      redirect_to summaries_path, notice: t('view.edit_notice')
    else
      @book = @summary.book
      render :edit
    end
  end

  def destroy
    @summary.destroy
    # calc_level
    # current_user.update(level: @read_level.floor)
    redirect_to summaries_path, notice: t('view.destroy_notice')
  end

  def calc_level
    @read_level = current_user.summaries.count * 0.6
                  + current_user.memos.count * 0.2
                  + current_user.reviews.count * 0.1
                  + current_user.comments.count * 0.1
  end

  private
  def summary_params
    params.require(:summary).permit(:book_id, :content, :category)
  end

  def set_summary
    @summary = Summary.find(params[:id])
  end
end
