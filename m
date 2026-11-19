Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078907;
	b=MKRZT17LmdGe1Jvk4feDdUeHNa0KWHj0T/fBhY7V5HDKAgG0NxZEWSbIPeiiRagQ5nt+
	 3c3w3PayVcwtdT9d1eAnQxMuCs2hRLeY7YspMgl7JnzL3eRkPEld7hLFVmW6eXkpFQoNF
	 FXr/SN2fTHMSEHuXNgScV4KCk6aRPyj3XdDQdMIJ6CXm6Geo9EQAo59c0BNsVtgR8Styr
	 D2s5x7n4794n0ZVqVKvAYeL9mfUrr+UuqxplVUfhH+AF3OYS8aRVLeD/VGOGU8JDzX8p9
	 qtGXou0np0dy39FHEfbyNPAXGQ7T/0M9x1uPbTcU4MaYeiqd+oIRR8sg9q8cJsNFvbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
	b=QrbeNvK2VwV4G1wLrI1ecIuHY/t/iNyGVHvH1z1fPf4sQ6OtSk/IAb9cTEhCpLrjqhlG
	 SXvr/syviM70zIzrEGYm38mkVCzwT5zskvjLYQMp+pRSfVnX5mIJkGUzhI+GG6jcD5xVI
	 XTLOYwt4ACNA57gbYmIM4c+pXMjtDviEPfl+Io2QMJlG9fb0bZnBx5//Saks2PkkHXOgJ
	 oKp8yPA3PXryAe/1KMo5cq3mxBiprQiLPagF6H+xQJU4Bo+AdPX6qrW+e36mkaIVOXvv6
	 B+y/BPOrjgnlmAZjpOrqlI0TdDtid1MS7FZdfLsNWPjTNzDwzopHGFWBaB2iUBlGr+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifC9Z0gZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE27606A33E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE27606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifC9Z0gZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vRsm053110
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=; b=hBKzV7egc7qpyYFR
	nAvLlpJdkyF3Idi/vrTGC3XgfocQKJdKyupiPJwEiUr9Rr2TVKxrDMVzKxCmhIFc
	UO+SJNXIkg4taRp/bs5iN1GWOMBlxoJz/PPEnC6jrpctMaOnBM5zTM5FqgZVLPGY
	Rx7gwvEmxIUP0yTyrJOZSD09S6Z5Ta1PVwpdN1mlpxZRgWod394uME37eu87xRXv
	7oOTW5KNTCXJ1UqepvNCIqSrYyluRprQWHKb+XsYlptAAUu6bZY6UqbAyq/oD4Tx
	HhXQhd5bowZwaWuJ+yHXageksRDkBEy2tTPT0JAQ13O1Of+QRN9esFD3n51knRcN
	F5SkVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3bbntx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:01:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2516293a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078904; x=1795683704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=ifC9Z0gZEOJtPxV+AT2wWhAsvegW5TKMMX9uqwbnsLj7xy4A7oFD6e+DKY2q2GEuhd
         C6aDaG5UQqCo9T9QZom2dXZdm4HbW4SUNzzPUHa2CVFCtPtgBKYZPem6oK7M4ALW1KfI
         fo3MwsCgmJNZzqu25NFoMWi2MyUX5poLUiw5MHgkbwpsGNwyPr/9fIu09WB8yLom4+th
         gxjhdtmowMxMF3SuAQWvFczqWyD7VOCQYpnPOjYyX5oV3nt0zVwmGm4sinnHN5SH2C7W
         N/hLeNQ2utAgENUhEvhYAV8pQjGL1oxSDrVmgXMuaLiAJeFgesEa8JgCyjHhnIg956Tm
         ggbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078904; x=1795683704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=EDxun3wojf8/HdxeDbjvMicqqWi16MBx+WdHOh1i0qYSNRn/5aeS0cuwxCbnj5/E96
         ichwhdUh1ScUD0KVzEdGxBE75ajsXJdBrdL+fK56SJatpgc62mapKqvhCxyxZN9v8Fpf
         ZWbqr02kl3fQezgbSMAfmKqnv8PBq4RBIitLPpRWzKet71Az2nRteq+qfj3hVVGQUY8U
         iK2FrmBc4aqXOJKKfGfuY4dW5w3XYiwVqPIIRtvL/DHLT1cQaOK3zENgmzocSwyreeHg
         SJNS4Za2EMf1EAk6ZeLsCuzfsbMJksGAxSBJYZEhlB9LywWyo9q/HIP3vil18PUcLE7m
         hXHw==
X-Gm-Message-State: APuU4Z9vG781lUU8GiYfcksvQKB1BsWc/pIYl26GH4pUidJ4lcd3JBnA
	YIsxnPhkATKKbwtNwjLvNiSh0I3LN8rtkBSHPJGMd216JRZk/3+j2cL99mOdgDFUYuYGGNgYEvQ
	jojXNJ4HoRoRvXfC+lJt6yO43zMfYQerwe6S0mZ85yNOnTZrxz4MvvoewD6TC06rDSOW2
