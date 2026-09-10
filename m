Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A0448A2A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045278; cv=none; b=YwA13HsVa3v9nh1bQCOs7i35E7Wb/h+vLgIsUZkqJGQdSatae0sGmrgP6aM+i6GDZf+n1ieIOKQqRtpZ5AXMQxLaieJWrtjhcorxlbpvmoZTbvRf1tBw8UXxBNPMeQRS9c6PIaRaAlJeZhNtbELx0YOiupjfVvOq5xm8FBxHu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045278; c=relaxed/simple;
	bh=LC9mRgiYkzTZ2U6TbeyqAk3KahVEL9js5PsQVWbvhA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOY2FniEaFCJLYxd8ilfsukRcF4Dwn3RbAoUB9uNoDD4YZ67C7mekUdyTLnSSti/Z9IZEDoDOk+aZxkRxmSlSF7fuLLw3dmxEUvsCuj9WSEVOACYG+e3XBdeEbSqaUGrM45/Om3l9WQHiUDrSSC1piyFjQTfat01rSrQ/9o5D/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCvyfCQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2JLz2rc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCvyfCQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2JLz2rc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jB31241983
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=; b=mCvyfCQXtZJyq348
	ODy5xXFurIYF6Hyc3nz2MKKpygNb3CjPCvpnjY4QNMdD3yct2SBXgiRkqYQwxSA6
	g+9a8+ihNiDIu1pqv2h+Ls1Ue4pBJtQt+GsT5EGETrUSdzQKJWtGICbHvIxx9xqt
	zBt4DHIlnNHFHdtkzEcQnEgjwIhMyKxu+Bo2ZJ7yQ4KmAW55T+DC/7JZ3PUKeZ3n
	8J9eIHg3/OnK1bohwQpjc4OnUITzpZl4Mq8yV4MMW/kcWkuCk4mHi0A2c2CMWYJP
	4JmiC+5/xmlZmo12wT4ZkjkoxhLGJX+xav5j8oU1S5CMNNznOLmK3M6TKmRHa7Ai
	eaDB5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjs7c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so140003105ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045275; x=1789650075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=;
        b=S2JLz2rcIxArCd73+FQOfoI4c/oiPKGRg3TUTPfNNfNMqWHSm79Euh6dNHsvnB+DnY
         IVPqgS1vlsDiu7REC8Yzp4Dema5e7oOf4ZM5dtK56H6VYH64uAkqOTJIJDJ0qntZhYfm
         rAvzRhtTwY+jzQYyTeBenq1Mss75pCPCq6o4bAG9zx4ssluKYPOjAylNP3HEPVYlnnMh
         9pVuFx09EjI1btF2dEf0LaImgiv4SUYIupYEeC3AKS6G6jPEywZCDHgEumUh3/35rjcO
         +2ftXxdp29Oh5rN1yXlzLpGmPWT6MozkMSRVhkTXNDn0DnpArWJrRHMyxHzNVviEZa3W
         nmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045275; x=1789650075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=;
        b=WVZDt6RqISxeb+Xitpsky5ky+HAMFP5XA/worteerSeCFIdzTCSb1eikg5XmcaRewg
         4hxnDakgzjWRVFM8X+7hMGYZrcykzZtjxGhRbnaeNSDCMpodQmFbrXaub0vmh4G3LWIs
         4qk6Tmd3n9PRQjULtm32vTIid0zkJZllcsuuqDolQd3C+GhOr+1wEzphWGVrdEcn0b9E
         bfxSqVqSBJq0npT7eGvFlbQZ2NjjcU9Rg/3u8XM8M2mhvxFED+5dPvB4oSnFYGS/vifw
         9iNo8dJFzTqPV9QIiZ7piZWq0eAY3RjHIKIQMtsOWyDG86XfOuxluMIlKGBr/yLnfRL9
         86QQ==
X-Gm-Message-State: AFuF++m2KTVxSeMg9SGdzyXwptZ/TK8xhJPINutvPT4D0d4Ax6tnYXTU
	E99xng4xL+KzS/PC/qStR6/H5Fv6zrHl/WZgjfxI4vFYwWthiqbH0xu+6UxKRawPVFYkol8WC1p
	gYM9iq6RWnam7+IDx0kfha81xnLxG2VpkATJLpMdBn1TiJbgeTdGobZwbHu3e2oV2knss
