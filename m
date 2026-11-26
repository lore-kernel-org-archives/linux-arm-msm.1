Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674577;
	b=u8VmpIDyxEyyhIX5vLl7hMCY8z1aCFjIghBkDFQZhQIlpu7SNNyJpdC4dLCbdYkio1VT
	 qh55SFsrNbnuXt7pMnpFXHbZNYKRs6eu9JE1AaKhDbys7KuiwU3eWOmcNVxeJ+2CH+Jcb
	 1sloasv+ggHTYb01GWNFZ6SFqKfSXqJRyp0RubQj2mQzXjZCi2WcE4kaR0SX/8Y9MWSec
	 RDTKMROYS+zwssJZGVk08yyeiHET7/hlnVJGjXzQR9JzOQ3ziCBGZYzmNvLSzF1BOk7jQ
	 g5X3S53HzP82D2XEfncgcEh5STUt8v+tI0/XFfgwuQL5KqLK2xWJ4GVTLn2lokyMA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=;
	b=vlGQ5y4cfnMK+ClEZQs8W9pHSfgoDbgYQA2VKrAJ/3pOat7gl2UKEiYxHm4RIsbODyhM
	 TGXo2F3sapAgbpAcHJmTFGZzF25d69KgmyW0wMJWnyioSWxcS2W1zwOIoP3TcImlsPxEM
	 YrerlyZ4jcE+DFWMOKEX86eq9zx8wLIpjfhbsabBls7PyPyZ4cmypO3chkbobKbaKZekn
	 /Ou0/0cEsGlc0oMwpoh8vwAd8TEqr/HrXZjROBTejnh8rFdFdAJHi7KoRPR65ZUwwVRhU
	 mpGFIthzG14GGhJyunIMkN+IHH6tDUXtyaq3EpS1/7IIOdtDCHjBNZ91v8CxlR1b3Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCqu1GYw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JW8xomEt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F7606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A22F7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCqu1GYw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JW8xomEt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36RCU1686558
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=; b=BCqu1GYwyhMRar90
	F3tVAfRuWe9jmCt7/sQOhllTwblDM5If+TL5KTf3iXNiK7hU/MVyu7VbSjcPHMwL
	cPi0ftAJDIAChGgzV0OXc4+WbMRed9k/hsCfQo3lLZ1uVl6Wmkq5FYQM5hMD4xR2
	/xsoRCDVMkvV/u1sj23elw3ZkA2kT0lieoXFrV7+fP3JCwvWi5EgiUPcSLsfrAcH
	tYW+aiM5m5dvcsSDwO6cEs1Tf+xgdAlYp6xPUxu8//ydVS+FXmIwy5Mg9gIpZCX6
	BdhiriceQrr7W1gtAIzbmOmUz1/UewB1Q1yGA8mQcRMYMl2YBKTSjlIs9TC+vePL
	aE35Yg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9k7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:29:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cddf142187aso3307555a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674574; x=1796279374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=;
        b=JW8xomEtCRXqVe8b/Z+pQTkGfoyR42drhULCuBqcFbVHoojLhHmDTUIfmJILdiYUD8
         DUvM/wmPVec03Hs1tpco5bVHP7DJL2w5VV2AclCnM8nBGRAdMTEoHkFN/IX3jKGGMUPG
         2VhAFoD3oTiHH81CFP4/0cSXw9Wvd1H9qxu/rBAGjUHB2EoumbwAldNxlXYR2BYCEDhP
         2h4s0rpQyjSSCqpxQDcDKSod3fSdse8Abl9Pq1JGt3aaRJqLHv6plGLUsikP7o5wZIEh
         GMZpOxIOajjj+6T6xdQnORqRdUjU/NJOG2zEXDy50j/OYVLBgWHdRyCp6ul1SteiE751
         CK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674574; x=1796279374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=;
        b=g+Ad9mEENZVSG0SLB/Cfkv4YmN1XORUL66wd6fM9MfCXooeyxW+2vwpGznw4BEES7h
         l4cnJnFIMHqWDjyEwRjeHvC6n7E1QFWDLdnkKUMoHRJhAEUzYYEE+KVzYK3xhG9ZMnKP
         mR4qsjq6zouo57GBty/ccytpYGuOEZaNOwGMWl25QcMosyGumph2rb+uwXeD/NknWp9x
         UX5ZWbE7nmmudg/wcghLgChntLcWUAD1IB7gvuKlZF5t1cOsOSWAGnAIiNuHEpQS4weH
         HBEkBZDoOO9oTOY/Vzrzr2M/HmRLhYiPH460VWWebODDOTlwdt5ig2RMgla9+3w1VFGX
         O0iQ==
