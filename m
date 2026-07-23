Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61F136074F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775372; cv=none; b=WL7ppYsaZq/a5LuF9JxKJ8Rz/5DRdF/sWQVFG/gac1I88q948/TSidAmubJNQfG8+oSzrm6e2J4GV9CO6XCcTLNKA1ciBBthIGCvgX5xmvraszLa2xgQ6xO9YG4r1oGqSeKoNNNZuzp69qqubS0k/z3Zc1uteqZjeLjsQX4S6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775372; c=relaxed/simple;
	bh=F+KjZjjv+vWvwxn2/kew75cfGij7SIQwdJE8zTVTY+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnzY2qQH0n9nuaZqPEiiEiwQ/VpmV5pcNyw6lx24AT3TXuGEju0AdbbWKcHfAFZ/cntPs/O2a5xsyO3TXAWw+MZpjQadYrVu3MMcdYBvTi8iGFSnP3Dqvq+VF+fGbd80WWOIQZPUn1DMM/hfDL2NIfcaUnSGPmEI3wionuqZlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0uPGdkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCLK1+kL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0uPGdkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCLK1+kL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wwxg2477612
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDbNkN0pMOKy1BFdbFnzZEOFtaTprwX2uD+E7MXne74=; b=Y0uPGdknQKPKUTIN
	t3F/xVwjvrkDjhK0PIWMxe+rZni+2dZxDn9TVOtS0/IYNZPtlvG0IWuCiBPgu7zC
	MUVNxtAINdJ/EF7qnOoNfYHLpc2cbU85dECV8BE9EE5fZviGn7lBV05YvX/nk1gO
	7ULTE1WY7CXXZsm3LxE2xFOyDyF1+9HwlxWcmevTbeWGoE4NdfO7i7yVs+Vjy/FP
	67efxZFiEbLQn5rvnHhnOUJFU8ZmIzCzwX/PA096lbCE/9ny1dqV5SH/DN5YJjy8
	IYfGKP4ZsroiWGzGkjO7zgnl2T7cegfuCvjxSqPljSGWwBGgB98LaxmN8rlfFjDe
	YsRJUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7bsb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso202647a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775369; x=1785380169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDbNkN0pMOKy1BFdbFnzZEOFtaTprwX2uD+E7MXne74=;
        b=FCLK1+kLgQutaY7zYarU9DaNcFfGXcLp7Z6QclPqW38ZNaQSIwLmGA1T0TmnjUxe33
         jlo3pIevqqgYxShmwDCbUesRJSrr3+FhOfqnbtijXwQDcdM6cGVe8Bx62t36uf6Na39t
         e5i/QgwvH7Fh1Z9vctOfmSIcTO0hGz+JvBLUk9T/P/OgoHe6fTzs8npKVBNa4mg7C9AG
         xLai+B6MSRNCblQQNfLMcYTC/OEqzGHX4YCDG9KZLcfwZiYR9IRutbcBDvadoxhNEntY
         EBaQXr0mQJm5sT4UiVbmoVNFNq5bFYMhGm6e54bWZEIFFXrJA/aRSxtJi2IammMQW8jj
         S4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775369; x=1785380169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDbNkN0pMOKy1BFdbFnzZEOFtaTprwX2uD+E7MXne74=;
        b=cKF6MFjcb3Y3Vo+Pxi7uCudP2Qp4e2FarN51IfpDhvmVK3mDjbEFCDvwjO9hxEdrnX
         bjm9aalxIbJmjX3OPzr1f4e6rJS9N3N4h1U2E0yRkHkByMKF4LcrrBFj4ddyUGcGNBUO
         bsYBbkI/t0bFhMWX8TMl9sV/dNbavN3hunpnG+fp+b7gYkmVpv/cpxyjVjtWgJWjyXbQ
         3nIz5DrrSz0zZk+2wtN+vHgFq9Y8oX8j7d2Sdpqno+5lRVO8rJQv9rpi0vYmRfPaTeVy
         Or1Rq0lZ48KWCtyrhzE3chk6cA4eEibTZlPOZg3cynfY5tttKVXuqflbyIQaOgLEWv/g
         PFxg==
X-Forwarded-Encrypted: i=1; AHgh+RpFeXeU0uVo1d4yxxq34IJ2TvMq0rllINNGS2Tq0cvIMjfuN13kZuai7SdIcOtf02fnc6ptwkgcCepkVKaz@vger.kernel.org
X-Gm-Message-State: AOJu0YzN/XwvmOb4IVRQ6pUqtjBuLFGEypC5OM7jZqQXX9UVR3KpwaX/
	STnjNIKRvddBJortuQqv4DszBVXMG9/7Bf2EGNtdHeO+yrSfpDl2Xj9SBla+rI8+WoHmZnVN62a
	jx3XUetP9HUi45hmnq3XmiRrZ31OGYJJTSKYmgJFfrjIvQ3FRtfIPafZuTTNpBUmdBSJ6
