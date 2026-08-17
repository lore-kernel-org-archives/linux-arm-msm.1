Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD314EC73
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947862; cv=none; b=NngUvoVOpDjonwUrHw+QrKiarKKiE/6EgRSDbiUQLiwH57XFjVgvRcjKJYedYW/wAqRbvaPvYRyEK1+/ks/Y114SQRf+4otnJPUL0OHajro/iGVF1pTtTc0aUoqkC9uOeqyf37VUA9TezB3v3qUNSy0QBGj3I2zxTBf6caWzaHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947862; c=relaxed/simple;
	bh=pxHr1DO668e1Cfo+ay8hi7UPyyAJfYBoVIcsw2GKnO0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XCgv+ffG+DkRFxJfJYlMKUeqMgbYUwgwbx3bWfJOmNl1syxc4edlM6v1slxc9vIo24F3jbOWlFRPoza7efKMA8qtGPEwGmCcAM4DqW7WlZieOlEYrKOhDcUJYouKm3SuahyGju1KBaT3MdwznUTg2z0AQluy0IcAxfCv2WN5QT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETyrBSpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ET0B6w4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETyrBSpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ET0B6w4E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDbE01386986
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBFP7hldo5C2lrz3cpQNyiu4obDR/68aBGEyMVk4V+c=; b=ETyrBSpmYUJ93AgM
	HzKxHwdWNQjn2pmQVva3b5aTkEPx+TXK6+DfpgPm0peg5SGZo9j6E2EKHJr2kZJI
	1OLCcdZ4Pu7I3i3BPF29beOKJl5urEKsjAqCd2zDl9aPeUX5s/6/Y3nwSPLLmHD8
	iSleS0f8wpS4w3hMIoILB23AjIHm+4JwO2GyQg+Oh4UEYoLZZZSyYsEbpcIRwhzP
	HL98MWin0zUk7RY9lFKUwEIFp28mvQBGeIYHWKqa7g98hox8byP3DiDVo0OMyZIc
	Uqi1BgNnxTgWOLu6nJrL8eaEYRLphrOrWVNAqZ3f83AHJVf7m0ttW2xCotYTzWH2
	yekfwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3mx4s446-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:24:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so53501415ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 23:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786947859; x=1787552659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sBFP7hldo5C2lrz3cpQNyiu4obDR/68aBGEyMVk4V+c=;
        b=ET0B6w4EZnsSUkPsxmkZhRBGc1oKftd8bfHHjgetyUDSyxpm9zCLmPwwUXVAfbI2lM
         aYmrVKr9IFfY/5LSuIxF6oVJAspNb5FMGpVccHAOrVTEvtJgR1vYEVRLubxeY80pi187
         VKCkXWHW4gg2hUnzakvFoY0A/Fd905WYxIXzSljWAsx+J8JgW7doEIHWipOyM4D0jyQC
         0Hr/eM/8baRHDgu293zw4GJwz7WLtMWkeaBhiBXQHoFhVsjgBJDWu6BAZiyM8bc5P3kp
         wTLKOpCz1TxpKNAxCzvfZiGTcXfcDgElHs8COOtRNqEWwopzRim2gzsg6mFC5CZvrSI6
         S+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786947859; x=1787552659;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sBFP7hldo5C2lrz3cpQNyiu4obDR/68aBGEyMVk4V+c=;
        b=d6KXsldAjEv9R0ZV8b/gt613J7EbzxHI8iCwWAsJVWlq4lGD2HY6UVTbtbq5J1XuXV
         Vk4no/e3+QJ/V67jXFNXNh8cWUcrN07H2P+Cd570VJ4G2z0lsZ4PstQgaMq0mDwMqsUb
         kN/7cHw4Jqw2qKAW2tEn0bmPWYsFWhehUlo7LVluylCetmY/s+jkyloEv/XEd7FH3453
         u4gkIY78fuiCj9uM52q06SBKIt2rwRuuRFDFI9VDf4GZ7klH/dvMZLZHcoXBU0tYhcVA
         oO0KBYSH7/KKbb8lKUM3wHU7lAbed8aGYn1hh+AE3ctPX7TgkSnlYHUBZ5arzxu9qzxg
         G++A==
