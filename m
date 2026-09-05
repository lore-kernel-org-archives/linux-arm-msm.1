Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FB1C862F
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616656; cv=none; b=l1h0CtEBk0+ygnIF4DDB5sh3oHyZX/hV1AlWbnzmgEnTbYt7CLqicgFrMsU0PDrvMZIUz0g5U7PAMJjX/i9yb5BI5GQXetjsnBe2g8er7X/SMRJksGBUSleenD9N5IfH3hadFViy63EnWoUQnfD77PxF0givUsHUb9goHTbhrPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616656; c=relaxed/simple;
	bh=ikHgJDa2Qm1BlxjM4lp7UIe+qHcDX+O9Bj4MCXtoyEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AW9pW+yCx7fBNq8PlL8CMtE8w2THx4CHNW7WnHiVHlSdeDkq4xPd5zPvrFvYZA5vKRvXLdcm/nU3L6L2InDKt16EZ92M4HZ+0XW3pMjaaEjt0P3ITc5yv3PMzK5bm4cF5pW86RpZ3eTpv2hTMZ/kftBOWda5T99ppKGU3+LkL7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHpd8Mus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGR3C7bn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHpd8Mus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGR3C7bn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVOVl1559281
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 13:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2LFZfCamiBEggn0dx6WAfW
	rq2n/TLdV6C1L7akXdRhs=; b=SHpd8MusjuT7TRRx4QSNxt7eCL4JLOrqmgIWbs
	rEtBf91my9cbDdLuQoP8maTv9c6LuuNqgteZeG4iPP/r3Bep9CkWVigFqXguXdM/
	bsX1MU9Jqw55Y+yABfQkOlDQxIv1JSSYkQ8/siwRcTxA5+xeX8KFXlmk+alXKN1h
	ccQWbRvZSK5JetD9659k7Umv2chDlg5wcKmsIkupOaF03M5iDERJoKrTSrQkpdm/
	lMtUS5PzDFKd/9QE5hKcJeUIAQWtf8q6GP/b1ST1hQzF7BDEDlyGkbuK9j+ad+L5
	95SboIKyr5/sFHVSQl8wWQEJy7T3LX19M6xu1Xeu6kSAauQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca0y48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 13:57:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so33673215ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788616653; x=1789221453; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2LFZfCamiBEggn0dx6WAfWrq2n/TLdV6C1L7akXdRhs=;
        b=WGR3C7bnmGoPp/6zgz+UU6yoPkZXruPnywpFD+KY4kMYwcKgJFq/ynqgVmaeAOTSho
         JRGuxy+1Z3oiQHB8+xLEnGbKU3ylYQ+cBDLx7Udmiaf8apbe1LVhk/Iix0TLW71rsz+M
         bIKoeykwrOWIVH/rbYQq4UEVUlGUQyBqv8y02YRTJGypfBnQoV+HjsOqiDeiwwHvQ7CN
         EPD3d1aMJu4Mb/OTFThA1nM589sbyTNo4HQcXzvv4kQRZqNINZrNXgNyIw7ZV1/ixL/j
         3Pwa5ckztVl2jVxW2Ssg/k/m4t51AuKxz/f1MYEeKbkFZ76/wF6+oDVfqIBZBQtWhuT3
         A/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616653; x=1789221453;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2LFZfCamiBEggn0dx6WAfWrq2n/TLdV6C1L7akXdRhs=;
        b=S8QejGMZ9exqU5DyES1km3EiBIVkk1UmEfpjuCdURxgzgF+adI8uUm/UrDcBN8Vtz1
         d12DO4TJCpjq5Of/YbNCnCWLZOAS5DFT+tTfiq+o5EcQ5mVxMA1w/auq54YdKzqS6u9e
         9LSKB0ZXfVcrsrj2YLR5oG1KoFahY4byVN5uzPzJi8KR3s9SwDiURm0Rk52+f8QFXASg
         YRTrtIhH5KAhH6V72yTg7SfYH0V0SsKJTXSrnxENFgaU3MfF2Zif59S0IdJo8FAtRawF
         LJrw5DjycP90oPhyz+AF0rih/Tphn79DFX3ce/D74Y7/GD2/jJLRHkPULkN1juJn5IR4
         lG4A==
