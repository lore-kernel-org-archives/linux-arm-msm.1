Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902101;
	b=iAP3xmOQB0Xf+IZev58iuR7KWrXjtKpjywcY3ZfjSXcnZPpCPGMQsX+dPI2tLjWs4bei
	 +po736OLtK3KPAvya7o3Vnk8gfJPC7W1eU/nfNWSjvg4YFJesPoShygzLLfvbKVfJpqGR
	 ge6UaUDS+dC2HrlVpd4iM+wfu2iL10ZLIc2rfOOrsvWrNaDtaaE2NLNfJOVqim7ZN57gE
	 FwdgoBGlwigqDvKuteQqEAqUxT4C8Ol3RBEDkVbnxn99v6f/Yy5nNrxsTo4UXx+gRA8GE
	 hOMIkrlyLSI4F2v9wAA1sFg/kWaWY3OyMS2LR7WPdNzJV1ULkBPvM8Crc0EGu1G9tMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=045OPuJjBnPf9EV6Lqby1VMt/pxJDKJfo2sjPGVdf0E=;
	b=ulgv803JY6pZIwpwfo1jIMjCTLy3qC83Um6uhLDzmVOzW6wjhD3hNHfJ7WcqIzOqk+wU
	 d4dbFj1xGI8zjLdpnURw6dzPbNXaQSWY/sLntfEhs+fbypBcbZiznLVyDLQe3Ob9te3vi
	 OdH/FHLTv1HGrcACmFg4Z+f+lwnRrN9mwP+0L1/Okzk1PTqtHLucpQZ6VvzW3+q8BjG3n
	 JQ6sWikeNvI61y1zyEeRFK/5rLNEtth50nxo3WvdnZJDQSIhhwmaAkcZF++ieF76gB3NO
	 AffRrJbboXdBR53dH4WdofQYwM1EOgVjunpgXw3jz2j195IKuBdHO3ibpP/e4ouStNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHLb+cEW;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56E606A32D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 04:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E56E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHLb+cEW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3643953eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792902100; x=1793506900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=045OPuJjBnPf9EV6Lqby1VMt/pxJDKJfo2sjPGVdf0E=;
        b=BHLb+cEWu7S58l6WotEAQxIpsfqsh0vcSVVpdn6nuJYlFfQdrJo/fqo6f5czmjqvw0
         RjAlErbj3kWyHzEyFxr2Bij/lxy1/8rnOzWi5hc26OqH2lAI95Z04/PMRc3lCYEJo6TR
         7EqgF4Ac3ahPMbStHJsvcCZad4jvEdXd4paKrmdeVxcUxIVmpnL2yPoaPzbKhavtY3ob
         yVJDRMK+hLUTiLS3dgHhfwOGZVfY+4qV11DwrRz2Wki+7Eqk7+TVx+T+/9jjYowqpLtf
         9CAWteu30VEDt6gq9+vrqldYd6/6np/JVpf9BU837gL454A26MIFm3AfGFTOJs2yPJ2T
         2TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792902100; x=1793506900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=045OPuJjBnPf9EV6Lqby1VMt/pxJDKJfo2sjPGVdf0E=;
        b=0VQbMpcxjSzuYNIn/lfQ5Zy75AtPnvjtAl7SKUUlWMdvk8jq9xUTkWzqDL+9fPzcFh
         eWWo6dLVyCSfJvFmZqJfCBU0jvqJSSQpaWxl0sDQelNA3GwAFZ08AHbdlamDuZGzt5xl
         KIP6BV4CNv7LfAYp1Q75KwUrWpUqK8Lq1MSs2ATDtUzkmrBxX/5dNNFXOcH2j0yg7LS3
         OBwdKZPt5doV14OQp4xu405hNYMlgk2nboGwcFYmWupHvLlZTbeHXEKzNBD8vATLUXBT
         JFLCZt5ZQSThdwxcKLJjkRrMMvM3EbY8AwfaKgSqG44tvlP0an75BLXU7YRAmfIQ/ZsY
         6dKw==
X-Forwarded-Encrypted: i=1; AKwUvBzGWR8AJFRph/HSohx1HJbB1rCCwunk3VdCPmtIE5UKmHGgn0toz9J1TboCbkt2oW66trm1RE+xMio0Loaa@vger.kernel.org
X-Gm-Message-State: AFq9FYKG38c0L7kmi/RtQoI8cWwmkI8petpQCfwDR/CMyWi6sS5q1pi7
	RD3+Gtd3Zbjmo2KrtA25nQYkQEbCB49u8nHX0mAH86+5Q2NI+3CjFlsP
