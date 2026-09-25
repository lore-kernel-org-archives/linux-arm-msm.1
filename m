Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D948C488237
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331208; cv=none; b=LqCjOmyEK/MUazvIRPJDZn7cm0kqRM3eXNV3LEtU8MqL6IkCbEoKASOsgFXiHBvrPvMVBTyOp4CtMku+Uc6jRIT7+rO62L8bD1FN6EnbhQRXIPvPERXx7MA7KcYqsR9pfLJEi3uETo7G9ssY9w1ODpZ7FMk3v9Wns+laQklkLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331208; c=relaxed/simple;
	bh=BGmwBTNE+NWpVWG51Ixiacse3NJ3vHPzMJL3/ficNA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bozIBKfPgweIc280LCnjwaR+1TrbxvqyHSudmM4PwkYtBX99F+1UCbADVfNzzge7B+hW8xHCO+94izIGGcmFZrknCDxvkb448AvP/BaSbNjoHxLxzUCqa46c0344piH66i69+joTYVZM3k+545hxvwO0Wpvm/4Li0YdY2x3VOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhPZw327; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCPsf23G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhPZw327";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCPsf23G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4DHT609132
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4V
	cyg58u9o=; b=QhPZw327XrL1zG72bL1cVgTHwJ9qZBhTwMRqPGGpgkhAlGlaqot
	3HVExAjAP/42QCwpQfBWqPxZDbYO1X8QNPBBmVPXIdIP11xHhYp5AZyjlDXadLs+
	7VRy6ZofPL2XBQuwHK9qNJLvPhysc/0k7mshC9olftAS/x5aRP4I69v1jydg1D1c
	pSXhIv2OEB/3/CIcmbKwPq4okVQTpPeV94b8neMyAfYKtpMJJo1r4rTQZAKJHSzU
	xB0U8UF53JTvWHc9R5jOBZSUPDCCT8WoD6t4d4gtDCkb8EPLLYBQgFDaluy/XANG
	b4IOb/Ss41U9RmfaR09MRt9eUzWNTiK+zag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnr0wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so2485996eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331205; x=1790936005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4Vcyg58u9o=;
        b=dCPsf23GT5yt4LQkPJ5p1i69mkScc2ZdJqQ+crE7rjEVZ7A34CWM6PVyHebNbMY2OE
         khEWRkG5X3/ZUZTosF8OtkWVq6sry3SdOvZeHaJ1R3nup7gASolgLY+Tk/XHLnIFYCh4
         6P9MasfOuiNbpz0NEGqQj2oBpSgI9BpywOY03M4xojhlOHgE1qegGOiuMNxhY+4G60kw
         GkTPzban7EHfXm8Xj9BjOKv2JIwMjXUdRYfckVw5RT00LhuKrTi5WJH353Zi8dVP3NU5
         YF8lFhnHPIrg24CLrAXfNgycR6gZDqyrCO0GeLi1cvzOPDR9MmO0OEZSg5b80WZC4rDA
         SnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331205; x=1790936005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4Vcyg58u9o=;
        b=XA/OU93qy5Xx9rRx8XB8F5nlxye9tjPSwwgzQ8iU2wAF+4B89cDlwkQYv/Pk1eWry4
         F/ooqbTUUFNZCCHi/PgeDp7pR9Ht3GxDriiecq8zZTQDOVmZldx8hMAP01Lu2fxCvYRE
         3X8YcP/7GSCFfVXMMLfbUNPXhJGXMhBLrJtxASZXH9HZ3Xb/RXEpMYaFWUlktc6NWrAK
         D+kD9NFYfocy76HILUSMw5kg2jhqnXR2A5V4dvjRLEsFZ5E8yTlVjRlqJdkw+R7q8TQt
         qemIzlD3vqAV+XTHV0nq18DK2yj9IexQ7w7oUpmGLTzrSuQI4rgyI3PTEcat0Tl9VAlb
         L29g==
X-Forwarded-Encrypted: i=1; AKwUvBzcsKMIeODESCA8hy2W/uKqCT6pxHDDmdz5wsh4y8joEep2YpHSD8zF4uZtXvJqULlHPUaamj3LPbTIlxqI@vger.kernel.org
X-Gm-Message-State: AFuF++nxaZ7iX11NeBGYqIi07GgL+cNXUAi/hre0nnsio9CLGCtqcJeN
	VINeYKMLOA127mHEzOK4oCJYS0Fc189746YCPkZMtsXjfAcrpQEyWjY+TEfxNBC997w6gfaakr6
	46QNuqIy3lozkChnnSCohGiDZoiViDOKwgmX3gwVax1pHE0GT6pdtsthn/v4yiR3J4/ph
