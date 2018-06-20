package com.bonc.pure.web.util;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

public class FusionchartsUtil {
	
	//fusioncharts 版本1.2.4
	public static String bubbleChartXML(List<Map<String,Object>> dataList,Map<String,Object> initMap,List<Map<String,Object>> tooltextList){
		//标题
		String titleDesc = initMap.get("titleDesc")==null?"":initMap.get("titleDesc").toString();
		
		String nameCodeCloumn = initMap.get("nameCodeCloumn")==null?"":initMap.get("nameCodeCloumn").toString();
		String nameDescCloumn = initMap.get("nameDescCloumn")==null?"":initMap.get("nameDescCloumn").toString();
		//中心点
		String centerCodeValue = initMap.get("centerCodeValue")==null?"":initMap.get("centerCodeValue").toString();
		String pieCenterColor = initMap.get("pieCenterColor")==null || initMap.get("pieCenterColor").equals("")?"#FF5252":initMap.get("pieCenterColor").toString();
		
		//x轴名称
		String xKpiName = initMap.get("xKpiName")==null?"":initMap.get("xKpiName").toString();
		String xKpiCloumn = initMap.get("xKpiCloumn")==null?"":initMap.get("xKpiCloumn").toString();
		
		//y轴名称
		String yKpiName = initMap.get("yKpiName")==null?"":initMap.get("yKpiName").toString();
		String yKpiCloumn = initMap.get("yKpiCloumn")==null?"":initMap.get("yKpiCloumn").toString();
		
		//联动方法，不需要联动可以不配置
		String clickJSMethod = initMap.get("clickJSMethod")==null?"":initMap.get("clickJSMethod").toString();
		//气泡颜色
		String pieColor = initMap.get("pieColor")==null || initMap.get("pieColor").equals("")?"#3FA7DC":initMap.get("pieColor").toString();
		
		StringBuffer categorySB = new StringBuffer();
		StringBuffer dataSB = new StringBuffer();
		StringBuffer chartXmlSB = new StringBuffer();
		
		double xMin=0.0,xMax=0.0,yMin=0.0,yMax=0.0,xAvg=0.0,yAvg=0.0,xMid=0.0,yMid=0.0;
		
		int i = 0;
		for(Map<String,Object> dataMap:dataList){
			//气泡中心名字信息
			String nameCode = dataMap.get(nameCodeCloumn)== null?"":dataMap.get(nameCodeCloumn).toString();
			String nameDesc = dataMap.get(nameDescCloumn)== null?"":dataMap.get(nameDescCloumn).toString();
			
			String xKpiValueString = dataMap.get(xKpiCloumn)== null?"0":dataMap.get(xKpiCloumn).toString();
			String yKpiValueString = dataMap.get(yKpiCloumn)== null?"0":dataMap.get(yKpiCloumn).toString();
			
			double xKpiValue = Double.parseDouble(xKpiValueString);
			double yKpiValue = Double.parseDouble(yKpiValueString);
			
			if (i == 0) {
				xMin = xKpiValue;
				xMax = xKpiValue;
				yMin = yKpiValue;
				yMin = yKpiValue;
			}else{
				if (xKpiValue < xMin){
					xMin = xKpiValue;
				}
				if (xKpiValue > xMax){
					xMax = xKpiValue;
				}
				if (yKpiValue < yMin){
					yMin = yKpiValue;
				}
				if (yKpiValue > yMax){
					yMax = yKpiValue;
				}
			}
			
			if(!"".equals(centerCodeValue)){
				if(centerCodeValue.equals(nameCode)){
					xAvg = xKpiValue;
					yAvg = yKpiValue;
				}
			}
			
			StringBuffer tooltextSB = new StringBuffer();
			
			tooltextSB.append(nameDesc);
	        if(tooltextList != null && tooltextList.size()>0){
	        	for(Map<String,Object> tooltextMap:tooltextList){
	        		tooltextSB.append("{br}");
					String tooltextName = tooltextMap.get("tooltextName")==null?"":tooltextMap.get("tooltextName").toString();
					String toolTextCloumn = tooltextMap.get("toolTextCloumn")==null?"":tooltextMap.get("toolTextCloumn").toString();
					String toolTextUnit = tooltextMap.get("toolTextUnit")==null?"":tooltextMap.get("toolTextUnit").toString();
					
					String toolText = dataMap.get(toolTextCloumn)== null?"0":dataMap.get(toolTextCloumn).toString();
					tooltextSB.append(tooltextName);
					tooltextSB.append(":");
					tooltextSB.append(toolText);
					tooltextSB.append(toolTextUnit);
				}
	        }
	        
	        
	        
	        dataSB.append("<set x='");
        	dataSB.append(xKpiValue);
        	dataSB.append("' y='");
        	dataSB.append(yKpiValue);
        	dataSB.append("' z='0.4' ");
        	
        	if(centerCodeValue.equals(nameCode)){
        		dataSB.append("name='");
            	dataSB.append(nameDesc);
            	dataSB.append("' ");
//	            	dataSB.append(" color='");
//	            	dataSB.append(pieCenterColor);
//	            	dataSB.append("' ");
        	}else{
        		dataSB.append("name='");
            	dataSB.append(nameDesc.substring(0, 1));
            	dataSB.append("' ");
//	            	dataSB.append(" color='");
//	            	dataSB.append(pieColor);
//	            	dataSB.append("' ");
        	}
        	
        	dataSB.append(" tooltext='");
        	dataSB.append(tooltextSB.toString());
        	dataSB.append("' ");
	        if(!"".equals(clickJSMethod)){
	        	dataSB.append("link=\"javascript:");
	        	dataSB.append(clickJSMethod);
	        	dataSB.append("('");
	        	dataSB.append(nameCode);
//		        	dataSB.append("','");
//		        	dataSB.append(nameDesc);
	        	dataSB.append("')");
	        	dataSB.append("\"");
	        }
	        dataSB.append("/>");		
	        
			i++;
			
		}
		
		xMid = (xMin + xMax)/2;
		yMid = (yMin + yMax)/2;
		
		if("".equals(centerCodeValue)){
			xAvg = xMid;
			yAvg = yMid;
		}
		
		DecimalFormat dFormat = new DecimalFormat("00");
		
		double qz = 1;
		
		xMin = xMin - qz;
		xMax = xMax + qz;
		
		yMin = yMin - qz;
		yMax = yMax + qz;
		
		String xMinS = String.valueOf(Integer.parseInt(dFormat.format(xMin)));
		String xMinMidS = String.valueOf(Integer.parseInt(dFormat.format((xMin + xMid)/2)));
		String xMidS = String.valueOf(Integer.parseInt(dFormat.format(xMid)));
		String xMidMaxS = String.valueOf(Integer.parseInt(dFormat.format((xMid + xMax)/2)));
		String xMaxS = String.valueOf(Integer.parseInt(dFormat.format(xMax)));
		
		//categorySB.append("<category label='"+dFormat.format(xAvg)+"' x='"+dFormat.format(xAvg)+"' showverticalline='1' lineDashed='1'/>");
		categorySB.append("<category label='"+xMidS+"' x='"+xMidS+"' showverticalline='1' lineDashed='1' vDivLineThickness='1' />");
		categorySB.append("<category label='"+xMinMidS+"' x='"+xMinMidS+"' showverticalline='1' lineDashed='1'/>");
		//categorySB.append("<category label='"+xMidS+"' x='"+xMidS+"' showverticalline='1' lineDashed='1'/>");
		categorySB.append("<category label='"+xMidMaxS+"' x='"+xMidMaxS+"' showverticalline='1' lineDashed='1'/>");
		categorySB.append("<category label='"+xMaxS+"' x='"+xMaxS+"' showverticalline='1' lineDashed='1'/>");
		
		//categorySB.append("<category label='"+yAvg+"' y='"+yAvg+"' showverticalline='1' lineDashed='1'/>");
		
		chartXmlSB.append("<chart ");
		
		chartXmlSB.append("caption='"+titleDesc+"' ");
		chartXmlSB.append("xAxisMinValue='"+xMinS+"' ");
		chartXmlSB.append("xAxisMaxValue='"+xMaxS+"' ");
		chartXmlSB.append("yAxisMinValue='"+yMin+"' ");
		chartXmlSB.append("yAxisMaxValue='"+yMax+"' ");
		chartXmlSB.append("quadrantXVal='"+xAvg+"' ");
		chartXmlSB.append("quadrantYVal='"+yAvg+"' ");
		chartXmlSB.append("xAxisName='"+xKpiName+"' ");
		chartXmlSB.append("yAxisName='"+yKpiName+"' ");

		chartXmlSB.append(" showValues='1' bgColor='#ffffff' showShadow='0'  showBorder='0'  plotFillAlpha='60' baseFontSize='12' ");
		chartXmlSB.append(" captionFont='Microsoft YaHei' captionFontSize='12' use3dlighting='0' ");
		chartXmlSB.append(" drawQuadrant='1' quadrantLineColor='#669900' quadrantLineAlpha='100' quadrantLineThickness='1' ");
		chartXmlSB.append(" plotFillHoverColor='#000000' canvasBorderColor='#E6E6E6' bubbleScale='0.2' ");
		
		//padding设置
		chartXmlSB.append(" chartLeftMargin='5' chartRightMargin='5' chartTopMargin='5' chartBottomMargin='5' captionPadding='5' ");
		//竖线设置
		chartXmlSB.append(" vDivLineColor='#E6E6E6' vDivLineThickness='1' vDivLineAlpha='30'  ");
		//水平线设置
		chartXmlSB.append(" numDivLines='3' divLineColor='#E6E6E6' divLineThickness='1' divLineAlpha='100' divLineIsDashed='1' showAlternateHGridColor='0' ");
		
		chartXmlSB.append(">\r\n");
		
		chartXmlSB.append("<categories >\r\n");
		chartXmlSB.append(categorySB.toString());
		chartXmlSB.append("</categories>\r\n");
		
		chartXmlSB.append("<dataset  color='"+ pieColor +"' showPlotBorder='0'>\r\n");
		
		chartXmlSB.append(dataSB.toString());
		chartXmlSB.append("</dataset>\r\n");
		
		//chartXmlSB.append("<trendlines>");
		//chartXmlSB.append("<line startValue='" + yMid + "' color='000000' thickness='2' />");
		//chartXmlSB.append("</trendlines>");
		
		chartXmlSB.append("</chart>");
		
		return chartXmlSB.toString();
	}
	
