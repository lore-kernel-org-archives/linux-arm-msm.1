Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922702;
	b=mEMQBmbXdbHrT/do+IF2ZPh4ivdyW/E3i2z2Ptsivp34aOZNM2KCQB8MHnS1vHu/tl/K
	 1Z0KW+5c21tDh3Qqydb+erNH1fhJtWNWfkyMFuRjRdQD9ooLb8ly5jIlsBB++V7xi3AdZ
	 gbwKHj1uUllNY4QUEF0dg/380fZ/f5xHrxRdeIAt3aOccH8a2aYYAsK/0fCOUFLJJdSuq
	 etCoO29/cMLIdK/JfLcFI6Qsx4/fgdA+BqRRnJQJpUuv/qWkWrN0YORNIgXAKEbDlprtr
	 svu2uRoqvK1YDLgfdLS6qDb0fGz04ur5hUAXVVe/PNvfVb6eBgsRrP2+VUok+nMES6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wQ8g8D6PdrioNd+J6q0+/Z6V0jbd6NtoniNfp8rGFZc=;
	b=NTCA6qdaK8h1S56R0gEM82z4hEoFuo46oxNmcCMVZOOKv4iRcjgworL/7V8uwTBYCIZV
	 Vx+VhCb0WHRrMhZo8cK16nc5CbI30dDcwnl1eJ4k7ZNSKTk0B7ZG7mwfpFJ8wqbJru1SK
	 cGDMfHUL7MPs0aujy3BlFdfZi5vqaQh5pgDJhAErVPowcnGtTwzDth9LN6PqBbWsymWD0
	 jjJwHD1aUMDW3n4rY+3fc9hSBMNDoGM87oG8Hd4VfBVSxJ80znVzq+yK2IWRBKfaUt13U
	 pu9KB3R0ttHTWOSEU1/HTbI9asxUtFHvy1+sWZ6/X2kFzs6BBtOh8Vt9X7/87oPC3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XZxr/k8M";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxFzFPv7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352FC606A339
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 23:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352FC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZxr/k8M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxFzFPv7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeZOZ1308874
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 23:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wQ8g8D6Pdri
	oNd+J6q0+/Z6V0jbd6NtoniNfp8rGFZc=; b=XZxr/k8MKikdcK3P7mefPYSFodb
	6Y+UfxEr0cbPGHEGpnAFCg3gGX+DrO62rxLynSklsdnAIgqcYd1oxa3Mk8liJrTT
	ny0rw3ndoQyQpUE3A/MCd8MxZ86nq8ZuaQfDrnUYts8aow5F3GQYWk4JtOQ7NytT
	lb+TIPoOfjrJ68GdbVwgnP8dRHEn2tH5l5icBefOrLgZGKcgMFhlbPNQx+tjbY6S
	fDW70YxAexBtUu2wkG8nRfMStoWcbWfgHZiT9jT9VZq4roTF8hLEulNOHftQ/c2f
	Rp/2whVvGtdJT2CjztjVKVMRRd3bjW6XMYJ8JRhxiZ/G6PTsAQGoHjql7kA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p980xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 23:51:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so277426c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922701; x=1794527501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQ8g8D6PdrioNd+J6q0+/Z6V0jbd6NtoniNfp8rGFZc=;
        b=PxFzFPv7nKtFwTF5nKb+QPBjG/Q8iWDzYiZMUZOxz5ukXmJTLSUoRVMBzhasvjPAix
         34A/Bdw9y6uH8rSOOnqnP8xCjumPvfTiR69joZITB7q54Ggb+fRxeWN9wjwDwlCKpggL
         X/hnQ9TxR/d6wvpaITWIyrPzGFDxl+SkV8RzxJztgGGhPYiYVil74BQFa+7hQQd1Q3XV
         wgYxQ99s6UZLuEE7ybwNGh6ByeAj8Dt1S0mOi0DO9GyUddkODA6kWAyc05JMJV/DWYem
         4BQrfuyyMKZFOq/cESQRL1008674tDkBXUTYFyAbKPsGhisz/x4nOh2KEf/Y3y0hrHzJ
         BxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922701; x=1794527501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQ8g8D6PdrioNd+J6q0+/Z6V0jbd6NtoniNfp8rGFZc=;
        b=g0XdXENSDPHJOL9T5KqpvjypJI3Psro1cexzKy+RIcJxP6h0bA0ME+2WwezuMGTZAV
         FXJgf91YQyBXI7uBZRr0Z0bjydaXeZBnWXaGRDINgYWxRCQHb9WWQuhoQthDGXCfU9Wz
         EoTMYuOlvH8fjl4UDyqs5YTPxCfk3oCoLQgVR8Nxe8RkH+B9an6eOSEXDJ1c+TAkRHFO
         7i1fW6qYvWlJq6kHllYxa7DjcmqzwlABNvgS1qn2kSdko1Wjm2opTvalwx5CNQ6/HelZ
         BeB7xmS4O3ea0+W9aCMvmqLwBGdlHrQioWNBtuCF4ZUn2y+C6updznHEPlwWbt0Bc6JA
         HAFA==
X-Forwarded-Encrypted: i=1; AKwUvBxZO7k8JffIrW6z/5Oe84DUsb7AHX28PotYibQok+uuQTpPqWBfv16EyUVWy4NZpRRrwTh5zeO+HPkQmAWu@vger.kernel.org
X-Gm-Message-State: APuU4Z8QAtFXT0QnisDPhkRnQd6PbuWydoCNnkSzeLWxHODxbZ4l1kvB
	aWB6nkjSHpqXoLr5Yqyz6qorCJk22kWUqoJYv71/Pk2qGqm9KMjLjgR6AiEnXDTfgEujd4aCq9A
	Wpfjehxzbt7GVqMLxkGeqYmEehcMe3TSuduGXQDJWjMChp3wRdezxnRHQ6ZEIO+K/l33O
