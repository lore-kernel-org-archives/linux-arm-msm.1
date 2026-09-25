Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BFF2F8EB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296095; cv=none; b=V1BaToV27Zo0sg6r1+NUtIzNsHfrkPrxQ+IVpLQjGsQN5IgiBBGr+YRdfCnk/KEXGf0xsJZeoFrDl83K4/gHjvfty7f7Yrf+o+MUhB5n86k1UaAd45n77clmqG62xN87du5V0JRjvw05Lx9eszlX9c525cqG5xRqwuuwn04T4x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296095; c=relaxed/simple;
	bh=qhDIKatvc8QjYzDdfJRdI//vvXfzsp3LwrBw+VlkXP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDP2NQC8ApEDQ82vipAzCfNmbcivEdAXDZSaxDVC4858gpxYznlNzv8DvUwiGB4WLFSKR4rxqqhS/ggCSo03sGhxtzRKLa92Uh2YgKsN+GcBkrfMg6o5Ivzprsp9gv4d4/hJjeRzj745lLaD0x9CIM3MWWRsKailpoEB2uM3xuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6wQj/OV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2/xh570; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6wQj/OV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2/xh570"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPYMj4088216
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=; b=A6wQj/OVziz/LSZB
	DxBCGvnHrW9NIYeCKgMM7xtTIOttkIz/Wfst35SmSOzTSjTt+YXV111Wv9qDMz7N
	E4YSk29c/ZGMlMZKuvJYkqAxTKKcGvsxpKt0JHo9vlEuKjs4sWPOW8Onxbp4jbmC
	PkcZGbuhq2OKU6Z8oruKOKM/znynj+J7SoRHAvirZay9prb2toI/ckHky93xMB4n
	0+SXITFlurSkYWsMfxLPhurt73vHxKjqWpy4a/By/SVrzp+D7r2+4Wjbgh08uUGm
	Qk8yAg3CeUAdARnn5q/uBJsIZH9r7Iz3EnYvaJuLSfm6jO356fTy2UCzsFlaNwS/
	juFh0Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s936qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-339628f2bbaso19438eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 17:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296090; x=1790900890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=;
        b=B2/xh570EhO9CA3tFGGJP80xFY2ciCb7eoXdzNglrLzbaS8koOP3HhSoDOCIAA6/ct
         fN2v+YEn/LDZg3HiN/leNTDOWMIViRD+zxJuqOO7NwtnKJLSs3v6TUyLUq3S8gLKF6T8
         oKpfGsasKkx66mizzUpMBdlBBV9poWlX/Ut1PT3fc5O3HmEDaloBWiZaB/qLcy+I+14Y
         0HxdkiaBho3nUAArIaeES5FSLmW2TAxmjIt3JeS2zbPF6sulVOIMN9cPmaePrBpkApIm
         RnTnvlcPwkJI5nIHXTMg+bg9fZ0YccG7PUv18Wo0D8orQxXjQG+dRLtuIfIWmFRrhaPZ
         2bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296090; x=1790900890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=;
        b=kG31MZEfxzCaOgEdsYNxibHzr77J6/Ky0hpaJPOWcnGojUBfJ/jRU2+f3vdPv8KidI
         FzjNU8F27d1OoNCO/YPBH4z4IZpKACqEAXUd7CWY5LCEKieidBtbHU6STbazTbQuQfM4
         9hzhltdSu6KewUl3w5yzjRf2Z6EaNRTRXFhc6+ozbw8tNCp/E1qPf+ugyqoQPHvY42bk
         IpGvckbgbhxCSaH+Zy8Npu5JT8LBcrz+4tCRKNdo0oHlNIjcwhxo811FuH/oIai2TU69
         jr/lzZRFOH9u7YG9MbZRwQAaCNzQ+4F9IW67Wy8D7vr63Oh0bJxmQOtd3iVeP9V9dXue
         0eDA==
X-Forwarded-Encrypted: i=1; AKwUvBz/VULo2ZduVxEOd+clHNPjFm7XM2i21O1dpkpPB/ZZ+nAzSBpLDOTYHDEHuNygif2APs7Esof/8o5TDRp0@vger.kernel.org
X-Gm-Message-State: AFuF++n9WnakLL3eASAtOyYZId+d8jqLGpXk1b1Zg0Lm2Ge0Kpqdbm/g
	mKkyOPR9UPDQaOCWL5hAK6ybMNf7pZHo027Bk1yha3J9LaWn3aCi02AtSDpxVYX+HLDbwRECrNS
	i+lB4rvrfoHLxTkLSEu7wy3YqohkiuPRI/lixkbA628gRNnzT8q8jAL0Mtj6O48tUTgzk
