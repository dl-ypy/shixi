package com.bonc.pure.web.util;

import java.util.List;
import java.util.Map;

public class EchartsUtil {
	
	public static String initLineChart(List<Map<String,Object>> dataList,List<Map<String,Object>> initList,Map<String,Object> initMap){
		StringBuffer returnStr = new StringBuffer();
		returnStr.append("{");
		returnStr.append("tooltip:{trigger: 'axis'}");
		returnStr.append(",");
		returnStr.append("legend:{x:'center',y:'bottom',data:");
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		StringBuffer axisData = new StringBuffer();
		StringBuffer seriesData = new StringBuffer();
		StringBuffer legendData = new StringBuffer();
		
		axisData.append("[");
		if(dataList != null){
			int i = 0;
			for(Map<String,Object> dataMap:dataList){
				String axisName = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
				if(i != 0){
					axisData.append(",");
				}
				axisData.append("'");
				axisData.append(axisName);
				axisData.append("'");
				i++;
			}
		}
		axisData.append("]");
		
		legendData.append("[");
		seriesData.append("[");
		if(initList != null){
			int i=0;
			for(Map<String,Object> mapTemp:initList){
				String dataName = mapTemp.get("dataName")== null?"":mapTemp.get("dataName").toString();
				String dataCloumn = mapTemp.get("dataCloumn")== null?"":mapTemp.get("dataCloumn").toString();
				String dataType = mapTemp.get("dataType")== null?"":mapTemp.get("dataType").toString();
				String lineStyleType = mapTemp.get("lineStyleType")== null?"":mapTemp.get("lineStyleType").toString();
				
				if(i!=0){
					legendData.append(",");
					seriesData.append(",");
				}
				i++;
				legendData.append("'");
				legendData.append(dataName);
				legendData.append("'");
				
				StringBuffer dataItem = new StringBuffer();
				
				dataItem.append("{");
				dataItem.append("name:'");
				dataItem.append(dataName);
				dataItem.append("',");
				dataItem.append("type:'");
				dataItem.append(dataType);
				dataItem.append("',");
				if(!"".equals(lineStyleType)){
					dataItem.append("itemStyle:{normal:{lineStyle:{type:'");
					dataItem.append(lineStyleType);
					dataItem.append("'}}},");
				}
				
				dataItem.append("data:[");
				int j=0;
				for(Map<String,Object> dataMap:dataList){
					String dataValue = dataMap.get(dataCloumn)== null?"'-'":dataMap.get(dataCloumn).toString();
					if(j!=0){
						dataItem.append(",");
					}
					dataItem.append(dataValue);
					j++;
				}
				dataItem.append("]");
				dataItem.append("}");
				seriesData.append(dataItem.toString());
			}
		}
		legendData.append("]");
		seriesData.append("]");
		
		
		returnStr.append(legendData.toString());
		returnStr.append("},");
		
		returnStr.append("calculable : true,");
		returnStr.append("xAxis:[{type : 'category',boundaryGap : false,data :");
		
		returnStr.append(axisData.toString());
		returnStr.append("}],");
		returnStr.append("yAxis : [{type : 'value'}],");
		
		returnStr.append("series:");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
	
		return returnStr.toString();
	}
	
