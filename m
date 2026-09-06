Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AAC445AD0
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704309; cv=none; b=OLkNQjbWB2CXuyKDO39iuYfM4Ee0C4sGtROM/jrMJv/8D885zv/U7XCeXA1qGU2IknjPWfzRKXtkApjleXmfW2di79JOVm+yPKiKzOpy0xiZlWWNkTAqcXIRDKZ8zo/Rn51lNrC8/WuHTcUbgzZ9rK7htfwtEUlBGGWXwAMmlyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704309; c=relaxed/simple;
	bh=zgBS2poww2eN6YQuXDkYZD4TT7J8e+5Ik+8ytF15e2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mbr2LFt5oIEP4HZ4xjcyAxMThek1KXj3gWeUw0+lTKY5D6BlvAoR7ayY36BjlUIoIGR3JRCQ5mVumlThCifR7zqZtDLntkxTSpvRvTJTfQpPdqkMlHwtCJ4fVzdHt3G0940CJH8oUJkSw2bS47nO8l051+sZaYNnPHnO7piD0nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYqHy7fc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ni/CzrT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYqHy7fc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ni/CzrT0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6860d50f3819449
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Sep 2026 14:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=; b=XYqHy7fcxdQW+V6H
	NbkMN4+/oiBH4m/92RqUTdl+5WGXcdQt3cOcu8eAw8ZYz20LtUP/qpFqYsYS6ZUT
	QcOKHsInJs8s5ibDiucGnfn5wMfDJmtXDK8WMKi/Gt2EdOn1MehOdlEKMojHZr35
	1ZrB8OAEv4x25QVy8MpjfryUw9vhIncW/RH0hZV90PGMvQunsSh8ICzwVVqSmxNh
	5PFnE6H+TY0B2nsyoGK/GqmCPZHA3iTTMbxNtEC0TrXthaUygiGSmLdXcfG8xayH
	Ve3zZFFubuACphqagV7AQ8BSRVWmFaiHMSQFwd4RxqBD8lBVFQjY5BQPX31uUq3G
	ajpqbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq42h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 14:18:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3121143a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704304; x=1789309104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=;
        b=Ni/CzrT0Cz7Eyu8E9gPsWQIaZv1kwQPC6JxCJOpltmvxxlOVm7S+BawdjfYE+fEdIZ
         jStif91cJUC/hW2uSRTVYP4fp0x1XtbzHg8BBr4U+2Ykgi8vcCm2bop2yTtkhA87h3Fj
         eLgxX0Mvdj9M2mk4evW3DZN+4YLy5w/PXXsGZI8YoiVDoOOR2v8qwb+x2UsvchY4U4Tz
         j3sE+zS3mGwhOL7FwmyF0RGWiLJ246peqTNuCC8Dly+U9v2Ix/v2o96kKlFuSD8nnpjl
         VnWlVSqRHuNRfuYkn/dH3jMbsxga1UBQEug65tuMzB9AbC+BzwQPJ/2Km9Qo+UIIixvb
         uLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704304; x=1789309104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=;
        b=QFIxozxZIShEpC0gNczZCtmMDKGim4Y+7d2HMEbcgOZpzeBMjtVaelW6RrcJFRGYEQ
         GKrk3GzP/Wo4kqnU78SaaTwAr/xnb921sbT3dxZjMmuIBLfsU5xUUxwqpm+DFonknGKf
         ikKec+OsGvOlxu+GA9Vca+WfztrkYakSAhoiZlZ/oYvGAvY7WeBDvc5/A4PNTJMEfAO0
         PJ8hGxGFm5r8G5A4yhtsRCrdOWE8Ypx5geHd+mUy3hYBX6dzo7gem1cDUzhv59JBs4qG
         S8hBgurhrbeC/yDFiHJE+LB87Rjm+XAYdGHSYKMHMtCkUbBtehzcw5nVxOnIp0aSAsua
         n2zQ==
X-Gm-Message-State: AFuF++nPrWDiwixvTj256Pfdp5g6BD5m8O9DokbkIFTOiar9SkdMRabI
	I3V0TbjuerUtNOTVWi4dVmOyZnBR2FeIIsgXmEsi1CnFoEnwBCmnimbWrLSKAJyF69dE1aXjli7
	AlsgmwoUoS9CCrB6TxLJmEvlypSYnI+fPdFP8dLSIW0Yet6EbzGJ4rCaR9shllRjd05uq
