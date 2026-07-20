Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADDF314A9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542757; cv=none; b=O4u8ogvbrzrze2WW+ixpl1KtoaL58nkAv1urkp/xcxmMZBq/1a36QK/h8fTTST9MQHgn1FIWBDq87jT46j7+xAFOQq17prXPbc3+0kkzx+AEDz5f3EFHU6k5JHj7ueZOnxus6njkcPPvJ+9QPz99aiUy8mZd4WPKDdcOzeVjjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542757; c=relaxed/simple;
	bh=yapMXRgqm8On8wZD3Y13ylERRbelSnvEypyi9xq1P1o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hyrOS9b3LR8aNXnPxOG3PHbry8vwdVY0ahk2kMXjzVoOlev7t+Euv8ruOA7bMkhwmXIbchIiaRO57XgbctChA64vsdK6ful8lbP1flKa2aeN9TdGAEWBYiOpv5R0a2XJcskwWN4UYXPt1tRq/3o42ZOshTxjOYLx9YLha20xuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owE2yGJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoAwbrDh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owE2yGJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoAwbrDh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9w1vv2189181
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+rneuRae7ccfS7HwBJRtw/KkE2FTct/JS+yPwRVhak=; b=owE2yGJgCDL0e0En
	11/827nlFwSyoMVkyXId2i4zHXzT0Rf5rJUYShV2M4/LGzssxtqJLRGjiLnPGK/z
	G1A0ZzgeAmoCycgIbzVQIwdgYKDGDgQWkb7MTCE3Gt6oCr4FXdOeSEi5rVUyYyEp
	eSGutiGYPBnllu0kcb9cQTAzwivea/VR8k8eBzixtDc/zFOQXo0wFFWXzyovrofl
	fQ3DK7Ei6yWqwTyM/2LVcqTTEED5aX/uhmvd/QcR7rzQTlEOTecwecST/pei+wdD
	5DHDsJ/G65aGOUPiQhIN8gPaAIYSTXuu9wD3zbjGVobquIjorBqKl7Z7Qx+21lsf
	SzOvUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04vq6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:19:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso12592281b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784542754; x=1785147554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+rneuRae7ccfS7HwBJRtw/KkE2FTct/JS+yPwRVhak=;
        b=YoAwbrDhOoBwNu/6rRjnIGiFTdbsvGFqxI7KKzTPMPqvxeWy5JJztrBNcXHzjoTfs9
         0DvhGNyXsBHWV8HLWc1hu2X4rtDjtN8wD1eNB1lXYBiOTSK/E16W2VrNLN3dm9BUcJdr
         VyK47TFmakIMPCWWS6IZUDD1xRYtVVkU9NOAjLIL/njJVsRh2cj6al/mXaluKBFnG2TX
         Ys/SdzkSkpzhVOfce16MmxJ6HjJgJrhqv7nSiMQ9m3RmwPAgxTiK6fbyLx+d9dxhRihv
         J0+3E+fanrpTuGJEw4SjaLsldCFj1uk+w/8vFhFx/QyUuOBCbOC7g/fX16tbdsKEYa5a
         waIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542754; x=1785147554;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O+rneuRae7ccfS7HwBJRtw/KkE2FTct/JS+yPwRVhak=;
        b=Rpg3eri21TZHRkSO98gDwL3Sc4EVIjsNxcHe2LK1uaNMCImk94QrEyTzvEbDSrIbTQ
         VRGBTCj+nhmcinFRjZNu5bMdhbG6KJUZ9UR7553OT8Bx2m5BTmddU8ER2U3H2t3o4cJv
         z0Maoxai1fZ5U9pIB9bTi0VS6wHO1kMyMnMptJIkeZYnp2/A9mAj5I5tH6qc9kxE4XVg
         eK+2l2AEfmpaDn+pxk42K+N/LtCV+27qlML3rxmlOzV4u6pnVZTl29I3I/Zx35dldhb/
         3f1cA/7DjD2ed0rTuRUDSvUfdIpS2cYr4HbmWVj3oVm98GWpy0JEaz9kbgd5MTu6p49F
         BuKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4lJljhDKzyBE3X69d3ehB0dNXCC23ElhbMwRyNiNh1bDDnLedm/43ILVKQopfofZP6JVkvS57r8ySo0Ck@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcfNAZWDAZuhMaJ3gTk76ruqtaldFTEgZksEmBKcClR/ljQqr
	SxQfywLFviwQ64TpBJBH4vP4JJqu1m3kQ4Th+CmNRbduwtJtdnAc+adaacCKwadqguHqypZfj8y
	aDlXKSYkYcsJau3YV52kOm04lSt64ZbY40Cd447RXP5ptsY4j/uF5oWd3ULUA2MDhmnDI
