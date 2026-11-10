Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273706;
	b=xqNri33gKeUc0LwHRDwebTbtgshMdwji1ZqqbBLojiVUD0jM0ONMuwyHIRQCuoVxRjnf
	 JkkrGVH2eg84cg1sAqO05YuaPQrZP23jAfAmA7FexTdDNyNXaLYm2dLgkkFhAYfy9UkD5
	 rteJhieYyiumO1IrUq7pX58igpAO4HcdA6zEelzSyhln/YWcniaXeNJYhVcD/Ee49Muax
	 KT3VYtuM1p9xQ41SXJTERnqSLfjoxvIWqwtujaKlqbAczaz7rUrgpdE5Rdw29jwjcoE5V
	 ofx4nDUIAHYw6+DIbajbStO2GoW2CgJ5otmqtqAD9mZJC/YeQvlmovmCsFbXo9yhRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
	b=br/LIyJnRAvIpWRi0T1J4p2FB7EroS37pA5Cu0PemYX2riYoO5+wSrmyYg2TSXB6Ibbn
	 OK4k3ahYW0P3XVLD85e/z68X8Nqp62BxxoZrO7NN9mqfQEP6qmCFg/dSc5D2265iFrnJ4
	 Rf/Bb5OhfjdUR+oyC64kQqFlPHQMsZIEKfnQTdpNX9wFVNFuJjNCG/xpUTSgKj2m5m9dK
	 91AoPbzPz3kAMUCdmfstcLYgnIedBmTZWD+NcgBXO+A7qBMb6w8Q2GTfUPYfOA6TVeqs6
	 7U3CBA1ffwgJSrNxFfY92+x8aW0XDlA8ZvGseyWkBWLZ0oqkWVe1kndj7up5twIaEOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1jPO6On;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReIuYGKF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65260A2601
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E65260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1jPO6On;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReIuYGKF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j2Xk1829511
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=; b=p1jPO6On48JanXFT
	4yaf1fBc21EJqjBXPey/FlyERlNs47OCky//WkyOr8qBcMHJm9pZx05M65oKFR94
	9pp56fv29jq7dyQaItr8OhmRlkL5pYIqkFS85kDtfWCbmVsxd6OseTWREmuyrMaH
	Q3glTqyO5ZQ/JMqHSJS16sTEpl0/0ykhhJWDofrzvRMXvsGUKwm1Apw29JJca4my
	6Szbx50Q/O3cUs4i22YUzIn4uYXUBW7RfB4os8JkZiV9hFuvnC5+iTv88kBgc70Z
	kDKr2b4b17KJQxTb2DPUCuKGR/GyF8KV5v9JrHfRwnY1puZrJJ6UK2CwTEcDDeX0
	Y7YS/w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5asw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:21:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so21240615ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273704; x=1794878504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
        b=ReIuYGKFblN5Vn+dcKk4FjaWy9ivgRp5vs13i9b+re3/xVk8hh9/oX5s23Jz3Vsya2
         a3sEKNJ3BnNlwjCW3bPpDO9VSRxqC9iDLDUGnCTZfFS3AzU5Bj4ZJBB/vv6ryxzNHLXJ
         b2DUyg7CCWPMsuesXODouV3IWhTkj47E6SunX2GPr0Z7CCdiVj0es13gF9T/4y7ZMXbj
         0hbnpCixomje/jYbwkuHh/jM2y5OA6jGRLl+6782ih4A4fjUudW426obX7T+4sxgwfad
         DNhX2wzMFFX4Qcy5iPnUSyZTXfE8Dxr7IkH1LER/pBVOTczA5RoXh1g18uiLRbY3e8qk
         +IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273704; x=1794878504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
        b=nIknvZ7/0rIH3zKhdPq3erBK7lWySCZCWJQvG1ov2TkSE0EicCAKXgZmIlKpfmM1Fw
         r/MOHC2CzRCXzNSXSmWnMKK32aI0vQnRB85xSQG5cJ6sfAeH3ETpSzmkgbkraMzajBRo
         vWYvTm0sU4nFf9r8/2pxHyz8RHKa0hRdGfeOCSrvLCIKYzwIjekVzLX/JSUR8Hfj5d9E
         tNxur81exHa/YASTGPdT0vJIHoczJeomBz/Kg0W/Q5JsYFX1et8wdcMq4CSCkfkBqk0L
         Fd4DGV2h0WJB2Ln63VjLPQoWG2PD3F8AeNxaVqaNk/J5iydd5lo3i/8zmFZR/XWAeY+/
         u5Jg==