X-Forwarded-Encrypted: i=1; AKwUvBy+vI4J8Ot/zCLRFzn/H4If/3sklH4Hpv8IriattG9phFG0A2sGiLcacKrA88KSC+pSzkcb7hPCn0zEECXe@vger.kernel.org
X-Gm-Message-State: AFuF++lIRRdzxNmu37DhrfSISch5YHrFQHIuG6iKhc4VWVRMJS6v2Llm
	SCY/Nf1WBqUN433vHPhfZOVXO/eD1QYyRDERkwMTGMqfsL2YRGl39K5wd0+3mTwXMG42HurveLU
	fvR9KLkLuj0gE9pEjM2j0iQuZyr9/wOusf2HROpqovGJ0wzYu3LZRofouOJrN1ON6EzD9
X-Gm-Gg: AYBFou2BtVCK6N5JpOJU99ngZqorCbR1BIGW6/kuYMg2BxbDgGR5qCYzBrMuPD1nVae
	auKzd9u0KhHLbjlf6rO1QBc3SQ0aqi0jVzo+MUA6Hg9t77Gald+tjaPxWFNwRRHDn4EMXB2Xnrl
	rr6M08ld9EpYyAeglwO+gLO8Bug4er/aqvYiSCoVmfRJOZ0PS+q4L2zEBxDfONoYAwr02E0wkfr
	pvOuhLtoOnm6lgs3uz434p2sHtvxaSjYNUQH85o42QsrQbcj/Zfha2spEh0oQ/vsqS8baS/Z7yA
	OcWmqltm00LIFnNB8ulsvAmF4/jAteVfZCVUxfyMqaZ0bmXMe9Vs51MucadBOPhB6h4dQfk4302
	gBc4BsI15vxZi+Tnmm/v0YT1xMCRk2Iw3Ig==
X-Received: by 2002:a17:902:fdab:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2db122edaa3mr190314575ad.3.1788616653374;
        Sat, 05 Sep 2026 06:57:33 -0700 (PDT)
X-Received: by 2002:a17:902:fdab:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2db122edaa3mr190314045ad.3.1788616652901;
        Sat, 05 Sep 2026 06:57:32 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm14374895eec.27.2026.09.05.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:57:32 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 19:27:23 +0530
Subject: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMIfnGoC/yXNQQrCMBBA0auUWRsIoxb0KiJhkkx0hDQyaWuh9
 O6Nunyb/1eorMIVrt0KyrNUKUMDHjoITxoebCQ2A1rs7cWejTJFN0vk4lLRTKNLWrJLovlDyoa
 D90dE6lM8Qau8lZMsv8Pt/ned/IvD+M3Ctu2UAQi1gwAAAA==
