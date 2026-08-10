Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D725B0A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340516; cv=none; b=GKZjd2nzwwzODrUYdheF8ciKKwMKEwzC36BRcceT9NrnqqOCaptuJoLczwpulgXSNBYToNSqoLxMTNU5EFbb4hnUaHU9v8dqhdIp0oOf2m0s8wqC3MNI9cLzhFEZO8t8H98xV6sE9GyTy+uVACwZ29PSgsDQz1ORQeSkYqLWkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340516; c=relaxed/simple;
	bh=rWJbsPq4NMxYuVvIwgSXGrbZkPETxDqo7NjXhWXcNKo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VpHx6X400ICuRUbhqPS2qCS8dzfxOYSg5M7/9dEYLpRMI9mSngPxtxzg1Hca5bxo+N0w2k5n9VBKl8g7wZIpOGpF6txMvqvY221TJR3uTxR1KxaIR3gdFdqB/fM6IBmojkHrw0EC7kBOgA7jfHUvL1pp927EXA/D591Te17H/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kL8uPWFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BrzLxC6C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kL8uPWFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BrzLxC6C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5IFMZ559840
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwdPS6BPI3cJ6x/MkvQILCA4STdQ09qDXqScPnCvO04=; b=kL8uPWFYRtZtjcfc
	6GjA7bOIPIDtNNcuFDQu4JD89La1VtQZdYbnssmpA5lKzHz497bO+YY581Giz5Sp
	+hGp5Aay8kVD+glctCEqxkyQqWzrqtkj84vATQG76ks7swipnbF1SG794LTrm6QT
	+7slHxMOoaXXJMDPad2YdF/VguFhLimo1skGqeRWfc42ecRFmOxq7h4WrloslY3S
	WxpPPZcSlVHD7mjvdPUp2+mEAeXiUMCha1nyaNB9rqoMDEjTaVgafUDRflhlb88C
	zvvAXzGYiVp+aWszmcR7O/jFtadFxWFHBa1darF8ORSWVW1u9RDqVbQY3CNK9jjh
	GQfXMg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush4m43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:41:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso1712245b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 22:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786340512; x=1786945312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwdPS6BPI3cJ6x/MkvQILCA4STdQ09qDXqScPnCvO04=;
        b=BrzLxC6C7y75V9SPcjxTj/BBf8XnSg0TylIc4qZ9OFDxRi5me5Q/JpcmSzWxaG5a3C
         BsW9L339xB6rhrNJpBs6S586NSEN0uLd7us7ZFQGZm2UMN7PzfC3qUn5n/cRum2+R7YT
         u7xVfx6sJEKgwCc55P+bxDlJ+Yo3v/6smkrfYFOG2tXsJiWzzfDtarWf8b9FJPl8aVzq
         vZZHsrq74j11ZjqGpy2ynFXnYc0D7u7mCvE7FysE62tc+mtRK+koOx3NTGM0II79QqcX
         OcSBzwaQJJQp4yH0cwi5slW98JXHyz9dTUsoEaUKQXPDYBmBRIdIc2M5C4c5zJBVikJC
         JW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786340512; x=1786945312;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwdPS6BPI3cJ6x/MkvQILCA4STdQ09qDXqScPnCvO04=;
        b=PVZSStQssD5XE4VeCsi75YMOul2xtaG147I4oeK+nD1oieZoxnR+yYi++sevMSZR2O
         llmTKuuHqjNOSLG1J1J7WHHqhZGN6p8UoIfd9x8Gd/922PPqTG/Z5Y5LNNr+sXXBlb/u
         Pkz806mAcqfGw99HuXrwMMoiradjqAy3A0G+hAOpG+qjKPM+pYLQ1A+o0Va3k9N3luW2
         lY+hVLX5Em5u1nNvtow9e2sCtfn/qUmAAuphXfb229QiWY9Gq5GZXWveEgr6cy4jXVR4
         KL2kFCnFtb3mYL9qTPv9sVkjR8ej3g2xucc0ZbHrRRH4a3HtKjB0QksLnajN3RlphHLD
         hKSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8qgDxYV37ouOK2MCNrkeebDAuCHWzmB6zn1CwhgL8XF8Au+6yGyBrCTnZycqKXmrcTy/pL9/iRMuREwKG@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhAVo1q9PvV65ZRNJxYl2cu74wxXoMtt5Zsevhk/PTzARtKDp
	dkrIoiP9AgWq/CPyAnkwFAHpvPEvdVTeqpEF/pr+0p7kt8iRv1nAY+9Sou0xdyC4qSizyslOAtm
	quvB+sUSMoYVy+fxSvIBscJP3CQqn9PzbYgHGCfxPnavF8YfMFD41vpHMB7BU89/iUEeR
