class ListsController < ApplicationController
  def index
    @list = List.new
    @lists=List.all
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
     if @list.save
      redirect_to list_path(@list.id)
      flash[:notice] = "Booke was successfully created."
    else
      @lists = List.all
      render :index
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
     @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
    flash[:notice] = "Booke was successfully updated."
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
    flash[:notice] = "Booke was successfully destroyed"
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end