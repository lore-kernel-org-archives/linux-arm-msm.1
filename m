Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7A49E5FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049948; cv=none; b=YQq6QgYc+6a/ZaN2lCLpyEYHXK309LVAxZbTQKPdeRK1fOnVbvyy8ZunTc5SXxh8zcXEwxWXescYT+9bAMmdSPk1DAMEOgZK3edmiaG1ESSkPtF/HPhkFr3Ec4QOCQXnHKrVn2Cu2PXZkEZY7uex1L40g7ouuNTjHTCEeWTr7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049948; c=relaxed/simple;
	bh=TLBJP8SeoQI3wL4Uv+WS/xB5MwIFcnAFu5CR8nc6eYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRjcfEsr7D7zcqffU4wSlKa5kYOnog2g4utLYZSGauTp/mh/+JeJmyTQ+PqbmgfpobAqWQwlaVIK7nJhYIb6d1L7gB75zcuc7DocgJaCHCmTtrT8D2Zqaym7cjCucVeIQxiyXM5YPywqZhcGMEWVIUnCl8iBPuaTKnSGv9OjVos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sp0POdzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibTEMIHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sp0POdzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibTEMIHQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wlWX1889647
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvFYLfipcLVoBfHgUOI0+DbMhkvcbOeJfRf3ILufwjg=; b=Sp0POdzVEsBjoQNP
	8f6jOAJL/WtdgOD3Ckr9jQEbcNWxjippVpuLGkN8GrnmW0PJwbbjz/VO+mGoi95R
	v6KGoF4McmZjUrAlk1TNNW6SJACIJ0lq+ByBLtWcKL6fvNuhovzG6ilp3TyTJi/i
	ex7gjLoxdj0zbJugyXyg/1xaF7bH9/AQc/0hOB0fRhAJXnj/ygyWat19gXAGjavc
	6gKKflzz34Vk35v/CaiMdYARezyuQGggthQG9fupNb+zh/EopaNCuEHGMUoYPTc9
	4vH7DsBWefoKBLkVqxILDrSDCp7t4HzfQ+WltAF0JVH6sOYdTaf4a9bjiy+QSi/P
	/fF6Lg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0sbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:39:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso44161025ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792049942; x=1792654742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvFYLfipcLVoBfHgUOI0+DbMhkvcbOeJfRf3ILufwjg=;
        b=ibTEMIHQU/OYZiWcxnwVy+3oHuNT5yDrCWm3fsGI+n/iMw3Icpc1Iao8owWdNgwS7h
         vZkPVn6kGuAgAaSsaA4+8+XCb0zWLv4/P4GeGYjpzhvXr41nOxqumcTJah8lDx1pZFMH
         1iJAiL8dhap7fZZzAIearvuUa0ObIUjivzQALgw86tVsoIiWy8Hzu2o75sI4doJHvMsh
         F2J6th2Hbg/UDbdmGE4C1yO5idWwB6F7l4HoPfJrvqXAxbCGezCz8zO1tJGt1KV9i7XL
         wzfkhHKtG2KxlMRGfvVpWrvRmEnme11V60v1GNu+x0oShNGBYBG5VJ+P8q3clfW/bjdL
         tUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049942; x=1792654742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvFYLfipcLVoBfHgUOI0+DbMhkvcbOeJfRf3ILufwjg=;
        b=2x6rLoNjlsxD+GT6JLNSehZ8Z8/TAQ183I5j3ITETHX9ApCiAmOsGwMbf+kUnWKrZh
         MgN6NTUY63BF3f+eq/UqmMQp/s3RiS0ac8YNikDFalt6mdoUEeQaejUk2YpvPrzJIxHV
         VIXE8bCdavNwajl63yrbEblpWuEv3n9IXPLccfEhkhtUShTjY1kviDd0ZIew5NQUGKdE
         jhrB3YvXz7lXamEF9aoSR7sTNT3Qga/rJxyQinRuEi9w7rmWriQOUBr43F4/nqIqapTg
         f1N+0exfnBHnTsXexva+BgAKUAGdhDYflm1D4jR8uUTN4rhDxYdig1fpXjF4aqbzfoEe
         D5yw==
