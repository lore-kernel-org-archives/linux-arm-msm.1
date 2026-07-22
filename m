Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC9348898
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699954; cv=none; b=fd8gd3W35Y5+yMPfYXEgFJmFh6rIlDBdKRUYxYaz5RWsNWpKQXSB+V7CLS6gkcLEIhrtY5ozpp4kuBsRvpGE/iGVQywtIBV26Dbinq/YQpNblOsjz2Aby2P2XdUDC7utBX+TusUvr+y7EVJzSBOkz516gB3liyHsdpYTz35WCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699954; c=relaxed/simple;
	bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjLsknYoTbljbcnQflKBRLj6Pw/jhYgSkckFdbE4ibPrhcqKm3A5PULZeFF8zhdliKTO/p1a4K8h/QaYW9+hu1op77zWbNSclWfbnYjdG4kVFL1YNucZGm+4ij6pDziEydrVQM0qfQalkCtfai27kF16FIi3nqyjKZQRD+CpsaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1CKdxis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvXUsor1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1CKdxis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvXUsor1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lPA4027336
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=; b=G1CKdxisiKL+hrHc
	m4RINRpr+e0rAo1RmMtx8we+wbFBtdbBMKUt7+g5IJXez12sdDnzt8AAlzyw4O9A
	chgcyuCGU+E6sOcT2MHATTsnfbByOIo4bdae705wQ4d/eeK4sFGmYHdPBbg7vbzQ
	DqAPvvu1Zznh0Zv8LllQHAlC5YfS0Gouf21NxHhSGdMs5+Ta27C1iJazu0ZKrigl
	sMQmClayxx/5bqL5lgdb9j3qKXdTyy0wRRgHY0ZYKZ50MzMu6QYIPlbar4nPIgqp
	l9uwlQhneIu9iIvR4U+FplNgb+CVck/eqEkIDympyI+uN+6mFFp9iIOH2oTcfkTi
	G+8MBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbr2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:59:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so14946444a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699951; x=1785304751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=BvXUsor1MtqyCdCJ9CPVSnwj6l2CYQXNzqX7lThqCnyJmAx+qP5GOsnrz7uIzO5/09
         ldGdI+Q6lfTPXjCTgj6e0oe/n/rkxHlaDxcGlanXgYlF6qCivCrhE84bM8/GmQY8gqlE
         R6qUHiIfv5+3G6KiTSaPzh+CU/pjxvfn2+MIzqbtiNK2/PYsqFByuCiNshujkEmzlnO6
         HvLez2H1c3cebuyrR5y0frxpGtg9qD6NUQUIIThtrqavnBqqd3Y/7DdLtxWPnCkQ9swv
         dA1Xtm9RDuYJgfdU6gOiWParBzS4OmUUtrbMy2CL0exV9KMxvC/CICOvOP4Rn3mUqpUN
         h8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699951; x=1785304751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=WM6fC3YkLzVA+0pGZfUHApOjmMv0x1WguTJQDyOmB0uGRZxeQ8YKU23r6+sKUKVvYX
         7W7jwYX4xCcvZxMsLe9fClODz4sGFGz6AqTHCSpG0o5V7l6hmavKpkyEE+zH6e0a8s98
         QfhMfQWQWRXQScNlqTbtM32ubPR6vrIDxmG0NGkigntVTsVSU5nQtEvaz96IJeyjlX2a
         jxTadOmKY8ruzy2G+KlCg8+hoNqfCG9VIpyhWX2Db7T+JC8iNqhWnBH5zYXnSz3QuV6y
         0SKe+oNU31Jwc9Z3X+XvtnhY2HnHPg5cikbSXQIm8jKAGnkBs7OArVAzaH+ng5oQk8nx
         SvJA==
X-Gm-Message-State: AOJu0YxuqR7W0esVjyGLtcGuNm+o245nmrmFWPCyO9pEM9UFG09tmc9y
	3OIFGpTxVw0ciNpnnrd/va6yu/i92uNq/0Z3q9N9tj4wxMzL1eSpvYHBgM+eaUcu5NIjmno+Ra3
	eYQ8XTnis1rfDjx44p7hzwQbao+S6hGtXHCoQOQ7s7QVGlSr+9NJSwUWY+NyLsSr0B2vz
