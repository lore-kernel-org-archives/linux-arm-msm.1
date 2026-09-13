Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A02F37F8DD
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288936; cv=none; b=LdIISWVbFudGcPFcgmHeR+OMZyB0ES9sRPBYS4uhGPk+C85ACoPdN5BU5/18BbVDUXIwjrH/jxe8Btqq3g0EHZ1PoCKyud1ZNwseDyfLT2iQWP63umc7HzejKM+zlqMUwsepBlY4FPztgscm9uZcklc3m3CWLv/Hd5VDMSF3rPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288936; c=relaxed/simple;
	bh=z8yjqyDFJNduyXmuCrbnCRgbSnzUlFAyk+u5Hegvyvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTxQ0OxsFXNc3lYBLm9zc3QQWq1+bnp1x8U/e3eRkxQTpGcAil+luPvDMj5al311g1Q6HhI247xQLf4j02JYS6lu16QgvgiYUcp8UH/EKwbfm9luCXjBj5o/pPlFuCHzWHsc16ved+3kJmydv39NRz+3goAoQjR/zThxBHFddMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+2K6kD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4p5Hy4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+2K6kD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4p5Hy4k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68D7VA9i415045
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 08:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tN1ZS5CXo0+mPTeqAfw6aDp+R3IyYEqFE7l6PNmXXZc=; b=H+2K6kD4ALIe3r6N
	2Q+lizcslTS/aKjRmP9sZakh/a7icmULNIwb/7PWHx1ED2JFPtCd1fmZRphbuqWN
	lRSx4ZhyiA0M8QblsKiVo/BxeWKMZYs4Wunhn9nB8jA/jf6F4bzNc5768Y1gX7wD
	0c6lOZG0nqL2dqqYia6LdKz6zd3LwafIEPvHGca2+7WFK35yj+P6Qn6FNRx5TZbc
	3vP0UaQ1mlOe2SEi2K56OqZbktsfICKlX3F3FbIZVZpzunVZcTPdPXWwE4QpHwyq
	tjktj0fXvJwO2hqOp4GzoAdytqSVrbVKo1n1xgKzekwE1T3nOWrrMocxk6W8Ffrp
	dzUiag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018js3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 08:42:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so3334820a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 01:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789288934; x=1789893734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN1ZS5CXo0+mPTeqAfw6aDp+R3IyYEqFE7l6PNmXXZc=;
        b=O4p5Hy4k60pHPGA6BeFG/81IvPLWlyqZhFtXwHdOavoKRD02FvsjfNExdbz0x479dv
         2Ge1OVYhrCjzh87azllTCOyg+OyB+Vz4vJxuhhUO3KGYsw4WfthR5v9uv8PAH/ArRlYU
         fC+knmLRMWeZc00r0BxCma6if43AjGfCCprEs06plKQNYj1QSF5tesRZbAwpPlr6FZDS
         XZopjNs9oxwN2xOysMeLUkl+IcbkFuDod+R+RE45HHBOG9g5YcPWzWDtSBT89llrMpFp
         2BJsUa01LnHY8auro0G88PFblBJSz/TDOd0HebZ7MDsyDQm1ePABpdj4epq/nHoFUbqF
         BqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288934; x=1789893734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN1ZS5CXo0+mPTeqAfw6aDp+R3IyYEqFE7l6PNmXXZc=;
        b=oJRTYKlnlzuC3n8CAdLqUcqTxgytnjo+DxZJ7tFPm+ZqPFrpmAtT4mVYc/NnEY2Hhx
         7d7ifNU5yl3tFp5jCX3Azc0DnvukmSvG1vs35N5nsn4aL+UWawnHOBNrTNg0epKv1IYa
         ikfG7Wa/VLvm29B1xcMp74FqHfWw+a2TQyRuiuysi5cRUJY3EtfBwzJs+esNHBZfq+o+
         TqOhQ/xiYTAgE15PUZ1q6Yc+L+8XykoKTtYQSSrbszfWwucs7yA14MIwzQ1iMpb5+13P
         R9aHSxx3aCcXtRiHGNIn00gpZrUOFGG+cnuJ/4kwy2LSgRflN+EZNmrOsw9i2yiP7dyF
         UAPw==
X-Forwarded-Encrypted: i=1; AKwUvBzgVljXifdHUA941UWnx38oY9Oan0/4MqsdUcEWr675pLEr5oNpmqe/EMU589g55VE3LZRe7PXw7i6/sqm9@vger.kernel.org
X-Gm-Message-State: AFuF++mpzuaLG/SVte3jAkRzvkurBbG91Ya5Mwd09r19M1Sdh4+OgrIL
	nW9cVmLNgk8GaaU06DUkVFX1UlLnbb9EiGhJKe7+JM2GxVygcQdOmC121uPzCH1+tP+EE21KiOw
	n+vNk18j0YLe8E2vn/zSoEpN3nwWLudZa2whvqYfS5WD9cOqjgBGVg46BYsk75FxKX6TC
