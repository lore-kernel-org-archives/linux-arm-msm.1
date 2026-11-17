Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900805;
	b=FrWWcDNvupIl3rc4/M7rd/mwbEsbeTDLFC6QZmMVUviZO+UVOZJiBx/8RmFbbDedVgR3
	 NswIdL8ILhxa44+VDmZ54P2c8EBD7BLOIrYgS56hCJnIQVWSGHPY3SwXFvpBwWZicuBmA
	 LyqKo4gLL8o/sRgP+nCTBRuTaJPucbQJ1TB+l2ooYP7YgXkM30zcfjILfJgATsn2mJgjs
	 NzKtYJPuX/+fthXWGP0sGAVGy9Q1+Iixwx+FqsvaZdHtPWrzjVhY0kXYWasjf1ixg7Kzs
	 /9vd4KOmvx0Umx76dEM8PlSQel2e10f8lRCED6v+JWPf+GFxtvEWTSW5yL404Hbo5yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=VOw09j/r7B1GeVL9tLT2nkaDA4dCjfeKuAfiN8ANMtFDzcj0AVaoKIDW+Z/ulTg68txP
	 uNCV+F+enbfgwuNoLsz56kSUEZg1Dcuhtiy5ArhyMtLn8miVDVVqWmvXWxTFE4kaurpi6
	 By4bcaIkuLDc+p2ZnigtyXNDc/2u5m7Z0BNHmN3sCHdKD0Tzr62RcK4ahdrKRdYKMZgb8
	 5shZ/e7N90BZLG+lcUTIQYdJEAgSIvO7cu+SXIKRGCuIPmKw7K+X58oWggjME4tvb1i3n
	 g3AFo3Iz6HtTJM+p8KOcC/rKvOiepnhxszLxgHSIKYWsL03DZCvtldmZcXgm2hyr7FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doQlXMmH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A5A606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A5A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doQlXMmH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aIU34146686
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=AIA0+3yFYr6iy7Nswix4qKnXpl2
	quVLQcOVke+g2SmYUuONiFX0dvabXwBiROhLFNlGVLcX7J2p6DVOW3Af70XuT5mu
	4m0lwP97HIRmsWf+PFZp8sos+Hc93hsYrDt3hqvqWNTQvU7TjeB+bQ8b9w9mzSsW
	2JRKWSthrWNA5eai8dKCfk3UBzMokuQt/C8tsjj6oXqCMsiTL5EdrZ3Ymrwgzqq3
	QIff81j1r9HOTjcYktoo0IfGymZcT5PkxoKXU/qE9EnG0uVKLd3A+nQAtL1xWCr0
	zPT90strtf9YmpraUhJqKnrLy8rV1BQk9kow+AnBcr3gYpwFZ9NHaCsKY8g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfman2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:23 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-81b20bea169so2697150a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900803; x=1795505603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=doQlXMmHK6JiA48mcH5aVx8/s/9bkfo7XTnSY7ULED8cldHvzAIJ0XQyXo89OfGApF
         n/3PF665MLN1bA3U195cj04OSy1J9nh7LJwZzhhVm4mMeakhtb5orjHNgXQZ3ImEoTxw
         Yr2nFsGzospgSxo92Q/gKEVC9iH2ZCghzqI6OmeFKMhD1o35jcHeChAL//oK4erAb4eP
         XVd/bz9+HTUqc3PrJMrln0cmgD+wxpVDSBti+ylNfCT0qDeig9V7PBsg0GZJCQVg/ykL
         vqzQLZA7cWeJ/EJ4xgnT8x1j6vsUT4SrRd5bqkdHgFowAgsJov7YzEFBA+Ihk5kTbmUm
         uQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900803; x=1795505603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=ZsE+JcmAEeCq2yWUjW56ACQyCb1svVhJAY4oTsdaTqPQNQACsLEVebMfQ+ufPsWhnd
         0os9ZMCYNWmrnh3HaY4mM7VbRJqVexD4f0hvqnXYb329aePUnGvkRRxyjD3rW8ZyXBKE
         6h2lNPu8xTeX6q93oHv43+OL+xPAcv909I/2g3BsMidutG17nAA4nw/60Nv/cskxqCOp
         pZRXHbA7lpZULQyezNvYRzx6IIGTO1ZtFBR6NIIJbjKd4Is+uamFooblqUsRIChEPgs2
         WKZEDf0MUMP2gti8ehPKEHcuy33YKD0NhEdrY23L3Rw2Nd88gn9W0GxA4UNNpXv6mkFw
         9+3Q==
