Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534174;
	b=29eyp2QeeEJlmhDC3OdbZG16ErLqjWTpFFo+zH0a9pYbx0gk+r+1VqxLLtoSfQsbwKEd
	 6QwpdN2hMPrvMJiKJJHrw4yJRzpsZ5rG48rw03mI1sL7Mih8dtZVUE7bxawuWFOztJ4+F
	 mNsELHllRlaRwhft62bY/cddZb1wN6FzZCgBTFPswqHAg7LL5MDrXtEwwdadydGPi9Ohx
	 hivJGd6FeT6qRYYsRalxiuF0OGw8JrdslMc2AqvKdVJ+p3tFv5iPWyH3bFv2lPZm8+47H
	 Qo8VzCw1x49VCsfMV2QzZ8vXtK14tQR8ghCxwA6ym534PLCrxbGV/8lsWHKfDpWGu6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
	b=PRhLiz8YJphf6wvOIjEEHXpinsefTfi4/diyEVQbGLySGZe3rinqSuAJkntSjOM0cLqn
	 0Hcuj6NAvNHH4/T9ea7zskJ02QvTswhjtAwM49QWkLte0APnZjAk/C6Hww7ngIcRu8NDf
	 Fmb3dcWEpg4EJESYNexUzygyI/ylCoGR1WF6hcxaCUR0cGMOWBcUVNW44NUAmdj6m0kzs
	 IRthABd2FMDB/ODHnOvFTRBPbL1T+q61q2r9qcE5jj5t4efvXrcNhLjn2daMd1eCYi17n
	 sYwuUJqEoI5QjvTl0KjTAdqTR9eayaovWTOAQ/CLZDyGspySPFVKAu1+c2z5uWBiw/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJ0334hd;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57B60A3801
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E57B60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJ0334hd
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so7434202a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534173; x=1796138973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
        b=CJ0334hd9uWluNShzhtgG5AduQJZDf2Ib7OhymDcqlu1mpZqKOdQTNssouDXlpTyT4
         ayzUo4ahmISwl3mZboo7ZzvTc+jdMUOxp+bNAAH88u8oJBUOKAG/HdXJHphgwVlrAVTc
         6BwQ8/jDTWQlAARfdnwCKvVh7ETzfqnktMGl6M6QKT4A10kuzUfyB5tR95U5sK/2zg94
         BlTg2xJbRfgH9JMq1zafrvSulW1TcRApLZNn8ZC/a5PA6OFNPsVvjUTFx7J9e25WN7J2
         KRkM15kGVCVR6vKyM0N2Amw29JDPfawpI3wnYuYF0w7p8T7UI8Ew8qzPiQAtEOgjByUF
         f+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534173; x=1796138973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpjqgAKt1hsxdB7y+H9svR2XM1GgbrP7e+UE0C/pPCI=;
        b=RcEyP4F+LS7xnHzp+JPVjTiUUW1Odifs+3Wt8ifYLnKbp4SsJaN1zk/tc5v6mlqBZj
         hrJkb9/3y9eBlslpfNgIznW05Tn8j6zs+8GO0xu9FYl1VGX2yhzmUIhjsmEtUdspH+Nf
         UgbfFh0a/3fS3sR/R+ps0GnDSoSEXB3oxWqZKCNL2J8/UhiIPPXyMN1iVZk05v2jYXGp
         UYyRN2eWMvvgxlL1AHx1AoX7pOT9NCuDsc2LQuidgDO5iucBdnk3nKmbQY51BN6bTz6E
         y4VcvcPL17LpDRAIToIl5T19KyjCNwU6BD/Ij1mcTuLnrmmAF2edwMPtbfo3cZbj0xJr
         0Aaw==
X-Forwarded-Encrypted: i=1; AL+hErFeO9BDLQUzeO2V1TdCsaxNLfN3BniRKdkfhEv8AQ9Si1Cl95XQ8iND6MkkIH04J6HUC/cZ7dzQ/mmW3cAQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8wSA5BxptrhpxO7mObBYX01mcKC7bmy7OT+IlL5SoIsVhWwSjx
	WjW1flPl1v3HR58meWgvZA7BIAeB42emlwIqrwz30MhtJfXRwBPrtjz4
X-Gm-Gg: AZFdTZdqQotNc1PI/w16nzk5Lodwy84B44LvdpOe6A5QMY6HHXLRdPFrqw3L8lC/9Jh
	GTbx6zqjw04vOlb41GXb8w2AX4SCOoTiNxSBbur6S3H4kGNDYP+yUoLSZXy4bCbOynBd1C8BjPl
	bycG+WS8sxBQ8zmzOufCs3nSam2qaLJUUbJptRADyL6sujq5fI8ZrqDQVyQzhNKzs6Wv2ADozMD
	dX0wBkgiqTkvy0WlAnA30xRzzJOmTQ3aXiqNc1KWNndq6+nqG7gKhsvls4NUgX55107OfQwQ2D6
	72B0q7yvHz6/ZwOPKNCIcdhSgGYR87ovionF168TGIfZmp9LVDgYmqEcmiD7rOfttSlNkhVtAVV
	Vg2NMEp0UDcIxa5RoBxKBb6+pW2l4ec3/N5VrQGzPJhwduCYaE3IhBawkkK2Gf2OksUClflkyay
	a2em3KU/bJ9WEZ5fJTGAF47fONGY71yA+SHuPJ+Uwi4ukBEk+82tK8+3fankPrI/i0VPqnsdzU9
	xBvto5mec3b4MSla5ShnpqvExd/166j+/YDn2Z9mUaP5ONUxyyrTt2d+J1XlvUIkqa+tIxr13Xb
	zbQ4xIZ/BIIPE3v2Joi4QwZXAEzDF8RLmQntvg==
X-Received: by 2002:a05:6402:1941:b0:6ba:7bee:e100 with SMTP id 4fb4d7f45d1cf-6ba7beee6ccmr6924541a12.36.1795534172375;
        Tue, 24 Nov 2026 07:29:32 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm540425166b.2.2026.11.24.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:29:31 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Tue, 24 Nov 2026 15:29:17 +0000
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: document the Halliday Top
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
Message-Id: <20261124-halliday-tlmm-v4-1-3e3a1d0fb4eb@gmail.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795534168; l=6058;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=SlX6QYe21sxQH79MXblD8P7iKl/sCn2h4tLFFAnduVo=;
 b=shVf9hm3yWBFXe0hLozx3txiNh3jMVi1iB2P33RSOBrAdQY9FG0bdYO4uqrg3I6nqAKIeWHLw
 nYSHqlZywbEBQ1FVO2s21zzuG1OXsqb50dNgqANfH2USB+dY6oaEQK/
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

