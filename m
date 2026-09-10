Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC5E4AA020
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047084; cv=none; b=hhpGyLTqmhOaubh57Ig+D0SVTgR10DPeMifYirx8o/btk17ZdlcoCe06upJWWrhlPpqJppf9bXiICWHhJpKClozV0tBD2376aiuLybgQSi+iefFde9xlTa5AalBs9EW+08+PpE2OsXiQnZPTrMIqWRbA5LBzFl5aZCXZQQVepNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047084; c=relaxed/simple;
	bh=UkOEj53S9OPwwL+enaw9an0CYMHAcaW8Wl9DTd2ZYtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgP5l2dUlcL2DFK3CN5lshtmfQnYOXzdGv2WGUIHbrvbk+Z0t0HVqmQ+0tRtF5n6SfkKsut3saGgtvqX0+houFTjKfJEXNc9JEtMyMUeC7XL3MF72m8clWYYixonmEhdAgNyG8Rtx3A4uPwflxR7he5voozLz/ja1FeYMqrwR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+c+gsdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECERvEmQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+c+gsdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECERvEmQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hBs1732394
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=; b=S+c+gsdm6QVRITwz
	LuCD3g/dWkOkSvmLF/LdlI5KZDqZHwOvobUtdy+/QnxZc1tXwayuNjZS56FalaxD
	z1mRwPzj5Yjy/JbEXj4ubmfRg6/ESqynEdiBAyF0jzjnkcXKlTKMhfKDoSelQFIC
	jnTwdCwmSCwaNxXeLx4BewI12oH4QH8TW4c0BBwe8bxpRK/4Owi2b3OkUqTO7znU
	YErxYxJO3NO1fAQV6I8AmFJXnEof5zA1s8amBieeNZ24JQuBAwm3PePuDX5p/80d
	vPqJ+RGtvZVLUZrn9nuY58QQ3CkJl8HfJCtqTSILYUc4+3xMkvDea8KsLjmApZx4
	pHkkpw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydm14d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ad778bacbeso10596478b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047081; x=1789651881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=;
        b=ECERvEmQEU9qK3BQZN4AmHWyU5kc1UOMzvRPhhi9vryUvP5717qcbZ8jNh0nLezO4m
         B/InnOgQHUpgPvJBU5yNxvEgePq2+1WXUHjaqAPVzaOB9jvTmTgwcpCtQc0H2ZI28zq9
         2dzkhPWIVJL2YwZkX3bcIf0ff6Tbhr5VhaS8qB4KvEokaEmGwUNl62epGg2FwQtGMrBV
         tEERS6RlxL9x0wZZlktuppJcWq4DPBWeTZYEQtiuZTOpqAcZXK4IPnis9jYNk+P7h/eQ
         QKAQHwZAZK7iF5jJysz9EyF2gqS6RWhnLACFsLjXuI93HZ70y6lpnz5fC2qYg18A/IfY
         UL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047081; x=1789651881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=;
        b=OVUHa+3Nr1FAveqqhlqGSPXmHQaY6pxSNChRQIRq/29VIM8jt8E0SDxqaRGf+gh7cx
         z6x+qJZEwNIAXFSn1WHAcA6wuK8V8aZyOKLb3m8c2FDUJPhWFSjf9ZCG+xrNaqP9p5W7
         4dyBZWtW7yG8N9Htc2wKHUi3v1hwg7kaeW8xweQEMmS9Sy7O7M8J/j9ltUszIEFkiyc0
         DQkrALUJglHHp6QfUdONvDJv+Oi1vNin5I/iD/ADmKk8qK3z/WepqtfV7wug8z2F70/J
         M+pvFOqXqmyjhStv2Ylrqh2jZ8ltFOEdOkoj9U310dbU5o76cY3bzQ0ZpPS+OX0ORnK5
         9Deg==
X-Forwarded-Encrypted: i=1; AKwUvBzrIquaLdq4dCDoAV8hIZYyUWvbCPKQdLC4grZ8PiqcwAaHFjO5pP35enFoKv9qcsxab1MzOZqWfM1L0pyp@vger.kernel.org
X-Gm-Message-State: AFuF++k9KkOvon1pm1CxJalH0ZUwa7qqTOxQmVLoptEsbsNZoTUMCtko
	m7CYdXmJXWaSGq+v/j/kIu/QTdkNIMPdBqBixbtfCUnWKcxUMP4F9Aqp1mPUGIptsQHoH2S9qce
	A/rUEmRe0TkNio9EbW8Y75XhO0ehuVATACzuZdYf5yQr+/faGdEbfPWUq8BZMLXCSHQmEIza9XW
	eL