X-Gm-Gg: AR+sD1015cSYf8jrnJjvxK2heLDPTrsyumBGFv1YnRv3xnuTrS6iG5GVsk7C6U2v3XL
	pt5MOPHK3DPBdXhNWpp3SBsjGQhxO8PdUU4lCSmbHp5xhgxvieJfCowOZtQCdtEQwbp/wXffllK
	P3daHjRBS46SVD+KCGX57MXZXYC4J+EGYtLcICcXfj4U/UUV2oNsX/3yI27p2HbtFjSP74oqOHV
	i9/8ycUsxUYic7VzhpkzVpPupyQVajAe4w9LUcO+jkkQ2zYBXwHUuRNIBP+JB2sn1vRYMyA20bG
	D/HQAeTXkg7AkslEPaVOL+7X97jRgHIrzXEFgpo6hEzo8z7Pbi14ArLJ6jg1Lpd794ze/ygwatR
	sUbBHazAkvKqjEglHGqQu9yUAPUsB
X-Received: by 2002:a05:6a00:421b:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-84f4fd9f5demr29776120b3a.3.1786340511576;
        Sun, 09 Aug 2026 22:41:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:421b:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-84f4fd9f5demr29776061b3a.3.1786340510970;
        Sun, 09 Aug 2026 22:41:50 -0700 (PDT)