X-Gm-Gg: AYBFou2ydKUGsSBX0X3XtHcb8mdtwcdhWdts/JWbJ+mBpuWQgRO/xl3c03taWOl1OyY
	TthO7xyk0wTboNyOoSwQveDV6vipe1dWYue41n8sE4ECn2X09FgUghHhOZDp8v/AD4Bum40bEKk
	Z+og9h+FHvoNkuwmsOdtS3u/kTmKZZy6NNO5rI+5zp/j3ilsmw8li+L/LxOvCUBkY21QFPgXLqc
	W89V7O3hvPJRjt5mcmxWi2QApuyQiNuYKumXnAXMuknEIBxz57y0dXQlL/8DgWeMCw+GpyH8nm1
	WMTxsIfOb7p2Q+MdXdOLfXLR45CJYTa8we9UIxOCHOh2vhGiCc4dsEwb0fiTJ8c1Mb5X0BONdOs
	jwmPWPTeSt0HTxOPdc0TtpP/huIZk8QsH5ow=
X-Received: by 2002:a05:6a21:6f88:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3daed3197ddmr25056090637.13.1789288934286;
        Sun, 13 Sep 2026 01:42:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f88:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3daed3197ddmr25056055637.13.1789288933893;
        Sun, 13 Sep 2026 01:42:13 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.229.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm32943918c88.12.2026.09.13.01.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 01:42:13 -0700 (PDT)
Message-ID: <44c570d4-cf44-40b0-b86c-3c207a2183ce@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 14:12:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
 <20260909-correct-icc-bandwidth-vote-constants-v1-1-fbebf6b3c341@oss.qualcomm.com>
 <bc2112d9-4085-42be-807a-2242a1c510fb@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <bc2112d9-4085-42be-807a-2242a1c510fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa661e6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=dz9MANpua1BkWfJUa9OfoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=30WRip7FDacWLqpXgTQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDEyMSBTYWx0ZWRfX8+85Vy0rqXDa
 GFTRujESFOO78BAqpeJZKp4t5Vvwnf38Hl5wJyS6c3D7G6avu8QCQ1XGPQIWVQDMQcCggqPUHPz
 OEMAkl/b7x+1M8np49wRBduz+LNON6A=
X-Proofpoint-GUID: MoaLD5F3-641hRKHiWzpEGHoBL8_3qSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDEyMSBTYWx0ZWRfX8d0Sl3HzXJyE
 Xdin4mr+JAn2KH8qnOVtfihKXVsRyzOQwC0C4DRWVSymb85y8rsPDzkJQD8Jot0jUUlKcWX5SgY
 vMWcoxiyI+QjOupPUXAZqSloKQ/376lKIWnwchvrDfaTf6BcH0MEeyCYHJVuVm2s9nD2T1eXD8i
 eco4dFj51nx+YszszhDEiIAkdmL+uzQU/WPs7cu+xwalov7WzgfPF4W5BwRmpBQhzyuYDY08tir
 9OT6ZPDJ56LDok+DL7i2RjXJahIRq1OPoD3M2GlQPJjU/pWNLio9Pl09rFX6H8P0wZY+6QLicUQ
 EDeV7BbXmmK3QNJiwEFu28ow9NVl6SGeEPAwjlCawAmvun2uYd6EUqHC3Owg+8l+XRswfPhJROY
 /LqNPhM72b3BNWT4QM+k0tVQsdSvQJOJ/IbkHsGrSX/o1C8sh4WxxC5lU+wloF2/YS3qYa1fHxD
 TzC+pNa84cLiSN8MRUw==
X-Proofpoint-ORIG-GUID: MoaLD5F3-641hRKHiWzpEGHoBL8_3qSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130121



On 9/9/2026 5:12 PM, Konrad Dybcio wrote:
> On 9/8/26 9:05 PM, Viken Dadhaniya wrote:
>> The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
>> rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
>> values are several orders of magnitude too small. For example, the
>> 50 MHz threshold is represented by 2500 rather than 25000000 Bps.
> 
> [...]
> 
>>  /*
>> - * Define bandwidth thresholds that cause the underlying Core 2X interconnect
>> - * clock to run at the named frequency. These baseline values are recommended
>> - * by the hardware team, and are not dynamically scaled with GENI bandwidth
>> - * beyond basic on/off.
>> + * ICC bandwidth values in Bps for the GENI_TO_CORE ("qup-core") path.
>> + * Convert them with Bps_to_icc() before setting avg_bw. The QUP ICC provider
>> + * maps each threshold to the Core 2X rate named by the macro suffix.
>> + *
>> + * These values are core clock votes, not GENI transfer bandwidths.
>>   */
>> -#define CORE_2X_19_2_MHZ		960
>> -#define CORE_2X_50_MHZ			2500
>> -#define CORE_2X_100_MHZ			5000
>> -#define CORE_2X_150_MHZ			7500
>> -#define CORE_2X_200_MHZ			10000
>> -#define CORE_2X_236_MHZ			16383
>> +#define CORE_2X_19_2_MHZ		9600000
>> +#define CORE_2X_50_MHZ			25000000
>> +#define CORE_2X_100_MHZ			50000000
>> +#define CORE_2X_150_MHZ			75000000
>> +#define CORE_2X_200_MHZ			100000000
>> +#define CORE_2X_236_MHZ			118000000
> 
> Today, even with patch 2 applied, many of these rates are unused.
> Are we going to?
> 
> Is there any logic we could apply to derive them?

These represent QUP Core 2X clock-rate levels for GENI clients, not
protocol bandwidth. Currently only the 19.2 and 50 MHz levels are used;
there is no planned user for the higher levels. I’ll drop the unused
definitions.

> 
> Konrad

