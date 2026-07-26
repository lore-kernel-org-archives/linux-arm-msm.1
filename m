Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5631813A
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045042; cv=none; b=Lp+Vzz/Ic/sraPa81UZDQzNBs1ntrsETe0W8YEDMre1rmyExC8mszOsxwP3vUhYI+S9fTeKJGf0XDYJ+SXkiK5relsVOUsm6p19jR2+n40+jyuPN7oY7VF8G5qZ+a7KAFIX29Z4PlKjxP/Xnxj4+4lDAY19ZfOjGowAbuKYQ5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045042; c=relaxed/simple;
	bh=1LtcgFQre1URA/vBEgHnSf1Cl4CNgR+s5lXnrBq+ITw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOqDrYR31XYODINV6HxBILh1d3N3jONiyBE+KHZcyOC0jkoKSQEMRwyCx8hGqlu8lRoSCco4ON/hK0s/aH2laiXLjrvLZ7TxAqC8sM4Gskf0nFvDqyu5BjBKYQ/cVNaclk88fGE61I1dvOEAx8TfTjfDxvTKHOhVsrCTOnBsDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8gOHMaO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDCOyFp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8gOHMaO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDCOyFp6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5Rm893980263
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvynsP24NIPCCSbLPAo876X8cdGxa0GYKqGInuT+d7c=; b=R8gOHMaOcfqrUkW3
	3XnB3gubCqIzvMfvN1zx5fOVe+/YPDn0Yh4QjPg6QszNms8Ppxb4f9XQKjqd6Fxs
	ocJH4COsrmARHWKUXCskP188peCp7UYxe3e9REyU9h2w2wF9eInkgedCkCi7nV/x
	Fmtg/aWFkaRTUUA8Om4IIMfLXKLYHfBKrR/kXQFnnnXKgVt526ApMqdC4/Fss8Ec
	C/JhAVm8VNXSWQ+W72fWiZAMMprNTDqnzemYSFUYBv4GspwQdCGovMJleJh+P+aL
	ynl8om/cI3pGjhyNAf6q2P6Er/ZFZ8gDffQ9kAj82TTjSe4xZUb3teoHYWs94//n
	80sjtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmfgtdx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:50:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1059421a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045039; x=1785649839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvynsP24NIPCCSbLPAo876X8cdGxa0GYKqGInuT+d7c=;
        b=IDCOyFp676ngksUH6cfQS33mRCczpunx8XYoUi5BbpybfVoryD1o2KQypIyJlp96E5
         hSko4FB4S2/hyDE2BQx/8W3urSvq6gCyEV+ZKIttO7obk7nBkf5TCHdaWFDcIXj09GOH
         mT9NH3tI/FEpiiBc29dvEo66ZG7D3dnnAwGABEuPNahZr/8uYA4fabKdDu4JqM2FRUYH
         0AgdhhgeQA3mql7m8nNpDkFoTpmINpf6oLz0MQMoyB0g3CHLR5vxOUCLyTceISblNwoT
         VP20yPgdEiFxFV3WuE7Q7DDuHUYy3xVRWO4N5AebmjQmJ3mwg/jtqdlDd1G734kOA2rp
         LbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045039; x=1785649839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvynsP24NIPCCSbLPAo876X8cdGxa0GYKqGInuT+d7c=;
        b=r7pJIlg/rqzFjhQqgxls6LrYLG5zfjCIpFDVKltEHMU/Brzr1jbHcRG6Crqm0Ostj9
         9urcHBMGqQ4hMArdCEnG9+h/zwK6WScMM79oCB7mGhqPug/3A8QHVX9dSBSqWXpyL+iZ
         GNkvj0Lm3RwHu39vb1j+pbvvpmXYuUlKx+0DFK+6tvV3+LrVUFc7QVDVrof2ojDfJ+6K
         MIpwO+upPifW8DArVLE4nJLNvr2BpUUnqAX5bp21sAMsFGpRgw0K7xumvCcKbUFlzSaQ
         3J8IIvnQxVpIWiZpAm7KWgBmS1zo0vxdMUUW1qTfrU7cPgG5aLhnecygO9n/ZUYDbqXW
         b27g==
X-Forwarded-Encrypted: i=1; AHgh+RoHfYh7gpKuEFHn6ZnOuP9wOw8pXGSfT8MQwYihK+VDbzLixP/eIP3nzCPd547Yd55ATdoMjWomxO9FkULe@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFTzjQoZjY57R1zRq4rtSshx3mCzrO0LTyugCygB24PSmfzxE
	lpTE9iAwSXQKANR7r27hZvO10M9fR1dhhLJzcy0gfujhRchOHrVSj86bL6RlNWNHPAak4jSYb8S
	o96upE+lPnyJGDC3k3SzhhB6eEPMWlWt+kfPxUnAgpl1Z0e8kJUyZINXRRZkm0ztM3yRp
