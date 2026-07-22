Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894A3E1713
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717763; cv=none; b=EXTZxQlkjSqFWN1sL9u9smjdT6SnQP4vSNgOPAbBx/6N6hFrMIsQbB+VdUpzZgIQp0efixcpUvOCxYUmanWJDJydDdyBOPVu5R1emO4+22Pg+Vvqi7ndOL8cPD+/VyhkP2TYCvvqz8NAZCIvWuGV2LltdXmUme0f4ehprfXkvyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717763; c=relaxed/simple;
	bh=cI0BNAVY17F5X3+IRC5AMvFs13YQG/eDsc5W+48aKNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DMIJ+gkTSmrtQig+WZpmppvwUf9BkJBeG29k7rI/lA9fS3/LsaKRAUDU3bfk2DfjAeaDRmHCm3pLbJ9ixSx5LwjW5mbAk1eKnDFfkvINIBJ7oBymlHlx0EEe/3epP2XuyrcEkg9y9DTq7CY1mxF/Q9Gg9wOZJAwLjMMwa5iQiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d33Vg9RJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuQk0orG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d33Vg9RJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuQk0orG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xc9s4018682
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVrIunihnPYTgVlfAy/dv0XWhvkPqor39xXbSlp6cc0=; b=d33Vg9RJJvDhqwV6
	H+c/YC3/akaUstbrsvCYcgRm64MOHBwNXZNd9bA9VdnQ18ULJiZAQaRynBmFFxpY
	7Xw6S5/yJoKSLDP5VPR1Z2bwn3j0TerPcPvfebVHlEpNT66CdvKwYztoGWDWwtvT
	LDOvDa+WFybMDE4zlQ/NCCjurTSErlgxloFyvSemdnfFkijsiWoyer8zorujWlJw
	15nJU4Ht5M71BVd8IzUDuJtDot+BqPkmgvRHOu3APEGwdO1Gg3UoE7rBs48xc47S
	JlFkTA1fw5JaqlBL/bVhC6Ny985IstvSxHr2PVET5RxaAqBVD+LdM4XiYVvVW2MT
	+1LmXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fup3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so4940490a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717761; x=1785322561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVrIunihnPYTgVlfAy/dv0XWhvkPqor39xXbSlp6cc0=;
        b=DuQk0orGOkkexS5y5uf3eQrXrjLACo8H9oJMCh0Z13galvmcosHjhOHNNfA06TS+/M
         nNSj1bpEXlIdL5yuAIuQB5Rpb3ubU9YFLUEiZXW7fNLaIlZuI53SgG4O70A32hddptih
         rbwq0uy9XeCmyQDS+RFHhWwOlMo4UOZ4gMftstK/FsaP5ekFWMH4pC/Z6hpsTGjY74aR
         YW7GqKmqnH1Aiifdv4hk+NGzMm+yXHzHi+B1RQi8N/S24RMEwJ7OAbcLkx5aP2v0fihL
         LrCqf/n3+ufza3SAEWShOKXy0bjVezB1DAsDoLkl/d8TBONdRBVTBh6Pk+U1rSptlgKc
         y0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717761; x=1785322561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVrIunihnPYTgVlfAy/dv0XWhvkPqor39xXbSlp6cc0=;
        b=WkDLhXdis+d3IhVgF073L1a2J3LTFZ0zWtOVmxp3zVJJSBQG2gOCT2tqIX3pAx0jI1
         Yh50oCS7aoebFSxP/A5vttDUUrhnTXbBcvEh+/BDxzrlAx7aZiV0NoLtDq8tz97k5jF1
         q31QSk+gwbMzi7rFfcWm0/XaFSuFIRZFTasQkC1X7ht1SuidgDWJNmnI/jFzTX0qt7dZ
         1L3gGjHBMxklTigk+O7hiGtsuEylW7BDipCw/zKzFtrlcuPLxQ4YWOttC6vxic2TDDQw
         cznhp+TFRhd85WLbsuyP9hWe0JccoDTsuDmbF0AKADOWhQIOp2Pjw97tVyzo034CYff3
         IOuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEeR1fclWh9Fh24RDyMhpQJooEy04uEmQ8pJ9utqhx6/eQRQu6UcS0G6UeVscamM7dmDgI+LWSSYnn0o+c@vger.kernel.org
