Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96130D3F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534238; cv=none; b=ldyb14VYjhPTYuio/t0Ts+G6sgZzFZts/GJSzv8QyHy4u7vpOKEOXjOZwWotUrXAsWzQfolCpsKdHvccvq4ZK/wIGM39r2IroMOCodK22p4CJTzDstahwN/aMeLWuK8iRIqfERcbGOz3JdHbNqLY4TkxiygQJKxOv/SGeS3XnYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534238; c=relaxed/simple;
	bh=VMYVLTm8HwuLV9LvY+x3xnVUytjhmysp08P4b2byJ/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3cwj0/Iy6uUCC8foQ43/ugLNnMV/O0ioU+8LQ9igmAg//4HVjF90qY5TaiTWFZeXVzp/qjNHiKAHik2YOdilLTXFwLlGYBZ0pk7g1wCdsobGlm34ZZYmNB0xqNKr4NMzqunHraqHjGCCqIEWTP1WcSh60e+LURTEmt8OrgSNfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm/wR4eA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ai6NYMZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm/wR4eA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ai6NYMZV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4YuO3963474
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 11:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45m0arpIK9gobFgK8HIMCO3pzjK3eUXS0n5FFZwjaB0=; b=Xm/wR4eAH2YH4Ymm
	1tBmnMIJS0stWqvc7tl1TKRkdkF6oxBIH71WbumE/bvt7LhYoMq0viMgr289/ZgH
	L5T8fcmS1N/eI8PUGPzrH/N5JPvubyVIdsEfPvDf2CVoKv87Cy8IgnmR/ibp4dXH
	7QbtBOs3aTiMYZIRAKabAL/5KmER9x1KeYeVhacEB3uMDinfO46fbMCOvTLEm4//
	xE3ZE1lVuBTFF0FnQkYVb61nvcaYNj4Ec42r0nFva02hvaGBq4ZyxCZV86EcwSeJ
	VgpfY9txAf4cp9dUdI+LNREDF2xYbp+gzRb+UXckB0HHiEJXsGBc2RlPW9iWY50t
	MdogEw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nucghvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 11:30:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e048a801dso1197470b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786534234; x=1787139034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45m0arpIK9gobFgK8HIMCO3pzjK3eUXS0n5FFZwjaB0=;
        b=Ai6NYMZVQYqvAWzqO1ysypy96vKoCbolQ9/o3bcn6HzPcYF1YRXwEJy7dTUW5oxefV
         +V4LtoxEhdzqtCOmMYJfGkMbDsbD223XU4Nfm4wGtOpCPJ2shULfeFx3tD0cFymcYFY5
         pHf+fXjLzVNhjOBOPsSoUwjh+SU+0N3QV11BF+3Nj6UuouaSoNokcNF73SD8UxkUGGWR
         62IzO5OJ4VZaKTRvn7FPHxer2ZzoyMiGvpcRXwOleGNzbhdeFUAsHgTwKJdnSUL38Wyt
         vzAOqha4nu40ns+kTFTHmf3LfRwHHRBZTWPsSfqKa7SXbp8cwOLuxJqOOOQhdE8QKpDO
         TVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534234; x=1787139034;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45m0arpIK9gobFgK8HIMCO3pzjK3eUXS0n5FFZwjaB0=;
        b=Jbde2NMgZMa8BJeDuKPDvef6gNN6ujsdN7Z/E/yTXQE7+ENrs+8rd4KWXkgUxHKt0H
         mk49OjO6sn3vToSkNJg8bjJJoXXigSVANwpjduETjpejj86XODGgpNhhRQlzDiFAXg7p
         1Yu0vLbeYAG+NpFy7MB7EVD1q1stT67ocgFQwDq7jNrauNlJfjIhwY7sxpmnM1JgAfiW
         lRm4KHXTYspbUo2GsUV9JLDfz5EgugeoLzKt0Zrk+tWnz+c0WMw2D5M/wwjXt7vdBWco
         LrWCzLnMl5Q42OME0e/eJYiHoRSaYQg0FtvM5CwyKTSmUPX6MySgY0Iri04N71PJLXNL
         dKHw==
