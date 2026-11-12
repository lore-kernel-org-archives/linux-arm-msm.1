Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478555;
	b=B9brLWmStGhNi0EfefNdyDk/GiWiIjRnsINHe9kLOQ3xidIEegLqX6oA2Ypn7L7zd1ux
	 P/C0VSd9RV0qiEp/x9yFSL2eFUUN0DYsZ4BLnhlHEC+QkUNwNIfdXEb90RILsp11sJh13
	 nsTrM3ztVoKoIgecTEjUg7YbmR+q4scxKYj5gI8FEAz+QrVQAzbM2p9kohEe09mRrOMRg
	 5s+o/ttApuvGCn5HYkO+L8sl9+eCX/663U+d09fpEEl6pFZOvDnG7DRSUZntgBE2Wh5Kz
	 y9/7KpJomv7eMzMk/ZudKF4WO3/DgnhQbIZUh7lIgHonyuGSy/oVSBo1Wfx8EJsfQOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
	b=TikSqAV2h/mm8EiBV1TVV0Qu6FpSzv7n6JkdNSqpRuHx6De37xmZGT1R1222iH/nJskr
	 vz8EJ91oRIdxD8wpXr0dLPouNQbzooqhjDUvkUfWX5eXzDMlD4ACunmGdk/dxspwtdFY4
	 hOiDFwCY2Jln9FUedxxzblBBnRBlIP7AEiEn14W35QbdJPJl4hjkhojD+UHUjHPuuvvzV
	 VdZSHSw2ZEIpQI5WbbMjg0LcINWJCl2JlJ6F4RQqCsImzcE8hSeQ1iQyieihqfOOR3khX
	 3Jd3jIbHcfaTEAVTB63fLnkrUw2X0eu2QlxOd1XW5eCSVsBJE0EYAnyd5GSW1rtLukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fzmqt7oK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STW2KqLq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406EC606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406EC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fzmqt7oK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STW2KqLq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nmNK442019
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=; b=Fzmqt7oKnOcfFg2u
	ewzqXgKKfY296D6RBHlr7RPnrOCjgyuFJnbMJqhtiEJQWIJBTquuOKWIYGdBcwot
	INFto1MfBzgi19DZZPHb0y0z9C1zYCmBUx70VgrUgS7cFxaKyDLdeH1pfFedbjSf
	i9dg2DBH1hCX2MTlbZef7q8nvqOO70v4NGKtKGIZe76ZSwVpvfYoOciD9jL2Duts
	3iCpK2mkIi76LYki8HF9r9jbPqHjuwI3K0/Bg3hqLCa5J3aiOP1BeDVOhkV6ptQh
	G7pE7dwjRtZ/+RgsqHyBvuVAJM6MdQ+0ns20RyFcDT2ZyRYrQb5hlkuB6q0BsZYo
	D4zh8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0ysf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:15:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so3707833b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478554; x=1795083354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
        b=STW2KqLqOztywiCCS3HM/5CkZC1TphJA0S6mo/W5O1wXA20QU/BxB3lrfVfcclmodt
         b9/z5lIThM3gLmeh0f5dFhfhy9zt0obpjdzJKttabHHblefbLLjEnuEnbiPxUKRE0JYT
         WSHHf1RB/wZIGwxHmEdARrdQhoO4aRv7K1HJN39FECqjdhNIW7jRBg63xWHXNCjjMrzU
         EhkvI5DLh4iinHEEBsKgGmk1D8+7tGQTv2XSYNwqZdQ9XhP4J283Tdihdf45akeCROAl
         4UEsstIXrHGA5xPw7ekcv21eM6akJCiSc2gDKKB1iHkezdDnT7llYgyinqah35iWO9lq
         gtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478554; x=1795083354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
        b=AyyCixqLY5Tc8MkqRvz21AUjpxNTJT/hG6VAhzz1VdzgzJ1zfg2jRMByEGkWKR5wYm
         pEGQsGcjAB5eLzeaR+9TeXfvzFiDniElxvMV+EOV5irabRMzPEqnh2nXThcubNWw37xI
         0lj3eV4kLl1BxX8XpDgnx5Uofl/WKNzwiNLIk3lmRW/jVLt9Q3bVcZ/ISudua7CaiK+P
         mkKIXhQVd2SAqIF53dWKeMh6HAtau9iYDnrv75hCT8pw97pmcVLq8pEkKXm/7dNWoMoI
         nqYoIxq5cwu0a0eqJheAMchQmg0HbGW7NLtIrs3CfNhc4BM0DK4eDjjqQWMiierXxzXH
         NRkg==
X-Forwarded-Encrypted: i=1; AL+hErEiG7Hfks4bu9mNHBGUckNyOR0rKYuvvMlJCdXCzNpQaDr29C8cCZsco6Wt2yWR6l7g6PKvjrG7WrHaLqcr@vger.kernel.org
X-Gm-Message-State: APuU4Z9O/q41J8vHR3gzTXkdsBNGrFqdXZXojMm7dAlpQ+R3Xx2IP+ff
	Kl6PuF9CJziY/0mYk1FS4ex1vjX5M5xfvouGZcJacqMI7qktHd2JgBE1N6UxkXt+y75+sFkVas0
	zyPB16BK9+oUxibZrhdwpv6/h4IZTo7UAifiqF8Wi4lpnNCn7sHRzYjFsij3oYbF5h3I2