X-Gm-Gg: AR+sD13B1KVbj0C0sgtKp2mlQLnQD8Ow/ntGF4JycI2ZkvKrIfqqZztt/A5lic5rFF8
	jhzkoCliSIMV9aufa1YpSFqBdQ10UeCbRass5WAbxXa4MJacniHQasRj2MGvJ44E7MT/SuIDKqa
	Wkd4iZaYn1FO86shyvVbAtad1q1VRISw+Xaf8yAxzBLQuORuAhqmnNzabx2GmxfnB1gubxBwNBF
	gRCZ3n8JHKzq/9sLNQojTarfpYaG2FeLO5Q3mpAt6xU8mMROHzmcVWPPSczuh9pi0nQQ9o9mrKj
	C3WHXQJtwwIlJi8KGRdIwvuQ4R26PYzEKfIaOIURoiJg/zz+BJQiiAQHzonGql6uX6jk/X7xl/N
	HneUqQ8wYgu9Q157VkXHIgO4LbJSb0z6LT1zCGMIVisZ4VDm5TF9OL7vQ/cMEGNOss1Ubt7dOv4
	I=
X-Received: by 2002:a05:6a00:3c8b:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84e2b7fc212mr1525259b3a.1.1784775368615;
        Wed, 22 Jul 2026 19:56:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c8b:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84e2b7fc212mr1525235b3a.1.1784775368146;
        Wed, 22 Jul 2026 19:56:08 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2233312b3a.14.2026.07.22.19.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:56:07 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:55:55 +0800
Subject: [PATCH v4 2/2] media: qcom: iris: Add request key frame support
 for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dynamic_encode-v4-2-5fd6bd549ead@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784775356; l=8205;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=F+KjZjjv+vWvwxn2/kew75cfGij7SIQwdJE8zTVTY+A=;
 b=u8LXVU0tZJzkD3TDrPlSPJSiKBcDQIDmqdjt8udyc25zVm1A9SwotNFKey462guVH/qwJfivg
 ZIq4FMKhHEKDW2zhi1NJXdmcWfkzr8HNPyodLSABWIdVP12U/7dJjYq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: yla1uCvCQblUVMaQxGIN8W_Xm6dHfpbx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfXzDcMAeCdxLyP
 1f/voOj7Yic37fiJxZjREk2llBfznKkWyfIhZnmKUvo47egJfRDGoWOkJyjI66lMle66XM/Ld/5
 QgCQkY/BfrqOLuLq3fY3kGmnZFsJdjM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfXwCpFI8/a8O1c
 A9CIcnahSfgoiykuU5PtSMAmuZn9OjPZYeCOIRT0gYqFG5+NaxT8rPZGtE/iKxlpGssdqdFRjBz
 brWwvvoHhes6BwVj44VwzDyg4uR4KH/mlqdwT0yl+f4sOU6DYYuFdOTRYkecQTaeTt0pkrosd6W
 0qZroO3n8jI9+9USEfKRNbfWv0EHaRv644dgSs+9n1muq0B10+dvThdG1sCafLa1uskFUSqtnTF
 DitWeuFz1/JlxiqZoP/5+sW/D8Q3GCNEf/ATUcN5cvrlShl/WgX19HRwaWsjE7AuKg0MAxjTeFD
 7ue9geDRWkwwW5GCpjrAUM9uAl7jbTNKGZVhsgtLVfgxNPEUzbHmIjozCmoGkGLbVTbwlJkBBYy
 RjR45qAyLJtQnT4DQFb1hyZ9aqEDtl/DFUzhZ35Ppd2rZhP/IQlF8C/z0UjkPYmoDNc/QRUP2B4
 RsoughOs2mJS1NpB2Ug==
X-Proofpoint-GUID: yla1uCvCQblUVMaQxGIN8W_Xm6dHfpbx
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a6182c9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J9qvyUYpVtujyueP22MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230027

Add request key frame support for both gen1 and gen2 encoders by enabling

V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 8 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35..2918a7df0b403a886648e90ec00968f51c4660a0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		return REQUEST_SYNC_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case REQUEST_SYNC_FRAME:
+		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
 	default:
 		return 0;
 	}
@@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = 0;
+
+	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
+	else
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index eff9216bb50143c0d752051a6400605bbaf3803e..0f7e7d6b25f41eb8a67a9a8f01dce20ea54dc335 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_bitrate_gen1,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c49adfaf16b444c8ec7295b230a529..d7fd867cf6c98523123e9205fcfe4b469708da72 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee19238464a9671a94eaab8eeda2d7f7ca9f..275f3fea3d2aabe26a2a0498c78c09ec28765b24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -157,6 +157,7 @@
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
+#define HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME		0x2006004
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1ae726c94ab6346b0b4b2b3db1d7b..7d6fde36f0e9036145e45b84054b439536b25e50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -937,7 +937,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2cd5555cbced8e438cb32e87a539c..a8b47e4ceba0fc868125f841a5635476571aab85 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -90,6 +90,13 @@ enum hfi_layer_encoding_type {
 #define HFI_PROP_BITRATE_LAYER4			0x0300013f
 #define HFI_PROP_BITRATE_LAYER5			0x03000140
 #define HFI_PROP_BITRATE_LAYER6			0x03000141
+
+enum hfi_syncframe_request_mode {
+	HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR		= 0x00000001,
+	HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR	= 0x00000002,
+};
+
+#define HFI_PROP_REQUEST_SYNC_FRAME		0x03000145
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ff48333ad089894c3393e8ad45903c2603288eb9..23b6e7676d05bd01725f8e2cfca47b06ef112c27 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -182,6 +182,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	REQUEST_SYNC_FRAME,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.43.0

