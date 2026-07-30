Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76A63FBB5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412405; cv=none; b=N71l096Pa5rNUMS2R+0Q2cKURzOjk5c9HajKndmUhVbbM+Gm2CeCEnP6Ux73pKKStn+0svKHvuXMGkNbeXAyM2K395Z/06JJBWVQrXITQ/aIIFZ82Ymlyo1Hrhu75W4N3EymrnJUUziNTppb+638ZPIphJLwnb4EeuAzKQ3AmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412405; c=relaxed/simple;
	bh=5OoeEvG/dPwryXNgdMEmncOH12rZ+80/DKy8v95024o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwl6dOGo/Jhuexf9oJ74iqT6bcbVxAsJ8Tp0BDhttrrCVs1zGMoto9bpfpToT8WXSu9UiGSLDGSsUGqVX8ZGjCOfY0mHHpUk1dBbIp+HVRCjtWRVO0L1H1pY3KL/aEsZuBAL377rlMalBxDoa0lBM8ofTYpJkGhupEuIRBm239c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHTspZH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdSstWV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHTspZH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdSstWV0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBDYjr655139
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErxhSvVhI8PKtxVKYTOJ15TBdUc3fX8hWfsvKH7O764=; b=YHTspZH5lvvR2Hbk
	gOg1b+SLZM8Z1HjFRYFNZUSRZc/uY8ildrJCZPGrXmoDTXScUD/bAj/MbSQEaRI/
	dU0cHXT3U1P33KZbT+fYMnHwGV3QnPubfpCFEpDtDHrubNjOH08k9HW2VY2sVLcu
	KRrzPq/+Lozs0zO7WpSRZ07RQh53MeM3DYrXIpmYWoYl1lX2kQF2UjvIQY5pJPfd
	yu4YBmdNujOrguJ/iet1DsMqDAZ3UXMHPzHsJvTVWff1Qzq2YshJJu77xbupronn
	b9ZBenu0TCVp6LFHXqK0FII5fuf8+hH6nqgkc7ZT70uF5WXqAFF7dFL7I0BEsxLC
	Es1Llg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5j384cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:53:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so2420698b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412401; x=1786017201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErxhSvVhI8PKtxVKYTOJ15TBdUc3fX8hWfsvKH7O764=;
        b=VdSstWV0IPpVuTlTF8he2QT8/OAYUZ2EX+vQEG4DxMZsL9VnwD2DBgzhWSP4WKBOzT
         97K+Dv8ghseg9BAsi6HV+3A8hbu176eeSSlaHkj+sldBkTFzaZX0QkFqDRU8kWZeQ/bC
         WZRRAoAbj9686Mr+WjSR29/KUr+aZzUGUfm5tinjtGHOi3aAW9+ZbMUJmrhThefLzOZK
         ip3oO/i+RZwjhr24s2SLLgc2n0XHzu+ypiZ+Bz4mQx5eF0TGDf8DuvoSklMyyx0qE63J
         TyockPExwpaLKSzhVfow31rRgJo2bhs384skcXdK4lB79uN58CqyACr1/hr3sX5SS4wj
         ROhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412401; x=1786017201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ErxhSvVhI8PKtxVKYTOJ15TBdUc3fX8hWfsvKH7O764=;
        b=LmmWRlGwtjC5RMitFwbra8lo1kZNJY5TTZcSYtiLMdJodH/MOc6oiaoyRp0SJIAaCn
         O801c6Q3/IkpPxVX1XLBO5svqCkhL+6JQongltT5DZOCM2KIi24QS6DyTKak1sLJmZaT
         e2sfSiS2WPq6Z1L4OL/N3ILvmvFbvbBSAJMmj5nkmQ84saaMp0i4i4khwjt2jS2/rr8p
         K1g5SCZL6ySi042YHFOtJo1yze+O8WA5JuXrA47D3Wq+l3o6Th7ZtmhtHI9HCQSpQhZI
         lW6euvVS3gd+9bb61Ck1v41zJhVy3fnky5K8xo9VGgWKgNtLimW0SHf2duPp5tClwh+M
         PT0w==
