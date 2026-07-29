Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B5F263F5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286866; cv=none; b=ASfkbEw3yoGrWNxGr0KPwA93LVQQnA/yuYVVnD1QKT1GxGBVMGx3pzYfCV5jmpojSrxfoDmkmq50WEEEuMRagh3g3YPiHw7ZlU5Ex5mHTmok4JHXqIhkCDmFO8+xuiX3VTLjZkrDOJet12+1/QnZj7FLR5nx8LPVMdlTzHt6zX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286866; c=relaxed/simple;
	bh=GTd16/5LR7XNZnDQCcaMeo1yw1gAoBboKZTi6y81/yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/P2+z/Lk4lm2k+gBUwG3a0wyTL/ZegU19xNqeo7wuB8NcrMGNSBXq0lqPYMbRNoOw84L+gBSJwxq3CW5h9W/b8z5/P6lOBGljLW/mhmmaMS74/t8ozfGCfa1zAmrIxAwslsHONh79IKsXdkZ7gfULy8QB+ljP9gknUyrOe4v2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmrIwqz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAweaeKq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmrIwqz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAweaeKq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL34Md3469141
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zRLhe6Ew0ky
	n8je1+jqha9isdj/ZMTagJJcLdZBH6Dg=; b=UmrIwqz9UNbATM8vL97MvgSbtQl
	nxyXTo8tLR18zyDrCuv8fZVt0Biu9JJ28kgL7pzC11raZPd3qQgzRERfMG2kWUr7
	uHMSdcrnRFTYZjucXdPoq0MeAqunWttoShHqrnhizAvvcaYPM/rvzuuyKNmD8NuW
	KG1R8hVZ8PlPlsB2o3J4RuTmLF/WVQXTu/cAs3VtaYCzr7Ezp0BdX8pba8FPFpZJ
	vo5cByZO0abSim4L+KsxlzUzjsmqEtoAYKXBcgwvqrNj3cp+9r0SyCwtAc26fHQK
	8I09nmBL7K8MkKkpUiwjQU2nld5ZoqkMS+3benwpfbs9ujDk3hg7MMstYbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hhst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:01:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so12529615ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286862; x=1785891662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRLhe6Ew0kyn8je1+jqha9isdj/ZMTagJJcLdZBH6Dg=;
        b=RAweaeKqsrazhglzPULsedL+1R11q4nZkFxWlWOCrn4+B7cRy9yTlAazkD6y7k9Jc5
         iXjS2XNY2VYW3/UdbsK93Mufn/7+jnw/7VU6d8WLULiMUc5+Gsa7mB0uCkSBZjRdarTI
         7AqbPHd18bd4pWJq5/fwR7+3Nf4BotRoQ1k6pa+vhLUEZH7tr49j3qyPrV9rN7zR/8Vw
         SjTWTo7p3lnk5RbBNt4flP8ybiGV9dipuBHiVUmpohhL3eGjdIe308//oatZW6H0rlv1
         2HO9XsRs9hEbj0xMymKtGSwT6UOs5ZJSQQOolkqGaQdmxr3H4ItBLxaDpFQquskvQN6D
         vzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286862; x=1785891662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRLhe6Ew0kyn8je1+jqha9isdj/ZMTagJJcLdZBH6Dg=;
        b=hmTDF2kVs0PuWp+mkTJp6XHhYWvjIhsMzb2N7uxG6BkbtslbvmVSGDWJpoPpbA3294
         xGLI6wWyKYOaB3XE78TCt7QEIiR+baZaqOpyryVc3ektQKHrXbS3jxia6b5yGuoEKwBs
         iHiSKaNDMpabx3XwsvbIrzlcddZDckJjlYWPSvmzFDwrSHtST+RgtIXq7kofLGQgqpcT
         kQdXZMe3MfC8yi+2R8kkw7pratPMkRLmGjvOKUXdHfiPIzv66CYNJNxGeAa3IToFvVZr
         swHkC5dcE1WxRViBEhJEcRM1ZPN9SyS6BCfPBSxSTAPf9rAqpfSMJTRWB5SQ0gyduLsl
         9ECQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ZPyH+oRSNIwsZZbJZzXg1v8lfbzJ/sPHJrr10t019JbtUxH5qnZTlG+i5nPaNKxuO72N1MmD+jg0iBy2@vger.kernel.org
