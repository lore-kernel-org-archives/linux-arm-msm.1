Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220357;
	b=pYxr4g0kxUlMaiaNky0U6A3q2yUr+R91uWZJiyOPx115gntgZgZRsfkxUDFNWYi+E/cT
	 SN5kBxLBoushrOOpIkoLcsgJePT4GQWuYj3vDp7ez18eIKniiggvDfR1ODU8263iIwU0z
	 a020mKPBuxFm9CVmH6iYXvaIuWdfvplo3manpFyvpdShNMKPvCuvDWuyxp95seUcTcbKc
	 +rEvJVFTN//lIo5DK71JRqx15u1ensZUK+2aEjq2Nb4OuJx/3NYbp4tSySpeF1e0cRpdx
	 KsZ8e5q7L5L38N2zZ2LQNFTAPGlvqIFlr7T9VDek4D7Iw1CiFtdx+yvOqy4jG8osSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
	b=aN4GzHlPHBnWiKH+wQzl87DM9OzObMdtwwJAw3zyene3Zv+7OWFQRwIFQsFUCy2BMHCa
	 +0gqEkYCFjB90JyVn7WuML+mNKS/nXGoy66Emrzm0ajA14wTIFpmLvjr7dLEiPik8heah
	 avbh9bZs7OQL2h85SamaDozXBtnNzJGmvS9nPcbD2BUrXkYOVxae/DEmSOerSFWHNeTVU
	 dapMZIpOdlY6PmfhFDrpE0HFc7frpbh5gr4pCFT6WSskP0wONQM7s8/T05c9ex/dwuNIp
	 dIsz8d+Q9lbKnMWGj3jedjubi605aP9s8RCtwulzH06FZsjm01gHFGci/xdUmZ8SIDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx5URFdN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MLBUDz7/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC94606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC94606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx5URFdN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLBUDz7/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPNoB1942145
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=; b=Cx5URFdN2cNg87ly
	4km/gBAr1vP3quNlgWTQUPHqp2DGyuTrdh0UZgUkt5DIzUaMfRxl6IhNHdmXgJz2
	/ONVKUl2soONKkTL5RHtlwVtqpyqgjfTITcZz3wJPLUS5/PpGUq7nq4+TrKg0p9q
	gawfFjdx5BXN69YzmZC+vKWk+tu4ip2Th7eE61AM1yWZj6XBZLaEUsTwIdSuwATU
	2C4pbO4wkG4ngEpdKdYo93Mtf87/H6L63Mcvvj+Tj+qFHxByQV5an0NMn+73J2t5
	yfqimq4AqZ8KpgdZijXWcUEzy3zqZNwaHOR88K9oyaYm9zG93wxH4JAUnNQmfsQF
	f+SPYw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwbe8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:45:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso3514632eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793220356; x=1793825156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
        b=MLBUDz7/Pmfc+g+B8cJgfY8zWPI+XTENqaffLdASkjakYxFd1inwaCa11NsKdOk8YW
         1ATH13bu0D1o9/Sd9TzD3kZBqHKqjOufTDovfppAnid0ujMMTR9EIHOKZUz7C3EIb/bE
         bMHe6oO5eefsG/oP7JCgoTJGQ5GSbKTtAJpEnhS+9Ykc9YLLCpVJoU+CGr3Obu0Upvjy
         0xD1vuZC7vPjYfdi1SrGEZ5nwmyJLPLEGOzsEv2Xj/kJ5AZsFA0yZHuP8T6niHgUBBMn
         2/Qm3H/gP9jbDKU3Vh8rxO+7Jt3QepMVFBR4un4fLRaF3BCEtnaVHr8CtlFY3r4gnKiw
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220356; x=1793825156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
        b=NfdM1SyY6u4HqYxS492I7b2vIK1Od2NNdhw6cNFpWIs2nhQsQKcnLMyVcOKRkKGVnT
         e6lNGQvWl5IxAiRBAsGo0fXPpe4c4B/bzJHGpaZYoPNS37vyICqYEAZ4iLrIMzOaT/zX
         hWg4/tyiEJd2n70mAtjtMcHAXL58MYmjXqxsSZaGi+ED3O+9xMqtJN09S9UCoErfPjiO
         2l9YGY5i3j/6LW0kL9mwZ7f+A/ptkhlV799BGfsglmexGbdblTyLJpU0Dg7FtJN5JsNi
         WRH3R75cS1TIHTR373zEPoHpJzlQ87H3FysDlrXdHkK62dQqOxpEyp5HCAYW9DoxazG4
         znBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz+qt+iAK5fkhwSgS12ktk05615VO5H8WxCod8WOYd76GNjienfwacap1iQ74Oss6BMVWMt7J+Sx6XUg+L@vger.kernel.org