X-Change-ID: 20260905-read_video_format_from_firmware-ecbb322a6fd4
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788616649; l=4284;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ikHgJDa2Qm1BlxjM4lp7UIe+qHcDX+O9Bj4MCXtoyEg=;
 b=b5j7Dk8CIc8X2niZYv3TvY98C7P+rVqYeL9ANkw8vr/uv3GL91RREHxn8PyBGswkYM3NBcWQI
 eeE7bgU+NQjDNp5M9Z2JjJ78bke9O4CEW2Kz2HN1Wyz3I4YVgxg9MhU
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: ZQ5YE_qFa4AauHZxrOz_XaLmqojCf8U6
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9c1fce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UrH_bzIhgnSsKCIZztAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ZQ5YE_qFa4AauHZxrOz_XaLmqojCf8U6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE1MiBTYWx0ZWRfXwUkUt7ZBkDi+
 jYMws9loRf7H6CLIeUpH1t9DZJmUuEaf1vcbE8CB2+Hl16TmXazKsQPoqgBw5P4h45wvM8o9h7u
 TWSAsrXlYqahUZXrtoS5XgDpF6OZrte8TOrVDMDSEEaWNWtYXMyO4+Gj4J8DZvs+CShvFvzf4gh
 c1x1EXjlBYCO7i06/gnQfWjmVeKIg05X+8MJXiE/Ak6X7+ZkxTDrl2rAeRzVxRnoZGYyxvrTDZT
 Gr7ji6j1AUza6C0FtJdvqbDlKlYzfvOb5iLbSXlBl/JIe7EfHG5izJEOu0Jpx9SZoIwdCJnpRHZ
 4bvUhRYfniBjtu2EFP3hwZe9VTJLrjRa4/2S73F3zLBYvycLNutx3FcbjBvZtx2iPdF/k6w3K8m
 WWyat0fmifzuKBKtDmijD6iqR0625QBm+nTwipRezByNWa9VIvlWGY9xw1jqA0ssVCOe+o6AzjE
 ssw/gKdo2FJzN0b6DbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE1MiBTYWx0ZWRfXxO/6QPA5Rtok
 WTJUkMJTHfYEESCTbhYjJrm1JZTYBXW1qH5Il3zPpBsC0eo4DmhUR1yubRpswQrtyZTlG3pRUZ0
 G3fBcV9vXeWnsPdt7Jn13lJFEXOPbm0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050152

During speed-based rewind, the client restarts the decoder queues once per
group of pictures (GOP). This is because playing a GOP-based stream in
reverse requires decoding each group forward first and then showing its
frames in reverse order. Each restart makes the driver resend the colour
info property on the bitstream port, which firmware always treats as a
sign that the stream's properties may have changed. The driver never
stored the video_format value that firmware had last confirmed, so it
resent colour info with a fixed unspecified value instead of the real one,
and the value firmware received kept differing from what it already had.

On every restart during rewind, this looked to firmware like a real change
on the bitstream port, so firmware sent a settings-change notification,
and the driver treated it as a dynamic resolution change and paused the
port. The client then removed its buffers and built new ones for a
resolution that had not actually changed, stalling playback once per GOP.

Store and send back the same video_format value firmware already confirmed
so both sides stay in agreement across every restart, avoiding the false
settings-change notification.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Updated the commit description (Konrad)
- Link to v1: https://patch.msgid.link/20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..439197e9e199 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -141,6 +141,7 @@ struct hfi_subscription_params {
 	u32	fw_min_count;
 	u32	pic_order_cnt;
 	u32	color_info;
+	u32	video_format;
 	u32	profile;
 	u32	level;
 	u32	tier;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..a43a9d7687ad 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -358,7 +358,7 @@ static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
 	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
 	u32 video_signal_type_present_flag = 0, color_info;
 	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
-	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
+	u32 video_format = inst_hfi_gen2->src_subcr_params.video_format;
 	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
 	u32 transfer_char = HFI_TRANSFER_RESERVED;
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
@@ -806,6 +806,7 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 
 	inst_hfi_gen2->ipsc_properties_set = false;
 	inst_hfi_gen2->opsc_properties_set = false;
+	inst_hfi_gen2->src_subcr_params.video_format = UNSPECIFIED_COLOR_FORMAT;
 
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e8..8b1ff253a560 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -581,6 +581,8 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	full_range = (subsc_params.color_info & 0x2000000) >> 25;
 	video_signal_type_present_flag =
 		(subsc_params.color_info & 0x20000000) >> 29;
+	inst_hfi_gen2->src_subcr_params.video_format =
+		(subsc_params.color_info & 0x1C000000) >> 26;
 
 	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
 	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260905-read_video_format_from_firmware-ecbb322a6fd4

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

