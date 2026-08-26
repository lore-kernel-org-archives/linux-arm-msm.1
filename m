Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECE3F4DEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745300; cv=none; b=Eo2EaCQsvZmmFlGRsY2gGZAszuZmVeKggAgm88z2NhX5RuOvNuQf40UBv8iq56CSA++y9mpwBtcnTpiiqgLdCEFeB6zp0uwXUSkSuOq/cj9We+KAgH26bMr7AIqsHxN8Ox7yrlY6H9i94Wnq5kCttjdwIihBP4gENuUj2GmJqD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745300; c=relaxed/simple;
	bh=1bL8SHeY4H85ODVaWl9myp8bt68czbdVcvClUWMwZgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLTdVRv4QUIL6DT2Gtgv67LulppnF2nWhBmoeR265+LTleYGo25iH7bkfL1CxuXvD3IwijVPzsBXG0tMLSp8qRMPbDkaiI12unrLD37qEbp14Tb74w1HEAOUgpegnoYflg7fVd9zUgX08fnnxbYwWDBnCwjLzlRyMxI7VgPJMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxtAFUjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQcPRL2H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxtAFUjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQcPRL2H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGWWH3732397
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=; b=LxtAFUjT3OLnYJSo
	iTXTYynpeMBZks3L4NGPbINgsPIJu/3jPEXJrSKSfDkvAvKsbOgS8/xA2pH/39Rj
	yy2dHdNl65obDPrQPNthxMCMAMWgHh884PzNFcJq4nm9LvoKh4XsgA66eT1Smh1r
	AXIulxLmeOEBewWZYQvqjjTXLgC+yyjIosqmLJImuEwzwtk4RStmdaAJiANAkP0V
	1xjbgX7vtwHu0a0qX5p9DOuVIYsgr9KNd+A9Et/Oto7ZZmbAvd4euQCNwqFA4O2p
	eDfabYu69tKt10PyiZ60B4SJyK0M4vABOiJW6TOx8CkqbOwx8hGEUuuTRvWtum8T
	o5/1SQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqrh53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:54:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e01a62d99so766443b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787745296; x=1788350096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=;
        b=dQcPRL2HyYx1eLxkjH4eHTXn7P/ISmBL4ZnUtYZ1oynh7D0+JWr6EXuZA4k4Esr1Bc
         /GEYM313En+7Inr/w3VKZ3FHWmsOc/6NMHlQJ428N6UFuu5PrCn+Xa/bHWdRgyo4yp+o
         QfAeOw9Tg6A30MvoYwKDGEcUlnOTciey6luH198D+818TtBqciwN/g9SQorezdo0t+f3
         EbtILsqL/0+Gc7fK5lkZ8XKRGfjMp4UFay15Zt+oOhnNpdi6PQTxo/H7YBpdPOQOoN4F
         okM7tIpgMJco+e8YUxYuO5yxKkzq/mnkOU1H1f6ckLbAp6FUwtcsz0XXVPKF9Ff8XxVB
         5adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745296; x=1788350096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=;
        b=UysjO2pWIKGAM+dcsK05zvzNPGfrthuqkrgRkPb+FSOWSkrjBGmXuQiWHrtmygy5fQ
         KA7nlBbsbJ4Kt6S8pS5OFStQz3H7ehU/+PQoEMt0fM6Rc/lnMOINLCz+0VqS6JM57REN
         Zm187U1+SJvaNqEl6tK2glylE0iBG+0xXmFTVTd/YPnlEc2Bp2yk11bWLc3aNBZQdIKT
         NFIWnB4DmcZicUraMvQ1Me/1EFA+w005W6jpviKfMyxix2ALD8J4s8p+3CaaN13/730R
         C+YL7NODu1OVjA7C4GgBQVLa/Zu8zujemCZodMhCGfRm9bKt4gYH+jdaNV5AYfKALaEn
         kb2g==
X-Forwarded-Encrypted: i=1; AHgh+RrAG/yCTMxKjj7NK5lP7M3eSPx19EvLZewl+dCry3Wp96RZY4CIjHibxNj3aPevivEP6VrxBrbb7nAj5QB3@vger.kernel.org
X-Gm-Message-State: AFuF++k2PyfhqMNPR1748nP38TwlTkUHu+KsGRCtywwpuneVKOSENjoo
	NRz9m7OHxj6jVSN+Ldcyo3WgUiDSljsuW1kLw/qFQ3d5KMJiPL7nHozDbOr1Yo6l4XPpG6JBs/2
	TSmxWwLTJP7btcQXqcy8E82BTw88mPjtLvsB2qRFvyQIeSYVT18B/vtws6tzyQ753sEm2
