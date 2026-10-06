Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9E3E0749
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282385; cv=none; b=Kn93Grc/Cd3ftWKT1ZcBleGswcdFMo6xsBFMfD4mT9S0PDaifzBh6GJPx/KaOc7nO0ICEGcnrjtmS+68W3GrVRzV6Kv5azGOVC8YFTuqb7oDVmtd6YdcM4BWuyI+L8i2HKJunGmPLUf1/FgkCrgzRo2GEuWsnwsRCuLw34atOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282385; c=relaxed/simple;
	bh=21xqetrbQeUgnBKfuZyNE1NQqFmoX5IIsY/ucR0d3Yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3kP3vAH69U2XmNHaZwRDwpXB5pGE43xFDkrZP9DFUsxxz8a2EoySS7z7Q/FFhKnu+G5Dy25mHbd37durqTFAr/DcHQQ7fdTig3keqod2IwGl2uxwX06hySlq4VAed64p17Cl1Qw2mFcngdvp8uwUUbhAas8MvEpZk7SYJnX2Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hE5fHE62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HO0cFe2d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hE5fHE62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HO0cFe2d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A5Z6S3716740
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 10:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khd4SWMiVisNAdlrl7UTiMFxLmDsEifcq/cNJK4NIZo=; b=hE5fHE62ncNuhWU2
	p8j4Y/eaKp9NNV5DX+gT5LYQKfymej5RuOjZNCy7YAx1XOn9+3kMH+hAT2C2ZgP4
	PHEVUjjyo3/xl4KQxXrQS7W3DB9F170Q765dH2DvVFxoBYnZrorywI0hhdcWEyWe
	jYDAMc8RVRcntb7lpPOiNhQPV+7hJ/rgYBU8pf5LSAdOStjy37/Xlbu3NYMj3RPB
	ZZi8dd4qe2I31Dd7x9NKU3ZihOXvckT7W+cwCMlUmEc2Cl/pNAQFsxiTqwbTVkkc
	nG6YIAe66M7cjElAhmXEJykS3swl3s3QDUHRS4kLRGDLNEeBrYrPt7iLpoXIOEva
	l0CbUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkukf83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 10:26:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8d1e91c9so50474735ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791282380; x=1791887180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khd4SWMiVisNAdlrl7UTiMFxLmDsEifcq/cNJK4NIZo=;
        b=HO0cFe2dgwZUKrPuMgrkotp9o7MgxkdZMfgFWT1JiVpTI1M7S6Ve9Z3BM13S6MYU0B
         HL7BhFhqpjcOjHuCtFcZ0wtNtNGBt4wg/eALn11EU6xLOHbbH9WSbkpNBtTilsUJCCuO
         dkajJbfOcHwDPoae5vZTmKC9dlBfMl2aTqI924Olr+YoZhPRZGU5xXZPdA7rwiEDY6Vi
         ghAZFS7km2rCgh6SinqpQWa7B8djp2cce4hp+U3zBu/8JBTmkwxjLhguRaNUoY2xQDEW
         pk2JM/+XypxBy92d8uBZMtzuuosdHwQwNm21PW19IQMdOlF5m0YkYLtJU8v/rhABzVUB
         //6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282380; x=1791887180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khd4SWMiVisNAdlrl7UTiMFxLmDsEifcq/cNJK4NIZo=;
        b=0arUXmDOvgwkZ7XnASZ/f8xu4MayiXA/RUAjuen8zjLkjrVxfC0EBgqqzOgp/s+fZq
         tZdaYx5eAVRKovbJqNZyft5V2ahgo7ypHq1So+NZaSMG2laf8QResAi91n/yUoDc10QB
         zq4a1xZVZjr+N3thveCVGUoNg+z+mCOcJgwqf4jcYmOmmAvsk/U3twSUIDIVRm4L3Kk+
         MfSx7DwjsqbJNp1+wvxHyvdLnd5/m4Kf70RKraNuYFjYkcKVyWRg0wT87uX9UR5yMLlq
         gRblFYcvUgQMV88ME3+C6rEfBy2G60feaC5K/wnXwudCFvxYtw9+OPr6VY+nlchJEZM+
         +qnA==
X-Forwarded-Encrypted: i=1; AKwUvBwfjW7bSjkltM7zLw9exuU1AjksdsBN1ubq45PXUZ6BEV9kP4/HRZTm99nE7GEgDf4ZrV5Rd1eoMKzzOtfJ@vger.kernel.org
X-Gm-Message-State: AFq9FYI/SXTHKk2/WCwdyZ8ncGqwipGf2zdQijtPHZj0r3U6kZVMpG0o
	jiiCMmy6OXpbHtaqpUbR1aSCNFr87DRV40RgT6YLQ21T5JG+0yeb4xZfAMNqnDqIWfboWEXpcHZ
	47gG0G44yYnrzqwZX//rev9XuMmVkV/5gC9a+SBtOUk1aI+p6XDw+K4WNJOglCbiUc615vbARck
	O9qPk=