X-Gm-Gg: AYBFou3yND4G/YnO3GnO2080Zn6eIq1aFBccSRa0CLcUInS2VsH1Td8SXOlrqFzhXPQ
	48CML58xau3M6ReG5pY6EAcjw0lNjRZM3a6IsHWlhSt82etjMx1KpRIiLopp+urW0PLXv4/ORPZ
	6BTJeZzmfevEZafDTJrg70u92VRStCDlfBUKOOSXlsX7CAiDd6LzTP1o7ymw6terNJ1/BmguvXa
	FYuJ5v5A7XNDo7tbIVT10ffTK1/hsC16v7B0nt40tjbbiqDe7rDsKi4YXHHPIltyR/RS9DNKh2S
	/KgZQ3mrXUKuw7jzFx3zu8ttVFsyRzLHt3HEoXubKrq/1NeHM/U1vEbxjjGfee6VyHaUkzsFXBz
	C1OkvGcbLEfkjp8KPdNS17YVqq2n/+EaUFXCoqMJvb3Tq0CVjn2JoBCuyfQlqqDVCm/oLeNTqg6
	/X5EjeVwBPPYFhBypmgY7+6sqK80U=
X-Received: by 2002:a05:7022:158c:b0:1b2:5884:a020 with SMTP id a92af1059eb24-1b25d28c3bfmr962373c88.6.1793922700487;
        Thu, 05 Nov 2026 15:51:40 -0800 (PST)
X-Received: by 2002:a05:7022:158c:b0:1b2:5884:a020 with SMTP id a92af1059eb24-1b25d28c3bfmr962309c88.6.1793922699871;
        Thu, 05 Nov 2026 15:51:39 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:39 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom: Add common qcom,csi2-phy
Date: Thu,  5 Nov 2026 15:51:34 -0800
Message-Id: <20261105235137.2635442-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: g93IYW8VdZC9-YHWX_SYLPoK97sZQV4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX/EAG5+fZ1diX
 u3+6m3TEfyPojVQ2umNS3xhWzo/mpCKR9/yNSgjeLDheFJlnyANtLWRV7zTb7zuYpH1s7kz1+Zy
 zzKWkQAP0vlTPS8/shhW1F7rZrYy3O6Er6k/u7NtMod35akEu71yLrPZrGqHxn/eSXhxM1bF87N
 Cn/AEAAdWWpItktRTEE5C0ZWXyAfBwaaZm6x18U9oAgqsFR9a4JpRSZQs9Pc1pqAxvf3dE2Ea0Z
 7jxcuXgISnksINV1gxt0JeCplehcV6GtafWfs1IoP4QHqBtrelL+FK4l2aCVB+rEIhC3HiikssI
 SGf37UoaoXhDMbJUoOZMxvtvRFtqN3IJ4xCjAnfkXlrQnhz5KYtXppmg4grjo+qFLsevUkuccvN
 K4jzHjjThw8f+Ny35CBWywksEnHECvSdZt2mpUjBtRw5aCUbjzsWygqt+Rwf96twu9K1CmP0Aif
 Z3NLeKIk5PBVjLkG0bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX98Dq7KhPwN9w
 bRo447UmjTokMcWTpTfcrWOh/3wYPmibHD9p8MapFktPfcTugZgmVAPtYurptLffp7H+oevgvkA
 tvWQJ2t8yKLpcQGc4gJeQeMtJYijmNg=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed168d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Qi6pjpdL7GA_D8ehSiUA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: g93IYW8VdZC9-YHWX_SYLPoK97sZQV4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
clocks, single "top" power-domain, vdda-hs/vdda-lp supplies).

Describe all three with a single qcom,csi2-phy.yaml and a compatible
oneOf, rather than one standalone schema per SoC. QCS8300 is further
required to be paired with a qcom,sa8775p-csi2-phy fallback
compatible, the same way other Qualcomm bindings express full
hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
match entry rather than carrying a duplicate one.

qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
(3 clocks, 3 power-domains, different supply names, DPHY split-mode
support) and is left untouched, but port@0's DPHY split-mode
definition (two endpoints, lane-count constraint) is cloned into this
schema rather than dropped, since this PHY supports the same split
mode.

The supply names are vdda-hs/vdda-lp rather than the hardware's own
power-rail names, since those names aren't guaranteed to stay
consistent across future platforms using this binding.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,csi2-phy.yaml           | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
new file mode 100644
index 000000000000..44791802a3ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sa8775p-csi2-phy
+          - qcom,sc7280-csi2-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-csi2-phy
+          - const: qcom,sa8775p-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: top
+
+  vdda-hs-supply:
+    description: Phandle to PHY supply.
+
+  vdda-lp-supply:
+    description: Phandle to PLL supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. Always present. A single sensor is described by a
+          single endpoint with one to four data lanes, numbered 1-4. The
+          clock lane is position 0.
+
+          DPHY split mode, where two independent sensors share the PHY, is
+          described by two endpoints. endpoint@0 uses data lanes 1 or 1-2,
+          clock lane position 0; endpoint@1 uses data lane 3, clock lane
+          position 4.
+
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[01])?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+        allOf:
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      maxItems: 2
+                      items:
+                        maximum: 2
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      items:
+                        - const: 3
+              required:
+                - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-hs-supply
+  - vdda-lp-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    phy@ac9c000 {
+        compatible = "qcom,sa8775p-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domain-names = "top";
+
+        vdda-hs-supply = <&vreg_l4a>;
+        vdda-lp-supply = <&vreg_l1c>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

