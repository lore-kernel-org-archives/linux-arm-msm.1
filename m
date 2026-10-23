Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740581;
	b=EwJ9ueKrtVMxhJuG+88wJIU+nayp6MAQ5VNm6poj41tMoj8fn2kod8zyrZAB6miF+NdU
	 +3OpYYyAf9+sztvN9dyBgp5JTQMfNk4djGStLqc3wCDmhY9pqStMZFVx2KJgOHBAikf+h
	 +Le8Zeq6DsA+XtejVUFdr5WUr352nYXKV5BQ5l59I2vLRgQVXiyVSRUlUkWLc8qhghSvI
	 /NEeK60+T71zsrSXIC2I582IPGcwJb2u2OsJsbq24IBvJSVvQHsozj3R/F/5dvurEqhHX
	 +IFYGTUIqTjMc8M0FL2YDWXOhaU21T5QeQra5Sz3CD0K3Y7kbTSvXTJPopgLNCwOSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6y6nqDt6mAJiogSVBxweWlKH7MGDfWlUgG68zfDz828=;
	b=0R+4uNKvqpdSU9CKE3tsnvC2xxZDeTx9lOQ2BEumG5UMgwsXhU6vkR9Nuy447vcjIBJu
	 egyJ4baDJDIEXITgOpoKHzQt309t9pAjck5kCb76eoY/hkY6Qq5Dv6QB4jG0oaDa08NrM
	 CVcRxsZk/8ttxF65D/2GUG96xMtAbNuDY/l+brGp3i6cVsDi9r1r17hvpnL6mrGLbsi/R
	 NOIsBiEfDeC6hChjpJpVOl7s56GjClCsYTROMzd6kExZuU0SThdYyvprJWTOlw6QzWgpK
	 GSKJGnybbQy6G5KAgWyw2glnHD9RdfzoAru1MWjBlRbtur9fcfzwCTOudNIeagDbJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qMCppTvp;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0CE606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qMCppTvp
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e946155442so4269015ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740580; x=1793345380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y6nqDt6mAJiogSVBxweWlKH7MGDfWlUgG68zfDz828=;
        b=qMCppTvpDQHlhRWvcke/hUNaLrBjBHXgBtSbc2L0Idow6+auynJ1X4uiZKVPfnf/ng
         jYluPsBZU7TpiFvCN58Aft+i5ITpuqGa1zVlCOyAbz2eojxNHkbMXALXGmOPJ3sFAB/F
         4cxm9jNDNpbqvV3Iq5v4VnFeBbdOJ7xkJH2S9bi1Ie3LiVMCaunHH7yhrDwb5RU8VbOA
         EAkMaHkG110c0fbNhiiDhn4wXfhPzzDuHpdSOD9EeA9mdYE5K4Gg3a9YMm5yIJYiOIgx
         ohQC84rjXK6x8Nuaemj/KfMS3IqOQ3WgcI6Mh/WUEneSKosVjWasANfnt7DBYOlyczfz
         YrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740580; x=1793345380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y6nqDt6mAJiogSVBxweWlKH7MGDfWlUgG68zfDz828=;
        b=GRDXVqJN2Prf7pCtd7HQwQHTksYb8FfJ6REsdbj59slPkWwxS6Mm7ZuwEkfFxYZkUY
         ach3gawTyzi9LKfKmo6mvAiVWgflQ3R5a6QW9KvbKaEJU2GVjvNq9T8vP/xPZ3JvAsPh
         wfC/fL3956H/ZtuvsNCIAgZUblf+I87kqRVp7AngsqmHaurjdG8jKSK1GffAIcXwOMyy
         zTsqKKkFDI981HmF2HgQgxIl5li5RKkRUESGUEn+HgyiD7OEqo2tgotXl8KuRWyp6LoK
         wOVZ1JLd8F4DMmIWq/EnkRPojY+DTA5EL8W/Ra03PRT6aal7yQ3ixvgP4LV53K+skYlc
         XZvQ==
X-Gm-Message-State: AFq9FYJ0ngEoj+wb9uWi+JbBddqAyZUrBUpU3/qkklf1tzxnV93O1L51
	wdGGHpnzYqepuyuAkxDF7H+5ciR+U+0iatiqgcgHLZNLqY1WldxVRU9i
X-Gm-Gg: AYBFou0tWOz1GI0gq0l23eRCIhIHJs/519UtKS4mkq//wE5/0WrDY/juzzxuBZTqQ4H
	+Y4Josl3avYcQHnM2RMRvvYYXLC108Dymtj5fNXPueqIaKpov8JKhm8ciaCEKAVmfeNNJV3vRAJ
	FoTQUGzCX61rqVxtJrOzzMDOGR1BfUEotqyaXXmWbqW83hnZzUATQl3sFGHQdR+EmcPiypDXtdS
	0DTA/Quh35hKZJ0RFgX8uosvsZji/uEZ4xGeH9TUy1iRUBbaIzF43qVK1br0jSaJnv2qVVTwSI2
	ykIllnnlg0Uz5YC3QWXdSxeyEP2q5d31OdxoObiSj1GuibstzThHIJsR2mHccrA2GHxBOOF6/dq
	RXgecT/aGvgkmIaRAxQCeWb+roO2XmdmJKCQvlTQd6+VfIJtf0FnbTlvYLAZ1GEmg9TKOcSsrRS
	r0LgeufFYkjkCK9S9JpB7H8UJJYl2QUxRL1ZkzXeiDsrvIcYkAw1p3dVd6qQB98lJ4/RhpmZp0p
	AYZGXDQTH6X9FSd2I3i7j1Z9SeB08issAfY/Le9iZ2zfNT1jibzHN9hQ3yi2zxxpQI7DCN9XA==
X-Received: by 2002:a17:903:4b50:b0:2ea:e24:3eaa with SMTP id d9443c01a7336-2ea7cf5d74cmr15224975ad.2.1792740580515;
        Fri, 23 Oct 2026 00:29:40 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:40 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
Date: Fri, 23 Oct 2026 15:28:29 +0800
Message-ID: <20261023072832.2642647-3-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 113 +++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 0bc946682..7a2903941 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -415,6 +416,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -509,6 +514,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
+};
+
 &usb_2_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l18a_0p92>;
@@ -524,13 +533,18 @@ &usb_2 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 };
 
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &venus {
 	status = "okay";
 };
@@ -589,6 +603,28 @@ lt9611_out: endpoint {
 	};
 };
 
+&i2c15 {
+	status = "okay";
+	clock-frequency = <400000>;
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
 &gpi_dma0 {
 	status = "okay";
 };
@@ -597,6 +633,15 @@ &mdss {
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
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
@@ -611,3 +656,69 @@ &mdss_dsi0_phy {
 	status = "okay";
 	vdds-supply = <&vreg_l5a_0p88>;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
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
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.47.3

