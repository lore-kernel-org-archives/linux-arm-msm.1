Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323941;
	b=0TZyCN7zJK9Z7ngIVT+pc+BZrk5GtCc96JEOuCXkOu27y0WdknJc2ZK7I5EAkP9b0yfR
	 dM775sGC50BAYc38HMMmCVh2uE5NDxnPTFjYGGE9g4oVQAfd9sfGsCvM68eShAy1DFoty
	 WA/d/YefXS/+50lFYK/U5066aVHy/4huPkVFHmDOEy1dPIXqYBoXgnSDvet4jeqlW5K63
	 raUtOYnqR17Fd4q7H1YSsl75v0tle4nYY2VryC5ZDox9ICfn8P+pczSOAVWJursuyPaoA
	 piICvC+UgfRBJB4cKRVS0AOamrQNId6kMsKAM+oMuiQJsXM7QBMGXs5O9eBpZGi+w0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LwJR8SmWPzbQS6wnKWhljw9vroJMe6zMXjC6hnIcgfE=;
	b=w+MqslkMk6B+SlNXjHkZyEOnLTT9F+qJ/OBgq9/3kd5Lhj9pz4YBSCxV/va/G59fRK1d
	 cUGsDl/tSzY5CnN9nDwI8Kjsx4hVgw15wDSs/1S4udLGijz+yqGASCbnY+gCIGyKXmEim
	 AS1DiQzBY8e1j536aORTUczh3mkRLWRFSbdQAwHbNVCSoK4r0oMkoAHpFDSh+/eou+XCO
	 nLV20acg4owhYGKMIoSLBOgdT9iuX4bIdGefECxsHh7/NN181RAvgZLJkdv+o8ExtOA6X
	 8wnlKTi4b05T22RlTtWDipzBPOghDqgIp+AdX7P4bQ8Sr9R2MzCQHlHfovfpAL+9bCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXNruOHg;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB3606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EB3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXNruOHg
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso1229685ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323941; x=1793928741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwJR8SmWPzbQS6wnKWhljw9vroJMe6zMXjC6hnIcgfE=;
        b=oXNruOHgKfnX2H4Wylq0k6TKYfObEUIYskVAEBJMWe4UU7gLrANP3DQE4rAfjvKov1
         JAyPIG1VvxbTiG5NUzU17YCfrl3oTGgjxTIjxyemswY3VRKQpSjPBb6c0SlX0Gyqb2yk
         G5qIHyaatZTq/NqOiwdRqaB6Q3JDbVwamyLCnS00N6cZGqES8K/vTRsUQHpvt21G8E7c
         uM9L3zPfCCq5LyIiWgkFjX6h7n8+NlBYPiHv5o5oK6x9LJv+DjMlKPz9LA5DXcDfrBYr
         zHLshibvtjW3nfgfkupE8m0MbJ8xwie1NzWwW0KshD+SZxCKNh3qjNlB8cSFW5rEfi9w
         FFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323941; x=1793928741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwJR8SmWPzbQS6wnKWhljw9vroJMe6zMXjC6hnIcgfE=;
        b=vPw/st2M7ABLLXB2It+Ra94wK0ft1BXqQKn36B+dwWbc1x97qKCU59Mx8vDaCMPYcp
         dbTwDnZtWxSyrU4EjpTDyRaa5q7d0xXyu1ks0P6VHT30MKY6NSdcvu3qe+KbmmTLfbwp
         nfr2wilYN4jccya2axdJbXwbl8EKyCBRYFkH/5DY5Q1Hg7vYQDEq71mY9HeW1603o6KU
         AdfEFDW0ScL3TQY5KAS8ljPpjT2ngZUqzVso2TmaQvwLqmHPpHekMs+UeSruFMtWA/Lu
         EOgefqqwl66p4v4a9xXInjHI3far5nhLC9CebBS3h7aR/xExUWi7c/7L0OjtH8/USWRd
         qaNA==
