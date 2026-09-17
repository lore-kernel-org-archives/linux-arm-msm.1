Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE203F7A9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 20:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678247; cv=none; b=uTPhczikYxlx4Y2Tr9PKC4DjYzH3YQVSRAystjP+5vJvWV2oUo3GxG/Uy+cjjziKjWulRV4dy9PfFCsyPJohvOdm9t2xEpS9XEcEj94kGxGY2R7fQpLou3xDdaQdo+nN+eDqA6mQEOsK/8urJL0NRm4VCFRT0LbdlPew4NSgyyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678247; c=relaxed/simple;
	bh=Wi5x/Ouh/PeM1Z3PGzen1AuGIANL006sy5SnhuPr6aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INlQBH/UUwJaAv+9tvrVWRfdx1vwtgYDGqNgR6Su9gfV1CpQWivrG5/fUlTLvB4aSLGLCl4MMPgad2PklrnCGfsm2yAMabXdTStlZC4qZcFB997lspKcNYmrCWmB2Ee4+aGp8Ms38IrBd8iEKbG2Wi2xd3bQYjAmH4VkXOysVKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDMSa4iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/Ef2yuy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDMSa4iS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/Ef2yuy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5dL82170828
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 20:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=; b=bDMSa4iSiT8ItOZL
	qDlgE27bojSoam9G3l2wvgy1LHpWPkfn/+L27JL7XSP8tIMNBAM+VShnfQHvx7Sx
	HklycHyYEAS+3ywN8aA4DhZgIuPY9gcZiWa+ZsZWTxoYqwzkYWakBN/wBGvr3ExG
	UXvuMj/DMufQL1miacolNxE7jnHau+Fc4lsKaoVMm8hC1WEMYUL4bDNwOx/mmfIM
	WFqRC3Nxyqq5aUKNEqWDCMW9/M2bY8K7PCsh1b3z0cIefy6TcappZDautpQo2jPe
	GeupFN0+uoSdyO2Obeczcr4nrwTxCH7Z/yd85WiPhbNaIMSqp7chdUYyaDhQP7Yx
	j0JWsg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97sash-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 20:50:44 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-806ef75f2ceso15963a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789678243; x=1790283043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=A/Ef2yuy+7/i/qHeq9gGhIaDvd015lh2MF8yTuUipuVo9Omvd2xkS/0JF5cP5vg81d
         LT3NnJtFKOWFNRbMKPw4jLMOxh+NK7vQLF6hyxSLu9HHSmuv4N4mJfYfRJqz/493dnYk
         nDER3K6iHsLX/qXvWSOm9MAZRu0gp5vLJsLzbCvxg2TOXwufcYhRwYEPRqynj7Lbwuw+
         SKUcvJy79/OsNgOfkFrXeBLLTh6cScC3rPj+nPnObUUjKMClSw24i2Tg5zLgYhA01uMq
         3eQs9UAbl+em4JENEp0t5ND7SVYOT04FMo1VzKubLNrTNr8tNZo0pVxThAx1cDqehTOY
         gtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678243; x=1790283043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=RgCaGNpXrb4aH3IzcXSnnuRGzZoIyvPjf7IlbuoDOQOKI9B0IuQjy3S4UQ+w0zBTtF
         BwJcpbxMd9hfgFM8oZ/T396lgrAiSOOyB8hhYW6099EtLwHDTmof1wbHe5c+BpQD2gns
         01LHhp6vZ8agIPoZJjldyfKuLtMECbgOzPmYyLmQavUEhIUV61sVUH9syXxAdjU0EFZK
         N2EWw2YJTKRXqeCsnvujcJgbpQOAYpzNRCkyp61S3Y94GWX+GGjNiceegXu/qhXKTG0I
         AZxjTp/Cq4SlQaZzlYFUQwSIaP423uVKcbhcNRGWG6BEpZxnZaPUceJAtpqZHjVPQ5cT
         G2uQ==
X-Gm-Message-State: AFuF++kCRindpe3JcfNbFnxWnieMivmJdUGvyg0xYwUp8qMeyAlwkkE9
	IA9NVnjk28ewSB5Hr9Vi8LhuFlC4+lvogmPhYWlDYJBWfnwEZ0JCR69F31xD0do3XwCFFAzrMBN
	3EXJQbGXe15agB3Vhi2rYbCColmYxjaU8I5B5InR/C/NQqDyOWSejwAbfyyfwjXHmAe5R
