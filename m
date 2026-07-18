Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EE837DE99
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376393; cv=none; b=boYErLttgB5VaKD3RReU5HlEwWCzD+qgQWtrIeHQIBe/R3/68EpGWrQnfM/LinqU1gZYMKNWtxR3P+dXbjIuWZifLEwSnvHyi6QDgdXkqz6VZBwi4iraWgHXFIc62+Hf2AFm9uN29yhvK2xxpUP3ERL3Go4dUEC23auwykrZx8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376393; c=relaxed/simple;
	bh=gLdRfE2XgM5Qeq7CPxLflQL0jRjGrUxewQX4ANsoz5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CioL+bAZmPE1YREOlGVPj00w+Olokat0sN1gWRN00+sJUKYYJwUM2vcMM9MH80o6FixO23NIURvD8bQlzr19tomX8rRlkw6HZJiWB2tTvDFIFKjK3NuQlNDESkQnJlJ2sksjE1nKQcYSADdbctU/XNwzjOmrP71lKiqu2CxdEbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdcX0Fg1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3oEf8m7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdcX0Fg1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3oEf8m7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHAH21489957
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHfarHg/JbolBLcLFLPYXd9h4HjgHcO+ac0HqAdCJVc=; b=mdcX0Fg1F5ELE2dP
	bcOMzoeGBTZr0Uiquk+iG9i7q8cn8DR1oZ0zEbg6VdtwTZuCBCVImVtnqonEElW+
	ITaklble1z7v9Gk5WxU2oKphi7FwQCSRQoGzgYAl4bYKV7mJu4trQdRZnMzQ13k4
	I+xLmipm/1KTIQRW+elsOm5mQGqsbEJBBYyWSAcvVCvihyS1Do2rOPxEmubJfNOO
	pnDtS607jNcYnpBwfkGzaMQAN7dXKtLRbh/gpXf9Up9lmA/66JjJR6Y9yi3NhIsf
	vba3YZTtfAtG5Bvl3t3lg0egRcWJNPeOBDaUKgbgRc74kg/BspkL3MjlkEcfnWB9
	VzJasg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aarq0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so12167068a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376387; x=1784981187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHfarHg/JbolBLcLFLPYXd9h4HjgHcO+ac0HqAdCJVc=;
        b=R3oEf8m75FXX0fBm+YvfrSpzCyrBrM58nCtzQhHQj4uRMy01iqQEDZHiSnRyo2h/j7
         PemayjwdACY0sjC2CianRFr0X/3b3FCLduh1PbuIqC/h/lSw/hgB49oTki5mE0tzlT6y
         pzS5ZIdjR/Hh+/wBNkdIf24CB/u52lba/jXzQpmFKfDE8sRg84VfzefSOAcIwGPCrro3
         I61iXx5OYiSpUvXbgpL45qlMSaA0vb6oR4O6YuOasxdV1VQq1n+AYpurPjgAX+FayfdM
         gD43j/2zgXr5rI3iZ9nHTSdMZXTeamTsFKUhG/EhzrgXdt2c3a4NWD31Lq2pICbLBInF
         iyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376387; x=1784981187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHfarHg/JbolBLcLFLPYXd9h4HjgHcO+ac0HqAdCJVc=;
        b=Ifp8inefqlOArbYOz4h/Nai3bL+wUuO9sNYSapomwKrCebGCDsnhpNCCpt2T4wQTAJ
         vY1zue60BYiMJ0T1YCn7cfqUEsmbomkA295SKkpwvN2HwIO8waaEzTzLVBContzrgC3P
         zf8TxM/UYxGPBCLRRyHmzTiPnd6oXtapIUYauba1/Z1YIlp3Z4dkrL3XMQkIs2INzR2t
         1hGUtbdElrjuBgSAly8VmcOqciqtmBr28OInh1ysu7ELZlxhyXcyCDTYxug48kQ/kXAn
         SecdYTO4Z7jC5wZWz47w6bODpOgrHPjxAELikLki7QzOXqAZU76zxSAttPHIPJHhQYla
         tJFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmFmZbnfOEoMRafGoRdxkU1v32hUcTloZ02Hs9+ym8g1a5JVF76Tlo9BEt+GhPWbJon3kLuuDzwbRzJ83C@vger.kernel.org