X-Forwarded-Encrypted: i=1; AL+hErGWVkyL9Al64LcyK1CBSRW1wjwqMX5i3gdy5M+0n+p7xgd1oACueh7o/ZXp1mfRqx/fBxrVEdDZvmVANPCk@vger.kernel.org
X-Gm-Message-State: APuU4Z9wlOs4g2qhiWUbZYQutLg8dqCehEfnWxO9PCLAv5+Bps+gikIo
	Ln2u2Gm9T0vk4lHhcwApF/CsPWmUbfB7AIxIESBO/8lNyXpqD5DQUaBcs8DWYirQi6iEKFiFkD7
	vrQDK8v83IT4BE0MLaUljkrw0cTEzB2A4YcjoXB4T07PP3OYrrrQW4+7k8jsrl2/KkVuZ
X-Gm-Gg: AZFdTZfC5gsupwZ4f1a8IvUThs7ey5SWHrQjHRpPhMhEXIJENGV3fhC7uLmFbybbOpC
	h/7bQkBLKa18/1fpRCpIN1HfWvvffZZ/iRYinb8gb8n+lN2rBN29E8fm9Ir3CuZDiTXEWXTZ2nQ
	VrD+20VTI5iYFTDugxmMSqxZOC2OGLZzFukq4eeOYStZenuRwK8itzw/KDozRvHr/QYfCMQLlXi
	O6Rl6WgFnEJIi8mRLULlIdBTFkCIGv1SqTHSVL5OU6TKEr/hX+C6gSM5F14V6LUynVQeEz+5uOr
	CtsWNq3ySQOPef8up04i0u3qd8mF55/nZujh4z16VqyAikBQ/z1rujtdJp1/uofS+Ydbe7YPOBS
	r/DU6PBZINQY57zNZfrwvmqQ/G5yBRyILjovd8vISpV/d/JCs6JdlkUJXAVE9xMOFjWumJKt62U
	l+ZwTZYRe8
X-Received: by 2002:a17:902:d4c7:b0:2f0:4f8a:c166 with SMTP id d9443c01a7336-2f04f8ac351mr173957695ad.56.1795674574456;
        Wed, 25 Nov 2026 22:29:34 -0800 (PST)
X-Received: by 2002:a17:902:d4c7:b0:2f0:4f8a:c166 with SMTP id d9443c01a7336-2f04f8ac351mr173957405ad.56.1795674573906;
        Wed, 25 Nov 2026 22:29:33 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:29:33 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:09 +0530
