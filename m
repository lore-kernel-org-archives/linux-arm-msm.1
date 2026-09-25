Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8DD2D1931
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296092; cv=none; b=qOIz3Jc0lON020ZFrgGBGRfxQenUL5OFo/69/ijD9F+3PLg4AgISSZBWSSxDB1o3H6wQozJiqr31pwVIxpkFFgwwbleYip4x4JQocOxhYiOVEf0avgyUIzOnHyzxjNg2qwVnkHJ3XNq12l6Ls76Fg1isJTEmSqYaDmwBD4pqxFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296092; c=relaxed/simple;
	bh=zsWqRKtlrZSWGWqLaRyE0mDAEmZ07PgIoNKYlaI+SjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WEa62mQWo93W3VAG4IrjmSqWabX3fgDYAki7v3dFFH+L6fxCLBfWUlCHKYTTLKRBjFx2kFAAe80dj0ip97g5C2Cxt2ZzSPxwLgTWrjCFRd6Tiua5nCynYP5pvtQX9k6y+Isetq6njgiVWQxCWH23ibxrDNrxPt2mY4DNGNf3c8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwgME2YP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GISgvpev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwgME2YP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GISgvpev"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP7694087293
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxnyWlwLC18eg+ibLHUUYwSrMx1l90B1bOPKgOZtRY0=; b=GwgME2YPg3gIp+fy
	LHlHdTyTlgqtcH5R43YFGqx7HlT10bUrbqthf7WbOii4t4KpASZt/JfNYg6dEAQY
	RQHxt0TAk9jD96Mb473ZGuozbmvCVZjv99KxrIRXscB0jKxOKWnYvLOiYuUIJiPN
	ZdwJCwgDKExcTt6dbZnS9EA1x1+KejsrlqZRIntnLCZNW8LlXxkP+C+Qp+X/LfMj
	1HzpEmlAH8ICpcMkbrAb9vxJS52Q3UbR1SL7hxd8NrfREjsMk38Og8NcshGQ2Ti1
	msYHP3ezT/cK4amj7zgPCuGlOtiuHFtpwX/COaJGrMabMQMgFPdTH5HtbxMvklwT
	jXDeVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s936qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bec6fc483so8824eec.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 17:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296089; x=1790900889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxnyWlwLC18eg+ibLHUUYwSrMx1l90B1bOPKgOZtRY0=;
        b=GISgvpev93mLnOSplySK6QxGlrs/7RVLSxK7PkIHwsuRbjiZNdiPayMPzVQOMdCwMk
         BQSOS/b7pPRKC4d5O4mGYNh7QxRZ4dxzYmwGoOrvKUr5c8opXyCqSq7UlnRr9n66WE3l
         0/uasld7cknBHZ7wJKoEgRJqd9T+5gpGIrkhUDSfI1t+rRfvapRzb3BOt0YJsLSiOOiP
         OK6cP0rSjeMMCOXX9URhyDBDzEd2KqXhwtSC46E/VKwl/IDU3Rd5iKDXhT3JRUiswzSm
         9Aagw/Rnb/Hb6+bmQVXI9/ZvcQxuaG6Q2B38Xf0mC23x/f4dwhpqMiMxcY3YAgCbshO+
         YntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296089; x=1790900889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxnyWlwLC18eg+ibLHUUYwSrMx1l90B1bOPKgOZtRY0=;
        b=VyRV5QFcUDmGbO9kgSj6pOIc5mnfpQwO0ak/L4qiHOw0R931W7XvN3KBZo3pcDo81p
         VElwOxT4mkS399Dugh+RqvtPeB49G5YHyay5zwA2Ks3nc0ubGiGSISDMcMdnrqwVrSI2
         /Pn2Gz+tOQ5fY1DWckY/7ITT7Md0QnbOrO2lfvRkS9TaZZBbhwFi4NFtNkFD6IFpj4+q
         mfs2rbv6dJ1uA5AubngU6uZsZGXQY2ARqRFyQX/AS0rQeWMfANXU6T/iw+CWRtGG6K05
         1atMRZ+auGb2rQmwy4b1Imf1zqvSfQB8EIMSsQZhCsQ78eyf0hE29XAy4pxmG2zQ9DHe
         jmbg==