X-Gm-Gg: AYBFou0NNPs4Mdq+v5yivp1wg5kO9YQ1mrLIKhwGktNAkQgH6/2yiiBX4QX8Lj+B6pC
	44JNOY7PhuKQPhcFI8g9p1ipzXQW4NYnSuhH3PMVWHpgADUDDn6xYpNaMT3Bn01PF1w1Mxt7MQz
	2WTS9HKn96UdmfukWxejYF8n72AYjTypaz7HdEyeywcct0PXvFrcqiRD6RtGAPgOUlmnHZxf1cf
	cphvUyj96SEm5Yaoglz+cIlKP0VE8A61K5XrnODHHlg0IGWP9jbOGNBifOamLo8L2rRV0SJVlr1
	QpL+LZxTIEw4vurszGiRAocjJ0k7aykZYkLnlfZE91ckGNJQvw2ENRG4j0yObO/iwZOl2SFs6Za
	UC91ZbqrpKvR8guBGvYOqe9/tJB+r8kTprGDza7UXs5m3K1IDtL5YbMeEHXrImeRPsSE5/KzH+a
	3t
X-Received: by 2002:a05:6a20:258b:b0:3e2:b400:2b04 with SMTP id adf61e73a8af0-3f2fecdd04cmr5825427637.45.1794478553657;
        Thu, 12 Nov 2026 02:15:53 -0800 (PST)
X-Received: by 2002:a05:6a20:258b:b0:3e2:b400:2b04 with SMTP id adf61e73a8af0-3f2fecdd04cmr5825386637.45.1794478553168;
        Thu, 12 Nov 2026 02:15:53 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:15:52 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:34 +0530
Subject: [PATCH 1/4] dt-bindings: display: bridge: Add Parade PS195
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
Message-Id: <20261112-mahua-hdmi-v1-1-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=3963;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7LNEKtT4mDMRU5sAzssLKLYmcuRayyy/4HBNgkZ2SGg=;
 b=U/AdJ+o45wb9voMrU2x2MRI1ftHCAd8QA/V23fnJsMKleV0BRWd/NRWn4JvLwt39el9WdiRnd
 TVKaAHUSTjhD7TYJe6mGwPBnrsgR2x2fHIzka11OamsKRpe6gDMvKmH
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: f5TXtEF9QEf6YymVDzNxqCfDhGUgba27
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXzDiNwo3thrQV
 LYcX24P0XbqJ/LJtxJJlBpDoFXO4KKk/3e9p9AGXSFTvtP4/XMt1VNzkXHLbBwlIs3PdGgaK15z
 3RgmUvdYLUamrRrBxbDLPsJkr4qUklo=
X-Proofpoint-GUID: f5TXtEF9QEf6YymVDzNxqCfDhGUgba27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX+gdHPynoU4G2
 RCu1oMB3PZFZtkf8BC39sHAwAEz1RHZ2g0xqbh2HAEZZ7ZWZ66wMOtDXEJVcvPeyg4tBDrZLKyt
 Ci+7YQjknnR8GU+CC7qgCxcr6ej/L5J9hETzW5uyWx9PeDyi7rOhzXiwEa3vc3TXwt628MnEf7L
 5uUgzGiX2ITLK0gxu/yOk2oKQhfvxAJ5+JRJr+ivJiEXLQ/Mgm4nYRZOtRqyAhuB5zfPFsc3f3b
 Sc6GP6qnHrRUOkgDTUrN22PPKPIhBiWCKH2BuzVRkXSTpMhEUE3276lBUo4K7bopfn/PY5oCXSo
 jfAZkx/VxcETzNVM4AtTD9YeHHJauf7YF8pfgukStIWIv0CxEJWUz/LotrYYvrRv8hbQtERgoVV
 6MpdtoWaYKL+JDSOmAtCZvVp5mIWn5ckc3B31lmg2kYD9P6O69hBr5DTcGQURe51SSNRhawtdMq
 RYnpMwndudI5ds8zKxA==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af591da cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8
 a=xQKGsFAfKFO7eTD4QCIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
its power supplies, optional reset GPIO and display ports.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/bridge/parade,ps195.yaml      | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
new file mode 100644
index 000000000000..089191570ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/parade,ps195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS195 DisplayPort to HDMI protocol converter
+
+maintainers:
+  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
+
+description:
+  The PS195 converts DisplayPort input to HDMI output. Firmware loaded from
+  an external SPI flash handles link training, EDID access and hotplug
+  detection. This binding describes operation without host control of
+  the device registers. The optional I2C control port is not required for
+  display operation. Reset may be controlled by a GPIO or released by a
+  board resistor-capacitor network.
+
+properties:
+  compatible:
+    const: parade,ps195
+
+  vdd09-supply:
+    description: 0.95 V core and analog supply.
+
+  vdd12-supply:
+    description: 1.2 V I/O supply.
+
+  vdd33-supply:
+    description: 3.3 V supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESETB input.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: DisplayPort input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: HDMI output.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - vdd09-supply
+  - vdd12-supply
+  - vdd33-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    hdmi-bridge {
+        compatible = "parade,ps195";
+
+        vdd09-supply = <&vreg_hdmi_0p95>;
+        vdd12-supply = <&vreg_hdmi_1p2>;
+        vdd33-supply = <&vreg_hdmi_3p3>;
+
+        reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_in: endpoint {
+                    remote-endpoint = <&dp_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_out: endpoint {
+                    remote-endpoint = <&hdmi_connector_in>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..9e1db88ec1c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
 F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
 
+DRM DRIVER FOR PARADE PS195 BRIDGE CHIP
+M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
 F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml

-- 
2.34.1

