//
//  GLSMediator+MapManager.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+MapManager.h"

NSString * const kGLSMediatorMapManager = @"Mapmanager";

NSString * const kGLSMediatorPassengerMapManager = @"defaultManager";

NSString * const kGLSMediatorServiceKey = @"serviceKey";

NSString * const kGLSMediatorSingleLocation = @"singleLocation";

NSString * const kGLSMediatorKeyWordSearch = @"keyWordSearch";

NSString * const kGLSMediatorActionGeocodeSearch = @"geocodeSearch";

NSString * const kGLSMediatorActionReGeocodeSearch = @"reGeocodeSearch";

NSString * const kGLSMediatorActionRouteSearch = @"searchRoutePlanningDrive";

NSString * const kGLSMediatorMapOrderCreate = @"mapOrderCreate";

NSString * const kGLSMediatorActionContinuousLocation = @"continuousLocation";

NSString * const kGLSMediatorActionStopContinuousLocation = @"stopContinuousLocation";

NSString * const kGLSMediatorCenterCoordinateWithPoint = @"centerCoordinateWithPoint";

NSString * const kGLSMediatorActionMapOrderStateChange = @"mapOrderStateChange";
NSString * const kGLSMediatorActionSCTXManagerRemove = @"removeSCTXManager";
NSString * const kGLSMediatorActionAdjustMapVieGLState = @"adjustMapVieGLState";

NSString * const kGLSMediatorConfigNearbyCarController = @"configNearbyCarController";
NSString * const kGLSMediatorRemoveNearbyCarController = @"removeNearbyCarController";
NSString * const kGLSMediatorResetNearbyCarController = @"resetNearbyCarController";

NSString * const kGLSMediatorConfigHotSpotController = @"configHotSpotController";
NSString * const kGLSMediatorRemoveHotSpotController = @"removeHotSpotController";

NSString * const kGLSMediatorGetMapView = @"getMapView";
NSString * const kGLSMediatorAddCenterTipView = @"addTips";
NSString * const kGLSMediatorRemoveCenterTipView = @"removeTips";
NSString * const kGLSMediatorAddTipAnimation = @"addTipAnimation";

NSString * const kGLSMediatorSetGLSManagerDelegate = @"setGLSManagerDelegate";

NSString * const kGLSMediatorGetCurrentLocationModel = @"getCurrentLocationModel";
NSString * const kGLSMediatorGetStartLocationModel = @"getStartLocationModel";
NSString * const kGLSMediatorGetEndLocationModel = @"getEndLocationModel";
NSString * const kGLSMediatorSetCurrentLocationModel = @"setCurrentLocationModel";
NSString * const kGLSMediatorSetStartLocationModel = @"setStartLocationModel";
NSString * const kGLSMediatorSetEndLocationModel = @"setEndLocationModel";

NSString * const kGLSMediatorSetMapZoomLevel = @"setMapZoomLevel";
NSString * const kGLSMediatorGetResidueDistanceAndTime = @"getResidueDistanceAndTime";

NSString * const kGLSMediatorAddStartEndPoint = @"addStartEndPoint";
NSString * const kGLSMediatorRemoveStartEndPoint = @"removeStartEndPoint";

NSString * const kGLSMediatorChangeStartPointTipView = @"changeStartPointTipViewWithText";
NSString * const kGLSMediatorChangeCarTipViewWithText = @"changeCarTipViewWithText";
NSString * const kGLSMediatorShoGLStartEndMapRect = @"shoGLStartEndMapRect";


NSString * const kGLSMediatorTrackFollowUserLocation = @"trackFollowUserLocation";
NSString * const kGLSMediatorExistenceCarTipView = @"existenceCarTipView";
NSString * const kGLSMediatorSetSctxOrderID = @"setSctxOrderID";

