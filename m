Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E433164B4
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220606; cv=none; b=iPZ5Cmz83UbLFbXBYUe9dp8iGkPXR7MiARvoi6zq5cyrf9GRkNVYE8R6VQwtLFNbmFDkZ0vbO0NS769kemTDMWPPDfMfETbg8f9uT+pI6+9OXC4/5vEOXSGqYivWDV25B9ZSE5Wkh23dZDgc+qbm2OUctKxJqYIODRU+WD1Kass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220606; c=relaxed/simple;
	bh=oLLjuOgK040qtaqEeDmQSIpMa5K6dCEHSb8JedTqI74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JIijNOyV1sInnyptOG9iwav7WZNNRlMK5Bd2DXHjsXxL4l3sX2Zh1wAsyb8g6rnsw6egJA7E0ht99qbqZJf/+U9ID2ajx1i29HoFT7VHQ5pQlT13Aw8mf5lXdv1pTzX70GGk90FVXx5M64b2DMgoRal3gUJy/PNpZsWvoP1iMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kt+u8FVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6ZO/a7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kt+u8FVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6ZO/a7c"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Jx3W91040063
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Aug 2026 20:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LdzD5p1HJXZooPEGcGX0tp
	QPvvizEG9tLbaiZX0cVG8=; b=kt+u8FVEh/bU2DfPfFoMg2I3guthlAy9iOyC+V
	NdAfLJtskO4y0En7SYPgtF7/bCQPhbXQVXB/Bul2PZe8kObpTNV45sXQ1G4+CrwG
	x7BCKcDSAEHj+Z2niKb66eB7ZXB4D3o+ZX453KJZY1Di9bkUu2B51fj1IbY0MxLu
	J7LlnUPqWsIixMn3k5opQU+ODasu2MXu/M3A1BQCrCBtzwVg8zRQ2ld0QnmM2BCd
	275qEjDp2vhaV4wr15rL64c14avRsM1sMuLfEauGUIjFF015KbfPBBFEeyTIvmcv
	EXNW/FsTgJJ3hVsZcWwsZ3xelvfn7+lFvnycf/q5tJ2bvncQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1y9qdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 20:23:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so17167695ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220603; x=1786825403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LdzD5p1HJXZooPEGcGX0tpQPvvizEG9tLbaiZX0cVG8=;
        b=D6ZO/a7cev9hTwuMGq6m3c4Qd2gyo9KT8dtBYYBWW/XAqTjieV7uXDcVcTnnvJReGW
         r3SCU4SF/xHTjJwK9T3POc29bvp/3k3gKdpBtUmBnBBG2p/whQbs1ylwwrFASoOS5/lX
         tPVmUHaULMCVzr3R+XcYUsB9n+rN3kp2DuAn2Bu5XWQZLFIw9u5XoKNKgrMyC2fmnz6z
         1BtQcqVj3IXHtQZ4oDJJe5C8cPTKOUv793TgD2cG/otxCjgSmHySALrmqpN0QTGHQfeB
         Dk2KfREFmvZD5gqz9bpM0lrZwmacA53fPKrVo9ajxGBZL5PWvAdRqeUczGKfajKNOn97
         99jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220603; x=1786825403;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LdzD5p1HJXZooPEGcGX0tpQPvvizEG9tLbaiZX0cVG8=;
        b=hGmpNt2CnRySsPvg9OUl5tluJCbMYe9XYuOPW9tSughYFgBtDS79nf031IHudcykLV
         wAfiO7BXU3nIJOWseaijBWYUiERtPY2ko3Qjox1N9zau5VxmNbr6U3UjTmDtoYNEb5UP
         3IcWcxR0WjkRtH/hO9wZTaBRks5bWGpftqyBDgZjVWpraTTO/YZJBuq8bDxareX8uaym
         Np8GUEZUarKzhnXV76agYS3JUr2mUfWqRYH3S/+EK7vJo8xoaSSzGl/bnKrpw4E/CTeb
         g/EvwAJjdk0Fj1u6EfjKayq7dKZHLKyhF1gOioHTLR9ouQmZDFkYqYbViV9bS3a+RyRD
         cyLg==
X-Gm-Message-State: AOJu0YxF4U6DgTe/s7S1jFAFpfmFqexqfisgRuVWY4AJQ0beQb+RulCE
	GKMe88BQhS39iwznADgu/xkd4cJrMmQQ+0DtY/oGURdgkYONEqvzyVVXiYkAypjnvYA/Qw+fSlg
	EOspqG0NZIiCeh/wt/GSKqPrPEQksjgPMEJH4FIYTpFg8hL1726+Qq5bd4hIZBmNLieiY
X-Gm-Gg: AR+sD13zVPiG+UGdZ6YieSihnGEbR7s44NJh4txwU+cTdeEpFoBxP+KfUCv8Kbw8g58
	ZiR8MdVArYf4Y5iRGwu5SkH4/dBOu+D2n5rvccmRbUio0evJeSd1G7BOUMreE2aLvXXV7chV0NM
	qrnyldDrAChV17AS55PIOv+Xm4efXf8l9Jk5HxKJy86xPZCoGDxofjnn4IRLPe6akwfeb5is4LM
	yBRpjY0DPU26lVI5J5OfgVS3x73Rxwjzd1oZLwRmR6FyiLsazn7nvr6o/ltS0I6Sadhc7NfDte6
	jQ0UshV27Xc+WSmQhLM0Jr/rhqv5d/8iUbtBtXkB5sAClPdZk5UGhSSLZGs0Y/aq7L0ng20SqNV
	l8A2H3Pl5HOkf3gzoI4YEBWqc
