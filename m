Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053380;
	b=Im244EOYqmVBmwviTaFJ9CTWDXvw6Ds6wBwbMgovps+eBnaDjRn22dseO7JDdp3K2l/p
	 1lsEWpj68AGyssQue4Mwa5wvKkMWWmZDj5rqWMZ2tFCTRH5VJir09rkyuf59yvMvelfE/
	 KiV+lgTO0DZcQi0gsSKANDvfSoBdFSxshIYM/jCOWqHeLsTRYBnjsjNkqNlXlnVtIIcxm
	 W5YMi9VDghuusQwlZzZhKTtjDN2OfxgzRO9sLQAKS4812oWR+15xXNsgFQGyG8Nforjrk
	 gEYwlUaetS9KSIZxZZsoyH6UXdK1R429JNCj1vx4CEA5qVrmA8tzRA/ItlbDq1qiRKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053380;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
	b=QB9ljVo/uKIJ8XkIQgIcdRjGsPcliQjpQFP9cnHB2KoQ1+ml9fga/9CeRoB3u3Js47vu
	 sR9zP2fGa5n5fGNzRWhVW1208OnsYA2Cm5r2YtnPjA7T5R6WCL1UV9AnHTaLn/q4Sg6yZ
	 OSuE+OYh5MYaIel8k6068c1082K0aQmu4CO6qI6kR/yzk9GzeSHdS3LZCRCtyfc+0dyvx
	 8BmwtzmL4o6FVuMlZgDVo42+0A3JAgAhSru1mmhJ73SKbjWnaknZ++GcjhI3iOCEDjPRC
	 ztFlv+GsjsJ6AoEXsJPAFhA2XOlqXdCQcebsF/0pWTmks84tDeQmbXETjqARkndvL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ8wpik8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRSel+Rs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA0606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECA0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ8wpik8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRSel+Rs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1Axcf1215816
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=; b=kZ8wpik8onPn1ay1
	52A6TCbS4W9+XlkiWdsPyfWSuxJj7taFv8LgkonOq98O4rWuoWz8Nskywf0+CrLg
	VejOGf2iQOhf8gpjiN6XJftitR2ZrrugxNA17yYMxnLojAVEVwHXMJBkO0+MH5ro
	0pZuwOchR2ycYmJ8u4TQNOzZISdcIHpP9wsWsb5FDiQXlfgjKEmc/njxQw2hZ+OG
	3xbES7Gy2pWxFPzN9uqTRq3PZQng1/S8NNlcw1wfeWa0yWhg1ybGsPHm876t8+VA
	usTu90r5khXpIGMcXXzsbZJJB3KdGv18wZMzHrQq3LQ8IlePiy5SCzC3c71HzcMv
	1jn17w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcsshk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:56:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf8ea208bso14867445ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 17:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795053378; x=1795658178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
        b=YRSel+RsA5y9BX+nbkOVpWjrHmslFoCpgLw3A5LE0wmU2r8IG5qukitVksQOT0pPs1
         pIKuYYrqcvPAFTKd/tmpeHoatibMttMSWTSafvoYmF19ejnhOd0mofIsIHblFTfnZNYY
         jSpMvc+1v3+eFXQoYrwayMsDjDa4bPaR6LiFdwTzdDuKNyuV72CNHbFIcam/PPiFzbU/
         qDJ+9ksFkZFqOl1juUTuSYZIFmOrK4dInnNhliYjYNqttwRSLFqyhcpBHoW3hTnzxhF4
         Ag/9yarJ1L7PUSaf3DB+ZYRNBWNRcDi79Crim+JR2/t373SgbKk11aRArWWK7qvXvwcp
         6AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053378; x=1795658178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
        b=NjyHAiQ4k+6UfI6t4udEVLA58VCCJz7zfP4PA66KMpwumuKVkyq00aSbvTO56qDXfE
         rpbWJWs9DIBBZoC0+5TqzN5hDtF69pDXcYhxS4X+wNPKrNmHBsXPvTU+LHOJ3i51sy1F
         1KXMUO0YqEGhTd/bOvnG+CsGe2ebM8UyusXcOROjnzOjjrwR7VehqpzIHWVg3muysrlM
         ytQJ1+mFSeiqMmmmgNqQv5jHbuBtmv7GkB7ztre6KHiRNjJB2OiPpaS9lLyGgEFcQfUA
         9bv+bDyF+kZVaCNfSGIzoYOWxM9C77SV8LpQG5mDcAJ/guqeqYseYocTKsaC4glhBdOc
         oHtA==
