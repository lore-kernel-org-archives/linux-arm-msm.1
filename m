Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323935;
	b=A9Vbph9LiF5urOVuOxG0gO1DaJbHJKkhpZefPonZPQ2FIaT7bavDxC8IGH8fEhkgC+Hg
	 ICETJRR0IRj+UdyibkS/1fFSdS3K+ttLWEDToHaBQd05QV/wznLc0wVIZpPgKtpwirLnX
	 Is+n4OdSVXIFSOge5QEFNeVmBakQHpJ1bImClppPKDy4kI5JH8HzccJFOtxXsyx944OQh
	 B+Z/LRd54zxC70peFlCtjN6hqsFvKalF6WZlGmCNTHZp4wxyGggk4SIFEQlD0HkaLK51g
	 FjZ2pG72TJbm7F0m1yBYIezIL1+QWegQ6EZlvq9S1Wv0QE2VW/Sx+D+Zkq63nlwkVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5QGZcFpZgf8ttlAmgJ4zukB4qZXyiXpWWujR8ZV6lIA=;
	b=KNZnX2wzAQ6nVzkegnsX7ie/OH2ck1N1mFzL2LGztZeOeb3OpZRnGumQJCw7GYs1dNI+
	 387m4V8GU4GWDmGsuXf/Eou1XwYe1voPw3DSJHO+gZBY3YJrfGn5LXK3FxXK7+4D9F0NT
	 3ECuHFHCqWd9APVRHkA/fYroCFA3Dub0wpuzXy0TIE4cs9VPkGkisAKSKsFOkQJUsokhG
	 LrIrRTMBOztLIAPkFGCFvMTM/5Sqz0iFVJbtd4eGSx8nWQGPs3t2PJCfs6JnVdHD+5qoL
	 FAt5b6zG9S5NzxGm719FOG3qVDyD49NPSkCJ6O0IZw07K8uJaD71zxeixDr4QCUNqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0s4lQTuD;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F172606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F172606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0s4lQTuD
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e608cd460eso1154435ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323933; x=1793928733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QGZcFpZgf8ttlAmgJ4zukB4qZXyiXpWWujR8ZV6lIA=;
        b=0s4lQTuDD8b8qe1ccjkxSVeSpvI6q5vYLZh0CKaEtoQ3B/TcCLnLe3zu93dsWXTIOm
         4BtLlGdboOwnP3xH6h3sfHbbsspf/pfrcVoLhPgf5CqiIdmXgmqdvo4YpBWLddQt2yB6
         G8aSxEI360elLGe7SuY5+o8BPfCcXAQOuC8y/J910gyLopScmJ1C6rTsR8VYMPICLjAS
         Aou5bwwAl8MIxWW9NRKKE6cNRfAFM0TwrCT+oz/lDuhn0MShlaKoxIAYC2X7YiEgOsHS
         mcEKcy0GscUL8sbwWjZ/tk8QAsPFxFB7x/HIB3Fccn4XvHpR49udUGXr7e7Tg7tB8B2D
         +WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323933; x=1793928733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QGZcFpZgf8ttlAmgJ4zukB4qZXyiXpWWujR8ZV6lIA=;
        b=e8kFS4+msG7BiJXmfx5GUVKTh8x5qMuJSeDPxkkh5ojst0LSzs98Xb147hJLJDieVU
         tiYAz4E9txMW0S1tPUIFmbsZI/hUsFM4fiGXZEDvj0MyWx6DsnFn8yKG8A02nbML23gi
         UyDpQKsd4rnLs29w4/oBqGGTgGUxEq42ypZedbgQrtMvWJ+oMqzCIwHiPr/OjYIIIMQq
         kyEsJyO7OCS4PcADiNNNnbJtPzH6feBpxNKiI4v5SHsBWOB4MatzA0yoFwKu3JoBxTdZ
         751HBjz6K3Fv9dlIrswaIfB/AdD6z03TbdV9tW/5iViSkvHhhLF1C8P27Yq0KAX5hAhj
         B1MQ==
