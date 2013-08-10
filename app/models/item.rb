# coding: utf-8
class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :money, numericality: true
	validates :purchased_at, presence: true
	belongs_to :category
	belongs_to :user
end
