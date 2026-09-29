Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2384611CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697226; cv=none; b=I4lRejgiT5ax1WlpX45v5Hc8SMshmCWAG8rxC+2WRaAHwSlkOxz4BDk9rYMQZcfZs9/nM7lLK/mt8a1YvUdMtjoCqkt8dexa4/dgvrImo7aMdnixT3W09AEiO2hMqmlaBVppQXDY61noPxG/JhSNXCAsa5hhwSQOW3AQC4esOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697226; c=relaxed/simple;
	bh=aCGu4rJVd2imi2iJu4bW4ciGlLqiifTFBTblwp/3xf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzqrOPs42VJ9A9WEAt7aTKegwPzqK7d2kEJmsOAaaKnrLKm3zrecwE9gajDu+eHTk9J67dGZA8Uh9xknbliC9i+WveBlJqsdHVN7pwUNu/G/kvDnghKdUapqaT3JyHPEgwnR37RjbauCQxMIW/efF6OgFvGQquMqm6ZU+BnX06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVFgEsyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AneswNDg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVFgEsyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AneswNDg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeMX1016868
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPap05k5rCa
	kTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=; b=hVFgEsyMXxHhpc2716CBHaFWYZx
	1QSm20i3h0+wrARETA9qImRe37/V0KjS1I/AC+7MkTD2xHMVtbVt/BxWrxCAx/9A
	jfebCOd/kfTWjhlE59suVWFJdFbIPHUBLS5tVqiamW862r80+4Cn/HLDBg5xbR0E
	QQyk+/O/ZH1tI3N+mWVNzOC+OlKUgoP9Bz96MafJ3QSDfeZGK9nvzMsJVldWVMTX
	niCr9bBvnd1yUJK3DLqC9+H2RO2p10c6Gp8DWG+n1EQq7tk1O/W4QuEMOnWjVKJD
	mavl6pwjPCLBPHMKo9TMD9BUE4r7LSBHb/mtCyhLpeOp3V+d7ATsR46orAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxjwpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34316295d86so7434304eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697223; x=1791302023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPap05k5rCakTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=;
        b=AneswNDgy5oJi/aAy65ZJs7GfJcOYR2YETgw8k3nrpXJKu5BqpCD7bItaZU56onkvg
         WqWNWQFCO5pVY6/ygN1McSB7cqXbwJ4sITt1Mp5c2OLhmFHiGG9b+lm7AHIxeWtqrCbH
         wyhxzGW8ktwn1anSUAUSTAqUiBtBuLWAnsNMbeaZnKUHf8BGAggRw6GM4pVGCPQ0bzos
         w25kfa6PcC8UiQNhFG7kglJfLp+Wt5k+7l52Hs6xDxa3GLLfn6Zonc7gJdnD2Ye6D9EP
         LB9Orfq7jpVTbl6s2Ytizltcb+omtq71DjDVIMjnIhHW9T11iZfXWicldpGYt9a7sON7
         FwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697223; x=1791302023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPap05k5rCakTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=;
        b=xMQjb7aBL4nYqiFeNZ8ifATcO78P9BhU28vTfwP+Vo5lfOa6iN7VR/LQQqPrW17agX
         6NPqlifV0fkCLjkKhVPVjsB8X2oE6kPwAPy9Pxf931ecdAAqksnH2KAaSY6nKb9paeJl
         lUQXyRCm5RkwimZc3YpkYCkq2cKS+FkF92fx3GnH0Ntkr4O7nP2oTzUzFIv6NNMtJFgz
         b8uISyx6iP9bF15Rn7/l0ovKWjpizW8qUzQJnAeWU0bZl+wj5eIL4XNzUmZ3HvvcKdwS
         BlkL8WCQX2AFxhpCS08HraO5DxHxVSMFXaIKCf0+KUBXH10UXRPc7X68ovfV03NRlcWg
         ooMA==
