Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DF3B71D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173520; cv=none; b=JEsHwao7wcjbrBGjx+Z+raHSb7CkqN8yAqM6PEklhJ/bhLPlDthVKPs/jZqBWM/nuEGJ5wzfPx0dSDENIsGP2RkbqV3/IBGaWISUHpp5ctNGYgE3Rm9qvj4K52PDS0iGdJKSErhJI3WCD6G0awCTjrYDtAEEsXDB/FJh6bNdQco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173520; c=relaxed/simple;
	bh=qk39u6giMz5HCixucodfTQ/SWhISR98GQnSlcZHqQw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMKGMUIldG9bsOocUDdpGTZeeB8p4NykhR4xlXGZQ47UwLvidyamBTmTmpR6gjPCMIFh+WMfuI5NDg4l8thAdZn3TS5t0bYleaGpwep0RdHXn3HmVpyuLKH3QHpEOKQSpeGfmlk8VNLXbxPKXaC6HU2QMonMgHP41cdA4IPLtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VERNy5uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIC8ZlJs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VERNy5uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIC8ZlJs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8t8U53215098
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAN6CqVnAIqBWFw6JFSsaxau/8huoJf3sBdP1IluoIk=; b=VERNy5uoMOKvCQTb
	lBGSB4LgmPef3BnexlKohkidoWuvD18FZxmP2GY/shC8heASZSIe4GfsWTjUcwSC
	0SZ7wA1idBUM1InXb+SUDpD88ZReJXbw0PjOkbE4yiSPHkOX3DRoB6cccHBzk525
	HsJtkXgGj7xgJMrN9nyhyBQ0WIcRjp5JYTbFAIK9AyrSQsyj1QRga19dtF+y3ObA
	aI6EUT6cjrTcHNdque3yMGx0jiEwLkoI3ypr3eIj5kdRCPHxSG+r5pA1tdtz2i9C
	BxuJHxFeUaoHdsGIgiKyQ03Q/JEH9FQ0JPvYgxrFxJ46UyhbOBKVr+t7rOTBe52x
	360hcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h90ehh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:51:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1669684a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788173516; x=1788778316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAN6CqVnAIqBWFw6JFSsaxau/8huoJf3sBdP1IluoIk=;
        b=XIC8ZlJsO2jZHaH0HfSdWJ+dpYe3bFshn0S2P+mD0mzAfRj4A4H+T3AbVawvfyn/x8
         plmFmj8Mesvo1goNlasXgFKn4bywCegMjdMKcb46LLLgAibiezM9xKwTnMYrVjxAEvAu
         mAs6Vgusmi0y0F9Tbq/BXjaQ/kqz6qfeO/7J8ZDx2lgdPHrXIjoY0ribcfOJqB60uMs6
         JgoTLU/7EuguXMEv+ZzK6qvbexEf2rZkZ4Bt5WlUBZNFQQi5YVO6s0aE3jBBawflUfH2
         XeyRj64oMkOFs5gDmzvSOF6OtzD4cIXL5MWLAOE9iLZ9Ky9mTQ0eL2rrJ+0MiH8JGFt5
         ZfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788173516; x=1788778316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAN6CqVnAIqBWFw6JFSsaxau/8huoJf3sBdP1IluoIk=;
        b=duK6lpiphQywVsoMI6DCDO8hnSj9pzrnWRilxavnbCEeZqq1AXq7ed+ky3uTZAGBpd
         O7lEylikcxZ3AOKxbGBmjldq9SBFRj9Nr/iF9JcO0kNPo/hEMRe6WbKURcg89j2qhmYl
         Mualx1Jow7Hd71BDaEM8ulR40eG77pIcMxvtg+QNcg1wTpv38AvAXd8e6cwbE2Ya7Cmf
         tHF4aQwa4lH3p+23P91++Mm5Tvrq9C+qAx7aXSyA09NxIds2WwIs2rqftuYzqlMLbLAV
         +tOf9gzw2msrzNggXlqjKRqA1B6ihDL5UZyIdgXFQdjSId7Iv12K3yCIWzjbJnUNm4N2
         aGFw==
X-Gm-Message-State: AFuF++kjF9412dy1fv9YrtOOz68UCKaI8DyAOjPfug3I91lWh+aV6uQP
	3lezsNdsqYKf0632wjarfooK8gFA83+hAUm0nfHbMikrAj77StXd1uZFY5hwpZSHNbM2Z/G+h7a
	DWaPSX8jOx8rqMIMHkC3Wm4XSoVtL6DHUJVch19xin4nUTgrEtTM3+QkIgCEsXe1umnph
