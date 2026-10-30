Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323929;
	b=iv4qGzg2w+lgjVGiJFLkIDJp5yhYloFKH6uSGStFi01OtiFPELCcYhdnvOi73xu0245w
	 Ql7RSZhJTvR8JiIh7om9T7vA6gkfFZH9Bc5Cq87f3hgHHRUWgbG0jMxC7HHtqK++xJ4P+
	 HNLv4yFX1v1eKqDWdzTYGbLDUzmYwcpbwBfw3YFlr8xYKQmGgGTaGSeQtteZKXHfWQS/f
	 YUHoUiHv3rYt5+xBJDSdDd4KL4TDyYfF/xFPYJQrEYPSm3URJCFfuSvU+F/f53SfgF0vx
	 aUeC73id0KjjSkj3OWRoqP44jfVcpJ97aYIbLuRar6jI+pmXRIH8PAmiOOMhEFjwxhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/0WNGDby339V70E/3H+HLzAFi9VzdsIJUvarpc+DmFg=;
	b=2VzyKUHVoe6mY4A+ze4AmyZzQk3ZC+ZpmlATjqaFLsVXrojG2VFnNiIafRBpJ0yvYmhg
	 KUb4qttyIr65QomI3IOw73cKP4P4ocoUa+M6K6KnUNKG6GSIWbowC++xYikZfmvG2b7+A
	 U6/i9Ovg6pXuTIU59qMI4NDLqvhQ+n7Z2LVRDWrDSq5dk0eDxS4QgcZto/LzokRbNFDV8
	 13+kKtOipDYIao0ZekqvqQW2FlglCHJerEWDperVEphMlUZZ+YpADicXJCmMDJ4KbU9n+
	 vGV0U2sLW1321mbVcaXb0gIoM2665zdQOFW2G2UmQHL7W/qn8j7RhcY7p0rdHwVS6nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YBxtxvXi;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070D606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9070D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YBxtxvXi
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so1481715ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323929; x=1793928729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0WNGDby339V70E/3H+HLzAFi9VzdsIJUvarpc+DmFg=;
        b=YBxtxvXiAFvoKXfwneBY13gGWZyHf7FXsqt3i9Z3u4Mkt/U3vo88BxOX8YaR6FOtdK
         VMojJ7APIq/qk9sCTB4Rc4yDqN91443iWz/1nocPqDYsY29SkvIyjPVLc/WMcRVlTlIT
         cqyCqRl9GxwRqRhXJhWuhEpOLlOjSa8jApmhjK/mIMbOqj28Yw3593MscQSLKkBZhxcH
         dXvWq6MzQEgbrCuNMhecsEJRDsNeqItFPiXKCHD/LUN/+eEp1l+5n2E+APN8r73EvlKD
         5XpaDwrAL633I0567T40OGB60KejAGphSdBNe0CBkrYFMN7t7IZV7O//lcLojU4MpBxd
         q3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323929; x=1793928729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0WNGDby339V70E/3H+HLzAFi9VzdsIJUvarpc+DmFg=;
        b=qtcBpHo3/EMgitX/wUQ7DTi3zCRcAZpfMXdgJ1K6NBCkUqxtH1m2ghknFOQYolwMOS
         bHlP0zm2ir966eHpttC2c2XrZ0yNsgLfFjiLHCKFeskRTfraiu7atN1YHyvLqr5U5GaP
         K/xdrFQ3VZMBBOqzzIcTL+ncQJUMe+UFFCFmf8EZNYj2p3kRoW2MYZZDMZXyGwR+7i3W
         smaSx5PYLKHygq477o61Twm7zNytNfElXzixdq/mpXZsmVnG5JiFvPlR3g5FbP3XjYr/
         UZN0MBOkexVljqGrj9a8h03bsxhUVpF02lFQFJ6Bft2krg+0BK0VnIGUbYfhYfC04O2n
         4jJw==
X-Gm-Message-State: AFq9FYKRNHyZUNVbApZvuMrg3s7fYJe8t1nO7kxujmQkUtbxHUVzPmdb
	35MF8L0KciP88yDQlL/ZwMqs0K/Rpb9sxdgwn2v6cqnTfkUX7IbPw0hfoQ5pKAns
X-Gm-Gg: AYBFou1ZqfM7hmfHaHL9F4EnSuXLCqe6nddibsocOMUpNtXieQxUSMUa+7kDwGPMcNR
	jYFMNExs3fOLn63e3cwO1yGoMFJRXVN3F5Fo+DtrtT89Sa4y7kvCUeaZuaKSfv4+8DFvToGb6iB
	R0Mzq6rzmiFdZX0HCxrpeAv03ecCW4RQ8cPRQJtj4ab7P9am0zmMXEhOet5KB4G6+OzMVKlIE41
	ay+x4kCQrEd39zrmfsTNl+djgrXyYMR2+HbAr6frWbjnqXRE4cPxyZFE0Oc5JruOiBJ3OYFvtG3
	Qmg/WzGZO6TC2EzInZ2TsqU3nNQ75A69ugdJzjNuU4DeRKHzNLFL/j8RCeP2Hs+tFwV3YUFhS8u
	+7+N4/eMRnQBMy33+qTVuoinj9TIyc38gFAwe1gu/urh6k0+SODOBAFQd7xbpcqM+XsSei8narQ
	r8zq1ev2AoI6U+zbDdoGHI4xyiswBdFlqqXQS1lDWoAzuYIsA8bTSZBFZ/Ez2DQL55Ao2JdokTZ
	R0v8IIDGrlLqlaigjLt4ED+IeAqDLrp2BD8BLjgm2mKj0sCJunlymxmBQ88LRqexpbiOBV3MOdG
	RW9R9sU+Tr1xi2rPwye+ikKXvZHlKIWax1xAbix+hgl0o5SUF1pTiA3vx4SUrMdK
X-Received: by 2002:a17:902:ef09:b0:2e9:b831:29ea with SMTP id d9443c01a7336-2eb1acd0c01mr31598865ad.40.1793323928878;
        Thu, 29 Oct 2026 18:32:08 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:08 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Fri, 30 Oct 2026 09:31:31 +0800
Message-ID: <20261030013135.158157-3-dc_redstone@outlook.com>
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

The sm8250-hdk has a video bridge chip LT9611UXC
converting MIPI DSI to HDMI, which hasn't been added
in the dts, so we have no HDMI signal.

Add the 1V2 supply node for the chip and the HDMI connector node.
Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's RST and IRQ pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 106 ++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index ad60be5d5..9dd380fbe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -24,6 +24,29 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -377,6 +400,72 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/a650_zap.mbn";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&vreg_bob>;
+
+		#sound-dai-cells = <1>;
+		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_pins>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+
+	status = "okay";
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;
@@ -392,6 +481,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -412,6 +505,19 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
 
+	lt9611_pins: lt9611-default-state {
+		irq-pins {
+			pins = "gpio1";
+			function = "gpio";
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio2";
+			function = "gpio";
+		};
+	};
+
 	sd_ufs_cd_pins: sd-ufs-cd-default-state {
 		pins = "gpio77";
 		function = "gpio";
-- 
2.47.3