X-Gm-Gg: AYBFou2XKJ5KiYjeneBmJYeB1QHJyR/Z8V557JjERb7WkVwPKuHJVnPj1ZfJ90d3FJ0
	noMyzSKvLiI1orughAiETTScqHrqnYa+TzkZGD/9XFxa/MCf3AuGTbU71zjglOAq1kYM4NQAX5z
	P87orznlWAPx26pZFGQh/jsM9FPWkJZ40CrOq8HwfJ9/iX4v/HpNTUtmq33kVYIZfBenKzOWree
	3C3DcfRMZUOCg4O2iQdBrB1t1vVHrX75c+HzzKuJfIzyZrIrttPx1h49r+ncj+UQnmwZPf0sk7W
	H7sdnI7WkxiyZY6H0dsHmbF0hAXxtfbTQ+flOzaaMnMVSkEvVEhMuc2JYADt3OKm1Fwr1QfN7Df
	Xmyzgl2/gtaI8CiyyX/lMzvJCCXlWROKoepWuT59WrHFjAEDTHZ6ZDfAgwIgydZDWlssPfol2Df
	rKwXVMvhBfm8cOcRbJ68FVqnLOgDMTssPiGFnlMjFTkq2tDjVrMg2ihufRswY4zO4UdJHlmgJV8
	lb9DzGczrrzxQPl1uGFP6Hg6OgJa7QZXS42OilcmnP2wZ2WPNCHxnpa+PMnUO86molZdmim7Phz
X-Received: by 2002:a05:7022:7f06:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-19935be7e56mr5156571c88.18.1792902100329;
        Sat, 24 Oct 2026 21:21:40 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm14037825c88.11.2026.10.24.21.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:21:39 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manikanta.mylavarapu@oss.qualcomm.com,
	varadarajan.narayanan@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/2] dt-bindings: remoteproc: qcom: wcss-sec: add IPQ8074
Date: Sat, 24 Oct 2026 21:20:59 -0700
Message-ID: <20261025042100.1356088-2-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025042100.1356088-1-dencity7@gmail.com>
References: <20261025042100.1356088-1-dencity7@gmail.com>
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

Document the IPQ8074 WCSS secure PIL. It needs the PRNG AHB clock, so
move the clock names from the top level into the per-compatible rules;
IPQ5018, IPQ5332 and IPQ9574 keep the same clock constraints.

IPQ8074 firmware ships the M3 image separately from Q6, with its own
load address, and some boards place it in its own reserved region with
board data between the two. Allow IPQ8074 to name its regions "q6" and
"m3" and to give the M3 firmware name as a second firmware-name entry.
Without memory-region-names a single region holds the firmware, as for
the other compatibles, which keep their existing constraints.

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 96 +++++++++++++++++--
 1 file changed, 88 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
index 1ec8df60d..89d648769 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -18,14 +18,17 @@ properties:
     enum:
       - qcom,ipq5018-wcss-sec-pil
       - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq8074-wcss-sec-pil
       - qcom,ipq9574-wcss-sec-pil
 
   reg:
     maxItems: 1
 
   firmware-name:
-    maxItems: 1
-    description: Firmware name for the Hexagon core
+    minItems: 1
+    items:
+      - description: Firmware name for the Hexagon core
+      - description: Firmware name for the M3 core, loaded separately
 
   interrupts:
     items:
@@ -45,15 +48,11 @@ properties:
 
   clocks:
     minItems: 1
-    items:
-      - description: sleep clock
-      - description: AHB interconnect clock
+    maxItems: 2
 
   clock-names:
     minItems: 1
-    items:
-      - const: sleep
-      - const: interconnect
+    maxItems: 2
 
   mboxes:
     items:
@@ -74,8 +73,18 @@ properties:
       - const: shutdown
 
   memory-region:
+    minItems: 1
     items:
       - description: Q6 reserved region
+      - description: M3 reserved region
+
+  memory-region-names:
+    description:
+      Present only when the M3 firmware is loaded into its own reserved
+      region. Without it, a single region holds the firmware.
+    items:
+      - const: q6
+      - const: m3
 
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
@@ -131,6 +140,40 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq8074-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PRNG AHB clock
+        clock-names:
+          items:
+            - const: prng
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        firmware-name:
+          maxItems: 1
+        memory-region:
+          maxItems: 1
+        memory-region-names: false
+
+  - if:
+      required:
+        - memory-region-names
+    then:
+      properties:
+        firmware-name:
+          minItems: 2
+        memory-region:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -176,3 +219,40 @@ examples:
             mboxes = <&apcs_glb 8>;
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    remoteproc@cd00000 {
+        compatible = "qcom,ipq8074-wcss-sec-pil";
+        reg = <0x0cd00000 0x4040>;
+        firmware-name = "ath11k/IPQ8074/hw1.0/q6_fw.mdt",
+                        "ath11k/IPQ8074/hw1.0/m3_fw.mdt";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        clocks = <&gcc 50>;
+        clock-names = "prng";
+
+        qcom,smem-states = <&wcss_smp2p_out 1>,
+                           <&wcss_smp2p_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>, <&m3_region>;
+        memory-region-names = "q6", "m3";
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.47.3