X-Forwarded-Encrypted: i=1; AL+hErGPx4tzxS1yOJfYDtDsShq3WVhTfHEY5IqnavHbrP7hBYZEJjk1k4NqBtv/xbEz0kFpH8krxOQsgvgvQl5d@vger.kernel.org
X-Gm-Message-State: APuU4Z8r1mNMtfbOp6qNYb/nxKvTuNgy/3SDlW/Dx3QpVIVaMTSx7l3z
	r6HXcLa87Z/zOioht+jwzSLEn53Y4soQJN0/quV8NAhilFlov12XVKOg0Iavt+n5VfLseFFfYOP
	O8IWDGBxOCX3v8GiZ3+9RLJ/EBVvBsFepoD+s9Jpj9z8J9F+Yccl+bRFs0WZU+AsLCUrM
X-Gm-Gg: AYBFou3tmhJHt7l1WjEyXv4xUwEbc8CRYlTAyDHUUOU2f1cWDSHVq2CFvoBFwpnT0D4
	yI8H64GGJ8zw97dhW7OPWs8qnMbn85/6+gdwVT0x7NrEgcDL8VLWGuP43hz1tUPJRjYPPDyYxjD
	zMzaLuM8aVdapE4CI2a1cSiCZW5hZ5gpcm59s9UG47hS56ZOGytKv3jIOe3gLn+4A3E+jjhXVOe
	qWWQjPs0mtaBb4Sa83n3OJoqIY/LMJWVJ/C1ZfWQa98EbySBK5LdzoTj+NMkdQ8Wd+bab+jhwyU
	aIHTOTHs3jaRrVqsojESQ3byo2wuig/StM0JTWxGugA3frw1QQF0rQGBdCBqOBJNmbROjak1+AD
	XBmKS+q4Ddsi6X0dNMHq4d72wIuPIYyZ8uizWv4P6dmqBrCacgMmKE5CG5dSIfJ3ARoWnPnHnrC
	IXZJUnK/vSvM1se6iUrHhEMFoVJLUSJnHJ7U4=
X-Received: by 2002:a17:903:370b:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2edb9112334mr8824455ad.27.1794273703907;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
X-Received: by 2002:a17:903:370b:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2edb9112334mr8824235ad.27.1794273703462;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:14 +0800
Subject: [PATCH v7 1/5] dt-bindings: arm: coresight-tnoc: Bind on platform
 bus instead of AMBA
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-1-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=1976;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2oxHkcQaQLeTvUlBWCfoatURBNLE9gB2lsW6YGYzHBI=;
 b=Gt3daX0ozggC7r0JYsXI4bbRCKxGFVnSXpJ65M7c6iDL5mtDLeNtwHK3Nkqy4uu8ntIqlojAQ
 XjWzMxsf+jZDHd6Gr2sxsnQ8RRbkmOCY2cccxVG2zxg5Qw7M5l9u+fx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: IwMs81iXRMW7aQ9TbDRlTygEQWyb2EVL
X-Proofpoint-GUID: IwMs81iXRMW7aQ9TbDRlTygEQWyb2EVL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXwKXaG7rAtmNv
 Qr2B1jyBTZ0M+JbISP5YMIw6hQqd3pr5dUheuGocRQquogiHW5uU3yxrd2xLat4R8CcEv/5uPUt
 0L1oBWvfbE4x+UPyWQTpkmRnK2qzgnU=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af271a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vX9vLbfq_6l8qkBHxBYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX5kpAueXQ5EBj
 3qZSlkYZG50run4TyM148Lsdn72E0sqBuabHq4NHpgXOclytj3NWBwsR+cM5FY3rvuK5jvpWelH
 IXoFg0NUfarQNozk7Cq/j5TA3Sihb4Bit2Gf5hdOeY1ktSbFYCQmyLK5xYiqYCmq0vZtqfcUUYI
 fv/Ojpbem0o/AC2DG5lvFMttgSoSD/9/9cgRzbVZRyDcDj+qtgNhcmHfnO3KrvRmfPX6B4u/RAD
 l2FaQFt4KWu5XWYzG5vP9+UGGwmjLr5u0PbVXqPFF0Rj2eRGjOMFsaaJ+hhtDeURC8VpoHOEr72
 +4WxdEnnJKYj7VSHnbrJHW6h0lrhVsBSw9xjWzPy2wKQ2kDWd4ghxJ1OdsNA5ErQacYTDPmT2O2
 OkKMmL6jHrNJEiG1ZZLQswTpKHsHeK/o4WD59S/TkG/bracd56zcrzlsMncMgfUlZWvpzBiCwCA
 MNxIHCPJhUJ/6IU3INQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

Describe the Aggregator TraceNoC with a dedicated single
"qcom,coresight-tnoc" compatible instead of the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell". This creates the device on the
platform bus so it is bound by the platform driver through its compatible
string rather than as an AMBA device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e..625801e3d3bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000 {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1