X-Forwarded-Encrypted: i=1; AKwUvBwhEJtmTeQh196NpKNc6Nm3KFy8Y+3kLgjeJxprqqdMzDDdjcCNjICajYMgyEmgkshfVVmoOn2zfqfBbg96@vger.kernel.org
X-Gm-Message-State: AFuF++kKQi5l4ObKw2OkrkeE+z5RVC8102OSwEYzNqhXk71CrUcQuUMz
	LYdLhM+/H8ezemtagmsBofqNH3aS3dF/+jqt2w6kRgy8a+I7J+WFMiyAMM45wLhgC2tIoh/vetD
	dz2o1U5Mx0c7IvyyOVsefSHoQCAO7QfuofLymP2q5VG2eP9AnzKvJw98hteXNbjaz/Qsx
X-Gm-Gg: AYBFou1BIbxPq6WmaPzXQxbk/eiCi6x8b5swJzn+jB0HjDahp2BeVIi/qizokYDlfif
	wDmKuXw9IxwgpwaNCT5dkpjA4KISc/cTGYOOAVNUCtvEtUOB/C1KagZ0wNMJARwgylneCPQE17N
	bP9BRqPdS4U+tgTmX72IvuSJ+otbJYf2JJyF7fKEmpiV7M5ujlTtqZDV+KSp68NRfYrY8qPIm55
	8mtLUz0XmJ6yrWjbpJ4htOWFKKicdp//7eOU+tvuGa7+OWrQU74apogw/LWlC0yMjevVLtooFIX
	UZKuat73UwXugAdtx9zQy7L9w4iw8zAUTrq92YdZhP2sy0vV3UOM09tIPFfGvqIVRM9M/U7Xe8j
	KGhY4p+hcE7GnNUBHgTprkO3K3wZK/ULA/kXFV6UghaFVq6dQfYuqmM0mG6U=
X-Received: by 2002:a05:7301:da86:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-34bd8dc5f3dmr1272436eec.24.1790697223263;
        Tue, 29 Sep 2026 08:53:43 -0700 (PDT)
X-Received: by 2002:a05:7301:da86:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-34bd8dc5f3dmr1272397eec.24.1790697222513;
        Tue, 29 Sep 2026 08:53:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:42 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/7] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Date: Tue, 29 Sep 2026 23:51:46 +0800
Message-ID: <20260929155152.1898666-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX5ymFzkte8xHU
 DGJ2v47dq8H+LeI5EdrqvB0vZGhDSEoHLFChGmTBr0DQ29Y1mWGuahYJip9v0YehJFveTyhw2pI
 hNKf0SGnHh/6STSPqm/taeatcymX/nM=
X-Proofpoint-GUID: 7wuyEUcXS3xccmy47APKfzVSeqklfLL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX9phS/hiDe6Uo
 YWNoaref9gdBJLcEM03tbxA/XuNz/8w+eGHehczFrB2D0AoGgDKb1TRYZRXvJMmyP87rRaFrl3o
 G2i8AqYUE1AWQph6P9kUkGIlTekIHDmVPMS0KAU/0LwsvTRCKy3hZibroxcvLuTLogrmGc2SUwa
 idotJdXDfF6nTPJsvLk9FOUmJnzrJPmJ9vyJ58/wnlkZpPb6MBmjPFV6FTsgbFfg7ZwRdTOtBLE
 51mbyP55VKOtttaQ5m3Xk2JyRhBs8Z+uZZPB6H5m0kJoc5cuSrTNASOFoWdHF5FyXY3ZKdu1U4O
 aCFa63BmjBw+tMkRAopyNHR3PbRZ0ZyeBy/imHFbozdtrHofNqOywK4Nypp+sdGH39JoMHYmLM9
 aQBIQ+texumivVNvF3quoWIkOiAQWhTTGY66ilFUcRBG/k69bpcMnhdJV066+9j/3EcIX/Req7S
 P5ARaUOx1upBU2QjTCg==
X-Proofpoint-ORIG-GUID: 7wuyEUcXS3xccmy47APKfzVSeqklfLL0
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbdf08 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YO0Qr2Knm37rpyWBINsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
RTC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 7497dc3ac5b2..78fa1d5ed028 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pmk8350-rtc
+      - items:
+          - const: qcom,pmm8654au-rtc
+          - const: qcom,pmk8350-rtc
       - items:
           - enum:
               - qcom,pm8018-rtc
-- 
2.43.0

