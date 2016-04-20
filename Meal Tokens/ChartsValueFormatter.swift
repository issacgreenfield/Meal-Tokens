//
//  ChartsValueFormatter.swift
//  Meal Tokens
//
//  Created by Issac Greenfield on 4/20/16.
//  Copyright © 2016 Issac Greenfield. All rights reserved.
//

import Foundation
import Charts

public class MyValueFormatter implements ValueFormatter {
    
    private DecimalFormat mFormat;
    
    public MyValueFormatter() {
        mFormat = new DecimalFormat("###,###,##0.0"); // use one decimal
    }
    
    @Override
    public String getFormattedValue(float value, Entry entry, int dataSetIndex, ViewPortHandler viewPortHandler) {
        // write your logic here
        return mFormat.format(value) + " $"; // e.g. append a dollar-sign
    }
}