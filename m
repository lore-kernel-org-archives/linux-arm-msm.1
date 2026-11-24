Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542551;
	b=TTxjC6fA0Dz5FoOPuR3rnEzFEn2QLikG0w4MHWNGjKnEHpbazTFXuyMfZ0KTv60FABa8
	 JB47F5hBnGzwKmPCE8qkYpT+6+kuJ6WG93DTD8Ny84ikY6LjFF9gi2YLoeTmVPVT6x2sq
	 qSQMq3bYtA6Qk3pWBFLWaNxLy+GqnH5jZBfZF+6j8WmOYhJk9rXefHYlylqS4nKQ80nUF
	 3dlCeknnM+FqHCzdaaMhQFSZ7aAEFpAoRYKzr2OG58Gc5i4HwrQhhVT1Dm+P3kCp7OVuW
	 AvCQOmrqvAA/yduFXlo1P1HX9dzzBvEzVPm34OWDFtE7v2qqz+gvMHGWPf3wwhoEDsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=;
	b=HSHP98UPT4YyaCt55EbROXvhCXZNlmzykP6+d2B48m8VA3dkKFreX5Qivo+Xjxdv4qPa
	 15bJPk1MViQW0VlZtS0vzoUj9pRgKOufJ8VMTehk14lNbRNSWTN1QCU/jwE0MNIfV1Q7o
	 ffAC8VSl40YwBJEhytuY3RZITHMeW5jVBtNbxEA2/hl1Nkxyq3j6MiRBZ6fxu0RQ4c+3B
	 Ltx2JPW9u8N1KCebwIdsVA+/WCpNcMkD/QB2RinI4aWygJGN1sI6qCtgF465HCBOqUqt+
	 gDEKUIkFHJvtizAGQW3Wjo2j9uJvpHFLAQ/oxvFCgeVkTvh72R104nhuIRvKPywTJoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G89w7csz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amy00qfQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEA606A339
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BEA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G89w7csz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amy00qfQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOGpT8F4083359
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=; b=G89w7cszOfdQieSQ
	c6M051S7fj9q6zLxa0kstE+DAAUIYpu8G1Aq2C15SqZ4lD0XzMvrC70xFbWinHAx
	wC8d6RsMFZGnQFXD/X64QrmlS359qvbkIYT8CdycTQfeDTshVywFJxMfzWFqZqXf
	x4KfzGVHNRKN2Aa1LSugn1bdSPUkPNvCCMv+fhstY0JHQimKF8kceXinrO/ppkrp
	8iT3CM9ze/JFTeOw42wGAw2ilxNHxc7P++TI8iafZv1o8zUwYeMJopjDMGWmwSiC
	5Kvs+PO7NYjXI7EHJNMBUcyvLqSkDzfWmcWABdA7fZ+3Tnw3qfQNvirpgF+6s+Hk
	iqc1SQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effrae5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso257467385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542550; x=1796147350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=;
        b=amy00qfQwqcKxbTmB5SV5epPOCz2qb9lVgKU8OM6J6F1QUJkdLnTRJXXYHhQuClkpH
         Y9A1XQRjpFN8TRdZUJYKqOB8qsWCjA8BVcsunaD7N/1JUKcPtAlkBzlDR+CGa9VVDs1h
         piZmOdrm1Z1FhzuzdmpiXMhPY1Xq3VfqWHHffvnpRUX8tg/t4AyQRDaKtH7Qr/0jc/z1
         yYYd+9JGfvEQ4ans9rUOofeNMrjN+6de6NmURY03oLMtPS7frnLDJl1e+mLPHQWAXU60
         MbJ1pe8aDRxszyXlWJT+nkzDhEmlhGaPGQI31RILTeZU+4TxwJ1c1ETGzhlF8FJQuzRJ
         TKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542550; x=1796147350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avLPYoWnf737hynZgFHKxpC9sYMKxbQm/yIW/KqWgEg=;
        b=t+0zTDLLpcgavAEeizN6GPOroyf+OYUTFVCyuGQeeNwlPe9yccD0P3N1MzVmfoM/pL
         MSg5lD2D/1URgZ3TOEMCSVjVXK0bmty3NKPIlNIhQvhZP1oxQqB1lPGGMeibWnGLuRYL
         4eGqq4RUlTCvE2ICHg+tPD0GJKAGQHy2tSBAxziSuuaPSnSPEdd+CYRHSBUHaHNisN0B
         FwRCvyskN49XCH495xbyfS9gMDDfA/meIVo5BJSlIhtk8KLDatjTAcTHsZydh40sUOEa
         S/9hzKSkE4Mf/eliP5zgQUKgftJtSCbLaLwWjW8M3Td8ZCGqkhKfYUeuLG7BfZkcz31J
         +RJA==
