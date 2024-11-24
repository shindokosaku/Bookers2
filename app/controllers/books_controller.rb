class BooksController < ApplicationController
 
  def index
    @book=Book.new
    @user=current_user
  end

 
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id =current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    
    redirect_to book_path
  end
  def show
    @book=Book.find(params[:id])
    @book_new=Book.new
    @user=current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