NSString * const kGLSMediatorRemoveCarTip = @"removeCarTip";
NSString * const kGLSMediatorSetMapCurrentStatee = @"setMapCurrentState";
NSString * const kGLSMediatorSetDriverMapManagerDelegate = @"setGLSMapManagerDelegate";
NSString * const kGLSMediatorSetGLSMapManagerContinuousLocationDelegate = @"setGLSMapManagerContinuousLocationDelegate";
NSString * const kGLSMediatorCarImageType = @"carImageType";
NSString * const kGLSMediatorShoGLStartAndCarAnnotation = @"shoGLStartAndCarAnnotation";
NSString * const kGLSMediatorShoGLStartAndEndAnnotation = @"shoGLStartAndEndAnnotation";
NSString * const kGLSMediatorAddDriverRoute = @"addDriverRoute";
NSString * const kGLSMediatorAddPassengerLocate = @"addPassengerLocate";
NSString * const kGLSMediatorRemovePassengerLocate = @"removePassengerLocate";
NSString * const kGLSMediatorMutiRouteDidSelectRoute = @"mutiRouteDidSelectRoute";
NSString * const kGLSMediatorCloseMutiRouteSelect = @"closeMutiRouteSelect";
NSString * const kGLSMediatorRemoveMapRoute = @"removeMapRoute";
NSString * const kGLSMediatorShoGLSCTXMapRect = @"SCTXMapRect";
NSString * const kGLSMediatorGetDriverServiceDrivers= @"getDriverServiceDrivers";
NSString * const kGLSMediatorRemoveDriverServiceDrivers = @"removeDriverServiceDrivers";
NSString * const kGLSMediatorShowDrivers = @"drivershoGLServiceDrivers";
NSString * const kGLSMediatorShoGLStartEndDrivers = @"shoGLStartEndForDriverService";

@implementation GLSMediator (MapManager)
/**获取地图管理单例*/
- (id)mapManager{

    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorPassengerMapManager
                 params:@{@"key":@"value"}
      shouldCacheTarget:YES
     ];

    return nil;
}

/**高德Key设置*/
- (void)setServiceKey:(NSString *)key{
    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorServiceKey
                 params:@{@"key":key}
      shouldCacheTarget:
     YES
     ];
}

/**单次定位*/
- (void)singleLocation_Type:(MapType)mapType
              SuccessAction:(void(^)(NSDictionary *dic))successAction
               ErrrorAction:(void(^)(NSDictionary *dic))errorAction{
    
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    
    if (mapType == MapType_GaoDe) {
        paramsToSend[@"mapType"] = @"0";
    }else{
        paramsToSend[@"mapType"] = @"1";
    }

    if (successAction) {
        paramsToSend[@"successAction"] = successAction;
    }

    if (errorAction) {
        paramsToSend[@"errorAction"] = errorAction;
    }

    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorSingleLocation
                 params:paramsToSend
      shouldCacheTarget:NO];
}

/**打开连续定位*/
- (void)startContinuousLocation
{
   [self performTarget:kGLSMediatorMapManager
                action:kGLSMediatorActionContinuousLocation
                params:@{@"key":@"value"}
     shouldCacheTarget:YES
    ];
}

/**关闭连续定位*/
- (void)stopContinuousLocation {

   [self performTarget:kGLSMediatorMapManager
                action:kGLSMediatorActionStopContinuousLocation
                params:@{@"key":@"value"} shouldCacheTarget:YES];
}

/**POI搜索*/
- (void)keyWordSearch_Type:(MapType)mapType
                      City:(NSString *)city
                   SubType:(NSString *)subType
                       Lat:(NSString *)lat
                       Lon:(NSString *)lon
                   KeyWord:(NSString *)keyWord
            CallBackAction:(void(^)(NSArray *array))callBackAction{

    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];

    if (mapType == MapType_GaoDe) {
        paramsToSend[@"mapType"] = @"0";
    }else{
        paramsToSend[@"mapType"] = @"1";
    }

    if (city) {
        paramsToSend[@"city"] = city;
    }

    if (callBackAction) {
        paramsToSend[@"callBackAction"] = callBackAction;
    }
    paramsToSend[@"subType"] = subType;
    paramsToSend[@"lat"] = lat;
    paramsToSend[@"lon"] = lon;
    paramsToSend[@"keyWord"] = keyWord;

    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorKeyWordSearch
                 params:paramsToSend
      shouldCacheTarget:NO];
}

