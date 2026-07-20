Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168F83D330C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538754; cv=none; b=AhUNWi4Vg8oYdxv38YDa2MqUhPlND8IDlCgEHuSO+cv79beMugXMY1nteh8e28EvFdi+emcvZpqzWKgLHos407dUjR69DIcBFXnwshQUT/npnWOhL5cJe1ZNBG9WIs9XYQsVwqNSnhE/LNeCyveZTD3+CxDUmdi8aoENJcdmFpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538754; c=relaxed/simple;
	bh=+KroKQ504uZlS0P7BdvijA4kbRAC47SmmveENz3cvL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4regQJEWDYD5seiLe2MgkQF7ux3OxvFzhc7rx7q027wCSoIX/bdT9RackPS8R93IG1uMpCmYfrS21tUFegKiglr3ROj9Unwo+H4KjqILmrygMQlNkYgjCLns2+oonXgF9SnwRxMg/1enO9ELg2XKpxAf40bvhCJsLEwgOFlgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4sBfy4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQh8kg/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4sBfy4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQh8kg/i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YDEi2043790
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pM3cA2IbXGthHBfz+fn33Io69DEDbJaIw/yDmpyN6P8=; b=N4sBfy4KFRoVQpab
	PLftOj5LvgIVJl/NO2VY/eLFN8dQD6mTlv63cXrPfSeI/wrAcmhDY4RUB72iWEx/
	Kyhb7+XrQ3GMs3sF3p2VOXkcgw0j3KcercuzZy9S2dYBgM+wH+JjbxcoIoDQzrhl
	DearleLcM2rc3rj+GOrlA8cR13y6Qi561AC7fZ3xrJzH05xOa97nCB0q+QQTfYva
	vFGEYc6pIRwuI5W80vzCTDuk1rR9CtQLUkyTn1fg+7pLuJvEPBhnYdlWDpmH3fBd
	GU+lK+QQl+lV/U7mg5VcPYg4aFScrsYgpilUBJRRmgxa5wkb3OI1oeBrBwHkRGgs
	Aw9BMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcgetq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:12:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6415f279so140477685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784538748; x=1785143548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM3cA2IbXGthHBfz+fn33Io69DEDbJaIw/yDmpyN6P8=;
        b=AQh8kg/iV1JuoN27tAJ/hDuey/h8m2sA0KiJO3k0Neje+2vmtL9BTeamwNn4I/mmKj
         ywLj0B4Fu25N6Fk0qor0QKHU7E98rCUdpI0XXt8bBvnIOye0D4nkaffduriSpoGQWq/K
         8vZAP3Gn5LDKr9xlWy5FmzWM35ZuFgJYE4bFdzxLeXY7r5M/X1QMzCdmjWP41YRvD95F
         vaObyACvZKWe0rB6v9i99NmtN3OWOCN47WPg0tJcp0/xR3nz7it7Vm7jLjOQukW4BfTW
         7m6mP1mBVlChamM7w6lrw+k989ODd3FtgBzKDTtmph14plj5cuxmVHbojjsiVmtFcPwl
         g+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784538748; x=1785143548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pM3cA2IbXGthHBfz+fn33Io69DEDbJaIw/yDmpyN6P8=;
        b=H3XObBeutEK4XARZ3g49pU2auvdNDF9M35TPryjhcIztokjMqO7KQNwqEmVI7lx11y
         vgDceKbflAq4K0BOq0OmqduTgMDklkyjvA0qUnVNO92TLEqfIouQRiMkaOdN6esOnXCF
         dSMa+reuUH6NV3FgFGDuizUotRvFyyfyUYEQfrIO1P8eeCG8jwSDGuEsPFVKa54mKuRA
         /rejotfHzK4WVQzHP8yW7+q4k/oEbh/v2TYM54vTJnU1y4Q/zBjRRMuW2hzkFjTJ6sz7
         W4EQi8osdi+pQSnGSQX+n8Tn7CU/VK+VCMKHrpJErHio0LUIv8qKN6+CVALOWa8MXkKP
         b4sg==
X-Forwarded-Encrypted: i=1; AHgh+RoqirTWHFoIOsNCcRWHzx+KKSbMeN7unybq0T0GQComsrvrWGyh3I4tMQ/mvLm5kzvkk+40rVOgpFFWXSn3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1RFybrSNFq4t3agjo1cQEFQizaDmB5wyqufuDdpEvyMuACZQu
	qyv2w8wg/JGoYVye9l6cqnoeCrghdJrx0xECRbcKhop/iQpq7v5NWKh0+eff5H/DfaE1EWcKZvD
	F3AUoKeVmwMe+eNoGKvMeFRbuJrmSI6sq+Bd7hck6NBF2cutX9F+LJd7cJpf7a6CQ6G7F
