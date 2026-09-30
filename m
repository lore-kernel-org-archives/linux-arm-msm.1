Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC351C06B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793046; cv=none; b=Ngxv2L569oGRY8C1Mhb61zBnrTt0kopegU7jMqn8AlRwPL4bOlDlDORcL0lemS6/qKdjG833U9bel1ihM4BhmIm6whfmCOWc6satzQQvIz5Z9AUsLx9HMvw2DRBnx32tluu+dfKDT+/3zpSMgq6RYEZ2sgL6gIVWD2HvzfSMFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793046; c=relaxed/simple;
	bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lm6fFWKTx6jOPRkOth8LjISTuFBAvkEMFsmt5Z9OotfrMAjkDgITt8+rIaptMzB36Jpla95PJo2HOawZKKgOeSAy0ItSVlOMQQczn6zivB/GopuAKwONc3XsrkR1ELAB/4Kf/GSIgtUQ5v+2a2cY/SM0Ls824/VGMk0IWom9CM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0emmRTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaTIvY8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0emmRTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaTIvY8B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHeeGI1198581
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=; b=Y0emmRTPO5Dgke4J
	3zDLQB0KEmddrea5IZejO5mmim5R0jyL89QTMXPG0uzQyMCw7EQX58jza71u2deZ
	SPuWW56jcGdm4I8fjJu+ccJtFLG7W6jgV3zL+/2x8rqmaRDciN6boE5pxbFcFdf6
	1erOlIlwRsEjBnh/iTn5OX8n1C5E2gfAaoQ1FgcvUxEhIg58egje/LoTFfYnz2VI
	v6+fFqJg/nM/MAUHwvyPYnysNArr49A6TElHzsYPwzAkXRKTJTp6LKTdvw0eBPDT
	R4hENmn8RJOGkl27PPvhXFgcO2Iuw4ZS2C87AaYdly+GOL/rBsTJv0qKUckrOPUn
	piCSXw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136the8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-144c62cfb07so87689c88.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790793043; x=1791397843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=PaTIvY8BZooU+fZgeA/UC6x/V/tnACZE1lqJEeSouxlmhntmk7VShG5iB6yFmUye6w
         N9t3Y0T456lkwrJ7C17+unpO2qBciuf4M5QcaiHc9mXtRg91xtK/LSfF/Ds19+ANwKYR
         EXaCF2HcZp4ZthOxAVpsMHnsxtr2OO0OeVojZQYVpOAH6coVKh52jDuagk0B+tdVAUKQ
         B6ryJqWy42HFUntNKWh8kZVI8SymorOrLiXs+/9kAvbFPSWzULKfEZbRGtxjTfaYIOTn
         dhxVPZ9+3K7y/OzxNI9/TK1hYmfKQj8ut7x9YpHpSfH9yVXwZSxk60e5zeJq9gka4N5A
         ZCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793043; x=1791397843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=zW86mH1Gs5pBO0NhXI4EZYdExq8OFWQXgPin4eNWUU7K3nTWWhn1qrevuouFqGoP2U
         0XNepQxROf+f2/kngrrT9FsAs7Cm+/etL+PmM+m1bmt9tUGbFkmBO0YNRao4hezdf83g
         L2glABe+e/yhypKR9EoxXVn1xFYL0s8U5diui9dxJRmzzHAUFavXr8S0/fxldwG1E7jT
         z7cg4adi6yyDCL5DKodcaAefU5hbtBVRZTUoVQnaao20NRhvCJusb9aMik/FRU9FSPfa
         mjracGwiWE5N4o1FDOm+9LqQNeY1H+00qxMpWYRAJCG9rBzQRyX96Pz5PdPd5f8HzSh3
         wKIg==
X-Forwarded-Encrypted: i=1; AKwUvBzipa03t4EV5ydO2/x+0fcdi76ElsinDiZMsjV1eFxCpa5Hl0zUB8cAFSgboOy2AjYR3cZw3Hbx0djtvRT1@vger.kernel.org
X-Gm-Message-State: AFuF++lSUvyNDuebBfwxz+31kRuz1fh5BXeQWuOmWWx9Inzo3RnJmOQn
	hAmp/MFGUxc3nkRueeK7sjvBehSXtPnMJajfTtNnCzUOTB6XyyYafi6aLFbNzc5a9p1S+rDasCQ
	5NjZ44LjOaKlMBlBQuQ/7fqyG5NcFDDVrDGA2LGokZwc/zMO1AHC9K+HtlI1Sc9b8PBE7
