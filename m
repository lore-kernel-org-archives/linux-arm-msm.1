Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50203839B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131311; cv=none; b=prMfjJdF6QCBSLgZZiTaUWwrRrUN45c9bAIozqDYzkhPXaPXrXEclkv0q3DFYrSCgtnjMkzb0gz945SoULigJmZI4sSUzsJXxA0xAzC1FnE4O/lGpCmO/4q7BpUGctZUWUh10j7r4HKM7XVG2dd2ifgAhNHywfldN2iedTXcpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131311; c=relaxed/simple;
	bh=+T5vulQEyMVm6P9sXfAjnNyXQcGFVgyBTnNOo30l8nE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Os+SjVdx5j/SdLKdjwNhaOis/uleRtCJSHIyK0MBxxWkVUaF/sAXZSqsmPUIFBitLIwa0wQrWtAkntMHaH7T5nocNOwAMPMw0G3oqkVSkqPYOBMGf9VuvTQnTG/HKU/P9pqice6LMoXXfk4J357LvfWnf3IA/yfZYYMzFbSurGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ubd3HtGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Naxcznvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ubd3HtGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Naxcznvj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7EnG179890
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 02:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=; b=Ubd3HtGxd9l4NS6f
	yelSLSUB8yqTBPCg1o6xfmbEATxZcwHJ+hsOUDU2FIArKILGA0CTEFCwRA3WoiDD
	zmoS8cJfa9apR/PVL4vGU1nRsXSaDS4WZo0CFEC15b3vOcxPuEl+xIWO79ZPEL7f
	OSKcVpA6/9CGfW5CoT2XOsbypJUWmsXUWn1iw3YJ3uKmrLMORPkWdRgynVN7AcFO
	nmshmgWpSy6UK5bYGxmKNAyZIHxDjPtQ6HBILrxUM5e5rb6KCNjT0inczOKf1xt6
	SPbeEBhUMj1lQcQkjU4Rktlx4sCvBp/LrTHT/OkcVxNwXs0xqaMWOd0d4MvNsE3a
	e3tssw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec35vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 02:41:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so799880a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131308; x=1790736108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
        b=NaxcznvjcMgq/51LK3+2QOblT89Dol294HOjUChuor3ScDXN8YOjYo7kHUPXxw9cBv
         HCyVd8r1G+lUFaQhfenS9Gc7vuz3LQT1MAOuuYzF4bT5bSz2Wm6X9BeDYugUQpRXOgrl
         FLLi9fu1n22kY/gqJGkuwhjFYyWGwVkH90GASkn5LK6ltsc0C7TBcj7Fs7/dFM+HyhBY
         7I8gqihIjQ7TEuuHADJRTx0yMhFBtRUdGUTZ5QloNoEEDDlhABzFLPeKl363cjjMp8ao
         JWmGodbvuvo1O+QD245QjnwbUdJBUvvYSDex1OVwcQfaMLNPolpYaLlTshkaLfZTLf69
         qt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131308; x=1790736108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
        b=UlL+aZkXoTMbFKPBduXqBDD3NZ/OlNYkPFeE/Zp7dKtTdHve7jPgTX4iY9kpeLOQS8
         KC3LHWXtTrWHtSzLxfK4Rt9CgmPY8Yl31CGCQIVzNLxA8DpnHfax/lKMozV131gxS8Gb
         gmwFdNCvfZGRz7wr65tqO1GRkYnC+a1nC7IN/jJDGnKvxcd808vEvHbY9kIeMajpSypn
         wp2KBabvXWv+mYs+bY0HR8zt9cUVnpKIUyW/sXhnWMxYtQeOqXS3pj0ZD0t53o6ndwnR
         E2heMZ8UjKWfMNFtnOTy8u0e3h5SOWXuZgoR4TcwFzSJLz+5fUUTLuy3hYE1r3a6dtOu
         ZCtg==
X-Forwarded-Encrypted: i=1; AKwUvBxvTjncd1b4VcEhlurLgWx0vpFH6YAgE89FrRHS/na1GEwXDdSFubvW7PPXAXMgawex+S8psKlP1KmQBCgC@vger.kernel.org
X-Gm-Message-State: AFuF++kDn0Aa6wGDSsM9Y7v95uvjrGALsAbD/NCCqZjr4lPqC6ImHXZO
	O/lRQspGfLRS1mLxZwTP3IUtEE5Km17F7Bks9xoeRzT6vPceBF6Qj5Luj3XMdSYOIVwRZ3iOyMe
	zp3r7eTLs4o+aRI5AvbS6J7NgsttH585k6ZGBy6UMSKGeAYI7YNcVW6Q6oaUmwYvYOzwA