X-Gm-Message-State: AFq9FYJ+lkhYMJLGD/iElLPF+NhN5qs3WUThOU56znsoneUdt7pFmQeP
	Qfc8CnPSnS5vUobXLey8b0z7HNadVpYBbe7FapAA5C28v3TesbN4gPOfEORJ4u89
X-Gm-Gg: AYBFou0w9ll7H5oejBEB4YU3gHgKSk3S4cZOJvUXxgDm7PQ/TbsRp07rU56JHhyrMpF
	W6GILual49h3kzOHjnaP0isa9Rze3WMRT3/NRohxh0/4xkfke+KUXxlXNwdatc0BNK8Lbf04pXO
	D0CoidXbyq7pZXeQhoNMKc+sFtW44aIUNLZOLkpZYNHVhSJQ9s9emUTrvebw2To1nbeshcd5W4b
	4WGmMi0p6pe4C4R18PiXAWTIL9sYyhj19tYk5fy11VvULZVUVPLNlOirgXFHzN7cfgSqyhILAsO
	7k+ONnAwObsCeTvY1O7cDG71z9AlijoZFT06vc789u6c5r7GEqnwHFudJ3f1DSnQwVAfqns4Q/J
	fxW5Heb85t3xEUA0cHVXWMy4+cm/3FVcWa4n1TUBhwZc9zbpngkHe0e6V38yl7sYc+5PCCkfp0W
	+D+gEkeXX0nvEI9wDmmBYgGtwwRE3iYhPk3aabY8cOgRxd5Vx7x8dTJyCWebcuqJ41VpCEO+/mX
	LCM3pqIeLKMQitbabTHc0WWj+UtmMJYrIVVVVF7KU1V3RyHVqqlIvcKlXaDK0kXMWJ2Z6kP4G+d
	va3fB4dxqhUYvxgNd37bLYA1ujS8ZwQ+CaF/W3xWKlaR6Lz3h3WYmnln41fb+xiU
X-Received: by 2002:a17:903:388b:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2eb364b4deemr8399945ad.30.1793323933299;
        Thu, 29 Oct 2026 18:32:13 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:11 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
Date: Fri, 30 Oct 2026 09:31:32 +0800
Message-ID: <20261030013135.158157-4-dc_redstone@outlook.com>
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

The sm8250-hdk has a USB-C port supporting OTG and DP altmode.
This is implemented with the FSA4480 chip,
which hasn't been added in the dts file.

Change the USB controller mode to OTG.
Enable the i2c controller for the chip and the dp controller.
Configure the PM8150b type-c module and vbus regulator.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 142 +++++++++++++++++++++---
 1 file changed, 127 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 9dd380fbe..1efa9d53e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -445,10 +446,42 @@ lt9611_out: endpoint {
 	};
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	fsa4480@43 {
+		compatible = "fcs,fsa4480";
+		reg = <0x43>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pm8150b_typec_sbu_out>;
+			};
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l9a_1p2>;
 
@@ -466,6 +499,68 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm8150b_vbus>;
+
+		source-pdos = <PDO_FIXED(5000, 3000,PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		altmodes {
+			displayport {
+				svid = /bits/ 16 <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&fsa4480_sbu_mux>;
+				};
+			};
+		};
+	};
+};
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;
@@ -489,6 +584,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
 
@@ -567,14 +666,20 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
-&usb_1_hsphy {
+&usb_1 {
 	status = "okay";
-	vdda-pll-supply = <&vreg_l5a_0p88>;
-	vdda33-supply = <&vreg_l2a_3p1>;
-	vdda18-supply = <&vreg_l12a_1p8>;
 };
 
-&usb_2_hsphy {
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
+&usb_1_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vreg_l5a_0p88>;
 	vdda33-supply = <&vreg_l2a_3p1>;
@@ -587,28 +692,35 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
-&usb_2_qmpphy {
-	status = "okay";
-	vdda-phy-supply = <&vreg_l18a_0p92>;
-	vdda-pll-supply = <&vreg_l9a_1p2>;
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
 };
 
-&usb_1 {
-	status = "okay";
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
 };
 
 &usb_2 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "peripheral";
-};
-
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_2_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
 &venus {
 	status = "okay";
 };
-- 
2.47.3

