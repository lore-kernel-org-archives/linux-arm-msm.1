Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390A43802B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119212; cv=none; b=uEvZw7jUjhYBL4WRCPc8LL5FwShIIxdj1/8N2koRhgFDaoqXzi9mFxuHiYVUF7JCPotbK8BfHlsgM1gpgc4Zny3L+gl19DQhwHZIX7e04smbY1ZwuspBlbpKuF9QTaVfPZM6xkdmLT4Axs8nWT6agtK4w/vMieLTjT/KGlRTAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119212; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCiYIoe6ltZX9/eT8f39w5aUOMZCWw8hOVl579ehcGNP12MVAARkfFOEcCrbidVufjWcgBdbedLSnFIP5i4Z5Nl8U7kuKzDSaR3jVLaFQTV28ZrJxSavb9KeaPdcM8VI+QkBmnAq/y3pXMRh9p6H01LLWcD3zA3cNvupx5FZdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QwThuBpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB//dDT9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QwThuBpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB//dDT9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72xv2033271
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=QwThuBpaOj94wxfP
	aGZvMYv/hCPyvB5M1d6W3rBWSjnm6tClUxS6U/Aj1TxZru85Vw19y6eJGuM70y8c
	ysu+Du5MD2KjfllDMmPZ87ZbNPdU2yD3lxq2saQ92WiSjbmGw/vZBYHScOgxo/Ld
	h33sfb6P/dqUP502/+zpZx4iuzrx2VkuvvV4fimeqqNFdO6c39t7FKMUfYKbdMwa
	+yYvZYKuoJZd34N4YxeYCcg0Yj2wlmUn1DsHv0PntE7yjFp58FDn3PKwYzzadqlD
	KWXpQ+LAiBLNCuymUkk5Y8nLqqfwO+RSJHhD6XCKLGSpLDsDyZXy5yejiAs+Nx1a
	NjCHEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c1g0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso332940eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119210; x=1790724010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=FB//dDT9gLh6szvYaFpRvJG8R3sCBG4ldRvasOeqbiTidiRjXlNQN2QwMkI5oam6MG
         XAXzmfCeA6sKMv3ms3skyCwl3WlcN+P4PbesFPfiWJEqmz7ukb3emHoi8txC6EKxnVt/
         O+qf2NCUbuTFcjait53jImst5fs3clmXPdHGXb5Fbnd5wDFudJtSs0BLTwXC1HulMXcy
         3p8bCZAtvsa4jAgBJLduS/rgMZ9CfFcgn9M4lNtfLD+A4ujOs1vBdGnsGF5oVkuu+L/L
         tijBYxP2AUPkfwm7IovMvI/UN6NR+tdOb0I3uqkkTs9jKggQy48kcElFA8TlBjsMeums
         COoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119210; x=1790724010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=1P3RaGx77MFgvuC62t9wGxBjgkvLFuceuRQF/rr1Yzof6gP0vaAbEw5BV+mmmZErNs
         iF/8VwtKHQBjmqbSg3T5st2F2aCo1Ar6vN3feFNEcB2xgFQbUAKSDvrf+dZI+fgVzFbJ
         MCApzMTfpkNfQsb04Ck9LiLz+9M2TJGcGrbnr690/rXzTIAtqjk4vI0KEfwT96I7HTm1
         L63p6TQSAKBpYSz7G2VNpDgIzZ5Ua+KctisLu17ZQn0RerLarSYJYjhzUqMU3kujpyh3
         Qr6+umzi84sCW7+S+iIOFp0KR168muJcuDGfhCdjMLQAmHQG1KTpM8cXE5XaTw+jjJH4
         sv5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTzvapbdDbcxZE+V/QtI6WvnCPC1/oOB202bgZHupCfMpuO4nCaPmaOGF4+BdKADcqWOao7PR11kOR7ZmV@vger.kernel.org
X-Gm-Message-State: AFuF++m/Uoo97mmAA1HyyYRfST2kb/Jo55GhjnXzcJWkq1wKrTnty9Ml
	1YLqvazj8nJ0sZ/cTNf9wkQJulHaOFGy5WEr/AxnGAhmInbcQ3J1yG7ma7GQ7JZADS/Kz9qh0bA
	EIJQhweh5xpZHo62DrB0uxI3d7+KYJ2iiTtos25aTUsMBoRYNOGibJ0ruFaFUjaSf0ziS
