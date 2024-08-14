class Photo {
	int? id;
	String? fileName;
	String? filePath;
	String? fileType;
	int? fileSize;
	String? relationType;
	int? relationId;

	Photo({
		this.id, 
		this.fileName, 
		this.filePath, 
		this.fileType, 
		this.fileSize, 
		this.relationType, 
		this.relationId, 
	});

	factory Photo.fromJson(Map<String, dynamic> json) => Photo(
				id: json['id'] as int?,
				fileName: json['fileName'] as String?,
				filePath: json['filePath'] as String?,
				fileType: json['fileType'] as String?,
				fileSize: json['fileSize'] as int?,
				relationType: json['relationType'] as String?,
				relationId: json['relationId'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'fileName': fileName,
				'filePath': filePath,
				'fileType': fileType,
				'fileSize': fileSize,
				'relationType': relationType,
				'relationId': relationId,
			};
}
