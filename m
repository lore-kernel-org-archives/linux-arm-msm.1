Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502654;
	b=d5v7/MjkJ4y1oBr1MRnQdWFvrPSlbjh1is4dc2OfUyHRaPQ2ZX1dC5YWt5I2arQpWjBS
	 QYkx6HfcD9EhupEJsy5MSMfVE+Xw92qYwyckA1qs4gFes2h1X8Q8+EzsAG6tteP9eI53Y
	 Kn1H67r8oTfxKKPBnqfrR7x04q3+tVOViTbspMMfLIxgbuTMwTLh+MluA7zgUUZY3HjZn
	 bLQfBm5/dUgUiDEo+7/D6Z3EQzNI4M2O2WY0alk9poyaLNbtJHagwCEfpM4Vyn/dCBT3I
	 zVyR/8JX9E13oHb0HFJAIcGN/+15rJC2pfzLOILzkQH09e5nUWooofEGY/ASyNUlaXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=;
	b=hN3cxuORryYffPQKsY/lrgvtuaTM+qo7t1lqCnD+89AkvMOuaTrxrqzb8FCNSsCal16j
	 HBeW8hFRuMClMPW/BYe4VfS/VRBSH/kR8DoL3RdUyTftHYh0FXuMm/XVcfK+BBQSQZZQh
	 wrftQAvVEeVs1e+RmoeWy/C8DD8vSO0hYG/9SBYn+7ZFzh6z5QUXppEK7+R/W0XlYGRdk
	 gcvMV05q/Vk2MylfNBco+VB3pb92WKUjU2HOG/Ea9BNGHAPpM1HF1bH1rCAtdR3CLYJDG
	 aP7UpI1RstEj1mre4bUTDiY7jeQaVdAYivvEbvBZ7RpF/iKoNYwTbxSXhDB/u8Jctgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="He5xRn/n";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Li9M7cQM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D66606A687
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D66606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=He5xRn/n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Li9M7cQM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mDUC4136052
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=; b=He5xRn/nharClOih
	NM1DKIvNuqNyShAMG0AGcX0zM15wrsd5Q8kr9TE9a1REL09MZRxhWJduEwoWAGjI
	V2xm1/1iQcBDkfLYoWZsb5ht2N2F/NkEbBIeRK6BY2Sb3vwkFzi4/jPGi2rSTZd2
	MMKfAxnoaCgXjMCULq4kWixr8NKsLG5oHV53H190ktN07pRTezjF/2I6qYJDTjg2
	h5r4jFUt4k6VM2NUKmy/bw333GAXNGhlQG60iOZrXuxuyFeWsvOz0nDVSmC3i6y0
	7fEfUFlCkiYA73mBY9u9iD8mln5HomVFhB7/O2RsUpUediqX0nLYn0lhw3aeJcpz
	g0d9IQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpg6bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869ab689c6so307748eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502652; x=1796107452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=;
        b=Li9M7cQMPR1NJ3T9pnyMd3vQC5Gdg1Tc3+UZqTuuImS3JxycexltzLxZSaYD8F6KPn
         VBvX8FcoZEIPF4+aOBP89DL6mVjozebEci9/WnNkkn4cG7JlR/ixQ+apxZCrlu6Vskoe
         rY04B3ljfMxWjEVm72tu4K8bJIrFrjXDlZwhOSvNPi12xq8kO6fcta69yRTKwKvUKx8I
         HzcGxh2tOHx8W6jNZ4j7HtLDJIz4cHjD0HQb8yr+yut2JnP3RyePJL81z8E0US6TsidU
         qiHrWIJEnZVWzOXv0EJOSbIxBtoHJGzdvRfAYK/mIT0GrbffBbgeFMRvvuhEGZWsNHee
         uOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502652; x=1796107452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=;
        b=Gh2bq1RpkmkZSrag1uwOzbFqV/9Z2RfaTXFLDFaYP653Gq1dYtojIquf+WQeT8uANe
         yjeVOvIBcGwWQO22G05UfXuophsami8KUoie5pyo986GqJmSc14/JinFxb10DeN+YfjC
         1XIXsr5vcDgA+iNvbhqezkClMbCLw+lrIJ6hCEvEh7oiwOl997Pm1YCJmwifI24F9dgy
         WnK9/TZ3cXQkbqUMWtkPvKJeWVuyKLCRqaYTqyV1/DXYFWv9cXSkAGIVAzD5rLB02k8v
         UUoqssuocRouNFS7BAcfxzAeTkBob4NqvRdDwyOqUFrMJ+NbIjSuhbAMFjWBqp7kaxYh
         XTKQ==
X-Forwarded-Encrypted: i=1; AL+hErHn7tOnrbCX3covFYDSfzebDbKGEX67Ad28jQimjx7IRe+qRYhNgnc4MRGPl5jQI9GyH+72RmpBa4djmFmT@vger.kernel.org
X-Gm-Message-State: APuU4Z9CxAuCDzL4K7FS3dm4bggazAb/Zxt0ptW4OcGn3DjW8EkwDOuU
	es3Hi22KUkcq97hy78NDFRfnP9kExrk1GzKy4s5CokuzVRA6F63QDDc4M8SSawm+VnAiFq57zHe
	eqI56ZhYWphMbKNU2nzUV6RpuFwKqgmKWHa6B1kqhzszSekBl1rYt9a7zvf81/DEWj9vu