X-Gm-Gg: AZFdTZfNpXu7bY/CNqJ5s+Nqa1cgD+YxsBMV8XRkLXoP0O7DJEAAX3w5BCCBjVmBgLI
	QZE32ugU48hYcbN1hQy04F9ZAoDGPyTlQ0k1xIKKxFHvtHNOYAkbWQyGwEI8G5NLl05gVMF4u3J
	6+tajSWQPu/GhyewaSFke/65GdHeka9smV6bnYaWh637Yxy6ySdSVAyUbtTMYUIhiw/K8OF8sje
	X4MVYtxBtGgaYfLHoQS6fh8nK2/qDyoB57myNJN/gloctssc1Yv+wyGl23a4fUVMvKmsVmwBoJp
	pgoHaTPXn/9cabVF+3miZorDvb6YEJACRIZNp5mBFBvSKed3EfKZR8wuTy+XTQQPkTwEmF/3Ail
	koR5PE2WgQ9D2lIQb1FY+0QS6CK6/zHaMQmGvPqTxeUKcrl8aO6izEN1+o8ora5jLP3o7PbStAX
	H6JjeHR+DtwLwte7Im2uD+VJ87r1jjP9/16wI8
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300477a91.35.1795078904023;
        Thu, 19 Nov 2026 01:01:44 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300427a91.35.1795078903441;
        Thu, 19 Nov 2026 01:01:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:14 +0800
Subject: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
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
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078890; l=3826;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=C45KpIlwNH/YljdNNGWJBV58QJEhk0JLA42ndKrZbLg=;
 b=ev1M+t20iPdOBT1JF+M9fv5cK7IESCNZW+J0Xb25OlcWBUp6HxrkiZUYuwxXSwPT6MG2W6Env
 pau1hGehI26AVrUz+cJSIZHv1oGt+KIKTxSRtZ/hkqz8oZ9sr0m8471
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: FaSvjOavPUx-w1hXDv-Yiz0h9RUQDB4p
X-Proofpoint-GUID: FaSvjOavPUx-w1hXDv-Yiz0h9RUQDB4p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX5Vddvf3+hhDn
 e92MwLAQl5SiVVz1K4O2pHiBwKkxXS7h5YLSGw7lDhmcGIj9To9Fkq2h9Flz0K7lIRxwa81z3sR
 oTb3y9GTNyqDDZgSTAwAef9rqJdLqkk=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afebaf9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=IqNXJOJUzIoeS_XrjnMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX8/dT/21ixeIR
 skG+8KicV6WcS3f7zSqfn16lfIrsqTTA0fPu5RTSs2vZ9BOfC4GUCVRpUfzF8kQlAm6zQA3OqKJ
 EFgEDPRq7SDyOhyUBLRYy954jC2DMKcFyVPvyAd+iVeQzafrI8yk8lGGOrnkhdqR0Eoq2QFFVfj
 ZNlLNCdZwHQdtpPzBw0OLRCDqR5osc1QQ9jgmk8PpFCVOg3YQQRXt70H/t7tFXkFiUmOeeWX7Rz
 1Z7XRBEwWVlNXo+I8NNr/MyXqrtL+0s9KSSyb8ISrNNZrf8hmbnJ4lTA8foTSOLE6fqcaNaNroa
 svTfdEibsvWQDp48wSIWyfEd25sVO8EeVudB5lkVuE0MQ+AZ2iem+9bckL/42c4rrTFrHJ4jpPW
 izpk/z2Y1J9OC+z6XKskokyDCx2kDN9/yR6FAOdH9mkCSGxvNaEj2gfh5M3amcF7HblGj/pql4v
 9qfBZDJASJpI2GZ8Gyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
node used by CoreSight debug and trace blocks that are owned by the
Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
firmware to control those blocks.

The provider is a Qualcomm platform/QMI service node, not a CoreSight
graph device. It exposes the qcom,qdcp compatible along with
per-connection QMI service/instance identifiers; the QMI service
version is the only optional identifier, defaulting to 1.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
new file mode 100644
index 000000000000..ee0a66b12dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Debug Control Protocol (QDCP) provider
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  QDCP is a QMI-based firmware provider used to control CoreSight trace
+  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
+  than the application processor (AP). CoreSight-facing consumers look up
+  the provider through a "qcom,qdcp" phandle, naming a specific
+  "connection-N" child node rather than the top-level provider node, and
+  issue typed firmware requests instead of programming registers directly.
+
+  This node does not represent a CoreSight graph device. It is a platform
+  driver that establishes the QMI connections used by consumer drivers such
+  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
+
+  QECP exposes more than one independent QMI service (for example, a
+  separate service used by remote ETM/diag sources). Each QMI connection is
+  described as a child node of the "qcom,qdcp" node rather than as a
+  property of the node itself, so a single provider device can establish
+  more than one connection. A node without any "connection-N" child is valid
+  but provides nothing for consumers to reference.
+
+properties:
+  compatible:
+    const: qcom,qdcp
+
+patternProperties:
+  "^connection-[0-9]+$":
+    type: object
+    description:
+      A single QMI connection established by the QDCP provider. Consumers
+      reference this child node directly via their "qcom,qdcp" phandle, not
+      the top-level provider node.
+
+    properties:
+      qcom,service-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI service identifier for this connection.
+
+      qcom,version:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 1
+        description:
+          QMI service version for this connection.
+
+      qcom,instance-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI instance identifier for this connection.
+
+    required:
+      - qcom,service-id
+      - qcom,instance-id
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    qdcp: qdcp {
+        compatible = "qcom,qdcp";
+
+        qdcp_coresight: connection-0 {
+            qcom,service-id = <0x453>;
+            qcom,instance-id = <32>;
+        };
+    };
+...

-- 
2.34.1