X-Gm-Message-State: AFq9FYLBCk+VX+6w/5flk3WyyzMR/NN9fAuIyK0MJoIIT9tpvHBtNcga
	hbWKaPv+bKtIvPjYStnpzvsKCs4yDktNZfRbnK9/EQq4Qf2rGhwSNnmk7QQMBf7JTgSS0MZzes2
	8XzgSdaAxe95/KfGYs5qCzUkgmdfmKLUcpPN6SKECqWxY+tWz8avd9GMvlQyQrLfHEuxo
X-Gm-Gg: AYBFou2Fr8fCTRzEAqL1FE5MmYlmC+TRbegCQ9FE8F/cWBSLyJmoW7RmajWaB4DWivR
	gaX4s8PqyS6ig5f+K3dB9OnjB0+rAN36sHC5AatIB7Ys56KVZjvQPH8m/edHi+h4xWa3siiQVgp
	YFTkrBoUzemxeza0y5SjGJFId3SOxxh3jn6Pw/XSkQqzn1j0uZj47HtqUGXVtbO+o+8UXnhNybq
	D5edFH6B/G1T+XkTdfX2Xz1RMIdAPJc3vnfXkQuOO3CpMCCNXlhFSlqqTjnc1BiNfWQzH2QKzLF
	4+E+L9lEVyKHKdNO3a3r6CGJiBwFkqk0Jhn77WqoEnB50a6qka0MwURqWJWSwKrMaJ6eVP3WIjJ
	WksGwx09DMhkDJD17Z5R1SGRg5sYIbOUXKz8=
X-Received: by 2002:a17:903:3886:b0:2e8:795d:34f5 with SMTP id d9443c01a7336-2e8795d4702mr141414405ad.52.1792049942189;
        Thu, 15 Oct 2026 00:39:02 -0700 (PDT)
X-Received: by 2002:a17:903:3886:b0:2e8:795d:34f5 with SMTP id d9443c01a7336-2e8795d4702mr141413985ad.52.1792049941637;
        Thu, 15 Oct 2026 00:39:01 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:39:01 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:21 +0530
Subject: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=10253;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=TLBJP8SeoQI3wL4Uv+WS/xB5MwIFcnAFu5CR8nc6eYo=;
 b=eNxcsc69Y8Jo5l1qC3TRVrdnDWJBcU/OMw+5y9ixMTGjI+fxA+/LkdFlDxyedlHibtsx/oh5O
 dhzn4+iWQT8Cp5RfMWhA110+xEzgxMYJ+ZO1Bj9kzTMzhXA5UBDSpMk
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX8e30KjbitYJa
 B3SKkQwwXybsOPdML/LfNoC19cCPdNoj3zDZZDNLMUE5QBhOJbPtMlv1HMd3E4+REDjgVHl8ess
 w8YMcSCzqPduevWu+VDF+RJf9v1UJPs=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad08317 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Mqdkvc8JU3O6ZvK96OYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 7MjNIkl4XciDq87iimxi8fiYhw-qgiik
X-Proofpoint-ORIG-GUID: 7MjNIkl4XciDq87iimxi8fiYhw-qgiik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfXyjQDmqiJuQCK
 zzkhi4W9/uPEK0x3+gIcI6pvyQq29v4LiwLq+bnbFw20lha/9oq3zEdzu0fcAnvumzufTZWLO/v
 +3zWH4QrjsLYYt7CTDU1uRirMLnLFdwELc0djxeF+G3YgKSVffA4NNVxYHk3a5Vvy37RAiui9Hh
 EPvWa/73z90IjPohrcSkaEy/pp+c3RxVH1LNYXym/qs5CRnS+nDNfpku+JVrWx2a8vssyolySBC
 ofimha6hxxpcpamVc8HijeqxJwE/wruvR1k2e91wphAQbtlsazAuj9LVlMxcZVyRCKyDsxi7Vid
 pNNWIkfGDFVkYcg66wx4JqPR0jNd1OMy7n9tuqkaHdK0KP/xcUFfbBGsF0QE6uzM/amfiItexGb
 ut38UB7kywwZ2IPiSCeUqHlz4W3JdUBnudCmTpi8+7S/XeOFn/TVt7d4Ey6LajMgBg6eZRRX1EY
 w5FkYmvYI/QGRmnL8Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150030

DCP platforms place the display pipeline under firmware control, so Linux
cannot discover display resources through direct register access. The DRM
driver therefore needs device-tree descriptions of the firmware transport,
display topology, IOMMU contexts, and panel connections.