X-Forwarded-Encrypted: i=1; AKwUvBwfl1TwJIha89WMBQy/+faaiP4pNRcAnMF9IcEX7kIjydWzja337GJt9furMT9qgQFGaEDsowIzcmqK744V@vger.kernel.org
X-Gm-Message-State: AFuF++mqigFK8vqwzIuL28HSwbXC8Y04lfCKnzf/b6SDy++WcgubdGqw
	nZJ9fqHQiK3dSayegGgf8S9PYS2Q0RbFWu18/K0zNHLy4FDLxcNP+JCpEhYji+v6HFwLaW6EMut
	n86tVJI1ySCoUFiYlyVMlMx+F4KLAQ/fJ0gWpjqwmoN7BbBm1dtYxNRSgMCBASl3gZ0lq
X-Gm-Gg: AYBFou3YoGU55W70p/7uUdJhkT33UICRNJ/Ddpe+1pwyvq56HxuZPXWYOgk1DDNUNLU
	DeT0LeJcG5OV2oZ0dg4m0qxNuo1wXNuP4urQF4Hh2rkFxqwy2plsI0jo2LEx1W+gfNF4ZcOzqPT
	rhwuCPxCZHJRxDxTGJ5cKCyt3jYX1hg0FalLmVYIJiARN60l7UiHkswsbMsNqpuRkIc4AMLTnBR
	n1IdliiMgvtp4UGJyX+Cu23pFDYqKNs7jPpewPkvSofJZHmMp4klndluNENL4DkWGoq1jUzBMIn
	s+aefQ35FEzdD7fxaRKaWrV4Jh9dR/yYEM57n6P/uEcunsII4v8Qz7gNiizKs2w+UvF3w9McPlT
	z6taAeO8/g6Vk+pmHFqAv3XTnHBYB99BM4EWAsNd+mvvJMPshlz/8HpntFiz4
X-Received: by 2002:a05:7300:6c12:b0:340:f698:fd56 with SMTP id 5a478bee46e88-3414a792afdmr1655009eec.2.1790296088711;
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
X-Received: by 2002:a05:7300:6c12:b0:340:f698:fd56 with SMTP id 5a478bee46e88-3414a792afdmr1654969eec.2.1790296088035;
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm1873736eec.16.2026.09.24.17.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:28:07 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:28:03 -0700
Subject: [PATCH v7 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790296085; l=5812;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=zsWqRKtlrZSWGWqLaRyE0mDAEmZ07PgIoNKYlaI+SjI=;
 b=T19hABZoOOOVC9RMfWOwjm8t7O5zOziPM7uC1FwzeXh3KXJnF2yW07mnILxd5IcmX8HrCRb3R
 MhwXXEVu1JZAB3VgttWOAqqx6KO9GZV+pNqrM6Z/j/p9VHrX0dezcsA
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfXwL/zNSxRbupa
 5yavoUSbL2Lba6ym1j03UUmgVJ36cRBQvy3lsg1qceu7V0Zy9PqR21nR7vL/cyvh0985+6CPzTf
 DLUvWaXcmsK6Gd7vJ0aDT2pJ8lLsfpfW5MPIrX6EGcq2uPyFofVos/jOoMe7l4Z+tSCvCKTbU/g
 xVVnk4wO07hXuB78KlRXCkAPywXr4+DhSERxxbx8o9Qt0clStKyWw4srQ6u0QeBlRlJJfFcLeAW
 0yOzFKBAmmeE/pWhBGEqpeSp3EByaJTrnMvXfL1Ks0Sowy94V53FuCLTbQhEHpq9+91IFnuKoyJ
 DHQ6j72nyffzEfD7WqOyYOcPhN8/Lq7I0jKnDiThwmtb8uKlzBga7kLJ9ngpQGaKY5KP3OxD2s4
 hDaoB14X9ahlnv0foq/Nj5nwMAXjQwMf7XOw73XEt7pqk/4MiDrN979og+IT6hrH+MrdVlye7dD
 1kIG6RP4P3y7qSStQuA==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab5c019 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfXx2IuznoQdEtZ
 0p2Iey5HewdWdfeZ6BCqZmerS6xNVtFj6E/Oe+fIDrrW6O7gVRNchELUpWGGX8qyJD/zkjcAq35
 1Kcn0yOTGJwcx3uBzih2J/z3ZIhY5gc=
X-Proofpoint-ORIG-GUID: EMj1hBj4zKnuEry5QR94BgEI7oIPw8J2
X-Proofpoint-GUID: EMj1hBj4zKnuEry5QR94BgEI7oIPw8J2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250001

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 26 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 +++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 41 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..a02ec20ec18f0e684973964d2de1759ad179b819 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,32 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent.
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

