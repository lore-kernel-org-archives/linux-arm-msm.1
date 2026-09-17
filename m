Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB64D957E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672768; cv=none; b=skZkYOmS3q0J9UhaFwfGoAVevU/QqkQNqRlM0q813v5118808Bx7uAaZ6pLdhX0+MIbKcXuRnRHZ/jQmiSFlmKljc5qygWK0ZgjgZT6EXmaA9Gc0ptD5OKhrTWFexxWTX6aLscWfcVbr0mr1Um0MC76WcyGdNonLL3VGulm0z/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672768; c=relaxed/simple;
	bh=ESL5IjDTuxlb2JiE94IUunPmakxj8cGwIC0Vr4t4QMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKeBJFYoBTRcJmb5uTkjdZPQELLfWjh/p+e3fWU7cFYtQXd6/MQjN6mSrcze0VktQn1wqVFn7/+/AMC+5CWC6ab6VJZyAKgrq30LkF4YckS4H/ZmZkF+bZE7OMoIWIelZKQ6sE8c52Vb4PMJG0NV6RlYHZRjfKpbHmxzRR+bx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg1dBU/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdW7LWRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg1dBU/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdW7LWRl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5VTO1765979
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=; b=Gg1dBU/UgIrQlyOk
	RB7mM6wl7+MRMoiyeZHFRhxqOHR4lVd3MH993bH4jjs5sP1iBLaO/H4lFbl6++WK
	JROglw1qFdhG597l18dJ1sKBwkIqLCRyvtuhk50AacgjuG9yT+0VRjYF8TwKFii8
	3Ty5qgOpRnDyUgQbwAm9t1m8lYoJESsFSWBZP85LM2fYfvJ9Ymxni31qlH/Y0nsQ
	qaUgDazSh1ioO1KNct6Vk0Fl2Sl7Z2eXsVq28OPr6yozaAgpszIpxGhgryw1TTZ8
	TQy17VblJH69UrKVeHrvVpcmIGjcvnr949TsF2f538kj0zEoveAG4I4YhYBjcSml
	voNgmw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcrab0dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:19:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so21155695ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672765; x=1790277565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=;
        b=KdW7LWRlLueZRcBwWqp9VfkkMHiB6PuNVXPhrdYj8jxGl6Ucsu9YdGZK5ac9UHP2JZ
         Eza/TJ2ILeTDVbIqomn+xsaC9fuH5TqboZY31s/T/+ZMgi1GyJ4wBukCXJqIUiFUARgY
         yAOfAcdm6nEk+WYYX1Ysi6GKyZTpE7aFzo7qwGy5vUe5ekh/c3xX84tzkkeM4s800BIe
         ++pURgEgxDp9STZSJTYy2Y4RrxXlYFoykH+Q5XvIujpjnvploPlXmdxYbXQc+yLaFy3r
         BHZBLoHYvC4mxiErdOD6IQvYVLg7fPHRPit7VhqoNV32VoFOqY5U+ZmlAvUCUty7/yYg
         +JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672765; x=1790277565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=;
        b=ozGSMnWXCm61jigbU2kZAbZzhoGwLzPWCGeQizJV3HCK3ghdMyAv2OYtBOLs/fxJGv
         hZMHlzm5WU+SNg599mAwAL0BYjJRgL3aOwGXM9wTbR6OWWflRBdp6V+NEeuQzDdCY3jA
         iJhMLexsXLFIXx5Pr5m6uHLb8C4VNaaxreQOwbYws9WY87ZlYNkv8O3PTKLEI/dHd739
         W5UqZiQDFbp3+p3GtVFSqYlsHCCMfDJz+r4eJ6BxSXQlzuK+gDhSqC9Yt0Og31fQ7bNg
         1rRdG0qUCirUQgaU2vemen92XIodBzoVk4z4EXWcaXSIWtGBToyGOunT3UjNc28fkkKu
         hz3w==
X-Forwarded-Encrypted: i=1; AKwUvBzn2yuCHAxY6QlcIKopOvs6BCL5jgnrXPwH2tAqrB9KGw88RjJ8wjPHRk+n9ztNeJj1cE5eWAJJ+SuXMeuX@vger.kernel.org
X-Gm-Message-State: AFuF++l+/GmCimA71TStzD4jA+UHi+MTc2dEU/9sVX0uzhmhgoK5H+ME
	OxgHxJmbyHTOYLY4hMogIjfLzkmMCpK0h112erCApfGwbB0i82RgqnoPly9CYzlBvtuhnLRG+tS
	dq5NW0IGZCoJxdJ/xRa8DRDZG0ulAuL5aj1gjpw7bmJJHozLSeks6LOx1YargJUU1Hi8=
