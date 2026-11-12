Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486252;
	b=ArS96MBgRiWtuGNeoZECEXREBHhO70zQxjZb8L2AGysWsNTP/Im+9e7FTwnzykkU26bb
	 66ehgcrnNHb3nlLompvvP6bkTWeKz8JmvmdYXcNUxgikNI/7arkv8lfQDUwQ0GL9hEb+E
	 tK3sCdh/fkSTAumLv9Yv6TR9+fzTy8JwA7usLxNXcusqGX1eJQ093WYXPZcSpNY4AX4Kd
	 bT0k6CJEZrHF35mcAW94waHNQPLMKA1ePPfQDf0sugS5MPmJcVQMytH64MSLJtY+Oo/w7
	 TTKveflfjacTGpsnXZfzctu6kXPNHD7AayBsHqcrvrk33i9dS2Qyt7mUI82gNryKEqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
	b=q9fwqi7ch8g0pmr6/hT3LRCu5b6m7PvWlNnwpt6Olk+R/UvXMcBbDPk5O8yRFCymOYKT
	 8RAzZEtnPBO+BvlP1frmgRWPlSA4HiWHJVpwU1m/QB+saxGH0SBurzx3Bja2uDvNCWVmD
	 NLj6aOJxH+u+o1ecBxUMjShJ3bXkCYF4avqZgDu8/BZew27x7cwjiEQozjxKwF7jT7AD1
	 pLsHJLeyHkSUiVpo4LLvXVmjUqsqqHsE8XDwzVsBFklyMSY31XMuHtzHWMaFCFysUVsX3
	 b0bduxW3UAivPEYBzEcbEMXwmVL/m/OXIibThfqY9lgdxVrPsLpBs1/k69pQvS5jJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13221606A886
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13221606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso5006694a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486250; x=1795091050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=xRCnTnlwyQK/GwQHxD3U4V7068WV71muUSmVB9T+ddX6SRehGgIRfKDBahkM38wTRv
         kNZp5kkNQzsufsP7DK7ZzC+86U4LtwZ/ulFefiWzKJ8kG+5b4enkrM+5Wt3q5Dd4Cud9
         f1SW0m8Ng3vnfQD+16RQHbrBZ0rte2lorC2UhcHuZIPqevOF0tP0IE+QcVf2d2ARWXJR
         Bgw8Zi+IRfyhg15kYLr2z4JdAKyo0ZI4qiEPudMMsoXS3+HTWqJNUSbHsxXS5ideZ7JG
         dBqxoKOUg/XpiFtpkkpYfwXWYXaJBbnyVPEQZu8XpYe3BdCLBvTjtAUpMlO6WlBWvz9C
         25Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486250; x=1795091050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=JgmP1hKJzkt4FJGCeU0VJXZFEwEibRzI1SYVDZB5wA7SzFHxjcp07EWfYLX7BjAAv9
         7+vj6cuBetTs50oBL0ZagpVW6P9dD2yoiyo2QS7U6DR/31Q9Wj/5359k20yhT+vQi/pp
         KpRVvXakyAiCJ8Szz7jE1KQv0Dfqb36P+zOKngZHb1a2BjHO8nU9fw09vXuFaBbDNIzH
         gix0cQglWcKikrdkeb9fewxIO4GQlu2yC28a53R/IvmJfA6gEuTpfU25y+7UW5A3CjLN
         4/aKkPG6rVsvl5kgtRztF5O17WsHade+thFR3rZRLUCJl1PgbVRRXuqCnPG1rEBuCiKz
         evFQ==
X-Gm-Message-State: APuU4Z/uEVR1NeTkR7B9LhZnybBjo6gGwe+VpQHhQrzpGccZEuEOjcs4
	iJ/46ldInqiOxkLlUjF5hx56KJ2sMBw84v8GSyRYAc6cR3sca7p1LDVmpLnpall3
X-Gm-Gg: AYBFou11W+q1yZe7hou5BdiUs9/66CohJLkViUdKeP32u4/SeGIGFCqPxxoskYTdAmY
	holnJldXXHHT902lnTquRwaihhVOGoZEIdZ7+8m3JwjV74fr5RUhRbmnhSbWXGQ+0EnQKcIw+rW
	iRAyYHIMO5j+iI+nogNMEoEvKFsuyuKmqR5sZFDW/dljnCKXbsi9K7JWr+g0XOxuwjXZJqZ9gmj
	SDWDDjlY3Wu7q5xS0R5gKJbfrQn/9ySnLJu1W28vfnRposB2Bsp+XVtvg2V4862qGGv4oyUuUGY
	sIXJC+EDBbjrJXpprC6XuXPQHNQCqa1M7MYItDNUT8InkCcnDeKWfDhltqL1pjShAHG7aG/+1OZ
	+lio1TlpUwbh/tTcmwVAJsgwWVTa1vYGamxUlo5xmp8YXSBHOQhGvPkeGLr2cXlh8YZHQd5MKhE
	5DN405UuLFBZ+e4QTC4V37rXooV2voW7kQxJY3vbcR0Rj+rz0F+FzCCkFf0UaIPEZkQXEcerxff
	gWIqrZoZx5LaiDxYRB5C+QuoLfIdOMiBlYjYxbKT99YTv2JO3chWtM4cLqb8UDgVvuvc1dZJy/5
	hWR8iEYL92sFBsFWtArNZmd7NHhpHbs8eX8T9wuS
X-Received: by 2002:a05:6402:5607:b0:6b7:b872:27b6 with SMTP id 4fb4d7f45d1cf-6b7b872305cmr250988a12.13.1794486250115;
        Thu, 12 Nov 2026 04:24:10 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:09 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:23 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180: Add GPI DMA
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sc7180-gpi-dma-v1-2-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Add support for GPI DMA on SC7180. This SoC uses the same GPI DMA as
SM6350.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 29e345a6a13f..8bf669ce9f89 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -881,6 +882,26 @@ opp-384000000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@800000  {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x1f>;
+			iommus = <&apps_smmu 0x56 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x6000>;
@@ -908,6 +929,9 @@ i2c0: i2c@880000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -928,6 +952,9 @@ spi0: spi@880000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -962,6 +989,9 @@ i2c1: i2c@884000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -982,6 +1012,9 @@ spi1: spi@884000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1016,6 +1049,9 @@ i2c2: i2c@888000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1052,6 +1088,9 @@ i2c3: i2c@88c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1072,6 +1111,9 @@ spi3: spi@88c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1106,6 +1148,9 @@ i2c4: i2c@890000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1142,6 +1187,9 @@ i2c5: i2c@894000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1162,6 +1210,9 @@ spi5: spi@894000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1182,6 +1233,26 @@ uart5: serial@894000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x3f>;
+			iommus = <&apps_smmu 0x4d6 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -1209,6 +1280,9 @@ i2c6: i2c@a80000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1229,6 +1303,9 @@ spi6: spi@a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1263,6 +1340,9 @@ i2c7: i2c@a84000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1299,6 +1379,9 @@ i2c8: i2c@a88000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1319,6 +1402,9 @@ spi8: spi@a88000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1353,6 +1439,9 @@ i2c9: i2c@a8c000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1389,6 +1478,9 @@ i2c10: i2c@a90000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1409,6 +1501,9 @@ spi10: spi@a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1443,6 +1538,9 @@ i2c11: i2c@a94000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1463,6 +1561,9 @@ spi11: spi@a94000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 

-- 
2.56.1

