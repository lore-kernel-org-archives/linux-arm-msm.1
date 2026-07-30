Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D694418CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423353; cv=none; b=BT5pYGvT1oC8nz9ts7w0zc20Vmh6jCyW/PlVqZbuC16kxN2OZg7ra1MCIr3yz+nRW5Qd3o7MU5auCt06kuYkTe8wlR6aN/wDjcgd7NLMncmSOUSDTg0U60vTbF5u3/fPXeiwMiG1AVkwFskGD5oxfoi+eioxPRf6wtAm5CazTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423353; c=relaxed/simple;
	bh=Dbiyy2QTVpgmROguJdk+dB7JRPNnWIHf8ZG60rFO7CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7rTxd3L4Cg0HT580WIfSUH+R31PNctpmMx+fU3iVkM1vtZHk7HI3PlgVu6dX+4mtKCcV6VbYSKr9D3l7yEfMVyVVZcfvz2n+0SsipgrpgUU3J219qZx8Ak/qaEh1A+hoLZifz7j2K7B6dn5g/BVTU8cpbEyee10Lz7wo3VSgwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggJpwiDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vn0tUyeV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggJpwiDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vn0tUyeV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEaJ971558477
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6xHoKwh9v/UMdyi/AhdHr3bXm+Uphrf3HJ6/OV3E5k=; b=ggJpwiDibJ4itVfR
	tjFlOjY+ngb9yh4J2PylbyOF3yDMFCG52/JxsSMwQK2KZeq9RpHO+9GXr3UiklUK
	S19/hqBBtSiJkexkZZ1x5b+LnbszOo9qIxnci1jjlK3aSmaf52Wy79/kBk4dEOA7
	nEdehpPdt9YijA9ILa6JhOgv4JPttyJ0NoHX/jl/Rl6mylyMmAhTW4oyayDVmAqv
	0P+/qsZy5vKGJObk/hgX+FmL9dQCiy0PKuwMzrc6qCsyYej3HouXqQxsnUDQie/o
	FY4Xp2oLpS6xt7FWA0y7L8eJqS3x/zJ34F5ZH73zTW2f006m+QEBKdPPga/grqkG
	ZVkP1g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8gy03un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:55:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso2685448a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423351; x=1786028151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6xHoKwh9v/UMdyi/AhdHr3bXm+Uphrf3HJ6/OV3E5k=;
        b=Vn0tUyeV3XjO+TseDmN5PYHNR33ly54LNvPEeyvlAyPu40SZS9mR5OOJxNhfZqkvLj
         TW6P4SGJjMPK+iTWdtTKuTWFXIknrhygIXq++myDAZCzMldc5ls4VvBdo1ulqRpJOeUz
         fLvZhjyjEPjibZ65jy2RMuyuN67v7gYUEEYP0Ucmd5GIgmEdj7sbQADRPQGMMlNkGDTb
         NaQc0GTeT/xOQ5r0aOfgrmWSkRStYAMDswBA2tgY45lgOI2w+aWUBqsUt7VKtFZyTtCS
         gyOTZpC7rMSQcslZ11oQxkNw5UqVA1eh0nLpqTph5x23CO46moLu/DF/Vrw2zbAnAZjs
         lYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423351; x=1786028151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6xHoKwh9v/UMdyi/AhdHr3bXm+Uphrf3HJ6/OV3E5k=;
        b=OOT24j3dWS0Vsamxvl4mfX5hFX9rnMiNH1Ujx+kSUHrkpeNyLNO8YR67qbjN4ibL6H
         oc408rXTnKZerI5cg9fOtxQquqJti4HNFu30zcsVqg3qgoq4xVDdFVcxuKz9RORv3ey1
         +qF/AjRGdqCO91CWtGADlVi7WJ+AkyNztERRj+zRK/wkTbW0hAknU4mghNs1spFnX0UO
         4tSL2qhrFUBDMRoL3frDTyPbUHlJc8uLIQ4nXDWqnbDZNtX749apMyRdGKU64o6vOyI2
         u2Hk80TCD5f/u33agyneqr8rLE65J/e0MaWmM0s5PmB8rPBNZ2dHOX9l7KUF5wEXWR6D
         byNg==
X-Forwarded-Encrypted: i=1; AHgh+RoKtYQSTnmVTD1iq/A006QyLhvlZ51IYpSb9xPafvepJ5qgsmPnp3GIXEIdHlM2VYDniBMQPXHYVmgX+QMP@vger.kernel.org
X-Gm-Message-State: AOJu0YyHytKJ8RnzdA89J7sNTNIi9mDE+XjZKDsz0cuT/oVLKOG05m7V
	2n5G5HUPmGcyNBpW2Sf1f9Saph6liIhNiTai8pVXZxDpuWufnUNU0mM6q+3aCqSiGJqA+4dArL7
	Kh9g3bkOAn5KVGxSOPJtZvm7EvR+ZrbDnmW1LVlmAtK9Fawre0eYNgLtC+xLlm26sGQqr