X-Received: by 2002:a17:903:1a83:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d0ca7fbca5mr425586255ad.11.1786220602815;
        Sat, 08 Aug 2026 13:23:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a83:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d0ca7fbca5mr425585695ad.11.1786220602356;
        Sat, 08 Aug 2026 13:23:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/6] drm/msm: Support for Adreno 830 GPU
Date: Sun, 09 Aug 2026 01:53:07 +0530
Message-Id: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuQd2oC/yWNWwqDMBBFtyL5bsQEjQ9K6T6KSIyjDfWZiSKIe
 2+MMAycGe65B0EwGpAUwUEMbBr1NDpgj4Corxw7oLpxTHjERRTzjM7yJ3tJu3mlDPJc5SJlIku
 JC8wGWr172ae82cCyOqe9j6SWCFRNw6BtEYywW+q9WSSu/ACI0jcWwdM/UhZfTUpVja02Qd0wy
 kTdJjzLk5Q37wkxXFbZX9LQrRcpz/MPiRq6RNYAAAA=
X-Change-ID: 20260428-pakala-gpu-1e99c9671687
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=2014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oLLjuOgK040qtaqEeDmQSIpMa5K6dCEHSb8JedTqI74=;
 b=srshORzAuxD4g4wGlcmuEJtAGJPscUkJp828BRyJ8VY8A4AOd3/8du7f4Nuh4lQ0FyKudpgBx
 PE24IaRCe10C+2L0hvUBBExVelnQaIofQRhJejQ0tASWmvLdyM8ToVi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: HXXqdA91uWBrSp7EzFif-pwLHnPtVdrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX0FqwmON2C9Zy
 2Q34LCSsphD5lvIYI/FZ7CfWH1ZBooPoczh8JkGkTPaA8dM7+9zgCu+8cinS7yT/JU0X4fBXFFf
 Rc6lkbj9QA6XkeZdbg/ifuj0ONTDFbwBMgx8ziW2U20cc3cOrnZ42zPcMlBI7RaMzsa8VYLnyjG
 uukU8/cjcE530uzqy0wgu5ApSR9flWs/+oimOYq7UEWcjbpssuduTtzZ/JMumoPB2sjhIhy5fXG
 wQ0faLRb7WekegMh4tebBNdQhRCPDmts1qbnsj+TkYsKgPP04Rj/eec1uR7hNfPyQt4YqAujAN5
 afikyo3rI6t3Cj+pTUYAptyYgZ6qdUsWrRlzzMnZ+nWlH5FHfDomnX4TJhJ/1SN5MPLmk4mbsp4
 hgyxgV7F5XPN5Z9SdR/OpHwlK9D/MkwTJMb+Qd7X546HM5CJUZTya1Js8CUkKCziCWsuRBRktZz
 MZbIYOsQa0u6GlC7evg==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a77903b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pO2zmJmEa73fCFxjQ5kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX4+v2lXDzbohu
 Zmqx/SB+5+lWfceDGkyKqDm2ZtKoEuXO4oPrDDUxDyPVVoRdohKYtyTXSV/84DIRwdVDVa2eBz0
 QnlrtsRcDEOOHXiN0/vAagQD4UcwbtM=
X-Proofpoint-ORIG-GUID: HXXqdA91uWBrSp7EzFif-pwLHnPtVdrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080176

This series add support for Adreno 830 GPU present in Snapdragon SM8750
chipset, which is almost 2 yr old now. Adreno 830 is the first GPU in
AdrenoeA8xx family [1]. So, architecturally A830 is very close to A840 GPU,
so we just need to add a catalog entry to describe the GPU along with the
necessary register lists. Both Mesa support and firmwares at
linux-firmware repo are already available. Mesa needs a correction to
the chipid value which will be fixed soon.

Patch [1] & [2] are for Rob Clark and the remaining devicetree patches
are for Bjorn to pick up.

[1] https://lore.kernel.org/lkml/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Gaurav Kohli (1):
      arm64: dts: qcom: sm8750: Add GPU cooling

Jie Zhang (5):
      drm/msm/a8xx: Add support for Adreno 830 GPU
      dt-bindings: display/msm: Document Adreno 830 GPU/GMU
      arm64: dts: qcom: sm8750: Add GPU and GMU nodes
      arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
      arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   4 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 335 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 334 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 8 files changed, 672 insertions(+), 26 deletions(-)
---
base-commit: d56fa0b2bd2d9b2fddc10e8f5bdd42d56676935c
change-id: 20260428-pakala-gpu-1e99c9671687
prerequisite-message-id: <20260714-gpucc_dt_v6-v6-1-16bf5289572d@oss.qualcomm.com>
prerequisite-patch-id: c050130345665caf00f2390fb3da0adc62667eb4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

