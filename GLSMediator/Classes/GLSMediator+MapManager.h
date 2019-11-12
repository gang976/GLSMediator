//
//  GLSMediator+MapManager.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

typedef enum : NSUInteger {
    UserType_Driver = 0,
    UserType_Passager,
} UserType;

typedef enum : NSUInteger {
   MapType_GaoDe = 0,
   MapType_BaiDu,
   MapType_Tencent
} MapType;

typedef NS_ENUM(NSInteger,ShowRectType){
   ShowRectTypeStart = 0,
   ShowRectTypeStartAndEnd,
   ShowRectTypeCarAndEnd
};

//typedef NS_ENUM(NSInteger,DriverMapVieGLState){
//    DriverMapVieGLStateFree = 0,
//    DriverMapVieGLStateWaitStart,//行程待开始
//    DriverMapVieGLStateReceiveOrder,//去接乘客
//    DriverMapVieGLStateArrive,//司机已到达
//    DriverMapVieGLStateStartCharge,//行程中
//    DriverMapVieGLStateStopCharge,//行程结束
//};


@interface GLSMediator (MapManager)

/**获取地图管理单例*/
- (id)mapManager;
/**高德Key设置*/
- (void)setServiceKey:(NSString *)key;
/**单次定位*/
- (void)singleLocation_Type:(MapType)mapType
              SuccessAction:(void(^)(NSDictionary *dic))successAction
               ErrrorAction:(void(^)(NSDictionary *dic))errorAction;
/**打开连续定位*/
- (void)startContinuousLocation;
/**关闭连续定位*/
- (void)stopContinuousLocation;
/**POI搜索 subType: 0:起点 1:终点*/
- (void)keyWordSearch_Type:(MapType)mapType
                      City:(NSString *)city
                   SubType:(NSString *)subType
                       Lat:(NSString *)lat
                       Lon:(NSString *)lon
                   KeyWord:(NSString *)keyWord
            CallBackAction:(void(^)(NSArray *array))callBackAction;
/**地理编码*/
- (void)geocodeSearch_Type:(MapType)mapType
                      City:(NSString *)city
                   KeyWord:(NSString *)keyWord
            CallBackAction:(void(^)(NSArray *array))callBackAction;
/**逆地理编码*/
- (void)reGeocodeSearch_Type:(MapType)mapType
                         Lat:(NSString *)lat
                         Lon:(NSString *)lon
              CallBackAction:(void(^)(NSDictionary *dic))callBackAction;
/**路径搜索*/
- (void)routeSearch_Type:(MapType)mapType
                startLat:(double)startLat
                startLon:(double)startLon
                  endLat:(double)endLat
                  endLon:(double)endLon
           SuccessAction:(void(^)(NSDictionary *sucDic))successAction
             ErrorAction:(void(^)(NSDictionary *errorDic))errorAction;

/**获取地图*/
- (id)getMapView;
/**设置地图中心气泡*/
- (void)addCenterTips;
/**移除地图中心气泡*/
- (void)removeCenterTips;
/**添加气泡动画*/
- (void)addTipAnimation;
/**设置乘客端地图代理*/
- (void)setUserMapManagerDelegate:(id)target;
/**获取当前位置Model*/
- (id)getCurrentLocationModel;
/**获取起点Model*/
- (id)getStartLocationModel;
/**获取终点Model*/
- (id)getEndLocationModel;
/**设置当前位置Model*/
- (void)setCurrentLocationModel:(id)model;
/**设置起点Model*/
- (void)setStartLocationModel:(id)model;

/**设置终点Model*/
- (void)setEndLocationModel:(id)model;
/**设置地图大小*/
- (void)setZoomLevel:(CGFloat)zoomLevel;
/**增加起点终点标注*/
- (void)addStartAndEndPointWithStartLat:(CGFloat)startlat
                               StartLon:(CGFloat)startlon
                                 EndLat:(CGFloat)endlat
                                 EndLon:(CGFloat)endlon;
