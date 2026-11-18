Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003649;
	b=u03109FSrIgcdYu3U2Ioy9hdSxyc+zbC3ASJH7X/mH9qISVAlfGI8qXMEeytL48V7bNx
	 vT991lKlmgTVKV1LKyabgbobBuvS1dHlU1m0h1D2nNCw21YJkqCuxoVvx9Tw7V5STLhTp
	 OhvgRDlFDx5m/KR4q2+i1fH5LhE2oPmhDbQUZXzVYR32rKEnUnMrNMnLzGR4G3t9W/34B
	 R3ofkgj+5h/yyF8H21fnSbSMi5OSU8M5PCWKj7CQ1iqvRCV78JtPAOz+WDKCznSSY0uFD
	 FtEXou+rme4woTozWZFx24JNPMqZEUOWVplv9tMiW7CUv1MWCy7/Bctkw/SwvJbnRJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3RiYetiebufQr59c1XKeWhbsUwEqVSkodNc50lBB/z4=;
	b=Xe4kAahlnembrmEohH0VkGPbu83e1M6/TvERzedD2eVoVwSn+6+XuRJuWyFqQF78HQPD
	 MwBQb0dQRVhj8bZsIqkGmgMi+DJZ9+FKsp2rv1umajugjwhcIDDfEy1VrWP4Pr9RroMqs
	 tRi9nh/H9fuLWbHg71fmzMqxjmiwb3nKAwK07qEeUpGC5XkOQpTfNcWmopx4fRN5tZstT
	 ArT8sPrfRSmlHS2mNEdKRe9mT1W3D8PcP+q7F+oFWKuDKi4fMU+6eT5e7tCl8giIwBVPJ
	 Z7fNPlMeETZm7xGqS72GccZ7gShhik7mYb5t3/W+2Mo0F71sIwo16dEa/tZ9cyBgnxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbz4eToF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990C60A6F5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1990C60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbz4eToF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so7147525e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003647; x=1795608447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RiYetiebufQr59c1XKeWhbsUwEqVSkodNc50lBB/z4=;
        b=jbz4eToFtbkmkcUjSm2s0E3wVNeRhz0CDifw3wn4or6WdNIk08jOTUaxblKrLn5VcD
         FTwP1k7GqdSPFnP2nBhEiXUYVJqQ3y/mY4HFGaCVJ19HlDsTxyLs0UOpxniALFEeWijq
         fca5783vNEPVW8FKdqsyhQN1dM06fA/akUSpV4tB4fiiuk1NESrIqIzeRNSLLBQxWrY9
         u9XYdjmlwfTmTu9YxuJ79GthES2zNxaqhBe2dCwqdcKR0I5hrSEBxc1gALwjtMQ3ML1/
         D7pcf+ff/bna9PSW4oTXdTP6gMJJtvF3RW33CvpXyroktqwL2wYzCUQlUPN+EQSrqj43
         WxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003647; x=1795608447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RiYetiebufQr59c1XKeWhbsUwEqVSkodNc50lBB/z4=;
        b=PDixBPUfkUy8UcyT+F4TtVSzywCnayJ1vIKBhF8lSV40+6GcKc/se64DnQwnj6REWh
         wp2mwXJMivwZxxnX+qV7dILGnH5cS95Hdcn5s2DwoEm+bWiPWQmZwQVX20xOWiYhX/js
         lVQonzwehT/4/dvnNMt0PctECbCU5fhGf2712qU9D+8aL8KGOPyTWjugOFaUE6nvOYKA
         UTSKB/oPKh6bHBxT0hhgLMP1QqdMW/QNDjFL0Lr/HghEn4SuDp4Ho2tas6Gf4mRuZco1
         0+0er/jgqgNiKomeXqWbM0Y81LKTC1bZ9zW9Tv/Q3QFBT/6Hi6gdJZ+4imEddOqwA0TS
         gZ7Q==
X-Gm-Message-State: APuU4Z9jxLwvXTQVKNY0+LKEP47FCI/ZFJ4kU2CtgH4Q76NXRwziVEUt
	ei74CCW0StSFMYuLWdTLjFyqSkCjiFrb5y1wXxWOja/AM3sWbqChSRGvNRCN0gmJyx+LfkZ3
X-Gm-Gg: AYBFou3/6yHXLft9/NVCj9EB2TugvjWCfTu8+Ba2OpYIm3g7Ac4RegHuHJUs1JqalQI
	y/7haL5Hg66sSwJF661ewWhXcSM1lE8r39TDN2Y3iBNsvArdENA5rHqYyZ5M7OnFR6oJxc/PARi
	w4fsi/O9/0X90gEBK3ayohhPxDvQ3H4OSSKLqdWKYZFYSSXfwYBYT7UapaHU+1LPOdFf7MkBerc
	l0YlziyMSIqHnzSTzd0cJ3/YjqU77n5185FBA2g9zUVx/XgjjMaZAAVb6MU2eTHK7+krysPQOIj
	3/EmTqa0UUyeQQsNPYP/9kIC97gaVDQjdopvIU0+3b5+a25ciAsNTMMblTT7AN6bttZsIy22CQX
	UOEze8hieIARIyT4srl8umreQahcao4zoMU1VrlFqGGMZ8vj77nsa2MY+gtu9VWxq59rBzgek9p
	ZJXNPgMUIzw1sOCgsgbZ1LLTySuyoLPE9zfpFjB7lrNdN6SiNck7Kl/YxozZDRAmjf8zhHsVoco
	BW0pGXDoeTWcDeaGWN36xVO3HVhdPBE8lzskxpENniMY31grNw/FVj+uOfGPh9hm0W0Zyl8YYgu
	Seh8qhNrKNGI0DGz+2+GtGoFm7E/UWeHZDsVQgg8FI2LUwxJReUyUPyAjQEc/yUpaAsZGC50Rtk
	=
X-Received: by 2002:a05:600c:474c:b0:4bb:6a2d:b426 with SMTP id 5b1f17b1804b1-4bb7d5d40fdmr43108495e9.1.1795003647402;
        Wed, 18 Nov 2026 04:07:27 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:27 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Wed, 18 Nov 2026 13:07:14 +0100
Message-Id: <20261118120714.31505-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer with properly voltaged supplies
and enable Bluetooth HCI on GENI UART6.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 12ca5ea921fff..3356099696a5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -67,6 +67,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	reserved-memory {
 		res_xbl_uefi_log_region: memory@80880000 {
 			reg = <0x0 0x80880000 0x0 0x14000>;
@@ -639,6 +700,14 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <40 4>, <52 4>;
 
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
@@ -692,6 +761,29 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
-- 
2.39.5

