var SWFUpload;
if (typeof(SWFUpload) == "function") {
	SWFUpload.queue = {};
	SWFUpload.prototype.initSettings = (function(oldInitSettings) {
		return function() {
			if (typeof(oldInitSettings) == "function") {
				oldInitSettings.call(this)
			}
			this.customSettings.queue_cancelled_flag = false;
			this.customSettings.queue_upload_count = 0;
			this.settings.user_upload_complete_handler = this.settings.upload_complete_handler;
			this.settings.upload_complete_handler = SWFUpload.queue.uploadCompleteHandler;
			this.settings.queue_complete_handler = this.settings.queue_complete_handler
					|| null
		}
	})(SWFUpload.prototype.initSettings);
	SWFUpload.prototype.startUpload = function(fileID) {
		this.customSettings.queue_cancelled_flag = false;
		this.callFlash("StartUpload", false, [fileID])
	};
	SWFUpload.prototype.cancelQueue = function() {
		this.customSettings.queue_cancelled_flag = true;
		this.stopUpload();
		var stats = this.getStats();
		var fileId;
		while (stats.files_queued > 0) {
			fileId = this.getFile().id;
			document.getElementById(fileId).style.color = "red";
			document.getElementById(fileId + "_msg").parentNode.innerHTML = "已取消";
			stats.files_queued--;
			this.setStats(stats);
			this.cancelUpload()
		}
		if (document.getElementById(this.customSettings.myFileListTarget
				+ "Count"))
			document.getElementById(this.customSettings.myFileListTarget
					+ "Count").innerHTML = stats.files_queued
	};
	SWFUpload.prototype.clearQueue = function() {
		this.cancelQueue();
		var stats = this.getStats();
		while (stats.successful_uploads > 0) {
			stats.successful_uploads--;
			this.setStats(stats)
		}
		var panel = document
				.getElementById(this.customSettings.myFileListTarget);
		var rowscount = panel.rows.length;
		for (i = rowscount - 1; i > 0; i--) {
			panel.deleteRow(i)
		}
		if (document.getElementById(this.customSettings.myFileListTarget
				+ "Count"))
			document.getElementById(this.customSettings.myFileListTarget
					+ "Count").innerHTML = 0;
		if (document.getElementById(this.customSettings.myFileListTarget
				+ "SuccessUploadCount"))
			document.getElementById(this.customSettings.myFileListTarget
					+ "SuccessUploadCount").innerHTML = 0;
		if (this.customSettings.tdPercentUploaded)
			document.getElementById(this.customSettings.tdPercentUploaded).innerHTML = "";
		if (this.customSettings.tdCurrentSpeed)
			document.getElementById(this.customSettings.tdCurrentSpeed).innerHTML = "";
		if (this.customSettings.tdSizeUploaded)
			document.getElementById(this.customSettings.tdSizeUploaded).innerHTML = "";
		if (this.customSettings.tdTimeElapsed)
			document.getElementById(this.customSettings.tdTimeElapsed).innerHTML = "";
		if (this.customSettings.tdTimeRemaining)
			document.getElementById(this.customSettings.tdTimeRemaining).innerHTML = ""
	};
	SWFUpload.queue.uploadCompleteHandler = function(file) {
		var user_upload_complete_handler = this.settings.user_upload_complete_handler;
		var continueUpload;
		if (file.filestatus == SWFUpload.FILE_STATUS.COMPLETE) {
			this.customSettings.queue_upload_count++
		}
		if (typeof(user_upload_complete_handler) == "function") {
			continueUpload = (user_upload_complete_handler.call(this, file) == false)
					? false
					: true
		} else {
			continueUpload = true
		}
		if (continueUpload) {
			var stats = this.getStats();
			if (stats.files_queued > 0
					&& this.customSettings.queue_cancelled_flag == false) {
				this.startUpload()
			} else if (this.customSettings.queue_cancelled_flag == false) {
				this.queueEvent("queue_complete_handler",
						[this.customSettings.queue_upload_count])
			} else {
				this.customSettings.queue_cancelled_flag = false
			}
		}
	}
}