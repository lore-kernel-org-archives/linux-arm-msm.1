Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848761;
	b=5T1wWWXJug2oUkM5jbTa1LJmB2+n5O5RgtDdDThxS06FVWCB+egRJXynZ3iLVav6M5As
	 OqnGdBrEEUOnM5MrJ0CA0ef5EccKTLrZH8xSuhOj8Lvqir/r7Yrboi8a+z6MEoBxAIASm
	 UkTI5VLttWhuHHqGPhrXVAx1BaIAznGJ8F3YMgVKRMG/p38xpBNuB+kzTKzmEvhMoKoig
	 B3qsiqh7ABBpFhgJJ7SQ+1Ff+h9nM3bpWOU/4y+83SiqGJviSzsBeXvTpjcOvZ8aYaK93
	 jpfxVUhGdERz0/AAlkQ64WmqrL9Tuxfcls7cU7Z679M78fdvPbrYcnBXyodFAfjtSBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
	b=XcrpptHmp9kAkBBZ8hGNMCeowVrKnxAA3/y/g1J9NlmwwaFYPwz2YNlCwCuVtrmEJDj/
	 Wz+y9o2mF0hIuCbcLeJcKNkJQkRVV5V4/zCwhOHzNA84Y/SIVKyQkEWTAjyeT3lHxDK+8
	 Ih5tRR6xx4AuocjLH08fLGTEWDM29rLMieBuBENGgr7DdqiUrkHEgdEgFqNyqzy5jIWsc
	 TyFMOl8SE/4iAwBn50oG3yWtai/C7vmwlOk5peXbDPitNfRVh/g5hB0naje+e2kd54FfF
	 QMCHlKQNLI47+lFkoezBgsXuYM/2FiwRMQjmyxwNYty/2RzuhGTK2753G5WDEYVYQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUI6iQxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1nMPmQO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A627606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A627606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUI6iQxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1nMPmQO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIbTN154548
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2u37bdBOIMSumc6z0AyNM
	M8YbxXxPAGRGo7HKUvAh8=; b=AUI6iQxohVwkic0DVI6EyvNoE9bsG6285AHq++
	TNGV9oTmfejgf2czQsrFcKdscjcooedkaLXwQA1S99lyB6EL3ILJSJ77qPOCDqWN
	ViMYJpAnGIJtBj9HJikw7MWIrxvbudz4YEI1Xl0k1r+1NIBHIodsivKEqIfD+U8X
	RmImLoGE7+3CC5vDv5j4wmhwfpUAwNiXf0zmWTXpyCRFd5+a425Z4UO1FoYpx3s7
	TwOInDynATp2Zt+qL4CWzkjq0ROvp3c6t+xSxADSZ60QjsofsbwR8Q5qaWQXnx4F
	pqOdy1Zo6nmRMua5VucQAqBFKf9TDHRALIIV7u/qopoKGDig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghrea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 17:05:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb2437d752so20697565ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848758; x=1795453558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
        b=e1nMPmQOg9qVc7XbxrAFvyJx8bC+6feB99BuoW1qizX4hLRgbPlZE4z1U9tCjLDVBk
         lFrkJVvF2uE1yzEMHIw+HyhjB1UMLv4jDUJjuQn4DjDtqUWtyzkUXBjazpX2B/dQHklk
         pnoNo05gQs15qTTqpJtsaaQqmGKgOcbgSWCmj4tef8R4cZ9x3AeHBQFTl1EipTjdSLvM
         Bbll1wcOCxxwiIY5vqyvTLlIv1wGAzxKeIW82Uywg3OxU0AEI47EhyLBOnicB1ed1zEb
         WB9UuZ0EwiZrfnYPsAhZU8ViMymtATUF51WVCt6lUE0Xuo0oJ8w54fwgZneTbLCn9PvC
         itkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848758; x=1795453558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
        b=fYGzSQR80mkQGUIDicdTtjLFede4Q3pgpyPkHjwWwN+V7nboROqWlTneQZjsaf30/J
         azoo7sGXSJoyNaEOPfwRjtDhlR9cLFDDUAP6iKogSUKBg9Q+ADh593FTh80xbdw39DcY
         ixiMsTwR14qVra/AbfBTExrM1NkB8urv4cG22nnYkfx7k4/Vq7lN8fNyfvWJH5JzRScm
         heeF+ANckF/kFaVlQtAnarxfdegAhfXnwVbrrNXH1/kFrJMa3E4vOOyS0aQyXrTv9XXf
         uRs0qvbH8oFPJBNz/d2nwZt32bIQnFhdRr/iG8vx531KUaHCOyri76jToypjEHcfxAnr
         XR4w==