X-Gm-Message-State: AOJu0YxYITnmzYSSYf+/i7RVwZvXXNfBr5U+7/ItBtDBB+qL6fUV+HfA
	F6HdSB03yUwxZtd+UJA8NNklAxoZkRzhtQLx74nwnvrRp6gZEW0IMU1T8A29gfWB+tyK7krFopg
	v1Y2WGeUGwewtvcnqp+LfUrMAtsUClMdV2XifSVSOySpGmO+S8IyEopqJNXosjpI/+8vv
X-Gm-Gg: AR+sD10ZpNZqFEMLWpSYpku2cvfGw4ZXKHaYm9gE5oQSOIafcwppQyv8kT1YXuFWv51
	Nh8OuwjPj7PezD13PhP0DqRmSkNj+v6q9jHa2sp1+rEgmPcc/YqUvTZOy/nfo1fNI5TvTd9bZjX
	RiGP8OwyWeFg2bRYv9Ma9UzF7SIpSffaeMhb/RqJpTvvrH3gA9HpEpxw84WODM6tw6VbQxCe7wl
	7e04SoCABAYkfMMzQ4s7RnOju4216diMTkBvGENrMQ/Ws3KJqSi063h3EEdWhqy8EPqsjxdnGC8
	LJUYgz/+xDW78hkNZTeW3AQiJSQOnfnZynlW2HlQZ6HMOeyl9mak/oweAdxlGWZf/h37o2hldXo
	vPOw5LigfXsYQ9n+JIq/SRBNE1ULxbDjkWSgqnWat/uL6vu44C7a18wy3QbspoqpH
X-Received: by 2002:a17:90b:3bcb:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38e4b4312cfmr24429471a91.13.1784717760574;
        Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcb:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38e4b4312cfmr24429437a91.13.1784717760092;
        Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:55:59 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:34 -0700
Subject: [PATCH v2 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-3-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1907;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=cI0BNAVY17F5X3+IRC5AMvFs13YQG/eDsc5W+48aKNs=;
 b=i9DRSFTI5ZoMbiW4bKeXxAv9+Xhia7uFKy4BeyC+7m/pr8j/1x643JI9DOLOr0s7MV+FFNSQ6
 y57UpAasgzIAlNDAc70bI7UnAzeGobPZ5Z0qAVgkXHB317rMsyj1pmk
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: 9BFw23riQeHygUBBIuC15sC5H0oJRzE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX1eJKO44VP+RT
 5+2w6s35XdnNuu0nOZ7nZ5sLZvBik+0DLjEHxggRgJioftEVd73sIT9+tTgusjx/h2BxWH98ddH
 LZAsmBl0A993kc2P4SGl8X9cQBjFWrRaZAd62CEFELEGwUAozCJJ9KagwlmhR1Tqyp0ns/Y/bAZ
 VoTP2P/m02VN5QF/CMApFvqPapFXHKjBlDuixunNDxnUA/kui7qdrihP7pgcGqu82QEaNJLxOhT
 jy+s6h4mL4PPih1pCccgaiDt9dMikZ09DcECDUb0qWghWlpTQ9Sbc87/RkfWf65qZU8ZsmzdziG
 JWGEr6HTRDlpUU7yUkSwQIlAZiWUnHkNT3YinWtfy9fl7oqVf5C7CtxjaQvHhUeIUaKwLqjkBH+
 RHydhRDyJZoxigxleyBAeWTsXEuRNp1TE34TNYZswXDLKmBUYvuuD2UR3pgTYIO9gktlv5+9uqx
 j1Oe0GyvNS5E6kA1RRw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a60a1c1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GrrsNloRtQgQSSuI728A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 9BFw23riQeHygUBBIuC15sC5H0oJRzE-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXxcWQyERxznUH
 DkjjjTm2vIn2hHvrwdu/h4NEljiGPDrSETuOtUK5LrIprzyyVvgKj65JDvoClqZOUIFYRKRfBsw
 bfhJZVkjY/lMay+mS5Uzc0CAqyjQAUg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..0ea4d6696aee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..b4441807f460
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};

-- 
2.34.1

