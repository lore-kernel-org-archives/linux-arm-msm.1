Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE502E62A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185114; cv=none; b=QJlkTLL/XMHF6Unbx23uAuVd9QGk0zXoTi1gWB1hdOSG88bYZeStn0ghb/auOjV8WOwMmoixGoz/b/gfdtQ8VWjG61rzx+uVLtA7Ay691vRLi4T9DgE1s9Rclh5x9fDYasfE5yT/bj6jM1Zg8RQYkLZQNXL0JHVKiEipi+zGWL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185114; c=relaxed/simple;
	bh=Le2kQtLtcTq0r7YycUPeNXvXOv4DHeZ0LD+/2xd4OJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1+GsNQ4g0HPwrTdJXbabWnm3FdiAdCyzWMUtE2so5xLehFF1gyeV55FI7dlgM1k/9X+0JLgBCnaep5YkZdNBQYgZSYqPGI/828bWQLgcp+za7euLHFWxzuafnuGln07XbDNP5w18TifiEqfP8Q4CmxLomFyAZgp5Xpb2nAZd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu4gpwUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzaS8fLB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu4gpwUe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzaS8fLB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wFNc1666699
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7z1jMqsSUwbIfrOHd7oWQ3crOjJumF30rM1jmgLfv0=; b=pu4gpwUePU6RQ7Em
	/37ThlckS5ZvFqebpC91IUebNAUi9ObgIU9d2CwNRXHsc8gTAsXiFRcDRRj6vQpd
	3odGlA4AXxsUocCPAs2r6nuCB0q7yHxXHkp/vDDc12WBEhNkgnVMYXaU2ebo3Mz0
	qvV+67doD/UDkIUL7YC1yRug0Irl8tcxJNwYhv3rUImheVItF06uT+BJoB9G/SYs
	F0/oSm6EgcrVpbkFJBrxszbm2qBjb7u/JbDXHULf/B7waBZOzHo2A2yv7oufJg2+
	zr4Q0pdT9rs+zkMskGv2pVw6ohwYZPnl5hZL3fm9+jpdt8xYfTe9FE41RPT8H03U
	TSFZ1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w93hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 06:58:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486ffba174so10632534b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 23:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784185111; x=1784789911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7z1jMqsSUwbIfrOHd7oWQ3crOjJumF30rM1jmgLfv0=;
        b=jzaS8fLBgOt97dp1mKp3stCKdOlkerQYxNEq1TTOZm5rTZEKlOPOnhcYS/p4lSGPHH
         wH655teNOE1FVnblmuP2qIPph1AvYTELbqWIz1Q4M3xVWux7JIEWVsu/HTfkzLCkaOqU
         Uj/z74uBgQfnafmtpH9UWUDhmBKh3r/C6vJz4ql7wRqJtDpYoKOfIh4K4GTN77tIO2si
         EelXExHE9VlS6woNvyIKH/KQP6G7y0OOzd59IWxwgSHi9ozC9CW2w2XitAUdNWpMNIm8
         5dQHGFmygfxLW4ABng21JyEITRzIQIbtl43gu/bK+CGVRctnfjPuZPcGOiPtAo+Mc9cu
         KLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784185111; x=1784789911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7z1jMqsSUwbIfrOHd7oWQ3crOjJumF30rM1jmgLfv0=;
        b=qdGgYJrz0Vusck2042/Y9GSLCJnIBP8lr0TSv5CfFFKgfXcsgdGMQjEVbDXASoP7rl
         zC5eIUGwVqh22GCHsIQPuNKDsfD2f9zqm7JG5AYIjAcpCOPtN+/2F/Xq8wUin6oxKEED
         JWCc4LVO49jZAlbcv1ezczmUFEN2ogEWUY+Z2BbHom5Um9J2u5iUGmCUhEP9dEmMOHY/
         l4lXAkMR7+HLlb1JuteXhABg7DnWDMvT3W2AvEZfClZQ8PNJS+nsGQMzfG2W2C5hVWTf
         9c7UTzzJ+O4Qjj3GZdMcjwEzJOrXLme5n4x4q5ESw3S+vLZQhfOivHppJjzsuqTwTmrV
         IM2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqM4d6QV6HKSRDlkuH5gDPMNWCiujRDfDmZGHp3mLtcBfCZ5s9o/FMpOg4atwDopNQs1V69tAzHMDZGoNk7@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIdDuT5VqPnfSddkhpabhMaJXOqYhNVm3+zJdb+LLTe0aXkXf
	mhr2rJkcf9x+QGW9VQmHpBimw8Pw+jZ4bbi4GIzhzt5DEpgsqM3J1NNwsZ3zQQpRWHi/HWoaECT
	7s0a3HrJIKDVLb/Yf9gywSfWwc+WKYvpR+vIypejfd+5vGHL1XIhgnkQPlkaJc88lR87u