X-Forwarded-Encrypted: i=1; AL+hErFYLOQjFpU0XHHSJBnAUHB3nK29vQkDN6APJEc1TlNk0M2KTj4fPmzn2lYUi6FQK+4oo1nOrHYjigpiAHFb@vger.kernel.org
X-Gm-Message-State: APuU4Z+/OQoAYWWc3Uhn9xyJN2ROckvBsjLwFcn2i97VMs3GT6mR29Jd
	MhyBVx4PCe9y7iDJqYMqa+qDFDu5ALFCU77N748zW6vN6BbXdvwUh33HPmkrq2qZUWH2F/Z10P1
	+Wscv/L1u2yEfrasMloP6Pd8YbZ5CF15vvW//2H08n/FNXa/eJ5ObV7Ew1OGD/ylgNoo2
X-Gm-Gg: AYBFou0dqVGAIOVbvgKcZdK4xmRkAWzgwm/nclzzb8cPEqWyxiCDfX3Y8Xj0i6XrErZ
	gmNmDOs0T6knxUvPwqp5zfuGE73efN58znHNOzBF2nbTQ2pWvYI/WcZKemozXRCUpm0eKkSV+1/
	o+s5SEXRLJ9/4VRGAPjOqYoJ/mvKkrl3t+vGztkz+4PbCCOlQ1f2dc7KTFgl0xyT05V4slqsXFx
	ZjorU3jU4cKLTBZiPc6AHIVj8CkN9gLZnlnSp6mw3HJlVHO1jJPB0PWUaMpVTeIhkv0pHAfWtWr
	N+P5ysw9x+p3uivB/q/wkM8G08lvwMzKy83dLyCoPivDuUs1lSRaEGpc/EJuf19Foyw+D3DFJc8
	fycGJ5yq1sze3UAQ5jOEarxuWq13Dx0lBdyh0eyETJC4j66LsUJ9gGDF/LYqWUXaS4YgBTFxDU7
	q6dtrkLNll6B3aQzORLWiOGauycpWvfLT0SQ==
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070471a34.15.1794900803191;
        Mon, 16 Nov 2026 23:33:23 -0800 (PST)
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070422a34.15.1794900800721;
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v19 1/8] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 17 Nov 2026 15:32:58 +0800
Message-Id: <20261117073305.3854951-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afc0343 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=EXS-LbY8YePsIyqnH6vw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXzQezZRPQJqML
 VxADURvWc8a4NjTigZcc/Z30+QIQ7gHp6GHLZNz/CdgMPU5D73G/h/O1sf/YWc7NVPU38PB6kl5
 RUToqYDgBKw18FG+m5xhmYhj98KLD2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX5IJIRXTXhfuM
 7HRTx4K4hR+MLCbmxj08HGPBj+fVfw1Z0btpZMd/9VrhL558FsLr38h3xekWFPjAEcNSyvCKF9K
 bKQinmmHYvbs9xklNbd2QvipTnTlWOmsqUldlBfhDXSHOqiLcwPHx0eh1gz8BxH4nE7tlEqWjVc
 8YlCFLzUCNkPfiGpqdiAdvqsWLMgp6byUkmWP5UNm4ASeM+adqdtlIo5UDCLvIUzrS+On2YO/Hp
 zKHvoeFMFO+3rXWXMdYYPL6qDmacGLR9DwiwW/+oievzvXPzCpnAkEOMFOgibvVo+fSP7V5fHF+
 WHXePdG1P6Nx/jWJsmYM4T9eYJKWSWHQed/SERavIq9H2UN/S8Q+uL0tyLY24n3ka0RyySg15QI
 h06kfx2V++hVY9387S5aNNGB+ldpB4EG0UGR+tSZYUhIhcx6J2rjXePrEzJBggBihp2vEzNBvcd
 JrnbPbd2kJSpkc54AHQ==
X-Proofpoint-ORIG-GUID: fJHRCFdReox4uo6LE4lk3zN6JIZ2A65s
X-Proofpoint-GUID: fJHRCFdReox4uo6LE4lk3zN6JIZ2A65s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1