X-Forwarded-Encrypted: i=1; AHgh+RoCICJGOKgIEusuT+YYD8we/REG4R3N+lgrWHCFbLp+Tnz2V4CGB+CcqZbn9e5ApTXDosYjkOszX/WkDOWI@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYItMiu0l3tWbLmOGwEtc5uEhPHZC3IUTN7smdo1jDECNYhdm
	BR4yj4UDG3tBIUSqj1dxq656t/sXETp3g1zBMZgP7vs6gQnquX09/2GynDikd0d4Z8M/ht9+2ZM
	id2j9+gtdaKbdptNSqyc/roMSZgQf7D/Hi8SDrRknTDFgChewe9eSKor0utL2tY0pR+gs
X-Gm-Gg: AR+sD10AtiXxvV4utWZJHiqmrlwd7TrNCmgqHx6YM8eRD/kbKnpLShVvcN3WKs3967X
	Hszq52Jclgx5uSzJi6p3ibr9lrItRO6UkVa0DA0BLlzUmm73b65aiBimwkS83i1X1j8AaZOmn2/
	8dVMocCy6v2f5VWsoKBGbMFzvWQP3ENf38QTkAIL12Yc2QW/EpAMTDYMKHVyDx3REvDjmjidqZQ
	ItY6CksNBeANTPSAGfvUyvDBlQFcuvBPmd0ARjWeMq/HW9EuLaMv4dU12dTHc/wW2w/hlNrAnuT
	UHvH1qrP+Q7Q4rDWEOh52Avu+/XZAmyNB1gjfZ0FpctfzztKgVaPxXMjEN/a9m5EbZRANbuQbcq
	DUcyv1STQL7EAvu48/fnmDzhZm6TA
X-Received: by 2002:a05:6a00:4501:b0:848:4859:a45 with SMTP id d2e1a72fcca58-84fb53be4ebmr4718822b3a.2.1786534233822;
        Wed, 12 Aug 2026 04:30:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4501:b0:848:4859:a45 with SMTP id d2e1a72fcca58-84fb53be4ebmr4718691b3a.2.1786534233003;
        Wed, 12 Aug 2026 04:30:33 -0700 (PDT)
