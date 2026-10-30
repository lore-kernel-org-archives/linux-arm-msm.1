Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341273;
	b=OoY8bv3T3QI5nqzait0RU2lEXWPRkR6wlZGZbfUxy4LFTeIGEcU/bhGGSp2AiZtgF46N
	 vlGLw24AfIC5AzN86gUweap8mvL+O9USoHqaBJsG/mmL6Ow8bbX0zddDjtwjYX0M9iYNG
	 c8672W23VHLWmeC7lTsWRbp3+RtftCWrVYwOMVBCT1HYgc+1W4doTvz6gpVT8WKZKdgWs
	 akZmDPCbOhoSjx4cE3QzVHiUHFCYB3Ndwk30wvSt3oXKibN5TslSMT4yAz3A8l7pv7pYZ
	 1oB9rLQxs43H05D8VnQZ1107guoIqb08bGOPflxo4hTbuGCKjStrTQwyIDaFHCDcZgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=dOCtSWf961115cmAxnHVjIXiMhkt1pekpclxy5fdbTzVQVtG6p0dOdIgj0SuAh8vwXud
	 P1onOD+1yHYs54JdE5WZAbTY6wW995ZKR9AW4bTLYzO7yCBgpBC43BHaYUWC/+9CMby+E
	 HKnmxwsuXybbTQdlUypJsLlyRKHaBF+JIet1CeNDtnHDaP+X3Efdm17vNotF0iO5DtyKq
	 t6jMTRSgH3jJN9XSATkAA64/fP9W9dWo/uqb1yHC/A7z+p3iRHZgvaeLjY1cUHb+xozfe
	 OO8h5Qy/8w4v6KEIWY92K5Ye9rDSSDehK2UHj2No6aY9F4MQXP4ss97NnFacZ0pfSiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdV5G4b3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D27606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D27606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdV5G4b3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7BZ725370
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=H3H46kX025o/8Kik
	Xy7yiyuTpz5wG0IzznxcSF7+VdlWJKXEDJZm/j9eQ4Z0H/d+WMDQeGW7WoFxRTNx
	Q1ssTF7U3PCPTqh0dCPHKXyzAIxhQa3YNfFu/P9il/b5KqF48+9TGGUzMkOi/IyP
	IzpriTfzJdJ6e5h6MlzNUwFLdTf+xoXIJeYLQfEo4nzyDcNV45KMYLGCLwUK1Lc0
	xlrGqsF5n4fYZjYql6o5JnyGuFs4ED1cVXdLCwAlaGXBZF0v7E0H+XhbbNL9P4DK
	ZI788tuSb4vUFSEjpRUCetJFuh1nf+3GRhViKJ5hmtcEAcIf/NrcXHfTx6oY3ulC
	9yPT1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phg5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:21:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso459239b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341272; x=1793946072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=GdV5G4b3VRO8hQbgSlPzFJEOmY4MIxcbUCNo5ur9n9fbQYrGzRVoqcqGR6ihsiKxgA
         RDCDMHX40af7FsOXqOPPMAS/cerUx8i4vFzZpCAVJ+YqSgQqwx2f3VRWvxpqMdAR52yy
         8YameAINb/uQSmycUQKTj/QBRKyuqVOr90KPE73vZcYLPjyZVLXaEf+rMEgPwPeXq9DX
         lJymtESt9hNsQjlbCG152n6SJSLh7SPjVvolQkJKeenR342y6PuTcySzv9IUYoJG3CAF
         TP4MIjuBN2qqaCzobBCKk1DB6jyivHM7jUp1AJRKY4wt2vuw6s3cjro5en9Q81wcmm5U
         oqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341272; x=1793946072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=s4Sd9M2qPxx1NNvrmvlCUnBkZqg9W9nqUi3XnrSCd1szDO4eld0DZUN51urS7yUzKr
         mJwfRYuz4vnGbJcMUhQiJ5NalYF2L37QlHSuvGMCMsPAIoeKLt9DDnDEOeCkuXQ9vCaA
         2ZCGCA4apxCcOC+SCVuHxTyQPkhnx3QUcztqEwe8LgiKiEB71ZVUabAut8Vy5AGNHpKV
         WL3295Mn/I8I0/19xZMkB/qVIhKugTCLoiubKLymhXisXg2KI/YYSr37L60CU/fQaN2R
         OCmJcIX5QmY7Qz+w4cD6q6vyTOoDNi3UNEu1Y2xolayeM/kL28lWc3bbW7CGdfE87lvH
         r4dQ==
