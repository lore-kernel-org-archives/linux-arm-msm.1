Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485833B47CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893906; cv=none; b=ObgwwS1d8Dg6j5tmHYktz00lGfyBjP5xWjqqKBTJZe6Jjrb5skGZQA4k9q4hAPA9Qsm8di1URR/azqyLTB5OGrBM4vNAeLuVZWxAighmk3BojEHQYihF1YnFYp3rIauF/baOlJRRYbA4kGSqW+Izx10REBqjY2t/LlL2l3Cv21I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893906; c=relaxed/simple;
	bh=2df76Hq1fxBJkUDL1GqgSU3U597vIsWYXqTyKxN0C7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9cVF6veQu3/UN1AeLQ3+hbu8jAqi910IhJFM3HXayvlnoUYj7ewE0JuOUzYa7jed6yX4QAcZJPjR+E4Z1n0KCDcNBUiS1W0zqTkYCz+AjHLqd6o9WoPArv+Nd4+Sw6CW4+QQWg5diGJ7rvamD08cgaDL9c+yjX0j67rxeRhkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hjpa91iB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfBh87BA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjpa91iB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfBh87BA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADXPm2478951
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpZOZUVSR3UDklXHUMfaZKPc+pQ708EZRHqKjSg4d6A=; b=Hjpa91iBL8e3pFrr
	g029iHhLQj2k3izfJVS8ER4xIWYUqIaxiNzQZ2q+Gmso2VC7axTnmiB4P0tCtfbd
	FIBtvy1h5Jnv7YwYqsylfwp9MS4OOi59PwQTSd36MjCGX4d2hoj6fFkiWBxQaD+V
	aMV6CoBb+noE97ydqmw69S+WxsKlOsi8LdZD9c5soAKWq1rb4IuBD/eyDy4AmNF6
	79yJdWOF72n5B7ZPQDdBiAksux7ra0JESZ4jYzDr9Gza/Nd2Ig45TLJ82sUGfzzQ
	QxNDvMNa5PPxYRHuWx5EZWumD8q6NVRMXDCi622EyI5UU2CoEQACybNZGTVS9UT5
	/Oej9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx9abf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:51:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc8bde6318so6609405ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893902; x=1785498702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpZOZUVSR3UDklXHUMfaZKPc+pQ708EZRHqKjSg4d6A=;
        b=dfBh87BApXooVKPurjXIuNvRQqjGza2XJrq0l2QljUieTaKp/3LQpJ9GvCM1u8w2XU
         8bWIrZwP33E6M2FFLqU5yvnZHjgLm4rhSe5NZhXBCFDwLxCXhqz7WFy9qhTkAxCvh+ja
         vSn9TSS+K+7PVI8jXbTPzHGg8mGWBUwBSswH6VSS3uIijmUet83gTshOw6DGYUcggrMM
         pyGMXIa5Kt0985Nk/J52Q93+9ytHjE/GSe2Mui94qzlBNcio/mYudrK5DSjceb0/Xdqk
         ZilgG7a500gZHd7+wKyjMbQ3S2c2DZZfKcncP8ek+7/PLDp0xMANJfc/ttxJY8xdiVwz
         Lhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893902; x=1785498702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpZOZUVSR3UDklXHUMfaZKPc+pQ708EZRHqKjSg4d6A=;
        b=Oc0bl4LkiyZXznEtSwFgpVe9B5anSZ7US7HMofdVqSy9qQhKzvwqRtLvnmrh83DFtH
         01UeVV9hd5/Q3Fo7pCHlGSECNaLq0ZciNQvsYUd77NQvOER0fPA1zahSW73eYBQvDo9E
         1/vWNhJbaou4AjBgj+kQ9jHzgmGuJUQvlYn9ZadjAu4d00xK04ERvz5/srUEIwHkgmNE
         PdpINIwbSVOiUDGLEl7RHjNCWeTbCJWcVRt/uKGATlBoBLOG9+xcgjf6gV22xXCoCzsE
         93y+YtAPYkAcNQNjvhUUy0HPpS0ctt1/J8SqV0RSPg8UaGQN9UoPrHNlf/UDOtqkVyaJ
         RjTg==
X-Forwarded-Encrypted: i=1; AHgh+RpuQqjp7IEshnYz/1KdCEA7/SeM6K3PCt780561iDAW1Zs8jJZZLj0D7IxNAy7DdiUtymKF1yzdQrCalBU0@vger.kernel.org
X-Gm-Message-State: AOJu0YwckI1ZQzOfNX736ICtR7V9wH1xJvs5Lc5kLsRQpMixIxExorlU
	i/r5J/MAGiW+YWjghJhP9xYV9JHkgzrXF3rly61SRFk9dgloe5nEYIR6KTmSlLGyF2gzPyFLbwm
	Q3ILxbFyK9zYYPNmpfJWKIx+gL+a+YV0QXxyD7uK191PqXYxC+hQbsaA1kqXoomnbIaGxgAtlYd
	g/
X-Gm-Gg: AR+sD13fWa+T4F1TwNqttgoI+x22gkJmGLaR7nX7nfKdDpW54Tt/0EeuvsaULi+4p6/
	CStEe2FWo8KHHaPLN/tB93kqMuz8fajmlUCCoguc3M06w4pqEpabQ1xLkBA6NqfcI081hKd7gA5
	9FS/NmcI9DQfvgYN6itipRa4O6FyWO7NGdjcK/XciM2UpHmOt0tHu53sV9cs+gG1PNk7XbW56BK
	WHaaJa5mhZAu3rvpfIEA+TkYSAESFUBsOpngpqS8y1q7bUXE4LOdqjqBhAQAFViUEn2WpUe3rzY
	OdIZGiiqOPMFQWH99GUIectcfL+1FLua2OKB/C/xEQYlIcxP2gd1IuDeGCp/WK6qt37LuLFDPVD
	vx0hfTfOjTM6iiRvZYVIZv9BhuiMF2D5D