Received: from [10.92.216.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1d23536sm874920b3a.19.2026.08.12.04.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:30:32 -0700 (PDT)
Message-ID: <10a091a4-89a5-4a0c-820d-c5b91dd52529@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 17:00:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <nfijwr2ptpxqvdw625yedep7tmakwvkeavyeobrmig5hbkw77w@rcqyp7h4y327>
 <db27820a-2b43-45e4-bc4a-0e9e81aacd93@oss.qualcomm.com>
 <oicbypv7rpxmweclopi5xxpcfq5chnypp5tlqd4uix2pm5e72f@kd3bibeximjq>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <oicbypv7rpxmweclopi5xxpcfq5chnypp5tlqd4uix2pm5e72f@kd3bibeximjq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o2oYac1Bbyt-V7hf34QGfWq4mcxpMC3h
X-Proofpoint-ORIG-GUID: o2oYac1Bbyt-V7hf34QGfWq4mcxpMC3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5MyBTYWx0ZWRfXyhZUtU3A3faC
 byTvxr18vU6JHgqS9+HgKxCxrWIiC6WCjwC/f0jEu18TOkk3u0OQ5fzH/9KYJAkqxuRKzrtHWc8
 LPDKwZV22FKZ46i3Lxjw7qozDkNvY4WunC5u41ZQG+qEUBKBJMQz4UbnDdtENz3iwqqkwKYqBTG
 vsP0dfbnLwcDqEJYEkPhBVuJe3rGpNm9a7Tg6q41IV7i2ncRzd7oMBwCmxEcJKj/iQgoA+IBKGx
 9eQKF17DcIHZ/fKVViBmvqRhgyJ7DL2hHxhIeXuUNKkus8srwtTdHNb+hF1OprD2cSDm6yDNVqk
 k/0oMfdlmglp5a69pxBBrZtVeFi+Yl51mZvG+MU272P0MeUQdja2HfBG8XxyrnBOjFEXDjEBp09
 RU7MnD9l/CcV258oU7vSD1QIZp/aIxGrDiTXf2ebHb4vqGlO3gsKezZCj0BQ+178bL4P6IriZMd
 k+IsPsye65OIIIa3N+A==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7c595b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=G4FKYnypLkvNXtvXe0wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5MyBTYWx0ZWRfX970/gCF70KEv
 fZMlwSOwau6M1FZZER7rW/+ebQP4j59MXc137A2pwQRCoQ590lpCClcedzcJLp0WIB/3nkedxan
 pXro6M+gJyYYlngxEE71oxIr18DyXPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120093

Hi Dmitry,

On 10-08-2026 12:37 pm, Dmitry Baryshkov wrote:
> On Fri, Jul 24, 2026 at 02:43:42PM +0530, Harshal Dev wrote:
>> Hi Dmitry,
>>
>> On 22-07-2026 01:56 pm, Dmitry Baryshkov wrote:
>>> On Wed, Jul 22, 2026 at 12:29:11PM +0530, Harshal Dev wrote:
>>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>>> Replay Protected Memory Block (RPMB) which is only accessible by the
>>>> Qualcomm Trusted Execution Environment (QTEE).
>>>
>>> Is it so? I think RPMB is accessible to Linux...
>>
>> I should have been more descriptive here, RPMB is accessible by Linux but
>> its frames can only be prepared by QTEE.
>>
>> The RPMB key which is one-time programmed into the storage controller to allow
>> authentication of the RPMB frames is generated by and only available to a TEE.
>> So on Qualcomm platforms (and many others platforms with a TEE) Linux can only
>> route the RPMB frames generated by QTEE to the storage, it cannot create and
>> write the RPMB frames itself (it doesn't have access to the key).
>>
>> While it is possible for Linux to generate/program/store this key, on Qualcomm
>> platforms we do not want Linux to do so because we do not trust it. We trust
>> QTEE.
>>
>> I will re-phrase this and make it a bit more clear everywhere.
> 
> OK.
> 
>>
>>>
>>>> For Qualcomm platforms without emulated RPMB support, specifically
>>>
>>> What is emulated RPMB support? Why is it mentioned here? Which platforms
>>> use emulated RPMB?
>>
>> Emulated RPMB refers to RPMB on a storage which doesn't have its own firmware.
>> Primarily, NAND/NOR storage. Unlike UFS/eMMC storage, NAND/NOR storage does not
>> have a storage controller where we can program the RPMB key to be used by the
>> firmware. So we must 'emulate' RPMB by moving the storage driver within QTEE
>> and making the driver hold/use the key.
>>
>> Qualcomm compute SoCs (Glymur, Hamoa) have RPMB available on SPI-*NOR* storage,
>> and a driver for communicating with it is also available in QTEE. And so, these
>> have 'emulated' RPMB.
> 
> This needs to be explained in the cover letter.
>

Ack. 
>>
>> I will add this detail in an updated cover letter.
>>>
>>>> platforms where RPMB is not located within SPI-NOR storage and instead
>>>> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
>>>> a callback request from the UEFI Secure Application to the RPMB service
>>>> running in user-space (within the QTEE supplicant [1]).
>>>
>>> Can it be moved to the kernel?
>>
>> We have a plan to move the RPMB service to the kernel similar to OPTEE:
>> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/tee/optee/rpc.c#L449
>>
>> It is a work in progress. Once this happens, we don't need QTEE supplicant available
>> on the Linux distribution.
> 
> Ok.
> 
>>
>>>
>>>>
>>>> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
>>>> QSEECOM based uefisecapp) does not support callback requests.
>>>
>>> How did it work then? I think Windows has been perfectly using QSEECOM
>>> rather than QTEE.
>>
>> It works because Windows on Arm on Qualcomm has SPI-NOR storage. A driver for which
> 
> I have WoA devices without SPI NOR. Windows still can store UEFI
> variables.
>

Ahh, the key point here is 'Windows'. Windows has a separate way of providing
RPMB access via a service in the TrEE driver within the OS:
https://github.com/microsoft/Windows-driver-samples/tree/main/TrEE

However, the Linux QSEECOM driver we have here in upstream does not have that support.
And so without the QCOMTEE + QTEE supplicant combination, we cannot access EFI
variables on these Qualcomm WoA platforms when they boot with upstream Linux.

>> is available within QTEE, and so QTEE does not need to make a callback request
>> to Linux to request RPMB frame routing. However, in case of UFS/eMMC storage the
>> driver only exists in the Linux kernel and so QTEE must make a callback request.
>>
>> And so, if you try to use the QSEECOM driver to write EFI-variables to RPMB
>> on a device with UFS/eMMC storage, it won't work.
> 
> Yep. It seems to work under Windows though.
>

As explained above, the mechanism is different for Windows. A different driver
and a different protocol. :)

