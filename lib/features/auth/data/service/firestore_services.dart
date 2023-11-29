abstract class FireStoreServices {
  Future addUserDataFireStore(
    Map<String, dynamic> data,
    String collectionName,
    String docName,
  );


  Future getUserDataFromFireStore(String collectionName,String docName);

}
