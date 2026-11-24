Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529961;
	b=wy1bY1O5xs/lPmt/ur+uKWqr9+887S1yz+2u/ZsK4KSX+yNSZFcDjRD2XIK60nHHuu8+
	 9pzTE39i+E/vBporRwzSptiY09SXhhAz/oIWxN5W/PA9ytUWkOUKJCCU24Lg3K6grltKr
	 eJWxx/EUG2Mur13wNv/194nemSEWfR/sI4JaCuTKyMZ4NSKF2d7FehnLbEXB/xydM9w2C
	 WxXiKoJPvIYzQrKtg+b3wgoh0xZO5NF4nAA+ZA6HDv9PGNrf6UcVM9tGgRY7o1gSn0kc9
	 n4q3eXR2S6BjEhD2Y31tdtQFWlxUoUbUOlbl+GigZgLsf6O8EDzRS/xB8tS5N2ozK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
	b=g6oAt5tbR0c/fohkdalcQo7B9K2o1m7gatVkZPW24vgmbTRxiRcuFyhQsSw6ngU1Gytg
	 vFO3DTuFo2SlmN/UDZFcEVSIKonS4GfsUqQsMW88XP7+zjka8pSq+y7MwV5Gqws4hq7pF
	 ozaOkTzdyQs3mXGs/Iloq+xW2mriTKRmXtqC/b3wPTf+7RHtTPLBJbU4d2fa5DA/ube0i
	 QlYKdrffzP93w14JsQ8xcsPPC1FXfIldpBgdNJXiNSxE8ZKF9qeatnxwhfBXmT2cMSj8i
	 tEbfGFbrhOZ2Esz6bzISVmpWXxQf5IlU5wM80TwU0Wf9j4VMQKaGSlPPrlkMKzGT70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M33AeBIY;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1242606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1242606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M33AeBIY
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c506a231b88so630004366b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529959; x=1796134759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
        b=M33AeBIYDvRPE67RKe+HHGYm2nB36PKYYTO8Y2ljIRHeBx9RAA4Xee2LdX6hd24fKv
         1SFaVDn3bfldC/5N4Mxim7EmGaqf9fjo7tRzeM4EesYljDDJgRpBE3KRISAUSa/zGOwj
         Tu/YxtpuhGMofnUxR97njtxfskbmobrSEuXoG+hzYJ2miF9EzRe/MLX1UZ7nKR/dBR4v
         2+2I+HxV4oPkTghL74bEGaDnuEjujVXCRf7dLWB9w2H9ftd/sAqAKZjzEFOHpFLBkglJ
         1u/ck061OvE79nrYQXEpUgcisxTS1VNR0m7IyzNw2W+DrJZ9M2/BckeA8MpFtMHEWyhL
         7fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529959; x=1796134759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
        b=TosON9DCMVH0tJHjNj+M4WdNc6xm/+hme5yF4f6BYYPd1t8IbCib7NITp0RaqV4HxW
         OhIYxsTsy8uRHRGVCUW/iAegg1d+Qk6+ZnAQ/WqjgHdgxWWXBKMDdLezof6UZCdsTfaS
         nRRKCdg14AHMnQw6UiQc41DH31oBnwl6fRMHtNQOOxVD8Fhwnj4sMc9q9xOJ6YtNhH+9
         ximwpNEZTLDKtwfgSpNA57gjtUBBALV5cZJc6yEI2S2pMSPh8nNIEAMkKQ0tauImAWlG
         z67Nw1nW/hVbL04Q8ugCyxoSPR8z1AauFjJKdHTA4BgRwtKY1l8xFH8usszZ5Mj37e2/
         P2Rg==
X-Forwarded-Encrypted: i=1; AL+hErHdtV+wVs7ksjXh/eXS22T6n+2KFMUmsHoYpGPFWCqVgV4OdZLZeRlFZIdAPNZJAMkYkn6vE2/R81B7BsJv@vger.kernel.org
X-Gm-Message-State: APuU4Z9uOS9UPW5vF+V8yuNoxfelJlxvrrYxBDxspeRznIN6DAVl2FVK
	BV8XXhVqOam0KKSctLsRLFxFTosASNJPoovUuPRrc5rdkGEBxBrlJ00d
