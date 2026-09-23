Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F3469852
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158665; cv=none; b=KR7vXiNVRfT86s796jSEXgZXXB5bgB1K78o9RHRItyOLwt/T3giRnbjkWrdjxn1AJcsMVyyatP5aZfsx9sTn2K8ZkSf0EYXcLO48Mad8znsvhbVs0jQd/OaWT9imDlrKt3065yK1rHjw9ns1VpmP8PHC3tB0SojHdrT78dbOGCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158665; c=relaxed/simple;
	bh=Cpd9CUfAbQydr+/IWp35YEM2rThT3kvF1eNAivlA27Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SV22RMVYSzLNflSJiDsLoJrbbrTkuwHDzVHSK2UnHOb4Y7oq9feJQ6A9eg1y478sU3oU1SPv0DAU133+ybkkzOeLSSuUiS4ySbE/cEeIxX4NMUuR6CvMpJFesoHck66twb4kjOuRS2H3UFXLH+XuhSBwyGDymdXxiqZVg7S0/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GstYEKl6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJtxbpgm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GstYEKl6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJtxbpgm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2v2M2821989
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CkYoHcJPz+rso7SJkc9SF8LO31/cRTOGFpw9v5udueA=; b=GstYEKl6e7NVVYY/
	vDZMKaqplJZJUpuhDcZFPcVsn98JNSCcXJQ+yzXcC10FA+aD2l0ljinl4rWoxBg7
	O9d6zz5P8w73JjZL9R7tTRFhsaWR/l6YJ/3IG+VbSnZGfkLsywJgCZ7bN9ViBndn
	ZLvYNQCH5iKZg3stQtfGkf1DO6Sdi7OJemNLgghkyHX1jhxDrWNQ79+GQROUveoz
	zGPWM4oMCuOUFWfLgHkBagUmP00kIcvSFQCOCdZQtUwkf3vVHNWxtzONGxuQjsQM
	0ARkpPe18yWd7vg7WN0EkPz5dRjjmND+jBLkgs1BGKC9DvY48Pf+bD0VYhJuD+Q9
	Gv39eQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwar9jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:17:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1096298eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158649; x=1790763449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkYoHcJPz+rso7SJkc9SF8LO31/cRTOGFpw9v5udueA=;
        b=UJtxbpgm0sGoX3tQ+7qZsdZXcxN+BixwiuLv5fNj7aLQj4AMhzBrh2KxZ1Y3N6I6Zd
         YTtBTO1atdqEK2SfZZTKTPdDSB6wxaYLVHVDA7c7y/BKNoDzPhUCPXSFMpp6bSomY+jw
         B5lVWIfYGC9RVyd9qFm2A2Ae9aQQOnKgk6l7nHmdEy34kk9dClOKsxlRgWO3e68xb+RS
         bBqxB7FHrpYaAsw+72vfkQvEnzhCIhV2cndmLaM80/QVfcd2zpZm7vGGacSGgEC74nlr
         tF2PQyM515AHRW2ohRyVuOd36YTN2tBXWbFICkchaXK23BhOFv/NM1JgHU9M54q5Dp+J
         cw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158649; x=1790763449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkYoHcJPz+rso7SJkc9SF8LO31/cRTOGFpw9v5udueA=;
        b=tLJAmgi4S3YZ9UNu9pLpr6pEynk2aiy8UIT00ceYLX8nsEbS/jht366ykEwn+KVrJN
         cYK3AcU1SznXa1ydt5XYdLFd6MN6ITRmbLP7nsjlJrVULSGdZJ3GaDuvGoWrTEwayQ/V
         4Cr/52uZN4ZU2VT+uLbFnTCpe+X1E/uy1wpLda7Olgx0b1J3HGbi7x9bT2MFyPy5Mogn
         h2V2RoCAOUB+LxqpPmLY2RL010AlIJ7lb7bReP/Nm3wftZ3LkDCSdpfrGvF9+v0ybUMk
         FnVVCZ+PW3l51wz0nfKImw38YzmeChYVzsLAbMV1+FUhO51AHE26K2M6V15ovWLkBxYg
         PGMg==
