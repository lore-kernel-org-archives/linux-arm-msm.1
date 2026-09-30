Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029336F905
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749924; cv=none; b=QPCwqhQmh6YyK+3tT3bVuSEIVSMDdD2UEHyuAurRDegA8GDzWqW1szdM7XwhlDO/hnUL3Yr1YMFS6FNj5fEfo3gom8zCbphwifZ1whoigOJ1zgjuKjXF5eUGbFAauMKgmEu+GVHPI8Iktp+KdrwgMOjQWYHfdeftYciIm/j1U/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749924; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ti6yDFXXv92+WUyDhY7ndILpDlOUb+UmCbUbSvB7wFSAz1lwXI0tFgsRuzNYAb21+47c4S/QH+a92ipsUFQxIITI8aKSONZ3t2C2jrWtMBFGq855pit4QNzuC8D2Ri9cocuOuGxO9JoVaoM+orVC1ZFDVGqTsp0ELW/NNPAHjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZwDn2ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab/esqRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZwDn2ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab/esqRN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3VZ5n1887267
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=PZwDn2ud/5UDT3Wi
	iMVCBXhIXjgaBmjSaezgIGsamG2c07QfQSyzVZZHTa1TsjipvNniGPkDCjvCbYAC
	4QLFsd2/vW0YISLZPYJfHmwE6PG1Q7pUKn0XxAogT93GnDtAP0we12GVm3Dj6OZc
	IMoQBlhf3UGseHi4EXSSe8S46SoCLrcf04Q0uHbUOLmrSi2wkn92Kfk5nxqr0+de
	hKktvN+QF/cY8qu+sikj4dJnJRRRkrwjA4hUtnZ1l9tMTaQSYu+FdzDqgYo+dIOB
	Cbn5dv+XJj4uWsuVRp8FpX7ymOTtLUN1bvrYBP0gMWuUcKNofpfogOcd6VA408a8
	iyu+4w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn0n27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34afa104860so2164238eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749915; x=1791354715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=Ab/esqRN93KUTdSnt7DJ6w+sv7NiUpyVEaFPIpzuyUH6OQF0+vU8Td5ay6/v8GKFK3
         Z+tnrG7omQk0nVAzz1tBI90VOv3T4L20oT/M8UCJ+dikJKY0R2r0oPKThprXhfjE9Ig5
         2OXdUXtQv2u6/II5E7i0YB2eInAtXhj8oZTB0MKMALiN+xggnCSSjSR1UOikCVbZYJXh
         ymIaXAk2Nh4s19mlbAAEJBKfvEY2VeajkeQe7rF9/Sb7kJj0oPI3uPOTRRi+o60MzxVc
         Z8qrqopcbFjDXsVSErLNCRrMtfX2ERpaYny2S9EEwvFb4OnTQzVhng+e5qu0dK7VvZMP
         uzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749915; x=1791354715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=d9Oi1f7INx4sf3l/q11TbZ8INNrS5YUWwcD3hLNGYluHjFUuUR2ADHiHla1eU+Ts7m
         owbrDLBWUYc9tGW6AsxkGuuEqLEThDFmxmPKJBIEhUSCJrl673VfJ6x2ISLL3H2T9rBZ
         xvKb2WH+OWhVFx9on2pTbWblbjyFM8A95Gm45dZj97yZDhdiDG70PsFRV8xOPuV/cWI3
         7ZDcUxOJKkJo2gUh+y16DIVViUzQYs+oFP4tznx77tWtMayKs1VCIgcGJppoV4gB1ZFR
         Z4406YVGRIrqp0EZ+vARsb5K37D32kYp0eZ/W/31OSpjANWbiKs2Ot/MT7at5+8NHX0r
         vd6g==
