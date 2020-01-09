class PageController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        render "index"
      end
      format.pdf do
        render pdf: 'result', encoding: 'utf-8', template: 'page/index_pdf.html', show_as_html: params[:debug].present?
      end
    end
  end
end
