Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467245628B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114897; cv=none; b=i7u655p2LnRyIXk1S1BFKimsINooOPWPABsUNHojHnRx0BaQoSThvjAZJcmxfVNBjYR++E3S7Nx36khoCsycqNAitH3RuEoNYrlo4QA5B1N+ZAUj4KbP8juJeVb53H4TExbN0R9WQMHShKyTNmFVcUhmoLT9L0GbyrQbTbePD3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114897; c=relaxed/simple;
	bh=mwkLRTFPxbfx/aCfkpcg51GVVHCgt7ycr1rCcEhiNDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbXPQh5r9VC+glP7jeSogpkbR+mDKHY7PmO+r5+d/551wEPBfpJUsHS1u8SIBgy6DsOXWnhg8CuEmDkNRcmBwTTRgy1yln36wKbTuX1istz3D6iuAXVCSL+MgJ5Z5JXa+MtaTHkH251ihc3fAJR7W4fC63uaFDUjjsL/LxrBCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/XxxEJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Btmi3y6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/XxxEJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Btmi3y6B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfsa3686805
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oy4TzhqSJ/D
	vWDw+eqBd+EceR40UC6PEjoMrpbwGDes=; b=W/XxxEJNoAeJNvZ337GB9TlInf8
	wA54YGHHFFC/Os0G7DNNqCb7dDQUVhOfGdm82SXtwu0vdxNOq1+BRGVamzPMkBnW
	UaRa6tAMPREMP88s3qqwatRTI6ltF54mfCjvJi8y3EgUmhZdkXqs0Dcb2Pf4wq0V
	+8h85WAUUR2l9AYdmySD1tAszdCTNz+vEjKl1gcXn6+3epbP6TKZxQabzPj6p51B
	xWfFmKs5VaS1EL5HXdf7aYrcR/17QCCwcN79kyQLp3TcbOGvTwnLHRARnEKWE+7z
	0YwkNzNGuieKkVMs242oINfp4G55WGCgFzfC9VopUpKD/Agn/p8kXAFcDJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0ufg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso35354485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114893; x=1789719693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy4TzhqSJ/DvWDw+eqBd+EceR40UC6PEjoMrpbwGDes=;
        b=Btmi3y6Bpvqt8Wu84JKT14xjHCjNb5Y6+aiT9uw4egNWmsmBuv+Z8T1iD+h0hfa7s8
         1IqGzgIVysU0YID9sxrkONW+O2akj0VlyZSNxG3obEOwmxc3s1+TLJzK+CXH3iKluVSQ
         6xtA7JZqFILQM7eqLujOsouYFn4rriMqlX/zamjRncH87c/yCJxuud5XFUdqh95lyQ/k
         p5Bq7zhR9HVBJbOrj1i9v3j4ho21jpHN0Mp17B1F1RdH3q1T+/TePl3trraNza94Ep40
         Vk5O486RBT3MhOyD9nkChdbAHOzkB+Vc6clIKy8FLHGCn8aZdz9FjuHBwMuyBAs2TH5L
         /fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114893; x=1789719693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy4TzhqSJ/DvWDw+eqBd+EceR40UC6PEjoMrpbwGDes=;
        b=Pqnpp8KafydP0lxZqIUfKcWGNxUzZF1BDp/TeSWJ+sMZdGO4TmfFyat95n4zgmK2jh
         qe68PhlNcoaBDI4JhY2ZNZLupZjvKfAZng36/utyNJ2wSSWwqS73OUTzotPvxYyCNGZd
         Zk8UxhphJFL80EbwolKD4VOGz9+obPwmLbwvjCvfNF9XjCbct7KPzOsLC/KLhWBmFIAZ
         MTiFtA6ms7RqRn4gAJadQekj7AbodrxCqV04WniU8HlXqpHbuAfBu9hIFtWoDGWT9MYL
         A9nmhubkqxlAxxFeVSB94p3ZkP2IbTxXhCH2tj1mBGIUZBGpENvHySPs2f9zKseDFXY+
         1NZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmwBIQDiuwNakVf0qvJ11a/xuB3gQ94htME91L8bWn/y5HxL2lEz53swEUJEdvXXA2Ue+YRvy4nBEqGojf@vger.kernel.org
X-Gm-Message-State: AFuF++nU92P+XTUyOFnL9HN2Vt1+UueWMm+gOifuHF9wmI0NaKkpdMiJ
	OSnHtnUEYITYjXa07qv8w6+g+XC8L7kdesnfmj0M/26bGD+mPH2YOXKkwoH49P25Q10rHKAu5QM
	AfuRdWf9W5HPoKxZ27pQegCyDIJxWkvibun/BxlFsMEnzXOvFKc7o5ZIrV7SA+UEnmtlB
X-Gm-Gg: AYBFou1Pf0s92sb0wnAiNMnonvTAnooa8LIlwKAyPsbTl6taCiDILpSVqBsC/GhynnE
	F4maoiLN3f1TMrlvy4F5GIqQrdoApNpVyFmbfbO8mLWTPBU3m44jeYzqJ/vSCSiU5PMt/siN5Mu
	XBQkEUGTSII+e9mLpvWSkKV0hFRufhBC3jOSuBBzW1sZOBvtC+uM9DpX8rDb3onto+Loq06/d9R
	QXY1R27tEq7B5s+ldnDHyki3utjsz6i5dwbQVhUz3euB321xZ4kk1PyJfN6cy70987TgNsqFuWE
	Sin36eTOrnHFTlIm/tl1eOzmpFa9Uz2dy55WVjSCJe7krTkJoctIp85X4QsWcwEElL++Ww6YZBc
	JwBji/hYrwnRvBA==