X-Gm-Gg: AfdE7cm7F57CnNXsOKeQLcZFyAxemWPLLboHLCpbaHqXlyQWh4AvExxDSmRuFtbl9Sb
	uS5bSEsyivfJF8I/32TN0VeMIX08/81ZI+GO3CMZe4Nj6H+zL4hqnMl/F0dw21M+0Iw9+E9ipMs
	xtQ6z+pm1IYfb1UK584h9jWkHyqD2ErJRhLjvLsmEx8tgbwkbofMnr3extt+sg6E3G16x1bibgF
	2+9ZkPFii7kY+bk13n7cQ86P4IQheZrcQZSZHy5jjM/ZSSItLF8kd+SjqCav8tzIDxy52QOSeeb
	WolSxWxo0nBASg0+4i/ezBer6ZIEsDVOFAd6pkhMLksL8ucpx0RmPTolJXFbHMtUeAbT1s6w44P
	tUHPZmxR0a7jMYqZz9HN/CWJGj+U=
X-Received: by 2002:a05:6a00:9093:b0:848:70b4:ebbe with SMTP id d2e1a72fcca58-84c294d4beamr14636010b3a.41.1784542753612;
        Mon, 20 Jul 2026 03:19:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:9093:b0:848:70b4:ebbe with SMTP id d2e1a72fcca58-84c294d4beamr14635983b3a.41.1784542753160;
        Mon, 20 Jul 2026 03:19:13 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm5346784b3a.27.2026.07.20.03.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:19:12 -0700 (PDT)
Message-ID: <d1931ed8-57d3-4728-9ea6-0651067c2942@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 15:48:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] tee: qcomtee: Track the object invocation context
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, jenswi@kernel.org
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
 <b7c8b25b-374f-40a4-9c6d-bb20ee0cb5c9@oss.qualcomm.com>
 <fb1d4954-7c0f-4609-be40-b032876169b8@oss.qualcomm.com>
 <f917eb0f-9c9d-4f30-9c4f-ac3aeddac967@oss.qualcomm.com>
 <534f6507-dd46-432b-80cd-87c17e3e0a71@oss.qualcomm.com>
 <alnnK1jVntH-llsA@sumit-xelite>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <alnnK1jVntH-llsA@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5df622 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=VZT3vSEkKENZW7lRfPUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNSBTYWx0ZWRfXxy7je751vfW1
 cFEs0L99l4VOcoLXow6TGaa0ZysBUfZrs7nirfrh+mGHsgLob7mQ0DPolTjdEO4LACgd0S5Cahl
 b9jvTImae9OGT1eh2Rwr2bFH1bQKtRfNupPiEpg5pbBqPu+gEvbiRnwHVCgGror95I2tQVFjkEf
 chSV+jYYdyNt33rivwcjfzmD4LSACCelcm3B9CPmCs/X/WVi4W947LJaawnrAmJRj6ys9UwaPbK
 lOMD+/zkoAEmfm91W9haoKYUJ5oGicCueuwvL9O4YCOvPSyjglIfg2tHb8eo2lHoAJxx/CtBTFc
 lVpzm0XmZqkR51wyGejMtTfFgW0n/Pxc0yiLLwrzGXusIYdcijtrEiEXebVO4XYOrFYqEKX3iQF
 8JwhCYCxw/fNw7z6cCcDbVDBtmYeNpT9inEpJAdld+IQBR0R3oAq6aFJaJSTEsqeX7pa3mMJ4GK
 hL+xx6HDzLbewlFhGKA==
X-Proofpoint-ORIG-GUID: 2KRU3vBL3S8msmI27j3kPZnjUAroxF4L
X-Proofpoint-GUID: 2KRU3vBL3S8msmI27j3kPZnjUAroxF4L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNSBTYWx0ZWRfX8BI8uKM5UGeB
 kvhJqYFIq5A2Xc4WP/qu92RvWzvVP1nspmrlPfBBhqvI7OQTrTpkZNZZcBKfhKZaXBIeuTs7Wun
 L2acl3h8DZYVO4KgCfoQZ7pLySGEElA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200115

Hi Sumit,