/**地理编码*/
- (void)geocodeSearch_Type:(MapType)mapType
                      City:(NSString *)city
                   KeyWord:(NSString *)keyWord
            CallBackAction:(void(^)(NSArray *array))callBackAction{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (mapType == MapType_GaoDe) {
        paramsToSend[@"mapType"] = @"0";
    }else{
        paramsToSend[@"mapType"] = @"1";
    }

    if (city) {
        paramsToSend[@"city"] = city;
    }

    if (callBackAction) {
        paramsToSend[@"callBackAction"] = callBackAction;
    }

    paramsToSend[@"keyWord"] = keyWord;

    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorActionGeocodeSearch
                 params:paramsToSend
      shouldCacheTarget:YES];

}

/**逆地理编码*/
- (void)reGeocodeSearch_Type:(MapType)mapType
                         Lat:(NSString *)lat
                         Lon:(NSString *)lon
              CallBackAction:(void(^)(NSDictionary *dic))callBackAction{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (mapType == MapType_GaoDe) {
        paramsToSend[@"mapType"] = @"0";
    }else{
        paramsToSend[@"mapType"] = @"1";
    }

    paramsToSend[@"callBackAction"] = callBackAction;
    paramsToSend[@"lat"] = lat;
    paramsToSend[@"lon"] = lon;
    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorActionReGeocodeSearch
                 params:paramsToSend
      shouldCacheTarget:YES];
}


/**路径搜索*/
- (void)routeSearch_Type:(MapType)mapType
                startLat:(double)startLat
                startLon:(double)startLon
                  endLat:(double)endLat
                  endLon:(double)endLon
           SuccessAction:(void(^)(NSDictionary *sucDic))successAction
             ErrorAction:(void(^)(NSDictionary *errorDic))errorAction{
   NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
   if (mapType == MapType_GaoDe) {
      paramsToSend[@"mapType"] = @"0";
   }else{
      paramsToSend[@"mapType"] = @"1";
   }

   paramsToSend[@"startLat"] = @(startLat);
   paramsToSend[@"startLon"] = @(startLon);
   paramsToSend[@"endLat"] = @(endLat);
   paramsToSend[@"endLon"] = @(endLon);
   paramsToSend[@"successAction"] = successAction;
   paramsToSend[@"errorAction"] = errorAction;

   [self performTarget:kGLSMediatorMapManager
                action:kGLSMediatorActionRouteSearch
                params:paramsToSend
     shouldCacheTarget:YES];

}

/**获取高德地图*/
- (id)getMapView{
   return [self performTarget:kGLSMediatorMapManager action:kGLSMediatorGetMapView params:@{@"key":@"value"} shouldCacheTarget:YES];
}

/**设置地图中心气泡*/
- (void)addCenterTips{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorAddCenterTipView params:@{@"key":@"value"} shouldCacheTarget:NO];
}

/**移除中心气泡**/
- (void)removeCenterTips{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemoveCenterTipView params:@{@"key":@"value"} shouldCacheTarget:NO];
}

/**添加气泡动画*/
- (void)addTipAnimation{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorAddTipAnimation params:@{@"key":@"value"} shouldCacheTarget:NO];
}

/**设置GLSManager代理*/
- (void)setUserMapManagerDelegate:(id)target{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetGLSManagerDelegate params:@{@"target":target} shouldCacheTarget:NO];
}

/**获取当前位置Model*/
- (id)getCurrentLocationModel{
   return [self performTarget:kGLSMediatorMapManager action:kGLSMediatorGetCurrentLocationModel params:@{} shouldCacheTarget:NO];
}

/**获取起点Model*/
- (id)getStartLocationModel{
   return [self performTarget:kGLSMediatorMapManager action:kGLSMediatorGetStartLocationModel params:@{} shouldCacheTarget:NO];
}

