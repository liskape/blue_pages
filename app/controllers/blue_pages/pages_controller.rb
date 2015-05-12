# encoding: utf-8

class BluePages::PagesController < ::ApplicationController

  respond_to :html

  def show
    @page = ::Page.where(path: params[:path]).first
    if @page
      render_page
    else
      not_found
    end
  end

  protected

  def render_page
    if BluePages.layout.present?
      render_text
    else
      render_app_page
    end
  end

  def render_app_page
    render 'pages/show'
  end

  def render_text
    render text: @page.to_html, layout: BluePages.layout
  end
end