	public static String initDataChart(List<Map<String,Object>> dataList,List<Map<String,Object>> initList,Map<String,Object> initMap){
		StringBuffer returnStr = new StringBuffer();
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		StringBuffer axisData = new StringBuffer();
		StringBuffer seriesData = new StringBuffer();
		StringBuffer legendData = new StringBuffer();
		StringBuffer seriesDataArray = new StringBuffer();
		axisData.append("[");
		if(dataList != null){
			int i = 0;
			for(Map<String,Object> dataMap:dataList){
				String axisName = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
				if(i != 0){
					axisData.append(",");
				}
				axisData.append("'");
				axisData.append(axisName);
				axisData.append("'");
				i++;
			}
		}
		axisData.append("]");
		
		legendData.append("[");
		seriesData.append("[");
		if(initList != null){
			int i=0;
			for(Map<String,Object> mapTemp:initList){
				String dataName = mapTemp.get("dataName")== null?"":mapTemp.get("dataName").toString();
				String dataCloumn = mapTemp.get("dataCloumn")== null?"":mapTemp.get("dataCloumn").toString();
				String dataType = mapTemp.get("dataType")== null?"":mapTemp.get("dataType").toString();
				String lineStyleType = mapTemp.get("lineStyleType")== null?"":mapTemp.get("lineStyleType").toString();
				String yAxisIndex = mapTemp.get("yAxisIndex")== null?"":mapTemp.get("yAxisIndex").toString();
				
				String lineColor = mapTemp.get("lineColor")== null?"":mapTemp.get("lineColor").toString();
				String barCategoryGap = mapTemp.get("barCategoryGap")== null?"":mapTemp.get("barCategoryGap").toString();
				String lineStyleWidth = mapTemp.get("lineStyleWidth")== null?"":mapTemp.get("lineStyleWidth").toString();
				
				if(i!=0){
					legendData.append(",");
					seriesData.append(",");
				}
				i++;
				legendData.append("'");
				legendData.append(dataName);
				legendData.append("'");
				
				StringBuffer dataItem = new StringBuffer();
				
				dataItem.append("{");
				dataItem.append("name:'");
				dataItem.append(dataName);
				dataItem.append("',");
				dataItem.append("type:'");
				dataItem.append(dataType);
				dataItem.append("',");
				if(!"".equals(lineStyleType) || !"".equals(lineColor) || !"".equals(lineStyleWidth)){
					dataItem.append("itemStyle:{normal:{");
					if(!"".equals(lineColor)){
						dataItem.append("color:'");
						dataItem.append(lineColor);
						dataItem.append("',");
					}
					if(!"".equals(lineStyleType) || !"".equals(lineStyleWidth)){
						dataItem.append("lineStyle:{");
						if(!"".equals(lineStyleType)){
							dataItem.append("type:'");
							dataItem.append(lineStyleType);
							dataItem.append("',");
						}
						if(!"".equals(lineStyleWidth)){
							dataItem.append("width:");
							dataItem.append(lineStyleWidth);
							dataItem.append(",");
						}
						dataItem.append("},");
					}
					dataItem.append("}},");
				}
				
				if(!"".equals(barCategoryGap)){
					dataItem.append("barCategoryGap:'");
					dataItem.append(barCategoryGap);
					dataItem.append("',");
				}
				
				if(!"".equals(yAxisIndex)){
					dataItem.append("yAxisIndex: 1,");
				}
				
				dataItem.append("data:[");
				seriesDataArray.append("[");
				int j=0;
				for(Map<String,Object> dataMap:dataList){
					String dataValue = dataMap.get(dataCloumn)== null?"'-'":dataMap.get(dataCloumn).toString();
					if(dataValue != null){
						if(j!=0){
							dataItem.append(",");
							seriesDataArray.append(",");
						}
						dataItem.append(dataValue);
						seriesDataArray.append(dataValue);
					}
					j++;
				}
				dataItem.append("]");
				seriesDataArray.append("]");
				dataItem.append("}");
				seriesData.append(dataItem.toString());
			}
		}
		legendData.append("]");
		seriesData.append("]");
		
		returnStr.append("{");
		returnStr.append("'axisData':");
		returnStr.append(axisData.toString());
		returnStr.append(",");
		
		returnStr.append("'legendData':");
		returnStr.append(legendData.toString());
		returnStr.append(",");
		
		returnStr.append("'seriesDataArray':");
		returnStr.append(seriesDataArray.toString());
		returnStr.append(",");
		
		returnStr.append("'seriesData':");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
	
		return returnStr.toString();
	}
	
