Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C937423E95
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889375; cv=none; b=mVaWIgh4y/BU5dh442GTKv910p6gpgeajoiDfdiWGVIf6EYCZ5Ubg8Ok6fxSpd5VMOZLUbe9Ht0J4KRxkKdC6Xv5BGXjV7sh4V6hGM2ML4wNIDmF2qipRJE46CTJvU/kSA3RVA70OEVks0liR6r0gV1HLGr7xMRQZZV1Ro/SKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889375; c=relaxed/simple;
	bh=F77InqL9rsnjgX+yqKt/ImkMkd7iKrk5mMUJU9k/HEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBxdw1oMLUe0ihfb7evydO1zzd9KrNGLrXl6RMxapMQBBH96nkTu5BxGSHpp4rJbgvl0qeocASyR1xC7/JTxOwei6w4a0r5ukmN2jkn6BoA05wFDzS4uVOkT6vajCdEhvP/QSBRwOAUSEO02Joc1qYy1SAoLE5/gJhpS7T3w974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILGxgnma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zpft+E7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILGxgnma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zpft+E7A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADURh2720574
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3hYGut6TfV3I9NH02mInJzSkYevkJTj9GHIv+eaxqg=; b=ILGxgnmaArs7gXBj
	QboxA/uQIZOU46ScgWJ63G3IuIjTib8j8F5DNRMZ/ERxaUVMadXrD/iFuJKukGAL
	KxhjWdR/25DSL6e3iyS6IBlDtBe6sSpAH0b295Nc0/vpWilucxO1tLRkjsl/t8L9
	YJsqTFhcnouDByUsFmwoi5EKkfmu0EHzsSVVFys26aGvT2n9Ywl9CZ7FwMlDUbPo
	I76FgMr/crA46bumHM1lz6iTezqKyu5CB3IrMWRlggOcf9UlRo9enfZUoaA75qBC
	gvAkQ4LI/G16lQPye5BqN/A0TEMz08FfXnFDf/xvX/mcR2CQod0HVeUOmBBG2Eag
	3mDpRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag400-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so252583a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889371; x=1785494171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3hYGut6TfV3I9NH02mInJzSkYevkJTj9GHIv+eaxqg=;
        b=Zpft+E7ALF6vrys1nU5MnxoBcsyaU5/EEmaMXtOrxHHPNgnhp7CaxfLKnjqGJOsHaN
         gAvZuUZ+JWw8eEfdsnn3GkFFeF2Tuduoaziwl+j+/UJ+fHLUCm8aN+tV5FpjTmJc6OHi
         xA5B6cU5JK+zH+fVK6GHi4hKOSaJKFeefCNnf9RBAkBZbrM1g2RDLwmkEH+pmuvJZMPT
         N0tc95lBQwuVJZO7PV+CnD5JBwzgw5ZYrnAUBYlY946Kn1H4dkyvOzUpThld9o/7hFK1
         gjsRyDzqI1NP4O+i566UnKRZCwHoGdjR/yQ/9Xo7SNUKnrdGMln7HCzoc6nKz3ZZk5Av
         0NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889371; x=1785494171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3hYGut6TfV3I9NH02mInJzSkYevkJTj9GHIv+eaxqg=;
        b=mZ7LgAVQ1tdzmE1134ESAlox37KHM9PRaO4+HVvLXqW9NbLQIcuLxFJnDDKT7I9qbg
         OjmEmz0ag7pU0KbEI2VPvh0Uzntrdexl/MjUpX+NBX2XbqsaI2sCowWeQXNX3HMfV+/F
         p5J2oFoU9Nom5s7r3hPlLLBw+F9zupTOAMS8jkxwd1qDJzmCuvVtCmeYgsJzqeyyME8q
         UWV3NTZvFN3yJILUoe9YXx3oIV3gpJPkT6kvd/CHM5hMxw+nwxs9glSc8HFUg61gJRBA
         lAodyARnypH3rTtmk48HirERM/NETup5PpwX1k9AIBPwFaLTEKA4WX26gqI6H2cAHjOa
         KTQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgeXHqdHby3chbBG8NyjKUzykFquw5olONbYXHVen1vWZhNKO//hUo3vbKlqMsKq6iQmEC+Pkx6ZN/0uyQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0RTUgOqpe0ntOto3xU3J1DCFA51McMRAS7629Xuqix+wUms6w
	wwUL2CGiubg7gr1Vtcr1bSbu17Z56ZEmanqm9hGVvnQNnLJdNy8gMC3oolY0DXlAQqIlHUpoZOU
	5QsdnS6Lic/VBoXpDao+8szF2jEyhzwuDkOTWb81EoKA+6z8KM10xJtHf00octrFNvwTJ65bwgR
	Td