X-Forwarded-Encrypted: i=1; AL+hErHcs6W+Q4Eizx6nn8vlEouAwm5lEE8H2t3JdFpnSd4LlwkGYgPlRxbLU7u6yF5D5FUqUfpuNizbe1M4Q0m3@vger.kernel.org
X-Gm-Message-State: APuU4Z/hxoxFxqpA+oR6kAvMzpz3ixGqZRkBP4TX+VuTTPuZQgHmVJ0S
	pQOhZHjHOkkMda2IPHwmUwWEySVs5KoKoUtiBdwc4zzxIWQpCbowUOxiVmyZmFxBKD+p8FzxUMM
	6DUjdwhYmI6eoeMyYDLPSk2Tl/OS+w+Hviup3AhCewIDYFIKVG5kByOp1UDhdNkkx/Eo4
X-Gm-Gg: AZFdTZeOLpEnHa7Q1RkEz9dJKaOYBr/cfK0tqM93oaHWfz5ukAAdzHlK00GmRGP2OZB
	ANLI47X8eBa9g4SOBHvzWi3rbV46W6IiBh4jy/9mJHlP+EfHeWqCfmr1HMOVXnGDkfK0GO6qQLt
	YRckHYuTBVMJDCFKoEx9SN0xOv6w4pMWNRqahYFn4EDsYICtGA0heehvzKLXCBxLZCQfMd2A01X
	wpEcyymJl348Ytt6i/tCv/kbcChIO4PyWsccLM37a3rQz3sQWlpVWxNNv7mfayB/TuOhzQmZZ/r
	4lG2lr00FVYlAC8xipt5r60wPpYLG4VvZDmsMA8gR8QqgsnE2O9z/FHJ3vmnYgEH9PUpd5ZtEKZ
	5VBtu4WgPRTW1l+4NmOx+BYs8F5ExDWhPYOgIFMxkhC5CONY9JgjhleMyjPUb+GA82ZzXUBzGDe
	djDHQt
X-Received: by 2002:a17:903:26cf:b0:2ef:d087:8251 with SMTP id d9443c01a7336-2efd08784a6mr10824515ad.45.1794848757847;
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
X-Received: by 2002:a17:903:26cf:b0:2ef:d087:8251 with SMTP id d9443c01a7336-2efd08784a6mr10824195ad.45.1794848757358;
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v4 0/3] add MBR type rate control for encoder
Date: Mon, 16 Nov 2026 22:35:50 +0530
Message-Id: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO43+2oC/23N3QqCMBTA8VeRXTfZzpybXfUeETL3kYPU2moU4
 rs3Dbry5sD/wPmdGUUbvI3oWMwo2OSjn8Yc1aFAulfj1WJvciMgUBOggLsKK2PaqAVI0g5dwLw
 RSteUdw2jKN/dg3X+vZnnS+7ex+cUPtuLBOv2pwkgO1oCTLECJWtXM+K4OE0xlo+XuulpGMo80
 Iom9ocoYbsQwwRLp4zWUrCGsx1oWZYvVmhrIAIBAAA=
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=3191;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Zshta7LH1VkHwO4akPrN2bcY3bKQ/gUTFR3uTB+MhkA=;
 b=IHX2knwrWnP/VA0x9geISH7mkjO9MR/GHCTOlxkUKVlhV+qWPr2BDnC2DCnD/sK9dczd6f59k
 aYuo7bNSrSdBMpC5y4VsMOxVyfv+SsHlLTBXcaNPFaKsEIMI3dYq2GW
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX9Y5Jr2LTGiul
 cTy5lzr8SNHXXwRAQFX2I93UJqh5EIZChogHNpE7JRuoh+NeYGubdxi3aFM9LQXUe4cR/o3/1Z1
 E+w0vVRt4fyk388vLaOCDWUpuTWykPzB5DAAALcYXx0LJmAMLp9eck2Slrl7z6vNChdknVV1yv/
 6iMo4tjIORintzzDpLW0J0kXeE37Pm704oy2C1b3liMLhk2PiVirHk4ZIwmfNzkiE7EHjn5ALok
 kVFroVOdzVYMInjCieh8r7r5zIKB7A/qSEuLxk5UEc1afJjAxDkgd0JyoazZr4X6WySr6OGaTUn
 lmmjY0qGepUH5ay83Acwu4FkZBKUp+hHraR+D3oKUNzjuIDSnSnIrETlpqiPzJMorlqo2Pf64I9
 lqPfYgtu8HRj2DtxYxK1rjExxIbQWK4Q2QRIZwvMCCuA6n0CMJxu6J/B+4rv1cbRWn7erbMNEBy
 N93UhVkxOyhRi9vlA/A==
