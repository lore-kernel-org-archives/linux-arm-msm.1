Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E253EC81F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509822; cv=none; b=q91z9hFlkRGIa4G/tdri/zGazrz7v3U5sq9QEyjG5EsMmtOND5LtMLNh9PkK8FzwQ6hUgaO0mz00TIb09heLwxh+p9x+Aug/gD9G6NxixDxQa8fszMbGYgJtJmUPxgVCORP8Z5VYS91sbdJtHmZGxz/8vqETw31FR0EON57J1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509822; c=relaxed/simple;
	bh=OOscVmyFqYUCiz7c4uQpWAZrR9i2yNKDHAWX7fX2a4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qo4sBC+qm7Q+PPFaSYp5Rx+EqzSwEG4cQSdcFUYNBHp/qyR4Um+qAXo5alDk7pTKZQYfPUsjhIKMyl+I9qAMLgi+YyPWDzxCtNAZ507PPyvgfYXrpeEoB7WOz0Tpqa3IJyOJtVk5Stn/1vbT2SibJMQTB4grMRKA4m/UavxJMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oqz1NrvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgHj9xYT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oqz1NrvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgHj9xYT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mnJc2351547
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 08:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=idakCR6eiUf
	MeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=; b=Oqz1NrvM8CFtnrXbaozAovGGKcl
	fjl6byuek6NZ8/BvMcZzMNR+flA5q8nvitiQnCHtKQn/b3uPDYPWIb1kbG5QoCX5
	kbV9I/x1sy/vvNhKsPb7Ncy2UPsspLnGi4D+e9fqKbeDmP/ia1egjdBiflUjZYBs
	I6eWEyErpfr9az5LvEPol4gmhKVfoFg20YEqrU9wCmMi+U7j+FI19CNygP5HfD3e
	ybskxA1vhcxp/Q+PQkRenPpe6blvKI0+gbZQvBKIk+VHNXXEdDuARjP5m7YO9iW/
	+TQVds1ws5ORlEFzkfFYHu9ROBNcQZt0HQXxqS1FWHee6R8c6BBj1Svjg5Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgv83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:16:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1371168a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509818; x=1789114618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idakCR6eiUfMeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=;
        b=JgHj9xYT6ciKUhpFt3OB0T8UyeHI03NAKJI1I3uvK/1rk+dM9q5zgv/Q/TUIdyz/3s
         jX0l2QNbg0esuYDTlctkO6hEfapztJnMGtZv3cHj5n8Vufxt9yharnwm84199vFbqred
         31VAQYsXbuvoWXVd6Fwu9mgTLghQByHZy0chnn2O8dLHlWw8NB2mzua9Ez4L5wVAhVsO
         qth5NWUoD+PEDZmR2EyP8zSjJJaYtfGtRmiNUYu9/fKXT4HaxEoD6JJUNhcoL1v5OgnK
         SAK37GvEVswPTO4QUZ/GlHJlonZ75Z7zuZcJfFp1FEOhVtA/jwo0cPpOnEnFqKdFPAed
         I+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509818; x=1789114618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idakCR6eiUfMeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=;
        b=lncTRDo7ujDRR4R6CoheuMKScGMJn2kIh8knOV269Y2fot39TBxsRKgSWiOADC7QSk
         DFe9UNjG2xoHxsFIUkBwydX+T02/5xN60v+3dQUre0S66Gyi+YLbqz9SrYCRFcZeb5Xe
         y9dKpP9DGFV8mT9THULqS7IVXQ8YUG6ORBP6I9UFREQJbdu0bb0p2SAOcGmO5r4cG4FF
         Zbm1CaXxo5FVbpy28fBHn7vMi6tjMStsXbO3cDKK9p9VcB6RYI9a6W5MMvuJFs15Hh6R
         MiR7SpabQYWkkKfUtVd9ADG7R+EoQONo2Exp6QnzZXgn84rivfgAmETWvJfuNO6uG1WE
         PIzg==