Subject: [PATCH v3 01/21] dt-bindings: display: msm: Add Qualcomm DCP
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-1-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
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
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=5709;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=U6TxkZ8CuOVRovKLZXYMgwd7nNnUigtqivShqty42v8=;
 b=KuI+bWQmRi9fvCvyVl7QjCUcVdHutgwKIzjrubWNefS9OEYZxBFON3Km5R3thcyiMHA7PXxmT
 WKjkb3y6K+KBYV4YX/BDa3TZ9zBK3HKNHPikgH3FKzcrN91K6c3qPeh
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: x5H6eVePZrdMw83TUL_WXv2iUbiAK6hx
X-Proofpoint-GUID: x5H6eVePZrdMw83TUL_WXv2iUbiAK6hx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX7qq7taroPpFQ
 YlGVF208OlEUCml4DMB5UXNPa3tSOJuN391NTi6UPycEoqycZJKbz7C7yTUPuo+ernIXEBVSGKx
 alC6+XFJftF2WljpG4ybTY/euf6pyoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX3b+HP7fA03TF
 hDB5xlKOKzjw0y+z4lz7fUVZMotyg6wA9nxidolkSykgvm5w5Yy+Y6JJ6TriTJI/NECFCYtm0o2
 ya0esPSTBCgiXfBLFztGPB8DJa/9SfjstmZ55z29il8mML/7Paarkhbkg6GyKtzkRchHPHVaD/j
 VqhRZCPpLn0OFpGum/ZwUD2fcFoxbjfuqDjDYYEVHsWBvPBSz0mJB6xHGKh9Nun1K0FxQLpsSyO
 XNJYRw/TkNRoPommgjnyMnUCrltDdejRXmEQOoQ8E7b4fllCGSKBy7VN63lIv7/FI08oyFhMOrh
 XzVazZp+9z08Nv9cPFisk9MghyoT2pOIqQq8U+AMDtpE84I+OPbzqkZ+9rzdsVFZOqhZx1pLvg6
 TosdczZFQR4bXCrAGO/1NnZQoNpU6fg0LsQ2BbDohricH9I078SyqbXXQY2y4C/j9Lt9TVNnGXx
 DNb/WvY6Ots8VBTgGpQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07d1cf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=odQccb9QLjelfSTPidkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Add a binding for the Qualcomm DCP VirtIO display function.
Document the framebuffer IOMMU context, DCP INTF output graph, DSI host
indices, and connections to the external display chain. Firmware-owned
display resources and internal paths are discovered at runtime.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
new file mode 100644
index 000000000000..ff7dc4e5c5ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
@@ -0,0 +1,159 @@
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
+  INTF outputs and attached DSI panels. It is assigned to the VirtIO device
+  by the Qualcomm transport driver and is not independently enumerated.
+  Firmware capabilities and internal resources, including pipes, mixers,
+  CRTCs, and clocks, are discovered at runtime.
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
+      iommus property on the parent DCP transport node.
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
+      DPU INTF output-only ports. The port number matches the firmware INTF
+      index. The corresponding interface@N child has a reg value matching
+      the port number; its protocol-specific child describes the display
+      interface. The graph endpoint itself connects directly to the attached
+      panel. Each INTF index is represented by one interface node, avoiding
+      duplicate reg values when different interface protocols are used.
+      Unused INTF ports are omitted.
+    unevaluatedProperties: false
+    patternProperties:
+      "^port@[0-9a-f]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            required:
+              - remote-endpoint
+
+patternProperties:
+  "^interface@[0-9a-f]+$":
+    type: object
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+      reg:
+        maxItems: 1
+        description: DCP INTF index matching the output port.
+    patternProperties:
+      "^dsi@[0-9a-f]+$":
+        type: object
+        allOf:
+          - $ref: /schemas/display/dsi-controller.yaml#
+        properties:
+          reg:
+            maxItems: 1
+            description: DSI host index.
+        required:
+          - reg
+          - "#address-cells"
+          - "#size-cells"
+        unevaluatedProperties: false
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+    unevaluatedProperties: false
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    display-subsystem {
+        compatible = "virtio,device34";
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
+                    remote-endpoint = <&panel_dcp_in>;
+                };
+            };
+        };
+
+        interface@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            dsi@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                panel@0 {
+                    compatible = "novatek,nt37801";
+                    reg = <0>;
+
+                    vddio-supply = <&vreg_l12b_1p8>;
+                    vci-supply = <&vreg_l13b_3p0>;
+                    vdd-supply = <&display_panel_vdd>;
+                    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+                    port {
+                        panel_dcp_in: endpoint {
+                            remote-endpoint = <&dcp_intf1_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

