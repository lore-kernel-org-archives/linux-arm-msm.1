Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884C3B14D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463817; cv=none; b=l1HhOFjbqABI8R56fMPYYv3R5eluZqEtO282K2MLvFVmJaftMZQMIOx1i0C0sKMxGXS/EMOvVjiqDCV6oAD5gMcFbYZKolkOUpXOTYUhRsY7cPiDaAE0apuGPzORW0uiIsZZ1uNf0yLD3fYJmDmV+oMMIC7TDCm0X0Wn3FkkdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463817; c=relaxed/simple;
	bh=gR20aVHHdNNlZ7jePZMWsNtnoXNWpfKzZwiuOpo80jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSVwAH1vbxGZfH5a8/i3vIF3Zlbxha1c4KvMUVDZrEO5NDUahk8IjamLmzuzB77i41qOxqLp+gVFGfOGJzNCgiT+tDgcn6u2SQ+GWJmlOgDNJSTISaEAVFNmsAd5g1DzMpN75ZAVUsRtksVT73fzEoaIs8AwhpqqzeRc+dwlhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwKG8Tq5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHbXiKkx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwKG8Tq5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHbXiKkx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX5Ve766960
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWx5wQiFNSaNvgfeLEooxmOF1j+J8p0cFgG5R5h1z48=; b=ZwKG8Tq57c/E3VCr
	LlkDKeIoxXAGpvibamQBFQ53x01w56qpMw2ssikYTZzNIEZoU2HD/GvuHNRdcz/p
	5qpYxOEibkMKtw1bOYMgoH16HvDEdU3AoLXh5WkIuhuVlNEn8EGI3YiXXD7MYLhM
	2wrvEu41v+9Mr+V61jEjLwpVWP2SAccO2x+LVsig+xWHsNeQjfl6FSn/ohsF+Lw8
	DZUtACqaLoTxhAR8CfxbsbdrzpaFGbp37C8B/Lj+T9CDcdt8X/Cd7llJbV0IflUH
	ZUB3iQ6qO7RarLkIqPB9/rfZdQco4QOAHiOqEgrFfe2Lhj3ATIFEY8ZFUisSG2Y1
	RmGqpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc1by5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:56:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so778875ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463813; x=1787068613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWx5wQiFNSaNvgfeLEooxmOF1j+J8p0cFgG5R5h1z48=;
        b=ZHbXiKkxljOaGRuOYf9/ybUI/Hr7lFKLlXOCX7Hm7Oh4/gyHgXs86vlAMUDsSJzzmT
         m8MlUzchm6Q/HmWYcc86dKjvx/LllKmO6T7RY8D9U+ytpfCZ7KbV5cBCCFxVOUH9cMCD
         m15b/aLggDC201HP0avMVkyg2j7CV61CvgVBZLLsUUv/ayy2DaoxhnsftUvJtQLVlwrm
         kYPnKDUawvD4IFcWwdWYW/IETnDb5Y77LI3Vc94sGdBrwUuTnnBQZF6Y1dq52E2tntIu
         RFGtX8nb7yNiGjo6liZ9hcJElOTmX/dIGNbgN+cEd2D5PCMnIp+UOrkwnuzDaZTmQ44c
         IFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463813; x=1787068613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWx5wQiFNSaNvgfeLEooxmOF1j+J8p0cFgG5R5h1z48=;
        b=HBPmWdaQKVrcKsjZkWtSNx9iCl+RTY5uk8Rxowk5GX1Z9dTjH+IczBFl/4CINIbE5M
         xh+HJ8lexEk8FIjzq+lVj2S+ofBpl7r0tGvuC/Ek+d46PdD8TCifcTnOna10petpTc4n
         Hs8cB0rCTNFSPXhQ8YFtnj9M6RqwgnCgxEcFWKfFP5uh6vYXZqsx5tcKkyF/TnQuLZIg
         /h/WD0rVfsCeKaLacrXDn7kEAEq6zBjZdCHQN0cNqUEhY5IznrP9l9h2MBrwubx6VdSh
         3Z5MMnawq8cESSz9vd14qjvhH/gLOAiki2iWEWkTcG5XfdOqfxvNo22OmbByyJZhEgqF
         apTg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0H1H5t+Qh8AwU2MhVt1QmxPNVxzj37sgM2xelyyQlOlFwBneMnP0FhVtHBcRtZjs9EEmXvDG66YTP87ky@vger.kernel.org
X-Gm-Message-State: AOJu0Yx91HgxjvjsArMbOa5HTNZ/5Sr0QBzTiUL85erHYrtha/eiei2u
	WVu08Z9cYeMQNow2DS0m5JRaXhx6i6+HZicKdqG1UWqpq8QQkOgGVHstxOE9G2qpXE82kvR9MqG
	hJ3n4faVpWs0aYR4ymvm0a01YRIb1XJyEBwnfYCY5IH9GNyqZyyrYKXChFeN5wNeopQtW