X-Gm-Gg: AfdE7cmeso6sta1hHz5FoR/Unnj3nEzm8rXWT+bbt+a6WjJ/3bmL2WJ13vLPPv7gtyf
	rcjNu4M+DqQX6JVsaoHVkrOTUS+l0HoTMNJ76mb9sbFy0xhjdMRyJ6USM7VItt/uQS/bnsSu/yo
	P4w6BkQ/2QAr3xVmwg4n7QcmIWRwu5l3a52j0j+WSGfJddEna8gCW8yFpEz4uguKSrf4XlqrbeQ
	yWkEJDszBA1mO1NAHrANM1n2CcAoidzpFLDghLbBAiH23iFmuah0OGt7brviwT6dehuVv+8Mlmi
	Ye+L/v6mOpekqyNr3u4BInirNol4nDeoDpIEV3/mZ4su/xCcS+HzYzUANoqXFPA4t7wtrh9hrBq
	Z3bbTZqF3qAVTBMCsSzXTSjCY
X-Received: by 2002:a05:620a:d95:b0:920:798b:e290 with SMTP id af79cd13be357-930b437ba28mr1153247885a.7.1784538748109;
        Mon, 20 Jul 2026 02:12:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:920:798b:e290 with SMTP id af79cd13be357-930b437ba28mr1153246585a.7.1784538747757;
        Mon, 20 Jul 2026 02:12:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c19457d6f0fsm388845666b.36.2026.07.20.02.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:12:26 -0700 (PDT)
Message-ID: <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:12:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media
 controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zNdIbAwMtI1ATUKBIFTOjW25wb_1LX8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX4zPoMQQpzkQH
 K6PNo5/xjfs0KmSUvu+LFuCtXH+sBCZjArCIabRBIqC5cJf8yniIRJWu2Li5gU4tqdntIegXCP0
 sGhREWi6UD7BGu9T0GwOptueljv8RJlgiCnyEhim3wfipDY/j5GaeDXcPSDpYfikBKrkzbtLln5
 TDdKcMyZTHj7p3+CQGghV416H3sLmJA10InVcRasheEcFeMd6xI48RTdVqAD/btUEInYv70h6qH
 NMop8oya6SJhshuG1KGgMr69ZWBD5pxnqOedNCKkbN91Nm/naXN+VwzYv5HzsItpRuPH+OzGOS5
 TppVQ8Id3geRpiatnLH2ZR7nEeWNmZueDhFPIUGtiiGHc/U5ZluOko15AMtm0ftXWLND0ZkyNNv
 iZgDzZrut0putGD4IfLOIajF6DBvWwnIr22RuDYE9PCfAkh4secnb9E0Fdtk0S527dHnoQGVrOo
 ez/J7E+wmbiEz8pDaXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX60AVxVi96cWL
 AqnjBxXezhgXTcQB23BhUs5TQ7aq4G+1VKAmcNTVVvcvAOANb5oXZdIrOTS/noPupB7KMTRLZCT
 H/vngV8AvbuHHQRd/R0bbMg3ztmI3hc=
X-Proofpoint-GUID: zNdIbAwMtI1ATUKBIFTOjW25wb_1LX8N
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de67d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uMUtGptxAjs8TZNG6GYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200102

On 7/17/26 4:20 PM, Loic Poulain wrote:
> Populate media_dev.hw_revision with the top-level CAMSS hardware version
> so that user space can query the exact hardware variant through the media
> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> identify the platform variant and adapt behaviour accordingly, for example
> allowing libcamera to apply quirks or enable features that cannot be
> discovered through standard V4L2 or media-controller APIs.

[...]

> +static void camss_read_version(struct camss *camss)
> +{
> +	u32 hw_version;
> +
> +	if (!camss->top_base || !camss->res->pm_clks[0])
> +		return;
> +
> +	if (pm_runtime_resume_and_get(camss->dev))
> +		return;
> +
> +	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
> +
> +	pm_runtime_put_sync(camss->dev);

I think non-sync is fine here

TOP+0x0 seems to hold on TITAN, MSM8916 and MSM8996

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