/**获取终点Model*/
- (id)getEndLocationModel{
   return [self performTarget:kGLSMediatorMapManager action:kGLSMediatorGetEndLocationModel params:@{} shouldCacheTarget:NO];
}

/**设置当前位置Model*/
- (void)setCurrentLocationModel:(id)model{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetCurrentLocationModel params:@{@"key":model} shouldCacheTarget:NO];
}

/**设置起点Model*/
- (void)setStartLocationModel:(id)model{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetStartLocationModel params:@{@"key":model} shouldCacheTarget:NO];
}

/**设置终点Model*/
- (void)setEndLocationModel:(id)model{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetEndLocationModel params:@{@"key":model} shouldCacheTarget:NO];
}

/**设置地图大小*/
- (void)setZoomLevel:(CGFloat)zoomLevel{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetMapZoomLevel params:@{@"zoomLevel":@(zoomLevel)} shouldCacheTarget:NO];
}

/**增加起点终点标注*/
- (void)addStartAndEndPointWithStartLat:(CGFloat)startlat
                               StartLon:(CGFloat)startlon
                                 EndLat:(CGFloat)endlat
                                 EndLon:(CGFloat)endlon{
   [self performTarget:kGLSMediatorMapManager
                action:kGLSMediatorAddStartEndPoint
                params:@{@"startlat":@(startlat),@"startlon":@(startlon),@"endlat":@(endlat),@"endlon":@(endlon)} shouldCacheTarget:NO];
}
/**移除起点终点标注*/
- (void)removeStartAndEndPoint{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemoveStartEndPoint params:@{} shouldCacheTarget:NO];
}

/**修改起点气泡信息*/
- (void)changeStartPointTipViewWithText:(NSMutableAttributedString *)text OtherText:(NSMutableAttributedString *)otherText Type:(NSInteger)type{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorChangeStartPointTipView params:@{@"text":text,@"otherText":otherText,@"type":@(type)} shouldCacheTarget:NO];
}

/**修改小车气泡信息*/
- (void)changeCarTipViewWithText:(NSMutableAttributedString *)text OtherText:(NSMutableAttributedString *)otherText Type:(NSInteger)type{
    //加判断是因为传nil调用会闪退
    if (otherText.length == 0) {
        otherText = [[NSMutableAttributedString alloc]initWithString:@""];
    }
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorChangeCarTipViewWithText params:@{@"text":text,@"otherText":otherText,@"type":@(type)} shouldCacheTarget:NO];
}

/**获取车辆剩余距离和时间*/
- (id)getResidueDistanceAndTime{
    return [self performTarget:kGLSMediatorMapManager action:kGLSMediatorGetResidueDistanceAndTime params:@{} shouldCacheTarget:NO];
}

/**显示起点终点地图区域*/
- (void)showMapRectEdgePadding:(UIEdgeInsets)edageInsets ShowRectType:(ShowRectType)rectType{

    NSDictionary *dic = @{@"top":@"0",@"left":@"0",@"bottom":@"0",@"right":@"0"};
    if (edageInsets.top || edageInsets.left || edageInsets.bottom || edageInsets.right) {
        dic  = @{@"top":@(edageInsets.top),@"left":@(edageInsets.left),@"bottom":@(edageInsets.bottom),@"right":@(edageInsets.right)};
    }
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorShoGLStartEndMapRect params:@{@"edage":dic,@"type":@(rectType)} shouldCacheTarget:NO];
}


/**判断是否存在小车气泡*/
- (BOOL)existenceCarTipView{
   return [self performTarget:kGLSMediatorMapManager action:kGLSMediatorExistenceCarTipView params:@{} shouldCacheTarget:NO];
}

/**设置地图中心点坐标*/
- (void)setCenterCoordinateWithPoint:(NSString *)latStr lonStr:(NSString *)lonStr {

   NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
   paramsToSend[@"lat"] = latStr;
   paramsToSend[@"lon"] = lonStr;
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorCenterCoordinateWithPoint params:paramsToSend shouldCacheTarget:NO];
}