Add bindings for the Qualcomm DCP VirtIO display function, including the
INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
IPCC power-notify mailbox and interrupts, firmware display topology, and
firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
 .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
 .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
 3 files changed, 307 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
new file mode 100644
index 000000000000..f7178c66c09e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP DSI host
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
+  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
+  Qualcomm SoCs, not specific to any one of them; Hawi is its first
+  platform. The DSI host and its connection to a panel are described
+  using the standard DSI controller and OF graph properties.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  reg:
+    maxItems: 1
+    description: Index of this DSI host among its siblings.
+
+  status: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      port@0: Input from the DCP virtio device's DPU INTF output port.
+      port@1: Output to the attached panel.
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+required:
+  - reg
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dcp-subsystem {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsi@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dcp_dsi0_in: endpoint {
+                        remote-endpoint = <&dcp_intf1_out>;
+                    };
+                };
+
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
new file mode 100644
index 000000000000..018694310dfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP VirtIO host
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO transport and
+  the host-side IPCC channel used to wake the DCP firmware.
+
+properties:
+  compatible:
+    contains:
+      const: qcom,dcp-virtio
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  iommu-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  interrupts-extended:
+    minItems: 2
+
+  interrupt-names:
+    items:
+      - const: virtio
+      - const: dcp_power_notify_irq
+
+  dma-coherent: true
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    const: dcp-power-tx
+
+  dcp-subsystem:
+    $ref: qcom,dcp.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - iommus
+  - dcp-subsystem
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    virtio@9be8000 {
+        compatible = "qcom,dcp-virtio", "virtio,mmio";
+        reg = <0x09be8000 0x1000>;
+        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "virtio", "dcp_power_notify_irq";
+        iommus = <&apps_smmu 0x15a3 0x0>;
+        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+        dma-coherent;
+        mboxes = <&ipcc 13 5>;
+        mbox-names = "dcp-power-tx";
+
+        dcp-subsystem {
+            compatible = "virtio,device34";
+            iommus = <&apps_smmu 0x400 0x2>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+                    dcp_intf1_out: endpoint {
+                        remote-endpoint = <&dcp_dsi0_in>;
+                    };
+                };
+            };
+
+            dsi@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        dcp_dsi0_in: endpoint {
+                            remote-endpoint = <&dcp_intf1_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
new file mode 100644
index 000000000000..0ca00a567e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Co-Processor (DCP)
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  The Display Co-Processor (DCP) is a firmware-owned display subsystem.
+  Linux communicates with DCP over HFI through VirtIO and does not access
+  display hardware registers directly.
+
+  This node describes the externally connected display graph between DCP
+  INTF outputs and DSI hosts. Firmware capabilities and internal resources,
+  including pipes, mixers, CRTCs, and clocks, are discovered at runtime.
+
+  The compatible string "virtio,device34" encodes device ID 52 (0x34). It is
+  a provisional local ID pending registration of the DCP HFI VirtIO device.
+
+allOf:
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+properties:
+  compatible:
+    const: virtio,device34
+
+  iommus:
+    maxItems: 1
+    description:
+      SMMU context used by DCP firmware to access GEM framebuffers. This
+      is separate from the HFI transport context specified by the
+      iommus property on the parent virtio,mmio node.
+      The child context is used for framebuffer DMA performed by DCP
+      firmware, while the parent context is used for VirtIO transport and HFI
+      queue buffers. These contexts represent distinct firmware-visible DMA
+      address spaces and must not be used interchangeably.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      DPU INTF output ports. Port number matches INTF index:
+        port@0: INTF0 (no bridge in this series)
+        port@1: INTF1 -> DSI0
+        port@2: INTF2 -> DSI1
+        port@3: INTF3 (no bridge in this series)
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+
+patternProperties:
+  "^dsi@[0-9]+$":
+    $ref: qcom,dcp-dsi.yaml#
+
+required:
+  - compatible
+  - iommus
+  - "#address-cells"
+  - "#size-cells"
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dcp-subsystem {
+        compatible = "virtio,device34";
+
+        iommus = <&apps_smmu 0x400 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@1 {
+                reg = <1>;
+                dcp_intf1_out: endpoint {
+                    remote-endpoint = <&dcp_dsi0_in>;
+                };
+            };
+        };
+
+        dsi@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dcp_dsi0_in: endpoint {
+                        remote-endpoint = <&dcp_intf1_out>;
+                    };
+                };
+
+            };
+        };
+    };

-- 
2.43.0

