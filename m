Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247882139C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716493; cv=none; b=nJxtBL4W3Nm/mVYYexxpKmDcQVJ+BtZVXiJr72DNDeTPAQrrK9rK0WTnRe7vs2RGI7gZNJIEBitIxgbTHiUBqIWqdUg4fkh6/1iwcYLZw3Isu28BzUkKnUUdlLY8FqcKxYMX2ASrlqlndCSNURf8VRZfKOueOAIu+3TQS/sD60o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716493; c=relaxed/simple;
	bh=+JWVdgnRe/ckTZ65I6LekbXjhXASVlJvxXNCuHNml9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EqNLOlM7LeBrUpE7QPEL87HuB2mXxT1hzc73UCUg3PFhHMBZ2bTkmEosTFohSStV452L0zuhUfR6rMRoEi5Jentu1qJ4AGW+tZaJZq/v3qYvKbXUTi3bnmHi8nLhpLYN0sTyBZLI9iNsGZPncvBMc1UdA+8h+Crd/ZbhhBD47fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPnx0s2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8wXZMoo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPnx0s2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8wXZMoo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xMef412355
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7NkBADy1Pg1SibTrDJ5CYU
	lOoTcfGgNE9kkzqQXswKs=; b=TPnx0s2exYEUQZRXAvqw51ejLhozw2pEYuY0HI
	RHiboITBZTDQ8F4ZkUNGFE6LfceiPpdsChci2am5BgTWl5WhWcu7IXSyxazi4Ezp
	gQrPPuMGMXX1JBasiMAN5dBONfLyFD9r+sAQCy770gwRDFmlwAEXzRTJOOH8rYIo
	63mioUMTMqT3UTDLumJLvx0pXoUHSJUitiJC00Je1SaVzx8kwrGKWTQmlcvKcuAU
	7XDmMiFto77kt1PHnLkbfuuCfUbZvOurWYI3evmDbBqBj2Svzbw0FqkhMAF3l+zw
	HhsdxVkynr8JdamqMImvgbm5obhrQduo40v06eaUskAo9tSg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhde7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:34:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so300065671cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784716489; x=1785321289; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7NkBADy1Pg1SibTrDJ5CYUlOoTcfGgNE9kkzqQXswKs=;
        b=h8wXZMooZKVowR/iNtwy1OWsbG0oMcLY0+f2POeUcPJ/kyBj5JPqj0qETjEXVOEv5S
         01qK3nQKPVvJ/NqgbM3rBjQ+njCG53yGfWpZGfs5Qk6BJgeOTErB1eDMUjL+UToF7doK
         flyMm2y/0qdnLGyQOARQrIZd/xD51ao6slMNubDACF6L2mWLwDs5l5EL9GLVgM4cnU4w
         R7HbDhY77mdBfBsO0Ag8ONrnxJ/i+vw6qYGS9H/Wg4q19c/33RpYKN8qv5v/s9egmGh8
         ipgpwRvTV+18UtnspgkKlHLLZtl4BVFYHs1uDgNRZrqrgChu+pJ2+IvNfbs2J9tgM7De
         UbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716489; x=1785321289;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7NkBADy1Pg1SibTrDJ5CYUlOoTcfGgNE9kkzqQXswKs=;
        b=nlDo1Azj7DGm6wLKQP33yfwijqJEV9iZXLQ540yAjWuXSWJOtmlv3ng7ste8tvHa3p
         tuxRIFg/sxGftYh56kRNWTRYSuxxW/uPQfG1Legjp0ODJ/d9UT0ESfB2d8eybdrPS1s+
         mhPNSRR4RDanvWGQ9R1r+iZW0QtJsZujSQYkvKKYBtUlboExDvMjJbpLaA7SH9frhMpz
         HnLB3cKqm1yJdAwOuGOG8PPQeGMNfI7RXRZwZAY5SiT/AESOvXZCPbKp1+2F4/EE9sUQ
         AbOsIE0uKcPPNv9hVINMLkPSyePK3vPUDwWWCnAwZE0+dRhy7FhSW3l9OW6+7nl6jwTq
         QoSw==