X-Gm-Gg: AYBFou0pSt7E7girE6/lbgy+yPSocKY1au83zdNStcm0JZPFqVoaITSsZy9tF9LzgKM
	2N4fZ60CfhkNv28a4JL5YYILp3ihJpc5+JGLuZBcQGEUZpzyx77QLXNWeXxwrDN0SYwDhwiTpjs
	nuDUQcrmpBJ1uQDnpjExy3qnIo943GYeB6Cckg8cjmbksWU47Lxhuagicm6LDrJKkVuil9vUSWc
	dC7vp7odqltA6OloxIMLs3jgleFeVEzhAfMTwsVBYIcu4r6SJmnwFpPsPgZLXuma/C1saNCzzk+
	58o72Hz4yK3smF0rw8ZqY8F429Eq4SGPUgh7UTAEbBXtWUujjt7zKphN1RWvqhWL/pPoPA8HR4g
	NUwWzQiKoV3tuYqKQm2sj5vsJMc6jzUy+CBQOQztJyXZeVp5FCU8Xhc3UotAOpD5Nl15prkoNNw
	==
X-Received: by 2002:a17:90b:1cc7:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-3a07e6ec797mr1084744a91.63.1790131308360;
        Tue, 22 Sep 2026 19:41:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc7:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-3a07e6ec797mr1084715a91.63.1790131307849;
        Tue, 22 Sep 2026 19:41:47 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:12 +0800
Subject: [PATCH v2 2/6] dt-bindings: media: qcom,maili-iris: Add Maili
 video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-2-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=7742;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+T5vulQEyMVm6P9sXfAjnNyXQcGFVgyBTnNOo30l8nE=;
 b=xs8h2an6tuCJt9Fow62KGRLwQDXcITZvAjw0qf5hEjCu+Q5qUSyhg0bs/dIzcUAkFh8f0BbUr
 7QFBDzokvf0DYfo6QQdevD+ZOSy8WYnTziMEde9O/PpM/O8bPEm2djw
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfXxo5uGY+py3L7
 K3k9Oxnrt3QiV5Jvtx0dI31ZWn4krGJ7uaRKNV9zBWesxd0a4aJ5xaTW0RTTUnSArEbsiw7PJIT
 7aT+yYQC6okpoqEW6guy5IaMQOHDaxkW7YssAQJFpUS/Eqj2LW1x0c8pZEUGtOXd4kfj5mor+qb
 iXuPF/dRjrpB3HJYXoFCW7bIu81rM/rKhLbVGRZh3YWPfocKLMLdPZu+pGc588xZH2X5TAwBtNs
 bmDUH9qX6t8QEW5GHdF2LqoY8bnr/qmuEKoaOfC0ogIe/D4fB5wumZoJ/nCuMgwI+HYeAyDUUBu
 ojgrlVu2FHM2Ei7JWtykwsKpWxXbuVWeLJv9kbakOF/YfauAF5L1ages6DcHB+mlBny6TwR1ZHQ
 9S+2ucKQJqGOeM/OvJpuBfL4YY3LGd+oOai6FXDNKGB7Gt0J4eZxTP+Ff5In4yL1NEjRM6X4wsm
 1Su+n+slL5UMHZv4CDA==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab33c6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MWoX49SKP4xWF05JRPIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Uvm9JGMmKs89BTGxK_mq1tLDxT3tYXbW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX+/SQjJOSZ6RW
 e++zoWGOvsV+ymf9dA20dRNw1XfKmtkc5FW++FmnElHjE+EeduuzhUDjb8JCkWyYyNY/zIFCTnW
 zh5DJ9aUMLRoSga0vub3KAicc0Uez/k=
X-Proofpoint-ORIG-GUID: Uvm9JGMmKs89BTGxK_mq1tLDxT3tYXbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Add a devicetree binding for the Iris4 video encoder and decoder block
found on the Qualcomm Maili SoC.

Compared to the Iris3 generation, this block has
- separate clocks for BSE (Bitstream Engine) and VPP (Video Processing
  Pipeline).
- power domain for VPP (Video Processing Pipeline).
- different reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,maili-iris.yaml | 229 +++++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ddc4df8481b52661b314821a9fac68870d8ca6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
@@ -0,0 +1,229 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,maili-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Maili SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Maili SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,maili-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,maili-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,maili-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,maili-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0_CLK>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0B_CLK>,
+                  <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                              "video-mem";
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                      <&apps_smmu 0x1620 0x0000>,
+                      <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x25800000 0xda400000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