On 17-07-2026 01:56 pm, Sumit Garg wrote:
> On Thu, Jul 16, 2026 at 12:28:25PM +0530, Harshal Dev wrote:
>> Hi Amir,
>>
>> On 7/15/2026 5:17 AM, Amirreza Zarrabi wrote:
>>> Hi Harshal,
>>>
>>> On 7/10/2026 4:37 PM, Harshal Dev wrote:
>>>> Hi Amir,
>>>>
>>>> On 7/8/2026 11:31 AM, Amirreza Zarrabi wrote:
>>>>> Hi Harshal,
>>>>>
>>>>> On 7/7/2026 4:11 PM, Harshal Dev wrote:
>>>>>> QCOMTEE needs to distinguish between object invocations arriving from
>>>>>> kernel clients and user-space clients in order to correctly marshal
>>>>>> UBUF parameters and decide whether certain operations should be permitted.
>>>>>>
>>>>>> Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
>>>>>> the context of object invocation. Objects invoked from the kernel-space
>>>>>> are expected to have the MSB of their 64-bit object-id set to indicate a
>>>>>> kernel context, whereas objects invoked from user-space should not set it.
>>>>>> To ensure this, we restrict the object-id space of user-space invoked
>>>>>> objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
>>>>>> ids.
>>>>>>
>>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
>>>>>>  drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
>>>>>>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
>>>>>>  drivers/tee/tee_core.c               |  4 ++++
>>>>>>  4 files changed, 38 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>>>>>> index 0efc5646242a..a74a54d67b06 100644
>>>>>> --- a/drivers/tee/qcomtee/call.c
>>>>>> +++ b/drivers/tee/qcomtee/call.c
>>>>>> @@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>>>  {
>>>>>>  	struct qcomtee_context_data *ctxdata = ctx->data;
>>>>>>  	struct qcomtee_object *object;
>>>>>> +	bool kernel_ctx = false;
>>>>>>  	int i, ret, result;
>>>>>>  
>>>>>>  	if (qcomtee_params_check(params, arg->num_params))
>>>>>>  		return -EINVAL;
>>>>>>  
>>>>>> +	/* Obtain the invocation context information from the MSB of the object
>>>>>> +	 * `id` field.
>>>>>> +	 */
>>>>>> +	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
>>>>>> +	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
>>>>>> +	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
>>>>>> +	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
>>>>>> +	 * NULL object we must extend the object-id to 64-bits from here on so that
>>>>>> +	 * QCOMTEE can recognize it.
>>>>>> +	 */
>>>>>> +	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
>>>>>> +		arg->id = TEE_OBJREF_NULL;
>>>>>
>>>>> Does it need to be MSB -- why bit 63? the object ID supported by QTEE is 32-bit anyway.
>>>>> Let's mask the upper 32-bit and do something like kernel_ctx = !!upper_32_bits(id).
>>>>> What do you think?
>>>>
>>>> I agree. Instead of checking for kernel-ctx by right shifting, I can use this approach.
>>>> QTEE objects invoked from user-space (including NULL object) will always have their
>>>> object-id constrained to lower 32 bits anyway as per PR: https://github.com/quic/quic-teec/pull/27
>>>>
>>>> And for kernel-space invoked QTEE objects, upper 32-bits would be set for NULL object,
>>>> and 63rd bit expected to be set as well.
>>>>
>>>
>>> Re-thinking this, I'm a bit concerned about overloading id while keeping it as a u64,
>>> and then filtering its upper 32 bits in tee_ioctl_object_invoke(). It feels unintuitive,
>>> as it naturally raises the question: if only the lower 32 bits are meaningful,
>>> why is id a `u64` in the first place?
>>>
>>> What if we make the caller origin explicit instead, for example:
>>>
>>> enum tee_object_invoke_origin {
>>> 	TEE_OBJECT_INVOKE_USERSPACE,
>>> 	TEE_OBJECT_INVOKE_KERNEL,
>>> };
>>>
>>> and then pass it through the backend op:
>>>
>>> int (*object_invoke_func)(struct tee_context *ctx,
>>> 			  struct tee_ioctl_object_invoke_arg *arg,
>>> 			  struct tee_param *param,
>>> 			  enum tee_object_invoke_origin origin);
>>>
>>> It seems more straightforward and avoids encoding caller-origin metadata into id.
>>> If you are OK, let's do this.
>>>
>>
>> Honestly, this approach makes everything a lot more easier, since we don't need complex
>> bit manipulation in back-end to filter the upper 32 bits and handle the case of
>> TEE_OBJREF_NULL. I can also then drop the PR: https://github.com/quic/quic-teec/pull/27
>>
>> I am fine with updating this callback and calling it with TEE_OBJECT_INVOKE_USERSPACE from
>> https://elixir.bootlin.com/linux/v7.1/source/drivers/tee/tee_core.c#L704
>> and TEE_OBJECT_INVOKE_KERNEL from the newly introduced tee_client_object_invoke_func().
>>
>> But is there any special reason for choosing an enum over a boolean value here? Are we planning
>> to extend the enum later to introduce any other context information?
> 
> I think enum is just better to provide enough info for the flag.
>

Ack.

>>
>> I am fine with this approach. I hope the OP-TEE maintainers @Sumit are fine as well with the
>> new parameter addition in the callback.
> 
> That's fine with me if it simplifies the object handling for you folks.

Ack, thank you for your review, I will spin a v2 based on this feedback.

Regards,
Harshal

> 
> -Sumit