X-Gm-Gg: AYBFou0Plun2nwuz5sJhc5DhvSb9ODqMo1U7hJmP94dIENaPkWG0M/Bjsxys93l07C7
	S0M5CN40yxTo3Dclf9MmoUqQwdjAvGjXsZ/+N264+JH0rDJL3s7z2myiLCLn+TQ4/zOfkHXuPi5
	KndcVV65RuWamc32fO2oLVoGXqcGTTTioCEjjg51hg+WlaRp83X9cxqvhvmXH9OUia2po27bBAH
	U5L2eVfUBoEutw/Uqced9iOVErjLPuxnUZt+9tLYVM6JIg5oJ9QGMgPjk7QnFvZZnE4TDLKhxq3
	RGwB2z2udV1sn90/U3AYfmYrkBdlvw/fL9uJ/mDFvSe4RjEr3Ed5R62P908b3rdeMUG+GMuchuU
	BSgrxnwd1nopZHkoTuBXxoj2Pkx7my4b3Zc2AT+GrrkQ=
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr28138788a91.17.1788704303932;
        Sun, 06 Sep 2026 07:18:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr28138734a91.17.1788704303481;
        Sun, 06 Sep 2026 07:18:23 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:23 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:17 -0700
Subject: [PATCH v4 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-11-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=3090;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zgBS2poww2eN6YQuXDkYZD4TT7J8e+5Ik+8ytF15e2I=;
 b=O1Bf6TnKUiXvOhGLaHyEgQx0Gqf2dURDSGC4tkEO8TPt/BJjCvJbv1DlzqIoRH9jTPp1IBZSr
 8VZYneh9cP7BjG/nyvA0hRZSmZCpZeTAlR5p+ebesN9ZyzD+IcrWZWN
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9d7630 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ihdlGfXGyWBHLSVGZBMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXyPPXnhRN/IPd
 df6jIiVCXiJ6kFiOYBtAdIEOWgmqurwlbrOMVRnnaQwcBV8FrvA5y1QE28LkIl+iPGNSkCdQuiK
 G8RAJAwzuIGdQS6sDCTepAtXxyoakfg=
X-Proofpoint-ORIG-GUID: URShKfZb-1VwgHETUGoqXKXFGiuArZMs
X-Proofpoint-GUID: URShKfZb-1VwgHETUGoqXKXFGiuArZMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX7ZHbc1EdGpPU
 APF2OJf1eAJFNIqSimixqvceoPrdD4wARVKW2wDZisrWQTqLkFer+3hjiPpl8TNR+npqhBLfT6B
 JGdbkEIT0PUEIPquCzBVsn9k2/iuMPV4L8pLunHpb2lJwMaGAZBBtem6nkbFNUkPQeVEBVANHQ4
 eaQi1dfZvYyXLwY7ucHLFrRrUSs7DWLqGy/ctsxs7/1eLX1E5gY9tkGkXnzzzpWmW7svytfCSR9
 kC3rxSSi+jGEU7BraOd49eudYCXdrZpwcFrnGS156nEBuSK6bqkPoeNDc9vh3RbBOYXs2QikBei
 T9VNAfroFavE7jefZQYuNm78l462iSGAotFQsf3QCGCdqEfRPZsUvnmVwSRcVRg3hr5grFPYkyT
 XeyhxfGqFNrLCPYJzupfc0jX9h9bqtig/kafHQf7anEePbpvppFuBgDII/7qeAKitzTX7C/5wuW
 yeHPPtr+lD7YlHQ1wSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

Add CMN PLL node for enabling output clocks to the networking hardware
blocks on IPQ5210 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL through
the WiFi block.
XO (48 MHz or 96 MHz or 192 MHz)-->WiFi (multiplier/divider)--> 48 MHz
to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 26 +++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..61a53361138b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -20,6 +20,17 @@ chosen {
 	};
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHz.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -77,3 +88,7 @@ &uart1 {
 &xo_board {
 	clock-frequency = <24000000>;
 };
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..52d851a0dc2b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -3,8 +3,9 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 / {
@@ -13,6 +14,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -22,6 +29,11 @@ xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -130,6 +142,18 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5210-cmn-pll";
+			reg = <0x0 0x0009b000 0x0 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5210_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.43.0

