Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F63CEB84
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693278; cv=none; b=GxoVb5fGutIypvMeDvvuYhBxhw15I2Noqgofd+ribZas7SVr8tKjM/N+wljdLQ4O8Ro2ikuTJlEgJE3SU5jCn3JO0ZY7PsCBf/kLNSqIfwKClDf+w1BkW6Rox48NK7uzU+H+VqoqzjMTPn/7hujh29D1GGKdL1f2Yvgpv+c7sqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693278; c=relaxed/simple;
	bh=9SKT8aCCZY1wl1FsCgxAjHgW3cDtqMvlQ2rTmIB8m8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yv8DFqGvoq2D5YHVrIeHtdomW534D321LunlfjNAKruMp0I2jWKsqo1lOgG+Nlrri9pidwv0kWbmVj0BafgR6v4X0RuWWlabPMyyi8Vj1pqx/7on0w3/K2LKmu+C7UjFPkV5p/31Ba23/dK/WyFXkFNTB9FArsuuQyLXsAXDk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euxQOPdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqRQCNd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euxQOPdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqRQCNd7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqZsK3936567
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9XZoXTwGMQVNET7DHE0w8OqTS0H7fU7il6Xp1aiEII=; b=euxQOPddC91dGmmT
	7hupFBv7I1+SE8J6KCL5zrClHp47OmJpFkXWr0QMLZ4b7r7sZsmfbSUFKGIDT9jT
	oDIIhN2B1A5PCBxWMUnZiDvn2epimyRZwYJhzji9mEf0r2ux6GaV2it9GT2BDVeB
	ztIp6gmTyJoOmWFQjsjWyYP/I2el8+v2DpXw58H/o0VH+caDGqxwaju/TfYkq+wY
	Gt9CI2rW9Te2DFZ83HOVz8QQ8y009C6PzPuO1/Y/xfEQWjxl9FrCfAzo724uQvZv
	iMVvjISzo/sxq7r1HGFefW5YRU6rLO+RCDL3GOTmCLfeSpaa9Z9sbBbW73kbc8pK
	qRDGRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1h3dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:47:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so665659485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790693275; x=1791298075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9XZoXTwGMQVNET7DHE0w8OqTS0H7fU7il6Xp1aiEII=;
        b=OqRQCNd7BBKYsJ9QqRW9c2d9uMSc7B5gtS8kZXs+GK6j98s431Vqq66S5TwLw+8GnF
         m4vndqmnqZOHwWMN/QWX0TcMk6fsOJ3hL+Ce99pUwqifM7JmV0y4K7U7vTIsID3VF9im
         DkaNb6uqsA1GRlQ+2Wk9L24gqjujXUERbOXJu5Xz8GEgcjXstKL/ZejAX5bKuPkIKezf
         QFZawTvgCWKqhHoDuVbdpnVg6SExxMFU4F32EoygomaCHR1mwv5/3X3+p85rmeIsqO4b
         s2daR/zCe+OhJCyTmd3UpaK2HVCAMwHy68jufmOCm3Mf0LG9WdBgk4s2DiPv7LkzUfnt
         TK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693275; x=1791298075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9XZoXTwGMQVNET7DHE0w8OqTS0H7fU7il6Xp1aiEII=;
        b=fBceplcaVrwWLGq/yCo5k46mZMgsgfSfJDFdy+zsQmeX1CrDHYI7/jqw9wSMbw2Msw
         LDX/X6bRJLK8FlaaThPjF7PRJG+6PcUJBkQ/uvatBOzH7MJfFvplverWID8+VQuQ4ki+
         yDGgGtwrpZtFPVwPM9dOAUChEc9bJenIRO9yryLBymOdetavKScf01QZzGQ4YTMQsuo3
         oMgZ/jp7463yR1DkzR9img8DVzZu0FXUE+sVynS0e1C1FWIaF72eWNib6Jknbzahdl23
         nFwbvIsFAK/SchlsEQnMn8hggC9OIptRerRx0ezcFBGVz5qMVaWxXe1z1ZKlXxPosfLR
         PUVg==
X-Forwarded-Encrypted: i=1; AKwUvBznPyklkcoLjvCNdKg+SzGm9EnpBYiaxTbSb+Y1xLoLyYvJc3D6kSHFzuXND7n84K2/Yenb3SiY4l6lX2ZC@vger.kernel.org
X-Gm-Message-State: AFuF++kBjoeuA9KkWCp8LulTv+fPgrlNQUZ00urPBUhiQY0Gj14KSdi5
	tYGXyoxsCkVuxzcii4kgI7ch8fkgey3Kp15n+gSYX09QdVBawCU1Urukur9x9MFwCdTjEGggvAE
	Y0PcAX7/UhKZKrxIce+Mb7htNzl6JVN2PdT3BkencXHoWjsZirKo2Huz77msbID2Y6Biz