X-Forwarded-Encrypted: i=1; AHgh+RpPkH0x9ZaLKVNdpUgLwkMH/s217Qzwuvakd4uwqgHLIC0q99WVdtX2x8u/YLxBrmS310NM7Kq3i2BT8VY+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wJVUZ7GbJ+BqzwF0ZKwfwqM3rvxLYbpAoPv7bo7jzSD4SXjs
	Cr3eyvkX7aAgGBhq0SkitDU7xaoqMLHWxYu983ciQkWw3BJvZ1hvlhHFhZeLim6+qDW2OMlOAsg
	5um8BrtkAtW63VDHWK1rdkbFppw9rw3jtSJ0uHzO77lbAvq5Hni+PPx0axP+z+lHZlkZ2
X-Gm-Gg: AR+sD13IEbxtAd+Jn4cZTweL67l2+3D8U/NWuciq2gAUf4W3EYMRBoIao+MSfFyLmf6
	o50ppuOMqW33unkkjVq3pdmaXd1apuKn2NXwESvsJEGKbWocgf0NGjWBu6bE0Uq27vEfL4iHN3o
	jilkuMUPE8Z3J0Cu0Pa3Fs4l5fEY51cZuHVdmVWXtu6Xgv393GddW4KNGUwibd+XAg9fE78LJR8
	wJMBlxHqUcAOM8voXZiSF8nGUvADN3xlpXl/yQWsu2sEo2yQFnHHlUFP905iz9aDoDLfi/DgOYO
	iSefwiYlOugmNR6b6J+vvmySGHlTTeugmuJ8z/Ea3JzY6ZfB5zN3sICSFDpvpLXkaxiaWO3xM6e
	boo2MHppxw1PZe8tPVhsEAxRVRoxeH25i
X-Received: by 2002:a05:6a00:400b:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84ebc22bc30mr2281101b3a.19.1785412401360;
        Thu, 30 Jul 2026 04:53:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:400b:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84ebc22bc30mr2281077b3a.19.1785412400868;
        Thu, 30 Jul 2026 04:53:20 -0700 (PDT)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea7344ca8sm2615829b3a.21.2026.07.30.04.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:53:20 -0700 (PDT)
Message-ID: <be5ba8e8-15d0-4fe4-a66c-fe7ce8da6cc3@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 17:23:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
 <amZkf3lu7gjWhw04@zenone.zhora.eu>
 <0c0d1406-949b-49ee-b203-3833b9f8433b@oss.qualcomm.com>
 <ame2tX1RwOo4F6Lk@zenone.zhora.eu>
 <cb1e00ea-658a-416b-aef6-46c151d15685@oss.qualcomm.com>
 <amh5l4Yvwemws6Cx@shikoro>
 <fc90084e-c9bf-43da-bb8b-43a8d2d0cb7f@oss.qualcomm.com>
 <amoaEGX8Q4zwHF2i@shikoro>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <amoaEGX8Q4zwHF2i@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cP0URLhz2vw7syKeWgC6H4r5JxdWHzcl
X-Authority-Analysis: v=2.4 cv=JeWMa0KV c=1 sm=1 tr=0 ts=6a6b3b32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mCY9CKRV9xF68oVvIlMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cP0URLhz2vw7syKeWgC6H4r5JxdWHzcl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4OSBTYWx0ZWRfX4osecmle5tcd
 /18glY5iVMenSRiUpWttCqHmBpeg7Lr03VxN6QDKBJ8bJvysL+5v2HX37J5SCMVzfqZ63A25DtG
 t3cI08WSwPC098FyWg82oQcYmTfLoTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4OSBTYWx0ZWRfXzJyYgfqAib8J
 k7gBEKtwgdCh6EYLAYGdsH8eliHdag2C5plyb5AMU8iTeqSYPIxZ3vlBrz31xmC43K9qAxqr0gD
 xQ4OAmEDI1YUm+0AVKEdx+g2qyMlFWfSHuD4RZs2iK3adkoebEweED6zYgxmbgt5hGKiA5f0T4P
 qP3J1nb4Eci0JUTLzoyq2ycWMOhKdymZOArFaHDck5ZFp7HafSyie1xPf7Whs3ceh8VJjs5MAPl
 XD3in4cf9sxF6nA7njzM+WqHKBfhcZvFcES3pQbjnTHoB02j52faRTd7mu6JSosSr28WqndBBIy
 RaSXLFGYtMbvrWj777riT5JVNdZRe034+ZSDck1CBmUWlTElNu1p15vkNJe63nT4ChvoQPNfWYn
 CDBqVphN7XjsOcjfZtvH00udi8L+0DeLCZELVENjzTJiUlCQ0nhxfG7KjINEbsgCaX9HNajOmIO
 /EdZs2DfSgg4ObowFuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300089