X-Received: by 2002:a05:620a:19a4:b0:939:d459:4810 with SMTP id af79cd13be357-939ea13c59bmr382467185a.26.1789114893500;
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
X-Received: by 2002:a05:620a:19a4:b0:939:d459:4810 with SMTP id af79cd13be357-939ea13c59bmr382462785a.26.1789114893005;
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: soundwire: qcom: describe multi-master
Date: Fri, 11 Sep 2026 09:21:09 +0100
Message-ID: <d7b3d0618f20d18f714217d9604a7c09a3539578.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QfbLQhhrvxySPWET0EDVpdeAQkuYPFMN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX/VyGykBEVhvb
 awM3Zhug7M2EUMX64WMOHEDLqAPUhlWUcGa5m7L8AeICKBCCZFzUEyOzG78IO8LnklGvDEQ07Co
 SbEv5cSv4eUIz1Fm7qMhaWc21pgyizM=
X-Proofpoint-GUID: QfbLQhhrvxySPWET0EDVpdeAQkuYPFMN
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3ba0e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Na-TPb6K_91XsI5DB0sA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX7ZwY2hJVMiov
 2hu6RMabTLEIqRGPa3/b6SB51/aK+37jvGII9OtSWElb7fb4qSOEmha0vX4aMJ1p/hONKlXivGN
 HTRGg2ejZYEQ5nMZfwPyexv1lOraUJ2forOs5kF92URk3mIK624sHTSV//X5RTCzpcH4sT9gk+W
 IqUtKwXPpCYh6vdbQ1E3zt/DqVgHRS7E/S40XBi4ozP4tKmMqWOFgVTXpub3R2oY7zf1yA9lO5t
 KYsiXTUTaTYgxJLSTthR71Qzsl+kuLmLh7xSmyPMmslZ4euZdv5NMbi9mm5ODXSr/aNDpGGUQea
 +3f2Q3YKswsMMVzQ/BnTN+YHyhSPOKij5PA6NXxj2HMTxaXhGBY0eejcN/yQcxWSythWoppYK8m
 7OubSi3WjX1UM1IiYJufcHsXm2j+HFfjq4/PiKBqy4/yg40LuAKmg3enNpVTEzqzd9O8x63pRyG
 cS+NdI6AQoB8SsJ+Z/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110116

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. Add the two properties that
describe such a pair:

  qcom,multi-master-mode  role in the pair ("primary" or "dependent")
  qcom,multi-master-peer  <phandle, bus-port-offset> to the other IP

Both nodes carry both properties.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++++++++++--
 1 file changed, 100 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa229c..6cf3285ded92 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -215,6 +215,36 @@ properties:
           maximum: 4
         - const: 0xff
 
+  qcom,multi-master-mode:
+    description:
+      Role in v3.1.0+ multi-master mode. Both nodes set this; the
+      primary owns SWR_CLK, the dependent contributes DATA lanes
+      only.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ primary, dependent ]
+
+  qcom,multi-master-peer:
+    description:
+      Peers in multi-master mode. Each entry is a
+      <peer-phandle, bus-port-offset> pair. Peer N's DPn slots
+      1, 2, 3, ... occupy bus ports (offset+1), (offset+2), ...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: peer phandle
+        - description: bus port offset (last primary-local port)
+    minItems: 1
+
+  num-lanes:
+    description:
+      Number of DATA lanes this IP exposes locally. Required in
+      multi-master mode; on the primary it defines the boundary
+      between local bus lanes (0..num-lanes-1) and lanes contributed
+      by the dependent.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+
   label:
     maxItems: 1
 
@@ -224,21 +254,82 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,ports-offset1
-  - qcom,ports-offset2
-
-oneOf:
-  - required:
-      - qcom,ports-sinterval-low
-  - required:
-      - qcom,ports-sinterval
 
 allOf:
   - $ref: soundwire-controller.yaml#
 
+  # Single-master (no qcom,multi-master-mode): needs port config.
+  - if:
+      not:
+        required:
+          - qcom,multi-master-mode
+    then:
+      required:
+        - '#sound-dai-cells'
+        - qcom,ports-offset1
+        - qcom,ports-offset2
+      oneOf:
+        - required:
+            - qcom,ports-sinterval-low
+        - required:
+            - qcom,ports-sinterval
+
+  # Multi-master primary: drives the bus, needs port config + MM props.
+  - if:
+      properties:
+        qcom,multi-master-mode:
+          const: primary
+      required:
+        - qcom,multi-master-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: qcom,soundwire-v3.1.0
+      required:
+        - '#sound-dai-cells'
+        - qcom,ports-offset1
+        - qcom,ports-offset2
+        - qcom,multi-master-peer
+        - num-lanes
+      oneOf:
+        - required:
+            - qcom,ports-sinterval-low
+        - required:
+            - qcom,ports-sinterval
+
+  # Multi-master dependent: contributes DATA lanes
+  - if:
+      properties:
+        qcom,multi-master-mode:
+          const: dependent
+      required:
+        - qcom,multi-master-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: qcom,soundwire-v3.1.0
+        '#sound-dai-cells': false
+        qcom,din-ports: false
+        qcom,dout-ports: false
+        qcom,ports-word-length: false
+        qcom,ports-sinterval-low: false
+        qcom,ports-sinterval: false
+        qcom,ports-offset1: false
+        qcom,ports-offset2: false
+        qcom,ports-lane-control: false
+        qcom,ports-block-pack-mode: false
+        qcom,ports-hstart: false
+        qcom,ports-hstop: false
+        qcom,ports-block-group-count: false
+        qcom,ports-ch-mask: false
+      required:
+        - qcom,multi-master-peer
+        - num-lanes
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

