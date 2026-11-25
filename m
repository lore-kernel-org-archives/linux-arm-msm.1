Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627131;
	b=DSxb53vk7h3v1kFM2jCjsThH23d2g7WCZWzRVrx67L9h+GQZhtbjLILSK7pgmHSzi7nf
	 U7Ux0j53QVt3xBz6KWde5G5nqdnyrIkGAi6+9avczc2E3tw8h+tRtjM+S2LC7XhMdUpTO
	 z5l0/50tiVq1r5pi5JvMqf9F9ZgD4YPTk1g1fHCIhBAi2AUloOaCFemAtcOvn/pjhPdtI
	 0ZKk/CONT+hps9k0eXI8NMNqwOUpuf5K97P918pDMUK4rw0caraPkxjMjrnrm216TfQc2
	 Llrg+ePPUopeePPE1QqMDCVDxyihTs/pIwLVdZmaqwR6mC37nGHkBTwRRxs4sgHhDaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
	b=BuzrSCAbxgs2EtoBjoCl5+RRuCiFueQVyKZ6t1Dv4g1v4mVjav4d/GuCJikX84qSKb5S
	 lBTYPlwi0cT27FJ0lFW8GZZ4jSbZnaVxD9Wi/OSxsI2WOOIHMYR1zCiPQCmA00pe+NB7d
	 3i4p1ZhWJBfy5UtNUgTOKICVepjCk4X9/x82j5FXxR1hx1a/mC2t/uyJR6FMTADNVKVNw
	 dutWWeW4hhJJR+k1vX45o2OJesETdqnXW8jHOMWxWL0lnM7g1Tk60Jnmt3VdrN4zBYCPe
	 QiVtIG5tn4avdiUujLqxkXElULjcvXox6SRGoJHFfVS7+uFN1td5wjFopo0luUDwC9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uve/tlz+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE1606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DE1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uve/tlz+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ5VD1670791
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kI6WO7B1bFo
	CDY489fGVqBNmwCW+vKG4+l+43lYDWrg=; b=G1iJMuxOVFwU03Cd0CtyNTtNVIH
	GTRSRWyKNl7IuxT2OK5K5n+6jgXAwFvdP9RT9duVZzFY7YFprSmMftEhjxWl1D0e
	bHK3RorB64CYeKdbV/d78QfLQcwMbwveuniTzA/5V2k2qHrjX4WJLmGKvtRBUpTK
	VCDliT2afRvLZdutIO+pqY20p0gZ4H/vG9sPagFmBWMZo6hOT8RFXp0ukcHUcVOE
	xXshzDI9Tvxg0RCS+HS5o04rSskTiHwyv5wgI+D9fRv4lgZEjK26KBYiAFWGqn/U
	1KYkRS9pTFbNfZLVWRInA1NEjZRKUsl9w6pXeUIP1/WQ3d1fx75Jd8Pz6MA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vara1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0f1c06332so90113717b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627129; x=1796231929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=Uve/tlz+e7/Akj6PafDIkIHMQMKEIvPJhbU8onSy7EXqgLO5cSRMDA1LT3jutHFVZB
         VwyakCw7D+cq/UzIciz8xEb644HEZ4h6b2HMgwffitTHq3USpdzejhc/5fQsleRH93Of
         qiaZHboixACMtuOi/Kq4r2ux6ND9uoBRc9Pj3A/mK+m4O24+zzcCcT3Fb8x8ZkUqNdbd
         wqXpOyX/zm0yTcGntOwk8BBveEAy0CABIht01DvdKCr3nWTtvDZfKszza8UYFWif4Jd9
         OUiwF5Asg6HFsUkrA94Ste2O84eSClrQ9bJNKX4VlJi7xLa/+ScFYZ2l8UzbKA+6Mxos
         pI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627129; x=1796231929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=vDEmD4tPNUwm26w+H0mhtdZsR8M0wyx9Cb21yEbhb/1p/73cA1W4HrYMie/RlsuBEG
         psEjpAPw6gBuUBhU5C09XxmNcSWAoAGvcjAU9F7ueQjm6wiCP8V2qfdyj2ZI+swkP2jQ
         zU9KizslzbozKzlEXHHaEC3DCxWVniczR6huzEE0zz+5QO63tQa+9WphcMBfLkuv+7Gq
         MRAqCUxNxhfanaJYFu0Yn8ZWT7k1PJJZiOAxKbDXCocwyuMZg4XdrcmnBec938F9hW0C
         YwSOfnM6UyGSgVjf6w6nD9jepU+fb3Du1wE/NVgRod3aLxNT1WuZ4R1DQc335KqbZQAx
         yVpA==