X-Forwarded-Encrypted: i=1; AKwUvBz//qpj5SAejURPWW0MwitvkZYgP6NaiXRjJuQ7XJmF4YqATmI8twhfptkgW3ZI0V9GkxYlm/QNSDOjoeRa@vger.kernel.org
X-Gm-Message-State: AFuF++m4wvMXsgQknL6GFcnNcYeyK2ZD40OAQsmeUCBFxMJ29p+PxpBV
	y12U8bbjinoDmG51bb3TIkFaoK3VKVFmYSzAwfhY3vhgmb0HftzUKe5eb6/bUHS0lEYAZUBWtj6
	FH12jryQJOp5Ddqnp0jRbBnhugqcWZDH6cU6bCv3xlS7FO6Ip8d9Qyow6riqsqUCXsu27
X-Gm-Gg: AYBFou14gtCPhL5gxNhXWi1sXKOmNxYp2u4AJuOIDw7HiXKqXMUs8S9crWKe+yCpTAy
	m3Uu0fLvz3YoBccvb4DpphuSpJ5ZpPxYM1u6tdjFnUtDq6mC8S8iCiBif7tsROil0rPz16UtLY4
	y8VKoe6uJHuyoFGHPmUpnh5Kla9fAuVt02BMa9v7GbG4vF30KmlbWX+wASyhMXIA4T1gXIcvNj2
	r8hU29cOnQUGQHxGcrtj4oJLSrt7wC7w03wmJNLgk6PxHc5Dkgn/iCx36657SEuUe5R3yT3i3Rz
	mO6z89Y5dG36STuqBGRUm+kCDXZu9bNzR9paiblehk5fMq0i2mY775vT/VhRHYEZ8/0ljKEs6Jr
	nrRgadfSb7nZLGRmHHYcdUUEeB8pH
X-Received: by 2002:a05:7300:b2a6:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-33e8e2b7ddfmr2231480eec.38.1790158648924;
        Wed, 23 Sep 2026 03:17:28 -0700 (PDT)
X-Received: by 2002:a05:7300:b2a6:b0:33b:afc9:caa9 with SMTP id 5a478bee46e88-33e8e2b7ddfmr2231455eec.38.1790158648295;
        Wed, 23 Sep 2026 03:17:28 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:27 -0700 (PDT)
Message-ID: <ee9c9173-96ac-4507-8b42-3cd12898bdbe@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
To: Lee Jones <lee@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>
 <20260922093327.GA2308615@google.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260922093327.GA2308615@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfXxUNzdGO9tR2o
 31ari6W9ttiitno6OGh2pDbj2XUrFkGEOLJqnwfaeAnXwaS6lxPxxw1tZzlcyCDXPSNsaoBQ3Me
 AwJxGr3bob+myXMm34+bFYqREvswvzOOBnzmlGPY7/t+UaoQOxxpzptVjNmNLjCnvIyfnyb2UQg
 s/vGqPOIGS2kZaspKKnMcaKaHk+3Q7bO0kh30kChUqzE5DjBL7wx8OJuNJlb0erFTNwdFfzU8rZ
 61KJWbyEDypyJrM3OuDSIEgAkLovZG1Ovz4iXt44YBFxdzLkI3l/eAktrWoj4Xstp6NgoCZ6nBP
 OKAlR1jRRme9wnLEE41Mq32byKwgA3XVAUpstgbRNlrxIcphGqEphiWTpeu/2X1AYsNowcI2eyt
 JUmi56/OB/86puUpTWOiPk8bdV/pPumqNcPXRZFWT0qnV1wGKu+xx5EYDu44HYjEJG8KjDgl7if
 DdnE0torUz9hwH/u5XA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3a73a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pTjQE-TItn96KZd9_6QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: UMI3aeAIQ5PNILzcelcn1izGT6fjvxvw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfXyqTyViRsk3th
 YRMH3dMBMSi13bn6j5TL50VSlMztd3zGNw+dCJYAvc+Jb9X5iQCSpFjA2A+SrTXfolHjFNiFC8M
 TFBJKka9mAkdm6LrWG/Q32fhoaZVKZU=