X-Forwarded-Encrypted: i=1; AL+hErHc7+BelFvGdzbp7KJp6gBKrPuHxYQdOT0/zAVsxuYJkYywP2En89rQilPtUcrScGgHzDkjJVYSA9rJv2Uw@vger.kernel.org
X-Gm-Message-State: APuU4Z92tdkvRxdQ8lOfBenYSE+SZ1ukTLbYSaf1TIV5Q+3pBVfZnY4O
	Ivr/9sf76LqhyZu/NC9y5YgRQTlgynBCU+aouaFJDkTt3GdD+ZckVkCdJA0VYrFPgvwJNyCgCLy
	QzMDOmmFb1LRbk9bXkM6IJGiZoEkZqjofDni5g5pIAJ49LYZAp7Mh7n8MNMPDr0gHS/NG
X-Gm-Gg: AYBFou3okC9tVgXx+z2D05uoQORIw4A2ky0o8S0GtwuqLw5od5EQpvw5+yymtq2IY4q
	LT5khibEf5gUNiW4gQNUgcgc4gu+3WgS7l/WNlsRQDvv/opTkgk086Nc/tb6ELN3pN8QCjM29pW
	7JdzrjVEbE06aEIOKEwlES5GInarotPcLb0RDs9G8ICkLKiBfHRvVsO7Clf34RPkAld/b4oi32K
	JqDqlHspoNhCy9m/MCgHRqFPDWZdPN0yHXuc6dodsCe8dHVO4lDNDF7dQ+x5zGO6bP2qU/q9zT/
	jNdp3vM1dSrBwal4aDq6YFT6ny/vpE/5AB8Pb8680H+w9+ydFk0WZMza54hNqScuVmfBtbXJdoF
	z9+whK9X0JDhO/czvC/XJi5w7DDFgSCAqDQ6Ch8V34ta5jYco4Vd8KopPWrghx5BpyvAnJYRkcs
	bh32It+Tm6VQljajOk2hLQ42IvsdpxYkKH8NMZ
X-Received: by 2002:a17:903:3bd0:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2eff72f018cmr37060905ad.21.1795053377894;
        Wed, 18 Nov 2026 17:56:17 -0800 (PST)
X-Received: by 2002:a17:903:3bd0:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2eff72f018cmr37060565ad.21.1795053377401;
        Wed, 18 Nov 2026 17:56:17 -0800 (PST)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm21473375ad.17.2026.11.18.17.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:56:16 -0800 (PST)
Message-ID: <d94a7c66-9dba-4513-9776-2aade1e74709@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 09:55:56 +0800
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
Subject: Re: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
 <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afe5742 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EU-12QLy5lNSyVwEbFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jtzpjjBxXZn24-sYCew7EQk1m61k48Xu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwNyBTYWx0ZWRfX4pwWZsEYw+CN
 jYgDVT2Y8EPTj2QdEZ0MkIfoh3nI2u+xYohSKZ7Xdu+5FD/EeMAxRCNf/aS3q1gJN1/uBEcCF80
 2HxELwV7JOoASxlala/fum8GxSiCmPifPZfQSBPdSb3ThvZxiD3XwtPFaoonsMI+Tr6ooDaWs8O
 wIDhYYSZ7casajjcDprpurVaqWnBnt5kny+lLwSiJgEFpsFKLawnPAhlZbYV7F9iqm1FM922keY
 CCkP/V1Z2ZW86cqJTZeTCCZ8mEpaSQcb2aHcsgkmSL6j8rSl2kZBc2FiyepLb5RyTtIxpWyvwmf
 /Y8KGna6b2A3Dv+wPyyQMz0661yqKxlMK6EPiR9mdTzY1GN0MLb1GCxCMKxZz6R3E1gv31uL+J6
 O6YfrCvhwaG+jsz3oA4+SzO8X/gnVonjHCv1dhMm2b3rDlc69xO178d/Y2XhubJmbAKgDBMqUjo
 PKQptioUgDKeZqkbFkA==
X-Proofpoint-GUID: jtzpjjBxXZn24-sYCew7EQk1m61k48Xu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwNyBTYWx0ZWRfX8SeiS1AmK4S/
 vSwpQn4h1DJUcDjt01vlXb1zGWlOiI8vvUePAXTUES4qtkME26HLpdXYw5T9H/PeAfcOKvjwUZJ
 cqNbhwxiukC4wi0sS13LVZCGL/PoUVI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190007



