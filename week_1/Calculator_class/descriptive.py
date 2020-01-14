#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep  4 14:25:52 2019

@author: swilson5
"""
import math
 

class Calculator:
    def __init__(self,data):
        self.data=data
        self.data.sort()
        self.length = len(self.data) 
        self.mean = sum(self.data)/len(self.data)
        self.variance = (sum([(x-self.mean)**2 for x in self.data]))/self.length 
        self.stand_dev = round(math.sqrt((sum([(x-self.mean)**2 for x in self.data]))/(self.length-1)),5)          
    
        if self.length%2==0:
            median1= self.data[self.length*0.5 -1]
            median2= self.data[self.length*0.5]
            self.median = (median1+median2)*0.5    
        else:
            self.median =  self.data[(self.length-1)//2] 
  

    def add_data(self,new_data):
        self.data.extend(new_data)
        self.update(self.data)

    def update(self,data):
        self.data=data
        self.data.sort()
        self.length = len(self.data)
        self.mean = sum(self.data)/self.length
        self.variance = (sum([(x-self.mean)**2 for x in self.data]))/self.length 
        self.stand_dev = round(math.sqrt((sum([(x-self.mean)**2 for x in self.data]))/(self.length-1)),5)             
        if self.length%2==0:
            median1= self.data[self.length//2 -1]
            median2= self.data[self.length//2]
            self.median = (median1+median2)/2    
        else:
            self.median =  self.data[(self.length-1)//2] 

     
    #remove any of the numbers in that list from your object data   
     
    def remove_data(self,trash):
        for element in trash:
            self.data.remove(element)
        self.update(self.data)
        
       