X-Gm-Gg: AYBFou3b6zRsMwCU8vnuqXM7Urgg3LyLu5/o1Hnj6Lzbi2fO8L5RqRghavwWb71XQS2
	HnR7iiZeHFO0jLx7lNoihyWEwWYs01IU0YSUZGpLURVQRnm2yGPreu4NYlLtF4KV6Tn3hNzJTPj
	BoGVtTU/31exBCJrECG2Fj1emOwdKNiYRzreikLMAKwry9zYC9NYEU4yeu2VoKqGvfJmUk+0YfR
	rtVwIY1Lt+57oUNWbndxWKJpjQtxoyFYkvvA8bqgw+kJeDTlOS+daWugChPRB+2BiaYBa2iMtl9
	pe7sh8r80k/8v/tT7OrP+Ku3DULk7Tdn/BvEUgDCeoHq3rfBosoHpEtVwDPB0jw66Wt44WQY6wd
	TVlXAebgqRrpywVhIHvoqh9atK15vwO29iPo=
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6b6fabd2f22mr23234201eaf.5.1789047081161;
        Thu, 10 Sep 2026 06:31:21 -0700 (PDT)
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6b6fabd2f22mr23234170eaf.5.1789047080677;
        Thu, 10 Sep 2026 06:31:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:20 +0530
Subject: [PATCH 31/34] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=6282;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UkOEj53S9OPwwL+enaw9an0CYMHAcaW8Wl9DTd2ZYtQ=;
 b=Yk7r/126fsVFqIkRtgEtkg/SmEsaf+7/pkv0uHTNSZbIwMseFkOEB4aYcjS4m01OFofwgXlj6
 N0Hcm2cYtYzCtwFtUfaq6KXy5rSwPGMa1KOJ+ijRmqrAsoEIbKHcHJg
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX+hzpIc6xhJUE
 yurd5seTC924XycKWDUVZGegFYG3OAE9a0r5nL2LIsCpv1MYgb9lCiIwBNw7ByHcxbmvnF2rqT8
 PQY1siM03yNPXjGMxeVG1B0A0VdFk9E=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa2b12a cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=i5f7Ji4RTl7zrp8u-5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: g53OK3Q9rldDVCv4yhYL9k3OIb4S_JHQ
X-Proofpoint-ORIG-GUID: g53OK3Q9rldDVCv4yhYL9k3OIb4S_JHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX0DugSJ6qb+Pr
 UKFJ1yIET/PcR7RKNnRA13W2ugEvy3rwRP0kMiVdyRvbpTwMvIkMSFw7EIBQTWeoJEQRgJRwYia
 BTY9wDEA0+eSOZ7mhV9hjloe1jw6blpIuyOL/X5RnOWb59I55YrKT/HZyKK+NNyTqED/2z94Cxx
 WYMeZkjvhYamqCLoMHaFQL32JMPmK0B46aux0jlU98GTqDALd81yclyz7wStB8raCrT+deDE28b
 4gbb8PwmfITpr7g6JWrwjqCqycmiA2/a5qPLUDB5wzSsT7RpEsa6BmZe1s25KON6kbkRWXIpjay
 lPOHc/sireBxFTL4WHjIpGj+4polrReAI/vJD4Am3ovoMdeJMJSZkf/aLeVrxFNcyMjiX/HTSgg
 XjWggmz2DqIuCt27P+wAYnYHfWxNOvjrMxXDyLB5eS8P7okgMj2UVaNAL9eDRZMFdtaK4gEXHfX
 u13FMWBxM/b8Ms1x6gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and pcie1_port0, allowing board-level
overrides. Move perst-gpios/wake-gpios from the controller overrides
to the respective port nodes in the board files, renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 668c183bc177..9fb53fd8c3f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,9 +1074,6 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1084,6 +1081,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1108,15 +1108,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_port0 {
 	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
 	usb-controller@0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index b73ad7861eb4..b0dc9f134497 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,9 +1027,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1037,6 +1034,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1061,15 +1061,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 1332c864801f..945ebe063dac 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,15 +642,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -659,15 +661,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 2e874f046a0e..c1971638561b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,9 +1021,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1031,6 +1028,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..39ecf4686c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3700,9 +3700,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
@@ -3769,6 +3766,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3893,9 +3892,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			dma-coherent;
 
 			#address-cells = <3>;
@@ -3978,6 +3974,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