X-Gm-Gg: AYBFou0DQJw0qYhPxfHVajEMGcHWR1viL6EyCQnYV2ti1KZB9pcruXC2jabXkRec4Ls
	W08ULovg35EaafIcaR0VV70wMEisCYRw/OGIg1P04tsbMgkeu+aRYLvNDaM5XloG6H3RPvleKyw
	dcYSbmzkdg0Papr7EWjks/F85imkNvDkKJT0sUm+0PkTXW9Z9gequAQ+yj9CMHZ/H3QRoH+eDzx
	AKqdKqpEwu47ZO8zBmk2bola7SYRgHPxKa3ANeyPlHfWNqVrjBfP/P8e+zOO9fC0Oa6gU+O1fPg
	TaERtMy4tjGZrn8PJlVPy5mkjnyZ+ZvUmsDSyAXTl0qP2rs6mfW+0s3LuFhOsVL2jII3cKEX62w
	h9EySrS+eEPheLNr75mVfblG2D+Q9AGZ3v5HNHLqnMnjOOgPE1WOITAIvWObX
X-Received: by 2002:a05:7300:c8c9:b0:33b:e1f2:fa0d with SMTP id 5a478bee46e88-3414a4a3283mr1294774eec.2.1790296089690;
        Thu, 24 Sep 2026 17:28:09 -0700 (PDT)
X-Received: by 2002:a05:7300:c8c9:b0:33b:e1f2:fa0d with SMTP id 5a478bee46e88-3414a4a3283mr1294742eec.2.1790296088913;
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm1873736eec.16.2026.09.24.17.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:28:04 -0700
Subject: [PATCH v7 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-enc_roi_enable-v7-3-6fa7413af23c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790296085; l=7477;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qhDIKatvc8QjYzDdfJRdI//vvXfzsp3LwrBw+VlkXP8=;
 b=fZklzdJAq+WgyQOwPW63YkW7uA6aK0n9SN+YQ0Hpnqsvrw15QBDgKS6/WTItVZLlblhA+Ow73
 7i9MieTcHhBAFamrAMqOE/UUJf9wqWwOmfyn3cXKxAJYoQZLTWmigTa
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX3ZMkP+U5E3br
 hJpwkdlvFSCW2A9gCcj+KCdCn66WMaVco0Pu8U5GEmizl3c+fAnKYRRoJNSa25jixmHqBAk9yhd
 2RsutEgGH7MZKINk3D7G2/mR07Mdj5iRCRqe2OOUMA26wTEAn2PZNzLN9DQ3JaFb3QZcDhRPPwO
 uE+Dc8wNb+G8oUFSjKXR6YeKENZU/SeRM4PjTXJfhq/QogcvGNAFlPTOLF77QLFasd8QpxuUSzS
 QSuf23klzh/hrRIjFx5JFsin04KGib3/cgYq7qbSf1bOcn6GhbTBY7nTtoRwQqafrQe80lUhlnF
 Pv6A+fmIHLNtckKfdugDTMe5YoRbK+guz/zfdAq3OYNRL+10x4v+myUbYdOf3NZBUZM40+1cnSo
 U+H51HHtlQzz4rN2b+twT35SvCvNN6zUIKMy+TONmgBuaIPVTg8xf0farBIzhvHmhzT/yTd8r8Y
 DNPAtRTd7oTjDOjnh0w==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab5c01a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX6rxI3pT7axTf
 AHuGiF8F9lrKzhz+vO11yNmR94DC066u/JXSN7xZfa89s/sb7pLZGdgFksGkoS5wq1E9aWNIJpZ
 pr3AMVFEzhrWJyveFHJv3FNvA79Lnzg=
X-Proofpoint-ORIG-GUID: XsVTF_I8PsAUivbUphUy5LMNF12aLDHK
X-Proofpoint-GUID: XsVTF_I8PsAUivbUphUy5LMNF12aLDHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250001

Add ROI support to the Iris encoder driver for HFI Gen2 based targets.

- Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
  platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
  p_array and elems fields to hold a pointer to the per-frame
  delta QP array and its element count, set during s_ctrl.
- Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
  array control (max dims = 139264 entries, supporting resolution of
  8192x4352 at 16x16 MB granularity).
  Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
  control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
- Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..9f84d28d00ab25555f1d2259f7ef0ed0786a0271 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -156,6 +156,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER5_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		return REQUEST_SYNC_FRAME;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -301,6 +305,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
 	case REQUEST_SYNC_FRAME:
 		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -327,6 +335,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -335,8 +351,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -361,7 +422,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -379,6 +440,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3b8fbefb8b93576962abd3850215f7b7fb364930..d628bc6748438b19dac01cd11cb9f8da0b8500af 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1782,6 +1782,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_req_sync_frame,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..08fc1036013de29e51747a6425ae7bb805ca3e0f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -133,6 +133,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..9910eb5514b3ae0a6b5349adb071d0a56375102c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -186,6 +186,8 @@ enum platform_inst_fw_cap_type {
 	LAYER5_BITRATE_HEVC,
 	REQUEST_SYNC_FRAME,
 	TIME_DELTA_BASED_RC,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -197,6 +199,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -206,6 +209,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);

-- 
2.34.1

