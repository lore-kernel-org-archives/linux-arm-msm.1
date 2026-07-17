Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9E3B0AF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271176; cv=none; b=S9DicLOmI6qf9Cdo+osWoNANPHBwrvvj8fHlgX+bMIVK0S6OgQ4ec8wyYCRb0E74AAGLCKaAL5DKYG1jfU1jhf4BKT2Qjt+Ag8/KtsZsyv51M9rLqKFzaIK2SnLEybg3lOiqD7kvIPdRvCTb5Apam1R8ix2v7OfJ7h42UUGGUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271176; c=relaxed/simple;
	bh=Q+TOHXsToQub8NlMkN8CaDGAJy3c2iReLuURCfB6wQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hl2BrOpIdQgORfpMbIB1WE4eMLYvb+0GPdTBQo3hc+hdW4kBl+GivTivagAawx6tOecEwQCMfVDNaIi3pdzT77ayCWtrGCniRfr7EaBdUmBwJvBLKUcjspHTKphbawbNGqH5iDo/sMyUbWD7UskuGsY1i9hKwX7D/cgpp0n8S9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daDyvAr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=holM1kLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daDyvAr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="holM1kLY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRJw979774
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fQFQIdc1G6cXPZtnLJil3C
	nJ/uYl/+ZjtDzxtSC+s6I=; b=daDyvAr/p404kuXz33LkvNaft8zDSUvetCdO6h
	+0I/LZynSZsvKsc4jwHShcRTeBucOcgahVGgzLUNDShQ6RukLQ6WvxcLyLoLg3fH
	Z11WaniokJ8EMr7P/wk65y7CzfWsxz8fcQJ4SeBP9LKOZj9xVwVlVRvzqKw6/1jP
	4I8K6GrztsaMj4JbppAMd3qJ/O2C+L3h7v2KiNZmFctasXmYX+UK7fjAlZ/s3vUw
	fvbZiTr++N4Zo0leDcyyvekBUUCE/JlUF6h2CzcrToS+6Ti06DBwdDFANJ2IzNWF
	6kM/24xoc99tz18rJGaOF5b/kE+I5xidM5ckl8iIYBQQ7hAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gr1wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:52:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84877b362f6so2626805b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 23:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784271171; x=1784875971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fQFQIdc1G6cXPZtnLJil3CnJ/uYl/+ZjtDzxtSC+s6I=;
        b=holM1kLYg9HQAYPSlSsDEPz6+GUhSWGmAjno0N6F+wFX6mejwre3K87H+xIila/FjT
         AEHdSKjVF7M0SU0GhHMGVhN5UJ96CUyWrbH+bsuOarUX0CVjLsSCcoOOEf6nhjToiEg4
         ylfi8z11VvBSzs6Vh0SQVM4qyJEYXt0yPIh4+xRdXKdwvkAXcgRDx8smOn4GKojlRGi3
         a5fLWVfJLYRkep2uyUoMkdebu1gIJQ/uaJMGci4+sGVQJt705zPcN5VOZ6NlQcRhouw0
         xBKZNvxJnDQBcRIUXSTPSEOROHogpFMoTLlpUyidI2UaeOhDuojJ42dtRGIhrjHTh1lw
         KjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271171; x=1784875971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fQFQIdc1G6cXPZtnLJil3CnJ/uYl/+ZjtDzxtSC+s6I=;
        b=RgvbZrpQ4T1e9RezVKcvRthyvb7SuBIY2niUoz22zlE20Fb0SQ1ITSMfLgG0Ko2gfb
         Xz/qFhTB9cojzyudDTTipkvDoSRInzr+owxOudFLZTezKxV3VMniyd5XyCat20NnyBH9
         ddiI9Itii7togIGQeQvb3yvtO4CW17I05UtZ3vSpnJfz3WsboS43oo2E5n3SNblpWR0J
         Ge3GjLAFsrjT3PE/q3KlYLe1KHw2DYjlXssIFjI1wekLqGXo98QB+UpIQZhLni1TYsUA
         CkJdOn4PYhVaZO4KZMd3LayQvnBqUYIQEyyr4Dxh6gS6/LpJqOPQGO/AjDSDqDfyLWiG
         OP5g==
X-Forwarded-Encrypted: i=1; AHgh+RqfpcDO9PoQ5lixspNe98iWkIbgDhDnbHh/uKSwjGd5QjLInhVlGnWt8qEz1izYO4s5c3XuhpACw64Ag5ro@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLLWM61gsivEmwl6Trt4ewAFDIGbWRiRlyXp96z8x+8suN4Oi
	9sIQNP4f9vCNH+wLcd/nuSxg9Bu83v6TE79shnnqtjy+1VGuM2mJ/O18t65FM2AqBm/Oma6hjlm
	bnb5wEHhDkPDEZy68Fkb4fjnd/iDaZQRD8ULeDJuLiF33odgmYHX5xn7onA0WWcvUfcFq