X-Gm-Gg: AR+sD11sb5zvLfs9MM5g/Q9u4UBH6y4oqpu2ZLM5Gk3pCC4hRsGYWxAE+/F6xhsltfw
	7BvBuDajdZ6FexagPtMFJqprjgZLT+AxGvCur9NwPClMYHwncVFIz/q1V7RV4ov41vagt/BDdS4
	2VkPapRvmF7cG6O+TN6GgernH3K6/v+CLMdU01xm+ozUXv4YSsbZM971puT4N4VMGeWmL2C+AZx
	qyzEIAC2f42JT/KaVzTKO1tvK5UZkTnKEL68nIp66NqDdIjMFl4jXIIh5ljA0d/EHQCsEp5uK23
	gBAZhFzCRMdl11RvxBU8sZxvHdUTfaQ2hTe6RkdZDjiZSscyEJM4QsBp1CvtnsN6/Mc/SxYgG7J
	m0bHz5LjW0ZwqPgu4HSFTbUWO2bJKMOyLhMHBK/Sa2+dx
X-Received: by 2002:a17:902:ecc8:b0:2d0:cc92:f7c2 with SMTP id d9443c01a7336-2d317761f7bmr45176595ad.1.1786463812738;
        Tue, 11 Aug 2026 08:56:52 -0700 (PDT)
X-Received: by 2002:a17:902:ecc8:b0:2d0:cc92:f7c2 with SMTP id d9443c01a7336-2d317761f7bmr45175815ad.1.1786463812092;
        Tue, 11 Aug 2026 08:56:52 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160cf975sm10526335ad.48.2026.08.11.08.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:56:51 -0700 (PDT)
Message-ID: <208f6a30-603e-4c0e-a7a9-a6e647b95d69@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:26:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: qcom-geni: update frequency table to fix timing
 parameters
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
 <20260811-ipq5424_i2c_scl_updates-v1-1-bddcb2ceebda@oss.qualcomm.com>
 <8a6581f8-e9e3-4c02-8d26-245c102e7428@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <8a6581f8-e9e3-4c02-8d26-245c102e7428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX978oCYmS6OHJ
 O36Yk+oQHty1md7+Xm7SLdq/kbjvNCZv5wZQIrFNH7JF4/K58DluwrE7GH4BfgAMYJV5qw6dQoG
 LD6s59betirlltpHd6oJPrDZnV3IoCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX0ruOz/Ta34Zb
 s4pr/8ota7Fg+vG9bDlBKEsfiRivXMPzPmgOfMapKbgQHm+EXffyiHQ7ZC2SKLNxEmG29ByiI4p
 m+ypZRuubtnY5Ivjojno/b6w3n5fokkB9usHFM3QR0IWF7v09DUbQwDllOPKhRQhUudzz/RJlLO
 0pHFcsKzliFL0wz/6wH2RuPRpFt1QyzFmswCzJ6zW6Gt2mM9Gbi/L28noUCpHUGS9i9NuhV+p9u
 423VYFwxexJTlrRDk4u06B0kCcbYe0LvjKX9maplMabtalWkB3T9SCg1dxbZEYzErWX8rop/CMg
 gJcaNlHD8wkPGP7JPXnrdk6NNqeA47vlUydIPcBE5MIuJctZho/xEJhAZSo6NLCCQzfr+3fsuGL
 HMNvK/nrHkOYhBVmYSVPmazOapdTY2AWeLjitIba4HRz7NrRZVOJA6CW0A061vZSo1/Kp3ttdMh
 Xjg6oHbdiTGY24HLdmg==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b4645 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pous5NoX4yLtaCBAYDcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8HqzUri705yWTrcSSPXpd_TVUKm4KX2Q
X-Proofpoint-GUID: 8HqzUri705yWTrcSSPXpd_TVUKm4KX2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110133


On 8/11/2026 6:12 PM, Mukesh Savaliya wrote:
>
>
> On 8/11/2026 2:53 PM, Kathiravan Thirumoorthy wrote:
>> In IPQ5424, to meet the setup and hold timing requirements in the
>> standard mode, update the frequency table with the values recommended by
> Changes are fore FAST mode too, please update the commit log accordingly.

There are no changes to the FAST mode. As mentioned below, I just 
removed the extra space between values 4 and 3.

>> HW design team.
>>
>> Also remove the stray space in the I2C_MAX_FAST_MODE_FREQ entry.
>>
>> Cc: <stable@vger.kernel.org>
>> Fixes: 85c34532849d ("i2c: qcom-geni: fix I2C frequency table to 
>> achieve accurate bus rates")
>> Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz 
>> serial engine clock")
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 658636c1ee0e..00013b41a6f5 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -188,8 +188,8 @@ static const struct geni_i2c_clk_fld 
>> geni_i2c_clk_map_19p2mhz[] = {
>>     /* source_clock = 32 MHz */
>>   static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>> -    { I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
>> -    { I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
>> +    { I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
>> +    { I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
>>       { I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
>>       {}
>>   };
>>
>