X-Gm-Gg: AYBFou0W3v+hmgDX2cKqsMjHfH0o7rWwJPpzQiIIW/auZd8x8g7O6aFjDVMfBSnaKt2
	Tp6TtjOgKivXSTKxWJ0Pahb4h5bSP/m9MuuTDMbYtVFuwcNypnJI6eK0hPDWCyQp0M0I23WyTuG
	gbFa50EjbdCybrQ8edPsCkllgZU5JULhYU68MlhBivfNViSXIdXwBOgoH9RLVkuITImz4aGhpWq
	70mdhyedDQz+OkkQjbziswtbz3o+1o4G9KcQOcuRH4rxWFDq7qO72CleYKTs5WEwd2NaUSb272M
	JfuoqJwqBlEbHvKnc/5Mn020FKa0/sJvr9hlC2e2jfOuePHKBdIe1Hel/YtPYo8amZqhvy+YIeZ
	UuARrkvaYZSqq4Icb0SU4ghiKnQfkUfTC/x8x
X-Received: by 2002:a17:903:46cd:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2db8dfe7322mr175297935ad.19.1789045273120;
        Thu, 10 Sep 2026 06:01:13 -0700 (PDT)
X-Received: by 2002:a17:903:46cd:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2db8dfe7322mr175296835ad.19.1789045272576;
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b9f0sm88424805ad.20.2026.09.10.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:30:43 +0530
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        zhangfei.gao@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NSBTYWx0ZWRfX4bg2+Il6au5K
 TCU8/meEDhmrGKEEqpz8rUPjs8Djuh8oZDV/oCTIUKigAGgOiTJtTy2Ng2hl6YMaYoC5SInVgts
 RQaThmIZBHP8u2KzL0mhmVJ3mfZqKRU=
X-Proofpoint-GUID: bTYec9lybw9o9leyUWHdbJUcQHps_QDn
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2aa1c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Nsn_4hRXuT6My6vqaXwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NSBTYWx0ZWRfX0De9a+tmtpxB
 Crl/13/bw230oVZL05Cuj90QbOVZXMa6QxvohY0Dj9+XwNf6Q2JeyYAugSJjiPX4SVOT4BoKSuu
 7QcuBZ37KzgBUNeoebcM3UA9+7tqYYT+7nP0z+yz8H2w9gAq9p5q0wpYTVykwtUcUZLG9MYvtBY
 ZweYL3gemm1nu9Rs1SC+jyg7KbHi6u+XBQfvBkZpqKbsHqWwcwxfhgfgPxESfRNOMXP0c5DcRRO
 ZoJ37Wu/dCEf3iOCmTaT89WjAqc1aYrXBPXkFbXPTYVp++3MDR1V0h7+GJdYDCclLlP4sY14HQh
 3bRduM0H9F8N7s1/b48PCdPk5S1q8FXfhFVI+IT8Zxqxg87CChm054ZV1zWLsiM0QWweIxCd0Bk
 JnDKgWFobQYK2MddEec+PAxgKNKBvofTy5ik2ZsPn4O0XrmXsXPgyLuPzyVlTs7JhAVQBrkVpVj
 8Soj0IXFAU/dRxH8NSg==
X-Proofpoint-ORIG-GUID: bTYec9lybw9o9leyUWHdbJUcQHps_QDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100155

Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
sixteen bank regions plus the shared broadcast OR/AND pair. Add its
compatible with a matching reg/reg-names group and raise the top level
maxItems to eighteen.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 55 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index a1340226a0d0..2141e5d4de63 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
           - qcom,kaanapali-llcc
+          - qcom,nord-llcc
           - qcom,qcs615-llcc
           - qcom,qcs8300-llcc
           - qcom,qdu1000-llcc
@@ -56,11 +57,11 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 14
+    maxItems: 18
 
   reg-names:
     minItems: 1
-    maxItems: 14
+    maxItems: 18
 
   interrupts:
     maxItems: 1
@@ -355,6 +356,56 @@ allOf:
             - const: llcc3_base
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC6 base register region
+            - description: LLCC7 base register region
+            - description: LLCC8 base register region
+            - description: LLCC9 base register region
+            - description: LLCC10 base register region
+            - description: LLCC11 base register region
+            - description: LLCC12 base register region
+            - description: LLCC13 base register region
+            - description: LLCC14 base register region
+            - description: LLCC15 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc6_base
+            - const: llcc7_base
+            - const: llcc8_base
+            - const: llcc9_base
+            - const: llcc10_base
+            - const: llcc11_base
+            - const: llcc12_base
+            - const: llcc13_base
+            - const: llcc14_base
+            - const: llcc15_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
   - if:
       properties:
         compatible:

-- 
2.43.0

