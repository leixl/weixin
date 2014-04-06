String.prototype.sub = function(len, ext) {
	var r = /[^\x00-\xff]/g;
	if (this.replace(r, "00").length <= len)
		return this;
	var m = Math.floor(len / 2);
	for (var i = m; i < this.length; i++) {
		if (this.substr(0, i).replace(r, "00").length >= len) {
			var result = this.substr(0, i);
			if (ext)
				result += ext;
			return result
		}
	}
	return this
};
function getFileUploadErrorInfo(file, errorCode, message, swfUploadInstance) {
	try {
		var errInfo = "";
		switch (errorCode) {
			case SWFUpload.UPLOAD_ERROR.HTTP_ERROR :
				var msg = "上传失败:jsessionid丢失,请您重新登录后再使用上传功能!";
				errInfo = msg;
				alert(msg);
				swfUploadInstance.debug("Error Code: HTTP Error, File name: "
						+ file.name + ", Message: " + message);
				break;
			case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED :
				errInfo = "上传失败";
				swfUploadInstance
						.debug("Error Code: Upload Failed, File name: "
								+ file.name + ", File size: " + file.size
								+ ", Message: " + message);
				break;
			case SWFUpload.UPLOAD_ERROR.IO_ERROR :
				errInfo = "上传失败:服务器IO错误";
				swfUploadInstance.debug("Error Code: IO Error, File name: "
						+ file.name + ", Message: " + message);
				break;
			case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR :
				errInfo = "验证失败:安全设置错误";
				swfUploadInstance
						.debug("Error Code: Security Error, File name: "
								+ file.name + ", Message: " + message);
				break;
			case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED :
				errInfo = "验证失败:上传超出限制";
				swfUploadInstance
						.debug("Error Code: Upload Limit Exceeded, File name: "
								+ file.name + ", File size: " + file.size
								+ ", Message: " + message);
				break;
			case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED :
				errInfo = "验证失败:验证失败,上传跳过";
				swfUploadInstance
						.debug("Error Code: File Validation Failed, File name: "
								+ file.name
								+ ", File size: "
								+ file.size
								+ ", Message: " + message);
				break;
			case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED :
				errInfo = "上传提示:上传被取消";
				break;
			case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED :
				errInfo = "上传提示:上传被停止";
				break;
			default :
				errInfo = "Unhandled Error: " + errorCode;
				swfUploadInstance.debug("Error Code: " + errorCode
						+ ", File name: " + file.name + ", File size: "
						+ file.size + ", Message: " + message);
				break
		}
		return errInfo
	} catch (ex) {
		swfUploadInstance.debug(ex)
	}
}
function getFileValidateErrorInfo(file, errorCode, message, swfUploadInstance) {
	var errInfo = "";
	switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT :
			errInfo += "校验信息:文件太大";
			swfUploadInstance.debug("Error Code: File too big, File name: "
					+ file.name + ", File size: " + file.size + ", Message: "
					+ message);
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE :
			errInfo += "校验信息:0字节文件";
			swfUploadInstance.debug("Error Code: Zero byte file, File name: "
					+ file.name + ", File size: " + file.size + ", Message: "
					+ message);
			break;
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE :
			errInfo += "校验信息:文件类型错误";
			swfUploadInstance
					.debug("Error Code: Invalid File Type, File name: "
							+ file.name + ", File size: " + file.size
							+ ", Message: " + message);
			break;
		default :
			if (file !== null) {
				errInfo += "校验信息:系统未知错误"
			}
			swfUploadInstance.debug("Error Code: " + errorCode
					+ ", File name: " + file.name + ", File size: " + file.size
					+ ", Message: " + message);
			break
	}
	return errInfo
}
function getFormatFileSize(bitnum) {
	if (bitnum < 1048576) {
		if (bitnum < 1024) {
			return bitnum + 'B'
		} else {
			return Math.ceil(bitnum / 1024) + 'K'
		}
	} else {
		return Math.ceil(100 * bitnum / 1048576) / 100 + 'M'
	}
}