X-Gm-Gg: AR+sD118bKDfLJfEVcKG5Nh8DdUgr/KBuVruf/utxZAd17aSe59tz3/CDYsUxaZiq+6
	6pmdKDiax4eXWgr9XjwXoHHiE6EH15rryiLWHNaFgruJy925nHW/o1Y90foMIwS4vgzqmJ3Z/4j
	jDFZU1K736lbay/a9PlKVdlp9QrnIo195UjzrW11vO+zSUZ0ft57FE/BMjP1hg0o6B0+SLlHSvV
	7/dq6nEWGgVNMsl+gfd6rchAYAusqDPBYHDQcgvjLJ0LTt6j7a0UYiIdC5sYKjdflJbRQUJzX6F
	k2z76NxJ6UazIh4PFQccI7u59kUxvteRXQHD4HTLc1xzoSCwkVABSC7Fx4IJn+kp3jjUQvc6iCq
	YYJh+VmSBcyOTUF4ypjI/kXZ9H7cK11Y/bQ==
X-Received: by 2002:a05:6a21:6494:b0:3c3:9aff:7a5b with SMTP id adf61e73a8af0-3c67df803fbmr3695662637.50.1785045039032;
        Sat, 25 Jul 2026 22:50:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3c3:9aff:7a5b with SMTP id adf61e73a8af0-3c67df803fbmr3695635637.50.1785045038582;
        Sat, 25 Jul 2026 22:50:38 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:50:38 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:31 +0530
Subject: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045023; l=9324;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=1LtcgFQre1URA/vBEgHnSf1Cl4CNgR+s5lXnrBq+ITw=;
 b=/PDkKhZxgT9liBiidRBNV5AttNeBhUJPX4nae5uA3GwNiZrIbSytHG1HXtDBqpqVVBJxaYUTP
 7KkwOPJ41aDBNrQ4+VvfpbOyXqwg055ZxnvHSX44UwaYGsPxFkggjP6
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: EONmRC2vTK-Ad9ltpitXTbEX7-v7H3v7
X-Proofpoint-ORIG-GUID: EONmRC2vTK-Ad9ltpitXTbEX7-v7H3v7
X-Authority-Analysis: v=2.4 cv=GdYnWwXL c=1 sm=1 tr=0 ts=6a65a030 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=o-YURiciIQWsX3ptiuUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfXxX4AR5Fdo5LH
 kP+Ubal78Zmwrx40MqScs4WCuU5E9DgbHoM4+7DA8bmFuCXINZbIRAMn1JZlU2W2fULDNl7WVpE
 gRGotVWu8E4N0Vpx0FaRQMo+KFJZh5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX+JZINXibKQLe
 YBBsIfGV3JYJ8yCha9bRLoI/4RVgzvJ6C6xaFTA+EGW0WOHmI8pk5zb8FPVeE9S9d5OoKUrOFuE
 jcKiabYgaYBxIz8WlsrpYQkGhJcauW1V6d1qE0Tfb3F9SZCcyy42qzX3XnzmkxLFpxKDBk8Cqa8
 seiUKXWdoHOuXXRyQ1Wy73Pk7nBdUjyASRhEwgUUGxFKDeyjn7SZYVkB4L85eu9571dLPxpuBKl
 p2gqASXA7LBJH86nyQb72RgsG0TcEhuK3ZDM//fEMQK9HQDEGU26E8n8ohqhUU7924COiL5on78
 zLK509vo5fNCkrTXZN0LXjxCeLnsJLKglpLs2QGrDTQNY9P7iPLbV3LwL36fyf2Lnc74HfIrmqA
 BIZlK5Qi/3eD8nVZZtKoZ9js1ikAdGxCRRIbeNN6XX0TfVpjHz5ucgOkireIPtZt4g5K2KAdOfN
 kCmyCplipxlGrETknUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260054

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.
The current maxItems constraints for clocks and power-domains in the
common venus schema were sized for platforms available at the time of
authoring. The glymur platform introduces a dual core architecture
that requires more clocks and power domains, exceeding these limits.
Raise maxItems for clocks, clock-names, power-domains and
power-domain-names to accommodate the glymur platform.
The glymur platform-specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 257 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |   8 +-
 2 files changed, 261 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..1bb16206d859
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,257 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec1_iface
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    properties:
+      iommus:
+        maxItems: 3
+      memory-region:
+        maxItems: 1
+    required:
+      - iommus
+      - memory-region
+    additionalProperties: false
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  operating-points-v2: true
+  opp-table:
+    type: object
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
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec1_bus
+      - const: vcodec1_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - "#address-cells"
+  - "#size-cells"
+  - non-pixel
+  - pixel
+  - power-domains
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec1_iface",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec1_bus",
+                      "vcodec1_core";
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        video-firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2..10716a93dd35 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
 required:
   - reg

-- 
2.34.1