>>
>>>
>>>> And on
>>>> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
>>>> QSEECOM interface fail due to lack of support within Qualcomm TEE.
>>>
>>> So, I assume, on RB3 Gen2 the QSEECOM doesn't report uefisecapp as
>>> supported. Does it?
>>
>> It doesn't, this API returns -2 if I add RB3 Gen2 in the allow-list for QSEECOM:
>> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/qcom/qcom_qseecom.c#L46
> 
> Does it support QTEE-based uefi variable storage?
>

It does, the QTEE-based uefi variable storage app, i.e. uefisecapp is loaded by
UEFI on RB3Gen2, however, the QSEECOM interface on RB3Gen2 is broken so it misreports
it as 'not supported'. But the app is loaded and available, which is why if you apply
this patch series, you can communicate with it. Just make sure you take the QTEE
release mentioned in this cover letter.

>>>> On these platforms, a TEE based uefisecapp client driver is required to:
>>>> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
>>>> 2. Ensure persistence of non-volatile EFI variables via writes through
>>>> the RPMB service hosted in the QTEE supplicant.
>>>>
>>>> This series introduces such a uefisecapp TEE client driver for the
>>>> aforementioned Qualcomm platforms which installs efi-var operations _if_
>>>> the QCOMTEE driver registers support for an object-IPC based uefisecapp
>>>> service on the TEE bus during its probe. Only new QTEE firmware versions
>>>> available at [2] provide this support.
>>>
>>> What about existing WoA devices?
>>
>> New Windows on Arm devices like Hamoa/Glymur work perfectly fine with existing
>> QSEECOM based uefisecapp. But they will also work with this new QCOMTEE based
>> uefisecapp once they upgrade their firmware.
> 
> Do extisting commercial devices suppot it? For example, does Lenovo T14s
> support it? Will it continue to work with this patchset in place?

Existing devices like the Lenovo T14s do not have mature QCOMTEE/SMCInvoke support
on QTEE side and new QTEE versions for it are not being rolled out. However, this
QCOMTEE based uefisecapp driver and the QSEECOM based uefisecapp driver can co-exist.
It will not cause any breakage of existing working functionality since the QSEECOM
path can probe and continue as usual.

As per your comments on patch 6 of this series, I plan to enable the QCOMTEE based
uefisecapp as default 'm'. That way we don't need to enable one over the other and
will continue supporting all existing functionality while extending it for devices
with UFS/eMMC storage and running upstream Linux.

Do let me know your opinion on it.

> 
> What about other existing devices? We have WoA devices starting with
> MSM8998. The QSEECOM driver works on them, but, as you mentioned, it
> can't flash updates to the backing storage.
>

Unfortunately, unless we roll out new QTEE firmware versions for devices like MSM8998
with QCOMTEE/SMCInvoke support + access to the Uefisecapp over SMCInvoke protocol,
they cannot be helped with this series.

>> I need to double-check but this firmware release for Glymur on Qualcomm Linux
>> is probably carrying the support for QCOMTEE based uefisecapp access:
>> https://github.com/qualcomm-linux/meta-qcom/commit/728251fcbe5113980805ea6c571e33235062ee71
>> If not, the next release will definitely have it since I have merged support for
>> this in QTEE and talked to the boot firmware release team about this.
> 
> Does it work on the CRD?
>

Yes it does, I have validated on Glymur CRD by locally switching it from the current QSEECOM
based uefisecapp to this new QCOMTEE based uefisecapp. This is the QTEE release which
needs to be consumed for it:
https://github.com/qualcomm-linux/meta-qcom/commit/5590c1dc631827624c110df282965b85ef2a2e60 

