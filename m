Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD803FC5CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597824; cv=none; b=hEyfvf9nYnJOou3lC2+IJ0AV6Xre5X9QuvFGRKdyWZ/iNr+oLECK22cx/Rrd4J8A49FJ06OGxYi3AA7FJTBRaUPVQs3tk1cq2EQTsSOIONrGtIn5zOfIBWBGeKkrR5FpO86Ql167MTdcZKU2mMjYR3y7fUXoo+6dzQQWgs+LWNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597824; c=relaxed/simple;
	bh=+LZ4Yrv/UmqUC0Op9Jo3De5Ek4m7MPFw/+sMeESY4wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5OjxSFSyOWzYndcDtCRaFSliR+Eb09RhHooh6a60tTpz7+PpUtgz4IQVxomWvB1gbSAmpU+wnsuGXqBmKBVohzixIJY11kNSIFkGnWAX+rpAmowE0EkHqV2nFR1jSQa+GsFLNfWBzNnXo11ej1DT9mZMCKPbpinNQyolEEQ+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrhS2364; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8HcSHZ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrhS2364";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8HcSHZ0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDmqD3980888
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWs9kUgFZ4itzB4OiNEdBRFyhEJb5EnybUj2HxSPprA=; b=XrhS2364Ow2JjGBx
	vasE/m8rEcUOorzIebYNix/oN6imZb5ZLoo1b/+CNEtDhTh2ahuTaz9J75hlnB7y
	utOD2FIZrKDG7LiMmkeXAZ3Nv/BKaxb+zUW8ANvj/hFNolkx3jBd2IKiOZrU/n8x
	worYQTzLLuJ6Ato3F6H1/SVdZ98yyOfMEoLN7O1DNq69wkiz6ZmGTw8JcsW94gs8
	PeJgkjvNadzqrkKVWz6p0paWEvmp9w26fZ9lfyhAKC7UDOtynvXcfamfFTyGdgj4
	QZ+IhNVJmJRH5qOsmF/W5OSbzPAN/bgV0MUJh3AMDhhSZfu2nMtf7By/uOEHF1Sg
	jnlW1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv41qcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:37:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so4017852a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 18:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784597820; x=1785202620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWs9kUgFZ4itzB4OiNEdBRFyhEJb5EnybUj2HxSPprA=;
        b=N8HcSHZ0hA8P22hlmaxBqrwFO/FvxCGLWLumVmUZhkrboQ6rFEBAr2pxNTDCFHXUoP
         petY/1YyMaP1L8fDu8NlcS8xnTVaBtQEoDqV0DSjBx81eyTvrEijfvtSnPuqE1e3lbBE
         MzUZm2OXHQ6YEUfU+7Z41ft8gga3I+tGS0n+mQANzGlMWk8pvgb/0l734m33qfHpdyJ7
         Bn+lwppO0oxznduBTqXGQiSMOoa3HX/v33GyMX4CFp/7ViHkp/bqlXtJzUO+jCdtfIEN
         sdy2qjx7CccYeWzuVRatUmAvPvgyLF0uFpqw/2wP0mC7V4PwPTPlkLOIRBkQh+6RBzp7
         YC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597820; x=1785202620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWs9kUgFZ4itzB4OiNEdBRFyhEJb5EnybUj2HxSPprA=;
        b=JLV5nJJ5Odg22o9x/TUAAzbfzcqQPngS9Kfe6U+WnV/wjWJK68/d0NJwp7wKjXuOhf
         T2/7MwvBc4A57+xM0Rg9oZxhI8DfUMasw6eueaJh7NORU5ZelrRBr8Jgwg9TJWPvMiDF
         9mkwOa6dkiDHr1xcwWfXfgdFgc2q3uoC0uN4n24KaI3DY4dKbIGNdAmxMybp2c9C4Hp3
         F554uHAkKJfMXZCoaa+6xKI7RZVw8YGJwkN0cRRrFkRAWAlLccvfpOPcYa5ZSH/7e0cT
         Y959c815jokYItptaMto/ibiTDA0yIDVuVYHvm6QbmhIw/BQsEpK0EZiKH/OkvxAQ6MX
         7Vfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1RYm2JHC/nLGE6I3MfApOTOtZzn4tL9emsDpMRFZXDzLL5TLKml+gR+OvWh33bgOLcvUsSvJYbi/1kTWS@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXIeeXAbGUu72r+I/7y21sm0LDNCEnHCjtC7rMU7eaP5C6acq
	mg6QaIXue2aBGCpdJHb63TLHTaNvgpaEmYx4tVdwUQNaqyJS7LQx4GVqsB3nD6VfQxp2n+TuRTo
	mSmaEtX4vp4q35tVzSaMapypQ2IUgMnMmt7+/vsiNJLSB/03vw/jOlv/h9JEUfyxie738