X-Gm-Gg: AZFdTZcoY7Tp+I5NC1zOc2OVCbvrE3rPiDAViXYY+H+tWt24gkw2tApQ/wSADLUIU69
	ryZWXDeUbuP9GBKUb5HGgHqM7z0UnnYzxYZ+7LcCoKShBIMcZ5cc84fQkLGABOX5LEHHV8FQzSQ
	WczY1LWv2UAgCrdhVfPPQWM5WwkcBElk24vUJPwwMvTnIhHyOzVSZ37tCt78248i+K5q6Ly94WG
	udkcXgvvbNs1z2sHjHFA+XUTintwylkx0mwfbQOlJpyegMGZPFvFFILSzrALKqUrhSvx+VJrAQp
	OWowzSKmshpFBcwcEgWa8+TB6qTTZz3oS32mSrFdODfsvcZ+PFewtBTthyUeDe4FfGvPYy6OcK/
	AOoziBRLErATtaAeVkW2md0+qLtssE1af+M1VKf8iKe0pakinxg26SUx4P1V4W8c0/uLEoiHmq4
	Y8ksU0vsBoupDSwPclQXhzn8Avae+i8QGCbLhQnflakGW2Hi24fRdcLbLEFIFJ8DEJmVViLNDvy
	E3chceMBciPnbRMlaR1Tmg7CvomfAEPpetMK3mojpIDI+vOyZRJzixCjCKrbDlXBTLTOS0EWztz
	9zdCKw1dfnlyF2OX8L71qf+LyJJOzyykTkCqdQ==
X-Received: by 2002:a17:906:a207:b0:c42:102f:15d3 with SMTP id a640c23a62f3a-c513a897629mr842494266b.34.1795529959010;
        Tue, 24 Nov 2026 06:19:19 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm525342766b.22.2026.11.24.06.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:19:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Tue, 24 Nov 2026 14:18:51 +0000
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: document the Halliday Top
 Level Mode Multiplexer
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-halliday-tlmm-v3-1-6b516e5f269c@gmail.com>
References: <20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com>
In-Reply-To: <20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795529955; l=6058;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=SlX6QYe21sxQH79MXblD8P7iKl/sCn2h4tLFFAnduVo=;
 b=Wm/piiI3F2H+ifLrXxTKiPbQUIcPYW3WDFvYx+wrNatwXc86Cj5laI936TcSWoKDW4Mes0QMJ
 wOJY+8GGZKCAxVnnNWcrMIzWbJIxAO3sZjvw00oxylmSemFWTOr1VBU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Top Level Mode Multiplexer on the Qualcomm Halliday SoC
(SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
new file mode 100644
index 000000000000..2615d40b0478
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,halliday-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Halliday TLMM block
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Halliday SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,halliday-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 112
+
+  gpio-line-names:
+    maxItems: 224
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-halliday-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-halliday-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-halliday-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[01][0-9]|22[0-3])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ atest_char, atest_usb, audio_ext_mclk0, audio_ext_mclk1,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, cmu_rng, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
+                edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
+                edp1_hot, egpio, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
+                i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
+                mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,
+                mdp0_vsync3_out, mdp0_vsync4_out, mdp0_vsync5_out,
+                mdp0_vsync6_out, mdp0_vsync7_out, mdp0_vsync8_out, mdp1_vsync,
+                mdp1_vsync0_out, mdp1_vsync1_out, mdp1_vsync2_out,
+                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
+                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1, prng_rosc2,
+                prng_rosc3, pwm_0, pwm_1, pwm_10, pwm_11, pwm_12, pwm_13,
+                pwm_14, pwm_15, pwm_16, pwm_17, pwm_18, pwm_19, pwm_2, pwm_3,
+                pwm_4, pwm_5, pwm_6, pwm_7, pwm_8, pwm_9, qdss_cti, qdss_gpio,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se4_l0_mira, qup0_se4_l0_mirb, qup0_se4_l1_mira,
+                qup0_se4_l1_mirb, qup0_se4_l2_mira, qup0_se4_l2_mirb,
+                qup0_se4_l3_mira, qup0_se4_l3_mirb, qup0_se5, qup0_se6,
+                qup1_se0, qup1_se0_l3_mira, qup1_se0_l3_mirb, qup1_se1,
+                qup1_se1_l3_mira, qup1_se1_l3_mirb, qup1_se2, qup1_se2_l3_mira,
+                qup1_se2_l3_mirb, qup1_se3, qup1_se3_l3_mira, qup1_se3_l3_mirb,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se6_l0_mira,
+                qup1_se6_l0_mirb, qup1_se6_l1_mira, qup1_se6_l1_mirb,
+                sd_write_protect, sdcc5_vdd2_on, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, usb0_phy_ps, usb2phy_ac_en,
+                vsense_trigger_mirnat ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,halliday-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 225>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        i2c-w-state {
+            scl-pins {
+                pins = "gpio58";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+
+            sda-pins {
+                pins = "gpio57";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+        };
+    };
+...

-- 
2.55.0