X-Forwarded-Encrypted: i=1; AHgh+RrJngZ1N4YSZwp/qZ1zrf1ThMHRXywV0DaUObs+VvBBvN2HrfcDq7CZjhObdH87CjKUgcaNSgblGYKsHkSn@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnZ0sQWQIBPVVPs3ryPP3ym03TxzZYDV2xkY6t2VhnXDxq41i
	3cSSkcewuRGx3oPZddOk+jtEyF4q0hn9zbscWvjPdQ4mTtnGh7boESdU8muzGIyDnaFvkTmlTPI
	+3P6QZzmDA2V8f0SHjUksqzEkUuWTc45d4LlD2Qf/ZaI2gFgiLSJkFQzv71hUwgpvozoQ
X-Gm-Gg: AR+sD13NVpUYfhdEa8+uZVXLuQ98XPmjHhOwyFfLyU2SbfjQH2BWgKFLWsb32hUXjsf
	1471NWW2cHqt4hgyesdyKJ7D9Yy+pHqViTQiOIPUvZXubqFqyqW1wW2Vpg4d8BaIUrd6AJ3Aj8Y
	eD/xTwhM8+ech6ec4qJzhkgcYpI2S5FAeVYDxIzSGpj7X1zlExo6+yvt373XyPEDocFvnR/6Q7Z
	u72mr4/7x/MuVjjSzgfRZ27v1mB34Z99sJx8xBQFjBmgIt+lVI3Kovtvfyg1x6mNouAQQh4NXAA
	tL9cm/DxD85NHONdpHuMqZm06Pkcg4xBjo73SHAhejfIfmlbvfS0bVSPQnoxc1UskHsY6L8SPfo
	xzGaE6vRCcXV5Se5V0FrN9lvVRC+AJ/MQucp9DOuH5qA5RfqXK9c4nSXZEHP7zGba87u2OJvTwk
	xkT87S/+1/ruSEiA==
X-Received: by 2002:a05:622a:11c8:b0:51a:8eca:78e3 with SMTP id d75a77b69052e-5213c8e2f60mr213432031cf.5.1784716489078;
        Wed, 22 Jul 2026 03:34:49 -0700 (PDT)
X-Received: by 2002:a05:622a:11c8:b0:51a:8eca:78e3 with SMTP id d75a77b69052e-5213c8e2f60mr213431791cf.5.1784716488535;
        Wed, 22 Jul 2026 03:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm399078e87.61.2026.07.22.03.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:34:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:34:42 +0300
Subject: [PATCH] phy: qcom-qmp: qserdes-com: drop duplicate v8 DP headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMGcYGoC/yXMwQ6CMBCE4Vche2YTLKCWVzEeShl0jUJpgZAQ3
 p2Cl0m+w/wrBXhBoCpZyWOWIH0XcUkTsm/TvcDSRJPK1DW7KcXDz3Hj+ziT+4o1I3i+c6kLnZe
 1hUZL8es8WlnO7uP5d5jqD+x4xGjbdtft24Z5AAAA
X-Change-ID: 20260722-qmp-drop-duplicate-v8-594935bce9ef
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+JWVdgnRe/ckTZ65I6LekbXjhXASVlJvxXNCuHNml9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYJzGpc8hB1AOb5S+NlGJzUF7VPuFTHID5+rev
 DyJnAQ158GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamCcxgAKCRCLPIo+Aiko
 1Xr5CACQ4O+tuHwoQH+YKjU8bulDtR2x1LwOIO3dvfm6W0xyJ8NaAhCqB70NHdGLsUIztXTYFle
 fs0q6syPR+BFYHj3OuPcTZppfLRYVd0cUvrLJRGeRIqS0u5Ng/eBGFU0NIi4yoVeVmHFVrjSb1n
 u3ry5sC+UALMdl4p8EFjKNuVLMSwXdUBAw8vFe15uIs3fTl3aTm13t9UXBvwyAZfwrxLRqv46Gp
 lpaGH72F/MRUYOj7+5fuhayHJCj8u0tz4x33wnR+4sCSVlKPQvKwC8UpEahXqB6couEMT1PN3p3
 muMHPsSSPtMHFydKUY16jklBnsjclYPdmXPQP/Gs1pEyNfL8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMSBTYWx0ZWRfX7gZ9jzvIG2HS
 inLBad3M7GyixGwKFPfWMKtp+NziDNOUDC/n+GDMXYJJzFB1aaMzJ5HGqqJJ9CWKH1TMYesKOwS
 s4O/AtfA59F3mlB1g5Nh49zpQI39Z3b/WJmmX/qsiNup0XH8RJkCAFgy/524AQhLGszQUVIYklq
 8qpS/LZZMaNpA+cvoNeHe0z5MMJXMCkbqkqqYFU8c0kFVYgu/I8qQ9w7XlOv8xPML6IzOt4RqBG
 XZcxl2XjSKC2d6l70NKN5AZUK+9GvRhkKsFKKx4f+OKvVZiNOiEDP8ZOZYqDLkiM9rYdFRqngAs
 fnFF+pGSYLZ2kOwIffVlH8nMAbpQPTONld94oDsf/4Ao2JaVWrL4nDRy0j4U7KOgTibHbCL/04V
 FodH0lAp4xfmmDo2CelN6HqgzSmmV4+5Mn51ZhG/7Z7y0l+OPkoB4CPXUAZ26cnGy7/W0q8wTyf
 VHBpP/C1W1MaK1EhSNQ==
