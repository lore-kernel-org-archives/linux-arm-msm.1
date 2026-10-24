Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838054;
	b=i7cX2nNJFSqpFelRZIZoRb66tFxkPvHkd89mk3fbalBMzFngHoKR7CE4jhH5gP6/GEJ1
	 l8aafCx/adXk5+w05Dk9D4cIacBu6gGSz3tEVInYg6ia1qtA1xn98HsfjQs1SzBAUOtyF
	 jzQyDzUgkJWEt3UJUslxEfTx+8OHS3uK+3jGwRSs68hIMA/jM+7JKbTrmDCxYPJlcFgB4
	 Xou9p/haWCuNKqSvxIn90SOX9pEnW0MqVO/p1h+sHB07nNVueS/nmaLoTPXOGVMUDYYxH
	 tsZMbsS9zsbPUMXf5TaSy8PJlNAOk0Wvbw5sOAJTrU1lKTo9ZkSDyhWVItHsMES6B0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
	b=Nx9bouPzKnc8OGRvyIalnHP8RqbsDW4cFERNz0MNO4e4+5YqZaubXe1HvnHxmHXmACiV
	 f1EEAmuVE94msW3jpywBsEaNjclv59er9N3bptC/w42MNmLEcqJUU/Hps1tbT0vTsn57d
	 VZSln3Sb19Mp+D7nycooGT6rVnT9rdR9F8v6wXY4bqLNscYQzrr6+4jW/UP4yJGT4PfLb
	 mFQn7oo0/0LzrkhfrLWVHGBDfQU8wn2spLgiOnYsHd3gX8HwN9S7A5GYq7vM1n35o1GfB
	 dVbrWN5TwCWmIiP8wkaDBI/SC+QPNH7cAkhdWaYvRkyJMlKKI1Igr1ING/Pt6IKN9gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4D9606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4D9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1434925e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838052; x=1793442852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=YdKX24K5TOlpcFJ0JFIKaPqeZd4jYWqUjIEwLJZQlXOYeeUNYiMecPrIjGLx4Z4fnx
         m7HvkLbn/xgQWV/9JK9FzWU81MbsnAt89fyh5SOPZcPW7LTgeEEex2KX6oFkYxrL87Gr
         5Fh6FS/GSOTMoj4WtGxvocaACDei6U2u6mXZaoqJ+zP9ZwJyg1YPYl2l/Xx8QAZMbIWc
         eafGUH0BG9+0f4o77CCKZS0eTQYVuIuC3270RWyV+W86puo4d2xYSl8OQe2QWUJ4ffom
         tkNmTSe6kHB09Dm23ZQmSm4Unn66KFGafc7CF93cE8MMb3By5rX8S+0REEDh0s95Uqyp
         bfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838052; x=1793442852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=PXOQdaFycKZhUSiXFDP1OXwn2/znyLWqE76/PcZhDYP52nljvcAocRzZXZs+kvlm8Z
         6QVBEFSLdQpI9bIV01c4gl7G85DBo6QAwbniIzuWZ8OUL12bN4Vs+xQ4NuxzoJHKgbQe
         kWsrPOmTE884+2s7zgWuuOIChw6LIqHzSSGNS50lTTLvLwQEYSWCzb+DdCQzZ2g7d6/F
         AMDAIz2bic1hLY7D/qIL1i5C4laC7Dl46WRLcvlQu2/dcorDWLzKa3UPJhSbUnccke6T
         /VMF3cNEgjGdM1KBP7gxtgF5J7EZWhVcDnxFbDybWRT7XZcJI+c2FZXzV72sPWhAgO1H
         QiZA==
X-Forwarded-Encrypted: i=1; AKwUvBzEa1+TMQx971lwVrg0hSQoy+DtJNYA4FnFKZNbrKURb4UxbRgwtPP2RPSlrqCdJkzrCqMkbNe/Dz6UkXOw@vger.kernel.org
X-Gm-Message-State: AFq9FYLpeyamxYKfWHdbuhRYwbxIYUs+lxWp+277tJFPrqfml0Y2Jt2Z
	LIzR/moQ1j92+b9wPFcnU+oWRcWyDl7Gb32jbxKhh6c6+RrKUyn80IJS
X-Gm-Gg: AYBFou3MwP4ZqIgAnSto6Q53atuanBSN0nRQsREFig2H3k/2OhYvJmnZJXStyuWOVnN
	4m6fWGwFROQESyyN7DV1H7tCAZ1hRZ2Mk1QcXpjpCYZy7t7VVgV2cPhoy899pvWe7VuZUQY/u7K
	RnXHzTN94J/NGLTWQvEEOscVmr2HoDpJCwDNRWIkZiMEdBJHEe/+22zSVoyMB+TOTExRYM59XYV
	HZr9U8Zf+zpMXlz+loanGh5X2wNxfi3n4mv3mnOn9J/fbsLLbm5TjNWUsMRBQ2j0rc2f3XMAFm9
	eIxavgU5LoRIUafGTtXB1lCwwkJekZxKk/gPM6XUOovJ5Hy/WYj01FhtO4jEPbLydqO8qCvw92+
	8DaCI7GdKMSlESP402mUbgneXVB2S3ltvVB4w39xwhiiZFofIgYVVxu+G0H4WcAX+m/DGepUMYG
	cuhqyVvGYpvbjHcVgBmg5yBiZsqfRaSbPvn03DZ/NaE7k1K9Hsu9RJDfROOvjWRnrsA5B+cgk/8
	55JfQ7HhTPuao1j337Xnmkf5H5sWMPDGc8Ws5YsiIh0SKpPFXsxY6AdZhgU7AXpMh3plvykuxEI
	Y5OG8Mg5bLrdH3NIEEypEiDVBytGb9MbyXHQtofX9jSrqNRR9pEZx370yLpoq58vRB4Rl74oA9S
	ncwtY4nM=
X-Received: by 2002:a05:600c:83c7:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a35ac3f293mr26033995e9.1.1792838052522;
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sat, 24 Oct 2026 12:33:10 +0200
Message-ID: <20261024103401.761125-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024103401.761125-1-robimarko@gmail.com>
References: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the CMN PLL node, it will be used to feed the required fixed clocks
to networking subsystem.

CMN PLL provides bias_pll_cc_clk and bias_pll_nss_noc_clk to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..8afc63a72144 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 / {
 	#address-cells = <2>;
@@ -15,6 +16,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
@@ -257,6 +264,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq8074-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ8074_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x2000>;
@@ -369,11 +388,15 @@ gcc: clock-controller@1800000 {
 			clocks = <&xo>,
 				 <&sleep_clk>,
 				 <&pcie_qmp0>,
-				 <&pcie_qmp1>;
+				 <&pcie_qmp1>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_CC_CLK>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_NSS_NOC_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "pcie0_pipe",
-				      "pcie1_pipe";
+				      "pcie1_pipe",
+				      "bias_pll_cc_clk",
+				      "bias_pll_nss_noc_clk";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