X-Gm-Message-State: AFq9FYJXKl6jNkAt6oygnBrrqBggI7ivX1jUGlPUNgq5P8Frcy3Y2g3Z
	8THS9p2gsgyt9/XkoKJPk5yOPZwPgszSsSf46t3Evs5D5DMDbwgwJ7jdQvAEvgT3CGfx6urbIUo
	INsFYvbk2SVPX03KngnmY7p3xFIXodPJT6NuvJIbPljTkiti/1mDDf7C7gVFpA4cY1y4A
X-Gm-Gg: AYBFou2BOlfaCghna/cFVs5Ujc1QKQYVknA5Ic32qq62RkK+35iergEzBICEDC21+bQ
	hbKhy0xT4nDkfDn1UYbfPc3VaX3l/sdiogeG+FyvEUql96cbeUH7gCn10mR5BkLjZqmCCm/JR11
	dQTrz3A9iZ83XAOr/yyf98upcbGx+IHzo5UyRFgZw/W9ZEH7QjEd4KRNiCwsYaV6RbC0kutTzz+
	ZHX1F5eKOm4XFVXbdMsrukU1r28MVhxjDPabaxA3/D58N2JlqSfKB6gPag7vGOqSHFyGe9wNatY
	r2TUZhMqZpt2qW4nU6V463wldMwG8dcZ6psSBbv3wTGirQC20F8KZjKAwE/BTG1H170IjYicSMp
	fLzITtFjDUGvmHLruP4dW89CGdZOOF4UxBBKPjCJDn8HayR2FH7pqCIP2MyDDWIrhIVV8XkNXiR
	g/7AFjlEzkivboFi9urvHxEJZdc4lnfE8=
X-Received: by 2002:a05:701b:240f:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1a6cd7799damr3970911c88.23.1793220355805;
        Wed, 28 Oct 2026 13:45:55 -0700 (PDT)
X-Received: by 2002:a05:701b:240f:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1a6cd7799damr3970883c88.23.1793220354960;
        Wed, 28 Oct 2026 13:45:54 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f7fb28csm10326914c88.18.2026.10.28.13.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:45:54 -0700 (PDT)
Message-ID: <1cb79561-39bd-481c-88d5-a05135f5dee7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:45:53 -0700
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
Subject: Re: [PATCH v2] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ZW6-XDf5dgEFD66QI7ZA8WIK_alWTQD2RWolsXjlSql7pO5IUj9PM1T95LMfBd2Y3zKxRhDXXde1R4asZWzgKw==@protonmail.internalid>
 <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
 <58599b61-a56b-4d6b-b09f-03d813a64c1c@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <58599b61-a56b-4d6b-b09f-03d813a64c1c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VRtEoXBDA0a-DQwA-DMjLlYeZsFyEUJi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX6syFqk1tOfpd
 84VYapaKRqizsuOX7o2iGYCnAXN/bM/3hEgYBGqxulCYYfcTfLNuPMaiLKIS3d4f15fto916mhe
 eo3tZ20U9/q5cbm6pTnZSjpiGSwxWJ8=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae25f04 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GEq5pLaLegoqB_85s88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: VRtEoXBDA0a-DQwA-DMjLlYeZsFyEUJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX14wM0MdhX2ne
 Qcl214cNSDX3cgPtEtSXPE47UcnJWNe0w6jCcss6o13hqHzNxa9ERx0X2UVqb7LwBVNeuH9xLQZ
 vKvTVew7O2DkDBJJczDqJSZ5+CH/BvIMuDdb9f+j58NbPYfz9fbZVJiFvimntr+X7n5uSBrnyFr
 zLD57NpWm4w6O6U6PlTcunlrYAvGblDj053g85oVDuOdEdx8Z7aqCA7mZBkAds6EFb13KRRIkJF
 te5fpffI49CyfEZI29j7V5O3MD8g9Da1BdyIUm8WPMBhxs28wiGe98pRKUB38OpoGN8+VStp+CV
 UJGykzgGGwAtmmaaYAHXIOTZdc/u5rMp5g2FQYL0Wz1KtisB6CMoHOJr26ZDSFWkOfHfih3fVU1
 FYlY4V0+gIUH5nhzc4oT6gJntjsNqlnbNtXnIVdUshdkRgBl1IWDPPc+DkdVCCKU/dL9up1LZlt
 pXm9Me0X8H+ISYmDliA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082

Good catch, yes. I'd dropped the NULL-list check for the
multi-genpd case too, when it should only have been loosened for the
single-genpd case this patch actually touches. Applied.

Regards,
Anusha

On 10/28/2026 2:58 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 05:20, Anusha Arun Nandi wrote:
>> -    if (ret < 0 || csi2phy->pd_list == NULL) {
>> -        if (ret == 0)
>> -            ret = -ENODEV;
>> +    if (ret < 0)
>>           return dev_err_probe(dev, ret, "Failed to attach power-
>> domain list\n");
>> -    }
> 
> Shouldn't this be
> 
> if (ret < 0 || ( csi2phy->soc_cfg->num_genpds > 1 && csi2phy->pd_list ==
> NULL) {
> 
> i.e. you are dropping the NULL check for the case of multiple power-
> domains.
> 
> ---
> bod