X-Gm-Gg: AYBFou2HvTkukM/7nvpdi9clVWRwGuEPRvoU25HXD6nnqAl9WaWJTOpo9evqtt/H4Sz
	BLEIyRndoVwZW+1jN0XX7Il/S8uZsG+rAvWAZ44PER1WX/2/Es+d/YeUsg9cV7MQDTcVM+mgcUq
	MwXb96u3nZ+Hp2cbcrK08cIW3qgUIujtChrlnwzdWXXAWJr8XLz0pyZSltVQZkfHYzN1+SH2pyw
	cvedXOQraOEsSEx68DfMmGOCExctPHzTULpNSUryId3VqOffqhi8Tuv+LCD6lwbkMZxOpQeyPnq
	ZbRMYTddlo6fvMw+xnmaijjr5vSrf9mKP1YXWba440KScyYM+4/+tmv/tyTSKv41r2T0CWA83RY
	DtNvTj4sjcSwcT7cTiChnSPDiOqwj+m36
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr429893a91.3.1789672764594;
        Thu, 17 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr429836a91.3.1789672764046;
        Thu, 17 Sep 2026 12:19:24 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.114.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5547a04dsm40272a91.3.2026.09.17.12.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:19:22 -0700 (PDT)
Message-ID: <4da526fc-f763-4f8b-8b33-362177aec889@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 05:19:15 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Anup Patel <anup@brainfault.org>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
 <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
 <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
 <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX62Va0Y6Kk7t6
 +eUk6wCS/7EiZOOeaQGO59u/bE6lMQl2mc2Ji8CPb854oyQ0fqKD5yjYG3A0BdeOJbMK8Y3e8qy
 eAXP3Gq35XUbwXBs0G9wswVrS212eMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX4GEuqO+kMr/q
 tSkTtTunJbyFMkORI/9beqqFwpni6VR1ReoC2zJHziJI9q++tfd9PVtovu0XMw1A/vog+ybcwBs
 BiKr+EZb/pMInJPJvh2xmNTIvuPWKXGXooJSPmCPk6aC7JuFenxNBqjU4osBzq4rVajhTScKUQE
 1lm+OOYcC38cwtY4/DR1ipUYwl6VVW2cdFf9V8zifORURBHhqE6zdxn4mfZScyaOkldpmwKBbgI
 PRAI77rYEIk4e1F4V5gwO1BHEb8rdMZhjkk/Dhxw219ZZiY70gnISzL5D+fSL0tJo8M470qxQLx
 dXaZaN36Pccx1Qzsj8G93jJqzLpLWkldJsWzqMBGtW7nZsNMG6vzV+gFopL0kCQoFq6WbJo4HQs
 62sFMzPCZ0Ubc4w8gEsI4xxksvfeJNu4yd29pkJ+qhYeAfY6AONJMWbQJHmHDuUW6YfrSQncc0C
 cHjFItQKVfwW2HepnsQ==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac3d3d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Sf69FToG0YAVI/MxTdzZwA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=hNa552Fws9iX_tKzEZsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Q-iYNQ9dN4vhf8WvStTrNct1Av7eIygq
X-Proofpoint-ORIG-GUID: Q-iYNQ9dN4vhf8WvStTrNct1Av7eIygq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170277

Hi Anup,

