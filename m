Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517599;
	b=kMs8+jY38Wg6I6lo8KyZoJ+0i3cDIne/urzxC+1T1S5MkzUyCsqxUSbPxIKiOzIY9B09
	 1ADRlyFC76q+VbNXi5pV0p+xWvjAqgPnHVlDpOPwDHcDifBt4PNWm/2smzf22C7hIH+AS
	 PpItHjEB4lt4MYGfWWhkZ0PvjvijUCcbVjY8E8tMY84F34L+VlBHH/6OQm/ZipAZLGuTl
	 qWGqx1EpQrNEWWsyWRXPZRmMJkM5lCY4AyKU7GnnPNc2wJZrGCNu/ubaAXxj9OOgsN2F6
	 N+BtMMRUX3mfcUB4+4Ol3Ivqeh0ozdBXUev3fO+KveCJrwKz0Yg5AQwMCizSmAs16Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
	b=3KDpBFKYn5Egf1YjTTNu43CTQ7Urw5CJxZ/0F3aaZk5bVOtfcADUhelLC6G69LNzrAkK
	 3BX1ql+rWTW0+rGbxtnCEp85HcmwgBWDHk5YN+WTmln1OxeThRe6tDMVLSvH7m3HE2v2v
	 vdOcTF6HdWFX6AxVHbCiJ2caCtLPHgwq6mx3qsQsXPDgk2BNXtGXAoGmJhgYwbRK7AaBf
	 soi1tYIg0GYlqaIWr17oYddc6f9WZFXmWa8y9puSBFVBe4E309AT+VK3tsDz9JZjxOKx0
	 kB2vkZGMkWNVvB7Ozl0TpvcnukGzeRshwTGrtI3IXYq1pk7SqhIu6hqiZZUkmIj0CvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liMUJPu2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFylF+a7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928F606A337
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8928F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liMUJPu2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFylF+a7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8U29J017000
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49YFlJIWuss
	tvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=; b=liMUJPu2ZSLIIUepwMKYSRScRD0
	oPn7tSnhAFYdPAlB21AyOf/zAGvv7ZXKzr11PS/Ez3FwtgngWXOh85YNatsNzA8p
	00Wes3lASwuG4h/I7f4O+e8vy5BqafNeJ28C4kKApiq+SI5z7bqrbrNbXm4uhgUZ
	e9czCriShkb+NQ1cbUC1SJoo/a60pAXrJ3INbJXqKavMzYSrI/YxfqeHaCqWAQFq
	RnpF1w/nD2Oanc92XoP6nefKwlwX9S86zPLWFbFZuTZEL/fFGn5kCVvbnRPoSAUZ
	FtlY0JI6qqSb2jgcCo6KTZgtBbTOnlSs6TwyaPwBiXPVaZu2hGzT8fwbzSQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nue1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so2326883c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517596; x=1796122396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
        b=WFylF+a74VWEdFxY0y8Mi0XNwOuxHf7+EPxXTwBn9BxA7hL2jex5wXNLy1z3A2tIvT
         9EZ0aw16OU+StYiw84JTeV15wuY1o1mcpxD0GXttj6OIN8Hm1JQkfjSlVqlqDwqJcfpG
         Gc5SQb6NDDoH7gXA/HGJLFNNxr3ojniSDPlRLgvQsf4kcTrC42VAdLZ9OmgTlo1GRh+b
         Rqb5N6267FNkQ/u0CiyPmKIE1t8oeG+lcsrC/djLcwbsu7Uy9yj8FQkFTxa6NgMRf9mt
         naeYqXC8hBhE4TC94BqGY+eZHAezhSJwwohw3wdwF65dA/OmLvckgyQ26DsFBNgyCo6k
         4P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517596; x=1796122396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
        b=1uACIqeONLXCJiV9+S+STvYE6IA+B85dk92VTqBOP9iGyNczNQLErMQygFr3uwuRtx
         nhMBbE5bVDIZJSzZ6W14nhPNHnr+EVBQ3IbXNVDGRxT2+C7l7j9UWsxEqbS7nHmSW5Ks
         HZ2P1RFZSWEUFKeH/UUUFczzilusDJfYRv6X22hvkoom29W73Zy382CtnVOXzN+1Znse
         vtXlwbqJJMNzaQkydi1l0ixaqcunln+0gJPzPteYObc7Q/jKxd3QW9sw8KjDSKfuvnTp
         +lvdVzsG/JKyVn+JuBuuZ6EcKJ5sOwlUTGJd2PafAhAIvkPuBv+1OjIxeqKiJOtLTpcz
         8ALQ==
