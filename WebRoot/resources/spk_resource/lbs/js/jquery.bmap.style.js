//1、模板样式
//添加样式示例：    map.setMapStyle({style:'midnight'});  

/**
 * --------自定义模板样式-----------------
 * @默认地图样式(normal)
 * @清新蓝风格(light)
 * @黑夜风格(dark)
 * @红色警戒风格(redalert)
 * @精简风格(googlelite)
 * @自然绿风格(grassgreen)
 * @午夜蓝风格(midnight)
 * @浪漫粉风格(pink)
 * @青春绿风格(darkgreen)
 * @清新蓝绿风格(bluish)
 * @高端灰风格(grayscale)
 * @强边界风格(hardedge)
 */
//2、个性化编辑样式
//添加样式示例： map.setMapStyle({styleJson: styleJsonA }); 
/**
 *-------个性化自定义样式A---------------------------*/

var styleJsonA = [
		 		                 {
		 		                    "featureType": "land",
		 		                    "elementType": "geometry",
		 		                    "stylers": {
		 		                              "color": "#e7f7fc"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "water",
		 		                    "elementType": "all",
		 		                    "stylers": {
		 		                              "color": "#96b5d6"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "green",
		 		                    "elementType": "all",
		 		                    "stylers": {
		 		                              "color": "#b0d3dd"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "highway",
		 		                    "elementType": "geometry.fill",
		 		                    "stylers": {
		 		                              "color": "#a6cfcf"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "highway",
		 		                    "elementType": "geometry.stroke",
		 		                    "stylers": {
		 		                              "color": "#7dabb3"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "arterial",
		 		                    "elementType": "geometry.fill",
		 		                    "stylers": {
		 		                              "color": "#e7f7fc"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "arterial",
		 		                    "elementType": "geometry.stroke",
		 		                    "stylers": {
		 		                              "color": "#b0d5d4"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "local",
		 		                    "elementType": "labels.text.fill",
		 		                    "stylers": {
		 		                              "color": "#7a959a"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "local",
		 		                    "elementType": "labels.text.stroke",
		 		                    "stylers": {
		 		                              "color": "#d6e4e5"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "arterial",
		 		                    "elementType": "labels.text.fill",
		 		                    "stylers": {
		 		                              "color": "#374a46"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "highway",
		 		                    "elementType": "labels.text.fill",
		 		                    "stylers": {
		 		                              "color": "#374a46"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "highway",
		 		                    "elementType": "geometry.stroke",
		 		                    "stylers": {
		 		                              "color": "#cc0000"
		 		                    }
		 		          },
		 		          {
		 		                    "featureType": "highway",
		 		                    "elementType": "geometry.fill",
		 		                    "stylers": {
		 		                              "color": "#67e132",
		 		                              "hue": "#27ce4a"
		 		                    }
		 		          }
		 		]
/**
 *-------个性化自定义样式B--------------------------*/
var styleJsonB = [
		 {
		           "featureType": "background",
		           "elementType": "all",
		           "stylers": {
		                     "color": "#021019",
		                     "lightness": 18,
		                     "saturation": 42
		           }
		 },
		 {
		           "featureType": "highway",
		           "elementType": "geometry.fill",
		           "stylers": {
		                     "color": "#000000"
		           }
		 },
		 {
		           "featureType": "highway",
		           "elementType": "geometry.stroke",
		           "stylers": {
		                     "color": "#147a92"
		           }
		 },
		 {
		           "featureType": "arterial",
		           "elementType": "geometry.fill",
		           "stylers": {
		                     "color": "#000000"
		           }
		 },
		 {
		           "featureType": "arterial",
		           "elementType": "geometry.stroke",
		           "stylers": {
		                     "color": "#0b3d51"
		           }
		 },
		 {
		           "featureType": "local",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#000000"
		           }
		 },
		 {
		           "featureType": "land",
		           "elementType": "all",
		           "stylers": {
		                     "color": "#08304b"
		           }
		 },
		 {
		           "featureType": "railway",
		           "elementType": "geometry.fill",
		           "stylers": {
		                     "color": "#000000"
		           }
		 },
		 {
		           "featureType": "railway",
		           "elementType": "geometry.stroke",
		           "stylers": {
		                     "color": "#08304b"
		           }
		 },
		 {
		           "featureType": "subway",
		           "elementType": "geometry",
		           "stylers": {
		                     "lightness": -70
		           }
		 },
		 {
		           "featureType": "building",
		           "elementType": "geometry.fill",
		           "stylers": {
		                     "color": "#000000"
		           }
		 },
		 {
		           "featureType": "all",
		           "elementType": "labels.text.fill",
		           "stylers": {
		                     "color": "#857f7f"
		           }
		 },
		 {
		           "featureType": "all",
		           "elementType": "labels.text.stroke",
		           "stylers": {
		                     "color": "#000000"
		           }
		 },
		 {
		           "featureType": "building",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#022338"
		           }
		 },
		 {
		           "featureType": "green",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#062032"
		           }
		 },
		 {
		           "featureType": "boundary",
		           "elementType": "all",
		           "stylers": {
		                     "color": "#1e1c1c"
		           }
		 },
		 {
		           "featureType": "manmade",
		           "elementType": "all",
		           "stylers": {
		                     "color": "#022338"
		           }
		 }
		]

/**
 *-------个性化自定义样式C--------------------------*/

var styleJsonC = [
         {
  		           "featureType": "background",
  		           "elementType": "all",
  		           "stylers": {
  		                     "color": "#222222",
  		                     "lightness": 18,
  		                     "saturation": 42
  		           }
  		 },
		 {
		           "featureType": "land",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#222222"
		           }
		 },
		 {
		           "featureType": "building",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#2b2b2b"
		           }
		 },
		 {
		           "featureType": "highway",
		           "elementType": "all",
		           "stylers": {
		                     "lightness": -42,
		                     "saturation": -91
		           }
		 },
		 {
		           "featureType": "arterial",
		           "elementType": "geometry",
		           "stylers": {
		                     "lightness": -77,
		                     "saturation": -94
		           }
		 },
		 {
		           "featureType": "green",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#1b1b1b"
		           }
		 },
		 {
		           "featureType": "water",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#181818"
		           }
		 },
		 {
		           "featureType": "subway",
		           "elementType": "geometry.stroke",
		           "stylers": {
		                     "color": "#181818"
		           }
		 },
		 {
		           "featureType": "railway",
		           "elementType": "geometry",
		           "stylers": {
		                     "lightness": -52
		           }
		 },
		 {
		           "featureType": "all",
		           "elementType": "labels.text.stroke",
		           "stylers": {
		                     "color": "#313131"
		           }
		 },
		 {
		           "featureType": "all",
		           "elementType": "labels.text.fill",
		           "stylers": {
		                     "color": "#8b8787"
		           }
		 },
		 {
		           "featureType": "background",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#000000",
		                     "hue": "#000000",
		                     "lightness": -39
		           }
		 },
		 {
		           "featureType": "local",
		           "elementType": "geometry",
		           "stylers": {
		                     "lightness": -75,
		                     "saturation": -91
		           }
		 },
		 {
		           "featureType": "subway",
		           "elementType": "geometry",
		           "stylers": {
		                     "lightness": -65
		           }
		 },
		 {
		           "featureType": "railway",
		           "elementType": "all",
		           "stylers": {
		                     "lightness": -40
		           }
		 },
		 {
		           "featureType": "boundary",
		           "elementType": "geometry",
		           "stylers": {
		                     "color": "#8b8787",
		                     "weight": "1",
		                     "lightness": -29
		           }
		 }
		]

/**
 *-------个性化自定义样式D--------------------------*/
var styleJsonD = [
                  {
                      "featureType": "background",
                      "elementType": "all",
                      "stylers": {
                                "color": "#000000"
                      }
            },
            {
                      "featureType": "land",
                      "elementType": "all",
                      "stylers": {
                                "color": "#444444",
                                "lightness": -67
                      }
            },
            {
                      "featureType": "water",
                      "elementType": "all",
                      "stylers": {
                                "color": "#3d85c6",
                                "lightness": -67
                      }
            },
            {
                      "featureType": "green",
                      "elementType": "all",
                      "stylers": {
                                "color": "#d9ead3",
                                "lightness": -88
                      }
            },
            {
                      "featureType": "manmade",
                      "elementType": "all",
                      "stylers": {
                                "color": "#cccccc",
                                "lightness": 28
                      }
            },
            {
                      "featureType": "building",
                      "elementType": "all",
                      "stylers": {
                                "visibility": "off"
                      }
            },
            {
                      "featureType": "road",
                      "elementType": "all",
                      "stylers": {
                                "color": "#444444"
                      }
            },
            {
                      "featureType": "arterial",
                      "elementType": "all",
                      "stylers": {
                                "visibility": "off"
                      }
            },
            {
                      "featureType": "highway",
                      "elementType": "geometry.fill",
                      "stylers": {
                                "color": "#000000"
                      }
            },
            {
                      "featureType": "railway",
                      "elementType": "geometry.stroke",
                      "stylers": {
                                "color": "#999999"
                      }
            },
            {
                      "featureType": "highway",
                      "elementType": "labels.text.stroke",
                      "stylers": {
                                "color": "#4c1130"
                      }
            },
            {
                      "featureType": "poi",
                      "elementType": "all",
                      "stylers": {
                                "visibility": "off"
                      }
            },
            {
                      "featureType": "label",
                      "elementType": "labels.text.fill",
                      "stylers": {
                                "color": "#20124d",
                                "visibility": "on"
                      }
            },
            {
                      "featureType": "label",
                      "elementType": "labels.text.stroke",
                      "stylers": {
                                "color": "#444444"
                      }
            }
  ]