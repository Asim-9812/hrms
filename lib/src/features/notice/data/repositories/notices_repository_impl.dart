

import 'package:dio/dio.dart';
import '../../../../core/api/api.dart';
import '../../domain/model/notice_model.dart';
import 'notice_repository.dart';



class NoticesRepositoryImpl implements NoticeRepository{
  final dio = Dio();

  @override
  Future<List<NoticeModel>> fetchNotices() async {
    DateTime currentDate = DateTime.now();
    try{
      List<NoticeModel> noticeList = [];
      final response = await dio.get(Api.getAllNotices);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        for(int i = 0; i < data.length; i++){
          final dto = NoticeModel.fromJson(data[i]);
          noticeList.add(dto);
          // final fromDate = DateTime.parse(dto.fromdatest);
          // final toDate = DateTime.parse(dto.todatest);
          // if(currentDate.isAfter(fromDate) && currentDate.isBefore(toDate)){
          //   noticeList.add(dto);
          // }
        }
        return noticeList;
      } else {
        throw Exception('Failed to fetch data');
      }
    }on DioException catch(err){
      print(err);
      throw Exception('Failed to fetch data');
    }
  }
}
