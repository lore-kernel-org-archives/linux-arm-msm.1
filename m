Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571377;
	b=twBc1Gn6ImpFEpEa4/D/xgFa07nr/mvhTg1zcso+3oXs/EexherXaWXcSc6Gs9nPhQsi
	 nbIWfQI2ptOALQuCbQu3JerOjdIItW0NMxwVzlCDEFUywFTvnyC7zyHuFP/u/ZVhn7orC
	 O0lyQfI4j7u9Rl8Evj3rHSn5wRxjSQA46yJlVbi8GzbxdtnHK3l6btc6LRwkuA7xZrOqV
	 NWETv/aZSsXTM6VLlYVTHl22jg8UYkkP3CpjTQsfxBZU6jByXOivSVcV03fr6xH60tz76
	 Drlha9ux+AjPWL+XURW2Ant8gYdIn2mBKz7GvcA3E+MogBk8pe/Ry2fwVDxgoyvqOBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
	b=jXt+3km530TnKPULAFLaSnn5uIbOeEwPKoo4v66i5JXWf62tAetYiwmnKWh86Rc4PBcR
	 FTv95KsQnMoUeVGKhQy1ezZ7tyvXBu18F8zWUbgSdApSRv5TCH60cvxsMTO4Wj8eorsfY
	 CCLkFTQR+6+1nVexCKX+5HJalwdSHAByObbAralAWnklJM9RziymPnH+hmvbQzR84rUEy
	 J0zgWfbpse5v6hEMTcXsOsFoNYSUnmchdGlHr+q6vHwMdEI1IljJ1Se6xaZZtctlwLcnF
	 YUCfCy/OgCEvSKDijATMQPi5uF3thJRuLat8xXa6X/Uohsk/1z82da3PJnDpgvcq+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IhTH5n1B;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA6606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FA6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IhTH5n1B
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so1003455eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571376; x=1793176176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
        b=IhTH5n1BAEzIcU1+4ct2ARRUmuXvLa5lwoTLDfPTw5a070TYCjva88wL3iNauAgScb
         2BzyCmw2TtVHPscNk70iPI9UjZkqDdG3wzb72Ztfw4WQoqfApfZmWrKNNofbLyFwpkMW
         /Mi4MnYZa5qbsgIVWDenoSVtFYg44GxGJ7AJnVMCcGubl+lpF+DQYS86hLPgDuapXuyc
         TMOvnAHNA6nYg4On6YOGzuKx3hc+59x/PKcMmd3720X4/66rYiyJwRECINg1hzGI6+yK
         6EMwIEm4wEncI3PtNXIDD8oeKhsDins/AOFGVtfx7vk6TioFrFlFPYBH0hl6Amty6JU1
         h89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571376; x=1793176176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
        b=JoPlEPYZOd9HQtXqKwaQRolqhBQtSWamrB+SFS9xTxfBt30y9+8bzK+s6u2iDEAI+5
         WbCI1/kGBtfkekYRlTP8sVN6eBujEUvNcFoEv7AlMw0T7Tz4ZxE+usNrjrdCLRTa5pc0
         s6FJZ6LbJvCZ7WvYg/FgkhTGTbI3ImccUO6/xHLY7/aaOACfVo/4fuYhnXOTqzpqLiB9
         S57r4h5uOpmK5t8lmuqfdkFs4OSo7OaHSEi7Rl+6gNpST4WX9iPpxJR2yL30i1M0XHLY
         AI/mJ8I6SiTagh61XfkvbP99N2OKnjvE4E82IXGujf6XsX+vW1gDvNgCcKPQeRFcw+Td
         XMgA==
X-Forwarded-Encrypted: i=1; AKwUvBw/6A2rQcNjVel24kILS7H5ELzRpcAtdu3JgmUOCKVH0tph2QmHkqyhIHt7jTTcx4j16ubc6P0DiMgMatny@vger.kernel.org
X-Gm-Message-State: AFq9FYKWMkUj1jS/MXUTc86FJ8nxyu2VveLYPtdmeMgfLZIduXb7jXXK
	XKTR13XeTLAcv0nh9RUVnloI7bS0sJ5VnsqMDep0sLaXstdsKmHtqG/MchNWW9j04u0=
