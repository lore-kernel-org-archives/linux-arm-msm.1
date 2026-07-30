Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1DD3AAF75
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432672; cv=none; b=S/HEFgCOcBKpFy84oRRsVy1s9mq7t4FTyQtUgvkOkNi12ca9jLHrsF6lLlzDDtV5wrRhZmEt6meIQCxBdaP6i55bSzNxy8XN/b8j/KuX8XS9lqP2Vk8PiHBttMZVVEYtk0WELykgNYKsMZ3VHSs83YLKrjylzZmobYIsXjLcAwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432672; c=relaxed/simple;
	bh=YEhRspKmk2fUy+RPvDEPOr64bflmhy9F2cGGufot2CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdZIJaoXZSw2H5fgXuqRGk0L1Q4RMK3F3uwTCgya5bgfJATfj6cFJnWAtuFsR2czxfhOTUoRx7ht+4LlAfM62F1fvxcPSm7bDgm8VYYbl4PNlqDznazGpaRJAgP8Y2neAAnU3j+AW9rvNiKDOlMX5kS6mBaTDKbRiQuTKihvnMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baIZU6Kj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXPxZnwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baIZU6Kj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXPxZnwT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWegZ2556028
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFnMA05sdfilboCMIyalFubA+m0lk4001W5XVxuLqXE=; b=baIZU6Kj6/SFq2nD
	jsMEj/AB41Uit1RWfpt9a1GtmV01UC4vMUTf85yQ6AqdI4tZsyb7pWzkmkLt+oUO
	t4yqAyDauNYscsT9WvXzDyQgv30eIHlcGXsoABA0z4fgHq2QTlIJwrj/orT7V09Y
	wMwPMpT4FEKNiuI0w/MN30QUBO6pEwDZ+iSMntqtfa8A6B7Iy6nYkC7MRSx/XvB3
	niVT7tdf0z26fsBChB9qbtO1cFHD1JlwOTJUlljs1JL/P9kzeqeMXtPzgKpg0xrN
	x6wLiLa+FG/37spqYUnThSKse2uEtIIo7l4Hm97sp8WE9dmYDSnPskj8QhMn2smt
	P99gPw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr81695fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:31:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7386e55c63cso2717137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785432670; x=1786037470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFnMA05sdfilboCMIyalFubA+m0lk4001W5XVxuLqXE=;
        b=SXPxZnwTqYDnUTf4l9bO2df2p9rQwgkktLPdixtd2OzLqTlCstFO0nP+/oJX0p64Lh
         gYS46fqNI1DeHPKBV1s9sdyyqWK90Qf4Xtb6l1eymc/ZemkPymQDAfwB3zEGwKg8LT/w
         VldFFMqsKoJDWDcUzlpeEZLvTinYYGrJG6ZxYeR4ylfCCuMHNZP3NHgfiUfYf75b/fIw
         Y5PJ3iLM6jB+xUPdLKhgGMXLgM/dl/RUL/0tLvvreI14fIZcFd6MUTnrgBe/hKI0p70l
         TzC3tfaSjUnYPZs/wRUPPeMYkKzoO/nRzdauzYBYf7pYp04PeqyOrZ0C7BmkTuh4gT+E
         nfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785432670; x=1786037470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFnMA05sdfilboCMIyalFubA+m0lk4001W5XVxuLqXE=;
        b=lDGr2+tO7QbWajZJZw9MyBUjo2H2UU7Na+06M5Ox9p/l1ZylQYMyCpBW/j5lsJbpSq
         Ht+Nc/QkTZsiQf3mLxurTWIjeQ/4JMWw1sHK6n/REzzNwHO2I1odf0wcxZwSR7usgPuZ
         C84qlPILt6A57ye0Q7uWlBm1Z2FklPZ9Yr71i27ckO5VUQwgHLv/A6IRP69rLmWlOgOJ
         7fvoWcNo0OOtrKbTkqXuvbwrz6vw+MiOlij/bDy7KHEHZqgaM4Hspm2xK32OiCd/Bto5
         pE7Lmg2OBIKSBquoULKralZRzQVWJz4cS08OWmhnFGW7Y7IsKg6Nr5Z/JwLZa2B/N3PR
         KbaA==
