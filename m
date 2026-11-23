Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437407;
	b=vWieHvtbOooM7YBPiDAqVLA4jN0kE2klQTDEjfFFuiNgjXcWPwivreuHVf+4lzHE5C9t
	 UoRutjCArz9IPgCM/JnCOXxf23qEvDIy3tJ2zv5B13qyUKgyASoq1nNgNOUWpdSI6MlqB
	 jtH81kCzYMWdL1qeR+9QWgQ7woiRLJRPLdcRTcHx6Wosfq/1CQJ1ypt9BI063gWT0Zy3r
	 xNgP715+6oLTtCLje8MOkpHJ9mUIcmEg61mepEtT3XBhJfjOFHHedpDj0g+x0drrU1ott
	 fuOOJ/GmAWfLWkWSf5EBNo43fiUzpEs+jWyZ7NnLtjqlM9gKKm7nbC9LreHBJk5DyOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
	b=zhLz9w/CK/ucjLvJU97MgmZHAtxXRwosA0auwotutsx6CSc+YrEbY8rmt4g9pz2VPSrc
	 es9qWNqryulmtQRdYdGaDR/RS88JbDt4SFrdDFmLtxqec4OmisjKcIRFKBVyOoF4jJvqi
	 +iXxWBs5LohV8ZCLvXy5J3DiXaB7+p2G9WiQ8uTfpUN1cIkKVJ21FElXpGgjXPxMcRAqP
	 IFN1HYqCES1GL65G78FvdxzXloem/0PzFI2TmJB4HBkTKLnmXMTw+gZ4LDECOWKGIT5Of
	 O1aJK7JO92fy2Td+olvuSMY5+y7Y+R9my/EI5aq8NbMf2SDHuTqcdkU3Np+sgM2OohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FD60A2611
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40FD60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38190551625so6720306eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437406; x=1796042206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=atlI4xhWUQnHPQ9nkYx3mQO8Swph4K/bleOIqj2B5EWCD+vbxo7zUlwusUjhC8SBMI
         74SAW8d+AsGsQPS49KlhZ3wmObfzg3i8k6bjnLML1v3xvmi93htAIrRa3G5Mt47kUkbg
         8WPcf+BlbVDglyiG/AoRiiYZEv/QbipWZYqJLn/H5MvLp3vLv/WGzFZS8cZZUREwIitt
         q0EFaL7AhpJcMNbXN/xAKAu5BF0Ucd6YxQBsWhUGBV0e0YZUYNlHBOa0Xb/jU4GhT689
         kH9CLaUi8j8aRI+IOBYW7nODAPcyglZclBG0+lvwv1k4+VVdcc2GJXQFBiHF+2emdk/p
         nl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437406; x=1796042206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=DuEP0XHdkWQ7xWGCrNeh43V0Zy5Vo7xCWJwDskVb+IhOxGZD+S1DI8niSPLwV3l196
         PMUgb6XP4jm6APnEqxdmQgPnoFjwUZJgwVKgcp8MQOYi59+nOyGqbaRN+uP4drcE2ePd
         E4TFyVM3bk6CjOoy7kuj9Ep6WtbGKx9zPMbZ4qyxhG27j1YlAynGqCW05+nyc1eFhrU0
         p6aaBjrJ4dbEb3L0ksn6CJ6FqHwIwxYbD5e5DR3c9sYKPwGN9y5J+4bfeSocud51yqYu
         o8g12SjDouzMvQqW6b2ih4EGpy3hV785BRip1UGSCPd1TX0o+AP5vXgNWIXqL+s11Sv1
         L1vg==
X-Forwarded-Encrypted: i=1; AL+hErEx0QcQiEN3xONTQv5NMvV9hTkGAQ/wy1YEx9j4X/Q0qxKUFRv1ddDYertAmqPhXIbpCuAdVzdiAN0Ccejf@vger.kernel.org
X-Gm-Message-State: APuU4Z+hfciSTOr1mR+k95PVBXrtAXKZBii3mh3LfoVZnXkyzcOb+rGO
	q7EtMzMWZh0veCZXZekukGMq7A+EBoRs/E/aawfdYdebdb0srKk7AwWq
X-Gm-Gg: AZFdTZeXoYr2tQwr7y6Z9nzfwfhMOGTeBlWzKpnUeKSQCsfQqDCgEFcKwgSErZG747p
	rjhjrE8DQ1tjjuGAJ08SbxTIG+iJhvZ5p8dDav6Jm6vLzYJpkn5MH7nuHb25prZujNHTCWOzNIo
	nxauP7OqkLUTLPMQahf26C0hGvXGv5p5GAJHInQe1j5bIVQvY0rVMKn1OHHJ8GEnUvQVpSiN8Hm
	pAJxa0PczZEIFI0I9dGtmEYgXdyKaprfklxsJxTDwVpdn+lF6pCfOFSpSAQNxGDfkXg+T64tvv9
	j9RB/daMxR5JeDbtsIdbVZzNyma7YEqU71e+j/rAMLv5RK5ABWcX9FOfDwf2hWkg+PydZYdRdMw
	ITq9tfdB0ic5GJIY20+ALEKvYWgbpiSMuHEsn65zkv3HFyTzR9nw7M2YfAaOfvtu5U3oO4Prmkx
	OwjqvxD00GAZKuXSGEQNDc/VIaIdrOJcVeeYQFYyhThRgLf9ltwrAdn83xRp1RDHbx7hz5VX+J4
	iSMcy95JV5UWGATJILarjxbLHg54De9oVyHAvYIFBFwC8/Kak7cQNPc9Mmhjb04PK0DMOAJGjA8
	fsbXTqjjX8O4RyJl/F7/mb7yBykmSqG3OwLyZ2V8xbi3IpuJ08XaS1K+6uDK4Z8wOUw=
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr12986753eec.8.1795437405845;
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:46 +0700
Message-ID: <20261123123546.152162-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..5d4fd7f42042 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -308,6 +308,20 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39", "gpio62";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
 };
 
 &uart_0 {
@@ -325,3 +339,103 @@ &usb3_dwc3 {
 	/delete-property/ usb-role-switch;
 	dr_mode = "peripheral";
 };
+
+&camss {
+	status = "okay";
+	vdda-supply = <&pm8953_s3>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cci0_default>,
+		    <&cci1_default>,
+		    <&camss_mclk0_default>,
+		    <&camss_mclk1_default>,
+		    <&camss_mclk2_default>;
+
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera-sensor@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+		vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <270>;
+		orientation = <1>;
+		status = "okay";
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy0_ep>;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera-sensor@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <90>;
+		orientation = <0>;
+
+		status = "okay";
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy2_ep>;
+				link-frequencies = /bits/ 64 <418000000>;
+			};
+		};
+	};
+};
+
+&pm8953_l23 {
+	regulator-min-microvolt = <1200000>;
+};
+
+&pm8953_l2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1225000>;
+};
-- 
2.47.3