X-Gm-Gg: AfdE7cl1qj4dEpa2VjEziSXa0zlZBXWs0vos04e4kJzZpm4YeCivJlX7joqa/Lwiuet
	fpT9lb6iBoYZMYUy9NijrnQipQ+1hZ39qXnsfzE5k7SRA5BvODXdT4irwEJDe6qtFnWqOgqEY7K
	trZPU6WUOKqwpph14zQBZ7M9s38y3N0wFonVQzVRpUD7kj4eL0Hxu9jqSTUFFycMs4Ra8nbY5Ko
	9ko/sMttYZBSB01zmyr+wHMs7O2E9gSVbZ4UBpCgvLhFPks+Oj8d/wPRohSDwm8+NaSQpu8k7Ea
	m0R8E9dSk5cEP8vpLSssirBDCTr0dlOX3mrZwWU2RsWwc3MwI7XgVumX/E0aWakklftlnE83Vfp
	pkosSZ1NjUfUnifmymFVkYYkrSo3Ny90=
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr1324433b3a.36.1784271171080;
        Thu, 16 Jul 2026 23:52:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr1324405b3a.36.1784271170622;
        Thu, 16 Jul 2026 23:52:50 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm437651b3a.15.2026.07.16.23.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:52:50 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: iris: add multi slice support
Date: Fri, 17 Jul 2026 12:21:43 +0530
Message-Id: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/QWWoC/2XMQQ6CMBCF4auQri2hA7TAynsYQ2odZBJKtQPEh
 HB3Gzcu3LzkW7x/F4yRkEWX7SLiRkxhToBTJtxo5wdKuicLKEAXRmlJkbj367RQzxM5lLWuDDT
 GtrUuRbo9Iw70/iYv1+QhBi+XMaL9hSpo/kObkkq24EowWrV4G86BOX+tdnLB+zyNOI4PGNJIj
 rEAAAA=
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784271167; l=2636;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Q+TOHXsToQub8NlMkN8CaDGAJy3c2iReLuURCfB6wQs=;
 b=/UYV4CdNnR1nFuMe4wNTvxgZDoV+O4ZjaMMCJwbHbgQc68cSQT3WerSxKRezUM2ms8ppdQlJt
 qf7k+HghVAtD1uWG3zbdd/Wfr9+hLbtvbuZzwbc5fu4MlEeb5gt1U9j
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA2NiBTYWx0ZWRfX8uOnjLciyFXx
 QqYKDGbXKpw5crdfyygwn0UYNAa03+v0FOKJQJfSlASN6IyoIyf3rtwLPQCJYy1EFzb0lFE1QkL
 eZvNgxptwwV02tfuqHge4Vt3vCdj5kM=
X-Proofpoint-ORIG-GUID: zCE8PtFBp9v42g_DNMEcoSbts3l6BI0J
X-Proofpoint-GUID: zCE8PtFBp9v42g_DNMEcoSbts3l6BI0J
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59d144 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b6dZZY6aNiEbEsjWt0cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA2NiBTYWx0ZWRfX+HXZ3lJr9KWW
 LoOygDcE4WPtt3i/xB/GYJ0mLNOswZGdSIWwGNNQ8yhMGbZN4fMXLo/lsv+lx9ZwnjmDTfobRQX
 X82dFUIsV/2DnARReR/Mh4mNV43kR+GOn1SutYlSVIEvVd73idX5lUb1VYuoTaokc1PZ1Y7dVZX
 30NSDlStKXVztq3AE/N+6aG712gD+PnuneEqThFEknK2eFooFLc4i6ePmONiddok37EHdeReuC2
 huQCPWq+9nuClMIpC35FkglLZ7EgVwg3kxedeuaE3OxPUVY2HA35Ze9jLV3+kjDNzddICDXH6bU
 PuW5E/ZovRhb9bxFYnMCahF6cliw/I1W0JQI8EzkgVKYlEauGS9HfRQ75xh8dFUZbhARd0jNmY9
 elbLNgb7NwJdxITa40CUxIVLOdsFS6z9V+0u3wt67qETcDVKGHrF1TtwlSBnmtACQWtA6fHBdk8
 2/B6ZU8tUl6AqzxfKeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170066

This series adds support for multi-slice encoding in the Qualcomm Iris
driver.

Multi-slice mode allows encoding a single frame into multiple slices,
which can improve error resilience and enable parallel processing.
The feature supports two slice modes:
- MAX_MB mode: slices are created based on macroblock count, controlled
  via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
- MAX_BYTES mode: slices are created based on byte size, controlled via
  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES

Clients can enable slice mode using the V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control.

Patch 1 is a prerequisite fix: iris_set_stage() currently always selects
STAGE_2 work mode for encoder sessions, but CBR rate control requires
STAGE_1. This is fixed by forcing STAGE_1 when BITRATE_MODE is set to
CBR.

Patch 2 adds the multi-slice support itself for Iris HFI Gen2 based
targets (qcs8300, sm8550 and other SM8550-derived targets).
Support for HFI Gen1 targets will be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264

Changes in v2:
- Added a prerequisite patch to force STAGE_1 work mode for CBR rate
  control on the encoder, required for multi-slice encoding to work
  correctly.
- Addressed review comments on the multi-slice patch (updated commit
  subject and description).

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: iris: force stage 1 work mode for CBR RC on encoder
      media: iris: add support for multi_slice in iris encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 84 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
 8 files changed, 158 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

