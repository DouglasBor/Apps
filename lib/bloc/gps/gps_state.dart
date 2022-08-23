part of 'gps_bloc.dart';

class GpsState extends Equatable {

  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;
  final bool isScreenInitial;

  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;
  bool get isMuestraScreen => isScreenInitial;

/*
  bool vuelvePantallaForm = false;
  bool get VuelvePantallaForm => vuelvePantallaForm;
  set VuelvePantallaForm (bool value){
    vuelvePantallaForm = value;
  }
  */
  
  const GpsState({
    required this.isGpsEnabled, 
    required this.isGpsPermissionGranted,
    required this.isScreenInitial
    //required this.VuelvePantallaForm
  });

  GpsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
    bool? isMuestraScreen
  }) => GpsState(
    isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled, 
    isGpsPermissionGranted: isGpsPermissionGranted ?? this.isGpsPermissionGranted,
    isScreenInitial: isMuestraScreen ?? this.isScreenInitial
  );
  
  @override
  List<Object> get props => [ isGpsEnabled, isGpsPermissionGranted ];

  @override
  String toString() => '{ isGpsEnabled: $isGpsEnabled, isGpsPermissionGranted: $isGpsPermissionGranted }';

}