X-Gm-Gg: AZFdTZei2aENUMYDO90JCNvQo5+SwD8u/MhskHBvHGho6g/sbObr5vcbq0VOXJrc9bb
	PnOKKOcGo9mL/urYNb9Gtcl3PX9p+qqqlh8dZgJ9xbIrzJpzo5bxbdkF6POx5u6J2gDtC95AVRw
	6fD1BnHQWifnJKtvlHK1EqKKA5qDWznL6hrl7rKuJ49oaWByarIHMDTyMp4bGvhD3FgDDi7BjYy
	9NRdnFQLy8T5Ia5+R4cbFI/XEABjpBwhmCOglHIm/KW+0VH+H7iqUsDuVfDqknTFqBMYcuBpd+K
	gHTFhmX2OvICQkEWr5HGWTU9s2h7dM5qc9lBbROq0m7XNsjrLh6OV2ZcEHJpHCWnthC7Jngi779
	9v+sOeBam6ojbs1RBlTSY49o/DFreb89yHMxZNaITkqoetW/rw+cu3gmz8AUU3R3jv4+IXCfKBD
	ZRpZ9QiZWpNKLoBJ8oANjdaWPJ4IR+UAYXyg==
X-Received: by 2002:a05:693c:829b:10b0:386:c3c4:b914 with SMTP id 5a478bee46e88-386c3c4ba54mr1173940eec.0.1795502651617;
        Mon, 23 Nov 2026 22:44:11 -0800 (PST)
X-Received: by 2002:a05:693c:829b:10b0:386:c3c4:b914 with SMTP id 5a478bee46e88-386c3c4ba54mr1173903eec.0.1795502651063;
        Mon, 23 Nov 2026 22:44:11 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:10 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:03 -0800
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua
 video codec
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
Message-Id: <20261123-mahua_iris_enable-v2-1-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=6361;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Fc8skBo7z7hLivpSawfUjpXsn2XbQN/qt2VC9DVAmnU=;
 b=2tcTKnEstG+Z88u0X4btAnAcKX5HqImX6vv2y62h1A/BKl5eOcThPxgDor8Kzeb92vS/bEgu1
 W1xgBAQgKIzDQNDL75qVfKxLwiKxx0IwwUzkUutzgP71aVKCUoMFokK
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXycDEph6X4yIl
 l7xw7ZI4HQef1voAAgJ3A4K0RNvLg94JU8vmfmwPwn93W1OXiNeT4k+CftrTZmkUifggVwDY3rI
 gISDwwcoi8mhhjYQxqvvsgJdsUxeJzLtLudGp7EoUnyZsf60JxSBxLVlFgWS1dyjxj6b3pS+DRv
 wOtasWdiOOH5URCECpNOCXBvhTXga9bSp7a4jQEmfVmtWzxJKSOR42idkgYT9Ai8dSjL7XE6zpX
 00ghjVbDGeIpSBnv8GtvtYqiBYpQv32ITHb7emqNWC8qzdogwBGANkJsK7GDQsgNz8ZNozbl0j7
 H4/9ULCDKUuLWvyhbEBtITQKiv7gRYh71ai0AGBmhmECLdYo+rgLUo5DHy3lvsDt/WxNlua0zx4
 OeY2UYbs8uftJg0yo4JNx8grA2FdYD8ACrwSqSLnZCEViYUz4xExGsQSqdjZL5aO2o05CkqhoyD
 fmRM2QgrVxLGoSZH6wQ==
X-Proofpoint-GUID: wjLAQPz2_McMX2aW5ZKPQbf8w2FT5eTr
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05323c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZjsRUOjYzCQhN9IHvjYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX/kLVtk7MuSuQ
 VG8nnbGBGNAGvd4XtKVUewHfXQzhKWqDZNDyop3QW2hBiCkvWdVAfaEHxomkVq8HPfiGZWXztkN
 kzEQhU55otJdrkSF9H4oozAhdDpkexA=
X-Proofpoint-ORIG-GUID: wjLAQPz2_McMX2aW5ZKPQbf8w2FT5eTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add a devicetree binding for the Iris3.9 video encoder and decoder block
found on the Qualcomm Mahua SoC. This is a single core derivative,
leveraging most of Glymur data with the clks, resets present only
for vcodec0 core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5a96fd4ea08422daf3eb0fa832a75a4994e86ffa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
@@ -0,0 +1,200 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mahua SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,mahua-iris
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
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
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 3
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
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
+        compatible = "qcom,mahua-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun";
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
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffe00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            iommu-ranges = <0x25800000 0xda600000>;
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
+                opp-hz = /bits/ 64 <240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };

-- 
2.34.1

