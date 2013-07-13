# coding: utf-8
class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :money, numericality: true
	belongs_to :category
end