X-Forwarded-Encrypted: i=1; AKwUvByD2y7vkOxY5HZND18XlUxCeWW0C7rWqouzFfGxU9AMyeiSzArmlwCBl4d9T0ViiFCfORF5yo/AaAJ5SlXw@vger.kernel.org
X-Gm-Message-State: AFq9FYLL4AkXs2nfnATIfci6aVPsqadPYa6HniS9RliiXMnNkdgjMXvJ
	G6YvY3xW0mwgV4Yoci4R4rhXGit50MC0pxIFxlPn31JCorBjh2t8Z94wMLqIy8EwSxXnYh79RMG
	KlO+4Q97kfLGwvXA/2YS5QiNOkKap7xQV+VowuC/AgM1lgHNI0tO/bq7Im478ZekViUeZ
X-Gm-Gg: AYBFou0ohYWD37yLNScORXFumjidZqgY89fwtIDQwEnqTIgGLFNijiYoC9fzJqPw3wH
	0gULaXYhWbZXPJc/K/OrMAyLlqDDfWZPJwwYZvH6fmSOA5nO+7CSsUMe7gTC3ZsFZLup6/x5Yl+
	DtSz6NJ9M2QQ2oV9TCvFgP0md1J9CBiO+TsGceMufHziDu3hH31LRkM5d0JHUxBMddKUZqZtqDp
	UlY5jaesAYjg43gIIR5OUoDz3LY6/Z7QvXr6nVTHTL+qHz/ur+7A3gAan4b639Sm9geX1RSxeIa
	O+deJzXJSu4benW3wH3W/HggPwbT0mhMVCYwn5awpjP1yTIliki68aR6gLZP9jrtC1uHyhYtm9s
	wIvfzLbGz6tg0XYW87Mvdy8gKbde7kHxfK9fw7XIY0NErQSvLBvI=
X-Received: by 2002:a05:7301:4714:b0:341:85c0:91ca with SMTP id 5a478bee46e88-34cdc3c942emr754298eec.22.1790749915227;
        Tue, 29 Sep 2026 23:31:55 -0700 (PDT)
X-Received: by 2002:a05:7301:4714:b0:341:85c0:91ca with SMTP id 5a478bee46e88-34cdc3c942emr754266eec.22.1790749914616;
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:24 -0700
Subject: [PATCH v2 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs for Maili platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-2-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=RiFdQ/bNy/bMhhNHLnMHYAu9LUbjdtaOLbdnqBXqorS6UldSg9RuugFG35G1mqlPC82DBZYTc
 mXhRAhSYdC8BXLirWXB+bIu0mUorBMeuwgpxNSlkMDcOuZ8t/D1Np1c
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcacdc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: nah1e9uX35F2TlwM6520e7l2Hj2zrZ8N
X-Proofpoint-GUID: nah1e9uX35F2TlwM6520e7l2Hj2zrZ8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX+g4E2seHh328
 re8fEbCa+iEpyyYALjNASHtLdlRSze6xQKm4CV3zfjxcHxJQmuEAzaC2reO9vcOgcX2kSsn0pIm
 KC5gp88gYg5UhrEIi1WW88DELkhUdN4JTmKXWhMEnLuoHWDe3GDRWnTUzWPw9lD27VU515hr0gM
 XrhkAv22NIZ5P8lKPPVHea5tm48BaZXM5nQctYOBA/LDp3bPQ8Zu6LM3JqqRKcocgUZQJIRCwre
 NaeK3yzxLfObBa9fXBev8JeCjIRcMP1IOfjuF/VPj6kqMENyF5xL79ZYvSYDrCMTNrAWFc8602e
 +a6ER4NfKuZC9rc6G4CcNw3zvNezEgG6z5Xm6TNXqMi6T6QKMw/PkOOTkne7AE//otTjq04q4PR
 sr8ULnlCaF90WWjL0q6ezOnKsnpaStWJ+2+DNdC04uBmI9gBiuGPUDVKg0HOKptADCQdUZ8rzpS
 35beB9u8OhdH9YIg8tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX1gbRYIbCokaL
 qTi4vLovwhf9vBTpX5CLwz6aDrZeRQmooSayIZmfzED0NG/kmiwzsmhsS1UFK5Yn0MWNPnDOYPI
 yZ5rP0WyrX7jk/sIafugUMpHQWHmagc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

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

