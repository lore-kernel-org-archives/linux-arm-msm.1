Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585272;
	b=RArC1DE4HDhaqSB2FhgLSJ3O/XVzzXj3iUU2qAe9JAaWM5l9KDOv5tKZH/NDgwX+JHws
	 oqYUonClLCSMXcpWsHSeL2cqLQlrvKz898r/EZQMgVa1JTwH8QW5/a6czcRktPwuwRAvp
	 ZhGvcSWPcYlpVdfa9LeXy0K/zrqcQUlEw6KAub1dMeCr6Enm2Xywk9kGyrR+f4+IiINkX
	 /wcaeOMAA8RARwWeiUS+paxrtnDhwxEJ96+XgdbmN0YpusFO+hKgZ4bx1RqWRERZSrzY2
	 Ks0MgkoRY2xOO9/MkNcx9NzuoT5s1ZJDwD0CS2FATv0ONOvIXUQbEyb+2qZHw7sipng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WOUYKmrQld8mCVl16/QeMoDjRGy0Iu9lf4Huq0GJo1I=;
	b=jXvHFoTm1yWLWJ1oM8ywDQA6c4n8IuoduaK7i7GYhpfuTe/qv0XRfhbUIDBiJouId6SC
	 vspARuOWrLWPMeB5fXxlv082wLxRkw//s/bGj0beAe3+5TBHJWoZudJ741VE7LbJSjhMA
	 p+0hRM0dqnV21IxkooUANI9qetxcWBVxF1YwPQsFpZt+zZSLVYLIoRVa20OlYu1B53cKn
	 XYM4t96Wiy4hpV8xDsorpXNQV2SySZuAQHrHyxU/R8e7us1ENtA4aZ57c8EdJj2pS6hLY
	 vr/W1T/+EoJTwkb7FcY/463cnHyE9GFaQRQxbOJuvbB7VjUKgwx3CsyhaPw+6JQ1jUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaY22IWK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LiDMreLb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA3606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DA3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaY22IWK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LiDMreLb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B2Nr1096782
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOUYKmrQld8mCVl16/QeMoDjRGy0Iu9lf4Huq0GJo1I=; b=UaY22IWKFO3grm6R
	C2APnp2c7le9G46I+snK8p5oWbtOlM1gFBPJOTSeXQTCX66Zk5yqM3IX6sWLd02d
	XVRlBip3vi6yL65uZc7/+Yn184pi8SPpy9ixD59gRv2SaS43tx9oNSOBtPwMZthW
	abPYU3RqE9KFKJSnvXtcTV8onVqruUCbT9EJyGG2YkE8XC2+SMt7hkY/WzM+yVdn
	YrE8116rmYd3ePr9CaKZoiT/7EkGWIcCB3ia9JvHno9DQUFojSAOEaUAS+H6bRQt
	SjVRMj1JNxXiYpxMtQ2dAtPFdjOK5NtfY0XvWBf0+bpwXccYLzzYiQkC7EJZ4Ldg
	3DOUhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efftmmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso3480831a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 21:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585270; x=1796190070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOUYKmrQld8mCVl16/QeMoDjRGy0Iu9lf4Huq0GJo1I=;
        b=LiDMreLbNVkvOmE8Bk21iCDtyJ5sYcGOhnFHcW/HehnYBAaiBoW+zDPTK4MxEa9vHX
         M4sS7a0qOrfbL6I3JYVdD2Ka9hnXT+HDzTzN3KkpBB76e8e5xr3VeECIWXPfUtksXqKq
         k1SZT2Qss/E3nHRfc0va4H0RmHPcjC7P2eGziyB/wbx2tyGdyMALn1y4LwKdAyUUDE17
         oecJm01520ZCuyydY9b3fx39oYwzjQF4CIFId8KJhLEG5NlhZC0YpC/RsB2bb0e5Y2ee
         P4bT2/zaUUmeuC2syraa5WKjB3PdDpHuo1G4RlOTqUcdg64Mg1EV+/hVviu4SB1ABqpZ
         zHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585270; x=1796190070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOUYKmrQld8mCVl16/QeMoDjRGy0Iu9lf4Huq0GJo1I=;
        b=iGbtCvii6FrHuSupkhCFofxIXItzuKf5+4mB/my/R7Uf/1W2C1biBeqjhoL8lD6ct8
         Qo8ZAs8jLvrTDuhQntLnFKYCUzHF3h5JizDjims+UvaGJ0K8JmUFVBIeL8Q6aZ5+PkE0
         hw9TXtF5Rj+Lgzdd89qVtsvrfyjiJxwWnwKmbN72egI8QLeZm3GAmOQPr9dMAV7s1fQj
         5fY26wEHuSr+TarFxghQTnaxvCPJr/1uCIa7BUSW0lfJOk2QJgAij4zukI1Pklc5cBSd
         cDNiES6m7OIfPqWer9X0cXuqibgNZmWRtZ0+T9rMYyUWPbD47VsHBuStSyvduk5sROFc
         EWGw==
