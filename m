Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D576D4A1E0A
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519429; cv=none; b=j6MdCfvu2gRMqrXlNKW5U9KP8Pbp9NS9SrpZeDetekFrHmS6dyQ98hAicO8b8EEpslj5uw+IUB3oPbBm4IJ6yRZ6R+V6oTnd5U4lnhKFCIngFDbbrx4FVckqzQ9EOUG9LqedWevPjk0oL3cTFmwdA6d2svRLvlVl1fp5o2ojq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519429; c=relaxed/simple;
	bh=bZrLMcImBykx3oRRK3HVVood6l6S2lGXu7LQOJWI3H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7ZH9znEmswWBSypj5pCJ93V5YKGSzMq/N2I8O4kcaGH8QW8WahEL8HA/kBmdj3TFQmTK9bx3fQhkGIYGZC7OuLc8xOHNJTTEfLyMOfdFNFQ4GMzAroeYITopHj4f/6Dmq8DlnvDlSBAF9G+yuX7J4TBr7hx8EUh07vFOb6wuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQX16WaB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQX16WaB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so9945375e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519422; x=1789124222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9q3cb1HRmrEaFH2Sno52PzoSLUWQfgcsQ5S1xcRpY88=;
        b=QQX16WaBqriZdh16HOIdkxn0IFyirjh/3tPEGTyJu11h0c0gcUnFe5sWw1QCZ/xIUn
         12E9JJjJeU5bnWxOTrL83USINWZkXM1Dpifx3GGPUX0ERV5kZpf6K74IpMG3mtye6hIg
         MYMZJSj7vZ8g5zr+nr80xHuCOCXVM1nrXkp+e5y23JWSUtQt5gTDpqbFdX86A8HG6NTH
         TeffFfUjjcqO1+mG7mQ1c79CJArwO8/PE4ayQs/jm0eYObPti9q+T7TYvudd50YahjO+
         tdVA9LT9edX247AXQo088TrPfIp3w07avx/yQDNxOYt76ar0fsefshGsptIzJhuWmmnG
         trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519422; x=1789124222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q3cb1HRmrEaFH2Sno52PzoSLUWQfgcsQ5S1xcRpY88=;
        b=FQA6NXhArwtQQcw57vLs8ONdepnPVPJ8RqYx2rOFkK9Pd6vZ1gOc/B+JdmNs2l7WZi
         yp7VYVu1A6lNuyF3QpdwnbAczZFjOeFuBbHKooSXc5lqobQFdPautdw/L7RaZutC2kYC
         EUYwIF5MIq4R/TtWsZbVTZxEhUjE8CQZaTCrqkYhON/HuM6u+QwmHNC6MrE/UXo7joSb
         qdLkztu810Mn4RFCw4CTNuFQcp1yFIlq4GlMRtVLggo03mNI3sSz+O6V36BYdNjDqrKc
         XjLLPuPU4cWiZMeIpNyDpsyN0WmK679d4rgS5CnLhMcgnhYpp46EzzfcepiAWAZl1zfP
         0kqQ==
X-Gm-Message-State: AFuF++kOPIBRGAMJgvjeAtk6krr8IPnDm3pgeEQiYauoNBpE1Wvz4Zm0
	4153dqYSBEPp4Vfw7gxKaBEmgNRpc0k56F1QXZprWzRcuKeAhZtesT9eHlN1jW+uh+8=
X-Gm-Gg: AYBFou1dOyKHnstxpGmYb6Hx8Fy039j7Z+w2sDOzkjVaFjoXHwUoXOk6Qlb6v8wJVP4
	eNj0ERJaf0rWU4Bp3C1fCuaSpTmaryzXRNG9M73BgzCQaM9cuw3LY00Hw3/tZtYoJxR2d50kwD+
	l1gV8ahuTu/dOLAMjA9S0zLOCgjzZRIjphcoOZFgwbRy2KnddQmQdkFtc+hA/uWcoToSSJgHqrV
	SGOqpJeSO2dDXIp9H0bjYt/RuUirDeQ0Wth4yGPGOx5UoJnlRnlPDWhi/2Vikwngh6yhQh2zt4y
	6lKzpSQANTyg2hnl+l7vlFHSd9NmQZ9UL4o9pUpmpUtSwor02YW89sTHfQVQhu/Ofvi2cNZF1rV
	Eox7N1zwz0oYl/Jc0SpObbPutoOu3+u3FviT4wkYYO17Hp7VPmAa3MDoAfwMaB3jKYP+AOvruVS
	fvEVHfExm3+Zl9JW3Kqxn5xn84f5eS3gXwyN1nW5Y6SUP84pLJL4TDjzfVMMisxbZkBazzku2o
X-Received: by 2002:a05:600c:8b09:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cf823f57fmr88570735e9.10.1788519421540;
        Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:45 +0100
Subject: [PATCH v5 13/13] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-13-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=bZrLMcImBykx3oRRK3HVVood6l6S2lGXu7LQOJWI3H4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPplgz/ddFP9fKrMGKohvRQDmaTVdX2mg+Bf
 g3Hivg2Xs2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj6QAKCRAicTuzoY3I
 OobQD/4666ZAH+ofmP2fKuH8xGv8qMu/HlOUaedLayTC8HzTkGVwrQ2nk9Xfz2DF/aQueH9Ry4+
 WBf270VS1yqP33BHAj9nd2/7JUXkwJxaNzGmxfnYgkLgojapETtpHcz5t9Eq7fKs/ZIfQTVmWbW
 gkPGaT9aSqQjyuTWZ7vzDvYG0lHtEaLjEYk47jxiR0AjnOajZnG0Ijm1zGLo/M4ysJ2hyAofkqE
 kZiRqOZd4887vucVlPpKlvJ4RztocTf3/k3rW28ecnyZgv6izXM6QDSaQiV8dZPsfIal+fV0tnr
 LgLPiT7508sz6s41G0DBpcgt9N/41eT6DGZ/t7WACT/R3E1n6XIwF7YPd3ogKp/xqeRrZIJ2vf8
 vZWPgctU3KAlf8Hj8U7JYoBAO41eChNnMrgGHdkJtQYekxTxKDKliqYGIwaoWcC06mRYjiNTPee
 /EPN0CqO+tdokiFNKWP3b/c1R4d2felcCwcJgxhpvvGNSwgVJye3brHv0PWiaXztimxrz6in9gZ
 WbxP1xRfIQ1po1XYTOrHyW1S5e/0oR5VUD0/ST5Il5W425MKYJA5hTzf78r/MueztXfZQL0mkSO
 TE30qyp0ra8hsvq7JNrsMRyx8FdgGtE7f6YPehqZhT9PD1S9OYUFwHEDX3nNt9yLB8jxwSKbqJQ
 d/PDTYQj2eqJKaQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..e92414533d48f 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,87 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