X-Proofpoint-ORIG-GUID: UMI3aeAIQ5PNILzcelcn1izGT6fjvxvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/22/2026 3:03 PM, Lee Jones wrote:
> On Mon, 07 Sep 2026, Nihal Kumar Gupta wrote:
> 
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> The PM8010 is a variant of the PM8008 PMIC with a slightly different
>> IRQ layout and MFD cells. Introduce per-variant match data (IRQ chip
>> descriptor and MFD cells) selected via the new "qcom,pm8010-i2c"
>> compatible string, and support probing without an interrupt line by
>> falling back to a reduced set of MFD cells when the client has no IRQ
>> assigned.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Who are all of these people?
> 
> Did they all work on this?  If so, where are their Co-developed-bys?
> 

Hi Lee,

I had split out the PM8010 support into a separate series, which you
have now commented on:
https://lore.kernel.org/all/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com/.

I missed mentioning it earlier in the mail threads on this series,
sorry about that.

I have fixed up the attributions in that series. I have also noted
your comments on this patch and I'll address them in the next version
of the above series.

>> ---
>>  drivers/mfd/qcom-pm8008.c | 140 ++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 112 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 60204cc9a2dc60cc1fe1b64030f5d803100e7874..28532cef7908ef3409a3dfc0779aae3b1a3885b9 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
>> @@ -34,6 +34,7 @@ enum {
>>  	PM8008_GPIO1,
>>  	PM8008_GPIO2,
>>  	PM8008_NUM_PERIPHS,
>> +	PM8010_NUM_PERIPHS = 2,

....

>>  
>>  static const struct mfd_cell pm8008_cells[] = {
>>  	MFD_CELL_NAME("pm8008-regulator"),
>> -	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>> +	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
> 
> Why is this cell being renamed from 'qpnp-temp-alarm' to 'spmi-temp-alarm'?
> There is no mention of this change in the commit log, and if intentional, it
> should be submitted in its own separate patch.

This was incorrect, it is not done in the separate PM8010
series I have sent the most recently.

> 
>>  	MFD_CELL_NAME("pm8008-gpio"),
>>  };
>>  
>> +static const struct mfd_cell pm8010_cells[] = {
>> +	MFD_CELL_NAME("pm8010-regulator"),
>> +	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
>> +	MFD_CELL_NAME("pm8008-gpio"),
>> +};
>> +

...

>>  
>> +static const struct pm8008_match_data pm8008_data = {
>> +	.irq_chip_desc = &pm8008_irq_chip,
>> +	.mfd_cells = pm8008_cells,
>> +	.no_irq_mfd_cells = pm8008_no_irq_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
>> +	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells),
>> +};
>> +
>> +static const struct pm8008_match_data pm8010_data = {
>> +	.irq_chip_desc = &pm8010_irq_chip,
>> +	.mfd_cells = pm8010_cells,
>> +	.no_irq_mfd_cells = pm8010_no_irq_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
>> +	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells),
>> +};
>> +
>>  static const struct of_device_id pm8008_match[] = {
>> -	{ .compatible = "qcom,pm8008", },
>> +	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
>> +	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
> 
> We do not allow data from one registration mechanism (MFD) to be piped through
> another (OF).  Please pass through an enum identifier instead and select the
> cells and IRQ chip in a 'switch()' statement?  Also, why does this compatible
> carry an '-i2c' suffix when the existing device is just "qcom,pm8008"?

Yes, I'll use this method here in the next patch series.

We use "qcom,pm8010-i2c" here instead of "qcom,pm8010" because
"qcom,pm8010" is already used for PM8010 over SPMI in
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml.

It is also mentioned in this patch in the latest series:
https://lore.kernel.org/all/20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com/.

Thanks,
Jishnu

> 
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, pm8008_match);
>>
>> -- 
>> 2.34.1
>>
> 