/**追踪用户位置*/
- (void)setTrackFollowUserLocation{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorTrackFollowUserLocation params:nil shouldCacheTarget:NO];
}

/**设置SXTX订单ID*/
- (void)setSCTXOrderID:(NSString *)orderID{
   [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetSctxOrderID params:@{@"orderID":orderID} shouldCacheTarget:NO];
}

/**设置车辆类型*/
- (void)setCarType:(NSString *)carType {
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"key"] = carType;
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorCarImageType params:paramsToSend shouldCacheTarget:YES];
}

/**移除地图线路*/
- (void)removeMapRoute{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemoveMapRoute params:@{} shouldCacheTarget:NO];
}

/**添加附近代驾司机*/
- (void)addDriversForDriverService:(NSArray <NSDictionary *> *)drivers ShowBubble:(BOOL)showBubble{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorGetDriverServiceDrivers params:@{@"drivers":drivers,@"showBubble":@(showBubble)} shouldCacheTarget:NO];
}

/**移除附近代驾司机*/
- (void)removeDriversForDriverService{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemoveDriverServiceDrivers params:@{} shouldCacheTarget:NO];
}

/**显示代驾司机*/
- (void)showDriversForDriverService{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorShowDrivers params:@{} shouldCacheTarget:NO];
}

/**显示代驾司机起点终点*/
- (void)shoGLStartEndForDriverService{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorShoGLStartEndDrivers params:@{} shouldCacheTarget:NO];
}
#pragma mark  ======= SCTX Methord ========
/** 司乘同显创建订单 orderType: 0:司机端 1:乘客端*/
- (void)mapOrderCreateWithOrderId:(NSString *)orderID
                        OrderTyoe:(UserType)orderType
                          StarLat:(NSString *)starLat
                          StarLon:(NSString *)starLon
                           EndLat:(NSString *)endLat
                           EndLon:(NSString *)endLon{

   NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
   //id为空可拦截处理
   if (orderID) {
      paramsToSend[@"orderID"] = orderID;
   }else{
      NSLog(@"订单号为空,创建订单失败");
      return;
   }
   paramsToSend[@"orderType"] = @(orderType);
   paramsToSend[@"startLat"] = starLat;
   paramsToSend[@"startLon"] = starLon;
   paramsToSend[@"endLat"]  = endLat;
   paramsToSend[@"endLon"]  = endLon;

   [self performTarget:kGLSMediatorMapManager
                action:kGLSMediatorMapOrderCreate
                params:paramsToSend
     shouldCacheTarget:NO];

}

/**司乘同显改变订单状态 0:司机端 1:乘客端*/
- (void)mapStatueChangeWithType:(UserType)userType Statue:(NSString *)state{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"orderType"] = @(userType);
    paramsToSend[@"state"] = state;
    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorActionMapOrderStateChange
                 params:paramsToSend
      shouldCacheTarget:NO];
}

/**司乘同显Manager移除 0:司机端 1:乘客端*/
- (void)removeSCTXManagerWithType:(UserType)userType{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"orderType"] = @(userType);
    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorActionSCTXManagerRemove
                 params:paramsToSend
      shouldCacheTarget:NO];
}

/**调整SCTX地图显示区域*/
- (void)adjustMapVieGLState{
   [self performTarget:kGLSMediatorMapManager
                action:kGLSMediatorActionAdjustMapVieGLState
                params:@{}
     shouldCacheTarget:NO];
}

//高德：附近运力
- (void)configNearbyCarController {
    
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorConfigNearbyCarController params:@{} shouldCacheTarget:NO];
}

- (void)removeNearbyCarController {
    
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemoveNearbyCarController params:@{} shouldCacheTarget:NO];
}

- (void)resetNearbyCarController {
    
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorResetNearbyCarController params:@{} shouldCacheTarget:NO];
}