	public static String initDataChartOther(List<Map<String,Object>> dataList,List<Map<String,Object>> initList,Map<String,Object> initMap){
		StringBuffer returnStr = new StringBuffer();
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		StringBuffer axisData = new StringBuffer();
		StringBuffer seriesData = new StringBuffer();
		StringBuffer legendData = new StringBuffer();
		
		axisData.append("[");
		if(dataList != null){
			int i = 0;
			for(Map<String,Object> dataMap:dataList){
				String axisName = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
				if(i != 0){
					axisData.append(",");
				}
				axisData.append("'");
				axisData.append(axisName);
				axisData.append("'");
				i++;
			}
		}
		axisData.append("]");
		
		legendData.append("[");
		seriesData.append("[");
		if(initList != null){
			int i=0;
			for(Map<String,Object> mapTemp:initList){
				String dataName = mapTemp.get("dataName")== null?"":mapTemp.get("dataName").toString();
				String dataCloumn = mapTemp.get("dataCloumn")== null?"":mapTemp.get("dataCloumn").toString();
				String dataType = mapTemp.get("dataType")== null?"":mapTemp.get("dataType").toString();
				String lineStyleType = mapTemp.get("lineStyleType")== null?"":mapTemp.get("lineStyleType").toString();
				String yAxisIndex = mapTemp.get("yAxisIndex")== null?"":mapTemp.get("yAxisIndex").toString();
				String lineColor = mapTemp.get("lineColor")== null?"":mapTemp.get("lineColor").toString();
				String lineStyleWidth = mapTemp.get("lineStyleWidth")== null?"":mapTemp.get("lineStyleWidth").toString();
				
				if(i!=0){
					legendData.append(",");
					seriesData.append(",");
				}
				i++;
				legendData.append("'");
				legendData.append(dataName);
				legendData.append("'");
				
				StringBuffer dataItem = new StringBuffer();
				
				dataItem.append("{");
				dataItem.append("name:'");
				dataItem.append(dataName);
				dataItem.append("',");
				dataItem.append("type:'");
				dataItem.append(dataType);
				dataItem.append("',");
				if(!"".equals(lineStyleType) || !"".equals(lineColor) || !"".equals(lineStyleWidth)){
					dataItem.append("itemStyle:{normal:{");
					if(!"".equals(lineColor)){
						dataItem.append("color:'");
						dataItem.append(lineColor);
						dataItem.append("',");
					}
					if(!"".equals(lineStyleType) || !"".equals(lineStyleWidth)){
						dataItem.append("lineStyle:{");
						if(!"".equals(lineStyleType)){
							dataItem.append("type:'");
							dataItem.append(lineStyleType);
							dataItem.append("',");
						}
						if(!"".equals(lineStyleWidth)){
							dataItem.append("width:");
							dataItem.append(lineStyleWidth);
							dataItem.append(",");
						}
						dataItem.append("},");
					}
					dataItem.append("}},");
				}
				
				if(!"".equals(yAxisIndex)){
					dataItem.append("yAxisIndex: 1,");
				}
				
				dataItem.append("data:[");
				int j=0;
				for(Map<String,Object> dataMap:dataList){
					String dataValue = dataMap.get(dataCloumn)== null?"'-'":dataMap.get(dataCloumn).toString();
					if("0".equals(dataValue)){
						dataValue = "'-'";
					}
					if(j!=0){
						dataItem.append(",");
					}
					dataItem.append(dataValue);
					j++;
				}
				dataItem.append("]");
				dataItem.append("}");
				seriesData.append(dataItem.toString());
			}
		}
		legendData.append("]");
		seriesData.append("]");
		
		returnStr.append("{");
		returnStr.append("'axisData':");
		returnStr.append(axisData.toString());
		returnStr.append(",");
		
		returnStr.append("'legendData':");
		returnStr.append(legendData.toString());
		returnStr.append(",");
		
		returnStr.append("'seriesData':");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
	
		return returnStr.toString();
	}
	
	
	//需要特殊标记颜色的时候使用   统一调整颜色请使用initDataChart
	public static String initDataColorChart(List<Map<String,Object>> dataList,List<Map<String,Object>> initList,Map<String,Object> initMap){
		StringBuffer returnStr = new StringBuffer();
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		//默认颜色
		String defaultColor = initMap.get("defaultColor")== null?"":initMap.get("defaultColor").toString();
		//指定颜色
		String locationColor = initMap.get("locationColor")== null?"":initMap.get("locationColor").toString();
		
		String locationCloumn = initMap.get("locationCloumn")== null?"":initMap.get("locationCloumn").toString();
		String locationValue = initMap.get("locationValue")== null?"":initMap.get("locationValue").toString();
		
		StringBuffer axisData = new StringBuffer();
		StringBuffer seriesData = new StringBuffer();
		StringBuffer legendData = new StringBuffer();
		
		axisData.append("[");
		if(dataList != null){
			int i = 0;
			for(Map<String,Object> dataMap:dataList){
				String axisName = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
				if(i != 0){
					axisData.append(",");
				}
				axisData.append("'");
				axisData.append(axisName);
				axisData.append("'");
				i++;
			}
		}
		axisData.append("]");
		
		legendData.append("[");
		seriesData.append("[");
		if(initList != null){
			int i=0;
			for(Map<String,Object> mapTemp:initList){
				String dataName = mapTemp.get("dataName")== null?"":mapTemp.get("dataName").toString();
				String dataCloumn = mapTemp.get("dataCloumn")== null?"":mapTemp.get("dataCloumn").toString();
				String dataType = mapTemp.get("dataType")== null?"":mapTemp.get("dataType").toString();
				String lineStyleType = mapTemp.get("lineStyleType")== null?"":mapTemp.get("lineStyleType").toString();
				String yAxisIndex = mapTemp.get("yAxisIndex")== null?"":mapTemp.get("yAxisIndex").toString();
				
				String barCategoryGap = mapTemp.get("barCategoryGap")== null?"":mapTemp.get("barCategoryGap").toString();
				
				if(i!=0){
					legendData.append(",");
					seriesData.append(",");
				}
				i++;
				legendData.append("'");
				legendData.append(dataName);
				legendData.append("'");
				
				StringBuffer dataItem = new StringBuffer();
				
				dataItem.append("{");
				dataItem.append("name:'");
				dataItem.append(dataName);
				dataItem.append("',");
				dataItem.append("type:'");
				dataItem.append(dataType);
				dataItem.append("',");
				if(!"".equals(lineStyleType)){
					dataItem.append("itemStyle:{normal:{lineStyle:{type:'");
					dataItem.append(lineStyleType);
					dataItem.append("'}}},");
				}
				
				if(!"".equals(barCategoryGap)){
					dataItem.append("barCategoryGap:'");
					dataItem.append(barCategoryGap);
					dataItem.append("',");
				}
				
				if(!"".equals(yAxisIndex)){
					dataItem.append("yAxisIndex: 1,");
				}
				
				dataItem.append("data:[");
				int j=0;
				for(Map<String,Object> dataMap:dataList){
					String dataValue = dataMap.get(dataCloumn)== null?"'-'":dataMap.get(dataCloumn).toString();
					if(dataValue != null){
						if(j!=0){
							dataItem.append(",");
						}
						dataItem.append(dataValue);
					}
					j++;
				}
				dataItem.append("]");
				
				if(!"".equals(locationCloumn)){
					dataItem.append(",itemStyle: {normal:{color: function(params) {var colorList=[");
					int k=0;
					for(Map<String,Object> dataMap:dataList){
						String dataValue = dataMap.get(locationCloumn)== null?null:dataMap.get(locationCloumn).toString();
						if(dataValue != null){
							if(k!=0){
								dataItem.append(",");
							}
							dataItem.append("'");
							if(locationValue.equals(dataValue)){
								dataItem.append(locationColor);
							}else{
								dataItem.append(defaultColor);
							}
							dataItem.append("'");
						}
						k++;
					}
					dataItem.append("];return colorList[params.dataIndex]}}}");
				}
				
				
				
				dataItem.append("}");
				seriesData.append(dataItem.toString());
			}
		}
		legendData.append("]");
		seriesData.append("]");
		
		returnStr.append("{");
		returnStr.append("'axisData':");
		returnStr.append(axisData.toString());
		returnStr.append(",");
		
		returnStr.append("'legendData':");
		returnStr.append(legendData.toString());
		returnStr.append(",");
		
		returnStr.append("'seriesData':");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
	
		return returnStr.toString();
	}
	
