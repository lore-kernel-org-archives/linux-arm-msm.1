Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B864052C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386061; cv=none; b=ItNS44QUb3JLKxgDON67oIHo1qTVBQUp3PH0GAdyj239aFguVTiD4WuYDeklBA13wKWOCYs3k5hGskRESCHHZP0djsvZmGJaYudMcxgIXdQ3IY91fZumnxpeeqpeXNNGTsxed6ZZYOlhz9ZsGPMxGGDacZNAM5h4jv4JQ6JvKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386061; c=relaxed/simple;
	bh=fPc2czltw9PO/Xf3zDh+bJ2upY+FG2+DcJiTkmEwB3s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f1pk6FSVtZNjd5tLQizoLVwe4HNoEojZN49ZyGxBQZmlinGy5XwgUfgcuqRS4ko6xrYLFFxQLUvuRGWyX6l4tRx6Cg2Q3NADoMEKkyh4J2STTqUKQ9/uSXKdr3nQ00q1bzC6+PzGmmACNVqibtvM867Qlw62HymtUkTuJf67ICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BE5vuYZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMfDV8cX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BE5vuYZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMfDV8cX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jNQ62268152
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qL2Zs6vjc7Gn4trLCQtTm++ftscSxjKT6wlfuzXuyxs=; b=BE5vuYZp9+578OUg
	4olYecSTcy00I880W/6MPnF6PzX/655zaWMlJyBQQFMxptaZN0snb/CHv8dPbN5s
	vEE29SLXq9LAPO6h7cA2vN7hgOJs9vbpnYd6nGVwmYI0W0zSUg/xoI6qolcSWETv
	6Zr/toumtzKB9OJMW7sTq6m/rz7v8pdY+eva/WOu+T4GIuAIme1jBKeXFQbV0dAX
	P3loCcDg+THqw97DHVxa0aiOwoiocTi/zR9vf8bKIYxmmKvtuYmyrB6iBTVs4bDF
	GpRmRgyUex8ilZKAgjcgEwDW/2UFdgS1dNFo3q0GHWzhNH4ruf7jvP4AhJe6ZL5W
	rqOfKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxmyte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:00:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso330963a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386054; x=1792990854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qL2Zs6vjc7Gn4trLCQtTm++ftscSxjKT6wlfuzXuyxs=;
        b=dMfDV8cXuobO/Qu5xG9O9RqIMUtK3Oa6Gs6w0C0Yydj6xCOBSZf+3ASJNdfmfl4T1S
         nSNLhBvA6UlYaPkPpMq8XsCiVOBfM56NYX018IZ5YL9ZNzqqVVIzAHFJioPFHCkttoI9
         sVbgToWIWMiUf3Gj1vRukXUThTDQLjyv1SMUz1uZHqu2G2HPJGanFjECuOJz55sAy3Ch
         miSzPbBzDEkhlRyc/m+P/iTYE7smTOe47EGo//ARrHmeVQgvC03sfnzUX25dVocV8Q9b
         RhqDkUKNGEzxamv2zVjnFORIofUUazNRCi9Bey1mGd69d0UWeIN4ln5nwLfzzknabzoI
         7Mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386054; x=1792990854;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qL2Zs6vjc7Gn4trLCQtTm++ftscSxjKT6wlfuzXuyxs=;
        b=XeIIw4obpPSJIeTjy+nQCOgj6fGKdv64KmX8B9heXP39HGGuZum4d8gN2eWdTZZ0r0
         ZDWCYwCRnHbF/66vsvXfWMFYxkXzzCkNwStkeURKST0yxi//GubxzlXpjt0DQUSw+kAC
         TW8hTfhIS1uBSFdM4NAamVskj09d3r3HSBIfwGotOG7P+3P9qkifVbamVPH+Kfy8L0X4
         xGClqkT/PM6AAVxG1Q7kO3aBAS2yykvizcyspO0cxnbFhZgJkmhrxthFatlTE1o1Dmkk
         YiFUYc288Ukjqpz23IwbUxE3RNedzJRMfASioDGfN8b0oB32rBBXHGdZ4cq59xNfOaPV
         JbKA==
X-Gm-Message-State: AFq9FYJYYYcbv6Gb+BAGF9ziDEHpNk6ZJ06iwYFzyNn9tSweOlqomoQz
	4sjJ/wNID9caG61hiIgJDuXfw2/mn4GNKCfaSEETwhnZ+snvfE/g9fm4p2bIAJQRi7jRxjaLK6O
	ofQM2BC/LvkUEFgkGyT+3ku2mDb1kjy090OrrocsM5uleDF3xhzYf2NbLnPelrtPMojH5