X-Forwarded-Encrypted: i=1; AL+hErH4L6EPzOENniQKtmYet37d0Pdw3mdqAQZvwDghOQdFLEC4ks8/OpIJwIHZUHD57S5BoRZmb1LYEeN+spp7@vger.kernel.org
X-Gm-Message-State: APuU4Z/u8bYdJK9cPRwXYcW5CNtAEdMTZqdVAHqCxzIBpqw/p/aRwq2U
	Bq8KH1i7yp4nkgUPGbMPEnLUIg5oRR5u+rVm7XAuB5tTlJTSZQloupRP4SyMQHPN1THdHJchEZN
	DBs5FRh6YwoQwNO14iA4e9eHD8M/giVHPNK7y5Omhh2kFzMi+roUqq4rtJdOUPCgAgOFO
X-Gm-Gg: AZFdTZddg88fcnQ3EJgTTskH5u9SEI61Ys0RkVMtbCLXWdj5ugBTeoX/D6idmc8UWn8
	vLcq2B4CnDRxmaSS0b1OOMozjsjEyM2KH+q/64MKOUEfthDt0/y1a4ajy9lf+B5aNF9gIP5Uhmh
	w4aTX7H91plklsWXZXurfqRjZBRSvLxtnt99MDedcznMFjtjz4u+p+j31b7/Y4tbDOMKL1mF/hV
	kC8dNLUtvNDwhF7MsR8cHpLelh5AIa4MRtCfi7XUpFa0NjWxcELedC7+QhppFt2WPvN5A669x0h
	bC4wP/2FLPUeIQf6ekTXIojOZuosvsA/x3TqmfEQiCOjqZGn7N/KbcimYXzo/G2GCfjvmBqCASi
	EUfdexqu4pfi9eQFnIIj7W76pa1stMDTqigDfFmR7+2zszg1cHAi9qQbqZCiP5sdD+d3RED2Vqh
	4vES5aTXU=
X-Received: by 2002:a17:90b:4a48:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b41c987b44mr14792630a91.47.1795585269910;
        Tue, 24 Nov 2026 21:41:09 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b41c987b44mr14792608a91.47.1795585269438;
        Tue, 24 Nov 2026 21:41:09 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:41:09 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:10:24 +0530
