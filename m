Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9358346AD0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886908; cv=none; b=aX0gck2Ma4SWSQGT2Qnfy5bWTcBlSzwSLUS1jGGvlXWvtKENuvNU0t7zCVjSUj7EgIpp2MauS4U/5x2ckp/DeISimbU3vHQ7JjCs5NAKCh+B4GImzLOneJL5BBeOKuFvQY5WbLm2wRaBcexSxkV4QvRQuDu4XWxkxs52rPQilpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886908; c=relaxed/simple;
	bh=A2YLyH7JcJgoRXIQ3ZAsTHakvd0VJnhjFDGiS2WuYJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6NH6727aEFjY6ebXKcJwyYrJEB49Xex7644E6u/pT3/+vZqScXP+gDtNTlNq3aklSGhuec202sfmh3Y+21OwZn5+8Ca1eb+lB4n0RtIN+HaOcSWLtl7mOQW084drOPdpK6o6RHtAoO61UrbDfSCSOfK5viUkQfXRM+ygjhE50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSs48/XO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTbCII32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSs48/XO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTbCII32"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MAbe2754859
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RK2KUPhk9iEKyipUm2ztkbbRY+972Yp7NvKxoamx8iY=; b=KSs48/XOup/fnNjR
	FHwa6CpQf0PA3kxm8me/1qA+dVitU+2bI9OwI1QG9ZA9HHQXwl5tcyCJy7p9lsMw
	ZGPb2SlLLFI2kniDhSgQT2kIV9fCSKA3Y4lDhR1QSkvUWGja2VLyQ0cTwgj9vNRx
	5mdkvoE4H4TNFsVoUktVFbruFGV1XbdSKXNFH3iQSNdJTl7kcLyYVNN4VE/FWGZu
	ZZdIazQApgRvdv1MVm1oMjMIIw3THfHHghq00fFb3Cx6XfMaj8M9WqNMAEwy2kxV
	avAjyBVgGTqO6HaTD+B241ynY73hfRPABnv9s0y8s0TAvi/mIbIB/aKsQC9lDoq1
	sTuA8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr3y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:55:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so339013a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886901; x=1785491701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RK2KUPhk9iEKyipUm2ztkbbRY+972Yp7NvKxoamx8iY=;
        b=bTbCII32SBijEQ30EALLO3WTeIU+inkRWTwjZ+3zWHxYMk59PZt2oa1TBUoFpFo7Hy
         f2sDCbnmeGiUr+w/f/gkZId/Cc0/Dh8OmWoper/6G6jPRLGgT9IJQFDXku+EvJtcIeYp
         C14K080yqCsCg9UjbrngGYxOD1MdK1k5dgKDC8VY9v/ebNakVb1Lhs3dO/61h6bthqE8
         J4PFntkjWHS/9t1pV0nwKdrhmicOcab94xzoBKWCmW36RY0QI+ked2p91R+HbRNUGqN0
         nkmpVxR+9Vg0p1t3E5UVLfFWTZQF5syDPMte26YsFJLfSnB1C1kFJ1i2tFqDO5vCwP/E
         5eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886901; x=1785491701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK2KUPhk9iEKyipUm2ztkbbRY+972Yp7NvKxoamx8iY=;
        b=PN6H89utK1Ssyqa43XRraHowN6jBr06W4W2oJLTseiyKMMTXBZ8yyZsoHNBHYGHIYv
         BzZ5fgUA9LXbCc6il+Dwsy0noASxmHLf9gm2dkb19pJQsMA293Zh2N2WOyGG8F9Jwdls
         l9rtJcxicVpMMJEtO45bg6DRmrz5znSQ/ReJ7r8yBGrhDj7MbhyaBdj2o4zXlC1mvzcO
         to6YvbZk+YGBOp3EOonWFp0jPXGhyQ0bEOA43z8K0Dx8eNrc8tSsLFRhh0vOE+2pgm81
         +5mdvHy3nifA7BZceHjKC1IkMGawHcQm3NM1rfPZD75NKRVlWb+FCNxBivkiujw6oGAk
         fbiQ==