X-Received: by 2002:a17:903:2c9:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2cfa71cff69mr90799995ad.47.1784893901816;
        Fri, 24 Jul 2026 04:51:41 -0700 (PDT)
X-Received: by 2002:a17:903:2c9:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2cfa71cff69mr90799645ad.47.1784893901291;
        Fri, 24 Jul 2026 04:51:41 -0700 (PDT)
Received: from [10.217.218.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f35027dsm50225835ad.69.2026.07.24.04.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:51:40 -0700 (PDT)
Message-ID: <6427bc6f-c7a7-4b9f-bfda-be45233be874@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:21:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-2-671261b05c61@oss.qualcomm.com>
 <2b025902-8879-4426-bc81-484fd9553aa2@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <2b025902-8879-4426-bc81-484fd9553aa2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sXel3U5L2HcLst_D_vmR1acomE4nfAiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfX5atxrI3tjePU
 B0rG4N1iNZ8ME/eQjOo1rXpWU74VmO1g7as2jQntIwIscepAphPWG1m3ajSPne4lvHH8MsKXgQA
 RNpmnBIFel6X1JUwTSVn+TjDybYLm+8sEjorZMjK1ewD3A2J4ODzmGH6ague3DldiHoT9nvoHHq
 /KQI+ymoImHlw2/ruRH8vUxZwkk8GJKwvKWtpOzDmq/QzkOtEHO9EUCk2BuKxQ5rUw04HXotEN2
 w3F0XYcpKgJihKEZB3+Fx9Q5d7FIBUVdc1DnIH64ssp7G3rCopOUPH4fQe75x5yAcldlcZ9au3o
 io4bPxtScNzZ+fuhOXVo2VCeKy3HDZbnsj3w1ianzA4LInlAult6Nh8NsOKGpRSAJVC4QjHgxps
 EfJws2FR7fBigRotV88JPatJpFqBdH3QZzON9uGs59gwoqBWH8QGdP9uUNyzx+AxRmI9I3nMjfm
 sREjhR9GYEaM5jhe3gQ==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a6351ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=nXjxGClAYc_vj5dcU8AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: sXel3U5L2HcLst_D_vmR1acomE4nfAiB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfXxnbPFJztauXe
 GWl4oy1dG+WVtsM4AuBShkRblpoZY37B9pJbg7bD5d2FszEVsD51sz+V8xOQNeuQph9dAiP9rB1
 qZbBVfhGxOsIH8kGyH1qtJZiCIRS14c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240108



On 7/22/2026 10:56 AM, Mukesh Savaliya wrote:
> 
> 
> On 7/20/2026 5:11 PM, Aniket Randive wrote:
> [...]
> 
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 37 ++++++++++++++++++++++++++++ 
>> +--------
>>   1 file changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 96dbf04138be..d6fab3aa8468 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -74,9 +74,14 @@ enum geni_i2c_err_code {
>>   #define PACKING_BYTES_PW    4
>>   #define ABORT_TIMEOUT        HZ
>> -#define XFER_TIMEOUT        HZ
>>   #define RST_TIMEOUT        HZ
>> +/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
>> +#define I2C_TIMEOUT_SAFETY_COEFFICIENT    10
>> +
>> +/* 300ms floor: budget for clock stretching; slave may hold SCL low 
>> indefinitely */
>> +#define I2C_TIMEOUT_MIN_USEC        300000
>> +
> Let other expert suggest if pass from DTSI or hardcode here. because 
> this let all other controller drivers to make change. I request to 
> conclude on discussion, i kept my point in earlier patch.

Sure, let's wait for comments from other reviewers (Wolfram, Dmitry, 
Andi) before concluding the discussion.

I have already shared my concerns in the previous thread regarding 
keeping this policy in the core versus allowing controller-specific 
configuration.

Thanks,
Aniket

>>   struct geni_i2c_desc {
>>       bool no_dma_support;
>>       unsigned int tx_fifo_depth;
>> @@ -471,7 +476,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>       }
>>       cur = gi2c->cur;
>> -    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
>> +               I2C_TIMEOUT_SAFETY_COEFFICIENT, I2C_TIMEOUT_MIN_USEC);
>> +    time_left = wait_for_completion_timeout(&gi2c->done, gi2c- 
>> >adap.timeout);
>>       if (!time_left)
>>           geni_i2c_abort_xfer(gi2c);
>> @@ -513,7 +520,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>           writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>>       cur = gi2c->cur;
>> -    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
>> +               I2C_TIMEOUT_SAFETY_COEFFICIENT, I2C_TIMEOUT_MIN_USEC);
> Expect some discussion or conclusion from other experts if need to hard 
> code these coefficient or pass from DTSI. if core can read like existing 
> i2c_parse_fw_timings(), it would become generic to every i2c adapter 
> driver.

Agreed. This likely needs input from the maintainers before we finalize 
the approach.

Thanks,
Aniket

>> +    time_left = wait_for_completion_timeout(&gi2c->done, gi2c- 
>> >adap.timeout);
>>       if (!time_left)
>>           geni_i2c_abort_xfer(gi2c);
>>   [...]