	//fusioncharts版本  3.4.0
	public static String bubbleChartJson(List<Map<String,Object>> dataList,Map<String,Object> initMap,List<Map<String,Object>> tooltextList){
		//标题
		String titleDesc = initMap.get("titleDesc")==null?"":initMap.get("titleDesc").toString();
		
		String nameCodeCloumn = initMap.get("nameCodeCloumn")==null?"":initMap.get("nameCodeCloumn").toString();
		String nameDescCloumn = initMap.get("nameDescCloumn")==null?"":initMap.get("nameDescCloumn").toString();
		
		//x轴名称
		String xKpiName = initMap.get("xKpiName")==null?"":initMap.get("xKpiName").toString();
		String xKpiCloumn = initMap.get("xKpiCloumn")==null?"":initMap.get("xKpiCloumn").toString();
		
		//y轴名称
		String yKpiName = initMap.get("yKpiName")==null?"":initMap.get("yKpiName").toString();
		String yKpiCloumn = initMap.get("yKpiCloumn")==null?"":initMap.get("yKpiCloumn").toString();
		
		//联动方法，不需要联动可以不配置
		String clickJSMethod = initMap.get("clickJSMethod")==null?"":initMap.get("clickJSMethod").toString();
		//气泡颜色
		String pieColor = initMap.get("pieColor")==null || initMap.get("pieColor").equals("")?"#3FA7DC":initMap.get("pieColor").toString();
		
		//中心点
		String pieCenterColor = initMap.get("pieCenterColor")==null || initMap.get("pieCenterColor").equals("")?"#FF5252":initMap.get("pieCenterColor").toString();
		String centerCodeValue = initMap.get("centerCodeValue")==null?"":initMap.get("centerCodeValue").toString();
		
		
		
		StringBuffer dataSB = new StringBuffer();
		
		dataSB.append("\"dataset\": [{\"color\": \"" + pieColor + "\",\"data\": [");
		
		
		
		double xMin=0.0,xMax=0.0,yMin=0.0,yMax=0.0,xAvg=0.0,yAvg=0.0,xMid=0.0,yMid=0.0;
		
		int i = 0;
		for(Map<String,Object> dataMap:dataList){
			//气泡中心名字信息
			String nameCode = dataMap.get(nameCodeCloumn)== null?"":dataMap.get(nameCodeCloumn).toString();
			String nameDesc = dataMap.get(nameDescCloumn)== null?"":dataMap.get(nameDescCloumn).toString();
			
			String xKpiValueString = dataMap.get(xKpiCloumn)== null?"0":dataMap.get(xKpiCloumn).toString();
			String yKpiValueString = dataMap.get(yKpiCloumn)== null?"0":dataMap.get(yKpiCloumn).toString();
			
			double xKpiValue = Double.parseDouble(xKpiValueString);
			double yKpiValue = Double.parseDouble(yKpiValueString);
			
			if (i == 0) {
				xMin = xKpiValue;
				xMax = xKpiValue;
				yMin = yKpiValue;
				yMin = yKpiValue;
			}else{
				if (xKpiValue < xMin){
					xMin = xKpiValue;
				}
				if (xKpiValue > xMax){
					xMax = xKpiValue;
				}
				if (yKpiValue < yMin){
					yMin = yKpiValue;
				}
				if (yKpiValue > yMax){
					yMax = yKpiValue;
				}
			}
			
			if(centerCodeValue.equals(nameCode)){
				xAvg = xKpiValue;
				yAvg = yKpiValue;
			}
			
			StringBuffer tooltextSB = new StringBuffer();
			
			tooltextSB.append(nameDesc);
	        if(tooltextList != null && tooltextList.size()>0){
	        	for(Map<String,Object> tooltextMap:tooltextList){
	        		tooltextSB.append("{br}");
					String tooltextName = tooltextMap.get("tooltextName")==null?"":tooltextMap.get("tooltextName").toString();
					String toolTextCloumn = tooltextMap.get("toolTextCloumn")==null?"":tooltextMap.get("toolTextCloumn").toString();
					String toolText = dataMap.get(toolTextCloumn)== null?"0":dataMap.get(toolTextCloumn).toString();
					tooltextSB.append(tooltextName);
					tooltextSB.append(":");
					tooltextSB.append(toolText);
				}
	        }
	        
	        if(i != 0){
	        	dataSB.append(",");
	        }
	        dataSB.append("{");
	        
	        dataSB.append("\"x\": \"");
        	dataSB.append(xKpiValue);
        	dataSB.append("\",");
        	
        	dataSB.append("\"y\": \"");
        	dataSB.append(yKpiValue);
        	dataSB.append("\",");
        	
        	if(centerCodeValue.equals(nameCode)){
        		dataSB.append("\"z\": \"");
            	dataSB.append("0.6");
            	dataSB.append("\",");
        		dataSB.append("\"color\": \"");
            	dataSB.append(pieCenterColor);
            	dataSB.append("\",");
            	
            	dataSB.append("\"name\": \"");
            	dataSB.append(nameDesc);
            	dataSB.append("\",");
            	
        	}else{
        		dataSB.append("\"z\": \"");
            	dataSB.append("0.4");
            	dataSB.append("\",");
            	
            	dataSB.append("\"name\": \"");
            	dataSB.append(nameDesc.substring(0, 1));
            	dataSB.append("\",");
        	}
        	dataSB.append("\"tooltext\": \"");
        	dataSB.append(tooltextSB.toString());
        	dataSB.append("\"");
        	
        	if(!"".equals(clickJSMethod)){
        		dataSB.append(",\"link\":\"javascript:");
        		dataSB.append(clickJSMethod);
	        	dataSB.append("('");
	        	dataSB.append(nameCode);
	        	dataSB.append("')");
	        	dataSB.append("\"");
	        }
        	dataSB.append("}");
        	
			i++;
			
		}
		dataSB.append("]}]");
		
		xMid = (xMin + xMax)/2;
		yMid = (yMin + yMax)/2;
		
		if("".equals(centerCodeValue)){
			xAvg = xMid;
			yAvg = yMid;
		}
		
		DecimalFormat dFormat = new DecimalFormat("00");
		
		double qz = 1;
		
		xMin = xMin - qz;
		xMax = xMax + qz;
		
		yMin = yMin - qz;
		yMax = yMax + qz;
		
		String xMinS = dFormat.format(xMin);
		String xMinMidS = dFormat.format((xMin + xMid)/2);
		String xMidS = dFormat.format(xMid);
		String xMidMaxS = dFormat.format((xMid + xMax)/2);
		String xMaxS = dFormat.format(xMax);
		
		StringBuffer categorySB = new StringBuffer();
		categorySB.append("\"categories\": [{\"category\": [");
		
		categorySB.append("{\"label\": \"" + xMinS + "\",\"x\": \"" + xMinS + "\",\"showverticalline\": \"1\"}");
		categorySB.append(",{\"label\": \"" + xMinMidS + "\",\"x\": \"" + xMinMidS + "\",\"showverticalline\": \"1\"}");
		categorySB.append(",{\"label\": \"" + xMidS + "\",\"x\": \"" + xMidS + "\",\"showverticalline\": \"1\"}");
		categorySB.append(",{\"label\": \"" + xMidMaxS + "\",\"x\": \"" + xMidMaxS + "\",\"showverticalline\": \"1\"}");
		categorySB.append(",{\"label\": \"" + xMaxS + "\",\"x\": \"" + xMaxS + "\",\"showverticalline\": \"1\"}");
		
		categorySB.append("]}]");
		
		StringBuffer chartJSONSB = new StringBuffer();
		chartJSONSB.append("\"chart\": {");
		
		chartJSONSB.append("\"theme\": \"fint\",");
		chartJSONSB.append("\"caption\": \"" + titleDesc + "\",");
		chartJSONSB.append("\"captionFontSize\": \"12\",");
		chartJSONSB.append("\"captionFont\": \"Microsoft YaHei\",");
		
		chartJSONSB.append("\"xAxisMinValue\": \"" + xMinS + "\",");
		chartJSONSB.append("\"xAxisMaxValue\": \"" + xMaxS + "\",");
		
		chartJSONSB.append("\"yAxisMinValue\": \"" + yMin + "\",");
		chartJSONSB.append("\"yAxisMaxValue\": \"" + yMax + "\",");
		
		chartJSONSB.append("\"xAxisName\": \"" + xKpiName + "\",");
		chartJSONSB.append("\"yAxisName\": \"" + yKpiName + "\",");

		chartJSONSB.append("\"quadrantXVal\": \"" + xAvg + "\",");
		chartJSONSB.append("\"quadrantYVal\": \"" + yAvg + "\",");
		
		chartJSONSB.append("\"bubbleScale\": \"0.8\",");
		chartJSONSB.append("\"numDivlines\": \"2\",");
		chartJSONSB.append("\"showValues\": \"1\",");
		chartJSONSB.append("\"plotFillAlpha\": \"80\",");
		chartJSONSB.append("\"drawQuadrant\": \"1\",");
		chartJSONSB.append("\"quadrantLineAlpha\": \"40\",");
		chartJSONSB.append("\"quadrantLineThickness\": \"2\"");
		
		chartJSONSB.append("}");
		
        StringBuffer allSB = new StringBuffer();
        allSB.append("{");
        allSB.append(chartJSONSB.toString());
        allSB.append(",");
        allSB.append(categorySB.toString());
        allSB.append(",");
        allSB.append(dataSB.toString());
        allSB.append("}");
        
		return allSB.toString();
	}
}