X-Gm-Message-State: AOJu0YzklodvRQHcuInlYMQU53OH0wb1QMfcQ6BEmhGDb38Rfs+B3TPT
	B0Iho9NVAcQ/lDhywQamRCaeEZ5GhSO5ZJ3BXIBSCsFIACB0MF41Bq/sgdUp4T9xHv1zbpj1OmG
	NvoG0pprHfOLlNbPXs2JfQJrl7UCga0N83YQgLUpowoV6SqMLzwpUOp8XORCObkxEm19/
X-Gm-Gg: AR+sD13F1W+ZKLZVzEiUYrm/RnG3bEstvbitO0nelYbXK4C7amA6DApdEhCmzWyBAaN
	0u0FPKdFYZ3HlBuNBETwH4k4X2Rx2UzB6uwbWbAmyAAJ3dkyh1zM4idIGxVEspXSdoRexTtfV83
	3DVs3LrBCL4zotLgp8VU6sMz4BbQ9RQvG2fqi1KE4EReRavie9/2fOS0Z57sQXD4bo18oGVULUq
	QUac1mG4bn1ESF1wKjouym5UGWobX0zkgFfzxZu7TIRBNfdUkcP8G/Uo+jN8NXG8fSKFrPyCAy9
	Yw9WyNG+PjZyATfu4FojMKsdRl3VaJ0BK8Pk0QQlEVz14qGi+4UY1eyndo4N2zjaphXmu1QUjMQ
	N21Vhy0O6a+fvN8iaS7NIimbo
X-Received: by 2002:a05:6102:809f:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75841ab4475mr697931137.4.1785432669713;
        Thu, 30 Jul 2026 10:31:09 -0700 (PDT)
X-Received: by 2002:a05:6102:809f:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75841ab4475mr697891137.4.1785432669235;
        Thu, 30 Jul 2026 10:31:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07ca71d8bsm859640a12.12.2026.07.30.10.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:31:07 -0700 (PDT)
Message-ID: <00e088fb-aa2f-4535-bdaa-7227eee1f96e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:31:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
 <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfX+2r0eV4UFuDA
 tOihldcGHZsfK9guTNS5CW9GCbamHibwH7bJB0ZQ6EqoDUCtR9Y6j/hSG/lEQeMw2CX+lRZtSck
 rI/XyzpQdilB673haKdGIYacIz+f2nUpUuc9U56d+VBZpZHoMUuI8RzOThbHuNJxBl8Wwq8Uhp2
 X9yCXyG5R6yNirYbfQz92HPw2m3qcOQuFz29BpFH8mAbwaLjAqaqv8LewJH7sKuGL6O9GRDS733
 x1wh8kOY0NSFrzw3OfasT1I+OzUSrdyJxDTtgtnf1xQ7S/87T7RtoeDi9moKJD8vvkottN7Ook5
 vlASJzHSmx5iYThbbxXmkkayxGzs82/7o3Kfmt/JFdSzbMuIVmRqIe4mC6kiPjn5vuN521OfS2n
 ZDyGTeEPs0odAoDVP0tbM25+cgGH/UlGcKOm+vdW1gQ8au137q6QJgjAPF1GguW+3Csf/7662pr
 wQb2NQ9+LvYtAes6nEQ==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b8a5e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=szv6kLBDWGZgRSy8YQcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: o4kqDLOL2AEu6uo-4R7VKWMRG7lb38w_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfXyXMD1ZHq6397
 VJ7B0Ml+SCqzUn2HPS6BgWGSkjwUCo394SbNFrQIVFKW28kQX48CRPQTbzVenUOKXH40cPwdCD8
 zrqPIJZFipkSJtR9FyQ1B5HV3i+5GVs=
X-Proofpoint-GUID: o4kqDLOL2AEu6uo-4R7VKWMRG7lb38w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300130

On 7/27/26 7:19 PM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> Add io-channels and io-channel-names properties to the
> temp_alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Remove die_temp channel of PMC8380_6 for Purwa devices as
> Purwa does not have this PMIC.

You removed it from the Purwa IoT SoM DTSI, but there's more:

$ rg purwa.dtsi arch -l
arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
arch/arm64/boot/dts/qcom/x1p42100-crd.dts
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts

with the deletions added there too:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