	public static String initPieDataChart(List<Map<String,Object>> dataList,Map<String,Object> initMap){
		StringBuffer returnStr = new StringBuffer();
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		String dataCloumn = initMap.get("dataCloumn")== null?"":initMap.get("dataCloumn").toString();
		
		StringBuffer seriesData = new StringBuffer();
		
		seriesData.append("[");
		if(dataList != null){
			int i = 0;
			for(Map<String,Object> dataMap:dataList){
				String dataName = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
				String dataValue = dataMap.get(dataCloumn)== null?"'-'":dataMap.get(dataCloumn).toString();
				if(i != 0){
					seriesData.append(",");
				}
				seriesData.append("{value:");
				seriesData.append(dataValue);
				seriesData.append(",");
				seriesData.append("name:'");
				seriesData.append(dataName);
				seriesData.append("'");
				seriesData.append("}");
				i++;
			}
		}
		seriesData.append("]");
		
		returnStr.append("{");
		returnStr.append("'seriesData':");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
	
		return returnStr.toString();
	}
	
	public static String initRadarDataChart(List<Map<String,Object>> dataList,Map<String,Object> initMap,List<Map<String,Object>> dataCloumnList){
		StringBuffer returnStr = new StringBuffer();
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		
		StringBuffer indicatorData = new StringBuffer();
		indicatorData.append("[");
		int i=0;
		for(Map<String,Object> dataMap:dataList){
			StringBuffer indicator = new StringBuffer();
			String nameValue = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
			double maxValue = 0.0;
			for(Map<String,Object> dataCloumnMap:dataCloumnList){
				String dataCloumn = dataCloumnMap.get("dataCloumn")== null?"":dataCloumnMap.get("dataCloumn").toString();
				double dataValue =  dataMap.get(dataCloumn)== null?0:Double.parseDouble(dataMap.get(dataCloumn).toString());
				if(maxValue < dataValue){
					maxValue = dataValue;
				}
			}
			maxValue = maxValue * (1+ 0.1);
			if(i!= 0){
				indicator.append(",");
			}
			indicator.append("{");
			indicator.append("name: '");
			indicator.append(nameValue);
			indicator.append("',");
			indicator.append("max:");
			indicator.append(maxValue);
			indicator.append("}");
			i++;
		}
		indicatorData.append("]");
		
		StringBuffer seriesData = new StringBuffer();
		seriesData.append("[");
		int j=0;
		for(Map<String,Object> dataCloumnMap:dataCloumnList){
			StringBuffer dataSB = new StringBuffer();
			
			String dataName = dataCloumnMap.get("dataName")== null?"":dataCloumnMap.get("dataName").toString();
			String dataCloumn = dataCloumnMap.get("dataCloumn")== null?"":dataCloumnMap.get("dataCloumn").toString();
			
			dataSB.append("{");
			dataSB.append("name : '");
			dataSB.append(dataName);
			dataSB.append("',");
			dataSB.append("value :[");
			int k = 0;
			for(Map<String,Object> dataMap:dataList){
				double dataValue =  dataMap.get(dataCloumn)== null?0:Double.parseDouble(dataMap.get(dataCloumn).toString());
				if(k != 0){
					dataSB.append(",");
				}
				dataSB.append(dataValue);
				k++;
			}
			dataSB.append("]}");
			
			if(j!= 0){
				seriesData.append(",");
			}
			seriesData.append(dataSB.toString());
			j++;
		}
		seriesData.append("]");
		
		returnStr.append("{");
		returnStr.append("'indicatorData':");
		returnStr.append(indicatorData.toString());
		returnStr.append(",");
		returnStr.append("'seriesData':");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
		
		return returnStr.toString();
	}
	