/**高德：附近上车点添加*/
- (void)configHotSpotController {
    
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorConfigHotSpotController params:@{} shouldCacheTarget:NO];
}
/**高德：移除附近上车点*/
- (void)removeHotSpotController {
    
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemoveHotSpotController params:@{} shouldCacheTarget:NO];
}

#pragma mark ===== 司机端 =====
/**移除小车气泡**/
- (void)removeCarTip{
    [self performTarget:kGLSMediatorMapManager
                 action:kGLSMediatorRemoveCarTip
                 params:@{}
      shouldCacheTarget:YES
     ];
}

///**设置地图状态*/
//- (void)setDriverMapVieGLState:(DriverMapVieGLState)currentState{
//    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetMapCurrentStatee params:@{@"currentState":@(currentState)} shouldCacheTarget:NO];
//}

/**设置GLSManager代理*/
- (void)setDriverMapManagerDelegate:(id)param {

    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"key"] = param;
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetDriverMapManagerDelegate params:paramsToSend shouldCacheTarget:YES];

}

/**设置连续定位*/
- (void)setContinuousLocationDelegate:(id)param {

    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"key"] = param;
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorSetGLSMapManagerContinuousLocationDelegate params:paramsToSend shouldCacheTarget:YES];
}

/**显示小车和起点合理显示*/
- (void)shoGLStartAndCarAnnotationEdgePadding:(UIEdgeInsets)edageInsets{
    NSDictionary *dic = @{@"top":@"0",@"left":@"0",@"bottom":@"0",@"right":@"0"};
    if (edageInsets.top || edageInsets.left || edageInsets.bottom || edageInsets.right){
        dic  = @{@"top":@(edageInsets.top),@"left":@(edageInsets.left),@"bottom":@(edageInsets.bottom),@"right":@(edageInsets.right)};
    }

    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorShoGLStartAndCarAnnotation params:@{@"edage":dic} shouldCacheTarget:NO];
}

/**起点终点合理显示*/
- (void)shoGLStartAndEndAnnotationEdgePadding:(UIEdgeInsets)edageInsets{
    NSDictionary *dic = @{@"top":@"0",@"left":@"0",@"bottom":@"0",@"right":@"0"};
    if (edageInsets.top || edageInsets.left || edageInsets.bottom || edageInsets.right){
        dic  = @{@"top":@(edageInsets.top),@"left":@(edageInsets.left),@"bottom":@(edageInsets.bottom),@"right":@(edageInsets.right)};
    }
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorShoGLStartAndEndAnnotation params:@{@"edage":dic} shouldCacheTarget:NO];
}

/**添加地图规划线路*/
- (void)addDriverRoute{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorAddDriverRoute params:@{} shouldCacheTarget:NO];
}

/**添加乘客位置*/
- (void)addPassengerLocateWithLat:(double)lat Lon:(double)lon HeadUrl:(NSString *)headUrl{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorAddPassengerLocate params:@{@"lat":@(lat),@"lon":@(lon),@"headUrl":headUrl} shouldCacheTarget:NO];
}

/**移除乘客位置*/
- (void)removePassengerLocate{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorRemovePassengerLocate params:@{} shouldCacheTarget:NO];
}

/**多线路选择*/
- (void)mutiRouteSelect:(NSInteger)index{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorMutiRouteDidSelectRoute params:@{@"routeIndex":@(index)} shouldCacheTarget:NO];
}

/**关闭多线路选择*/
- (void)closeMutiRouteSelect{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorCloseMutiRouteSelect params:@{} shouldCacheTarget:NO];
}

/**设置司乘同显地图显示区域*/
- (void)shoGLSCTXMapRect:(UIEdgeInsets)edgeInset{
    [self performTarget:kGLSMediatorMapManager action:kGLSMediatorShoGLSCTXMapRect params:@{@"top":@(edgeInset.top),@"left":@(edgeInset.left),@"bottom":@(edgeInset.bottom),@"right":@(edgeInset.right)} shouldCacheTarget:NO];
}
@end