X-Gm-Gg: AR+sD114I/lSwtkomV9pnc7MkkwAzn4QsFFfgsT70pNfmVNB7yLpzBYKh9si+wKbcxd
	GvChAtkij6osLm6F504T3w2lTSzBWcWg5dEK1L1+eeJFgWuh/P2EdXUf1LhDgLZ6zyBtae2qxpg
	iKlepNGxvw0caxZ/Lh5q09Wv5fEy9xforuHAmkCNMe5/P99P7Oohqlz1WD1zHOKFvTyQ7zh0Lkv
	rujET5pz6Tj9I6Z+Pq3kf1zoFNrCyQZABDBOKzKy9mZddp745e6uiJI9HVrtGm24prHHMwj9dSF
	LVONO0ZP8e7ZliIausCTy4MMJVPnSxMBslCX83jyU1DOe4kgb8QBbpfz9NlSJ98l8M6qZ3rZjp5
	J7n8OL+gqc2EqYUnxvHMCh5I+Go9SmQY=
X-Received: by 2002:a17:90a:e7c4:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-38ec6401dd8mr6700441a91.6.1784889371084;
        Fri, 24 Jul 2026 03:36:11 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-38ec6401dd8mr6700415a91.6.1784889370543;
        Fri, 24 Jul 2026 03:36:10 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm1228657a91.5.2026.07.24.03.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:36:10 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:05:52 +0530
Subject: [PATCH v6 3/3] media: iris: add support for multi_slice in iris
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v6-3-a99d160cb42a@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784889352; l=12675;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=F77InqL9rsnjgX+yqKt/ImkMkd7iKrk5mMUJU9k/HEg=;
 b=T+oSFT7fH308Hy8D0cKI4Ji7jpTdpRRFHsHrSf7lilSCK9wr5nFJXwYwaJ+GSBkdRhYbb4Wr8
 sphAL4kydAIDF5Dc5YaWDb31XUIQp7e6GB53LLW5zcDJC2G2NCcwtip
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX9XeLrd+KBxyh
 i80YpzFP/u2Wt2ZTFxbjv1lsjRxBuDSk+atxQThnTzybbgygGjbxge/WQKHcn1rj67VzGud4Ggc
 a295dyh2FcWsnE14djjLQ3zORYFehdM=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a63401c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZIa84HXPZlRSj4Il7NUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ENbOVcmQQgaYQRtRzNj_KbZOzbjg8Imf
X-Proofpoint-ORIG-GUID: ENbOVcmQQgaYQRtRzNj_KbZOzbjg8Imf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX5K/XLdfZ/Dyq
 6tYsLuC26apqdXM+/MDQKNZ8Qsvt42Xip0t2wA8BhCXHQD73RAqC0HN0H76FSUV+/VaY30xYSZy
 Hm8GPUej96tvQdfBjzy0OXj64f5eDcdjj5qVT3twJOa0TE29lSRGSPPOsbCRxjdtVy5p4ZrgloB
 klpuXx7hYeKpK40OeB8pdHPiEKjjvtGIPZ5sL7dRsZJlNra/9sZuYKANhLlngrNHVOLJ7z70+dn
 WJJBrY5ayzx6p/tGULlkCfeYSP/VK2EiZa2Xe33qL7AzEddWLUPN6AcfTDTfx3+/BYqA2+ql184
 DZYcELPRBCY+M3LpcKHMbak0p/xg/YvoOvAPutmre+3WGOqVno4zPyOyr9fFueZzdZy0gFPP0ia
 yJzcQQ86tyPSP5K7ngYXqINKwf2hVASAk94+bx5C898T5Ht+iFYjmACCDKKH7SOCg5s3kolmOl+
 Ml6bujT/C5M+C2HjStA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240096

Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.

Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 16 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 17 +++++
 6 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index d7cbf6c3614a..0bda89755565 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		return SLICE_MODE;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+		return SLICE_MAX_BYTES;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		return SLICE_MAX_MB;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case SLICE_MODE:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