X-Gm-Message-State: AFq9FYJA0jFFX5HlXmMqxiYbxVKU+Hot8iVOv9U31TbQs6HVpqNsLtq7
	Re0c0Mg0GZJNXhLsOZ1WJlIVBPqnjN+Ry1Ou41cQu5oeyT1JfLo89faIQHxzQhXkF6yggpyx11b
	6KZlgKQtUBj7gwnMrawWijEGWnYlrJlrTaZ48hW45OR0e4i0KWQCtNYaEjUZuaLeSnKEx
X-Gm-Gg: AYBFou35BlpRM7Cp1MF8l4E66n9kaC6VsZ9EvI5KuC4cldPJ9wamIRVb3BXjD1+/d46
	iyRTRzu9BG2x6PiU6m1dkkK4Cco8gEXWtepQPj/bfIqX7KxAqOkSv9A8LR8fiX4E1ZnBvW3aMx+
	FMlKZnBrWtibuB3iIjLHR2TMXUb8hhxJ9RYCWA+VfABYfm5/ITNiT9aRPaeqslDNLOBTD+zcstF
	iCsDXC2YUQOyeiuGHHXd3DYKwP8mNGmznjzEe5SQBTtdrtsgEiI+0IjVfiBz5K6mT28L0QQGQij
	24ZQbubM1/brvWYNQGc6KMjfgRaR58ERU2uFGy8mCBPTUc4an73LYeed2Y9elbabpPZjGfe4rhh
	8rpCybTTA70kAeHdkOSjn+nNhb9rBb55VV5Wq5yUtumTMq73k/Q5U0ZbBygAUlk49pqU=
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153271b3a.30.1793341271892;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153243b3a.30.1793341271451;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:49 +0530
Subject: [PATCH v3 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261030-pm8010_i2c_support-v3-1-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=mXOJR5NrzpA3/ALgI/vb3johzXuTH1aNfzirkBmWNV2Ur3MUeIOd0lkchHZs3pkIo2CRjYtwK
 uedTJ5um0QiDmPuJAOYi0VxrRZfDaR20B7vFCvjD3AHkklpe5qFLYmX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX5mNx+DsF8ep2
 4HaVSjpQ+rnTIyXmDXIMcjNAlK486oHNwaYxN+Pv89Eb390l0JQ9CGeppUxxwZMtlRS7u1TDTIo
 xnzc73wSdU76LBUa7k8mvV8dULCXKicNMNCLXKIuu55ckVKPKL1D1qFJife2dIf9TSbK5zv2DTv
 jJtYkqnD2pdSngcjIifDNL60lfx+FTxKliHQl/UPYCN1VA9880XRt7J6XFnj9FA9dgrkqWH2tq+
 gLHBQ0J3rAEofRUUB+HQvvSbSi7cSNfL3/CdKOAkPtWtwt46mppTtjWpGLLsDvbGx32KLFWeFLK
 l93iqUgwJ8QHmWMTEMeO3KmRMyMHFxIUKYdIbQNTlLb0d1L+SlkmcVTBQFsR5kh24TjmSWK472O
 RwLFNdxupl+6P+UIaKz5g4jVjXnxMBps0npQMFRiqUcPuzwT8hJl3zQKqmw3jhwOiPkh0xdacZv
 KB0SEqM+sB+Eazs+7fA==
X-Proofpoint-ORIG-GUID: v5h-pCYhEjwOJ_yw8Z8zF76y5TvmwKU5
X-Proofpoint-GUID: v5h-pCYhEjwOJ_yw8Z8zF76y5TvmwKU5
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae43758 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX4oirAmHTx8XU
 iDb5ea8Ni0EsUWkkj6dSjbXClrK0vuL/aIktW0DU06yzBNmwzpicqtdA0+uZIkQm3hTguZZsV+h
 Xqew0eeRIlSb8jt9W0Gk+Fw8HN9AztA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