X-Gm-Gg: AYBFou21y6n8imPLHnAmUOzA2g5GQ05m0T8G9rJRo7F0U5BJMi056yCq2pp+0rYTHcO
	ewn5rj2ps2OrNjFpjb611O5opbWlbA+5CqOXOv3K7hOBY1l/XrdPOSMRuExR2WF/jo+PwSf/quH
	u0Z1jEekvI6qa5Omog00GI3oxzvvs86TB22BTJGYHTqDF5QVZYNdIs385XNbG4Sy0yx4U3VJUM2
	c/qEHVi29+OI37zdC9AHcrZ4R0USdCca3jk2jchNwAsBBWJgFoBPjGYutH5LAij1N3UtFEI/IkT
	ixBd1wEo0sRUKb4tAjJgYSj9DwvU+rVCKXXFjuCwjBcDP1emVD8imSSFL7DnnmYDF0cDcOBXmv0
	X/BKKbZFi7IeY87Z2QwK0bUcxSC5yzynWVtFL
X-Received: by 2002:a05:620a:7004:b0:93c:5f3c:f482 with SMTP id af79cd13be357-93c5f3cfbd3mr2120476985a.33.1790693275012;
        Tue, 29 Sep 2026 07:47:55 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:93c:5f3c:f482 with SMTP id af79cd13be357-93c5f3cfbd3mr2120468985a.33.1790693274302;
        Tue, 29 Sep 2026 07:47:54 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c81423acasm407409585a.27.2026.09.29.07.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:47:53 -0700 (PDT)
Message-ID: <c814c340-9973-44d4-a555-ee734cc613b4@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 20:17:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
 <aqlQ_y-um0yqo6jj@SMW015318>
 <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
 <b60b699e-7921-4a5c-b110-50448e660f44@oss.qualcomm.com>
 <arqVap3Ky6vJEhRt@SMW015318>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <arqVap3Ky6vJEhRt@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OCBTYWx0ZWRfX6thWVQwKIx8u
 QOv3QDhy+uax47mmMaxzpZPbGVOvAJoznMYMd9d0KBMOrNndLpUtNOsSc22ql8FrnA/3VWriU9q
 WxjX36A4ACvd+rTjB5Wv4pdRQiE05ZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OCBTYWx0ZWRfX/c3nieVDdNKj
 RJC3KvWURaVW/oUBmLPnzzBobV/RJMfQo1N1HuHFOpsoJ04vfGPyRPmmDneq4TMnJrnNbvGKwNV
 fMp3NfDDzZaEgjKpREGQXzwKKmtkeiFCOYOTTe3QAWA1xi2eu1oZe6Wp0Q1ensjGcqmtXzyYmup
 AYmficrkkT3Kuw43a7J72ZFRiLzrEL0yXzIHYgPhVbokTuGJTrrLT5PlZH/btwBpwh9GAqIrejt
 fbq8t7OiGUxubmgiltL/omRaXK6okLE9CGF0XYI1M5vtwOcDV51uYOUe8dnYLQ5BVGWV7G4GJ9v
 V3VqRUCfloaGc46eX6WGlVLA8zYmrw0aS4dgeCv8Dz/LTvFX/v+3P9FHvXVUadffFyOJkxmo+Wu
 j+oxuPo0CVtS1r6ixcHtbIsOiHfguMThGCOu1VAiM0w1R0RwI5Be7gJU4q57e4e6uzKIBp6z5QV
 aajPBQ/qbjLsfS6SPIA==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbcf9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=OWrbcomlJjJMdB3O3y4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: ZzoFs1HVPpE2GYsXKUEqK-cihj5wIb0t
X-Proofpoint-GUID: ZzoFs1HVPpE2GYsXKUEqK-cihj5wIb0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290058