On 9/17/2026 6:38 PM, Anup Patel wrote:
> On Thu, Sep 17, 2026 at 2:46 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi Anup,
>>
>> On 9/16/2026 8:12 PM, Anup Patel wrote:
>>> On Sat, Sep 12, 2026 at 3:45 PM Amirreza Zarrabi
>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>
>>>> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
>>>> TEE service group over SBI MPXY.
>>>>
>>>> Describe one mailbox channel per hart and an optional interrupt used as
>>>> the availability doorbell for asynchronous notifications.
>>>>
>>>> Add the binding to the existing OP-TEE MAINTAINERS entry.
>>>>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++++++++
>>>>  MAINTAINERS                                        |  1 +
>>>>  2 files changed, 66 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>>>> new file mode 100644
>>>> index 000000000000..8f6ff313fd42
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>>>> @@ -0,0 +1,65 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: RISC-V RPMI TEE service group based message proxy
>>>> +
>>>> +maintainers:
>>>> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> +
>>>> +description: |
>>>> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messaging
>>>> +  protocol which is modular and extensible. The supervisor software can
>>>> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedicated
>>>> +  supervisor-mode RPMI transport.
>>>> +
>>>> +  The RPMI specification [1] defines a TEE service group which is the RISC-V
>>>> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.e.
>>>> +  Linux) are peer endpoints and the RPMI framework (machine mode firmware)
>>>> +  mediates every message. Entering OP-TEE on a hart runs it on that hart until
>>>> +  it responds, so the SBI implementation provides one SBI MPXY channel per
>>>> +  hart; all of them are listed, in hart order, on a single node.
>>>> +
>>>> +  ===========================================
>>>> +  References
>>>> +  ===========================================
>>>> +
>>>> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
>>>> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
>>>> +
>>>> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
>>>> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: riscv,rpmi-mpxy-tee
>>>> +
>>>> +  mboxes:
>>>> +    minItems: 1
>>>> +    description:
>>>> +      One SBI MPXY channel implementing the RPMI TEE service group per hart,
>>>> +      listed in the same order as the CPU nodes.
>>>
>>> I am not sure why you need separate MPXY channel per hart. The MPXY shared
>>> memory is already per-hart whereas the MPXY channel will be doman specific
>>> for TEE.
>>
>> True. My reasoning was that TEE_CALL, as I understand it, is expected to execute on
>> the same hart that issued it. Given that, the mailbox core holds the per-channel spinlock
>> across the call to `send_data()`, while the underlying `sbi_ecall()` is synchronous
>> and does not return until the TEE call completes.
>>
>> So, if two harts shared the same channel, a hart executing a long-running TEE operation
>> would hold that channel's lock for the duration of the call, and another hart
>> trying to enqueue on the same channel would spin waiting for it.
>>
>> Using per-hart channels avoids that cross-hart contention. I agree that this may
>> not be the right layer in which to address the issue. I did not pull it to the discussion in to this RFC.
>> I'm happy to use single channel for now and follow up on it separately if useful.
> 
> The per-channel spinlock serialization is not required for SBI MPXY based
> mailbox channels because the underlying SBI implementation will take care
> of the serialization where required.
> 
> In other words, we need to improve the Linux mailbox framework to allow
> SBI MPXY mailbox controller tell Linux mailbox framework to not use
> per-channel spinlock based serialization.
> 
> One possible approach to enhance Linux mailbox framework is show
> below. May be include this (or some other approach) as a separate
> patch in your series ?
> 
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index efacd24a085d..437e7e2e6ad5 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -48,7 +48,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
>  static void msg_submit(struct mbox_chan *chan)
>  {
>   unsigned count, idx;
> - void *data;
> + void *data = NULL;
>   int err = -EBUSY;
> 
>   scoped_guard(spinlock_irqsave, &chan->lock) {
> @@ -66,14 +66,22 @@ static void msg_submit(struct mbox_chan *chan)
> 
>   if (chan->cl->tx_prepare)
>   chan->cl->tx_prepare(chan->cl, data);
> - /* Try to submit a message to the MBOX controller */
> - err = chan->mbox->ops->send_data(chan, data);
> +
> + /* Try to submit a message to the MBOX controller in atomic context */
> + if (chan->mbox->ops->send_data)
> + err = chan->mbox->ops->send_data(chan, data);
> + else if (chan->mbox->ops->send_data_nonatomic)
> + err = 0;
>   if (!err) {
>   chan->active_req = data;
>   chan->msg_count--;
>   }
>   }
> 
> + /* Try to submit a message to the MBOX controller in non-atomic context */
> + if (!err && chan->mbox->ops->send_data_nonatomic)
> + err = chan->mbox->ops->send_data_nonatomic(chan, data);
> +
>   if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
>   /* kick start the timer immediately to avoid delays */
>   scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> index b02c17c2c64e..9afa10c72bd7 100644
> --- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> @@ -420,7 +420,7 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
>  }
> 
>  static const struct mbox_chan_ops mpxy_mbox_ops = {
> - .send_data = mpxy_mbox_send_data,
> + .send_data_nonatomic = mpxy_mbox_send_data,
>   .peek_data = mpxy_mbox_peek_data,
>   .startup = mpxy_mbox_startup,
>   .shutdown = mpxy_mbox_shutdown,
> diff --git a/include/linux/mailbox_controller.h
> b/include/linux/mailbox_controller.h
> index 26a238a6f941..4bc4798c4b1f 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -28,6 +28,10 @@ struct mbox_chan;
>   * transmission of data is reported by the controller via
>   * mbox_chan_txdone (if it has some TX ACK irq). It must not
>   * sleep.
> + * @send_data_nonatomic: The API asks the MBOX controller driver, in non-atomic
> + * context try to transmit a message on the bus. Returns 0 if
> + * data is accepted for transmission, negative error while rejecting
> + * if the remote not acccepted.
>   * @flush: Called when a client requests transmissions to be blocking but
>   * the context doesn't allow sleeping. Typically the controller
>   * will implement a busy loop waiting for the data to flush out.
> @@ -53,6 +57,7 @@ struct mbox_chan;
>   */
>  struct mbox_chan_ops {
>   int (*send_data)(struct mbox_chan *chan, void *data);
> + int (*send_data_nonatomic)(struct mbox_chan *chan, void *data);
>   int (*flush)(struct mbox_chan *chan, unsigned long timeout);
>   int (*startup)(struct mbox_chan *chan);
>   void (*shutdown)(struct mbox_chan *chan);
> 
> Regards,
> Anup

You are right. I'll include it in a separate patch in the next series.

Thanks.
Amir


