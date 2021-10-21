class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
    @bookmark_graph = Bookmark.joins(:variety).group('varieties.name').count
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    
    respond_to do |format|
      if @bookmark.save
        @bookmarks = Bookmark.all
        # format.html { redirect_to @bookmark, notice: "Bookmark was successfully created." }
        # format.json { render :show, status: :created, location: @bookmark }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: "Bookmark was successfully updated." }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def find_books
    category = Category.where(name: params[:category]).first
    json = {'bookmarks' => {category.name.to_s => []}}
    # marcadores de primer nivel
    json['bookmarks'][category.name.to_s.to_s].push({"bookmarks": category.bookmarks.pluck(:name)})
    # marcadores de segundo nivel
    category.children.each do |child|
      json['bookmarks'][category.name.to_s.to_s].push({"subsection": child.name, "bookmarks": child.bookmarks.pluck(:name)})
    end
    # TODO: marcadores en n niveles
    render json: json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:name, :url, :variety_id, :category_id)
    end
end