X-Gm-Message-State: AFq9FYIJmDKNkRCfEPeaDTxdl0dRkAw5bvsioLip0A6S3ODpmPrtW8B4
	ceg5rSlNpD1NWX23QCPUdA7gC8Ps5hUxR1p7dmK0Pw7ZeX46ipLMB5+R
X-Gm-Gg: AYBFou30MJlt6MDnPDZ7reox5TPrf8oFa5d/2fu+2yYAaG5mRuVBbUEPl3GfAFrrTmW
	p6OkzpUyTO0+q+ATRBvF8sLK5ocz/61JNuBQFH+pTFGhoU9GYYygchY8TImKcQdwWSgto7XysBu
	n5NpoN2kD2ebQ6C35N51s/jAtUDUmMNLz/BGcRvZPlxDGzYDLORHQKN1Ywfg+tTfuY2KhrI1ooW
	GjFMAokYGXsxQe0a2yB4Yw/xyxt7IPV/Hj8LTfENV6mmmZ7yWJheuu6yEsy0odtwqyzcroK9QmM
	RHZb3tuuQUO0RX6exNHZGalkZKYIlrRp3oipX9Wdi8+FW9pEZjbxu7yN158xh5JjlCYojuYfpst
	Pdtk5R6VFZZVtDDApAB2lHNkIwVscis9iHrBR7E1jKSzm9Mp80hsZKYvrIyPZku7awH279kgkzH
	VHvgZHRMSx7FNCzDf6+DJeQmE8+THeldWo+e70C/PjtOKPcv6uY7S+jgEG4Aog6kCVd5U82OupZ
	psBZ20agr9j0IKq+vTvYHBoY9x58WJmnI2m3XAu9i+5TNX9GpTUj8SYHX7LDcUPpYboRMRzX3Tp
	TqzxzQ6s5bKdR6wBWWv7xk19A11hfBswJ9MdGP77a7c=
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr9865565ad.18.1793323940405;
        Thu, 29 Oct 2026 18:32:20 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:18 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
Date: Fri, 30 Oct 2026 09:31:34 +0800
Message-ID: <20261030013135.158157-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a built-in QCA6390 WiFi/BT module
which hasn't been added in the dts file.

Enable the UART port of BT, add the bluetooth node.
Add the QCA6390 PMU node.
Add the wifi node of pcieport0.
Add the missing regulator node of PM8009 which is used by QCA6390.
Add the pinctrl of QCA6390 enable pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 121 +++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index fe89af067..f25447f1d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -48,6 +48,67 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&qca6390_pins>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa0p95-supply = <&vreg_s2f_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p3>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p3>;
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -346,7 +407,6 @@ vreg_l11c_3p3: ldo11 {
 
 	regulators-2 {
 		compatible = "qcom,pm8009-rpmh-regulators";
-		qcom,pmic-id = "f";
 
 		vdd-s1-supply = <&vph_pwr>;
 		vdd-s2-supply = <&vreg_bob>;
@@ -354,6 +414,15 @@ regulators-2 {
 		vdd-l5-l6-supply = <&vreg_bob>;
 		vdd-l7-supply = <&vreg_s4a_1p8>;
 
+		qcom,pmic-id = "f";
+
+		vreg_s2f_0p95: smps2 {
+			regulator-name = "vreg_s2f_0p95";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1f_cam_dvdd1_1p1: ldo1 {
 			regulator-name = "vreg_l1f_cam_dvdd1_1p1";
 			regulator-min-microvolt = <1104000>;
@@ -519,6 +588,23 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie2 {
 	vddpe-3v3-supply = <&vreg_3p3>;
 
@@ -650,6 +736,24 @@ rst-pins {
 		};
 	};
 
+	qca6390_pins: qca6390-default-state {
+		wlan-enable-pins {
+			pins = "gpio20";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-low;
+		};
+
+		bt-enable-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-low;
+		};
+	};
+
 	sd_ufs_cd_pins: sd-ufs-cd-default-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -677,6 +781,21 @@ clk-pins {
 	};
 };
 
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
+};
+
 &uart12 {
 	status = "okay";
 };
-- 
2.47.3