+	case SLICE_MAX_BYTES:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
+	case SLICE_MAX_MB:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
 	default:
 		return 0;
 	}
@@ -1482,6 +1494,80 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct platform_inst_slice_caps *slice_caps =
+		inst->core->iris_platform_data->slice_caps;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
+	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
+	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
+	u32 max_width, max_height, min_width, min_height;
+	u32 slice_mode = inst->fw_caps[cap_id].value;
+	u32 max_avg_slicesize, hfi_value, hfi_id;
+	u32 rc_type = inst->hfi_rc_type;
+	u32 fps = inst->frame_rate;
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
+		dev_dbg(inst->core->dev, "slice mode is single slice, ignore setting to fw\n");
+		return 0;
+	}
+	if (fps > slice_caps->max_slice_frame_rate ||
+	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
+	    rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
+		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
+			fps, rc_type);
+		return -EINVAL;
+	}
+
+	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			slice_caps->max_mb_slice_width : slice_caps->max_bytes_slice_width;
+	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			slice_caps->max_mb_slice_height : slice_caps->max_bytes_slice_height;
+	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+			slice_caps->min_hevc_slice_width : slice_caps->min_avc_slice_width;
+	min_height = slice_caps->min_slice_height;
+
+	if (output_width < min_width || output_height < min_height ||
+	    output_width > max_width || output_height > max_height) {
+		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
+			inst->codec, output_width, output_height);
+		return -EINVAL;
+	}
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
+		hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, slice_caps->max_slices_per_frame));
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			hfi_value = (hfi_value + 3) / 4;
+		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
+	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
+		if (rc_type != HFI_RC_OFF) {
+			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
+							 slice_caps->max_slices_per_frame);
+		} else {
+			/*
+			 * No bitrate target exists under RC_OFF, so approximate a
+			 * worst-case frame size the same way size_bin_bitstream_enc()
+			 * does for buffer allocation, to keep the slice count bounded.
+			 */
+			max_avg_slicesize = DIV_ROUND_UP(output_width * output_height * 3,
+							 slice_caps->max_slices_per_frame);
+		}
+		hfi_value = max(hfi_value, max_avg_slicesize);
+		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
+	} else {
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..5a73c7c49d36 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..fcbebced05c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -12,6 +12,8 @@
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
+#define MAX_SLICE_MB_SIZE         \
+	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
@@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = SLICE_MODE,
+		.min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
+		.value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_slice_count,
+	},
+	{
+		.cap_id = SLICE_MAX_BYTES,
+		.min = 512,
+		.max = BITRATE_MAX >> 3,
+		.step_or_mask = 1,
+		.value = 512,
+		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = SLICE_MAX_MB,
+		.min = 1,
+		.max = MAX_SLICE_MB_SIZE,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..226894b99dcc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,8 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
+#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
 #define HFI_PROP_LTR_COUNT			0x03000134
 #define HFI_PROP_LTR_MARK			0x03000135
 #define HFI_PROP_LTR_USE			0x03000136
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..ad9f2b20cd90 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -88,6 +88,18 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
+struct platform_inst_slice_caps {
+	u32 max_slices_per_frame;
+	u32 max_slice_frame_rate;
+	u32 max_mb_slice_width;
+	u32 max_mb_slice_height;
+	u32 max_bytes_slice_width;
+	u32 max_bytes_slice_height;
+	u32 min_hevc_slice_width;
+	u32 min_avc_slice_width;
+	u32 min_slice_height;
+};
+
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -183,6 +195,9 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	SLICE_MODE,
+	SLICE_MAX_BYTES,
+	SLICE_MAX_MB,
 	INST_FW_CAP_MAX,
 };
 
@@ -315,6 +330,7 @@ struct iris_platform_data {
 	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
+	const struct platform_inst_slice_caps *slice_caps;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..27894050a31a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,18 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+static const struct platform_inst_slice_caps slice_caps_vpu3x = {
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 4096,
+	.max_mb_slice_height = 2160,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
+};
+
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -110,6 +122,7 @@ const struct iris_platform_data qcs8300_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
+	.slice_caps = &slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
@@ -139,6 +152,7 @@ const struct iris_platform_data sm8550_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -176,6 +190,7 @@ const struct iris_platform_data sm8650_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -205,6 +220,7 @@ const struct iris_platform_data sm8750_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -240,6 +256,7 @@ const struct iris_platform_data x1p42100_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,

-- 
2.34.1