Subject: [PATCH v3 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-fix_dec_seek-v3-2-66c9889def2a@oss.qualcomm.com>
References: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
In-Reply-To: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=3643;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PWf0zZ80U0SrIVRIver3rsh9ZUObLDb12FRCcI6fO6k=;
 b=44arFO5aIJXrsBMjCm/NVGTdoItmIXAdSq3+cyxBTE5nSUzbNdqTAXgAHCrfC9e1gk3lpVdEu
 ZH7fIKf3V6CAbleiQapZalqPlgMUrRbyh3EKpJiMy52YW448os5IauK
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b0674f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gy7Or5v-rkSGZgkmUG0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX5Hl3odl8W4Nc
 l//izuqn4UzIoR4Uv0hc83InCePNblSbNCEiDLQoZZ0A+AxNyuf/1tbFRFLZ0XrrFnoq73JDg4g
 eFBShqU5+UMf2co4eKb8uTKdlEOVZM9gpnYrY0Z89pdwJmJwH5oZx7x+cMEdIvxM1/Q2NSo/cUz
 j2epTltAPyA/t4SQukj/ZD3wEzqqaqQO4eRaNhireHs+NAE1NzzsPlrs0kCdxMj/NkfvLLP9CkH
 wGWeSOeKWFmgXLofjj+BVA2KJmDUPH2lM7M3fTKCLOCVJwYbwywu5qKXLLiU5gdRlGN3M9qT9oB
 Q+z7P4jNm9ZJLg/3ResmZgICyPM+z2H7S1hKWXmQKmkLupoagndssgwa62ciPs0HVMFxIUN9FAI
 E3JAlsu39DApOZ9hrb7inn6mHxVXbp/xudWQEUKHKNWWApVW9o12WjhFwphCR/ECDEZfAgLTS9i
 3peEks+pGLl+T8bJreg==
X-Proofpoint-GUID: 0QCwDFfT2zQ1AYNH9yLUZjoGDvvEtTzf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX2lG1jnYeWELs
 /FKP2OwHRqt3b+aStBYADqM5RSnKiYI0gm0zyq3I/O6Tj/EJXNUYW6w6KOeZ9aZ+GxcnJIJEfKu
 D79wapwZcuBUjXSbAEdBH3AApJZXVy8=
X-Proofpoint-ORIG-GUID: 0QCwDFfT2zQ1AYNH9yLUZjoGDvvEtTzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022

HFI_PROP_TIER is applicable only to HEVC decoding. For HEVC, the driver
programs it more than once while setting up the session, and the value
that ends up in the firmware is wrong.

First, iris_hfi_gen2_set_tier(), called from session_set_config_params(),
sends the tier selected through V4L2_CID_MPEG_VIDEO_HEVC_TIER on
HFI_PORT_BITSTREAM. After that, iris_set_properties() walks fw_caps[] in
cap id order. TIER_AV1 comes before TIER there, and both caps map to
HFI_PROP_TIER and define a .set callback. TIER_AV1.set sends its default
value of 0 on HFI_PORT_BITSTREAM and overwrites the tier sent earlier.
TIER.set then sends the tier on HFI_PORT_RAW, which does not restore the
value on HFI_PORT_BITSTREAM. The firmware is left with tier 0 on the
bitstream port instead of the selected tier.

AV1 does not use the tier property. Drop the TIER_AV1 cap and its enum,
and make iris_hfi_gen2_set_tier() read the value from the TIER cap. Also
drop HFI_PROP_TIER from the AV1 input config params.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 11 -----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..3990e6562617 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -999,16 +999,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
-	{
-		.cap_id = TIER_AV1,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
 	{
 		.cap_id = DRAP,
 		.min = 0,
@@ -1856,7 +1846,6 @@ static const u32 sm8550_vdec_input_config_param_av1[] = {
 	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
 	HFI_PROP_PROFILE,
 	HFI_PROP_LEVEL,
-	HFI_PROP_TIER,
 	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
 	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
 	HFI_PROP_SIGNAL_COLOR_INFO,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fac61ece177e..9464543836c0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -603,8 +603,7 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
-	u32 tier = inst->fw_caps[tier_cap].value;
+	u32 tier = inst->fw_caps[TIER].value;
 
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..973a6f91a49b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -135,7 +135,6 @@ enum platform_inst_fw_cap_type {
 	LEVEL_VP9,
 	PROFILE_AV1,
 	LEVEL_AV1,
-	TIER_AV1,
 	DRAP,
 	FILM_GRAIN,
 	SUPER_BLOCK,

-- 
2.34.1

