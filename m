Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107275;
	b=nlCOxLUejkt1aPsECiqWZdBdrnj5qRn+Z7JTogkPXsUFLpOttvn6GxUUNuhlh5AfpAEn
	 EvmYk+Kb/kT94EVvsK8vPAEPCo/MqHt7ne9BlyDkHoEBkhNS1VYyCTT17y1GmpFLWgQ5i
	 Sgb13lJb7npNsTSsEm3cbFkjyCP5217GpIQra6TYZc9fCryO45hnZUfCi9/kddXAFerfp
	 tpUg0JwYpq/HggFNHZ8F9nqrOJJtJBfqnh972CXWpgyH7LGmVqBbxV6qU94FRpP0+41kh
	 MTH6mrwIWQaKGroJ6/75+lHjceWNyzoOzOv5K8c1cnsni7SLUl2rkRue0KybaoqS6eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
	b=LkJIynnMuyEpwctq+D7GgCFKlr/vWGPDAUh/f+oM641gHDCmjJse1FdnPcaNIF7oSh//
	 Vi6Y1DJpXaWMjBxD3k3fS2cu1+k583nncpNaPYRospv/B6Z/SioJ91TmbULniWw0cGM+Q
	 NOt2vJNXv75I0pBnqnoJxxC17IbRPg5uG8NRukYjgNrr5kFebbRn7486v6wgB/GJWisAX
	 QmgdpdPlGQMtOFWIsI36wbaxYiq3OOb+aE5f+ACwe3IkyxU5jWF45/F5Am1fym4XS/JKT
	 DTxMjdFRL+7Y3Ek2wAaHA/USDTw5oMNg6PvYAs7aYOV8gNGyPIRnQtZhvrY3jQJlyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrx391Qe;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E33A60A6F7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 16:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E33A60A6F7E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrx391Qe
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so19449865e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107274; x=1795712074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
        b=Nrx391Qe8+O8LqOtDCxu0O4VfUEM6BMWsAQwTIo6k8TAeB/r7c7TRfxpIZo1divfz4
         r8tO2cydvdc/MU3hs6payqwcxFAz9jPrmXFLNOdrDAvI3N9j+cXAVx2J2yH2FUrhXRea
         K+jyFhiVfTiha3RQw9kkuX2nQRWcBS5adNGDMSxkH0QsFJyVRSHwUMpxaZxkGUbgDGb1
         6b5CLWS1UAN4WZ2Ws7iiTdWqW1mRUPWrNVKiSTlA8306egVDp8KG7vtlPMrUmECR3+ny
         CjReWy+0X4DMn9i0Mmy+v/siVTSLv7Xb8hx/Gp2kpi1xdliQfdCEUV6OtE2fncCVBnri
         SGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107274; x=1795712074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
        b=Yokp7B7rer0gxmjQSLl98T+xtuU+78wPNVoX9Lvd1kUZgTCCr732/Ji6sofYnrXSgx
         gxXXyqGGW8v0K4jgfBhB6ALsKhrj8EMyZvMd4yKj92htteRrmL5D2ctQnjcO3kTgyrgm
         O7npfExhqVYIE/523qBcsX6JEm+cX3zG9R1ljibo/AN775Qh7LqiXIl48xf7H0mlJaft
         ihf9l1g2WrHX/Nw07rCxA0R+4FePrYmxLZ89BK3Tm4xsPRybK7k4U4iJ5LaeDM2GNHQR
         J8z/G2kI59xUAW1TSLtoifnysieWDPwrLWFizOWyzsJypG3suTOiA8Wb1ltTFL6OUFOA
         KKZg==
X-Gm-Message-State: APuU4Z9QEfA/xcBI1ru8FUMOMtC2Dt9FbS6+9PWv1xm7XjbVoVCteU+w
	n1cNIsCd3x0yBu4uuXLC/2qg4kNPlsW7zYLK9nl8xky9H8WdQpLrUCJZ0tAz1v8Wvf8=
X-Gm-Gg: AYBFou1ENzvoZ1mLa0wra4fCyE3HEXzutIYmdwEQbQ8q8xZwKZN87TkEpD9FdunGVGh
	Bj9/Ou8qioEEfURleOisE4pl0u5FQPU3dvOeiPI+lm/5r9PRsnoKL/JFWWZ3eQ6u2A1lkl9i1BU
	vkyb8QTKnw9GGHpSw7Agd9dDNjTS8wEDbslMKXM5mJWlTSqDXCEy7k3emky+FQzPSFv0U1mu0B1
	i5l/W33Hjxd80mD7YP3uqUrSMbDDWNEFKIIDDiPYrTHXtqevEupuXl2poZXEmafFZpNwpNvJ2LV
	129AsljAt+PUxroy5nJL2lA1rptmLtPNQnv2Jl0Y+vU1i/Z2NCtvRrgreMK4cJaO5VkjPW/DE7I
	I6Vu3r4Giryd76OEP4tP5T7jNqs9zRSzanYMopx+fjHK9f+Ko+90erJqaxKwdP3wjz+5bC+kAvb
	IPmFh3Mz2bGCpTWeKY8IvpQXoG8KhPym7gxKQ6/UzRji7iGF2VO3vL6yK58pDr9VUYpg8zL1M8V
	kySPGi2D5o8/LeeBgAZr+x76IHRlb0uwNa1YdQRTso1ALXbzx6M9qJDHvNrMICLnF7DRlSFMnBX
	gPFZkau7o9+2sVlL5NP4CAoChpVm/3It88aKxtsmCMK23VItE3IkjMqq3/Yz7ykh256Mm+KqH0s
	=
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr2552105e9.9.1795107273824;
        Thu, 19 Nov 2026 08:54:33 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:33 -0800 (PST)
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
Subject: [PATCH v3 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Thu, 19 Nov 2026 17:54:20 +0100
Message-Id: <20261119165420.24466-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 3ce8161574a95..1426ce82d3f58 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -65,6 +65,67 @@ key-assistant {
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
@@ -634,6 +695,14 @@ &sdhc_2 {
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
@@ -667,6 +736,29 @@ ts_int_default: ts-int-default-state {
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

