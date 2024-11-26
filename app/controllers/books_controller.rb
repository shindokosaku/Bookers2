class BooksController < ApplicationController
 
  def index
    @book=Book.new
    @user=current_user
    @books=Book.all
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
    @book = Book.find(params[:id])
  end

  def update
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
