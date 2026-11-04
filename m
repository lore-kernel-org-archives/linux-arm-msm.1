Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808058;
	b=YEdH0L5xt2cLojxOnorYHH0FCCf52HOdQ7ZGr990rGZ7Ub25C5nQuBL16EKXCvQ7UOQ0
	 azmXVIbU9EncHaW1jKEWUi/0VMuHq2PWg0dEXvdxeOoVDZg5gDbxWMuT4ZGiJAMQO/gda
	 z31SKvTSdTd6KoxI9JWlm2LpIQZ5d2rxChbFRIJRpl1LxUPZIc5vIpJQj1iA4DA8bsZbq
	 E4tjO7CHdWTii+VXmPYVMc+Snk51TlUEAFF8Db1FkcJJsdVrJK03A/nZhYCjy2S1A013h
	 nn4/kEooYkLa5eCfR8dt9s4b7M0zXIHeOi9BFG5Y55hZEPPPCB2d2Ibtf6ATG6XuBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
	b=40drbs800gZVyiEOtO8sHnnuvyj93FlmdPskA+o0TihKakN/NuK8RY46goeUsxyO1WfI
	 zXS/7A50ugpUW8U99lZ8+TtW3w/VlNtFKTj0fxIx6CnIGu/rHBCT8wVEyBPOzrU7D6pm+
	 qpyui3JQImNSxrYTWRaDfuYn1cqlpwITFWVEo7AdO/kgqfXx8GGn7EbQ7OoYqqXn1IM8V
	 VjvhiAf7qNfaD+7YQEtr8ZTwo9Ali/QcG12bg8FaRjKn4PZaHMc6yLQngV6Yjjrn0Zwtu
	 FZoB6YU/bTP/K6k/t/gHUMf8pGUwF9lBM0vQmYr3fmPIeYiopfsoKWIXy2RsAVfAtog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B168B606A334
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B168B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjNFB3209027
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=; b=Z66ZL+Nq33OF21Nq
	hNQa6hnYbWiydHBV8apu90US4rEkmWHkMro9EHjfuIOLaXSa1VneqduSmkkVtnrj
	ZAzkcaF/pmZL0DQ94206yApfGmt6WD/9x0oZww8GNZ8PVnM8jSIbnC4MNtSGtb/S
	ikh4DTZ9lNWbSbxZ7tPm/0lDQakQakb3nOtTSiPzl4sSJcp55y6dFPXxZnAPUxgq
	+GRhCRe5SCq2PtBQsztmlJDozcmlrKRxWBL5DXuH8OOhBk2yiNm1Rn7Bho/fbSgK
	k5Ig9wpWqssmRqzpsLZtWFxIYp2W7jxiA0RvuHJopnkBYgjR/4R1BBrzengOLmjK
	58Wbkw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj0cru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:00:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1acbaf81bebso1225911c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808056; x=1794412856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=FQ3iSrt5l+Gly3d/s9mW+b8J/QfiDHs1jFqxOmZkrtWARbbKQ1T0Xz7T+uycQacBty
         aIrjXK4cBHHA9BWZeP4gNlWDu75x3tdQpOwlwIGRpsJyYgzQHdKBCJJ07LezdEBDvrpj
         3g/r+5/NiUc9S/Ir2Y3Gq4E7LACvBcU1vXkanjL9KKLJGMnPfT4uap4XR3HBAGSax4MU
         RPDgLGfv++tYx6WYn7+Zx7G2KTqaFWsoEiNh6qgRuZavTGx/5DAMZGfC/iZliSVwme/O
         7hEXx5nsz+IJib5oxjKKjwwnnCzSF3RtGQbxom7m57DoEozNMtE+Ks3xoRt6bFJmAtWw
         E2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808056; x=1794412856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=LkW7CPvvjVgMIYV9Erpn6A2a/cvwptOHZotrlJ6SoeJHHdUvxmxKDvnOBMbc4lnSY+
         KpxMyyTXlSrXjWeUeGKpXDwIyWjG3SNx/7nwwn7VhxN6RRFdkpfUSFYxySQ4GN+qCePM
         46dU69PN5XBneuOEPJqT9XPmzc7GrLuRRQaQi4ZYB01Fo6sSd54hofbzCcRNYnppzXDP
         0NVhIMnV5X3v1vy+/YMG+g6KGO/l2Jw0lEkepKeZAQl74TpwoDo2YszLpPr1cefk8bp5
         6Kf8eLIoe/gfKqKbL9aL8wcaADTwdQ2vcBicPUzeR9CFhwJew4jjhNRvzG7XERMUTsLq
         PiIA==