On 28-09-2026 09:57 pm, Frank Li wrote:
> On Mon, Sep 28, 2026 at 02:38:14PM +0530, Vishnu Santhosh wrote:
>> Hi Frank,
>>
>> On 16-09-2026 08:30 pm, Vishnu Santhosh wrote:
>>> On 15-09-2026 07:36 pm, Frank Li wrote:
>>>> On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
>>>>> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
>>>>> interrupt, which overrides the trigger type specified in the device
>>>>> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
>>>>> to the apps processor; registering it as level-high causes the
>>>>> interrupt to not fire, resulting in missed DMA completions.
>>>>>
>>>>> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
>>>>> trigger type already configured by platform_get_irq() when it parsed
>>>>> the device tree interrupts property. This makes the driver
>>>>> platform-agnostic.
>>>> where show this? can you point me doc or code?
>>>>
>>>> Frank
>>> Hi Frank,
>>>
>>> The BAM driver obtains the IRQ through platform_get_irq():
>>>
>>> bdev->irq = platform_get_irq(pdev, 0);
>>>
>>> in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1270
>>>
>>> It then registers the same IRQ with:
>>>
>>> ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>>>                           IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>>>
>>> in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1335
>>>
>>> The comment above IRQF_TRIGGER_NONE in include/linux/interrupt.h
>>> states that when no trigger flag is specified, the interrupt uses the
>>> trigger type already
>>> configured by the machine or firmware.
>>>
>>> https://elixir.bootlin.com/linux/v7.3-rc3/source/include/linux/interrupt.h#L25
> Thank you provide it. Kernel doc or comments may miss match actually code
> Do you know where exactly handle IRQF_TRIGGER_NONE as what doc said?
>
> Frank

Please find the detailed flow below.

The trigger type is handled in two steps:

1. platform_get_irq() looks up the DT trigger type and stores it in irq_data:

bam_dma_probe()
  platform_get_irq()
   platform_get_irq_optional()
    platform_get_irq_affinity()
     of_irq_get()
      irq_create_of_mapping()
       irq_create_fwspec_mapping() {
           ...
           irq_domain_translate(domain, fwspec, &hwirq, &type); /* L928 */
           ...
           /* Store trigger type */
           irqd_set_trigger_type(irq_data, type);                 /* L1001 */
       }

https://elixir.bootlin.com/linux/v7.3-rc4/source/kernel/irq/irqdomain.c#L1001

Type as IRQ_TYPE_EDGE_RISING, taken from the interrupts property in DT.

2. request_irq() uses the stored type only when the caller gives no trigger flag:

bam_dma_probe()
  devm_request_irq()
   devm_request_threaded_irq()
    __devm_request_threaded_irq()
     request_threaded_irq()
      __setup_irq() {
          ...
          /*
           * If the trigger type is not specified by the caller,
           * then use the default for this interrupt.
           * /
           if (!(new->flags & IRQF_TRIGGER_MASK))
              new->flags |= irqd_get_trigger_type(&desc->irq_data);  /* L1495 */
          ...
          if (!shared) {
              /* Setup the type (level, edge polarity) if configured: */
              if (new->flags & IRQF_TRIGGER_MASK) {
                 ret = __irq_set_trigger(desc,
                       new->flags & IRQF_TRIGGER_MASK);   /* L1719 */
              }
          }
      }

https://elixir.bootlin.com/linux/v7.3-rc4/source/kernel/irq/manage.c#L1495

So with IRQF_TRIGGER_HIGH, the check at manage.c#L1495 is false, the DT
type is ignored, and __irq_set_trigger() programs the GIC as level-high.
With IRQF_TRIGGER_NONE (0), __setup_irq() takes the type stored from DT
in step 1 and programs that instead.


Thanks,
Vishnu

>
>>>
>>> Therefore, IRQF_TRIGGER_HIGH overrides the trigger type associated with
>>> the IRQ during
>>> DT/IRQ-domain mapping, while IRQF_TRIGGER_NONE preserves it.
>>>
>>> The Shikra DTS which is still under review describes the BAM interrupt
>>> as edge-triggered:
>>>
>>> interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>>>
>>> This driver change is needed so that the DT-specified trigger type
>>> remains effective once
>>> the Shikra DTS change is accepted.
>>>
>>>
>>> Thanks,
>>> Vishnu
>>>
>> Gentle ping on this patch. Please let me know if any other information to be shared
>> from my side.
>>
>>
>> Thanks,
>> Vishnu
>>
>>>>> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
>>>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/dma/qcom/bam_dma.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>>>>> index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef
>>>>> 100644
>>>>> --- a/drivers/dma/qcom/bam_dma.c
>>>>> +++ b/drivers/dma/qcom/bam_dma.c
>>>>> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct
>>>>> platform_device *pdev)
>>>>>            bam_channel_init(bdev, &bdev->channels[i], i);
>>>>>
>>>>>        ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>>>>> -            IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>>>>> +            IRQF_TRIGGER_NONE, "bam_dma", bdev);
>>>>>        if (ret)
>>>>>            goto err_bam_channel_exit;
>>>>>
>>>>>
>>>>> ---
>>>>> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
>>>>> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>>>>>
>>>>> Best regards,
>>>>> --
>>>>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>>>
