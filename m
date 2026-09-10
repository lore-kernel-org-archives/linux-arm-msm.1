Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627984A2E1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047055; cv=none; b=HP3wuHM6vljeQfgAiYHg15ohlI9EiEQ3hTWAAiujWIv0Zbcdr1jERj0m2OgEYXugsA7/J0ZvjqYT9QFt9wCUIXhKfP3yDPcwAVD2n1Fct77gnk0kwF4qmnXVuXXBKl6+7X9Rzef+2GAfFq3IHwwrvW3eauiW2lZ8jsciZhRTvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047055; c=relaxed/simple;
	bh=LKfBxa22qZbO9H9P9YhONQYUG09WASL2JjEfs5CCqYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8hY3NNoUhrGst5YhFUGDbXG4KLWpQxdco+ZzUREgVynG9xvpeZxxHJB1mwTAUOuX+ERpXf49UNVoMMiOnyVej77zwrRV9jASkBykns6EGmiLAK7W/U+Mu3wVP3kkTHnknAykGV9QXkFfiZx0j+8mn34q2FJT+9bzaOwWWHvH8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2+uZfox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPZ0ztKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2+uZfox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPZ0ztKs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7pIZ383943
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=; b=R2+uZfoxJPoLyr/8
	q+CKFQ2uTdgFxSr5XG1w1sk0/alSTRxyzIzgDW2zhCHezeviwSz7y1T5xSEJy21M
	ZH8K0+Jpg9a9tNa6c7eO+VnxSzESr+PtG96R6O1iK/98TJCm/jc9+JnXBldxxS3h
	ww0xSwSJ4SRnJFOd96zxIVrUl6gkdXGETBZ1nnArxlTiTXOYmElxssQZepoA2uaB
	9gx2M1USJypIRK1NMUEZb7yI6/MyRlZLWV4uGQNly8APE6w4IfRuZ+j0ipLz0jyq
	3dBRYYRZjwrPRCuDETIbXCSLbjuqjrN/EJMkqBrbz30lmSPM1c3bkQq+t+T/uZaH
	GtKXIw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv07u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2005602a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047052; x=1789651852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=;
        b=FPZ0ztKsIAJ3iYFv641T/uxcS2Qpkontm8YrQZ5Tk3gGiI9VrQtLahYV3lSBTTU+84
         cBhI8gcJyVhHsmUBYSIpOb1bXIOiCUiEbIE3h4g8esFCqSCMq99JVfmNgblF1PQEZY2H
         Mq+6VVyPwmaEY3nDnQnZ8eAxGY/tCdJtRVyo3I/o7V1hUWYB6nQ1X5Eja4eqW6/dBDqP
         4abZN/y5YAF2xWwPnD/u8qIF4kvyX1r4C9BfezyGS7V0FPyVGqKtJhwxfNwuAGCEj7Yt
         rn5mX6KgApkTV7SHocFcraePHfTZjV8DuMYlqIuMhDTl2klOTirqmWGa6uoJLsZJBaAE
         lVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047052; x=1789651852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=;
        b=Acq7V0cCet3cB/1Lmbi7Niey6M0BmlyzTtIwMrhdwyzaNAQi8RvYRQyExJeQOP6Gb6
         w3OtDanhhQcRGegBwnhCFnJXMSIjQCEqSS0nfqBVYPP3pN6FxTvfKUEpKadIN4LWmmTa
         fkwc2dwh8BmGv3ndztAH5h3Fid1dGr7C+S3BPHKrwhsR/y4mqqNV3/H6utNNEVQg9boz
         TCollPq1bwmIN3xOssv1tsipL5hobpSGwOkb1lDCZeAnro29EgWcLNwkM6wFErSBYkc8
         dDue4xjvamqx4TKWTXqGKoauE3GL7V9DrmPnWocH1TGmJdylzEmXNGz/A19qjcUM5eK1
         Aicg==
X-Forwarded-Encrypted: i=1; AKwUvBx6YvHld9HXlC9zzXJ3Lt1bJ6MJjThCN5WOFesW/toQ9fpzh/YolcwTUbUjsYNHhBChtQB540i03WfsZ+pg@vger.kernel.org
X-Gm-Message-State: AFuF++m8+a4PGnNiiSoBi/gMx+G5SO3O5o5tMdxYNwJUqdY1txkqwpLr
	ruuOz7gnpgKiBZszPYkB/0VyaKcziI8j/k3FhIOM9B/WJ+XAlidzhvnQLYQetg04tQy46pJTDsj
	nQjJ+zNbfTs5I0/If9pi+1bWa8L25ghXH3Gb8BWVhAvfwXG0Aei+HScoSUgpdvUTUM0V9
