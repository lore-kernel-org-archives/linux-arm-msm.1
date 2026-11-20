Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190097;
	b=qnaP4wUh7vOwW2h7B18lo/k0VaP6FhaZ4mrUvqeIUq+IMoBeKGY0waN7EiU9sQtmVs8+
	 cHMH84l5BCbirT4R5qmrcGLaL62OG5qUvP3fraM7mTqAmBf22jBFltx4zGxokmONwmJWn
	 bwIoilg6Ov3YmwCqpvkjuGMewyi5G24w1uslWVU4cN5nyHZxSFBAkRfAoGwyq8c3em1rC
	 iPfnXfcfqGSI4C/dtWCDheTfzYykZmHpBcQL0oKvAI3Jb3V6Niwfcx7wOWM1XEdfnRw/4
	 mFn9IO+o+Pv3qaXClR1sFvyd31bHsH1Rj6ZKv9erpiyjz84oQV3vI1L2rPoHmm+2czQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=w0DJ8FxtUpqqvBdKkInwp+iFqvclw3yqvUIirqKZFolFg36192LH/8IDodVxYezgbq/V
	 huBirWbQTW7AI7j8Uik7V/73SXTWuoH7kf3C63Lm/PMO/j6OSzJmjztugzTDYgtbOMF3+
	 +BvVssdblemMINDb7d7SkIPyFC5kUmxXQtU+0Mh9nBUT+t5MgzFisBKqvY0JrLihpVWQL
	 YCplb1KHxSflqfQ9wNAFFGOQ7AaRxNk1udGy13N2xl9xJY9X5/4gtjBg/LGY/QpftWqHy
	 /lXoBB+UKiNlO2IkbKwgUQuaKCM+c+FCbVlOR4tSRqwhB3MojNF+u0AzQ2VsoJbwTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF560A262B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFF560A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8360785e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190095; x=1795794895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dpaivp5ck36xhT0mSf3cEhG83JMNpndV/TDWJHrvmuFpnac9HUTpZp3vuYPaad/kOo
         RGhn4lKUpnnVcpFC/yaxfCyQXeRrK979BXupamV4LBS+vKLvlrb2gh8SWEdAy0rpHwKL
         HhorfYU3lt7r4/teZcJ6M9g0lzuHVgrF4jtW73dzFzeHF2tAerfB+OG1PlLOYWMKRgu0
         7Km1MLWMao/4k8glK8Puv0YOdJpzpv4mYxmhlkhmLPyJqN5QDMkPtPizb13BlzsnWgzO
         MPC/kwklGeqDxJnmDreueLfzrZwysMXydWVAwE18acn2eOJSoHSeh0N4i4U/aAwvZJ4O
         Hpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190095; x=1795794895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=CkSm6acw91xeEWhMEC6fwFB9NDtfYvCc6leRgCVUWbWemMEO5cKUwfVA436C3oR68a
         OORNNpluPTxMQnEIe6UY0emHytQ15qVqu60ymj+YG/IwRJofSkux3etU2E5TKRIEqoIX
         00Wce/7jwTELheoaP+TRiMzvEwTK9eGNjp4/XSf4XJnYe9I4R7Rl65udbHZcqqd2HzhE
         BWrzrdkogdLW9TDDZmnorarTZSJLAWDUjCp+T4sV2mt3xatUME35dVoM6R7bdvM3jchP
         ilCmXnnbvJzn7tUJKYr7N3gurSG2+pXCShxXnzS/hIAqwNkSRB2xURsyhDEYAfzW2s0I
         aB+Q==
X-Gm-Message-State: APuU4Z8aWkP/o7dYWeqlXzui/wK6d5rWzr2ty6KjJT/J5fnq5fAKm8/W
	LFeQGAoRLCzo3P+ktM6Lhm2yoIWoihrb73yBaiWTcqbd4I1vg5o3b7p33GJbhlD0VCI=
X-Gm-Gg: AYBFou3oFdz1I11ZkzvSstzqQhVWmXyPRYzLfZ7d3hsJ2B1UxygXc7Du5lxcUv4PDiH
	Yo7+tmVWMQb1n980/qBiBNWJ9uHXADIePCiuje898gsiUFGiWpA0wixemNdpPwzOonVkfntOTa9
	5S90JG2NcZd4aHPr1hG6sHPvYtbxdDgNgNz6mOUMugSycjPl9NQ+QYd3X8eBXnbMQaB8cOx4X/3
	1/yVpaXR3dK1BG6n61BS/Oahhr2n6wVY1y9gnX1QW0Zpu9sHQDZiSPxeX6daehIY2ZmPe2idVRS
	6TDl3Q9YW/vKuFuR24hmH649fszGm3uoKv9cnFTVmDew3P/UhK5Ybi3Rky06ETukjDeFWTw5kaY
	8O/ge6eTBFoB5lgRE67bluBkutfo9IzFUKos8K1Zk4EMOQO0ozBCgHa3DR9BATDQhsq6OwacuVM
	Fj8Qwncn+uzkO5F5B20rUGQ/Z2CTf5EeF11udEQsdvIvHluNourMxYQWM7033I4eZMMrwL7Pq+B
	gc+5RJAkpWT/8GUnncmLEQYMbHf9c0RsI1SHupRH7cNHZA0MnmppLSM9z8OGq11UIJDzw/Lu7Bp
	isfIPCllSxa7FyXHFEgTQSLlJEqA8eZizBSlfV9/1u4VKDVFJ4SV2mX/rjfcokhA4/CZwAr22UI
	=
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr89360365e9.23.1795190095071;
        Fri, 20 Nov 2026 07:54:55 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:54 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 16:54:42 +0100
Message-Id: <20261120155450.7719-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 69 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..7f44ac6672bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 80c1bfb66f8cc..594863936fb5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

