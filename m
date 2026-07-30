Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD333A425B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398868; cv=none; b=is2rVQr9oNIuool5mcVI0VHdLD4foGuqUta+rxNj5Jm77NnAwWi1pdc8CHqs44wbgTjQhrj/wOzx0SE3j/VLLIM5K4u8tYK/mEC9pj700+5KLqLTJCvCdJXqqjp6DdMJg7jB25fhNK7kjhj86Zzgy0MBCu8YsdgBy5tyfJHzL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398868; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrEG0YF+GZ3Cy4vCA9o/jL7UfLWXfIHxrpTSY1S+ORSngMn7bUImsjEilFvVYMUIsIg/80CwvH5b+jrZRyvXjeYrKhe3Rnjqp3RXSauIOmIn06XIShWicNM8oHQsDBs9IY1AuDtupR/1RjHE8+NlHYB8IuKpVMP74R8jmRNVyCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bb7aBCKL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIpV8Ijp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bb7aBCKL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIpV8Ijp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U82j7B1385515
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Bb7aBCKLNQAAemXPgs1WjsrJ2eF
	TrLboo3xX+rVmqFXQFfT74Z/lS81Plv3XvNWJSKKsF8iVueb/NC8dzgR5j2U/2hI
	B3ZLR+nX8Kb+lJhje4N601vqOU7pfyx5lqvyEaxDgNh1njAcoRDwadIxQJMUYIKv
	RH35tAIDRrCtigMlykmOS5POIKdpgKBtHMgRbMce8GwQsZVz1tFtza9CejMer6zX
	BUtnkmc3BgZt6r30BozfaDBZPFYPEUDL9cmFmwZSnXaZeJyqe5U0ma3iXZzcmQl0
	smJ/HeGJxXl0UZfA5lg127BLBq+/kTNuBWWOEd1QIsugCJTWdaCxf5a5smg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2rp00t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so896874a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398861; x=1786003661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=bIpV8Ijp47+qub+7cEflu3SYHF3ep3bZBCUTNNGikXAfgXdB5mkOyHJxrF9RTb+LAs
         T9e9P3trW3d2GNcTHrmfMtafA2V+djp/JIdEt1tiz6naht/KTv2Euc3YN8U9vD0AM5xC
         DiWH3W0FojiJfkwV6dexjUi/60Mh0Ir/nWp1rj6oyOKL5AvNagmI1y/v7t4iC48ZnFT5
         nOtnKAsZqi/9iUFFzrkdin95z4elHwLjCtaI7ZuOVL+Vc8weerw4Ul80cclDnBNK7ecS
         OG9WvwktQn19o+iyPjNXK4lO9JpCfxeOcRVaUHN5htb/IVtBSt8kT6nFbsxjmWV6xHV9
         wW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398861; x=1786003661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=s2lxtgQKfFxx/egJ0bAX64yKiCEzvEmeZrREamXLFoScTUDunM6i9PlLuVxlrIZEiB
         7yuEbCaryEmXJ85T8z3lcBxLlT36iBdySSkuhBCoPAKEQsPWmf/08xqeowY2CMhWB06S
         hecEuai7YYVqulwieSz6E2708Pr0H9kSNEnaDgh+xLVtHulUc5ywjAQABq/r09exDZPK
         JtrsML9S3nnLpRLU9aLh9w5JuNz87zWFNlDUfe8cV617M9UYZ6aM+Svd5TizOTYbt+38
         SGmo8PsZCvyA14GFKFEHwd9jSWa87yhhT/s+wVOrU+7J9hz6cyfcbkZF9pYnQ1ugpmb7
         TsWw==
X-Forwarded-Encrypted: i=1; AHgh+Rqs6XlqD824wunkbz+ipbQKZaq1qBpY9jvgnKuag/8ZrB36dT+pvUQdMiarQbieTBZa8QNClLJcAMm6d0av@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSa+Q2+YSSrsNomRYphPukqv1OMdbQDUw1T78vNepF0Mf9W8j
	s410QCMQVHRkEGR7xXktygD+K9aiXW58zrbT2PHOmWPRAkIJe6qGoxiQLA+Q9NOtmmiIaZykDA/
	ur1IsLv9XpNLS2Xk0DNrkJjmR0T4m8fOZsmg0Qx45LRppjDk7OoJrOisjRrqn6kQ+pGD+
X-Gm-Gg: AR+sD13j80UCHr8THxAkkRwt4h5FeytmBjML7YMUraCUPJMbGLQ6p5I6zW/q1enoEKX
	3ozOkvoWxs7Re2tMN/zpX/ZMpILbIE79uWhGYp++jr7u1Ka3U+CEkkRzgJkgv6saI/V8wkzniG+
	VMqIx5vZkbLxmSqczR6EJH36Evwk8lhtkX7W02M+B2E2mQCpdw9sh6ekUclXbSAhGi78ilWHINr
	EATiXK1NhQbszVxfnSM0/X3i6opV6u8ATWad5r7yLsa66hFPqKYaCiDEq4mBtBCintGj57sgzOn
	boHrwRpFrIripFAfykw/RUE/tflSMNqDfbTrLn0HaDfNuScnqoYasjfWXDEXaokwJ/2yj9TVKVJ
	ojic75qEdOor4wdzfZ3Cj2dL36ZpVFsLQGBmGmgP/e5J7t+zB9aBq2+E=
X-Received: by 2002:a17:90b:5745:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f9c08163bmr1501437a91.41.1785398860888;
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f9c08163bmr1501395a91.41.1785398860393;
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu, 30 Jul 2026 01:06:58 -0700
Message-Id: <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX7MjvKnPVK1nx
 U1wAr0xnoQv8K/Wx6C3Xb9aJBYgCmZotG/xnBzsFh6MYNaS8C/JLhj5nxdgEbo0Yw22PN67F8hf
 pHrwFPKg2w2xj1HwLamA781nP5sFbyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX25Yt0uPMDtWC
 703iv3hjEh5oA204EfZnXfzbFpzv5/FHXH1pKMpqGEFpb0hRifk2lIzO/uQ97RgdkyVSktQ3SF2
 0dJc/rJRIBV7IiOvKnA1El+X++VPorOESRH4RK40dCjkej8wUI9CGXRldAKAdrxXucukCZ7QC16
 JqC8JYdPZtHdKJT9i0mOYn/nyk4Q2DNcU6mSEY+wt0ITJFVDDu9FIBYCExMIZdJFQKN06A4IO6K
 63vKVYTx9hHm2bDYn1sJ/1Af1dOxiGteFtS7jQrGc0/GT6bhBNiNA+No1FZO9tqbQVLxBp9m8f9
 yH+oS9gyTJUH5OCdnSNPqT9SMwE49hbra92OpPDxjUPfT43AsIx7IwzU5XbOM2qf3KHGKW0d+XG
 JTfcuuSEZ3EIxvzu5Aor/U7rTdU4i3lvwsdmAdCZFTwK1mtSFPNipGHX92s6W+Y6Aq3CswJh9sn
 akA6V1p/hwlaXbywhdw==
X-Proofpoint-GUID: cexoiPfMwPwMgYF6PmPwb-ZS65hGzDTM
X-Proofpoint-ORIG-GUID: cexoiPfMwPwMgYF6PmPwb-ZS65hGzDTM
X-Authority-Analysis: v=2.4 cv=OcOoyBTY c=1 sm=1 tr=0 ts=6a6b064d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057

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