X-Forwarded-Encrypted: i=1; AL+hErExDM3GDKSgCGSryI2oD82lq1lsvYp8biotXRHjmvTdKEUjiK2QC4SLS2LmSYJ6tEA+MaR7brC7MrU8vnq8@vger.kernel.org
X-Gm-Message-State: APuU4Z8kUYFG3OFabwRAArR+vHe/saZT6WeYUn+cw+ks0hqIswb8EtYO
	3tIYObyd7FEtyk5Jy2rdJYcqIX78FsLPPOk/eA7wuN+KvDN6eNL529puThmd861FWcsXGHmqt/a
	d+XSB6AtLASaJFGsxOtDt9mXLBKhkCc9XkLBXWIioF1ce2jYTBeGiNkBbRHx/Vt9Po6R7
X-Gm-Gg: AZFdTZcDG13qHOD7B/ogH9imKWK9ZfL1hVxUcvL/82B9Et40uuaPsAj0qMy583LWih2
	BF4HbFTFXy/JAcncq1vKB89A9SLjzY6CvSeb3/4CiLqb2DfDzFqsh42EcE6gk1jVIfD6Adc5CXu
	r9e2qrI45Y0VDnCwlsTtQmAyi96fW2xibztNVSpJc1BObJcam1ZIinZ0StgS2UmACPwMev3bJTS
	skE77fzjmKvuLDopmpuRD6ZwDINLDHAIMQ2puquftAhIDIhi3cU8uxIpWas8uu8vq+C6ruvgDSH
	vL2w3/LvAFNhBe6DzOAiR5q03Hn2UDqDI2zM5IrroyBsv/aAZRai6Q7HNH1whqCPQtzZ32KVT0d
	+c/XxGv3s71TORLi52szXDqCIhzj6VAG46hXF/iScqK6/XB+cfFuDbCqdA/V+sBiN
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80938977b3.5.1795627129554;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80938827b3.5.1795627129010;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs
Date: Wed, 25 Nov 2026 17:18:31 +0000
Message-ID: <20261125171831.1458954-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX7fKg2eppHJyq
 n/dEBNoqwqTczWwbow255BHw0I8WQ4AZdSL7qlVQ+yiV1zapmkdW020hZvGazjaqMZG5cVGlCQi
 z3cWtZxHMA7DDyqEVamUHk8epnBgf44=
X-Proofpoint-ORIG-GUID: L0hYzrj11n7GKMSQdwM9ktIzxGkWuPFY
X-Proofpoint-GUID: L0hYzrj11n7GKMSQdwM9ktIzxGkWuPFY
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07187a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FrxuNgF20hPgSuSYAXgA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXzwg/0pv18Sxt
 N1DYty+OB6Fd0K3BTsIPqE73icy6hQctk3TG8roClv3gfeDLtlGeFr1YPNG3oYaZr+uihjGhtlw
 obTdkvy8s7n4WELp9wv8699ZHvXocscCIt4v8SP4AsHKjiNEShY6OmhCWBWX/Zv3Kqgl+JTy9gQ
 wSRhURljo0LnXfaBQVYmgwJZe8RZrmtwxrd6d4IoW1Gsrv/4KRXx0F5k4qsSI7dJfRvYDyxAgsG
 7HsUBLiyHS6SouYQKfBE928C5DMowjDK90zXJL+BTSihY7BpmSY5MfcxshZ/vIihtQ0OLux5gAI
 4zLr24Eqe6GmRdlz8V5ZTaQaRt5Z3doKOPmdxnDM217JZPtqEYfby9wCaTcJQIGmkLnCjIRXYqE
 wyHrh7bc2nHCDoYxk9a0xNpzR8TrmghcsEmvHfUjC+rBoPHrnbZpC1TOzjbmBSLU52S7vD/aesn
 qWzr7v0qYVqe9epOL7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

Add qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro to the
compatible enums for lpass-rx-macro and lpass-tx-macro bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5e1940fc3e9f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
+              - qcom,glymur-lpass-rx-macro
               - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..6f5648a973cd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
+              - qcom,glymur-lpass-tx-macro
               - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
-- 
2.53.0