X-Gm-Message-State: APuU4Z+9O3xyjA9OpLWLAjmVuFcXp9WISFQuwiarUCgXts5VaixYqIhE
	N6bgbR24HwLt51BsWr+Lc57d0p6EtsRf5fiDM/uxNcR1++pleQYw6T6Z7YiceX2GwCK/Z7rPzja
	AgPNY7qa/qF7/sJkTq6u4dPlTIAU5dZ0d0/I9CNL76RnLRPA2CFYMgPz13ht60vMYLX2DXfCPDR
	Dl
X-Gm-Gg: AZFdTZf6VvoKRh+yQ3dJ8z3TfW+xeW9GqR8kOJzI68+ICgvqPN+U2rc5wtwrTOIdy6F
	vBG7X8h8rnSH8E5lY9qG9AuYroJPYxHj+GLWC7yenxv24zOf+CNQ9BCHEVI2JmhbTdFIuw+h24C
	anhJJmUhXgBLOkDneGVvf9EQ3k7bvW8A+4LDNgcU+Zfb+BuoWa8rRJqurZENvy/fo+hZpzPCWWc
	W3kxMHlNH/LlZYVKnTpOu+0axyq8GxdHBqy0/8VJRE0x3XlTN25+Bgm+cg9reJSTV46ygX6WJNp
	7zQqoFued6T7VrtOUAxYAU28SGKX1UQh3TJs6XDxP/3PZkYVFxjMUU7131hYoAgO0Z+R2D/jRQL
	rBsmD+C+nHF2kgtkYYLRY7LZzbNrsh7lvtIUdT2n4ohNYSeD3wO3tPi09IFW4G+6yNEMlLeztj/
	93Qeg2j9f0xU+5ErhbEWnSJVqTzjMNBZ8hQvcns7D+YTtcsQ+MfpkSYgwR
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr11862655c88.10.1795517596158;
        Tue, 24 Nov 2026 02:53:16 -0800 (PST)
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr11862638c88.10.1795517595617;
        Tue, 24 Nov 2026 02:53:15 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:15 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
Date: Tue, 24 Nov 2026 16:23:02 +0530
Message-ID: <7489ef6eb166f6292841030d299e72e5b27231f1.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXyIO65YFk9k0H
 4Co5t8qnY0Y7RpbqjBreE4kEPVodTS8YW07S3JAZS7Z99Rs5ep3YNTa93ianc1CxtkZM53Tn5KM
 ejdVo0PZmOPhfyXAr8M4sBbDabcCTYlffpBTrosybgVEQuH1Uet0P6O4NnSQLDPJlIQWnKjuumX
 127osa/seO+zrS0Tk2iAnXIlTabQ6Q4WhfZD6b9Xq6a+TacoDKhrETM5FRP1Ha6spgd1sBBcJto
 M6lOO+Wnuu6WxrbcBlq5iZnsG+E+Xyfmhc+n377bbZXvFODtznsRjSOJnf4R4Gx4hDr2wtjWowl
 rNlbmcyfZEDkNEvAd6XEg2BKSgAsKcTWJYlBV1c/VU57MsNSTazim1afYkkP4G5ul2N8M5nteyr
 wnA/ecsX7h59l2wOAWuxJdUc7FC6wCxZSnhhsoQ1oUr58XSxUOtVPMWq3t32mm35cRB7c1nL+mA
 uuN7bpxQVrDCoowci8Q==
