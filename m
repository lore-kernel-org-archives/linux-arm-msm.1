Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690521;
	b=v7tAxCkh4tc+ba6U1F254Zp6HEx4jPDtxjih9K9Ue572S/YVMcHniB6o3T4SO0BPGeEM
	 /i5v1lFHw+bUfU4ZI1okqM6NmglyHKuy9jzkXLhDDv02CEbAr79IPFii4hNR8tBvBlw6v
	 KeSoCX24NCCTXWrd3XRdxpnN0qeTazNBvuXpIwNljjTBKwFdExBkIPdScyRj6WLWbES8V
	 ySF3smIShmwNUE75sQV4IRialBMlKqoqiSQEtd/29YL8ifQuZ8DIdv6gsmZTI5mDFX96w
	 Z7LxePBanmnFkXw9pw7lAqGu5HqyIqL35ViUT62UkDmCYu+J1Sv6LEVirwEiLMZFipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
	b=HlFeQ9k/ko/lhteTUnqxUeEiFI4pav6W70/4QNhxXAezdoSLd7fUzPkvvgqQeGQuGJVg
	 8L9jbSSeOBD/TP1IZwuXZwk8iPF/OdBl0AVwb0KFT6NW9TNsHe+Sz0js8Tgxut1I0fQEN
	 ChRvOtDAaqiDZv5BsD0AY/yObCvAjNJovDXPQO7YnLII8d1UTdSyx0AOGts81JsLu7Lby
	 3ex5Jrbfa/G1JxgOm8nS0dgd8QPpkNrCXBI4+s4WqM/b3mmapovy6ORMK8iDpie+fSULa
	 GPNg109efZ+E/k4amR2SRZANB9vfgnTBXnQyY152fPEIg95DJgkKERi6/hi+xsPlpuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezMF53wN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGtTIaBI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD10A606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 07:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD10A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezMF53wN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGtTIaBI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eLIo1397349
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 07:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=; b=ezMF53wNN1hAlzpQ
	zPBeT7TC/xSZHNmjdsSl2GQ6BmRxXFvF3LseH/sFoC3xmeQqk/6NIN1TekJ4maEL
	KS788+hJBxvPILfskRTPGdZNmGuZ/KG8/5nB6EOj/VyBqQsqv6Vq47Dd5KkBPw6J
	RyyvbT9ow8iG0IElFc+hEonEiK9JZDRMZnZpxb/5mqfLLhP+FlGE0Psp51EGg05x
	9llxfvRzhZDSStQFRFcM1hFbbSTKEiF5xn1IyDsl81n/9c83XJneypRyZxizAylD
	eQk5XEj96drXanlrr/bl0u/Kmdk0z+1MU8SSMHr0nmEKEh3Xsw7jgrag5sF7FVjv
	2Bzhyw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5hdtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:21:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6969473a4so2193315a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 23:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690519; x=1794295319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
        b=BGtTIaBIMrrKnFSxyT/4pFlXPo/SdPLLEMgB+zfOxCcp+KH1PDewGJhYGrZCybwz6Q
         KAIZTGGGgzJQmxjJQc0BMwYbfey1e7zdqA1vyR2nuNrAHwkWZDVG6NwuuZv4HryuNPao
         Xz2bqjEwD3eWALRv6JavURbxtGjxLm+BkFP3sF/79xOh2tf4KrSxjrB5Y5G1Lyfq9xUR
         4a5IboolIfp2BQrGugwpw/iNnznq3XiJd/6U7xWoPkkyC+YwmXQbLGZYbSNcQhYJJFG9
         WDDI1CLFmpm6ExoYae0gp4z9Wd4cmRaStotTYk/wyXRyEjJlPOk1HzrkCJF/rxHWrZqn
         2b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690519; x=1794295319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
        b=FX6MSkPZ+jAtr95mOIc3LhyVY9CUMKQ2iVRgc6q5nopieekCR7xxmIjj0JYAsnsrnR
         ZlnfiWrucT9DUIhCIuexzUDDALiWw2KbqYYG61sXsviihU1c7v6ZKs2kte/5Bh/U208L
         /8BiF14YehWjDWuis4j8dEPaqnWYGa1bhdqPjP6ZExGanZim0MQBVJGimyqOoSw6nu/f
         OBg1bNUUn44DCiBP9HZOCIajuxf8x1BlHEg7Hq1MdvUCJol+u9KiuC1KNMbZeHKqZZPN
         ghzvZUYzskuMXlhPJYExVCNJCoHIkzjRJtkiBm+unFOzHFeEgpVEZgA2g87dw5Za6jTH
         1KJw==
X-Forwarded-Encrypted: i=1; AKwUvBzy8wLg3MbSPbL2nkCbw4ZbfXxRC6TTtcNVFwi1mYyiAUJhui3nprXj1R5VHTgLnl8owGRfxVK7r87zSzgj@vger.kernel.org
X-Gm-Message-State: APuU4Z+mcRBdi9gvwiYHcsjbra2BLh7UE+gZ59yVoext7AAMv3MqZ0ND
	QpDc3up95a0B4yVT7tbX6Zp2imFj3AekiDsv1YmcJTkZ8RbNyZfYWgAF+xjsMZf1zykPPuqN2C8
	gwwDBzYsDu/pv0YDFRV9TJk1eneDL3TA7CSSSHFi7it4emj/YP41hNGYUQ2SBJ6gtxJL0