X-Gm-Gg: AYBFou0fwEIpAyBsB2tzh2rNbPJ11e6V2HwU7bkYizqHV2mKt8OICbFMQAy65C1lCvo
	BjmvCmPZjqNwFf8v3JOlXP3VlDEl7K4tjJrjH2mrZ/lQuRkW07Ds0aLb+pBzhDjsGPMi5/kEiKi
	APnKXBMEK4qCwnKB1VoKPmMc6ksGnLjmhNyYXyd2uycPQdXKOrZ7bT2ckafswFvjIFho1uZ/knf
	So55dmubFztMlwxKP7+efWzogNcUcSYsf5do+dgGqXsj/91020TFYFqqeMkzTXiEfU8qthKaDXu
	iP2jzPcpktsycJ8QjoLobBs0vTk6dIeAeYvIUOxtlNu6blBeqTLeF1q7z2sUXYswELgsFKeiCkV
	74g4HXT0u5WE/m0IQAhHkxg3VkQ==
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265253eec.6.1790331204388;
        Fri, 25 Sep 2026 03:13:24 -0700 (PDT)
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265036eec.6.1790331198736;
        Fri, 25 Sep 2026 03:13:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/4] arm64: dts: qcom: hawi: Sort IPCC client IDs
Date: Fri, 25 Sep 2026 15:43:05 +0530
Message-ID: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vjgEKz6ZvbvAoYHFbRDWGFEcB7o83vG3
X-Proofpoint-GUID: vjgEKz6ZvbvAoYHFbRDWGFEcB7o83vG3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXz07JfREB1HPX
 1Vv5wq8/I7lDpMCj29OPIHtaJfQxwidSMhpLMo4Gn2k+kjLA1VJA2Zr/QOUJkwfQdPNidc04eRp
 W++CvPdBT/voSHo+tdxah9lK/fQ2LwU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX6u1Ala46ZHNM
 0xprkLmlwCjfS2CZ0QsH71VcUz7RNAJXJQE+dwQVm9ahrB7f9Mfke/iHDpWYMijErbXYVDpb2kX
 jjwfoXO3t3oHxXO9MNSu0ZT09wD9AyMxFyZqumx9zFtI1YdHzNGeuqIIdS+prHqfIXZCBLYXyyn
 cs5DF/2QcArJMsl2fcSz6NNtni0F3ZohzBmENAhjSSqhHpsMR83yifZ2tjOeXTxTIK75hKEJG8O
 zKyFNZducJhE11od/4hbsFa0WfperRoQJiO7YiNs5mIWaLQaEzVNXlQF8SoW/GE1qoIodKP1+WU
 xN07lO1cuNlxKgChpFbhn7XZA7S/cjjL/cyHq1nzYiVIkkF+RKFIF8tcn5dTNazJZWXfu6ox8U3
 LNdXY4Hxb0ncVT8Fr/s9qSGEMP6bFe8umWwk5D8qdFZxddnV/UZZmzrnQyzmqUyxQ377pYuOPBt
 nTu/9Hut+gloHZvLgKg==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab64945 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dLohXW9gwQ2bYbRNfKsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250039

The IPCC client ID macros within each group in hawi-ipcc.h are not
ordered by their numeric values, making it harder to cross-check
against hardware documentation and spot missing IDs at a glance.

Sort the defines in the IPCC_MPROC, IPCC_COMPUTE_L0, IPCC_COMPUTE_L1,
and IPCC_FENCE groups by ascending value.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-ipcc.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-ipcc.h b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
index 67f228e1aa0e..7659357691c1 100644
--- a/arch/arm64/boot/dts/qcom/hawi-ipcc.h
+++ b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
@@ -14,11 +14,11 @@
 #define IPCC_MPROC_SDC			4
 #define IPCC_MPROC_CDSP			5
 #define IPCC_MPROC_APSS			6
-#define IPCC_MPROC_SPSS			15
-#define IPCC_MPROC_TME			16
 #define IPCC_MPROC_SOCCP		12
 #define IPCC_MPROC_DCP			13
 #define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
 
 #define IPCC_COMPUTE_L0_LPASS		1
 #define IPCC_COMPUTE_L0_CDSP		2
@@ -26,10 +26,10 @@
 #define IPCC_COMPUTE_L0_GPU		4
 #define IPCC_COMPUTE_L0_CVP		8
 #define IPCC_COMPUTE_L0_CAM		9
-#define IPCC_COMPUTE_L0_VPU		12
-#define IPCC_COMPUTE_L0_SOCCP		16
 #define IPCC_COMPUTE_L0_CAM1		10
 #define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
 
 #define IPCC_COMPUTE_L1_LPASS		1
 #define IPCC_COMPUTE_L1_CDSP		2
@@ -37,10 +37,10 @@
 #define IPCC_COMPUTE_L1_GPU		4
 #define IPCC_COMPUTE_L1_CVP		8
 #define IPCC_COMPUTE_L1_CAM		9
-#define IPCC_COMPUTE_L1_VPU		12
-#define IPCC_COMPUTE_L1_SOCCP		16
 #define IPCC_COMPUTE_L1_CAM1		10
 #define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
 
 #define IPCC_PERIPH_CDSP		2
 #define IPCC_PERIPH_APSS		3
@@ -53,9 +53,9 @@
 #define IPCC_FENCE_GPU			4
 #define IPCC_FENCE_CVP			8
 #define IPCC_FENCE_CAM			9
-#define IPCC_FENCE_VPU			20
-#define IPCC_FENCE_SOCCP		24
 #define IPCC_FENCE_CAM1			10
 #define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
 
 #endif
-- 
2.55.0