/**移除起点终点标注*/
- (void)removeStartAndEndPoint;
/**修改起点气泡信息*/
- (void)changeStartPointTipViewWithText:(NSMutableAttributedString *)text OtherText:(NSMutableAttributedString *)otherText Type:(NSInteger)type;
/**修改小车气泡信息*/
- (void)changeCarTipViewWithText:(NSMutableAttributedString *)text OtherText:(NSMutableAttributedString *)otherText Type:(NSInteger)type;
/**获取车辆剩余距离和时间*/
- (id)getResidueDistanceAndTime;
/**显示起点终点地图区域*/
- (void)showMapRectEdgePadding:(UIEdgeInsets)edageInsets ShowRectType:(ShowRectType)rectType;

/**判断是否存在小车气泡*/
- (BOOL)existenceCarTipView;
/**设置地图中心点坐标*/
- (void)setCenterCoordinateWithPoint:(NSString *)latStr lonStr:(NSString *)lonStr;
/**设置地图追踪用户位置*/
- (void)setTrackFollowUserLocation;
/**设置SCTX订单ID*/
- (void)setSCTXOrderID:(NSString *)orderID;
/**设置车辆类型*/
- (void)setCarType:(NSString *)carType;
/**移除地图线路*/
- (void)removeMapRoute;
/**添加附近代驾司机*/
- (void)addDriversForDriverService:(NSArray <NSDictionary *> *)drivers ShowBubble:(BOOL)showBubble;
/**移除附近代驾司机*/
- (void)removeDriversForDriverService;
/**显示代驾司机*/
- (void)showDriversForDriverService;
/**显示代驾司机起点终点*/
- (void)shoGLStartEndForDriverService;
#pragma mark ********* 司乘同显,附近运力,推荐上车点 ***********
/**司乘同显订单创建 orderType: 0:司机端 1:乘客端*/
- (void)mapOrderCreateWithOrderId:(NSString *)orderID
                        OrderTyoe:(UserType)orderType
                          StarLat:(NSString *)starLat
                          StarLon:(NSString *)starLon
                           EndLat:(NSString *)endLat
                           EndLon:(NSString *)endLon;

/**改变司机/乘客端订单状态 orderType: 0:司机端 1:乘客端 state: 0:未指定状态 1:去接乘客 2:等待乘客上车 3:乘客已上车 4:订单已结束*/
- (void)mapStatueChangeWithType:(UserType)userType Statue:(NSString *)state;
/**司乘同显Manager移除 0:司机端 1:乘客端*/
- (void)removeSCTXManagerWithType:(UserType)userType;
/**调整SCTX地图显示区域*/
- (void)adjustMapVieGLState;

/**高德：附近运力*/
- (void)configNearbyCarController;
- (void)removeNearbyCarController;
- (void)resetNearbyCarController;

/**高德：附近上车点*/
- (void)configHotSpotController;
- (void)removeHotSpotController;

#pragma mark ====== 司机端 =========
/**移除小车气泡*/
- (void)removeCarTip;

///**设置司机端地图状态*/
//- (void)setDriverMapVieGLState:(DriverMapVieGLState)currentState;

/**设置GLSManager代理*/
- (void)setDriverMapManagerDelegate:(id)param;
/**连续定位回调代理*/
- (void)setContinuousLocationDelegate:(id)param;
/**显示小车和起点合理显示*/
- (void)shoGLStartAndCarAnnotationEdgePadding:(UIEdgeInsets)edageInsets;
/**起点终点合理显示*/
- (void)shoGLStartAndEndAnnotationEdgePadding:(UIEdgeInsets)edageInsets;
/**添加地图规划线路*/
- (void)addDriverRoute;
/**添加乘客位置*/
- (void)addPassengerLocateWithLat:(double)lat Lon:(double)lon HeadUrl:(NSString *)headUrl;
/**移除乘客位置*/
- (void)removePassengerLocate;
/**多线路选择*/
- (void)mutiRouteSelect:(NSInteger)index;
/**关闭多线路选择*/
- (void)closeMutiRouteSelect;
/**设置司乘同显地图显示区域*/
- (void)shoGLSCTXMapRect:(UIEdgeInsets)edgeInset;

@end