X-Gm-Gg: AfdE7clNTfBpSpF39py9A/XMKWM4u2Y+H8cz/rxzkdzcOS5MqFy4m9s3LX7dQ8RoEkR
	p0y05yXe81StszB8bLJcwxvndwU9g3vT4Rz0ct9lk2Hic//TLTkA2S/UxMNr+62gihoY9wF01xW
	7L9JbWZa39sp03ffEYMEoqLfYiGyWT9/gJnFhtieaq21W9dOc55ewzGrNsj5H1AQCrYurk7fZiI
	Ncme0t7dwQxsHvr3gaafcp9chXv7UgWXsah0AV4e2qH4xFeoibaOHA+jMurm00ew93M5wlndhsh
	Yx8JJXBGzl9GBmBCAf18F+I+wcJI03/d2Q1vf4jm38/ezpJpo+gZllZQyfnuwHEfVXjgDEMT3D+
	dMO4oy/W0VPBt+STAXKu1V72RH18=
X-Received: by 2002:a05:6a00:8a15:b0:84c:11d2:8ad2 with SMTP id d2e1a72fcca58-84c11d29919mr374774b3a.19.1784185111314;
        Wed, 15 Jul 2026 23:58:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:8a15:b0:84c:11d2:8ad2 with SMTP id d2e1a72fcca58-84c11d29919mr374745b3a.19.1784185110802;
        Wed, 15 Jul 2026 23:58:30 -0700 (PDT)