X-Gm-Gg: AYBFou0nB8kiUEX73lWc7wUnHPwx344wq5jsca3p9pZbs35oZJrfzlcvKRt+l4xMJDZ
	jqjY+6oBjoNpJYrk3FtsE2TWNdwGkmLvS5mvCZalTnlHsVGB56v5JTKLoxrnor4n9/rwVQFpxjn
	6jfydeAcF2iJyfHT7NIu3lHyehWEDryjtGDy+GH1DyWwYgs+jUrS/w51fP0tetbOhFnyXQGNKZ9
	1U5S4aoZs+4GK6odtzaj1FTctBmVqN+merwcpBsliQF9GjAM71p9lAfqMv3im6iKjNT1z7f13Ga
	rHWXJfMQGv9DWwX6x+/p9F6mdDb6IiK/5he9pAsDLaK4/he59MImVgJa3eJe+5eBcJQb7wApJEd
	bZ30pCu19k4vyO0lPAJh+/BEI4tBjuc2xkuqC8UorEEh8p6Jb0Dg/KlASWV87
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id 5a478bee46e88-34cde6749bbmr4372940eec.1.1790793042632;
        Wed, 30 Sep 2026 11:30:42 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id 5a478bee46e88-34cde6749bbmr4372877eec.1.1790793041838;
        Wed, 30 Sep 2026 11:30:41 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm750926eec.24.2026.09.30.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:30:41 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:30:25 -0700
Subject: [PATCH v8 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-enc_roi_enable-v8-2-2c908f30e963@oss.qualcomm.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790793030; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
 b=wgFWpaxF7cexefTJUoRLScDh3HiuOhSB+yz9lgjV35GlbAMCBAJxsyPYQL5PMPfgx5BT1x/14
 5rrnaHqzjVlBk6q+WrW86JVUVuQdweF90pvl/4JSxu8bCGUBc0OliKn
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfXz4Cpf+tsieNx
 LD4WFfGQ7H2OLkqOq+5n7GWLjZMMSX2fwOXOZxHMe0iLH4iDCkt9ZKm7jWBRR0PzOPzjbaBUG91
 RRadaQzD2tT5WAlOYfh1vuVE3Y9wAqg=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd5553 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: LrAWS0ctLSDHDF_-sCRytA_vK3i3vsSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX8dnHVXondFaL
 4suqYkhmBkF0xb967k8Ypbk1UAtmNBlC1VSBx0SYozUPhFPa8EhB3jhOZSW6bFiq7r9daOOKDuf
 BFSALnaXqmUuwOvAgV7VR5I65JcqK4njJKbLHZfRYjNREdrmqEYudK+IPDJdWrnZNCEWyqYH/+C
 tCgilX+e6rfEdNAFASTkEK0QHrEuoJWxZG+FYFSKM/2IviqjH734wA6oKVInjnyDyDlx6joc1R3
 6OKIieMj9D6tGgPcuwjUITdfpg2Wbp//T49jNQfR51JcdsGTBDu8Pz9C7rIf76xop/mmtpRqD0m
 xVQLhsOXdXxStEF18IWZTfa56OmLzMCWKHWoSOS/4glihJ6fvWtR4irgRJF8fFBsaAO6ppWQJg6
 WHD2wpy+26vHPKt0RIuxxX8/VrmmpAL7WEyQd7xwwkVxOqIYl5jXjGfQc2a5ecRm7M6A5WCfP1D
 vGu3eNFGzuk4E0SLVow==
X-Proofpoint-GUID: LrAWS0ctLSDHDF_-sCRytA_vK3i3vsSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300075

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 27 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 ++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..28a47ca7b14397d3b7358c6a105f13092c6770f7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,33 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent. Driver can ignore the control if it is not set
+    along with the current frame.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
+    A read-only control that reports the MB Size used for the ROI delta_QP map.
+    The supported MB Size depends on the encoder codec.
+    Only square MBs are supported. The value returned represents the
+    width and height of each block in pixels. The ROI delta_QP map provided
+    through the ROI control must use the MB Size reported by this control.
+    The number of entries in the ROI delta_QP array is determined by the
+    frame resolution and the reported MB Size. If frame_width or frame_height
+    is not MB Size aligned, they must be ceiled using ceil(frame_width/MB Size)
+    ceil(frame_height/MB Size) for calculating the array size.
+    For example, for a QCIF frame if reported MB Size is 16,
+    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/16) = 99.
+    For frame resolutions that are not aligned to the MB size, for example
+    1920x1080, if the reported MB size is 32, the delta_qp array
+    must contain ceil(1920/32) * ceil(1080/32) = 2040 entries.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c5df0e0a54f81c73975f427957b7c99fd421d5ad..2318a548f16ebc1ec582f829c7945a8998b96708 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1410,6 +1410,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad24fd224cb5a8a0cc 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)

-- 
2.34.1

