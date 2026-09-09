Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80B556B99
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957665; cv=none; b=odny1Z/ZEL4HwWnxc2xT0fPRTNhJEb+/nbCyKfaxxqC6pQnZTTAlTIRBBclAOXIyGQtYe8I34tHIh/vmI9wBgt1GOsvxBUHNucD3BpTM1/nnAveq+RR8i1CLP6K0CZ0lae5JF59WHfh2AVr5P4vCvQCeQG3A1mvFN7HTJS9Ppyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957665; c=relaxed/simple;
	bh=mAOeGgqZpoUnhK7c+giQe4dLuI0lwdz7a/xuTj0ZKzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahuDfudk+1t6Pg31wrcg7YqQwmLTUDXkoN8nl6JJQ2kvMvvmfv7gxbe18iOqMMO9m1xl3D9YDTVhx9gElyEwsCoDOsddatKKCOhPTRPgagRc/fg8G/50I8C7s/TNvOHsvujWTzoLu/T3PXEMR729A9wJCiHoE9VqBiNUHq/vYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LacJz//s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLY2jeCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LacJz//s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLY2jeCx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAS4d1233043
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=; b=LacJz//sDXqP2tNh
	PVtbycauQJljKVumbNno70TXYqXz4wceJ3DRYT2lGjQYDZ5be+VlCaNwQ/OEY6JT
	gN4/TT7dRZFcgWOxQBGDbBSRSfue08PYq3WOanmZFmh3SH4LiyvE3J/56EmPfDc9
	tsraOV6nWxQuo+eFeRFDlc85WSKJx/UqZWNB9pevW/pNO8PuD6HxYRP8g7cvgTWq
	ccyLca6yDsoTZZ/xc7DfZha7DqfBAcS9RPCMDI6OkVyLSxQZtPxhuGzJwaCm552X
	tupdOFZ6w3tVMxHbc8T/tJIg+qx3/ENWyP4z20uTpmoyTa9nmNd5lDwu3+PtEWJ6
	CNnBJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vg34g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:41:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390890ae83so73761685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957662; x=1789562462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=;
        b=FLY2jeCx3Xc+7PzpjhUX2pgudsb1q7PxhJLmWXy+1iPfchjPm7jlHZnKJch08QF1Vm
         IvLp0qBcrknc3s76opdnIozA6kT1XSgoYRbgSbakLQEVV1hZ4ZZrgpApYXSCj21w71+f
         i11vBllsi5FgvfDiEjO/YilFWy5qF2YvveeI6nah12Wo/84/kWAIyKa7Ev+CkbaaCn+8
         uPdcPqlFkkK2EUAyivAV9nTPGDX6NPTX/DdOJ36fTEKljUCOEyXTW59cSePkj/adUmNj
         kVdQIDWRiax09aRRyZJsg/FDPt6cTIfm6RRHwtnUpor9AN5x7FE5VLB/lsEtLXX3cBzJ
         thGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957662; x=1789562462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=;
        b=P2OdGwr/4F3XXymY+idcykrQDh0DsyME12SOGa3A5A43ykqHii6zPJ/T6wciM8xG+y
         e8Lun27RVFV8S8QViVw9x9XK5blT+2ydAVQqn6i2DF+S6wrY6xNxxZJqc0vr1Jd2vFEG
         XCkawZN8hwpOO829lIjo6y1LU6MvAscXluqs2sDPNhOUN3zS3UciRguRcz6+tGSlhL1P
         ImRaCRDXhuk8leue3H8QjHQtSCafbBrW7S+RTCvziHya4qvjEcQsKFI4IFNdjGGd4llG
         pDDNi5WMYYx8I0SGI+rDkcqmTglkmHvnruQOed8ewiYGt+tg33C0B5NAKObyWkrBvDXG
         km8w==
X-Gm-Message-State: AFuF++mQAIX/OnfVqxlLfBgqpFeI9HOAKmiSHhV9rbG73FbZToWTiqxu
	48gkDQ2/ydcqpYwTJ/jE7T3GpfgO+pHVys0niYf1trCSoi2xz/ROKyw485hFpwpWLRV7wjRRcVa
	E5qd0OGDMWDor0NSDLqvuNriF3M9XYo2gs1DOys/SQZ9v1JXjeOS6VHLbtsVQNtRAx/sQ
X-Gm-Gg: AYBFou1tksusDCUTihTK3+Yl5duwnX+cslwHRtyt3r8kzvbwftnc4KYkVrmdQSh09c4
	g8p/df4ztoee2wmJ1iOjrA1gcuF1G1NbUlO+o9V/EWsjqNE0bAVzacioYaBvyGc0JkJHSa0ZuEr
	16WlWneU32DYy2AwgCsRHlK7oaaeEOqjBYnRlkMXM7zWQdCY+NhEW8xD3FD20Kb+iCQ/Wh1dOUj
	7Z6eMhG91HvW9+jck514XCw+chxFX/pDeOwhOeBWIfM9f2mV4s1bK/jkoKXfrEWZkqzsViiMj9J
	W3zK/UHDUV0125pAtHQym7KXzt3NbV67fFrG0k2mPRNJoJ650DqMLEilVVqa/7F5FQAoNdi2ziU
	sxFBXjL/cfO+tWeT7O0f2sQ==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr2540884385a.5.1788957661941;
        Wed, 09 Sep 2026 05:41:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr2540880085a.5.1788957661423;
        Wed, 09 Sep 2026 05:41:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9863cb3d6sm1362285a12.0.2026.09.09.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:41:00 -0700 (PDT)
Message-ID: <b02e141b-8e7f-4904-b9f5-0a9cd0ecd377@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa153de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f-AdFH0jOpSPBr_pIgEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4BBKPdX5KN-N_EvxMJm1GB0HH_NJTsMV
X-Proofpoint-GUID: 4BBKPdX5KN-N_EvxMJm1GB0HH_NJTsMV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX1A0pMNPtjS4W
 IlnZStn58BYHLzjZfZzSZt1VEkXYz2V7u7TVg1UsLUtil9E0xqbv7f3j2GWiCl8auSpjsRNVQcR
 Vmdlu+uUWln1pFvmRVrgrmJZnhY7AiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX93aQKyacIbim
 NvPJjt+gBisGPPeKy1LNPobHeI64kPJmV1cPFPesgqKV5SJsgw03cxLjXzWx7PUPPuWjilnwki+
 BhY6vswbTOcqUX4ANbK5bluwuW4r5CoLv5/XVy/R/iA71OES78jlNveMvV8tpmRdZiPWcP5S/Pp
 nRl12JnBWaaP9d803ayyJxjvvKlw6vHSGxWiWpGO041u3m6EmI4UhCqA1LYSjpjZAFHmgAJx6fX
 E1Jt38lBtROh8kmKJplAVp9sZl3lWjQB3jVsRGo6edcMuUbJD+m1H62sLDo3aUtgc9q043X963/
 Tosbznvq91k6bEsahbSMNHHgflfBgcmdMom4TDe7Zr+q9urZ5cb+vRJm4z5nLox8PpGKYn8rCfJ
 FrIwf3sDxFme6yLRr8TTYZXBDK5iwrY9PUIPL+pqaBR8Bqavvw74D3RJep4EpkivaHMT0CGs+y3
 l2WPX3afJ0hsQDGLDAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

this somehow escaped:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
