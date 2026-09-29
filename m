Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972D1DB95E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655360; cv=none; b=AJl6iz83UNCxtuICsMhVmlBIXBFjp5eYjTWb0y7yrMyIaSJviaTz+UEhajED/2p9L6oGf/GL49DcOi4h+FpQGxsbm7Ga3257a9Gz/V9jhdVKOnhhnwQduZjzt/3IOmkA0h8utN8l0gbIIDSX1act9q5CweG+50/AlOhcwZRG1v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655360; c=relaxed/simple;
	bh=xPpG7Ht31PP7qmVyQQxH5bdpFHDI7TkS/UKUoDv8FUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sUyCq0rEYMWmwZjpszZh17Tnur180UCdteCoDK89qsN2cU3vSGHzqglEqNA7kdE0lzC5MmS2fayDzQ1vTH0O12KM3vX8X1X4KyzMqMYkjp8dI0MEiPeTFP8DRKLS7WIiJ826G+dEffU4jRFw994tw5+RQ1M+VfylHGmSpYxIvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o82MHFja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZY3XcGCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o82MHFja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZY3XcGCL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Gm62126871
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6O4s8bzO/5prsxAdEX8Icl
	Dsu35BWAhvHWHYvFefPo4=; b=o82MHFjaudFOqs5/VGP2e9q7R6g7fW9RfodSTT
	RwhcFBLtK0SQqdHn65BBrVtw7xfPq/7btERXNeWpE+pbZF5I7kOa5mL6WeMPwnLW
	P+UfoeQBFxlqbR4sCb63olBKkRnXLUkUg41MkN3fuwMGmWGiHC/ZcFzv4CR0DIIo
	UCB+i9ywUHlVyBYvKncPNrtzwA959wBVZom/OvWQZQMGY5reONNTepLvFg86QcuE
	7hgPMCnxpf3Di9UTbCLgTuvGr/of38of9Dl/XRsQO+jYx7wydNH+AGQmMrymW2dP
	0hIwk5gqOxJDKS5qk95e+EBMgc5dZr2q1qp029/0+j07wJeQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn8pm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:15:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34344599f01so1701304eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790655358; x=1791260158; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6O4s8bzO/5prsxAdEX8IclDsu35BWAhvHWHYvFefPo4=;
        b=ZY3XcGCLLjt+GRzCxr+349iAnwq9teiSA5YzKVXRjwyF59WE6wcSw5104ricHhmzcj
         IVLuo/L6bhVfK4nn10u8zlCQ57D9Am6praKQwJ2fFog77CkLd07H49sUdAmWigWKzcs8
         YAZg9KhxRe/E28fPT2oCcAMGwwJ/nzcaB08OFD2jLm+DUp/c6n+6HK3SMGt4kNTYiDHi
         llWKBXqxrJEsH59Nf80WfSHfFgTYYZTr5ZoSDkJFM7pM1S6uDEeC5QUygf9ftTOKrOFx
         TRDPPnw3s9gjNJg/tHZYsDpdrZXOo+0NoYMUpXJ+4vOw68uSoupamjPS/eXdaXW/tUqG
         kWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655358; x=1791260158;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6O4s8bzO/5prsxAdEX8IclDsu35BWAhvHWHYvFefPo4=;
        b=ESewodu1sbVQFifnCeFWuqhkeY3Tymv0M1PH9F/4iskhZi56SYr8ZJOo7ZPrALnOoG
         0lA1yOuch9JYryJQiSwtyxrBr4nY5VFXugEBWNTGZs4vQvsYdW78BX7GTZ8FD2WgaDSy
         Q7KSJzGbue+U7FkYlU87MrDMzOM6B42TLwyJMSPQs7cY3JW9mkj/rjkdS4eK6d1J+ZaW
         c75e8VYdVa7hOR+L1NIegng9VwrSXV39Y6nQYGyfC/Y22ps7U2ERiYoPonkCi8jqHIqi
         Ni6MSaCL3yTdmbPBJoNA+wdNWC0V2d8B2F10P+8XjHvV04SkzcssVcZxcIEGidSrFbSr
         E66g==
X-Forwarded-Encrypted: i=1; AKwUvBwEEKYbBSRJEA4J46HYZ3W8zjz/dW2YUX/L+KnRlKOJDApyQhtbNkHis/FxJ1u4AjqltzkWc0l4zJjcCJai@vger.kernel.org
X-Gm-Message-State: AFq9FYK1wme9GSwsEE4L32Q2+BK2f/32jyjQ4GKPHVxnW4bxJC15+gOq
	JzTFOtfjwSc9a943BzMAWaOP9V1Pag8UWR3aiVAlxMg8tSmZ88eFkZKh0AyRHyxACoXBuwa7CkL
	nm8thSQIGbLSQpGa95nkA6D2Ycgbz1BnBOtEoPOaecfo0T+moZRaZcWPnMqp7bvci5E37