X-Gm-Gg: AR+sD11DhiNBSufr4Zd6AmnQ+jmIUzUjk7gOY3hdXInXibz20+Cw5la8Y6gYI+XFa4p
	b3xeI8vMoeNwphhGEzHYbCsgzLAel1PQZrMzDvt0WioDidb3d2SdnS7gDifTUfd5E12Eo9spBHP
	314kEzKYrQiWpb2Ey+hXUo4jXEHxd3NHeKhhR7WrZZwTkVQa3tzL4G83T7ulWKyAsb2LAlQ+v/N
	ot0+XiZjyguJTbNTzvdXZP7kJObxnmW3cIJJN86ehH57pRe1+qRlBR6fmKKyay8VsGzDFrUdbzI
	G1nGEL4Z6IMFCKBtQxNbTPlR51MkblNHb1a/miHyO2ZbKt7CZwHaNnbHQeMtifVpwruwxIUqBF6
	AuM9TFaoDCgiqFQ3JkHXyI0FSKwCEhBsZEqE=
X-Received: by 2002:a05:6a00:6ca7:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-8536ec13a78mr13481232b3a.0.1787745296233;
        Wed, 26 Aug 2026 04:54:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca7:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-8536ec13a78mr13481100b3a.0.1787745295712;
        Wed, 26 Aug 2026 04:54:55 -0700 (PDT)
Received: from [10.217.219.186] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cf3e982sm793514b3a.54.2026.08.26.04.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:54:55 -0700 (PDT)
Message-ID: <4efcdf15-286c-4bd6-a75f-77fbca07e7a4@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 17:24:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
 <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
 <e000c3da-32f5-49ba-9aff-b2b17db23927@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <e000c3da-32f5-49ba-9aff-b2b17db23927@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5OSBTYWx0ZWRfX4m49s+f7aBRg
 UgjwGapXRRJchevDyp1DXwbAQZUQdw4vQT758JixmJ8shaO7rZ6MAIs+E6NrQXFNJypoRlEv+as
 qPkWhGXEoFgGx+yOwMJF+Gt67hMM1dM=
X-Proofpoint-ORIG-GUID: NS8pL4C3wkdp93vqDsFLluEE_E0sssF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5OSBTYWx0ZWRfX8azFd1PcPn9G
 Fcnaj3rOVn2ossXnitMflO01XgFeizluqBtDdY/IZs4vvMzmVDC6F9rQ/wqFlejTEwQzm9MQ0Aw
 eXrpQgCuKzTe1MZrYLcWVNEciAFqHA/uTzjMlskZWb91hVVhRb77Sm1d/72VJDoe1tOusLEOTB+
 ME7Et6KRq/lwfetMcY+fC9cjozYxxpYfdPn6IYPtFw8UZr7YAItsF0Mw7lnoDmRKc44MeCd3Znh
 tAEIOQYFi22DB9cgnlz7XLa3aYBCvHV5e9IVDKTRXM4p72wMK/7yTsmM4P4MYE6tdr5Bd8inYsN
 LTYqp3GDdIz3SsWLfME0FcwacWbF4xtpg6oAG8+L+gk3TiY1NaMY6PVsBAaEvmyx+ePoGJQhsuM
 AudD3ii92kCU0ui6QIXQ06dBoqYkpAqzNug6tmVXA/ZYl1UbsveIz34QxukpLa03F/XKmgqXbBp
 glRuYpKYDa0yX5dN9SQ==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ed411 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4Fh5LKrImxLeDWyZwEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NS8pL4C3wkdp93vqDsFLluEE_E0sssF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260099



On 8/25/2026 12:38 PM, Praveen Talari wrote:
[...]

>>> index a23554d101fd..4561e2d235d5 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -213,11 +213,11 @@ static int geni_i2c_clk_map_idx(struct 
>>> geni_i2c_dev *gi2c)
>>>       return -EINVAL;
>>>   }
>>>   -static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>>> +static int qcom_geni_i2c_conf(struct geni_se *se)
>>>   {
>>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>>>       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>> -    u32 val;
>>> +    u32 val, ret;
>>>         writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>>>   @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se 
>>> *se, unsigned long freq)
>>>                    itr->clk_div, itr->t_high_cnt,
>>>                    itr->t_low_cnt, itr->t_cycle_cnt);
>>>   +    ret = geni_se_set_rate(&gi2c->se, 19200000);
>>
>> hard code ?
> 
> Good point. The 19.2 MHz value is not intended to be a permanent 
> limitation.
> 
> This matches the frequency currently used by the I2C driver and 
> therefore preserves
> 
> the existing behavior. If support for higher source clock frequencies 
> (e.g. 32 MHz or others)
> 

This is already added in driver for 32 MHz and also AFAIK, support is 
added for 3.4 MHZ which considers 100Mhz. so make it something which is 
generic. Hard code is not recommended here.

Can we store source freq selection and continue with that ?

> is added in the future, the requested OPP/performance state will need to 
> be updated accordingly.
> 
> 
>> May work currently, but if higher frequency support added, source may 
>> change.
>>
>> Also you have added in commit message, but add a comment also here.
>>
[...]