Received: from [10.92.174.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238f75sm4382727b3a.9.2026.07.15.23.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 23:58:30 -0700 (PDT)
Message-ID: <534f6507-dd46-432b-80cd-87c17e3e0a71@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 12:28:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tee: qcomtee: Track the object invocation context
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
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
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <f917eb0f-9c9d-4f30-9c4f-ac3aeddac967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a588118 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=KopdRG5eK05-lo_pIREA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: M-zaf7gpnx7yt6OU9tTLBCw7ZHIP-boa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA3MCBTYWx0ZWRfXx+P5UPDMHZ1a
 ujszev0alT76k2OaSIyRO9i66TSTSry147tw4PG0LdoKwlbnZBAx2f/MmvImMQnaVm7q6Q97tn8
 AxI4byMD1vM6QfksJ8wJyP56vYg7MoQ=
X-Proofpoint-ORIG-GUID: M-zaf7gpnx7yt6OU9tTLBCw7ZHIP-boa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA3MCBTYWx0ZWRfX6GIuxb0hZboH
 9X5M5+FR4eYs78DlIlOVfW5yMSi9DQpzNF8gmqivFAWCNGzn5JHWRsYiq/7i3oyoR1eZv04Vbns
 LqtJguoP9LNrA39aiyyhKvTRxWvgKVjNmp8SPmTlixybdMLHxSmEGvv3CA1DXcJd9GbmSYlnjhV
 YrjY4VRF4nGaRPFa9JgZoCi61OqujT3H3g6d4xWCNg9uQO9/8G/SvAtRfTeGjGnVsnyWXbPIRF9
 WooBZw9ZYjdqFO7+hOhFlcB1h6hEKSZFU5r9LHbdsww55uyZWvA9+Yyl1LeWsvh7TGKOmgBp6Ol
 bzzcKR2UNUT+s4KrIoeCwwtchM3BfN5SpRdu8zb+tDJT5UPm7hEVNoNFmNkFbpJ5iQkHDDc5cYO
 XIu/awjpKY00VD+NoW+3jS6ky+2JyRLkZyCje1oYYOpfOUHFAnYCkFb4X/Tzjqtw+4rWK0kpKME
 zo2UvrH38aUZQD4YqXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160070

Hi Amir,

On 7/15/2026 5:17 AM, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 7/10/2026 4:37 PM, Harshal Dev wrote:
>> Hi Amir,
>>
>> On 7/8/2026 11:31 AM, Amirreza Zarrabi wrote:
>>> Hi Harshal,
>>>
>>> On 7/7/2026 4:11 PM, Harshal Dev wrote:
>>>> QCOMTEE needs to distinguish between object invocations arriving from
>>>> kernel clients and user-space clients in order to correctly marshal
>>>> UBUF parameters and decide whether certain operations should be permitted.
>>>>
>>>> Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
>>>> the context of object invocation. Objects invoked from the kernel-space
>>>> are expected to have the MSB of their 64-bit object-id set to indicate a
>>>> kernel context, whereas objects invoked from user-space should not set it.
>>>> To ensure this, we restrict the object-id space of user-space invoked
>>>> objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
>>>> ids.
>>>>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>>  drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
>>>>  drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
>>>>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
>>>>  drivers/tee/tee_core.c               |  4 ++++
>>>>  4 files changed, 38 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>>>> index 0efc5646242a..a74a54d67b06 100644
>>>> --- a/drivers/tee/qcomtee/call.c
>>>> +++ b/drivers/tee/qcomtee/call.c
>>>> @@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>  {
>>>>  	struct qcomtee_context_data *ctxdata = ctx->data;
>>>>  	struct qcomtee_object *object;
>>>> +	bool kernel_ctx = false;
>>>>  	int i, ret, result;
>>>>  
>>>>  	if (qcomtee_params_check(params, arg->num_params))
>>>>  		return -EINVAL;
>>>>  
>>>> +	/* Obtain the invocation context information from the MSB of the object
>>>> +	 * `id` field.
>>>> +	 */
>>>> +	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
>>>> +	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
>>>> +	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
>>>> +	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
>>>> +	 * NULL object we must extend the object-id to 64-bits from here on so that
>>>> +	 * QCOMTEE can recognize it.
>>>> +	 */
>>>> +	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
>>>> +		arg->id = TEE_OBJREF_NULL;
>>>
>>> Does it need to be MSB -- why bit 63? the object ID supported by QTEE is 32-bit anyway.
>>> Let's mask the upper 32-bit and do something like kernel_ctx = !!upper_32_bits(id).
>>> What do you think?
>>
>> I agree. Instead of checking for kernel-ctx by right shifting, I can use this approach.
>> QTEE objects invoked from user-space (including NULL object) will always have their
>> object-id constrained to lower 32 bits anyway as per PR: https://github.com/quic/quic-teec/pull/27
>>
>> And for kernel-space invoked QTEE objects, upper 32-bits would be set for NULL object,
>> and 63rd bit expected to be set as well.
>>
> 
> Re-thinking this, I'm a bit concerned about overloading id while keeping it as a u64,
> and then filtering its upper 32 bits in tee_ioctl_object_invoke(). It feels unintuitive,
> as it naturally raises the question: if only the lower 32 bits are meaningful,
> why is id a `u64` in the first place?
> 
> What if we make the caller origin explicit instead, for example:
> 
> enum tee_object_invoke_origin {
> 	TEE_OBJECT_INVOKE_USERSPACE,
> 	TEE_OBJECT_INVOKE_KERNEL,
> };
> 
> and then pass it through the backend op:
> 
> int (*object_invoke_func)(struct tee_context *ctx,
> 			  struct tee_ioctl_object_invoke_arg *arg,
> 			  struct tee_param *param,
> 			  enum tee_object_invoke_origin origin);
> 
> It seems more straightforward and avoids encoding caller-origin metadata into id.
> If you are OK, let's do this.
>

Honestly, this approach makes everything a lot more easier, since we don't need complex
bit manipulation in back-end to filter the upper 32 bits and handle the case of
TEE_OBJREF_NULL. I can also then drop the PR: https://github.com/quic/quic-teec/pull/27

I am fine with updating this callback and calling it with TEE_OBJECT_INVOKE_USERSPACE from
https://elixir.bootlin.com/linux/v7.1/source/drivers/tee/tee_core.c#L704
and TEE_OBJECT_INVOKE_KERNEL from the newly introduced tee_client_object_invoke_func().

But is there any special reason for choosing an enum over a boolean value here? Are we planning
to extend the enum later to introduce any other context information?

I am fine with this approach. I hope the OP-TEE maintainers @Sumit are fine as well with the
new parameter addition in the callback.

Regards,
Harshal 
> - Amir
> 
>>>
>>>> +
>>>> +	/* If the object being invoked is not NULL, drop the MSB from the `id` field to
>>>> +	 * obtain the actual object-id.
>>>> +	 */
>>>> +	if (arg->id != TEE_OBJREF_NULL)
>>>> +		arg->id = QCOMTEE_SANITIZE_OBJ_ID(arg->id);
>>>> +
>>>>  	/* First, handle reserved operations: */
>>>>  	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>>>>  		del_qtee_object(arg->id, ctxdata);
>>>> @@ -411,7 +431,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>>  
>>>>  	/* Otherwise, invoke a QTEE object: */
>>>>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>>>> -		qcomtee_object_invoke_ctx_alloc(ctx);
>>>> +		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
>>>>  	if (!oic)
>>>>  		return -ENOMEM;
>>>>  
>>>> @@ -648,7 +668,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>>>  	int result;
>>>>  
>>>>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>>>> -		qcomtee_object_invoke_ctx_alloc(ctx);
>>>> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
>>>>  	if (!oic)
>>>>  		return;
>>>>  
>>>> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>>>> index f39bf63fd1c2..5d292a2ff83d 100644
>>>> --- a/drivers/tee/qcomtee/qcomtee.h
>>>> +++ b/drivers/tee/qcomtee/qcomtee.h
>>>> @@ -17,6 +17,12 @@
>>>>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>>>>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>>>>  
>>>> +/* The MSB of the object_id field indicates whether the client is invoking the
>>>> + * object from user context or kernel context.
>>>> + */
>>>> +#define QCOMTEE_GET_CLIENT_CTX(x) (((x) >> 63) & 1U)
>>>> +#define QCOMTEE_SANITIZE_OBJ_ID(x) ((x) & (BIT(63) - 1))
>>>> +
>>>>  /**
>>>>   * struct qcomtee - Main service struct.
>>>>   * @teedev: client device.
>>>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>>>> index 8b4401ecad48..2528d07e4576 100644
>>>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>>>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>>>> @@ -146,6 +146,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>>>>   * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
>>>>   * @ctx: TEE context for this invocation.
>>>>   * @flags: flags for the invocation context.
>>>> + * @kernel_ctx: flag that indicates this context is owned by a kernel client.
>>>>   * @errno: error code for the invocation.
>>>>   * @object: current object invoked in this callback context.
>>>>   * @u: array of arguments for the current invocation (+1 for ending arg).
>>>> @@ -158,6 +159,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>>>>  struct qcomtee_object_invoke_ctx {
>>>>  	struct tee_context *ctx;
>>>>  	unsigned long flags;
>>>> +	bool kernel_ctx;
>>>>  	int errno;
>>>>  
>>>>  	struct qcomtee_object *object;
>>>> @@ -172,13 +174,15 @@ struct qcomtee_object_invoke_ctx {
>>>>  };
>>>>  
>>>>  static inline struct qcomtee_object_invoke_ctx *
>>>> -qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
>>>> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
>>>>  {
>>>>  	struct qcomtee_object_invoke_ctx *oic;
>>>>  
>>>>  	oic = kzalloc_obj(*oic);
>>>> -	if (oic)
>>>> +	if (oic) {
>>>>  		oic->ctx = ctx;
>>>> +		oic->kernel_ctx = kernel_ctx;
>>>> +	}
>>>>  	return oic;
>>>>  }
>>>>  
>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>>>> index ef9642d72672..7f986d7fb47f 100644
>>>> --- a/drivers/tee/tee_core.c
>>>> +++ b/drivers/tee/tee_core.c
>>>> @@ -706,6 +706,10 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
>>>>  			goto out;
>>>>  	}
>>>>  
>>>> +	/* Userspace object-ids are restricted to 32-bits. */
>>>> +	if (arg.id > U32_MAX)
>>>> +		return -EINVAL;
>>>> +
>>>
>>> This change belongs to tee SS, move it to a separate commit with appropriate message.
>>
>> Ack.
>>
>> Regards,
>> Harshal
>>>
>>>>  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
>>>>  	if (rc)
>>>>  		goto out;
>>>>
>>>
>>> Regards,
>>> Amir
>>>
>>
> 