On 11/18/2026 7:33 PM, Suzuki K Poulose wrote:
> On 18/11/2026 08:02, Jie Gan wrote:
>> Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
>> etr_buf_list without disabling the sink. It returns the node of the
>> switched out etr_buf, so its synced data can be read while the ETR keeps
>> tracing into the new one.
>>
>> Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
>> done in one critical section. Otherwise tmc_disable_etr_sink() can run
>> in between and leave drvdata->etr_buf out of sync with the hardware.
>> Provide the sequence as a TMC helper, so callers don't need to know
>> about the locking of the ETR state.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index e9213f456834..5032f5598e15 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct 
>> tmc_drvdata *drvdata)
>>   }
>> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
>> +{
>> +    u32 sts;
>> +
>> +    CS_UNLOCK(drvdata->base);
>> +    tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
>> +    writel_relaxed(sts, drvdata->base + TMC_STS);
> 
> see below
> 
> 
> 
> 
>> +    CS_LOCK(drvdata->base);
>> +}
>> +
>> +/**
>> + * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the 
>> etr_buf_list.
>> + * @drvdata:    drvdata of the TMC device.
>> + *
>> + * Stop the ETR, hand over the current buffer for reading, switch to 
>> a free
>> + * buffer and restart the ETR. All of this is done with @drvdata- 
>> >spinlock held,
>> + * so it can't race with the sink disable path.
>> + *
>> + * Return: the node of the switched out buffer, or NULL if the sink 
>> isn't in
>> + * sysfs mode or there is no free buffer. The ETR is left untouched 
>> in both
>> + * cases.
>> + */
>> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata 
>> *drvdata)
>> +{
>> +    struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
>> +        goto out;
>> +
>> +    list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
>> +        if (nd->sysfs_buf == drvdata->sysfs_buf)
>> +            curr_node = nd;
>> +        else if (!picked_node && nd->is_free && !nd->reading)
>> +            picked_node = nd;
>> +    }
>> +
>> +    if (!curr_node || !picked_node) {
>> +        curr_node = NULL;
>> +        goto out;
>> +    }
>> +
>> +    __tmc_etr_disable_hw(drvdata);
>> +
>> +    /* The switched out buffer is free again once it has been read */
>> +    curr_node->is_free = true;
>> +    curr_node->pos = 0;
>> +    curr_node->reading = true;
>> +    picked_node->is_free = false;
>> +    drvdata->sysfs_buf = picked_node->sysfs_buf;
>> +    drvdata->etr_buf = picked_node->sysfs_buf;
>> +
>> +    tmc_etr_reset_sysfs_buf(drvdata);
> 
> Why are we doing this, when the following __tmc_etr_enable_hw() already 
> does the right thing ?
> 

Sorry I missed the part.

SoC-600 supports save-restore, so the __tmc_etr_enable_hw will program 
the registers properly.

SoC-400 doesnt support save-restore, driver doesnt need reset the pointers.

Everything already done properly when the driver re-start the ETR.

Thanks,
Jie

> Suzuki
> 
> 
>> +    if (__tmc_etr_enable_hw(drvdata))
>> +        dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
>> +out:
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +
>> +    return curr_node;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
>> +
>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>>       __tmc_etr_disable_hw(drvdata);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 7c604b9f92e5..30b15c38b080 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -212,12 +212,15 @@ struct tmc_resrv_buf {
>>    * struct etr_buf_node - node of the etr_buf_list
>>    * @sysfs_buf:    Allocated sysfs_buf.
>>    * @is_free:    Indicates whether the buffer is free to choose.
>> + * @reading:    Indicates the buffer attached to the node is being 
>> read by
>> + *        the user.
>>    * @pos:    Offset to the start of the buffer.
>>    * @link:    list_head of the node.
>>    */
>>   struct etr_buf_node {
>>       struct etr_buf        *sysfs_buf;
>>       bool            is_free;
>> +    bool            reading;
>>       loff_t            pos;
>>       struct list_head    link;
>>   };
>> @@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>   extern const struct attribute_group coresight_etr_group;
>>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int 
>> num_nodes);
>> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata 
>> *drvdata);
>>   #endif
>>
> 

