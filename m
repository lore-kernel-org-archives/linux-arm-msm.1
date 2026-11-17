Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919195;
	b=A0TRMYE+N3TXpH+aGGbh2nPu2KzqkHmR4uNOJEIyIRNSrAEQxf+SsfPALxBAXWyfT8BW
	 MIlLQAcveZ4x02co8DIs9vYSInK1QxZH4Ipnr3iu0Zu06yWCotnQ7LpFjQmC1ZHQHFFIG
	 wVravWQFpzzVb3A74eB7nEDDJMBx/VpT/reF1g0rFztU3EnxLG+elzEusN8qpHSJSmS2b
	 nR075hIB5hXplPjAbP+V4zhdAEbUD/xzZuKtgfQkjyowabaYZYmEsMgW2K09VY5Q1/u9N
	 HBmE6FIqXY8KJDokQFyqXpgokR/nKPTvEGwfn8aTtlRy9JaGoYNBfNHLwIWC6+B+5qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
	b=BFzQSeD9zdNhjUeS44m0RNPtkJtakkzzqKsom+37uzR2fJisT00zCqPGFSIszecrMHsB
	 hK5/6DeiTo74Cp5aK6qZtNGFZJ7r/O7W+pfUFwqtCsB2Dm2q0ZKqzfI1hw3c3ypx1bltY
	 zPx8hnKroUbT6xwZLnaQzCtHWDR61arYAIPLuouuO+0X84RBHVgoyFX/mpDCv9nH9pOvl
	 l5W8THDDknOjLVcc5s4kg/Uli/tppzB5B7tFlhkHJ1Zm5rPkJbwU/yMV0OwQ9gaSP4Lr5
	 1ubCMRn9cKJi7Wx8MimL4zF8EYlfiQL58epfBer0aTZA2GPBfsDB4kQupK3kjgYCIKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKqmelpS;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138760A2614
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B138760A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKqmelpS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so32234945e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919193; x=1795523993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
        b=gKqmelpSihWWG/SBPNWiup0TtC/pZsi60X7mAIi+TAQYFt7+0MgqlU2IIuIunAogkw
         a6LBtOHF+5Axo0gsL0Q8UtGMP3PE5yvnyE4naACIO3TQgR1mJZkAjQ9H9fCdYHWMF7at
         OIV6MH3ix5xMyDw26/RHwNQt8F1lYEXEpM5gZfn+6R3opTm/PuzNERQufwkd0RpEEB6Y
         pHp7Jv7hrkK4qCoouK2+6aXkteZIpikR36SiwLUg6ev4S44x98ON4EPlPfpYhEQHszhE
         Xj2sA7CeWqo8bciqV7gr/OSJXSlDgHrg7zblmIwxvct8C3ooV7y+OPknTctlMMHlT3qs
         mNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919193; x=1795523993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
        b=eN/Av2WSOHsMkgNZf+FpYXL2UtxEJMsYH4Y0uAs2GG0AXWwS4aeopspdSCeO/GTUYa
         zAbQrpcUS+/lrij9fKiT8RkZODVmMGDVBgpAoXlZ4mujFZPtmJI71oBcWxtCyLaeXVfM
         TKyMN+QetMaE92EWyCV521qVMTj80Tr59qRpW+ckqzWKx3M5cfXU5914eOMco8g0YUKh
         sygf1dLLY1ZHbZuaYp0hhEjdN8VtdNazu/IfMq9XBwHrZQlk68fbTbe8xwC9xQd2tWqq
         A4rwE3yvLu+JVeGjU8sqxbrxC2Yq8rCF6i6YEO1zauyVBWaqovVLQMEQvfDtr4B3/GTK
         RVYQ==
X-Gm-Message-State: APuU4Z8h4o03emKu8UibNaCWJdRn/xny3sBPf1k8ZpgVNE9szGSx6KVz
	vCkb8y8hLnya4uCEac1rC3kAmylyZU7V/m4M6GyeqNbhIy1elJ5g0C33CozJhEBo7Isl7w==
X-Gm-Gg: AYBFou1TRTNMzGG8F+IGj3AbqLqbCa3rygjbGCtfUdOtkYNgAa67aD66rNm2CzYQelf
	vBuExQz/aNXSP9IZ9z1vaq6ByfnERkAh2gnDXV+T0M48JmeC/QYsvBM/X5DW0IXIsEjzZ7i8riQ
	8RVZvIPbjwvG7+BB7Lfd98Kf0WZ3l1REVprDACnbmtj4RxlgrwYFqiNCGf/vQbtlKm1lS4lpFbA
	DQwpbCd2SmEgISJB+6lokp3ycOERt36s29p88kEvCGqUUOGjOxDXVhgRTCRvct3GnVDehUV+tJQ
	B8WXTS7N7FTkAzt9vbXe8XiQeCXFJASToB1G2Qjx1OjqC0HGo6AjZdrCUxUUovsWEOKEMSxE2Nu
	4LwOWmIpCvzYUsiyFJ8rX8brqmneF8vjq7vEbn8EZIqX2LpeGsSdifHUv2uWzmeHZVUXKA2LeUq
	0PutGgQNAKlyNrB9UlCEjtTNRJQJIisV3vixgYDxCxFK6ok7MexNStLFqRW3QnU18Aid8hpC6f8
	ANgTFTlOHnq5eCS8TGdNTLAzpTFK3gUt/MbEsQDRaOdrW75+k8QG2tqM48z3uWxTFwr3g8A6RR0
	OCaPj5pjKctPSaASDGYpwvcruCOXkNo7n0R0UUiKi5iuwMEM0jF88X2mb2vL6Odu1pKG6g==
X-Received: by 2002:a05:600c:3152:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb55aac0bfmr303633355e9.34.1794919192859;
        Tue, 17 Nov 2026 04:39:52 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:52 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
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
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 04/11] dt-bindings: display: panel: add LG SW43103
Date: Tue, 17 Nov 2026 13:39:39 +0100
Message-Id: <20261117123946.668557-5-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..edd007e2c0d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - rofikkerneldev <rofikcoga@gmail.com>
+
+description:
+  This panel is used on the LG V60 ThinQ 5G (timelm). It is a 60 Hz FHD+ AMOLED
+  panel driven by a Silicon Works SW43103 DDIC, operating in DSI Command Mode
+  with DSC (Display Stream Compression).
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
index 315a4a000b405..bca5065166c25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15231,6 +15231,11 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/dvb-frontends/lgdt3305.*
 
+LG SW43103 PANEL DRIVER
+M:	rofikkerneldev <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	rofikkerneldev <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

