Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088635;
	b=wVMKdhY3vn7/TRPMUy3hNUKbkqZgLQ7TZ+30MwA5A3RvXPm3YrOMasc/iePtCVvR78V1
	 lR90mIlFGdfe7Jvks1xxWO6qclpalH4XCzIjNKHnVm/ppYJlyeLEowjMRzJIKhwGkDGjR
	 x2tiKbkg0pH4AURfN/fi+XV3dQN7Y074HKMyYEAGCJGG3H7Vj0yvgzqaORCqkDOrhjCBu
	 4k419JlQeNaZCSNIrIUT8kfzvm2y5kNmiWs/rqArDqOf0rSJ84ZTHI6LsBd1aaIhj3eCV
	 WvYs7NJU2lG5kUEh6PZLrZfA2vJ+lhXlwWNRmmyl6eGaVuNfclRUGx6zD9+DEHWnImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ntimWK9nMQiamVSVjPC/gz9lfx5y+FUcTwV8WAjrLC4=;
	b=NfTxfwJNubfUwb4uNuRFCGJthAtE80mcJodB2srBjC1m0F7zXcO2grzPYNZW7wlbxUqh
	 vqLN6qgzdKZN+Yz8uic1nasLEZmgHlYoELrsAVlrRYkVs4igSUmzq6XvUJ2HTEp6SatY1
	 4yafklW8Pw1IyZ30mG5IVfuxItWk5i1kTiH7AJs9IOqsrfaEmCy2hJSemQspvIekv2YD/
	 bEnQaqUBdkO+9kpe9/K7+zvQlat0vaENzVnx5aR/PeLuuBJRbMgaRnfCImnDf1LpOMD3x
	 DPR2/jItpw+1dtKnR/IGuDsUK1DAG7TGy5n2wJkYLgbWrqr1tPjVjN2/DPA2PPMs42w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fxuszlNG;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85B606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E85B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fxuszlNG
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so762952a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088635; x=1793693435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntimWK9nMQiamVSVjPC/gz9lfx5y+FUcTwV8WAjrLC4=;
        b=fxuszlNG/SKj3HLwGXEREAo/kxLEsawWWlO9cNWns0igyYv+PcpivKmwNNwxZETSAv
         CHSGEiqTlgN7gknTFfM8k9xQXmrkKfoXQD1/iNregZMpyNz3KybV1lygNnZcYPbUuFYz
         ABgykjigxpwM+FBfsDx5Z69xqpeosBBbgRF1ZO3ehrPoh97s+tYwlShPdFIHBDOT25oI
         YhbBERrWO8BbrAT+21dc83e0bkhfJwGDTfIh1oSOiByhMV84DNpuPds8bvDxdjszVOeA
         JLck2Gr3Ii6DUkRF84Q7l6o8U/ToZjReGtey//xuWW2de3/SBj2HSD8IRtC4h/yS3mTc
         zfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088635; x=1793693435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntimWK9nMQiamVSVjPC/gz9lfx5y+FUcTwV8WAjrLC4=;
        b=rXM9IeFwkFQfDkEYoyE1hmU/OqTB57fhUpFNmbuly+EP3w+dg3BARaL/7HYJCH1MST
         8amZMT2BbUOUYq/Es8XL6YWCbw4UGkSGN2N7vsKAcGCtE6CM5DC+ZRox+jN9lOnbfWLC
         SUxI8GUPAMSW+46R80AkjEky1l5DPsE87TqlLaHAoee4d2WBbYvxgvZzPXMw/ALNlijX
         pkCmKoyV/sfByCxeJuih5KNnSnELklfxKbGmBxPfUoipsFq96vJCUyDH72yzvubMlxUp
         XAkPjuQi84lwYnwZIc+aJb7tjwfo1n33ax12FbfuWZZfORs8OolviVHnPvhQxo9nLhuX
         Ga9w==
X-Gm-Message-State: AFq9FYJftwiJn7y8ss/qZ9Tpj6NrwD0qu0rIIvDmsTBYJ73ZX20f2HFl
	RhgT2XM0rSjXce/ow1yLL2kHmyQt1CtZMT3a3XEhjQdhggc3RsOu9X7t
X-Gm-Gg: AYBFou1fJUbIIsai+LVe4ZATvb8RnSmCs3WOazerhImep84PU6D0AwWdQB7O6126zN2
	AZKPdrV8XL0n8XXruABBro1oLxZPyhyWQ0cycSvG8wfbS7EVeljeI3Ohj4zgQjj1By6ODEMAdLG
	rBFs1XumbWh+sY/X0IHYtOXDZi8iY6LjwU24G2435QnzY+6AyzVUkgBrv/vMXAZgvai3lm30Qw4
	WBJHmr2pkQoBSwcLNiQS/180zheewz7jfWgrd0qtj6UlBotkab4OFyMIgBbE7aazrCtfAMivoc+
	G2jd0R5eywsq5kO1UBSArrvOX08FGIT+G3Hb+tJGWV8wU/rtr4hGYcDjQkdwZ6W+5/4BxbxpcXA
	3TB1wamBOF8sopFJsLP38fe21eTgdKqrJ/QLcp9jhS7HP1dymIh6/rHJmH1L3shQnXS5oSgR5g3
	R64A1xd09wq+4HtMXFrFUmonuQd43ARB8s2YrCYFWw8zR/+rspPVuvchao7nDrB3kcH9uQ6AHfA
	W02/FtES7l/iGUTZ1qn6fm6dIkRwE4ShBNCwqkB5dHLEKkoFc7Z8wu/wmzMPviAyhwpPov3+5cx
	Gs8BqLLIPeJRWMOSf2+ZIOG9PtSDC0lyATJhGrQ1BI6t6iU=
X-Received: by 2002:a17:90b:2e10:b0:3ac:7c52:faf6 with SMTP id 98e67ed59e1d1-3adea0b18dfmr7012268a91.1.1793088634782;
        Tue, 27 Oct 2026 01:10:34 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:34 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
Date: Tue, 27 Oct 2026 16:07:57 +0800
Message-ID: <20261027080758.3990418-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a QCA6390 WiFi/BT module which hasn't
been added in the dts file.

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
index 6a7852080..b32f254bf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -94,6 +94,67 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
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
 };
 
 &apps_rsc {
@@ -344,7 +405,6 @@ vreg_l11c_3p3: ldo11 {
 
 	regulators-2 {
 		compatible = "qcom,pm8009-rpmh-regulators";
-		qcom,pmic-id = "f";
 
 		vdd-s1-supply = <&vph_pwr>;
 		vdd-s2-supply = <&vreg_bob>;
@@ -352,6 +412,15 @@ regulators-2 {
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
@@ -515,6 +584,23 @@ &pcie0_phy {
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
 
@@ -671,6 +757,39 @@ rst-pins {
 			function = "gpio";
 		};
 	};
+
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
2.47.3

