class SearchEntriesController < ApplicationController
  before_action :set_search_entry, only: %i[ show edit update destroy ]

  # GET /search_entries or /search_entries.json
  def index
    @search_entries = SearchEntry.all
  end

  # GET /search_entries/1 or /search_entries/1.json
  def show
  end

  # GET /search_entries/new
  def new
    @search_entry = SearchEntry.new
  end

  # GET /search_entries/1/edit
  def edit
  end

  # POST /search_entries or /search_entries.json
  def create
    @search_entry = SearchEntry.new(search_entry_params)

    respond_to do |format|
      if @search_entry.save
        format.html { redirect_to @search_entry, notice: "Search entry was successfully created." }
        format.json { render :show, status: :created, location: @search_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_entries/1 or /search_entries/1.json
  def update
    respond_to do |format|
      if @search_entry.update(search_entry_params)
        format.html { redirect_to @search_entry, notice: "Search entry was successfully updated." }
        format.json { render :show, status: :ok, location: @search_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_entries/1 or /search_entries/1.json
  def destroy
    @search_entry.destroy
    respond_to do |format|
      format.html { redirect_to search_entries_url, notice: "Search entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_entry
      @search_entry = SearchEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_entry_params
      params.require(:search_entry).permit(:title, :body, :searchable_id, :searchable_type)
    end
end