X-Gm-Gg: AYBFou3KyRuq+EBdYjdopeROhjlxDwiAgLepiyyFpdpLzTdzDpFZX8DR9Tktjl67L9X
	ahLBaNKDy96zJYBHZLPp6UYtv0X4MI6akoNR+SAlIuSb4QOYXWFXfH8voKo33MRyRJ2E6M6UWP+
	Cmi3UL2JjCCrHYGELr8OZLZg/y0YLiJBPAUhFpJOsqr3sO2ZqO6lT+COvYy764WO75Oy24z0s7t
	ZCqXQqRKrtxS4mlMKQ5IcPhHF3p5UboFVxm6GcoG7j5UQM2PN7fDbo6YEr3bjzArVLOB4wpMPIf
	Y7m3h1Xh17S7zsXNr5hP9ocVnHkiW0OcsWxUHz+T6FwcWmqIZfnjZURNtOpjc/o6EnqzN+dL7+H
	E1x9T6A2/wzT4xxmkHucyGaAwYVm/MD9rt3xO7ArzkF6gR1NxQTr+cw==
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304653637.25.1789677513391;
        Thu, 17 Sep 2026 13:38:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304613637.25.1789677512941;
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Received: from [10.73.236.146] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c00ede586sm14590388eec.10.2026.09.17.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Message-ID: <71568eb6-8123-4ed3-a2d3-4e33e4880bf4@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:38:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
 <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
 <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac52a4 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5Hg3Q6Ij0jR0fJQLcq8A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI5OSBTYWx0ZWRfX7apVxphm5rGd
 wsh0wZvj86twqTyyU0b7vLZg0Wr/3lB31y2dMR3Pga1RyRNqvJQOAQhD0DdqwBesc2ISx5LFzHr
 8IdzzvBw7Dh4dBpWGumzsFd70i7nrHVB+/YXMM+LS6J/FIlXlGHORTQi98LZpqsoOLrqRDo7IAD
 SoSJd0nVtlYd4u5XFrgk9jojhs9BLHnAn829ie6MYZyQ+cvMkxgGU31Qog6LiPEsu1JdGa0prA2
 3aDgnd3UrxYg/4RITaCPCv3kc1p5WamvBALYV17wpezJMppqXfahheJs77pmra4jV89X5oglN98
 2Ius10v4kFEceVFKvENPmQdQq3PUqgVDYEbNigHw7OZFwCs/5u7bymqG/lG3VEXHO86k1Qm4ZoI
 BDbM1Di22VZ0rnfBoIcAm2zQ/uhNQxjA9+VjPil2igVU90cKGoK/roRLJGiegkPQnB0bgTYRwW8
 iFqyct7A4LFUTkDMNCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI5OSBTYWx0ZWRfXwq+YqvTeZFSj
 bLS4pPHKGhq2yq7nkN/2Kq7fBRLQ3l20NMQtCX5jDjGdUROyDELIZX4qq08ChYuFBBBhELOV4s2
 k29TkcscTlLgVdNWgu2itZJJw9a/1bs=
X-Proofpoint-ORIG-GUID: M9dfzMkzoToOCVB15oU2KrIPZXdBA28v
X-Proofpoint-GUID: M9dfzMkzoToOCVB15oU2KrIPZXdBA28v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170299

On 9/16/2026 2:23 PM, Amirreza Zarrabi wrote:
> Hi Trilok,
> 
> On 9/16/2026 3:30 PM, Trilok Soni wrote:
>> On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
>>> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
>>> the SBI MPXY mailbox framework.
>>>
>>> Request one mailbox channel per hart and use the channel corresponding to
>>> the current CPU when issuing a TEE request. Probe the RPMI TEE service
>>> group and required memory-sharing capabilities before registering the
>>> transport.
>>>
>>> This provides the basic transport and discovery support needed by the
>>> following patches.
>>>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---
>>>  drivers/tee/optee/Makefile                 |   1 +
>>>  drivers/tee/optee/core.c                   |   8 +-
>>>  drivers/tee/optee/optee_private.h          |  34 ++++
>>>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>>>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>>>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>>>  6 files changed, 495 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>>> index ad7049c1c107..925b8ec7ef68 100644
>>> --- a/drivers/tee/optee/Makefile
>>> +++ b/drivers/tee/optee/Makefile
>>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>>  optee-objs += device.o
>>>  optee-objs += smc_abi.o
>>>  optee-objs += ffa_abi.o
>>> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>>>  
>>>  # for tracing framework to find optee_trace.h
>>>  CFLAGS_smc_abi.o := -I$(src)
>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>>> index a52c1f498b99..63f1725e646e 100644
>>> --- a/drivers/tee/optee/core.c
>>> +++ b/drivers/tee/optee/core.c
>>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>>  
>>>  static int smc_abi_rc;
>>>  static int ffa_abi_rc;
>>> +static int riscv_abi_rc;
>>>  static bool intf_is_regged;
>>>  
>>>  static int __init optee_core_init(void)
>>> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>>>  
>>>  	smc_abi_rc = optee_smc_abi_register();
>>>  	ffa_abi_rc = optee_ffa_abi_register();
>>> +	riscv_abi_rc = optee_riscv_abi_register();
>>
>> Isn't it growing rapidly now? We have two register calls for the ARM,
>> one for the RISC-V. One more region specific ISA I am aware of and it
>> may have op-tee support in future? It is time we fix this logic
>> in the better way. 
>>
>>
>>>  
>>> -	/* If both failed there's no point with this module */
>>> -	if (smc_abi_rc && ffa_abi_rc) {
>>> +	/* If all failed there's no point with this module */
>>> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
>>
>> This is started looking ugly in my opinion. 
>>
>>>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>>>  			rpmb_interface_unregister(&rpmb_class_intf);
>>>  			intf_is_regged = false;
>>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>>  		optee_smc_abi_unregister();
>>>  	if (!ffa_abi_rc)
>>>  		optee_ffa_abi_unregister();
>>> +	if (!riscv_abi_rc)
>>> +		optee_riscv_abi_unregister();
>>>  }
>>>  module_exit(optee_core_exit);
>>>  
>>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>>> index aefe1e6f5689..8d22d65e087b 100644
>>> --- a/drivers/tee/optee/optee_private.h
>>> +++ b/drivers/tee/optee/optee_private.h
>>> @@ -171,6 +171,31 @@ struct optee_ffa {
>>>  	struct work_struct notif_work;
>>>  };
>>>  
>>> +/**
>>> + * struct optee_riscv - RPMI TEE communication struct
>>
>> do we need to name it optee_riscv? we don't use optee_arm anywhere in this
>> code I believe. 
>>
>> More later...
>>
> 
> The naming convention, and even the file structure, will change in v2.
> This RFC currently mirrors the _internal_ FF-A implementation, which is neither
> required nor ideal. We are moving away from that structure.

Thanks. 

I also don't like the growing registration calls and complicated "&&" checks
above. 

---Trilok Soni

