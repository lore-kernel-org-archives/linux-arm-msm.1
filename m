Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF53E7167
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883429; cv=none; b=KUr45WdenfvhfzAQ2K0fImyss/mCLqgpU24j/OEdyg8AaBQyw0kcZsBO6sMjASpTOggAINiMWoL4/iGDbd1HTeUyyF/blgqheSQHpY/Z9oKS0hSi4Jb2gbt4JX8nVlYD9eU4Y5iVcd6i2bvMO4a+KLH+1+HnFGsK7dseaJhdeBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883429; c=relaxed/simple;
	bh=ehehTOb971vNnqcNyXX/0RP3JdqsfY8qihmSio3Rxnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nd0+rzIG6rB1S73AEDa5Q5ZYYggPzRGhSmSs0O8OsaCb6g9iuUSkZlBSHxqHW26Jkx4A/QkD9FJYIQHOj2G+WygZUTUn8BppV8FmQjFUhcTcQom3LneBK1WKdwQqHB+mZOUwymd/vyyF+Y3H9uHDvo3Yep4+bYfOJ2flInSo5/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AU/3rh5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyEkadgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AU/3rh5M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyEkadgX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lBM02137557
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uY9uni8DTsA+d0nJwe4VSgTG9ecNhKhf3SZ
	5YEfrVf8=; b=AU/3rh5MIlTkbR4RMxO7rHPnflCK/iTZXjU2Ysf0Gs1pYnivCxM
	h56IlvmzNfhOoW3a7DPnsconuHvFjfieROSfubRXF8bFJ9IKMOoxZAz4H8oQWYbd
	D+pVh3ZYEA56q/I2jxoA0jGXUzRgmd/jA61p3u3A38JupT2Rf9gTWuhQSOtUobqy
	iB+x/1EC3hQtteBCI37Q1XPo8FbSPE+Cf//tu3lfw+YYhrrzmgw0tkmohuhVkGly
	opX0OESFwyGAa537pyLc8Hs9iL/F19yWu+sNh8754wFPDIqSV5h0KjoytS3YZ9Wg
	vUlT0/CUTyOQRzWNpfFbS5vRlccqsSUH47A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1b08f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:57:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso479202a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883423; x=1785488223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uY9uni8DTsA+d0nJwe4VSgTG9ecNhKhf3SZ5YEfrVf8=;
        b=jyEkadgX4t71a/nNKhuSZzHXQD8ISDzavoHcNsOFMHJ+9w96vQQdW5rjCnYy/8JUzi
         Fci6PKkc13zkAbhXeRDqouK2sK3Lo3q+X6I9jwAx29CUH4vjrsPmkCt4XE0OhTObejCz
         RXhkjq2Lfr5hzBxFgQObCdnzPZFaXaI9xveddoimVdhTjRPZyhbeMcY2vZeglwb5GpZ1
         ay5M862QKzRXK/5cdIXMZ6TtKOxxwunstpQkRUD/g7uR8bQftKRG265F4ISjGQLfG9kV
         +H0v+eoYUfBR39EoHw0kgJnAInA9LNdlqgpAsQ6dqmNK1hASeuMRG81cZlohwxln88Dn
         ZmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883423; x=1785488223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uY9uni8DTsA+d0nJwe4VSgTG9ecNhKhf3SZ5YEfrVf8=;
        b=P6Sm6CAhg14IOI6xNRnu1fvmpg+jd/MRamGqIzKFC2j01ggDVmzBfpDpPWVq49Cq3q
         Uqb/nhqXW3Vihxa0/a6Unj+k9pqMtO35PWPBPzqxiAXA3SnMhhSZFY4HfXWQuU3lI6h/
         NJ83HZ8i/1PrEZSDcaNt58pRC0vDPyOw2A53xL0fEu1XBUn9N5RIOU5QP3hOd9tqYS3Y
         X/re1a48iqiVeWM5ejSoVMUkhfX5Lia5cwzu2RAp2FjBT5yql+n25+D0t4xm0M4hTroy
         nQwCEZRRGeIHimkszYIbCfF4ji5r38wck7aV2MXuEGRJDrF54/uygh6KMl0IhIz65Wt8
         aMlw==
