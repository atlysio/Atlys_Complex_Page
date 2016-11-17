require_dependency "atlys_complex_page/application_controller"

module AtlysComplexPage
  class PagesController < ::ApplicationController
    layout "admin"
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    # GET /pages
    def index
      @pages = Page.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new

    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @layout = { "layouts": [{ "origin": "html", "inner": [{ "html": URI.encode(params["html"]), "css": URI.encode(params["css"]), "javascript": URI.encode(params["javascript"]) }] }] }

puts @layout.to_json

      @page = Page.new
      @page.json_layout = @layout.as_json
      @page.title = params["title"]
      @page.page_url = params["page_url"]
      @page.fromuser = current_user.id
      @page.save!
      @render_to ="/page/#{@page.page_url}"

      redirect_to @render_to
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params[:page]
      end
  end
end