X-Gm-Gg: AYBFou1P+4PSBAq0em0wjMqcXkbCCGmUnDJLcFdPFQeiEVMPmSJJIjKt+s6HQ90HQH4
	09J7wE5wm16YupmRFoYP43uzbZ0dJIQjYTL7XdS2zkFw7kDuUJ+sAiXVgROsMNYW+unD6JmY96G
	K2u2rKawifDuaUemACQ0fC9qN7/5ed3BEzOVGLfkb+/emexdElmOxoZTsgES1Saz/udO7a6p9f3
	lf9PoJEkIja71/AqiEjX+efKp9tcK1aEqA9qYflxT8sh36Gq8NggBHVELaeHrq9fT58GkdLtjZm
	Cmfnx4r0A4siN2qwmEygQjeSz0VSXjnhbj+e2S6KS7dLIFNambFUN60c2b+FxGLqQ4CzsLYokGP
	IFBOcQkvPmq040uUeHuUSMBZ3Uh03xwA1BcIZN3UCavbZh5qw0H9FrdgJ7kTQr8+xYaSooncu4A
	XP5RDAJFhKNr8ekkYujswia/WP9fdbuwBRqQbLdZ6Z6HFNTbQXIZK1gxEi8bkk3Hhp9LiPlZ750
	61DDP3rE9+06dsSPc6nWZzTnRElOIcQDyULe27Kw2CncZmIN7JWkmW1diLWybxRRIOGCh3Spm8J
	QI0cX7h0nOGEjl0opwmH50EoACOMUsPE5oW97OTYT2C2Zg==
X-Received: by 2002:a05:7301:3896:b0:366:2893:7421 with SMTP id 5a478bee46e88-3674d84ddb2mr2458844eec.10.1792571376399;
        Wed, 21 Oct 2026 01:29:36 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405edd7bsm5199132eec.6.2026.10.21.01.29.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 01:29:35 -0700 (PDT)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Connolly <casey.connolly@linaro.org>,
	Adrian Nguyen <thenguyen1024@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Wed, 21 Oct 2026 15:28:40 +0700
Message-ID: <20261021082841.79147-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021082841.79147-1-thenguyen1024@gmail.com>
References: <20261021082841.79147-1-thenguyen1024@gmail.com>
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

The Qualcomm SMB1351 is a switch-mode battery charger with an I2C
interface. Some phones use it as a parallel charger next to the charger
in their PMIC: both take power from the same USB input and charge the
same battery. On the Vsmart Active 1 (SDM660, PM660) the SMB1351 is
powered from that input alone, so it does not respond on I2C while the
input is absent.

The SMB1350 has the same programming interface, and the two can be told
apart by their version register, so the SMB1350 gets its own compatible
with qcom,smb1351 as the fallback. The version register of the chip on
the Vsmart Active 1 identifies it as an SMB1350.

Document the chip with the battery it charges and its STAT output,
which it can drive as an interrupt line. On a parallel charger,
power-supplies refers to the PMIC charger whose USB input also powers
the SMB1351. The SMB1351 can also be the only charger of a board, with
no PMIC charger to refer to, so that property is optional.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---

Notes:
    Changes in v2:
    - Drop monitored-battery from properties, power-supply.yaml brings it
      (Krzysztof)

 .../bindings/power/supply/qcom,smb1351.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
new file mode 100644
index 000000000000..468899c15fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,smb1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMB1351 battery charger
+
+maintainers:
+  - Adrian Nguyen <thenguyen1024@gmail.com>
+
+description:
+  The Qualcomm SMB1351 is a switch-mode single-cell battery charger with an
+  I2C interface. Some boards use it as a parallel charger next to the
+  charger in a PMIC, taking power from the same USB input and charging the
+  same battery. On some of them it is powered from that input only, so it
+  does not respond on I2C and loses its configuration while the input is
+  absent. The SMB1350 has the same programming interface, and the two can be
+  told apart by their version register.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,smb1351
+      - items:
+          - const: qcom,smb1350
+          - const: qcom,smb1351
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The STAT output, which the chip can drive as an interrupt line.
+    maxItems: 1
+
+  power-supplies:
+    description:
+      The PMIC charger whose USB input (VBUS) also powers this charger, on
+      boards that use it as a parallel charger.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - monitored-battery
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1d {
+            compatible = "qcom,smb1350", "qcom,smb1351";
+            reg = <0x1d>;
+            interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
+
+            monitored-battery = <&battery>;
+            power-supplies = <&pm660_charger>;
+        };
+    };
-- 
2.43.0