X-Gm-Gg: AfdE7clUWvvDtu0nG8gPyRxK2ZteBLLT6Yv2EckoygC2OU5yzWbhLVI+qAuenvM6HiM
	pEUeM+JFps8iM9iaUchszcIKsESj1YEv9epsIfgii7MNWzcOfTkS5wC1QwskaSrYzPuu1WMhzwS
	pjIgsLhyRgFUc2ehoERV8+onfhD+pMGD6OfJdR568kOMC2o6oYBzsyE1bLIZ2cgJ1Beg2I0fYBv
	YkbEzlnvcH+TYM8ktnz2xmniT3pDxT4ALx6GOHQiyqZT7Li8XJbOfe8ofHNK9K3e+am+4jpdAX9
	v/dYcWIs0WjPOScSixhVtBAVZJthOQmnO3wR+Ay46ZJEVxhHf8GQ+5ZFvjKJu9fnPl30cBDPxIZ
	OuTaK0I/hS9hl/9aYvghLlx63zqRXvjZgHw==
X-Received: by 2002:a05:6300:48:b0:3c3:7cb2:8aee with SMTP id adf61e73a8af0-3c3ada33ee4mr17129424637.57.1784597820540;
        Mon, 20 Jul 2026 18:37:00 -0700 (PDT)
X-Received: by 2002:a05:6300:48:b0:3c3:7cb2:8aee with SMTP id adf61e73a8af0-3c3ada33ee4mr17129404637.57.1784597820034;
        Mon, 20 Jul 2026 18:37:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm34630487c88.13.2026.07.20.18.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:36:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:06:24 +0530
Subject: [PATCH v2 2/3] media: iris: add hierarchical coding support for
 ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_ltr_support-v2-2-702842f1f3c2@oss.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784597808; l=6390;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=gNWOvM7hVtiowRN4fsthjEMdW15sntECJDmf1dd7Z+M=;
 b=7ElvnNIYXr/R1uuhOmb+ez3gU/8+kLe/FNWZq6w9Us30kR5hF5zf6f06kkjqzkeXY0P5eACn6
 itYZwGtSdNhBxZTmD4QBS+AGwh7R8GeosHteQwoEpkEI9QeRnDdJ4OX
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: BkFSTWFRmJykAx_8c8IxcsPPmit6xnzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX1Cco4tAFMUO/
 yRWBf26QD2mvq3pSiaNTkb9uwJcqfptl1B5VR3ua3q631GKIRHu4WH+MUWYt97RaGCwiDmyI0bY
 PGji/buF9K9/oaxzy0qLvUGNgA/UHIa/g/CphI38sZeH6/XWlLSV54+tAxzMt98SqIBLXxTpCw9
 dJdB3UovpFbbI55HSLbVxdtY+i7cRk3+BzBJvo09P4kKwKuN0vP/ZPd/YjkTQpkR/sKgUTDpE/a
 8323EZgcGNIldEitgDM4iNsbi/2p9Ql9wAvqceXaaiB1S0Mq+E2JEX8qkZGpSr+XqKeN2k1pJG8
 onOMldZkItwjiiB0WGw6DP8zeR1B8U7/6rGMjTp0Gz0a1D1kER2vr1h3cpXyYsXSiPTrqX0Zu4Q
 AFZhs0EhvUoniSTX9FfQjvQKWHNEPXjsxWcMP15B9qPe0ztICV+yZklQxIVUHBMpC5pNWEp1G3p
 8dxa/Tjxz6viaCWhhSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX1LthjySQf/HY
 lp/a1Yo2CQ352LObWsfWnRxSucSWDCtYi3TivWKZKy8Q2LT5iu29toG2ZbY2/kLOJCpoasaCw8l
 axZE17nMIz5IGW1pKSAKwWfAKN2PRO0=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5ecd3d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jI2tO5MT3nXOp3B53W8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BkFSTWFRmJykAx_8c8IxcsPPmit6xnzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210013

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Add LAYER_ENABLE, LAYER_TYPE_H264/HEVC, LAYER_COUNT_H264/HEVC and
per-layer bitrate fw_caps entries to inst_fw_cap_gen2_ar50lt_enc,
enabling V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING and related
hierarchical/layered encoding controls for ar50lt platforms.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 182 +++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3be77feed84c..3f82c4b7c6f3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1709,6 +1709,188 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = LAYER_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = LAYER_TYPE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
+		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
+				BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_layer_type,
+	},
+	{
+		.cap_id = LAYER_TYPE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_layer_type,
+	},
+	{
+		.cap_id = LAYER_COUNT_H264,
+		.min = 0,
+		.max = 5,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LAYER_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_count_gen2,
+	},
+	{
+		.cap_id = LAYER_COUNT_HEVC,
+		.min = 0,
+		.max = 5,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LAYER_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_count_gen2,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER2,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER3,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER4,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER5,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER6,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER2,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER3,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER4,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER5,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER6,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1