X-Gm-Message-State: APuU4Z/YSI4W49QNkd6O8TE06uNXa6I9B2d19LaB8HzsTwg9V6tnkba8
	wYS81TzExVEjhN37n//xWM5Nrk8jQ0VKOatyRavPQMUEChsAMFTtfQhCxXFiDAAWD4Kj/36zgB2
	PfBxOUeB5wGPkWDoTyczCE8VNmuPa+AIQNu5Zyd3Cm9UOAwGwj68djxugSVgSYfhU3Asu
X-Gm-Gg: AZFdTZfabXnSFJWeWXWeAaYOoLd25geFJWapOooH6WfMFV4JgSbe8yR9d3R2/PRXk+T
	ymzXk7VthNrt1jw4b6BgYKypY1nrXybECWh83iuJWQ5vmpOdM7QcsHN7yy3/XG6vJOBXr+foUlN
	qRJDyS/q3WcxWYDicH5HNMEWRC+8CLvCUJGOBH6AZfVx8MoSYHvsx3id8WTFjVBl0bcelhg1Hok
	CWxO/LDcRJtFSiDeUeK0S76IhtjHP3UJmlRpa8bw6WCZoavjo1m1K1yocHVWmPZBtVVI0HSWoVq
	1ejz/6hIfwZOleNE//itv5QMLQ5IOywtr9uNWI4ZZs757XwWmw1C51Odc+bTfBm2N+AeeuLAeSl
	L5rKGx2MAG2c3F/8rBlIcSXKbJPlktUeK8x4kc/u81Nkm/m9FhQy4vMdmZ2vaVox/dlVuPiFV8H
	5PzuwQzJqaG4ma
X-Received: by 2002:a05:620a:4688:b0:949:7c8c:54d1 with SMTP id af79cd13be357-949bab181d1mr2710245185a.52.1795542549718;
        Tue, 24 Nov 2026 09:49:09 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:949:7c8c:54d1 with SMTP id af79cd13be357-949bab181d1mr2710239185a.52.1795542549185;
        Tue, 24 Nov 2026 09:49:09 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:08 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:51 +0100
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261124-qcm2290-eud-dts-v3-1-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b05ce16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GBRnKKbz5W7R9ATGUUsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX0uqldzJ9aVos
 BfpG+Y8x4oE4LHk+ngsW3IcMsZum3W07Mfvxh/Cn/drOCQqyvV+FZHQPzlEd5+/SJo5gDNFKg9H
 GskecXZ8g0tj1XY8mi3ZKdYrdv6BlXJ7+yppAstiBVXfBo1LzeDmSiBdcPcc8xaLrpKCZeFcVeW
 1u7L5Wd5vl6Tf4U/KCDlMgUmf/HkRWXuTv0z0GjC/uo5bg9d1KwJy5fzphBzrWik4kEmlMTWnd5
 pwROK5MzBDZ/gOtEvoow5RFqxA1uJJsrInaBn0xY7waI55cX1KUqUXiO1O792s7ThjEhBUUYlSL
 D5oGOG/sLpkYKmgxmgu4jXWuoa55a/7aqJRvlbvlWFY1jht4q35rlRgjCUyaxfoM5fFIuCr40TU
 snqjCDWnvefhTSV4kcnocYakuai+c3EA+ZipqDCtdIU5cEKRFyqhKaEXWA7v7fIYuVXIwZHm9rW
 FIDbhGVoU/gmptZG20g==
X-Proofpoint-GUID: tFbDjbWNJ9xZtsQRaZ6BiNOl_e9m15Ff
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfXwFl6T4hoedSN
 tZkdbme4WKPtEHfwxDuR+tOf3/5wYX6zX40TB8q45S8htnql8+vKtwAiCq3K+tjHTWQj1iwUVuq
 yAH7GD+QrN3tiOBLBmQZdh0HGepb2lk=
X-Proofpoint-ORIG-GUID: tFbDjbWNJ9xZtsQRaZ6BiNOl_e9m15Ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver.

On QCM2290 the mode manager additionally ignores the enable unless the
TCSR register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
the same before it enables the EUD, and the register is written through
the same secure IO service.

Add the compatible and a "qcom,tcsr-reg" property that points to that
register in the TCSR syscon. It is required on QCM2290 and not allowed
on the other EUDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..bea03468a499 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
@@ -29,6 +30,17 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the TCSR syscon
+          - description: offset of the register that has to be set before
+              the mode manager accepts the enable
+    description:
+      TCSR register that gates the EUD enable. It is written through the
+      secure world, like the mode manager register.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -50,6 +62,19 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      required:
+        - qcom,tcsr-reg
+    else:
+      properties:
+        qcom,tcsr-reg: false
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