X-Forwarded-Encrypted: i=1; AHgh+RrpSu00u3102cc0HUsqmdS7PeFyZUsYtQUWKHsSe03w5fADIBDoXVnOBLnch004jB94LJXH2xNScjoK9pvz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2FE4DIdQUnmOPbmGOeisgrXCJGq+cMbJu3TxliPvCnYPnlxK2
	IvKHnyuvapF+UVBy84QUkGFbIk/ZCp0XC+LIMQRYMVI9uD5gdeJjEmISdqoRAtnF/auin0Af+LA
	wNBrYNSe5y9XkRJ5iBrKbIjPHkreq0Uwmer2XZOdWuBTSUxDLA4rFNEzBSADrJvZI1gCs
X-Gm-Gg: AR+sD13xEmq98FX0zHSy8b8akRDDzzmDlQWS53Ne5zfCsudvx6c+ZvNL+XX8bd01Uuu
	fXQdOLqvsB6ZAELQWTu2KOQ2OJkCVAt9cUwVENmTkmZlS5ZN7cTmXIct0qPYDCpLcmpmp4K0WfA
	Vk8svCSh8Nt29U1XbhPQ5gCcvFrPlSf56ppU9Y4Zt9cgmUt7XAa3KZfPnr10akj69UFjv3RO5OL
	iyj7/THyF5Ksnomba65jAYypSM3vCfCU5ukldL007ti6YDhBXlOETTJvGbDThYV50RQ1vV34bJs
	f4Lo4b1fn0ZzuIZrqnFXQDF2TNn9DKpw07NZeMUUHyaq+G5YGoaXyF+fC22rhAW40iTzCQn5RNx
	4iA693OWqYK6vr0DkesOCfPrX/NCs
X-Received: by 2002:a17:902:ec90:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2d3b0cf02damr216912415ad.23.1786947859149;
        Sun, 16 Aug 2026 23:24:19 -0700 (PDT)
X-Received: by 2002:a17:902:ec90:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2d3b0cf02damr216911895ad.23.1786947858533;
        Sun, 16 Aug 2026 23:24:18 -0700 (PDT)
Received: from [10.92.195.156] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb49e7c7sm984365ad.14.2026.08.16.23.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 23:24:17 -0700 (PDT)
Message-ID: <ebcfafdf-6cd3-49cc-8096-d1289af75fd5@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 11:54:12 +0530
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
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
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
 <10a091a4-89a5-4a0c-820d-c5b91dd52529@oss.qualcomm.com>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <10a091a4-89a5-4a0c-820d-c5b91dd52529@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MwcktDStLwa_LGEE4BgnHodxpjJ9E-T1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA0NiBTYWx0ZWRfX1aYVNYoRo8bh
 KUZWZdKPHIiZk96qcIzHbVzv/UdjvDad5OQjCdUkwyrrTdQlJiNY+K8kwZPZ1dxim/Nrd5Ggld5
 OnhMh7JSI1BSpfm/VaTXvY1EFkMZoDQ=
X-Proofpoint-GUID: MwcktDStLwa_LGEE4BgnHodxpjJ9E-T1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA0NiBTYWx0ZWRfX0uSgJdFWppis
 PqzZUtYzJy/TGduk2gQuIHQyyfS7crEwYxg/6Bkdk6ao6AxzNCTSEgkOakJHoAFCBUmxBS+QEfs
 6g41xnP6MfNUx2XaYDxpTc6XpDLDMh542OPMPDx3sx3SPcg7zyze5ii/ZUHOypdyl4iIhZfFNSm
 lY/SG+UZXh5TqrzIgWppji0xB5Km7inOwFgMFQ2MIxlHV9cezZL2iCfsGpinEeicplwZ0Yn5gG6
 thtPxBX/o9ODL7D4XZeUTu7klKqiASduoTHYFNDo9ZnjoFGWzMFGU4x6O40Y5qLqw0CTv+9mzqO
 UOoY1NxbVxnZCUT3hJpvYnKe27ObEP1z8UgPcBbqFir9wcgKzhzw195h780PO5/7xebbgGcURTD
 5dMS7/0qS0E4B+zfV+lvGHmIR7I+T9mJ3Ai868PtMLJ00iVWKCs76GINtzqo7dHdmp96jpTDIQa
 JgcwPvpvBq6Xur0h31Q==
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=6a82a913 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=f5ZdGIiNhfuRS9tBkb8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170046

Hi Dmitry,