X-Gm-Gg: AYBFou0K6akROswFAGhmgItz0FRvRHoMZ1YTVD8jjzgjszYqSgelgWf1s3gpjU7WnW/
	exWd9DTIGBXaKXMnHN7HxX3S4OwH5FwEV9fUsbgQuWOzNsl/5lR/rzi/7uMGPlwNN5y51nh2M09
	SS/t4VDVRTQh1L12aCGKQdHJgeE0y2RZf5hfDVG0S+nsPg3RdsIb5egxy933YhYSRUX5cB/H5vK
	kdTk7Cl3uIN+GSe9ceBGxNJ8TASdFqM13i1HYV0MdvcYHuitKaYTpgjmGzc3BuIVaXkGoG0Bf1D
	Hc0WWWh2tUATFfYzvGwgz46BxffxkU18U6fG9+GHFtTKd0f/2qpY8pIYSTfHv+7Ch8yT9CbdjFy
	hFWC3LKtRMhZDaNZrYn9WyV8xlgOoxkVGdg==
X-Received: by 2002:a17:90b:3889:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-398da8d5422mr6442415a91.31.1788173516031;
        Mon, 31 Aug 2026 03:51:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-398da8d5422mr6442374a91.31.1788173515514;
        Mon, 31 Aug 2026 03:51:55 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm15177273eec.2.2026.08.31.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:51:53 -0700 (PDT)
Message-ID: <2aaa53bf-54d5-48a7-b4d7-8aced3d93726@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:21:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260828-master-v1-1-1f8afa5f82c2@oss.qualcomm.com>
 <e16478f8-6b56-4e7f-b4fc-7c434045ec96@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <e16478f8-6b56-4e7f-b4fc-7c434045ec96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a955ccd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jtoOUyuUrL730116TwsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wPwAFlvZ_zyf7VFU7jRRrIYbfV-L2YCi
X-Proofpoint-GUID: wPwAFlvZ_zyf7VFU7jRRrIYbfV-L2YCi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5MyBTYWx0ZWRfX3rdb2Y6o0oEP
 dRyBezX/LfwZ713jrWkkhqSjQilMjipl6Zzzka7lypn1FoZuZG3KpG4xD/z03no0Me4Vj5c2Qyw
 C7oITJV9mYP+TNvio6UikRUxeivGL14=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5MyBTYWx0ZWRfX+rCdSTmq8Z7b
 Li6Rh99pinjMv+oCO35hQ9B0WCaHQ587ZTPPzx5+xewSyK5hJQPAD3YnUXMrls4hVvi2nUdptG9
 cHG26xMGjBhRlJiynvv7Wrm+uYuvOqnmDrk90XKcuvY/WWgRjz1FIclj2imGed7ua/uYu6pEJCu
 wDZxhih81Mjw6HQN3tCeYUPwaVsDLD82m/ere09/YTnoc59hKbzQfxLJimzjNmgclJI3FQQqBof
 TTcAJ3C8BWLzCf6bLNVF5+q9gavWnxLry1+LE2XevpAP/tbvRiyzAT4b84734xfVSdsongCofsf
 zOvg7i55aBzAYTqIGQWvDaUp+8q5JN6jF0lyMlHw60h9xWEPJKw384+mSNsu2sRFO0RyvvBrF8R
 oLQo8yvrzrj7KEpZxOBuVwaseFrHrTUDyvWIMgXmd8ULqpxJGws3UT9P5vkxbM2XOQwihIMpzm9
 0LBRP8nIiVkwawfU2Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310093

Thanks Konrad for the review.

On 8/31/2026 12:58 PM, Konrad Dybcio wrote:
> On 8/28/26 1:14 PM, Aniket Randive wrote:
>> The console port uses a fixed line number and is not allocated from
>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>> line number for all ports, including the console port.
>>
>> Skip ida_free() for console ports so that only IDs allocated from
>> port_ida are returned.
>>
>> Also release allocated IDs from the common probe error path. Currently,
>> IDs are freed only on the wake-IRQ failure path, causing leaks when
>> probe fails after a successful allocation. Move the ida_free() call to
>> the common error path and guard it for console ports.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 3633723acef8..3bfe597d2c83 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1979,7 +1979,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   						port->wakeup_irq);
>>   		if (ret) {
>>   			device_init_wakeup(&pdev->dev, false);
>> -			ida_free(&port_ida, uport->line);
>>   			goto error;
>>   		}
>>   	}
> 
> GPT suggested that the failure of
> 
> ret = port->dev_data->resources_init(&port->se);
> 
> should also be updated to have a 'goto error' rather than a direct
> return

Good catch. I will fix in next V2 patch. I will route through "error" 
now so it goes through the same ida_free() as every other failure path 
instead of skipping it.

> 
> 
> also that in get_port_from_line(), reordering the devm_kzalloc before
> ida_alloc_range() would prevent another leak

Agree. I will reorder it.

> 
> Konrad