X-Proofpoint-GUID: _wwBM52CxKOJD-7lJMNy1HxFuxv85rQC
X-Proofpoint-ORIG-GUID: _wwBM52CxKOJD-7lJMNy1HxFuxv85rQC
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb37f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QU3Qso9P9l-aNNcEKg8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX2raiLhj3G2X6
 XZ9EI0ZZlAmP8cbT4AwB24ILD437uP7F/nl9wdRRhMc7LAgointUuplPxlnJsGtK5Z4BBFCk7Jp
 vcG3nMVnGEIZumrGObLELy9N/UtxLEk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

This series adds support for the MBR rate-control mode in the Iris driver.

Patch 1 reserves a control range for the iris driver in
v4l2-controls.h.
Patch 2 adds the control to a new uapi header,
include/uapi/linux/media/qcom/iris-config.h, and documents it in
Documentation/userspace-api/media/drivers/qcom-iris.rst.
Patch 3 implements the control in the driver. MBR is currently supported on
sc7280 only.

Changes in v4:
- Move V4L2_CID_QCOM_MBR_RATE_CONTROL from the driver to a new uapi
  header, include/uapi/linux/media/qcom/iris-config.h, so userspace
  can use it.
- Ignore MBR when frame-level rate control is disabled.
- Don't program the peak bitrate when MBR is enabled.
- Link to v3: https://lore.kernel.org/r/20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com

Changes in v3:
- Split into two patches: add V4L2_CID_USER_QCOM_IRIS_BASE to
  v4l2-controls.h (patch 1), and base V4L2_CID_QCOM_MBR_RATE_CONTROL
  on it (patch 2).
- Reserve 64 controls for the iris control base instead of 16, to
  leave room for future iris encoder controls.
- Link to v2: https://lore.kernel.org/r/20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com

Changes in v2:
- Per upstream review feedback, convert MBR enablement from the
  generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
  Qualcomm IRIS vendor-specific boolean control,
  V4L2_CID_QCOM_MBR_RATE_CONTROL.
- Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
  enum, its "Maximum Bitrate" menu string, and its documentation
  (previously sent as a separate patch 1/2).
- Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
  duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
  shared encoder cap table and layers in only the MBR-specific cap
  entry via the new mbr_rc_supported flag.
- Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (3):
      media: uapi: v4l2-controls: Add control base for Qualcomm iris driver
      media: uapi: Add Qualcomm iris MBR rate control
      media: iris: add new rate control type MBR for encoder

 .../userspace-api/media/drivers/index.rst          |   1 +
 .../userspace-api/media/drivers/qcom-iris.rst      |  28 ++++++
 MAINTAINERS                                        |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 108 +++++++++++++++++----
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 include/uapi/linux/media/qcom/iris-config.h        |  15 +++
 include/uapi/linux/v4l2-controls.h                 |   6 ++
 11 files changed, 147 insertions(+), 19 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

