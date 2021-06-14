# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include ExceptionHandler
      include BaseHandler

      protected

      def show
        render json: resource
      end

      def resource
        @resource ||= model.find(params[:id])
      end
    end
  end
end
