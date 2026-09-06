Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C641DE0A
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704484; cv=none; b=dON7xip1zk4cqCEmSVZ6aTnnfKsIg7ASjVSTanw7L/nMloCxKShw0u7Uw7NkG2oZDZuOR6k374m96sNdBxRGUvGfnDtNmAVf8AqtR0X7lP/6uV3i8cHvVzCgIvlpKZ8XNlgEmt75cWLZZ1XyMDTQVMwhj3P3kod5IZxMzkI7lus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704484; c=relaxed/simple;
	bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLTu45rBJgP7iKirULHVlUNvg3eLcGku7QfR45MwXmr67Ttth0p4d1Z/6BYuCoJ8g1TEQ0m8MDvzwYsWpnyGdb8C6zPVaLGqcFpJqQI727TAe8MR0/l+MMdRWbUj3SPcEhoaPqPkvA9rOrPtw982GCbRfy2I2Oek0IXGgbf8Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeNi0mAP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeNi0mAP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482ea739de2so1682751f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704469; x=1789309269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=qeNi0mAPulgLZvFvSDLTOJRyVHuPdJWv4BEUMe5t06uNhdPwtcijEo8HXp5Nm80q1K
         G+A5mD3Hd0Nw2tvAuGAwGDg74Oodwiy5H+XHauVLmsASZj6LvaW8HhFqaRaUmbheNNpS
         A3w/rRbZQ7iKiQgKqj6knguAyKEC0Iqb2Ptf2nVfQQQMcctbSsFgzkgLRqImJWFUe0mj
         zOhojdJm22NH1V6CiCsVCSqxbhTpetzNibpxGG7nw8mnSvZ2OpZEvhs3wCwlPcrikxOL
         sIMA8OHUl1Hv+2/kIq4+j/79JYF5TaDIf124MgFQ6SJzpP3dT11eK9ahthyorS/II3eS
         Y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704469; x=1789309269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=nSZ0jbFeACmjzvkd+m8fH8trauTHgwgFbnAzjDqCbFYcM56TQSNozDw5bH0MvopdzG
         laKclDuSai4v8Xlj7A7XvLYRw3dZ7oj51swPun3VNn0sSc4ruZqdVHxrEBqNGe9yB/Ae
         htlSIPutK3JVUm9I6qyP17tMnfYrHWjPJdOA6BqWXPpHIm9T+sdilaE9QUC6+DwwOfUT
         +BOpFLbQLc2kFpSTJVNBf8phqtrXCKPhI5c3Rx8ry2BHe4K8PupCz9p6CsZmM1zD8L+/
         Fm1tIMLw5KLJp7Dff8pfj41A7QKc1vCLivlDLPhvPq58vT8koqzJAyhyv+VuHr1zau3I
         0E3Q==
X-Gm-Message-State: AFuF++nPN9FT9xbxWoRgJtSDjNLTMhWOwe4hFeNzH4pr2YKhSbuqqsjJ
	yT7T2U7aXXt6ptUtYdzKpMoqv4LJFbyLgEBnGr0zmpslL4UQ2YqWa2ZMXgNo6eDd6LM=
X-Gm-Gg: AYBFou3XcYFb5gJEPaDijvHwcS+RpJ5u/AmihTUoGqnOMS47xjwEzKez5te2IoKTPK8
	M0YUAPsRxDat0/2+1BZAF9AzJA5TRA75k+SRsB2vEjrVFW4XCDGXzOCIJ/Xddc6xEg8sBCY/ftJ
	+1rcJs4FJVKVSchNLA1KoD1UH7U0AILaPAm4EhMNSL0utWaEJE33pl4fs7zX9/5Rzt63XTEkEcV
	IYOq5yKDgFrIR2f7rI4WBCt69FY+7494ypg7Iy18RtYXUn0vwU74mRauARfNOsPDeefpJ5Eml+n
	d8SgSEXfiMdNmrsPgF9ivJomJxNZhAv7bh0UREMPeV0Xrm6QD0hnKxnsBuTqWt6NIz1ezMb6HJv
	IEwk+1U3Fz6t326xiNjGIKT/xicOlW5qhAGdkIhOYminy7Gdax4678j/abHA8UjkUQjh09gIACn
	ZIlJyFn7As3bNGgudkf4WmAsRvqF/MCGHRfXFeNv1U0CkAs9yzwsMvRwy4fDs4tb6LglXVV8sdl
	PzB+FyzrAg=
X-Received: by 2002:a05:6000:480a:b0:485:8e70:c826 with SMTP id ffacd0b85a97d-4858e70c8admr13201212f8f.32.1788704468849;
        Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:57 +0100
Subject: [PATCH v6 12/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-12-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbDTJqsj1FFeT/yfRBb5orsdJ90SBzEdVkSs
 UGzykaxMYiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wwAKCRAicTuzoY3I
 OkVoD/9E2+yIeTEe3MqaK1z01nRoleTuJONPR0PMxBdKgzGfVkWXmLVqqOMv5TnF327QymV2MNR
 pFPWF+UkwEequ7Y2naGZ/mdB//5b1W2Tw+FjMNRq8GFObng8V1AQzjXBCCCmFQ2KmlcOyegkVbI
 tZBiNL04PNNwxsnVMNLtQFWUO4w4UfQyl0wi76XIIuTL9qeYSELxrE+fauDdzpmhs0iVFpPILCl
 Q23lY/PGl3ONqvJnuRdPcHLPtQIKtZEmoUJORlxm/mRtQl8Ds4sBg/mg3r7Evv1LNzuOyBaM0ky
 6yNca7O20bvO0IMNmCJ4bMK68/AUaOB5BKuJq5QxzxIngqU2So+vgsrtgRFpL9JOyghXpraup89
 6wqUx+RDJDSd/ab5cquQdxuqiI3U8ko1fjvAA1kz2ja2pUzEyu/RiwtGtUrAeOze6RZTFdjS4m0
 nITWrrulw2EoFpvQ6itud+/HWgE7nBWbwCnHp3AB4/xwyLj36Ug1TGxr8/X1QhdOZS2Ebs/mEhb
 gyTnHpUfKCb/rwTer83cajrAlXJPWpn2X82Vm7qmzL1rdyzjz8624uCIdPP1wWedEFdacOYFCEE
 SuQa7ZBRWfPybw0AwWQHr8AHRTOZCdPpFtQ9VH+zPLNzQ4ul5kol20m5fibaTbHMAAnfzBKK1EH
 A/LF20nlYLfhZiQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bcf3e2f610e66..8290f65f8a70a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,89 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+				data-lanes = <1 2>;
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
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
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
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
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
+
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1494,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.55.0