X-Gm-Message-State: AOJu0Yw8UsABiPEs3kMP7DDbMJijQdZHosjR6UmZjIrN+qm5ar/8ebUM
	pgtw0teIqoz3v3S+qgKLoo42a8Ckv7x48I1nc9ZpouaUblOgo3JStoVnR/4jVn70zYs0RHrVnzp
	GxkyeKo/QqvK1MenOpCaxFTS/rMGafp3eIuNZeGw45R4D9JgMeGqGnLpvi89eJ3tzogFq
X-Gm-Gg: AR+sD11tMtMtf0pzgnOkEpsCk1kJOSOkTSz9DI6vFkjv8T+gxeDRceD3+lcL1TSeNFa
	p3/TchulR9GHYUgvWtQJfIBAp4dzQZ9TnKVAXn+1FSY8G8Ll1FP13Gh3WKQbH2qH0mAlLJ+61ri
	lKp+k4FJ1nXhJMak4KBbMt5I4d9tvjifu4i9aUDVcFb9/F8AN08GkcWR4mulycUNQrXftum6qgv
	c8330GwRURFY31TE1ThSk6xI/+drZYcWMWQsbIKjrtPWah09gK5i9OHIllmOEHfgR5NkHJYRKTE
	zdSezTPHCu/yNtXk4VqORGc3dLUDQgNYCypTpZh7tzcaMv+iwHOtPDAzj91Cn9meY7MSaONrApD
	coaZTIukLulRzMYhqETo+eRwSdfPw5ZHUarLsMdhlZeA0uBRLogcmePjp/p/2Z/DoyKehLxaZDH
	JQf+7m8fyHnXaDHs0ocJqmjaLoCQstiw==
X-Received: by 2002:a05:6a21:a89:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c44b04cc2dmr8005822637.31.1784886901247;
        Fri, 24 Jul 2026 02:55:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:a89:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c44b04cc2dmr8005793637.31.1784886900824;
        Fri, 24 Jul 2026 02:55:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm28975093eec.28.2026.07.24.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:55:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:24:46 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 variant
 specific DT file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-08-dts-v4-3-65e61a1061f0@oss.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
In-Reply-To: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: GWG1xuTEAP9HMdwO1o3IR62I7DTUQ0sA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX3W+x2T/QYXin
 YAHalHaXgpuAoagbkWYlSEcS4lQXiymW4GzGOhx6sfXE4AOjMzIYEKq2r+KsErH5x/8w0f9Lsbl
 a4+wz1T7MTr2gLBcxJDmakY7xZWHcqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX64JdfgC+Ut18
 DXF/8AW+vq6R8L479BnuEkBihxvzCk2MD061K+F0NF210WWCk+We1jSBj1nli2bHv8sAK9TGm9X
 efNMChwtkRyUelYDL8XXD+lj/q6S2oNjobLul7n6LdhH55c9nNB/TMkOfRaF3EZws1c42PK4RII
 qdCEhOaTTJOQNLUXIvLNCKAFy8bY9iMp4x+iOUdq0/qEckmZW0Cvjo+xxxUiCLQ0i8gH5IvBXUI
 rtbhqL7PCIevuXwF/E9HtetQntyyBRX+lds6KRbaaL1waOuiILNXjWKSaZ4iUDt14N/zWV3L1oK
 FHdqeTW+1PYKxRE7PWg/a4jR+R1d1/PotDDejSOf3dpTfWAYAG/Q3FlnFwnAEqYg3umfoYbxCQK
 EKL/yWLn6pCvHkoqcI30wZqRJmXVzVbbeJOvIso5EpmXSX6nhIfutgxw/1QqOZJ65zbzZINY9SO
 +d5zaoOYJvq5gR6oKRw==
X-Proofpoint-GUID: GWG1xuTEAP9HMdwO1o3IR62I7DTUQ0sA
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633676 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OPStAwdTocQlwmF8_qcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240090

Add two DT files, one for the default eMMC variant and one for the NAND
variant.

Add ipq5210-rdp504.dtb and ipq5210-rdp504-nand.dtb to Makefile

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts      | 17 +++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88c898d8ac3b..6d1773761496 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -25,6 +25,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
new file mode 100644
index 000000000000..e5f2f9217f3b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&sdhc {
+	status = "okay";
+};

-- 
2.34.1

