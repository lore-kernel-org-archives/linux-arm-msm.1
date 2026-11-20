Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160045;
	b=ucCSE44mr7IznTvI9D9iwzr9ISi8avj6yCIMZTYGLGcw2M0DX4DxujkFGW5iar7F1rel
	 M24PcHHXR41D2XHlkMyl/odwWIitSmmbkthXszL2NmL81IT4FyGgoT/+BOx3rvfyPKmDe
	 q9WZtRsPhqm7UHmOyCed4CkwgMp0lpRmtoFGBzErb5oCzObG6b60Aezt9wjZYCS7rq+/F
	 Lysrr5cE3tzWrqsifbHuv1PyqUShZlMIAq2oXXx4MH7GwwDsWs2VOhlKql9vnl5H8BrQ1
	 W6urbcTNJl/DDEnFeKQDkO4sqEVbnU9iCn5JudAI6gxyhMaBh/52feMaS2iMM5v9k2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=a0WMNKTOHDaJNcbJ4+uMHW2RIsCpT2YVb/KMhDyEgtNqYYShZuz5qBAMxOeUAIKR4LZq
	 AZx2My6y4Axv4TnZneNKlfPfeAfiNnP50Okia/1Hf4fr99yls0aX6DZ0f54iF4YNpZm4c
	 635ctnttiLXWKAuJNX20BZMRcnu27940XJ+55QRW7J+iL6rvEDhahf1d0f5VBcKD/j6aN
	 NQjwXZyOGpM0P9p0O1WPE0UpHSGIOhc3u53hO8S+yAvuDtYXz6PvtIBA5CWE7kWYxL2ge
	 FbpKfLCRIBMOzjvMZ8ImlXq93ouiXY4frpCCmYlCZz8+dZF33Z/onTO4RDppn+8FgNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4660A2637
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D4660A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso5877675e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160043; x=1795764843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=UGKPN5sgnx/JqyrT4bunkDQklLznRnCu7ogj28UGxAtEc6KwzYIx1NZItncO3oCsy2
         WQwOTT4lqZnhEGkFTU2b0VsycWz3M8JsTUfgictNO4H7nhfo8Xa8SB5nE/4hoihOR+HV
         Iz93718IqHJWyQt97zdXQoV9pzVcMYIhwQCzOi/Q6u4n0TpTFiyCGzRrt53wHObDgLxF
         Xi3kUPiCfr4xbBx74tg/LQCT3qU9C9Tw0Ab5AOU4Xtu69qLTbTC3wJPvAMxWuXfC8r4o
         pAz8JNmmJFL1alSsFqn0U8j113YfwK3WZqXD7BRmX4YDkKQTGUWqTicnH/hJfPsct1Jw
         DWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160043; x=1795764843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=MsCiAnjkfQ/cDQ9iXC2YpKTxdz87/z2k+N1OzumykEPI8kqp/xtAbNPt/6uoJ3L7Jq
         r7qsyc4cNBlUMUuKPer9eEaV4GhIOZ8NrpoK9UAypdAVzZyaB3JDqW3VndUn85S0XlLj
         GDtqalc17m2bf15iEKSNIU0NWALEnQHn7W7YDqcqxZm1Dg3fJC3ak7wolrNuIjTK6fJ5
         88xb+cWzpuLsHYTS7XZPN8sQSC4J0vfk0rdRSbmknfZpCS9AteLURBlhdh1/uWDaYQd3
         mw0FDiyrbKOQ5xE1FKTs+XPR/v2Ty0xJKAgKMKPW4OB5kJvpqygmwar2Btzr/CXopAiV
         jgkQ==
X-Gm-Message-State: APuU4Z/M5hhmBYS5nkD1v2Qq9zhQSUkHW++E/x5TUdehR4XNloiaqiqo
	o20hL1W0O/JHFzqP1/aprhynR2Wbu0He4wypRUPSMnjpNSIIMHGfygYelIYbAzRGL1g=
X-Gm-Gg: AYBFou1ydW59MUSq/ccixOYds7l6PvuILxqH57OnCkkPf+ZLPYs21x+W8WtxnTxPvj1
	77MQWtR+sjvoRysuQBSqpaVH24+nDGjFVhgInDi/p4ICUx4LeFltBY45yaHXEWF10qouZP3YNEm
	cl8t7kDRxxaukRy6Q0iwy21mc38WHZuxHYGp3ObQ207ESOe+ppMBMCqznACSTw4oAM6i3Zhxw44
	yxuHmBKEbBQqNWb3UObMYSBQca81sH6d3QE+sOStKviD8t2RSeoZym+RO/HRaFmJDLm7PG7cTwj
	72GStRa1wlopzuvfjxe48v65NGrBgkv0MbPoDQrfNCiyqa2LBXZu51JCFJT3AbqyqKq7Z0qAkGd
	CvaD2pjEU8P3DcIGxbnnrXPKu1ocmhmevUcNaDwdnfxRGgRtL5F+9Un+KROaShbrE3sPsMPjBxK
	ddvL0VmnnuDok0K+G9fcBoDZtNibsjYbQ8jtpntNG1/m7ID22aEoH1OgYXXReyLpoyFZ00T2FXx
	GhtQRXuxGcuSOwJjoKTVP0mibJY6oI46JpH9KvMT6cwQW3sENq7lD4JXnzZB7lqLAAVVDMbGhFA
	BAiR9D+Vyx1cZv4O4VVI0VuaXg1AOTCDi7dgebIGsS2tTJejCca3pVic6l6NwO1wUQT8lIUlA4M
	=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr44144925e9.26.1795160043279;
        Thu, 19 Nov 2026 23:34:03 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:02 -0800 (PST)
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
Subject: [PATCH v4 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 08:33:51 +0100
Message-Id: <20261120073358.10267-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

