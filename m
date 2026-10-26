Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016577;
	b=R0CAM07YCfH4o/e7JIT8Rb9AxJ++NyX4osVyWucsU/lWMButm5aZsZ/6emc0MPRHLEE6
	 TTdB4J2qbLQAG6gwgkB70epxO6jDjkw5tI8BSUwhYQxBehjJtAmOJHR1EjFk+WcPT20tj
	 5cZ5B58gjq+g486D4qKn3kqYcoRewigJwc24XYTwTwNyYtyrA1cccrYCjr2fmcSub9pYG
	 ShLbpCAc/6r29LXr9+VkI905+xnr355rl8VRpOhIk3Cb666NbHO9pf9pEYuN/i+o4zYTl
	 D4cV92hEKKq0YmyIFDmOPupDnBvXuntm2SekpqNrVVLLgXEamibw3QaIyRCGG99meIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
	b=v5E4nfxKfOL4qWBWSGRPg/sQtSOTksGgEfjijlnnOlHeoW0mmqxbNkoWOlw8QjkJleRt
	 htCvvDY3bB+ISdKWFV/UK9Y1pSLzHXqAmNyZAmZ8RH+vB0+MXLC4ynEYZwDLkPuFQnqjC
	 9bsCqbaz4ueir0rj6uDcyoQrGPbYgCIrxoskJrULv1MnAegdxLzuZrbM4mmZBKSdePSXY
	 HZa5F0Lr928Csujbp8DuMvG11/FAYRp+ZuTLgfLR+CTMJeIETaF2EvuVX5IkR180RrGBk
	 eOfp0k766dchOZkgI5LaTWwKSICUFKpCwhhrn2p1vViuCGV1MH6CQpj3bXhBjBxqwyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IQs2v/0j";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F23606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F23606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IQs2v/0j
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso22198395e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016576; x=1793621376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=IQs2v/0jC8aDeoR5P+VbANJ7GL91aY0Nfs2pVHNy3kzjK3e0LNrpttJ2VkKaCz60JU
         SJJu2wEmAqxG8I2srwK7U6Cvg2noGm2Yax8ylVX/AcOsQHasnUVzieRYN2P7l8ToyrgJ
         zxLZN9DcYU7hQ6muYRJ4VTvNwJACEormO7ZV+tzApPKQ20xuYiEaqTudSHuxDqcktWN8
         mCohN/TFVUZ0+c89kiIn6RgTL60cZ4EmzX4WMoDyBVVscwyrpkaTUYBf1BpwG5PtlNyZ
         l4D0/bVzD1TNFNuOvmDNPE23gdPz58SGq6iMr3/hE1lYTiqX2URfk1wkIC+QNh9IcvtL
         r76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016576; x=1793621376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=Pvy7V87rLGImZh2A62AhOhNI31yIP0qkEJf6YqtqRSNEHDXrC1M8NAJ0BG56tmmkcQ
         KZhE2QPtBSIcq7M2DDsZYFETbZu6cC3uvowiMpwJe2kOOkP2PHrN8qLfUf9lBa3Km/A2
         3z/EJ8wr80Ps+d8/Ml/UBoulDf6eFDjajQgtMUq9wz9++khkibkRS19Qatcud0I4Q+ug
         mMbOvMnbxfAtrCQwZU29ulOicjYCGWa89bJ2rNT/bOMbmDwRz4XCote/9glCBpeziECg
         ri/7Y2X7AJuRTb3k69UfUBaUyMGjrtFJz2J86iGAJ+2Rw6ypS77lINoIV8GF6s76SN6Y
         JZ9g==
X-Forwarded-Encrypted: i=1; AKwUvByaDr2OEFnW16E4I+DLz/2XOAgjYFJStna1bcUDXYg/HiIV+QsVFwxEeoTMyWPk4RfGpcjjkFg73D4j1qtt@vger.kernel.org
X-Gm-Message-State: AFq9FYK+Z2/Cq7i9lHxRc2ndSzMwNMzWnkMy/2o120rvatv9nHI3ts5w
	+CJkFMk6SSLpV4pUyYRNjtHOJsK368/mVj0ITwZ2oCTa68HjrcXeVVwg
X-Gm-Gg: AYBFou2xyJsQ+/TTK1CqXZYkyN0F7fqArRCfxTu+wASHYYvM4rVS9cZlkaL/vGbAjj8
	2zCxWmOGiQMcoNmtcvhf6fhxU2bkudYomwpXXs6Q6wl/VHV1yqMFFcgOJErfwWwsxgWGtvOZL9A
	AUbzuI7OIk0b8vM81E+9AJSYlSP/mdOWZJFL4kfTN1flo/32znNR9ANPlrSaEeaFpIjJHeDEZZZ
	ssYtIwGVGeGGKpmOZLvOndqNP3QPV1dQOtmyOAURBJYYDM/RapjzB1bmS5lL7X0YU46RQAqPkYh
	vDy7kc8mHoigxPFTpltwmLABKpBtL/8dT0fJkqLgoT2skeU+t1zUoR8l6nh3p4neTQgzfgtdgGM
	Dm9QaxOEhvHy6cdWeD3TQWnEMP9qddqIyrmzYgmgyCISUqVpaCw0tC655tJ1+Uitbs2CsezVBFH
	EK5qgsO8VxP176qN6WusW9WjRr9Hon55cydq7uy0PF+a8ZWWkWVJMk7dRtPmRxNk+9rwHylIvm6
	OddJsroaPgyckY+ZCmoWLQweGisC6TiS/Z2OdA7PkXqRVSkXdB3XxfVK7NHQF4Q6wcym7g195R3
	VWAWh1oYyRT4n2jwU8qOg8QoTKcIrFIwR7pho7Ytv0zD7tsGjKB99EZbq3Lf2lHA+7QGAyIFmKl
	TawIO
X-Received: by 2002:a05:600c:a012:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a35ac95b2dmr110048655e9.16.1793016575542;
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
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
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Mon, 26 Oct 2026 13:08:15 +0100
Message-ID: <20261026120920.1667982-4-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Drop the _clk suffix from the GCC CMN PLL input names.

 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..b08efc959379 100644
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
+				      "bias_pll_cc",
+				      "bias_pll_nss_noc";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