Thanks Andi and Wolfram for the detailed feedback.

 From the discussion, I understand there are concerns about introducing 
a generic timeout policy in the I2C core due to potential regressions, 
platform-specific behavior and interaction with existing timeout mechanisms.

My primary goal is to reduce the excessive timeout delays rather than to 
change the generic I2C core timeout policy.

Given the feedback so far, would maintainers prefer that if i drop the 
core helper entirely and keep the dynamic timeout calculation local to 
the qcom-geni driver or should we continue exploring an opt-in 
core-based approach?

I'd appreciate maintainers' feedback on the preferred direction so I can 
align the next revision accordingly.

Thanks,
Aniket

On 7/29/2026 8:49 PM, Wolfram Sang wrote:
> Hi,
> 
>> I agree that the precise timeout is platform dependent and cannot be derived
>> exactly from the transfer parameters alone. My intention is not to determine
>> the perfect value, but rather to provide a reasonable kernel-side default
>> for cases where no timeout has been configured explicitly.
> 
> We have that already. From the I2C core:
> 
> 1572         /* Set default timeout to 1 second if not already set */
> 1573         if (adap->timeout == 0)
> 1574                 adap->timeout = HZ;
> 
> This may not meet your definition of 'reasonable', though, I understand
> that. But you need to be aware that you immediately enter
> regression-area if you change this behaviour.
> 
>> Since kernel-space clients have no generic mechanism to tune adapter
>> timeouts on a per-system basis, deriving a baseline from the transfer length
> 
> This would be easy to add. We could introduce
> i2c_client_request_timeout_margin(client, desired_timeout) or something alike
> with basically doing:
> 
>    client->adapter->timeout = max(client->adapter->timeout, desired_timeout);
> 
> Or? Then we would get the theoretical value of a client. Which is maybe
> exceeded by the board specific timeout set by the board designer. It
> gets tricky, though, with userspace. Who has precedence then?
> 
>> I am also suggesting let userspace add something on top of this if the core
>> derived final timeout is not sufficient.
> 
> Why can't userspace set an absolute value like now?
> 
>>
>> This is an option for userspace. Should we expose device attributes for
>> kernel space ?
> 
> See above. adap->timeout is easily accessible.
> 
>> Yes, and I fully support keeping I2C_TIMEOUT as the mechanism for userspace
>> adjustment. What I am proposing is complementary rather than a replacement.
>> The core could calculate a baseline timeout from the transfer
>> characteristics and apply a conservative margin, while I2C_TIMEOUT would
>> remain available for systems that require additional headroom beyond the
>> default calculation.
> 
> If you have two ways of setting a timeout, people might get confused.
> 
>>>> Do you see cases where a transfer-time-based timeout with a generous
>>>> system-latency margin would still be insufficient?
>>>
>>> Regressions. You could time out too early on boards which worked before.
>>
>> That is a valid concern. My assumption is that any calculated timeout would
>> include a sufficiently conservative margin, based on measurements across a
>> range of systems, so that existing working platforms would not regress.
> 
> You simply cannot guarantee this.
> 
>> platform still requires significantly larger values due to exceptional
>> latency characteristics, I would expect that requirement to be addressed
>> through the existing timeout override mechanism rather than by forcing every
>> client to use a large fixed timeout.
> 
> The only way to deal with this is 'opt_in', not 'opt_out'. If you want
> to provide different defaults than the existing ones, I think you should
> make this available via a kernel config option, so somebody has to make
> an active decision "I want that and I know it can regress".
> 
> I am still not convinced this is all worth the hazzle, but let's keep
> discussing...
> 
> Happy hacking,
> 
>     Wolfram
> 