X-Forwarded-Encrypted: i=1; AKwUvBz1Y2i7qTKRMh0ceEhWlMpZZX/0KwOgAgiOgXMN9IPDDrzY+gPDmHfh1+bYWG4NVeHHYR2rlJLLyEbyVYBZ@vger.kernel.org
X-Gm-Message-State: AFuF++lmYfelT+dDpOFjzmISydIuRWOU9wzuycH7VN0VU6HwNqDoABR/
	Vu48PMwaur+vMOsXQ4wGje0W/MjOJesm/3OnbMTe+kqdex+jfSrFll4qKzsl7t2mxHq3Y3tJ+vz
	XXBKRVyEOs6rExv+AXVYLkn77BpJigiVVIZSd9W938sG0+qcRXcRwgXzzUK2pYFf30csW
X-Gm-Gg: AYBFou08209jQKUXGbZypJ+husVy+zIE+y1RS8v/r2Nbg2P63X+bLMriyzpoOh4OBUj
	o+LNNXCPu2U8HMpKYAyE6ktJ5lhTnsZCcRzROlOHWRgs70pdfQ7X4hqFKC2T5nM1nJ5tc6avPX7
	hBbAwLpEOJ4mYv9Slo5TGvNwzPXFXTaLfh5lOUklOlbT3DCEf0/YUfcp+qPu3ymw0F1c2TWt1dh
	dqLtVLWdYq6ScbAni05PbY2amVazkShbIVJPyd3rF7Qh9jr/Q1iImvzI1FeozNRBPCt/+OuRmZq
	MIGnIv7MqlUyCbJonB2ys3/Zk/uwCBI9Bt7kRf5Sux3YEv8G0HP3/KYZNBuIfpcVHFEKFl3kQ4S
	VUXZA5Z3S0e9VpEJnUSYpsAdcHRditx4UgwX5Uis6HoHGdR7EBKKiIYxMxaw/
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr6620248a91.9.1788509818158;
        Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr6620215a91.9.1788509817777;
        Fri, 04 Sep 2026 01:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Fri,  4 Sep 2026 16:16:18 +0800
Message-ID: <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a7e7b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2D4h3_R6Pk8q5fQxhhEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7rAgXagyxgZwOObN3S2y8YL3_l-39cME
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX6BNbYGcGQmyC
 TirtvDMMUfbw88T9tXrP0Nn8pxnVvjzLJTLqZqCqZKl8zr4yhIyp3vA1hj5UNfol0/IEEtfcsVO
 1lCU4byb+TZQDvcPXfctFAkgGGlhEyk=
X-Proofpoint-GUID: 7rAgXagyxgZwOObN3S2y8YL3_l-39cME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX/QFkrLcY7vnf
 dQqcrdwREZQ8tDOd16CSsX8kHOOerCYG5hbQDrVD0+s6DyDaw43Y6RfaURNTK0Ndd+i80lv2CZM
 iUEsks/VdPqojRpAej/qkqDOEd9isEZStj1Wi09XF9RHc1P1opPpmX7dNJAO6Pb1K6SPLbhJPlk
 x0EiU21uHrR7zGO3P+U+a/7q2zahip0u3o6ArTJgOKQnetDq4cY0gf8Qyu+zoixUyP32d/jgmZX
 ihyUWotju2tdGOElNy3DI4hNPe2ZDDZOynIAYE0Sgr9xHO8M7wF7Dvn7W+L6N/DxPEz4x3LhW2b
 5OP7DLD1mYIxkgInckS4hcMvDruRthE/3ZpAt84XrlXWPNrwS17LUB+MAbhIvanhHaSnQ82j2dH
 tYzILrSnBr7OhxlwTHBzGcT3PqdzXstwvW0zigaMgZjIO+KveRtZQDpw9KD45p1TWVEpXaPmIdP
 O748TIq1eQjaej02+BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040075

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
based on the Nord SoC. This is the Embedded variant of the automotive
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0759969b8aa8..7efd837b0fe3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -407,6 +407,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