X-Forwarded-Encrypted: i=1; AKwUvBxIUsF2QF7eH/dUdAHsrj0aRfSeSAD0kVhwB0+9005E6TYZflERlQEdX8dOTcb8PdjviRR1M9wLTPbyumGL@vger.kernel.org
X-Gm-Message-State: APuU4Z9vJvx0iEGAeUXuc+G0p3p/R/TOH4N+3K4EAIc3rQBJueSvygv5
	HblOT83Izj7Do1WYYCFsosI2V2iHBZgfjTxDJxBe1lLhS/9dsFRxU9b332/FuJqZPXYm3EO3rvG
	5AmOzMoIJJDWtCZMmZdnPhC5ebUwy3BxpISpX+JHhc33/pAXaMn8lBJcT6au1z2wwdBZ0
X-Gm-Gg: AYBFou1nVFBy6nOWfcvNqwXepH7sUkhoF+hiJObCjIKg2/rZ6LQdBT7tFKK6jT6ChuP
	3uhMBbr5TRRFhUKP0dNU0D/N8Au1vWpVHx0DTbflyfYo3yxcxB/7w0cnICCZ3uHZR6Kbl2a9TrE
	QeU/HcfHahjbRhhOW31c2jtkwBBkFw7G6Ix5bhVfxaSnWX0/jrNgtcxcLFU0zQtq0poHcrNNbDy
	gel4TpOLXpj4S3135xzb0wrfTCOY80Yg7GagusZwGo58MW2ljor9yVHSHPL+KnoQ/V83VdgC18E
	xqlBCYgfVnBSBzeoCeGM8a0BTqUNIHah75cjLT0ilw1nmiovb+gqzZqBSqYPXIWI+UlLSerqYU4
	bizQEGHXtQo3g5urNapDpHXXw7ad0/to2EEtQRda5i5eRWviQ57mwiEGp336xhvuLKIvMD7HpDj
	c=
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241332c88.13.1793808055978;
        Wed, 04 Nov 2026 08:00:55 -0800 (PST)
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241268c88.13.1793808055141;
        Wed, 04 Nov 2026 08:00:55 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm10164081c88.22.2026.11.04.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:00:54 -0800 (PST)
Message-ID: <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:30:46 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX4QL7yM0WqTS6
 C7nt02JGWsrVC3BksXBhq6UxvnTGO0BQy70sReWPlI211FGqdyRKh7VmjD7LbTVFDCjGWGq1m7I
 1BqUSLD5xczFAQHuHEdjO5GSYCCsqofzbXGI4nYvQTey3ahx2OMIGbRP2Ppg3StmZ71JrB+ZeEj
 pOeIXZvkrvZqcmoK9MWUBzAhLzwir4MvZDDDizfyHN+nDQHPM1KqHbZqeC1Ixrz9xyVxsPR8p+Q
 AixTxqAL79kQqbTVuJDigTuvOIUOgATCck+KtIa6XpspXd5Su5X++CE/xoXLbb6GqPtp+6ar/xG
 aNqCJlSjnqJGRZ3n5cNiCZ0H196mU9dVhEKc+Kl95VfsiGSxy0amM8f1+NYVWTYNXth50Nwpu/H
 qwU8jXbdE3Zn6G/mu2nfQZ3Qv5X/gOoOII7uRT4nTTsyzUlTaqG8t8YBwDIxEYE+yzwWR+dNsYf
 TuqyLupblbykwoHTo4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX9Y0W5t/P8JAu
 FI7DQBMHQiUGs0zPTgYMlL2UJFkL7wTDuBpbsRdkrB/B/aqvv60yVuggJungSZk3dCnRN/lU0yN
 vs7Tu2fKtQvmGUan2VdRAojR9c4+Le8=
X-Proofpoint-ORIG-GUID: noXpKgWqB95e6u824b1cOC91j78gfRpB
X-Proofpoint-GUID: noXpKgWqB95e6u824b1cOC91j78gfRpB
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb56b8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bxh7C7Fz_n5UA06wMvIA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040063



On 04-11-2026 19:22, Krzysztof Kozlowski wrote:
>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>> where entry 3 carried CSIPHY id 4.
> You also remove port 2 without explanation.
> 
> 
>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>> and using port@4 for CSIPHY4.
> All this is confusing, why do you introduce gaps? What is the reason?
> Your datasheet naming does not matter.

Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
used a sparse pattern for those ports only.

That is confusing for the schema. I will allow the continuous range
port@0 through port@4 and keep the example limited to the populated
Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