X-Forwarded-Encrypted: i=1; AHgh+Rqzh8zhwTSamiF8JNf4IEUpMuLtUUAjeWAumae0y8bVvgXyHq9Aq9hidbU2x6FRak5jPfMRSglbvHIgUITI@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2H9yrNbn0efOMeXK8T0/nUggFQAMNJRfiSwtuuEzLCyYqXaf
	Pcaj9/chllNZp8Tr30k4pyVKOefCuzTlRpYjjFW1/ePcS/iIk/2NU0P9LiKUBjZPmttn8bVqv3p
	hJmVko6cLs9ds1tZGHil7HOMOJZ7Ej2QCFbti82NCw9o4atD2x2IcKmsPFQZPZLs6Qnf8Bjrbcb
	5VlPc=
X-Gm-Gg: AR+sD10dbBnXa55380AJ4a9PV/KFcc9tcTsJ1kG+UwJ6cjENPQ1WTnOZVkZi/A+P85z
	I310bvkQjeVBi6zjsl0Tej5vOdSyEVS6LjBceBTqJ1zPYwzOl9C6dXrf8jaAN3Jbc4ioWsRaqVm
	cbteaDk4m2ull4cXVvO/QE9gdQU+o2oCkL1W4Mop28B5PuGOeTyai8udCVvZejYPn9mHYwtpljf
	e+hLCe2KLRH/uKD3/M3Y+3vaqz7P2+jN7nrnwhOqK/1HIsSoI9HoqCQrFgEfAUrsGdkFYGBXuZP
	yk8Bu2VGp9n+zILwqPiljFwaw5o+z7Yf8bsU4O6WH/KBOfxs7EWTfI+qRgPsTBltIWvcO8Bd/cU
	Q2uc1VNIV2IuHCbLCYfrp0HIX/3ZNUP/gxbRIkS9BGlZDmtbLlsO8I7Z0Dner
X-Received: by 2002:a05:6a21:7002:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3c44afb5083mr7791384637.1.1784883422455;
        Fri, 24 Jul 2026 01:57:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:7002:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3c44afb5083mr7791366637.1.1784883422090;
        Fri, 24 Jul 2026 01:57:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm27742661eec.20.2026.07.24.01.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:57:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
Date: Fri, 24 Jul 2026 16:56:50 +0800
Message-ID: <20260724085650.224899-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NmC9NZElYVf93jGT3NdvUdBF3_nsjI5f
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a6328df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hLNpwyK-Jy1qmYTIU6kA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfX/lTWVu4OAhJY
 5oI2TeqLQUyil9gSCBQQkXcb4Xy71d5jcgioxdSCmaXheGHRgnaysjYMUkyQTAxaOE2vN7hjAP1
 SObuFJQZINcrPXgpSFSKcelheY177zRbHN6yhxgdzxaf7IIvODbKIPYteG184bQUbv8s1lbBTmE
 PjtB2VNBCiW642xoTwHWwDigoBbA/QzW9JwqpQFtmWJN69Cac68yc3TYI5QMaPDk8dTgbF9H5ha
 AbSYAMH3u6C7OzsGXguY1t9FCfbwyYQI2H+lQ1qlS2vodwjXthd1AgQgMED+6YuhP4O1MhsTzqz
 3bJFRfQIAt+IK73KJwzV1uNe8a6mAqZbQyUqpeOr5kB2ThrBOacFzx+0U5w2ubVosZl9HVJzLHV
 81ra4leCfAfMa1TDj7c4GaOmcMlHiuLfeDA7qz4JILF2r212Dq6zNEbb2sJU/ykEjmbpiMjVvLA
 piFMYzd1k6xBZoP7+UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfXykqGXY3aw5yS
 jpeHbT4h2ShR2cbMikYghvvuy/I0ARfYSUzMvTk1xu5PTnu9m8oxUWuSdsSYAct6Q9OpliB7Yer
 Ax2Hh2Yey9ZlmPTalKSIQU7LXCzYzOo=
X-Proofpoint-GUID: NmC9NZElYVf93jGT3NdvUdBF3_nsjI5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240081

Add compatible for Qualcomm Nord FastRPC which is compatible with
Kaanapali FastRPC.

As there are 4 CDSPs on Nord, add label for cdsp2 and cdsp3 as well.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add label for cdsp2 and cdsp3
- Link to v1: https://lore.kernel.org/all/20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..47e5976c8743 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,nord-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:
@@ -35,6 +36,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - cdsp2
+      - cdsp3
       - gdsp0
       - gdsp1
 
-- 
2.43.0

