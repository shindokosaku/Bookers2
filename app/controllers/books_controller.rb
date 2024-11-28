class BooksController < ApplicationController
 
  def index
    @book=Book.new
    @user=current_user
    @books=Book.all
  end

 
  def create
   
    @book = Book.new(book_params)
    @book.user_id =current_user.id
   
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
      @books =Book.all
      @user = current_user 
      render :index
    end
  end
  def show
    @book=Book.find(params[:id])
    @book_new=Book.new
    @user= @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id) 
    else
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