	//堆积图
	public static String initStackDataChart(List<Map<String,Object>> dataList,List<Map<String,Object>> initList,Map<String,Object> initMap){
		StringBuffer returnStr = new StringBuffer();
		
		String nameCloumn = initMap.get("nameCloumn")== null?"":initMap.get("nameCloumn").toString();
		StringBuffer axisData = new StringBuffer();
		StringBuffer seriesData = new StringBuffer();
		StringBuffer legendData = new StringBuffer();
		
		axisData.append("[");
		if(dataList != null){
			int i = 0;
			for(Map<String,Object> dataMap:dataList){
				String axisName = dataMap.get(nameCloumn)== null?"":dataMap.get(nameCloumn).toString();
				if(i != 0){
					axisData.append(",");
				}
				axisData.append("'");
				axisData.append(axisName);
				axisData.append("'");
				i++;
			}
		}
		axisData.append("]");
		
		legendData.append("[");
		seriesData.append("[");
		if(initList != null){
			int i=0;
			for(Map<String,Object> mapTemp:initList){
				String dataName = mapTemp.get("dataName")== null?"":mapTemp.get("dataName").toString();
				String dataCloumn = mapTemp.get("dataCloumn")== null?"":mapTemp.get("dataCloumn").toString();
				String dataType = mapTemp.get("dataType")== null?"":mapTemp.get("dataType").toString();
				String lineStyleType = mapTemp.get("lineStyleType")== null?"":mapTemp.get("lineStyleType").toString();
				String yAxisIndex = mapTemp.get("yAxisIndex")== null?"":mapTemp.get("yAxisIndex").toString();
				
				String lineColor = mapTemp.get("lineColor")== null?"":mapTemp.get("lineColor").toString();
				String barCategoryGap = mapTemp.get("barCategoryGap")== null?"":mapTemp.get("barCategoryGap").toString();
				String lineStyleWidth = mapTemp.get("lineStyleWidth")== null?"":mapTemp.get("lineStyleWidth").toString();
				
				if(i!=0){
					legendData.append(",");
					seriesData.append(",");
				}
				i++;
				legendData.append("'");
				legendData.append(dataName);
				legendData.append("'");
				
				StringBuffer dataItem = new StringBuffer();
				
				dataItem.append("{");
				dataItem.append("name:'");
				dataItem.append(dataName);
				dataItem.append("',");
				dataItem.append("type:'");
				dataItem.append(dataType);
				dataItem.append("',");
				dataItem.append("stack:'活用户占比',");
				if(!"".equals(lineStyleType) || !"".equals(lineColor) || !"".equals(lineStyleWidth)){
					dataItem.append("itemStyle:{normal:{");
					if(!"".equals(lineColor)){
						dataItem.append("color:'");
						dataItem.append(lineColor);
						dataItem.append("',");
					}
					if(!"".equals(lineStyleType) || !"".equals(lineStyleWidth)){
						dataItem.append("lineStyle:{");
						if(!"".equals(lineStyleType)){
							dataItem.append("type:'");
							dataItem.append(lineStyleType);
							dataItem.append("',");
						}
						if(!"".equals(lineStyleWidth)){
							dataItem.append("width:");
							dataItem.append(lineStyleWidth);
							dataItem.append(",");
						}
						dataItem.append("},");
					}
					dataItem.append("}},");
				}
				
				if(!"".equals(barCategoryGap)){
					dataItem.append("barCategoryGap:'");
					dataItem.append(barCategoryGap);
					dataItem.append("',");
				}
				
				if(!"".equals(yAxisIndex)){
					dataItem.append("yAxisIndex: 1,");
				}
				
				dataItem.append("data:[");
				int j=0;
				for(Map<String,Object> dataMap:dataList){
					String dataValue = dataMap.get(dataCloumn)== null?"'-'":dataMap.get(dataCloumn).toString();
					if(dataValue != null){
						if(j!=0){
							dataItem.append(",");
						}
						dataItem.append(dataValue);
					}
					j++;
				}
				dataItem.append("]");
				dataItem.append("}");
				seriesData.append(dataItem.toString());
			}
		}
		legendData.append("]");
		seriesData.append("]");
		
		returnStr.append("{");
		returnStr.append("'axisData':");
		returnStr.append(axisData.toString());
		returnStr.append(",");
		
		returnStr.append("'legendData':");
		returnStr.append(legendData.toString());
		returnStr.append(",");
		
		returnStr.append("'seriesData':");
		returnStr.append(seriesData.toString());
		returnStr.append("}");
	
		return returnStr.toString();
	}
}