Received: from [10.92.216.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19ace6sm3330515a12.2.2026.08.09.22.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 22:41:49 -0700 (PDT)
Message-ID: <c3986935-f752-466b-9fa6-c8dabae551e6@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 11:11:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
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
 <4cc5c18f-0d33-4729-9094-e520e3142c2c@oss.qualcomm.com>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <4cc5c18f-0d33-4729-9094-e520e3142c2c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mo9IS304VB8zSStlyFfEdVWOjn3MBjXb
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a7964a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JLMV0JcVZ0rNMN_a014A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-ORIG-GUID: mo9IS304VB8zSStlyFfEdVWOjn3MBjXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0NSBTYWx0ZWRfXwu9/s1RGXu4e
 jXcXBk2PIAjHtJryB77txJWguaB9SXDfYc1KOz+BuPu9nxPvuAjSK3P/D+JR+ycjr8jh2m6qIZc
 G2RDnevy28mqL+Co637lOIEbdcJpQdWkyTtS5T0TgdwudRkLhao+9ZTX5D0LdWZOiRWjZ7sobGI
 I9uQQIQStbg3mdsWIJlwx1DSMZKlNUppT0895ZXAym0CY/Tm0YNWUV+4/r3B8yiNLWfMZhUxmZv
 NOKXH2SMWCp8QFKrMy8OqojSnT3oSe0MriI7f99uJTuKuCv2vRp/2fb1B9BIIeF/qTIl93HTRM4
 XG7L75LhXjC3Od6ftIC94RXPoqL7cwIaW3RbX54yZf/iIenLGCGMUAtiXjW7S7zkJRJ0UyRAQ7A
 gfvrJpdJbQb3izuceULn8UNi/9BEbfSYoOJv3z9cLXl1MvOHiZ0ql7Qv1Jt8cwziu/XE6OkLqpQ
 6vt95RTNoeBycz08Mgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA0NSBTYWx0ZWRfXy94N15LYELNw
 m1DBIXbNc2cYl4ngL5GKeaxQk+LYsIJOqxwSRlT8LCavKcWJ/rJDOSeanDOI2+QLjHzjvx9/nO+
 uwnqYu2/mTlio4tQDdnv78I32ao8eXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100045

Hi Dmitry,

Gentle Reminder.

Thanks,
Harshal

On 03-08-2026 08:22 pm, Harshal Dev wrote:
> Hi Dmitry,
> 
> A gentle reminder, do let me know you opinion on my comments here.
> I plan to spin a v3 once we're aligned on any open points.
> 
> Thanks,
> Harshal
> 
> On 24-07-2026 02:43 pm, Harshal Dev wrote:
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
>> is available within QTEE, and so QTEE does not need to make a callback request
>> to Linux to request RPMB frame routing. However, in case of UFS/eMMC storage the
>> driver only exists in the Linux kernel and so QTEE must make a callback request.
>>
>> And so, if you try to use the QSEECOM driver to write EFI-variables to RPMB
>> on a device with UFS/eMMC storage, it won't work.
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
>>
>>>
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
>>
>> I need to double-check but this firmware release for Glymur on Qualcomm Linux
>> is probably carrying the support for QCOMTEE based uefisecapp access:
>> https://github.com/qualcomm-linux/meta-qcom/commit/728251fcbe5113980805ea6c571e33235062ee71
>> If not, the next release will definitely have it since I have merged support for
>> this in QTEE and talked to the boot firmware release team about this.
>>
>> The next planned firmware upgrade for Hamoa will also provide this support for
>> Qualcomm Linux. And similarly, for all other targets being supported upstream.
>>
>>>
>>>>
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
>>>>
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
>>
>> Regards,
>> Harshal
>>
>>>
>>>>
>>>> This patch series has been validated on Kodiak RB3Gen2 platform with UFS
>>>> storage by attempting to read/write EFI variables via the efivar tool [3]
>>>> after mounting the efivarfs filesystem. See [4] for an example.
>>>>
>>>> Merge Strategy:
>>>>
>>>> This patch series could either be taken from the OP-TEE tree or the
>>>> QCOM soc tree. I would prefer it to be picked by the OP-TEE tree since
>>>> all except the uefisecapp TEE client driver patch in this series make
>>>> changes relevant to the TEE subsystem. It would be great if the QCOM soc
>>>> tree maintainers can Ack the uefisecapp driver patch.
>>>>
>>>> [1] https://github.com/qualcomm/minkipc
>>>> [2] https://shorturl.at/zQU07
>>>> [3] https://github.com/rhboot/efivar
>>>> [4] https://docs.qualcomm.com/doc/80-70020-27/topic/manage_uefi_environment_variables_using_efivar_tool.html
>>>>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Drop using MSB of the object_id to distingush kernel and user object invoke contexts.
>>>> - Introduce enum tee_object_invoke_origin to check the context of object invocation.
>>>> - Link to v1: https://lore.kernel.org/r/20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com
>>>>
>>>> ---
>>>> Amirreza Zarrabi (2):
>>>>       tee: Add kernel client object invoke helper
>>>>       tee: qcomtee: Allow object invokes from kernel clients
>>>>
>>>> Harshal Dev (4):
>>>>       tee: qcomtee: Track the object invocation context
>>>>       tee: Export uuidv5 generation for TEE backends
>>>>       tee: qcomtee: Add support for registering QTEE services on TEE bus
>>>>       firmware: qcom: Add support for TEE based EFI-var client driver
>>>>
>>>>  MAINTAINERS                                 |   7 +
>>>>  drivers/firmware/qcom/Kconfig               |  24 ++
>>>>  drivers/firmware/qcom/Makefile              |   1 +
>>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
>>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
>>>
>>> I don't see any changes to the QSEECOM drivers. Is it allowed to use
>>> QSEECOM and QTEE access to uefisecapp at the same time?
>>>
>>>>  drivers/tee/qcomtee/call.c                  | 205 ++++++++++-
>>>>  drivers/tee/qcomtee/core.c                  |   9 +-
>>>>  drivers/tee/qcomtee/qcomtee.h               |  12 +
>>>>  drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
>>>>  drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
>>>>  drivers/tee/tee_core.c                      |  24 +-
>>>>  include/linux/tee_core.h                    |  23 +-
>>>>  include/linux/tee_drv.h                     |  18 +-
>>>>  13 files changed, 952 insertions(+), 33 deletions(-)
>>>> ---
>>>> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
>>>> change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
>>>>
>>>> Best regards,
>>>> -- 
>>>> Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>
>>>
>>
> 