X-Gm-Gg: AR+sD10s/GKoT5jHHx9iyLi0ov9QxkHrByMGon1CzjdQof7pgGFoldjaOlhQ4gx8+wh
	Z4Xh11PmQrIB19WwTyi1uU1abGsc6e80F/lNl3p4GMAsCN3f/owD1PbnMlm8K5XHJTdXPfj8IBX
	zo0vbzJhUlBX0P08qTtl4BGrOY0eXWmoTZZLnPjug6BmXAeZK7KQONNTYSmC4UaiuRcwvJNC3wy
	YgmmgaTKePOeIioqPTF9PnxzC6vWt79ay/Z14nNlxtIQsm9fzqlGBT2YM9mYlONMsSBpPXthbP5
	6dsklvjglXOAz0Ykd+CDVBRBvmAyU7K8Dc8TsE+r8Tp4GZOM/lQCAH6KDbGerUlSvZqPDGgAwO6
	qr8FfJkgJffVy4y6hUfLfF4KSI7wfFlo=
X-Received: by 2002:a17:90b:510f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38fa7f9b10cmr359402a91.43.1785423350578;
        Thu, 30 Jul 2026 07:55:50 -0700 (PDT)
X-Received: by 2002:a17:90b:510f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38fa7f9b10cmr359339a91.43.1785423349832;
        Thu, 30 Jul 2026 07:55:49 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b7ace53sm1236775a91.17.2026.07.30.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:55:49 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:25:27 +0530
Subject: [PATCH 2/2] media: iris: add support for vbv delay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785423339; l=5976;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Dbiyy2QTVpgmROguJdk+dB7JRPNnWIHf8ZG60rFO7CI=;
 b=J0xyrKrsDMPTbJ0FwJoRbTX9TagRmk1KSmDs5kQ8XSRzc+ji6C8IwsO3O+CrvL16mdmnCMg9F
 293fmsrjQusCgLQx7oUJdt7OJY5etdR1YtNTmhbuwONXQZEBBnRlj96
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: q69eEeeaGNT2HjVnJfXj_tOTAsF9Nhts
X-Proofpoint-ORIG-GUID: q69eEeeaGNT2HjVnJfXj_tOTAsF9Nhts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfXwrqeXkpgSj02
 ichyUcsPv9NKtzzGUmcEoI9M5UIkuXsqNw/2S0MDlLwjImmZfrotPosa/3Wls4Di7esGvhn37kK
 ySpWJ2tOzgk6QRQHz7xTDK/ohJf/chVe4TK7aXM6MQkJcy0SLDJ/t8Z/eQpJauX6Iluz1+UAPi+
 bz7BbTErRY/eLxwvOZ6vzUqnI9yfQ44liEhCmLMeZ6V3TMw4Ep4U6XqUhaab3sPjhRFmJ9Ce9jB
 mO6lcrE0wJQJN1G2hJ/DTUpzmUkIKMr+LEUhTwt+vf6Is+De6vU5M+YhjbhCvTRHiaLxIN9dAJf
 7kqRRWpsKr2Kr2ZpfLqg3ajn/PPCLnx78n+TigRV2Mt6O05e2zs5zojZ+0qIhhhD02hg6tIVmb2
 AdZv9TaEoRXXDFVmzl4gMBwEeOR1+HSDX1asfkHbVxyKlvlEepNoHkEnwsHI18JHDOIVg8gOV/8
 ts+/PcPXCF3X/kSJ73g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfXw00gXAAQhOmW
 xhbrjuyUY+a11UaavqHYyS0sCx4bicPExHqpRmD14uTUmafukK1UoBoIH0nxNfjDa71dMpF1uQp
 tAeTmL2rLTTPJHvAaytGDMAR4Ll9lPA=
X-Authority-Analysis: v=2.4 cv=MuliLWae c=1 sm=1 tr=0 ts=6a6b65f7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_KnjXlf9qKQHtKUprocA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300113

Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
is only meaningful for CBR rate-control modes.

Low VBV delay values (34-100 ms) require the encoder to run
with a single video pipe, so extend iris_set_pipe() to force
work_route to 1 whenever the configured VBV_DELAY falls in that
range.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 31 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33114d80aa68..0ad873f3be78 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:
+		return VBV_DELAY;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case VBV_DELAY:
+		return V4L2_CID_MPEG_VIDEO_VBV_DELAY;
 	default:
 		return 0;
 	}
@@ -544,6 +548,11 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (inst->domain == ENCODER) {
+		if (inst->fw_caps[VBV_DELAY].value > 34 && inst->fw_caps[VBV_DELAY].value < 100)
+			work_route = 1;
+	}
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),
@@ -1487,6 +1496,28 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_vbv_delay(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 rc_type = inst->hfi_rc_type;
+	u32 hfi_val;
+
+	if (rc_type != HFI_RC_CBR_VFR &&
+	    rc_type != HFI_RC_CBR_CFR) {
+		dev_err(inst->core->dev, "vbv_delay unsupported, rc_type: %#x\n", rc_type);
+		return -EINVAL;
+	}
+
+	hfi_val = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..16939e31c784 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_vbv_delay(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 45a418fde7e9..716947f256f1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -944,7 +944,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = VBV_DELAY,
+		.min = 34,
+		.max = 300,
+		.step_or_mask = 1,
+		.value = 300,
+		.hfi_id = HFI_PROP_VBV_DELAY,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_vbv_delay,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..19d04981cdb9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -127,6 +127,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
+#define HFI_PROP_VBV_DELAY			0x03000176
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_AV1_FILM_GRAIN_PRESENT	0x03000180
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..a533740ced7c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	VBV_DELAY,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.34.1