X-Gm-Message-State: AOJu0YygwjMGtzfT6ymc5Tm/IErq8YXZkSvClETPddo472V20Q3pu59Q
	XDbbusPjRqK0AyaVK0rlGmfKT85ghrSS6YVMHWlIrz0qzaKt3jTQTc3Gt+3jb6XCcrfduxpvfYJ
	hLsfim1eGd5Hu9rIQfX5ShybMGhb9YIFbZ4AM1xuBmtR3hDc1/1WSISjySDEF5HgGNq1h
X-Gm-Gg: AfdE7cmBp5KXj0ft9yyEfzwKDepJRUrsuil1uV7cMGc6EG9I9pGy7L0CHPVYTs1ZkyX
	TMvzDxxmTW5jKDg5m4M/6WNc2vMrAOgfouuqzqsWjyqEMoDuf98wmriL5e+I23zkQHGdqj3Psfr
	ZPHUoBnJhpEEaLRSWlL9qeTnEvkxcl60tyoJp1ByA0QpoAJKUOy6I+FdK+TvK2t0XoaQMDbIdfC
	xNiVba3GPH2O2VIf07YXvdAeWzs412p+ONTrVyqDEKManmoTxQVQKsIzLRcIJhZHcdvlTSsc0nG
	kMSA9zDpVpLOsGA2FNBPnvYN9dXTCJabU/ESAHRiDqRGymSDtXPas4akI3oWQCeRX65fYCXYydr
	8hkqJ2tRAx/HpnKd5R9M4sUW02ACiUbFCTfeVqRHm9hf6l9QHCNF/0TwV9nXBaNgT
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr6742264a91.30.1784376386789;
        Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr6742218a91.30.1784376386241;
        Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:21 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-1-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=969;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=gLdRfE2XgM5Qeq7CPxLflQL0jRjGrUxewQX4ANsoz5U=;
 b=eEJFFhE7ccnlVUtCwj9LgbMDgBuk+fJ5bZHBsY6knHftqdfFK+o0Y7Fn/XeGOM1G4rmxU6eaq
 F3jpVRHROjvCpIdYkBjahLNb13vlyJKBIdgYcuV/iRbI7LrU3Nj7kod
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: yURqLhIIz6fRQ3nbYPuVKs4i-FCZsBx_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfXzmdvN+kR3QYr
 whDzJco4tKHfTVaAyMmBQEtsrvuHXJUqwDY/37x5PM/Ao+bG7oCPquQfrIBQvxc1RWmvAnNh6JG
 HNDe+GPej6oVjNoMabhaztucTB9inpI=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5b6c43 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M1bJAJ5Vo8V7ou8my7IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yURqLhIIz6fRQ3nbYPuVKs4i-FCZsBx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfXxk3s/wIQVBer
 lw1WavMVXQK+jX08HOjXOx92/rVVmIK2WpzWiIqxsmxnGhiGAfzl4bfKyCg4QnZiFygbxFCgbUc
 ZOTCM0WsGmBPSLBMIMcZME7rAy+KjXq7yPkjC00fdAxAz/ZkPIpXQAkNijkBXqQgdBXnSpUyWEH
 dA2ocSCjwf9jGB4bXfoXbfqps4cbO6/PEuYk7RmyvCxSrOEI98Um6tV0Li/5B8he1yeBWsr1+E9
 mV8yo9m5uqGEpQIQBfQoUxx+WlJEb9gNkr6k1b3GhUfOYyA2RkR8MzVlsigRMU1xVsgDNCT/K/g
 68n6OnpUZL5eWK+eN13JX6VS/hq58cvOXp8wMkIpaN1QrlAgT9nsFc4EoDDYnbTG4oL+b2qHLp3
 5Me7gk+gJiboxJts2+5IB0rrEzfYf/1jRed8MZ76QZLobrqlGFPU07aIm5GYb+ThXEgsh2Lu47L
 eHtew57IJpZRDcANsBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180122

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