>>
>> The next planned firmware upgrade for Hamoa will also provide this support for
>> Qualcomm Linux. And similarly, for all other targets being supported upstream.
> 
> So, we are forcing users to upgrade to the new firmware? That doesn't
> sound nice.
>

We have an open ecosystem for all devices supported by the Qualcomm Linux distribution,
users can easily consume new releases (and new QTEE versions) to access new features.
Until now, developers/users of RB3Gen2 or IQ-9075 could not access EFI variables to
develop use-cases such as secure-boot key revocation, but by taking this patch series
as part of a subsequent Qualcomm Linux release, they will be able to.

>>>> Thus, QCOMTEE now maintains a static list of always-available object-IPC
>>>> based secure services exposed by QTEE. These services are implemented either
>>>> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
>>>> usually loaded by the bootloader. The uefisecapp TA is an example of a
>>>> preloaded TA loaded by UEFI. A static list is required since QTEE does not
>>>> yet expose any way to dynamically query and enumerate the services exposed by
>>>> it.
>>>
>>> Can it be fixed instead of having static lists? In the end, we can't
>>> guarantee that users update the firmware.
>>>
>>
>> Unfortunately, no existing QTEE release out there currently has this support.
>> But support for this is currently being added by QTEE team last I checked with them.
>> Once it is available, and a new QTEE firmware release is out there, we will add
>> support for dynamically querying QTEE services in the QCOMTEE driver. 
> 
> It seems you are still rolling out QTEE-based support. In such a case,
> please go back and implement dynamic detection of QTEE services.
> Otherwise it would be a nightmare.
>

We are working on it, but until then there is no overhead involved in maintaining
this static list of services because we don't have to extend/modify this list when
adding support for a new Qualcomm platform upstream. If a particular service from
the list is not implemented/accessible from QTEE we log the event and silently avoid
probing the TEE driver for the service. We also don't add platform specific services
here. So the list doesn't need to be extended on a per-platform basis.

So unlike the QSEECOM driver, we don't have to keep maintaining this list forever
for all new platforms.

>>>> To facilitate object-IPC interactions from the kernel-space, this
>>>> series also introduces a tee_client_object_invoke_func() to allow
>>>> invocation of TEE objects similar to the existing tee_client_invoke_func()
>>>> API exported by the TEE subsystem which allows invocation of TEE functions.
>>>> Some suporting changes are also introduced to track and handle operations
>>>> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
>>>> driver.
>>>>
>>>> Finally and as previously mentioned, access to the object-IPC based uefisecapp
>>>> service is restricted on older QTEE firmware versions. A new QTEE firmware
>>>> release must be picked up from QArtifactory [2] for all upstream supported
>>>> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
>>>> driver.
>>>
>>> What about fused devices?
>>
>> The procedure for updating the firmware on fused devices is slightly different.
>> The firmware images need to be signed by the OEM using the security profile
>> of the chipset before flashing/upgrading them. Security profiles are now public:
>> https://github.com/qualcomm/security-profiles
> 
> Will OEMs release new firmware images? What about the devices which are
> already out of the support phase? This whole story rotates about the 'we
> are releasing new firmware with new features' paradigm. However there
> are existing devices in the field, which typically can't be upgraded,
> From your cover letter it seems they can't support UEFI variables
> properly. However they do so in Windows.
>

Yes Dmitry, this series is effectively forward looking. QSEECOM protocol/driver
support is essentially deprecated on QTEE side, no new features added to QTEE support
it, and it also doesn't work on many devices like the RB3Gen2.

For existing devices, if they boot with upstream Linux and have RPMB located on
UFS/eMMC this patch series cannot help them. But the focus of this series is not on the
past, it is on currently supported and future hardware. Every new Qualcomm platform
whose support is being up-streamed or is planned to be up-streamed will have access to
EFI variables via this series.

If someone wants to add support for older Qualcomm devices to access EFI variables
via QSEECOM that patch series will not conflict with this one. Like I said, both
QSEECOM and QCOMTEE based drivers can co-exist.

Regards,
Harshal


 