X-Gm-Gg: AYBFou2RserxFacJXhKyCvytt4QWkSSm35L+TTpSwrdF+CQTB/MKPyFDrnLOkVuackL
	LUkj5Sd4zz1YvytUV05vcfQ6ZRjay7YdI0if80XBrHBCD9/VGfb2wWgViXVIBBy3jigD2WTA+n+
	1oo6jlsEpAVqXLfOlmDRr/KpN/l18mE2WIWA+WCX31Tmsyu6IDZKcRAg9W7so4bCWeeDsxt+B4b
	80htq1UPHIcgDry4KiUprJvlRzZdyoOKdAoqKzBna9rh8FMHCHw2XJ/HNQcmiFPBD7VdY62/4/p
	M+mZky3uUb2iIO6tzS0OVWm9fQ3pOr/b++yegTQisRE//6kS5kJC6LzRYL9ZGPCan06ol7qCgdo
	HU98HtvW6VkJnt7Cf8Aqcx9EtWlGJ
X-Received: by 2002:a17:902:fc86:b0:2e9:5971:122 with SMTP id d9443c01a7336-2e9a69eaa37mr53344985ad.12.1792386054049;
        Sun, 18 Oct 2026 22:00:54 -0700 (PDT)
X-Received: by 2002:a17:902:fc86:b0:2e9:5971:122 with SMTP id d9443c01a7336-2e9a69eaa37mr53344695ad.12.1792386053460;
        Sun, 18 Oct 2026 22:00:53 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:53 -0700 (PDT)
Message-ID: <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX0nvLDsosgc5j
 CSoidnAtbQVdTKRmnqswgxjshSDApXFt8KQsAflXYs1xBTxN4Mvoc2HRl/MxlxliX/fI+ibZLeS
 DtrnBPuummtpQlRTtGq7FVKPSpBMbFU=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad5a407 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=_pPxPOlyeSa0pXYc5yYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfXzDhZi3d5eq6a
 hOQ/xfait7aGC8bOX0yaCWRuDhUAnZQuo0BNkpAEXC/T8RhMvWPpKgvlWadz7uwvftLWAAMj4Kc
 jwuUw88zG1Wl98ZFVHxHydYSLuexv72fWoZxKcnU4rXDvlYNpHUwFVgglOSwu5VPEORtvo1ikP+
 wXkwvg8fV36TId00m3myWpBM4YCQojBI4UPjfUfxaK0ku5Uvn4HpVKxSpEQf/Uz0/jU06bVjha9
 QoYw4Oqz8cNtXPzIuHvEiPVoL/txf542nOJd1USAA1H6xasu3Xr/4FDZ6m6SrOOGPsnb+DlCgi5
 IZdt0FUZO3BdFIFTudOkVOGL8uub6QW/7Hs50kG5ddgjAbBewk5+7LBKIEnNN3hsNqKQsqWKXua
 rkvCCZxz3Lbd/wFnNbD1j4iE1zMtB3h+VZuU9WCb1fZE6Xgs0a7DXDP9XnZMKfZH/kveV/JevuQ
 2uUpj+kvyquqKztYebQ==
X-Proofpoint-ORIG-GUID: pgcCn_Ao_gXOrqbGO4lMQQFFP9k7i2dI
X-Proofpoint-GUID: pgcCn_Ao_gXOrqbGO4lMQQFFP9k7i2dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190019

Hi Konrad,

On 10/15/2026 5:34 PM, Konrad Dybcio wrote:
> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> PM8010 is effectively the next generation of PM8008. The device is
>> generally designed to serve the exact same function - power camera
>> sensors and the associated supporting hardware.
> 
> [...]
> 
>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
> 
> I don't understand why you changed my match_data_struct approach
> here just to reconstruct the same data
> 

I was asked to do this by Lee here: https://lore.kernel.org/all/20260922093327.GA2308615@google.com/
and also by sashiko: https://lore.kernel.org/all/20260918165137.302631F000FF@smtp.kernel.org/.

Using an enum ID with switch() statement, instead of more complex
match_data structs, seems to be a convention to follow in MFD drivers.
For example, I could see the same being done in probes of
drivers/mfd/rohm-bd71828.c and drivers/mfd/max77620.c.

Thanks,
Jishnu

> Konrad
> 
>> +
>> +	switch (pmic_type) {
>> +	case TYPE_PM8008:
>> +		irq_chip_desc = &pm8008_irq_chip;
>> +		mfd_cells = pm8008_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
>> +		break;
>> +	case TYPE_PM8010:
>> +		irq_chip_desc = &pm8010_irq_chip;
>> +		mfd_cells = pm8010_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
>> +		break;
>> +	default:
>> +		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
>> +		return -EINVAL;
>> +	}
>> +
>>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>>  	if (IS_ERR(dummy)) {
>>  		ret = PTR_ERR(dummy);
>> @@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
>>  		return ret;
>>  
>>  	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
>> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
>> +				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
>>  	if (ret) {
>>  		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
>> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
>> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
>> +				num_mfd_cells, NULL, 0,
>>  				regmap_irq_get_domain(irq_data));
>>  }
>>  
>>  static const struct of_device_id pm8008_match[] = {
>> -	{ .compatible = "qcom,pm8008", },
>> +	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
>> +	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, pm8008_match);
>>