X-Gm-Gg: AR+sD13KirgOe2Zf/kUVIyQUrQdbUObzu9qzdCghKcZDNjiaRO09MWP/MgXgqMeWaX+
	6Hcny2XahOyEqyjRkLZ+3ya4e7yg+KezVWR9UJO5cSCAiiDZktSsKRjfdXG8qvi+Oelm9An3GW2
	KNPY0pZR6uBop3b4vgUjj4rPVw7AZtY9wc7r/EH4F6skcyJw0liD+DdZjreWLU2DtRaQX0k9SVs
	cLcjPw5bXgG+OtKJ/RJWOipGjWXIPeLhdkgwsEpMnDwVx9NfjAm1Vu74vJqoYUiS3r+/N5pdV81
	yIP+wT70+yYdySpHbW9cbJRrBv6RrW+qRz3HHPBwCGQIelW+gTzdjwB5qAAs4sVvoVoybh94XoI
	5TDeWXEBJ4Z+v1qLZhttnmYtwFSGpGJ+rkUhkDnlQuxXy1mI=
X-Received: by 2002:a05:6a20:9f09:b0:3c4:3a74:4472 with SMTP id adf61e73a8af0-3c43a744598mr47848637.63.1784699950882;
        Tue, 21 Jul 2026 22:59:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f09:b0:3c4:3a74:4472 with SMTP id adf61e73a8af0-3c43a744598mr47827637.63.1784699950462;
        Tue, 21 Jul 2026 22:59:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm554013a12.12.2026.07.21.22.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:59:09 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:59:02 -0700
Subject: [PATCH v10 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-tcsr_qre_0721-v10-7-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
In-Reply-To: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699937; l=2520;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
 b=hz5YehAoMMF4p2iIQJZNi4W8maV2v5p2C2a0IpUmfJ/+bSYvlT3kXFuYCRWSTy66ACy8JIHYy
 0uNh6PKfOjuBY2RDDBiKrIp2TUN2efM4P7funKKfjHit4tKuUn+uHT6
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: XLlq4vGSiLRfbf9Eofdd4Mad68E7xJ2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfXyrf+0EgE6XeM
 naemLB1wxI5JIzxFMZbpFQ6paRRl956Z1PQf0ybEaJXRUbEQfKGKqf8gX0hznd/n7MwkXXxRhoq
 6KzoyhCgnpFw/sk222zhIRWEbA6B9CuY6HYgfmBrA2Y2psQwlrH6huYs3X6AGNw6Wmbnlm34y13
 4hzOrADvFeDx3UYEbuitfeeLm+SR3qn1qFKLdvRUXTyQzvE0MSiqVcs3VhEbz2fTZVE51Emq4+p
 VXJi8gWtH85kElriPGiTKymepQlXOOXrNMgfGwNXJOhto6B/EjZJFSjhF2GJSLSlEgBpx8iWgaA
 40mJ+xuUetm5mscfEQlBPCHEdUmiwLVgSHfZ+5Udv7v4YvZZySHhFHl8eNAsMrC9Skj1szW1myq
 /tiyezFjg6LPYwTVB2b7Or8hOXRAaMtFZ+YcFERiUdhVe07exxNavLHNIJGjQLWl5+2lpM/K8pR
 mGBXoYUWjlDbM+fneFQ==
X-Proofpoint-GUID: XLlq4vGSiLRfbf9Eofdd4Mad68E7xJ2O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX9FxeVT91u4Lv
 pHdYtBhL9r1fZMqpQEniogmhvuZjiwMMPsR7fEjNHlcZzonDtipEWwQ4dumtfDGvw1Dq+YA+X5c
 ex63X4Ay0d4g2QpUrm8ck8QjFBYMI/s=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a605c2f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nz7bh4JJC2V4q-rTAcgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220053

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1