X-Gm-Gg: AYBFou1RejnJAXhin+rGD0zMAJ9vGtulx/B/NwOGtxAFfCUJzlXN1AXZ+FTXVlQRs8v
	Z7Ty8A5w3nvtbG5yuemhiEJIisz2cKfaM4xNzTPQi2oddDNRM/j4c63yMcc9wwMv9NII7z5selK
	fqFMP0HiWGtCz2pbFDCgMIxW/fS+C5rVEr71RufR2HO/IJ5t9Rgp2mzWwg8kIZ6xtmJVB+B11ya
	iSyldUR7j4Jg+sqZkKhNYEap7sby5wgf8rPcC8sT3Musg0XxNV/Q7rdMkl4Wl6M1zCPGC0ZGcBm
	/aDohUxXCdc7gbfaQuGlKZWDeIYuKgX7UhGwUFv1XWMYKdeneVp3yGOKF1/lRTuSoeNNAgflzT0
	pY19PBOvdmkWs5EWb8YwnPDoFG56wXdhRWw0=
X-Received: by 2002:a17:90b:4c85:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39d77b1c383mr6079681a91.15.1789047051426;
        Thu, 10 Sep 2026 06:30:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4c85:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39d77b1c383mr6079629a91.15.1789047050861;
        Thu, 10 Sep 2026 06:30:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:50 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:13 +0530
Subject: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=4559;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LKfBxa22qZbO9H9P9YhONQYUG09WASL2JjEfs5CCqYE=;
 b=EZaIED8TxuCd/MkorGHX7hcWfB7QHRTDck7fvgVrWd+x+SdO908UXcPRPfYFH2/tyrDv/oV55
 AhrEjhyY4YeCl3O3xtmCy+6pXEJCGOht3RJ/ETYio+WPfblbZ0XUCQM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b10c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-yNNrFuiOvHClSI-D14A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xF3LLTEFGAD3Iy4myM19EG2cFc7EhMpP
X-Proofpoint-ORIG-GUID: xF3LLTEFGAD3Iy4myM19EG2cFc7EhMpP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX8wHhBJjN7LIt
 FRmG7U0PxpM4Pe71pHxm0Qhl9ddrX+uyG/svuFRsEOFqORDUnuAzafDTF1EvpGLiGN01V10aCKD
 GHPSVT70BBte6RFOAHWzwQ5gAqvRtbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXzZIxchu0Rl3Q
 dpeAKztAmnRcN/ngfy+xPOkLx0TyVoJr14jtbNVnVqlVDAhHkNMZbxkk9Lkt8zPtVVyJy6ou1kU
 y2B6/3VNfUhFm/eLqFQV9ME/etTlT46YA0l7idmL/4zdL2FgDL2V6yrPhIQd9vPr3D2KXACqI7c
 oQSNEwAQ2dzI88wP6nB9ujQbKo1FHCPBtFU95tfBlLUYYagG+69sg807ApH/5mFWhC8r4/UolNP
 tGxoXBN/uIN93ouHJGNRT22EqlUhhqpAtYvxm0eH6iI6maTKOHNwXoxpJ2B32iuys3rJmvzxIeT
 A8kNeOdZaiuRfxRCBs6Pbaw9vZ/j0wKCCXanmwCyYo5RNB5SLdyBXfqp6g18j1bx+8x8lZudu6H
 kP1C55vvrSeJCptjgyvtuRhHMw9wDP9g4sesWvP8tEOYM7YDGRKg1cJ1KaNPt+wnImJQ6O80Tvp
 S87HDVd4cFeB0UeFihA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
labels to these nodes to allow board-level overrides. Move
perst-gpios/wake-gpios from the controller overrides to the
respective port nodes in the board files, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index e6ab523d249e..160f6ccf21ca 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -491,14 +491,17 @@ &mdss_edp_out {
 };
 
 &pcie3 {
-	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 327dba55a5ec..fe773a47da2e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -592,14 +592,17 @@ &mdss_edp_out {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..a85e3211958d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1779,17 +1779,17 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1898,17 +1898,17 @@ pcie3: pcie@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2018,17 +2018,17 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2138,17 +2138,17 @@ pcie2: pcie@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