X-Gm-Gg: AYBFou2EO7zPIwBZ2ociGZyOatnrf5PPI73oU2j1xe3nJu/PwjGl1bDV2+6KjUlHaqS
	xJg+r/q3ip8OL0TiGG2s+GUkG3D4hZ00mvfaHxa1nDr131eO9S5vxMdKDAZRLIuEAuXS4nNUSvQ
	Kf31w2z3oZMyj9MwyAOJT5fNU1JB157sPi6dkFz3g7SPcp1rQX1ciwVOdWoqLSUdCPbWYmCYRof
	BZwj/RgnSJiMR0lfpRwdAhLI10fQEbub4xJWmhmAbsH7mN5tkkp3F7e1P7eoxarPcmnkVqJCbIn
	9y0GuWOs678G+IiOVIO0O00nT5+74Xw2buaTJNYmt9zwpeFr3PNJ0zfDPDHWI4UGBIMBYy8Ke0i
	CMuJb+32r8wTjr86cJgLQ/U3gZb8hXurva1mkgHwv6ih4K6ZF9t/P/DDgSJhFcaep2iVmpJ+28I
	ycFXM=
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr8855431a91.50.1793690519174;
        Mon, 02 Nov 2026 23:21:59 -0800 (PST)
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr8855410a91.50.1793690518518;
        Mon, 02 Nov 2026 23:21:58 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm2799014a91.11.2026.11.02.23.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:57 -0800 (PST)
Message-ID: <cb63c8ad-abf2-41f3-a2c2-0b21196fe46e@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:51:52 +0530
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
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
 <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mkdyizgijXwFU4V4AeVw9zOiDsYf_X_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfX0jKmthboN44A
 kzg4RlT+NGaLmpSe96IuBbaeFRV4z5kLDk0cSueuwTAoPnkRfjg3+mEOtGbdZUJjjjXdVHlYXVl
 Gy9x44bysnua+nH/Gzu4oPIE5EIHblVh61Y5yMNxvTY7f0Nux/u7zq64xRvlHRSE/Iv2C45mK5D
 w8vJZS/tc+dKMfDdcck9oFXlQ5Fa7z8un5LtcMcmMNOFvkESk/hWE0T0pu+Aww3uk/vN1nn8WB3
 cFZXT5OBbEhaNTRsKWCpeK256YehHoi1Vk0eZ4lAdPnHgqq8qSrh5nZd3NLjhH+dk8EQzpaP5wx
 8zcxhJNeEwVtlXjuda4LX5wgTAdU/r41dAUF+8VxhjbPsGwb9MEB3SGRP+ub1KidM0G7OmzgOxL
 Pdqf5aONEA0B1HHXUzVT0f3xWoezcDHQ9+aN0WH1Y8XIU/+rBESk40Yy4NmG6SkcRXfbb4PVWdf
 uUqQCciAlh+qa/+T54g==
X-Proofpoint-GUID: mkdyizgijXwFU4V4AeVw9zOiDsYf_X_q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfXx14AAluweUuG
 2GPBTSs0HFzi+zaS5B9XFEtCC/Ck6LL5QovTh9A14vvT5V9ZeTR+ysxDAfJbNKbc3adqAXaG69Y
 7AsJ2poJry5WOgVRjuyznvLxQCVKPnw=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae98b97 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Dft2pwwzc1VQXl6WdfMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030029



On 10/27/2026 7:04 PM, Mukesh Savaliya wrote:
> 
> 
> On 10/27/2026 10:43 AM, Aniket Randive wrote:
> [...]
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index c41bfac65ddf..394e7287f6e9 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
> 
> [...]
> 
>> @@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>               tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>       }
>> +log_tre:
>>       for (i = 0; i < tre_idx; i++)
>>           dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>>               desc->tre[i].dword[1], desc->tre[i].dword[2], desc- 
>> >tre[i].dword[3]);
>> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct 
>> scatterlist *sgl,
>>           nr_tre = 2;
>>       if (direction == DMA_DEV_TO_MEM) /* rx */
>>           nr_tre = 1;
>> +    /*
>> +     * Recovery opcodes do not require DMA data TREs, only CONFIG
>> +     * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
>> +     * shared with SPI, verify the channel is I2C before accessing
>> +     * the configuration data.
> I think i have mentioned earlier also. gpi_prep_slave_sg() Not only 
> shared with spi but rather say, is a common function for all protocols.> 
> +     */

Currently, the GPI driver has only I2C and SPI clients, so I mentioned 
SPI specifically. However, UART may also use GSI mode in the future. 
I’ll update the comment to state that gpi_prep_slave_sg() is common to 
all protocols.

>> +    if (gchan->protocol == QCOM_GPI_I2C) {
>> +        struct gpi_i2c_config *i2c = gchan->config;
>> +
>> +        if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
>> +            nr_tre = set_config ? 2 : 1;
>> +    }
>>       /* calculate # of elements required & available */
>>       nr = gpi_ring_num_elements_avail(ch_ring);
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
> [...]