X-Gm-Gg: AYBFou2+9QXv8LB7WAkjKXPaMhg4ebLQp1FzyY5d0zvmVG7fLTOd8aIVo1f5rFzMZgg
	77NS4YWcjNfMP+fmedqFcXGPxWR418Mf2ezSiEwbQPgPybUmEDSaFbXC2kPsFRHljcDXrs6yy66
	JdmiXs4Tao7pYqv1Tfti8rIeoiDqJE6I4GdL+ByrxAX8lbop02iH1jZVyetTuUOVygtjXf5i0TA
	mZebwsqcv9s0JNqOwqcnsBkMmHFPGdVqrGqtVlEPVq8BzcwHPhoT3XEdxwDPLRdXZR61bwLQfrS
	dVSzzRhh5HxIJC0CHCV4DwiOunKkVQt5PlQMGjaqsYZpqrG06JJdCM5lnZ4fMJB27BIgLQ8l+eU
	aRtqOq2pc
X-Received: by 2002:a05:7301:1f15:b0:33b:5b1b:134c with SMTP id 5a478bee46e88-3427344e560mr16997524eec.38.1790655357776;
        Mon, 28 Sep 2026 21:15:57 -0700 (PDT)
X-Received: by 2002:a05:7301:1f15:b0:33b:5b1b:134c with SMTP id 5a478bee46e88-3427344e560mr16997475eec.38.1790655357012;
        Mon, 28 Sep 2026 21:15:57 -0700 (PDT)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm28551449eec.10.2026.09.28.21.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:15:56 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 09:45:18 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Remove cdsp compute-cb@9
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-shikra-dts-cdsp-compute-cb-fix-v1-1-90e4abb873d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFU7u2oC/yXNSw6DMAxF0a0gj7EE7kdKt1J1EBy3uAiI4oAqI
 fbetAzPG9y3gUlSMbhVGyRZ1XSeCtq6Au799BLUUAzU0LVx5NB6HZLHkA05WESex7hkQe7wqR9
 0FzlxIPKtP0OJxCRl/h/cH4dt6d7C+VeFff8CdR7U94IAAAA=
X-Change-ID: 20260929-shikra-dts-cdsp-compute-cb-fix-95e3cd22a1a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb3b7e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sLGmxFD53ptzy79x6P8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vBGHXaNX0b0-3tLKxPIKFc4See2vq8On
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNiBTYWx0ZWRfX9OMxObO/g1qt
 S76OWKEMQUMt95R+zL2gduRoqEYmAl4TcslDBqOkFztcKUmNcmXP362kadpPWxHvXj0KIUMadc6
 tpd6bwpEQQaubCGuVKEJLCJM5PlRrlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNiBTYWx0ZWRfXw87RJp/PTMe6
 b4uWabAU14NBKar50agr9H2/v3H4Kaa9+XqZ5223MGceNN4tGSDNv5u3WkWXbIxyjSsALh8ae3H
 d0Vl6ID0iZRY1e4Ba6RrscSWQajxPW9Ylpk/hO7YbUok94pwJ9ZCMXJ9MG+a0Zv7kzsMMm9ACPP
 1Qk04CnY3jbsuAgubSWYkF/fgrRHbS3Eqspua8AvG+ay3Mgpp7Tt8TufVst6WqhBi8cEBW8sAp7
 gw92RES8klIyQBAuAXzSuLElD4xqNOjQmXwqAl5x+wmYeZigzrDuSelt/xkmKK8NM4ciI03iVZN
 kS5mV4G9TuFXHfv8h64wC8r3icqjD4AYSvvu87ljpn3xn95qYfBPtt4mnlyRJLoEVtixUAPvuD9
 OEMOhjHnJZTCGhOrP5VBFrNpKyq2v7Orxzf3t0hTg1aNYjGqoeNMKT+/tTJ96cU8Qj8jWbdJjQj
 VcA01GwT333WUlJfLSg==
X-Proofpoint-ORIG-GUID: vBGHXaNX0b0-3tLKxPIKFc4See2vq8On
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290016

Remove the context bank compute-cb@9 as it is a secure context bank
used for secure use cases. Secure use case support is not currently
implemented upstream, and allowing other use cases to be offloaded
onto this context bank results in an SMMU fault.

Fixes: 8b6f81f7801a ("arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes")

Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931..65cc94b9a624 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1948,12 +1948,6 @@ compute-cb@6 {
 						reg = <6>;
 						iommus = <&apps_smmu 0x0206 0x0000>;
 					};
-
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x0209 0x0000>;
-					};
 				};
 			};
 		};

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260929-shikra-dts-cdsp-compute-cb-fix-95e3cd22a1a4

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