Many thanks for your engagement and review on this series. I am looking forward
to your opinions on below comments so we can align on a a v3 of this series.

Best Regards,
Harshal

On 12-08-2026 05:00 pm, Harshal Dev wrote:
> Hi Dmitry,
> 
> On 10-08-2026 12:37 pm, Dmitry Baryshkov wrote:
>> On Fri, Jul 24, 2026 at 02:43:42PM +0530, Harshal Dev wrote:
>>> Hi Dmitry,
>>>
>>> On 22-07-2026 01:56 pm, Dmitry Baryshkov wrote:
>>>> On Wed, Jul 22, 2026 at 12:29:11PM +0530, Harshal Dev wrote:
>>>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>>>> Replay Protected Memory Block (RPMB) which is only accessible by the
>>>>> Qualcomm Trusted Execution Environment (QTEE).
>>>>
>>>> Is it so? I think RPMB is accessible to Linux...
>>>
>>> I should have been more descriptive here, RPMB is accessible by Linux but
>>> its frames can only be prepared by QTEE.
>>>
>>> The RPMB key which is one-time programmed into the storage controller to allow
>>> authentication of the RPMB frames is generated by and only available to a TEE.
>>> So on Qualcomm platforms (and many others platforms with a TEE) Linux can only
>>> route the RPMB frames generated by QTEE to the storage, it cannot create and
>>> write the RPMB frames itself (it doesn't have access to the key).
>>>
>>> While it is possible for Linux to generate/program/store this key, on Qualcomm
>>> platforms we do not want Linux to do so because we do not trust it. We trust
>>> QTEE.
>>>
>>> I will re-phrase this and make it a bit more clear everywhere.
>>
>> OK.
>>
>>>
>>>>
>>>>> For Qualcomm platforms without emulated RPMB support, specifically
>>>>
>>>> What is emulated RPMB support? Why is it mentioned here? Which platforms
>>>> use emulated RPMB?
>>>
>>> Emulated RPMB refers to RPMB on a storage which doesn't have its own firmware.
>>> Primarily, NAND/NOR storage. Unlike UFS/eMMC storage, NAND/NOR storage does not
>>> have a storage controller where we can program the RPMB key to be used by the
>>> firmware. So we must 'emulate' RPMB by moving the storage driver within QTEE
>>> and making the driver hold/use the key.
>>>
>>> Qualcomm compute SoCs (Glymur, Hamoa) have RPMB available on SPI-*NOR* storage,
>>> and a driver for communicating with it is also available in QTEE. And so, these
>>> have 'emulated' RPMB.
>>
>> This needs to be explained in the cover letter.
>>
> 
> Ack. 
>>>
>>> I will add this detail in an updated cover letter.
>>>>
>>>>> platforms where RPMB is not located within SPI-NOR storage and instead
>>>>> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
>>>>> a callback request from the UEFI Secure Application to the RPMB service
>>>>> running in user-space (within the QTEE supplicant [1]).
>>>>
>>>> Can it be moved to the kernel?
>>>
>>> We have a plan to move the RPMB service to the kernel similar to OPTEE:
>>> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/tee/optee/rpc.c#L449
>>>
>>> It is a work in progress. Once this happens, we don't need QTEE supplicant available
>>> on the Linux distribution.
>>
>> Ok.
>>
>>>
>>>>
>>>>>
>>>>> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
>>>>> QSEECOM based uefisecapp) does not support callback requests.
>>>>
>>>> How did it work then? I think Windows has been perfectly using QSEECOM
>>>> rather than QTEE.
>>>
>>> It works because Windows on Arm on Qualcomm has SPI-NOR storage. A driver for which
>>
>> I have WoA devices without SPI NOR. Windows still can store UEFI
>> variables.
>>
> 
> Ahh, the key point here is 'Windows'. Windows has a separate way of providing
> RPMB access via a service in the TrEE driver within the OS:
> https://github.com/microsoft/Windows-driver-samples/tree/main/TrEE
> 
> However, the Linux QSEECOM driver we have here in upstream does not have that support.
> And so without the QCOMTEE + QTEE supplicant combination, we cannot access EFI
> variables on these Qualcomm WoA platforms when they boot with upstream Linux.
> 
>>> is available within QTEE, and so QTEE does not need to make a callback request
>>> to Linux to request RPMB frame routing. However, in case of UFS/eMMC storage the
>>> driver only exists in the Linux kernel and so QTEE must make a callback request.
>>>
>>> And so, if you try to use the QSEECOM driver to write EFI-variables to RPMB
>>> on a device with UFS/eMMC storage, it won't work.
>>
>> Yep. It seems to work under Windows though.
>>
> 
> As explained above, the mechanism is different for Windows. A different driver
> and a different protocol. :)
> 
>>>
>>>>
>>>>> And on
>>>>> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
>>>>> QSEECOM interface fail due to lack of support within Qualcomm TEE.
>>>>
>>>> So, I assume, on RB3 Gen2 the QSEECOM doesn't report uefisecapp as
>>>> supported. Does it?
>>>
>>> It doesn't, this API returns -2 if I add RB3 Gen2 in the allow-list for QSEECOM:
>>> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/qcom/qcom_qseecom.c#L46
>>
>> Does it support QTEE-based uefi variable storage?
>>
> 
> It does, the QTEE-based uefi variable storage app, i.e. uefisecapp is loaded by
> UEFI on RB3Gen2, however, the QSEECOM interface on RB3Gen2 is broken so it misreports
> it as 'not supported'. But the app is loaded and available, which is why if you apply
> this patch series, you can communicate with it. Just make sure you take the QTEE
> release mentioned in this cover letter.
> 
>>>>> On these platforms, a TEE based uefisecapp client driver is required to:
>>>>> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
>>>>> 2. Ensure persistence of non-volatile EFI variables via writes through
>>>>> the RPMB service hosted in the QTEE supplicant.
>>>>>
>>>>> This series introduces such a uefisecapp TEE client driver for the
>>>>> aforementioned Qualcomm platforms which installs efi-var operations _if_
>>>>> the QCOMTEE driver registers support for an object-IPC based uefisecapp
>>>>> service on the TEE bus during its probe. Only new QTEE firmware versions
>>>>> available at [2] provide this support.
>>>>
>>>> What about existing WoA devices?
>>>
>>> New Windows on Arm devices like Hamoa/Glymur work perfectly fine with existing
>>> QSEECOM based uefisecapp. But they will also work with this new QCOMTEE based
>>> uefisecapp once they upgrade their firmware.
>>
>> Do extisting commercial devices suppot it? For example, does Lenovo T14s
>> support it? Will it continue to work with this patchset in place?
> 
> Existing devices like the Lenovo T14s do not have mature QCOMTEE/SMCInvoke support
> on QTEE side and new QTEE versions for it are not being rolled out. However, this
> QCOMTEE based uefisecapp driver and the QSEECOM based uefisecapp driver can co-exist.
> It will not cause any breakage of existing working functionality since the QSEECOM
> path can probe and continue as usual.
> 
> As per your comments on patch 6 of this series, I plan to enable the QCOMTEE based
> uefisecapp as default 'm'. That way we don't need to enable one over the other and
> will continue supporting all existing functionality while extending it for devices
> with UFS/eMMC storage and running upstream Linux.
> 
> Do let me know your opinion on it.
> 
>>
>> What about other existing devices? We have WoA devices starting with
>> MSM8998. The QSEECOM driver works on them, but, as you mentioned, it
>> can't flash updates to the backing storage.
>>
> 
> Unfortunately, unless we roll out new QTEE firmware versions for devices like MSM8998
> with QCOMTEE/SMCInvoke support + access to the Uefisecapp over SMCInvoke protocol,
> they cannot be helped with this series.
> 
>>> I need to double-check but this firmware release for Glymur on Qualcomm Linux
>>> is probably carrying the support for QCOMTEE based uefisecapp access:
>>> https://github.com/qualcomm-linux/meta-qcom/commit/728251fcbe5113980805ea6c571e33235062ee71
>>> If not, the next release will definitely have it since I have merged support for
>>> this in QTEE and talked to the boot firmware release team about this.
>>
>> Does it work on the CRD?
>>
> 
> Yes it does, I have validated on Glymur CRD by locally switching it from the current QSEECOM
> based uefisecapp to this new QCOMTEE based uefisecapp. This is the QTEE release which
> needs to be consumed for it:
> https://github.com/qualcomm-linux/meta-qcom/commit/5590c1dc631827624c110df282965b85ef2a2e60 
> 
>>>
>>> The next planned firmware upgrade for Hamoa will also provide this support for
>>> Qualcomm Linux. And similarly, for all other targets being supported upstream.
>>
>> So, we are forcing users to upgrade to the new firmware? That doesn't
>> sound nice.
>>
> 
> We have an open ecosystem for all devices supported by the Qualcomm Linux distribution,
> users can easily consume new releases (and new QTEE versions) to access new features.
> Until now, developers/users of RB3Gen2 or IQ-9075 could not access EFI variables to
> develop use-cases such as secure-boot key revocation, but by taking this patch series
> as part of a subsequent Qualcomm Linux release, they will be able to.
> 
>>>>> Thus, QCOMTEE now maintains a static list of always-available object-IPC
>>>>> based secure services exposed by QTEE. These services are implemented either
>>>>> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
>>>>> usually loaded by the bootloader. The uefisecapp TA is an example of a
>>>>> preloaded TA loaded by UEFI. A static list is required since QTEE does not
>>>>> yet expose any way to dynamically query and enumerate the services exposed by
>>>>> it.
>>>>
>>>> Can it be fixed instead of having static lists? In the end, we can't
>>>> guarantee that users update the firmware.
>>>>
>>>
>>> Unfortunately, no existing QTEE release out there currently has this support.
>>> But support for this is currently being added by QTEE team last I checked with them.
>>> Once it is available, and a new QTEE firmware release is out there, we will add
>>> support for dynamically querying QTEE services in the QCOMTEE driver. 
>>
>> It seems you are still rolling out QTEE-based support. In such a case,
>> please go back and implement dynamic detection of QTEE services.
>> Otherwise it would be a nightmare.
>>
> 
> We are working on it, but until then there is no overhead involved in maintaining
> this static list of services because we don't have to extend/modify this list when
> adding support for a new Qualcomm platform upstream. If a particular service from
> the list is not implemented/accessible from QTEE we log the event and silently avoid
> probing the TEE driver for the service. We also don't add platform specific services
> here. So the list doesn't need to be extended on a per-platform basis.
> 
> So unlike the QSEECOM driver, we don't have to keep maintaining this list forever
> for all new platforms.
> 
>>>>> To facilitate object-IPC interactions from the kernel-space, this
>>>>> series also introduces a tee_client_object_invoke_func() to allow
>>>>> invocation of TEE objects similar to the existing tee_client_invoke_func()
>>>>> API exported by the TEE subsystem which allows invocation of TEE functions.
>>>>> Some suporting changes are also introduced to track and handle operations
>>>>> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
>>>>> driver.
>>>>>
>>>>> Finally and as previously mentioned, access to the object-IPC based uefisecapp
>>>>> service is restricted on older QTEE firmware versions. A new QTEE firmware
>>>>> release must be picked up from QArtifactory [2] for all upstream supported
>>>>> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
>>>>> driver.
>>>>
>>>> What about fused devices?
>>>
>>> The procedure for updating the firmware on fused devices is slightly different.
>>> The firmware images need to be signed by the OEM using the security profile
>>> of the chipset before flashing/upgrading them. Security profiles are now public:
>>> https://github.com/qualcomm/security-profiles
>>
>> Will OEMs release new firmware images? What about the devices which are
>> already out of the support phase? This whole story rotates about the 'we
>> are releasing new firmware with new features' paradigm. However there
>> are existing devices in the field, which typically can't be upgraded,
>> From your cover letter it seems they can't support UEFI variables
>> properly. However they do so in Windows.
>>
> 
> Yes Dmitry, this series is effectively forward looking. QSEECOM protocol/driver
> support is essentially deprecated on QTEE side, no new features added to QTEE support
> it, and it also doesn't work on many devices like the RB3Gen2.
> 
> For existing devices, if they boot with upstream Linux and have RPMB located on
> UFS/eMMC this patch series cannot help them. But the focus of this series is not on the
> past, it is on currently supported and future hardware. Every new Qualcomm platform
> whose support is being up-streamed or is planned to be up-streamed will have access to
> EFI variables via this series.
> 
> If someone wants to add support for older Qualcomm devices to access EFI variables
> via QSEECOM that patch series will not conflict with this one. Like I said, both
> QSEECOM and QCOMTEE based drivers can co-exist.
> 
> Regards,
> Harshal
> 
> 
>  
> 

