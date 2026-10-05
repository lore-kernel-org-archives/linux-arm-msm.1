Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F16414421
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236296; cv=none; b=JZfZA7HOppI5Ik8yb03EgKi4tVcVlzXt93xAC1cWnv1CD4U1LJDBsSQ8hnYRRCU5ak766gtKuxHZfy2rkv7X9OxNH5odppV4RXSrWa0nVVvzQmlwxOuj8K6oQS8qNOX5tYiP6ckHqbRfRgL+aOKhXtGPY81xpqlj20yisKFan08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236296; c=relaxed/simple;
	bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfNfUatRwIfbLxD67bYoUNPe81dcnaIyA1hwUYIgxRV4wx1ArBoysFFiVypcuOPa/Y9cTO84VPEvvMmFgQX8uZc+WhOS2tzGVBcJ1AOUSWLky8gRLs/3vMsUVMoSr9BShztBz+o/DdtVFsBZfglG+CjCiICJrm3yrQ0PeJdPAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiy0VQcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJIll47/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiy0VQcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJIll47/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMjlW1535291
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 21:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=; b=eiy0VQcYuMkY3TzI
	lS/hRmPb/kM4z98tfrbtWCqAJ/vwTIHladMveftJ/erS3mcnRE6fZL1X8IWrHKRr
	EXqKaM41rsuGsiIx5TYOXmH3V54pNCnkRP+KLRBYJF1n0OdwlwSQ2QfnWivth2iC
	dNpXk9wM92zDJS77wj1CmOkiimxO7ZVOa3XLChkX2JEp9r7ZT4n6qIOt33YWoz+c
	bjH5sZUEvk7FBNStR0EAFYU3zMQP4G88sV9hyWsu5s4SWkNk9NbddPsGs99PwRxF
	VQonYjn26b87+Jz5osbXrW0HNK9bdLm/XPp6naaXhjg+N7x+pkjpGn5sXzayMLP7
	q9jQSQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnchm47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 21:38:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33e4e0f0302so310798eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791236292; x=1791841092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=WJIll47/rjr3GT8Yn/NWU0xpfwALjS2QiYkcwj9HZKWTuGDu6PXLyChi0xlYv0oOJ3
         LsS/liof/q7XsdfPLmbBEfIxyam4yAsHyG1h7WgqEgiggSuLwlIooCFe8+7baf+e4MBH
         hpmU2JHhmHTTl1HkP3N7lgxlelk067YJCmUjBCQArSohRFMYzL0rQjF0umlNQHj6Ex+p
         LIPQcgBSHd2hFQIj7dcGrtyv+HZd10bHS1Z72ezbqeUdXTWKRMRahgYwi1ziCcFoAKvq
         3fW1z8tW9Qnr44CEG32+NUjskx0VttTiOEdsy/0dof0tACS2JwA+yATxmvpPSUdgyBrl
         ptTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236292; x=1791841092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=1zdI4j3+jMatK+yXdqCRT0Wttc8ibTvmmcd9AZc5yhum9/PxcJ7AGSVnHKVuP6mxce
         slBXoIGZMj7xVCOz9FZLqqJ2hROZEmzV2FrC5P9QTwYdhlvAFl39I05LUi9zoCP12CnA
         BVv4YAbBVPaDgOnH5ZwJ1U4n5EP8/gwi6VaxSMCd48YqbmtK8s5TPx3Pe7fljvNr/NFC
         murG3JrtlArvw05t7XCmNRV21h/0NxMG7O8RK91QYrkx6ewPI9J68tCp+m92S395KR5g
         0PvQ+srWEZjUv3CTQLe3Qho2Zo+/4WVELKAArbA/3mDge/akVK0+q0Io8B3yyLET/o/8
         EE7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYJFeynXj81IoeJSVu1MBhhsegX87g614rjSiYfD3N/PgSUENfAZoVD43JXW15UZqvMECjGz/UfM4bxI3L@vger.kernel.org