X-Proofpoint-GUID: bu_BSIHMOV2wT8a6_AVzEfAGbmVMiWog
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMSBTYWx0ZWRfXyw5ziHRSdhGL
 LWYhNUqntS/WI05+qjz2o0gi1zFBBU2blPyRtje1AY9f7weuWoFPtYjP2Dbm7ZmOJUzP351ccUV
 jGaTqEJeVOxOzVv/WonbsRmpy2w6fY0=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a609cc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=swegQpMVOkZOyYi_guoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bu_BSIHMOV2wT8a6_AVzEfAGbmVMiWog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220101

Commit 212cdedcac11 ("phy: qcom-qmp: qserdes-com: Add v8
DP-specific qserdes register offsets") and commit d10736db98d2 ("phy:
qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
added identical header files for DisplayPort-specific registers on V8
PHYs, having different names. Get rid of one of the copies, reverting
commit d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  | 52 ----------------------
 1 file changed, 52 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
deleted file mode 100644
index 2bef1eecdc56..000000000000
--- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2025 Linaro Ltd.
- */
-
-#ifndef QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
-#define QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
-
-/* Only for DP QMP V8 PHY - QSERDES COM registers */
-#define DP_QSERDES_V8_COM_HSCLK_SEL_1			0x03c
-#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
-#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
-#define DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0		0x060
-#define DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0		0x064
-#define DP_QSERDES_V8_COM_CP_CTRL_MODE0			0x070
-#define DP_QSERDES_V8_COM_PLL_RCTRL_MODE0		0x074
-#define DP_QSERDES_V8_COM_PLL_CCTRL_MODE0		0x078
-#define DP_QSERDES_V8_COM_CORECLK_DIV_MODE0		0x07c
-#define DP_QSERDES_V8_COM_LOCK_CMP1_MODE0		0x080
-#define DP_QSERDES_V8_COM_LOCK_CMP2_MODE0		0x084
-#define DP_QSERDES_V8_COM_DEC_START_MODE0		0x088
-#define DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
-#define DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
-#define DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
-#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
-#define DP_QSERDES_V8_COM_VCO_TUNE1_MODE0		0x0a8
-#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
-#define DP_QSERDES_V8_COM_VCO_TUNE2_MODE0		0x0ac
-#define DP_QSERDES_V8_COM_BG_TIMER			0x0bc
-#define DP_QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
-#define DP_QSERDES_V8_COM_SSC_ADJ_PER1			0x0c4
-#define DP_QSERDES_V8_COM_SSC_PER1			0x0cc
-#define DP_QSERDES_V8_COM_SSC_PER2			0x0d0
-#define DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
-#define DP_QSERDES_V8_COM_CLK_ENABLE1			0x0e0
-#define DP_QSERDES_V8_COM_SYS_CLK_CTRL			0x0e4
-#define DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
-#define DP_QSERDES_V8_COM_PLL_IVCO			0x0f4
-#define DP_QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
-#define DP_QSERDES_V8_COM_RESETSM_CNTRL			0x118
-#define DP_QSERDES_V8_COM_LOCK_CMP_EN			0x120
-#define DP_QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
-#define DP_QSERDES_V8_COM_VCO_TUNE_MAP			0x140
-#define DP_QSERDES_V8_COM_CLK_SELECT			0x164
-#define DP_QSERDES_V8_COM_CORE_CLK_EN			0x170
-#define DP_QSERDES_V8_COM_CMN_CONFIG_1			0x174
-#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL		0x180
-#define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
-#define DP_QSERDES_V8_COM_CMN_STATUS			0x314
-#define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
-
-#endif

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260722-qmp-drop-duplicate-v8-594935bce9ef

Best regards,
--  
With best wishes
Dmitry