X-Gm-Message-State: AOJu0YwBd5Gt59vMkSh9swFg0mFsR6mZRzLmip4spR/bVA+QaCNtklSC
	/wRhe6vPEW3JthKdSXIyZqRPMc3aZJ3IU00AkC3yl/APyfx+T4EbH3qE5kOMXpR6/YISW752STg
	tg0rSe6Ch5J1QgHSz1MbNHPEcSXec8byVyHByGTKvbnMDB4tNTDCIgcUSWeVODCM3Ax9h
X-Gm-Gg: AR+sD120zz0RIxpkNIhIo97TDv41adQI0AX0kspd94vlztrhszKXqNeqxAGKgoLw+/h
	Epi2pFVl9kEkMwuP5sBwAFmBHOcrG8RU8n7ESv/OoIW3gMXcOKoI+ZX0eT2wOcInX6gpn3jE5hV
	T/T3I+8YgH4FHrCZmUY6GTsMC+DT5zd+42KcY4EAZIXPfe7rn7bpDjtOAm3hrfcp6zrKXLCuywW
	O7Qpk7eFx8b8pFD2ZCxqGP2z+FLuN0ni6s+KEvkAG96F/NFGOJKmg1YOd8IbNr+tWSooQQDVJBy
	RyCavSXoScejzzWqFV18AgUdMrV6/vzmi45hoSUmSm9hK9A67P6No2GnTGkLnqzu0i8tQZyvvON
	3Hnq876EusqWjU0d4BumncCEwiKbM8mG0+41KopJ5TEAnXerWh7qDhVT4SUz+
X-Received: by 2002:a17:903:11c3:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d015f00e62mr48024085ad.22.1785286861713;
        Tue, 28 Jul 2026 18:01:01 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d015f00e62mr48023555ad.22.1785286861161;
        Tue, 28 Jul 2026 18:01:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm3456696eec.11.2026.07.28.18.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:01:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Wed, 29 Jul 2026 09:00:20 +0800
Message-ID: <20260729010022.875799-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX2h0hvnY24VJU
 v7vGmHENPZ2sDWTBCtiNQEnEwnsavbPqNvTRycJxMqkTgjibBHZkCrSvGCh1YJlJT6+1o4tTcQn
 duKfXFJvA71nl3jYILVk1cjhq7Z1tT1LL6zvMEBeGF6rkl+1y3GlkmqL2UJJWCa+mjhsROxQkFZ
 hmiI8UYxhlqHL+4qQCxcvwAKrQDmE3B1V5z7JG4Q/uIrYF8tNcxNqUGG0CkCh0XHSTroAg9SOlm
 JbV8H07zwQqJyAmm3Edrcbk43sjtFsa7H2Y9azycCJCAEf33cKoy8bWIQr5SWlyju9x6ZwUTqHD
 zSxOU2ffA92b+skg6uQLWrnVVU1/XxRY2q7wV3/Zf8m3iiX/2L5LN0mrT096TKr7nP8r911qr+6
 WmECKra20klbuhzxxo4Nxs8El0zJYYmVqmpvJodx0AaJK9uiV4E83kkf+GijJjYSlYNz5Ik7pkM
 a0QW0QFc24pBtKvD7NA==
X-Proofpoint-ORIG-GUID: UtKHXmXfmbw4dXi090Od-HdfiUwfBFxd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXyLfihj35u7PA
 sp+0wXAAD+N+BSDpCVEn1Wbj2EkWRVOZXLUbQbJHKsS7taaQxnOgn04LKcyB+yB19+06UuTCmWo
 hUhO0jEsNdd4FjMqVK+fY0AVtTJgxlU=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6950ce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: UtKHXmXfmbw4dXi090Od-HdfiUwfBFxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..f5f02c44a109 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -401,6 +401,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