X-Gm-Message-State: AFuF++mD1QWALc5o3TMFad/KGYM9cVUq6SbcIcHs/E3+xlbChIq6aH9g
	SbtiYJXBHAqM9I15r4TPVMQeBRMuuqWBfayXGCto39OBI50gXLlFjf2YOTecoDnf5HiAKXhBq3A
	Ay2hLjRPL0O/2icWRXhhSXDPlukJBeOYZ8w0FvYC4DoaW0MZwLnRjQH901YXSgf1InZCv
X-Gm-Gg: AYBFou3dL2l6g+C7MI9bv+26ZnJzp7QPGhe0qzv42CQNUfU11pf97jB+9w59u7GcNYu
	60T5y6H18t9KIm8WagqsZ7y+Ln9ye1InUz0FUPWYXMhNm61EyP/tMRLrjHzhyQpK/m92mIEHQ32
	PL6IvGiLHdIYzIjzFeQsCLaEWNNwaSAdJcstees2QQ6rYcAaMeehKqusOS7BXg3ov8MltAVbkvq
	L4q7uX+/PHu0s51EQbuqZEcsKOHJ0LRvwObkrncQ4BD8ytsoiud5vooR3nPZAA+inOfPptLmi/H
	Y2zf+8iBRl+Ng+63IAy2IkfI2Magq1vTBAggFthSiPTTcoh5qzryOlTsor64cQm1jT5YsOT3gk8
	BiF/7RoqWIG+jpn6z0dDqxdabPhAsFFT8PpL11ntpjb+aJ2YhUykbNCsJShRk
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34f1507015fmr19988802eec.2.1791236292384;
        Mon, 05 Oct 2026 14:38:12 -0700 (PDT)
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34f1507015fmr19988747eec.2.1791236291458;
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm1064954eec.14.2026.10.05.14.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:38:07 -0700
Subject: [PATCH v9 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-enc_roi_enable-v9-2-831c24135cb1@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
In-Reply-To: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791236289; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
 b=TBVGJ+j0HTCzE2fbTEQ4WQvXkKIIp19cgDKxu3OYpxYg80xZFEfzeCfFQkzvmJsB5Ax+lCs6H
 HFa0806SNuCBAbtW4eDwPGD0viBZBDTqqEt4YGiuU3t8um2y1peM4Xb
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX0e4jXuOtmlJq
 DswrItslANWvdcY7RkMrKk90VucA1pEB6pG6HJOAZKZCVWYAj3xxgN0plsoBOmdpRyoXf86n/j8
 MSFRuCvDaHLfwoBlnl0+LG6LjSjYN34=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac418c5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1QmljvIsaQW41_L5TpFMoRBto3XmBavS
X-Proofpoint-ORIG-GUID: 1QmljvIsaQW41_L5TpFMoRBto3XmBavS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX0w93TbTyGp8m
 ICsVx9NXCa2ONX0rHv1JBpLc3j7E+d/9NnDmyXPvWLUliGzvRvd9TrKuV1/zTXs/jGgtoZYICyc
 jHFbJHQrHL3RvXlT9ZS+M3yFAyZPJqRHJ7QZod6lun9lpeFFTYhQkxzNG4QIqi+yCo7VPBf8O2H
 yksVcbUiDJVQaj/Zvi2kjqwSIRUK4C5YN9bGlMEEP6fEKf8lvXb8j9H+0b9G/fENrfhpFwyYPDt
 G0j7TW3F/1wvUY+v9jlVtfrvCEMIjscI0vNfKt+o8uQHl4RiDuoRQshtLrvWrd1FcmT2bVFI2tv
 kUwOP+LPlgYK+aVvJYcTQSK03J5H2CaCIYPXzf7T78RBKJbTRPtd2uGtBloH8G1nAiLxQl9LGsU
 nIjhtnwiAY4785NEKgbjsX0gDopK19scY7RwMCLZVsH7wHhNG+K305yJQWnOt2yAtIAT6xiGDBm
 nrRVFPXFk50O67WLFgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050085

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