X-Gm-Gg: AYBFou27LcpTr9xGcc/+QP4I4A/WtqrKpIjhDuFKJ6tqHuhRh9mBeYQ5K5DuKjONWBI
	WN0jChClfoj9ftjZ6PwjdA25ARCwzlqZjtaQLF7ROPCw7vv3IpEnVxNxQDfRSgKcDF5IJpZdb8C
	x2ZczD1jIlrPBYoKdkvPtugpSjXb2XYjP2CwsnDIYxASz7zpSoUhUsl7G/x+dW7u/QlxuBWTAFU
	GCoYtCHpuyB+MThNuhKp8G7Mh61erFM22o/dNVusV0q7a57DhlMQTyk9TGGGQF3y7sa4z185AZW
	3fOfrHKd3k3Hr5i9ZpUXKBDZhKqLr8JTC5GNR8YKilrBCO0qd/9mmSGrKUIC3vwz89jwkpUsHIC
	d899xaf4+KjsPXcc/uuoDN4elsympRw5NX8Yeb2MOXBzsLDVvhQ==
X-Received: by 2002:a05:7300:8c:b0:33c:12b0:88ef with SMTP id 5a478bee46e88-33e5ca9fd9cmr913542eec.17.1790119209985;
        Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
X-Received: by 2002:a05:7300:8c:b0:33c:12b0:88ef with SMTP id 5a478bee46e88-33e5ca9fd9cmr913509eec.17.1790119209363;
        Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:19:59 -0700
Subject: [PATCH 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-2-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=9hCgJgTcb3Aqpk4xPVAfRrJsZvuOTzllMy+LI/xgdJOsgbfTus4pBx9JIVwRM93WCUJh167Og
 pEpEN1CcVncC2/wMBF6ggXLXop7z1e6K1kLOSqbObktIuYrDg9QmiRr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX18v2c25MamD0
 oUJFlxiAL7vXuhndqnkM6vtsOPUeWc/NYeHiiucT6T6q252dLyaSH9v7EauacJZbpnti8KohtvO
 CEiptxRlF9rTamyHJ73Sm9++rw/JeMkkKJ0qEYRch7dE5+LWZJejvLHsEN3f3LhSmgAgm1M9GTp
 YG/uYUlYsQ3i2CwpHXZkGBYjmieZz9pwtoK8P/j8D3+oC1g7nW5LZZHIr1FVelgPpMaCBlfHX05
 xa2KzFef4IJ+sD9uL6pqGiEGwPTvCzDJzzOk67LFuCU64fa5EoVedve9pzFtCIjpnpevyEhGQ3e
 +HvkA44ynt8TI9ZRBLGuqG1hUkDKJ1GTCFwqRQ5zCSDdxH4QmDbTUg78WQTA7/ww25dungFgWHq
 l5Li8Ln80X9ZANr6/fg/LQIF2pKr6eOQtmL9DNvOWIiLto8jLzwvTYIcXp32t5SpByHLsq+Dd4J
 tXelUeMnqISlgSeYHpw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab30d2a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Jw4OAgE0LSIJK4H3rqjlhz4cbOnhLEMD
X-Proofpoint-GUID: Jw4OAgE0LSIJK4H3rqjlhz4cbOnhLEMD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX8o6zNTSRM/n3
 nTtvkEz+u7WZoVfryE+VFtBc7mZ9vUSenQaEBA87VBYpRGHiNE/JI+hekDg9pUdZbFmuRbiY6OD
 hrgIZsGUctAi00UgTUOO+ikiPyj9b18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Physical client IDs are used on Maili Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-ipcc.h | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-ipcc.h b/arch/arm64/boot/dts/qcom/maili-ipcc.h
new file mode 100644
index 000000000000..7cf66d20e9c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-ipcc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_MAILI_MAILBOX_IPCC_H
+#define __DTS_MAILI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_WPSS			17
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+
+#endif

-- 
2.34.1