X-Proofpoint-GUID: Til4Mludu7qDDlTl1iI5b6eJk6-N2NaS
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056c9d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=RS--hHaVoNrYE_hnkMsA:9 a=vr4QvYf-bLy2KjpDp97w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Til4Mludu7qDDlTl1iI5b6eJk6-N2NaS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/+Wh7tBKpreZ
 piMsD80w3TT76XiR8mCGQw3w/WKYvr5lWEnvn7hHeIJlOeZpjaN5AAcMjX3ahepBd7ihaUhvnmD
 9i5GBl+oNkiEImBmoK6iHHWmLe+v9Nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add device tree bindings for TLMM pin controller found in Qualcomm
Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,seca-tlmm.yaml      | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
new file mode 100644
index 000000000000..be683e31332b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,seca-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Seca TLMM block
+
+maintainers:
+  - Yadu M G <yadu.mg@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Seca SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,seca-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 181
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-seca-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-seca-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-seca-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180)$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, aoss_cti, atest_char, atest_usb20, atest_usb21,
+                aud_intfc0_clk, aud_intfc0_data, aud_intfc0_ws, aud_intfc10_clk,
+                aud_intfc10_data, aud_intfc10_ws, aud_intfc1_clk,
+                aud_intfc1_data, aud_intfc1_ws, aud_intfc2_clk, aud_intfc2_data,
+                aud_intfc2_ws, aud_intfc3_clk, aud_intfc3_data, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data, aud_intfc4_ws, aud_intfc5_clk,
+                aud_intfc5_data, aud_intfc5_ws, aud_intfc6_clk, aud_intfc6_data,
+                aud_intfc6_ws, aud_intfc7_clk, aud_intfc7_data, aud_intfc7_ws,
+                aud_intfc8_clk, aud_intfc8_data, aud_intfc8_ws, aud_intfc9_clk,
+                aud_intfc9_data, aud_intfc9_ws, aud_mclk0_mira, aud_mclk0_mirb,
+                aud_mclk1_mira, aud_mclk1_mirb, aud_mclk2_mira, aud_mclk2_mirb,
+                aud_refclk0, aud_refclk1, bist_done, ccu_async_in, ccu_i2c_scl,
+                ccu_i2c_sda, ccu_timer, dbg_out, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi, dp_rx0,
+                dp_rx00, dp_rx01, dp_rx0_mute, edp0_hot, edp0_lcd, edp1_hot,
+                edp1_lcd, edp2_hot, edp2_lcd, emac0_mcg, emac0_mdc, emac0_mdio,
+                emac0_ptp, emac1_mcg, emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync_s, pcie0_clk_req_n, pcie1_clk_req_n,
+                pcie2_clk_req_n, pcie3_clk_req_n, phase_flag, pll_bist_sync,
+                pll_clk_aux, prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti,
+                qspi, qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se5, qup1_se0, qup1_se1, qup1_se2_01, qup1_se2_23,
+                qup1_se3_01, qup1_se3_23, qup1_se4, qup1_se5, qup1_se6,
+                qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
+                qup2_se6, qup3_se0_mira, qup3_se0_mirb, sailss_ospi, sdc4,
+                sdc4_clk, sdc4_cmd, smb_alert, smb_alert_n, smb_clk, smb_dat,
+                tb_trig_sdc4, tmess_prng0, tmess_prng1, tsc_timer, tsense_clm,
+                tsense_pwm, usb0_hs, usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs,
+                usxgmii0_phy, usxgmii1_phy, vsense_trigger_mirnat, wcn_sw,
+                wcn_sw_ctrl ]
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
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,seca-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+            pins = "gpio147", "gpio148";
+            function = "qup2_se2";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...
-- 
2.43.0