X-Gm-Gg: AYBFou02x6HyYBMKTwoZEjE4uSMGSHA0x5/KHIoQhGVk0X7Q+VQoORHMuHiihk5IO1B
	ec4cKkBfAfRD/Sq2KYvHF01ckpQqBdbukaNICXs3v2o/2/diocmDo2q7GI+qb6nzgrIKz6pec1g
	tHZp5HaoilXMDFpFkiBbKZzMlkT68m6uJxzLGCNdErn6WvvKrrqV1FqTEsTEkjibMzfwFeLQeBS
	kAI++8gP1IN6aiIsRSpIBcfRdYKTLKm8wVqcDHTKxJiFLPBAYKR4/NELFe2kDZ1fyCAMFrLEoD6
	12gIQFqzdIp3KcPmxtt88pprY46IR5mLMVjGbuqtPC1iSbgNOvsaStFnoaDxmCyDSmYzKbq4irm
	KFn+wW97TycCNbydkCj3nUSvsMiODWiE=
X-Received: by 2002:a17:90b:562f:b0:3a4:fe37:241a with SMTP id 98e67ed59e1d1-3a8737cff8dmr721849a91.66.1791282380507;
        Tue, 06 Oct 2026 03:26:20 -0700 (PDT)
X-Received: by 2002:a17:90b:562f:b0:3a4:fe37:241a with SMTP id 98e67ed59e1d1-3a8737cff8dmr721820a91.66.1791282380052;
        Tue, 06 Oct 2026 03:26:20 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm4088289a91.5.2026.10.06.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:26:19 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 15:56:06 +0530
Subject: [PATCH v3 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
In-Reply-To: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791282367; l=1204;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=21xqetrbQeUgnBKfuZyNE1NQqFmoX5IIsY/ucR0d3Yo=;
 b=CrUKDNdfF908aGpymN+DYfRNdfnYbgV0BGMX9u+YdojXL9vnwHahs5mixcI8pe3MaBmrVqJJm
 UhAxOAQ1/V2DkcGLQ8QBVxvX6ZQ2ZMTCOsQYZoRGwoWhooO1O1qaEze
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4cccd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C3F15k_13UMA7PaxDcEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: B9blodaXkcwwKuVcUpLHPr9H1FGJHLPq
X-Proofpoint-ORIG-GUID: B9blodaXkcwwKuVcUpLHPr9H1FGJHLPq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX5isbgq3MIhVF
 nZVHNpW87UTSmklU0Mv2TTnkf3nDhVvv1+OJaWKmu4ahVmZldiBKhMf5vOxDcJ+0fb6jSyXObPN
 LI5n5zQJ5yqs2FArpzLilUnbNsoeDmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX646D+tLC8qCJ
 whs0MxpH6/LKhffnBYYzKbpvqH/lB/7sAq7m7mBPcd0HBHpVZnne3CoyZion6BUeAxElfuLsjqm
 zGV9o+M0+sJWiXXMSd0eveh/N5OyPmdFJdVRcPIp4lIBcA3OWaMCiiuAhs+li5dnZh7hQPr0HXQ
 RXgUAYGus10YIEAMY/sU/e9pY5ECKf2OO6laO/TCzyIOScxO7OZbDrCtEPIBQedM/yy2jOJx8RL
 cyG00HmoCdSSUhVum+2ZlxYA03tPIvVrkWPMTGDiRp9rbriuCB2lnt+YQCj2/Bvx6OZ4tHtPpyU
 DwEBIToe7+RCy5wIR7DLDFzTrB5SgGHpO+3LjQBSx3oJuVRd3S9RXh2/Glefy2ur3P3s6x6L6y4
 pnGlz6TT4f9qfYEgJXJvUukODAR812qT2SuPN6ZwG9P6YGA1a3DrXCmT/efUHorgozutrEOVrL2
 8lcjiR3zOynskfKSMOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060041

The patternProperties key for compute-cb subnodes used [0-9]* which
only matches decimal digits. However, per DTS convention, node unit
addresses must be the lowercase hexadecimal representation of the reg
value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
respectively, which are not matched by the current pattern.

Extend the pattern to [0-9a-f]* to allow lowercase hex digits, making
it consistent with DTS unit address conventions.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..14fed91fee50 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -79,7 +79,7 @@ properties:
     const: 0
 
 patternProperties:
-  "(compute-)?cb@[0-9]*$":
+  "(compute-)?cb@[0-9a-f]*$":
     type: object
 
     description: >

-- 
2.34.1

