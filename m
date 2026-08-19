Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B01442377
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132795; cv=none; b=KcaA+E1iAX/qQoj/CWUYrS5eEjUgO3+jON2UBqTwv0M7BVAJEBedAAsiXqsV9/yb/CQZjcyjGAgwnX2cF1mFYf+BQe37dZ4KvafuNE6uYdRy08jtfYdh/qp+E7m4hy4QQqcP81AXwjwDMjCwO7Y52Ai3MoQPYn/cteULXA3Hcdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132795; c=relaxed/simple;
	bh=pYjwEVl/tkhukaJEMrlUw8VOwNDE+8uSUJf4huCQzK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCTJApsE795w2KHCZHJOsrWE0zuK8f128IzbkABOOMZUVNRg0eVJuIOxkHcOtJme3HDS0DwwTudjdpoz83YVkpmwif0T/qdTa66AWHubZs9B+rrvhu8ZeN6E2xiy46NiVnloUcKsfHZJU3oDi6eW7L3tnsa1sN4J970ulyKsKVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Txw+Ppa1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7Zaebh9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Txw+Ppa1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7Zaebh9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z4uo026729
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l73nbHT42OxFs92+TFnovfwcUxNgHxMHwTDcJQUBPnk=; b=Txw+Ppa1+8fHZwKo
	JwW2yEPSVm8e7mYkRKuMEhmL3mIl+uiVKKfzEPDJJhGetd2dF3sO/fnEdCkHWmfY
	pRoSB4sFiIKOI6Or44RKaNWi53M4zv25hAxv9ZjPQtC0Ba9G57tpSa7/IjwNsbLk
	dCkv/Ex5DX0h4kflsq6TK4jDLoknP1BS5MpXdZfcOdGKI4EFxKd6pWKS4yi6mblL
	fCQvq9oerXSjzUL+MdvsC2cPCqooc4eMQcfzDPHlOZ+rrFOMGJiZvFdtg4ZUhlSv
	Q7itUYFYDGlk2HvDgFcZj6OPGyLiWNkU3DJh+dbrs0E9DhbgMAQHeKQxVMBLrF3I
	xj/9Rw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpteuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:46:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so15054855ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787132792; x=1787737592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l73nbHT42OxFs92+TFnovfwcUxNgHxMHwTDcJQUBPnk=;
        b=f7Zaebh9TSxRbCIf4qeg1Qz1++WsEqX87LrgyDOHfFTP1Z7eFJ8yZH4GnKGo2dOYMv
         3J9K7nbwBTOwdnWQmonAGjuo87ip7YZGkRv2TJD78LDgqh/Gu3LSqaq2+WtFcCsgD+3X
         PIeP2PKABxD7DP8dtpltJhgn6mGaoLhKis0jA1qflHkQFCJyHghFQf6wq8+jdNNkVaBK
         LujmA0HCbuvhPcABgJABuLqlX+zbUe9+8pn8Fk7FKP90rk5ZLxiCk2tzgzwHMbDhSPDw
         SWF0huvRGDxQbTsU9IoEm9toMD4WFh23LLFftYN0ct3DoplI6GrxNJBItYmWto3bG8Rr
         mkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132792; x=1787737592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l73nbHT42OxFs92+TFnovfwcUxNgHxMHwTDcJQUBPnk=;
        b=P1N3t8n/eU+A4HsEK1JiKGEDWM8ldGX1/l3iAiYMPblPwGbKZ1TZQ3x1c24SCGevhX
         wNXFa45neaH8k6WgcEJvPhfVtMjOrgsGLM6IO7OF+43sufqIMO6BZeN2y+/jyKIs4UyP
         E55HMFrJfnnxIdQ1jkeBZlnMeFfUnE2Gr3tlOkvQgVYDDxc9fjz2EBkmoem6Lk9w0x14
         AHDG4BseV1AtEaXLLruqa3rIipAD655wLxw6z+GO4/pGhdVnIMP6GqC/mZxN32hOsDee
         3O87snrpvN5oBZ3yx0gwTXZoSM8lGKuHDSHdN6yrLoHYHq6NqvR5pr/MvMrbi8oeJpWO
         e1YQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJIOfadYQAI+Klf97FjrFDtxbm4c8zYlUc40jhKI26/T5WQcO6n76z90fGiCkIrTWBMIpDSXHkD55X6Vvv@vger.kernel.org
X-Gm-Message-State: AFuF++nhyuybmYiGMBCl81Wvo/zXxr5Nt0vALefF6cimrZOHcg96ybub
	Z9fQ9MIW9ZzivPM/BEpOmKeC1ssH0CS2FWrFrJue1m7kXyHGYGI3N2wxbAmBFoHmdYcn7f6oe6x
	TQ555+OWflmTMSDsNE8mYBTHvy9aLgp7IfWyoc9FIQQ3hAz+kbU7VO5QgHCRn1i69Fu5o
X-Gm-Gg: AR+sD12xFEwjNSF3KOPQxc4tAwrAiRiP2L+DeqQC2y8A5W50+97GywmtzTgMYhekOg+
	xpXkd7H2gm/NRIgINm5bZ3aj2FUR9Be0ORTZA0IQpHbSnTULEqGyAAXbwteG6NB0rybvEY8e66h
	8+SORZ/kPpWRv/F8i1IotjGL862OER1XGlNPMO+hq+WDMccfTsdxgkXCYptuiwMzuLIHjaw0J3+
	EOPEdwqBDsz61xn6m2sCdLC2bei5BZ0toMHMj81bRtyQ2P+7ywbcdlaFV7pPuUIcw0i+IpXISwM
	EfRJUX+YdaJQSebpBwPdNxHnot1aU4E0DrJgGLCdpRg+Myfm1PPgw5S9w0VKRGvHx2ReQK2Wqq+
	TPXb6lLe6gp9OF9ALfenTg9n5HmIv9g==
X-Received: by 2002:a17:902:ef44:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2d600cc605bmr61764585ad.12.1787132792113;
        Wed, 19 Aug 2026 02:46:32 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2d600cc605bmr61763895ad.12.1787132791517;
        Wed, 19 Aug 2026 02:46:31 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb5326f8sm25299165ad.37.2026.08.19.02.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:46:30 -0700 (PDT)
Message-ID: <416325cf-1e84-4c28-8dbd-cd42e6edfdeb@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:16:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
 <1b5301df-3d0a-497b-823d-fe43a34a5ee6@oss.qualcomm.com>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <1b5301df-3d0a-497b-823d-fe43a34a5ee6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q4c29MCDqREns-W3H-KFCMCQGlBh8GMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MyBTYWx0ZWRfX1gn9HwySgToZ
 xplOQKJsxXwSv1+sI7yGlbxzVqKAIERVmEhvNb++5FlyY/gcpWJEHHOzFLYr0B4b2dJhFc5WmTt
 zJXPStwxKpOamnFffBzN9bdcjKCFemxdsFIL+ccBTla/GrdunJhcQcc7JS50i6vqZEnUgU1k6wh
 AX8MRPZ9t1Gyd3QCtx1mzSoQaTGiAaSa7NdWZ/u4GdFjNphIeDR4e0NBOaGlnsGThFu5Iteou0+
 2AvC6+cd0EWj/cBduTPl74PhXcbcM6o8u8pE8/jRDjFW6H5ZZ54A12gH7fL7wmjAfO/feIEynLw
 u2PWyxAYkbSXH2a8nGvxMu1tac6PRWkA5W/2F7l7CrzQeTTT/kNj8p8gCox4hDxunLKwwm0kH6E
 5Y3NwUzRtRzS0Xo1HELanXYJsvZeBf6X7pQV47YgE/jlYv1Moep5Eu4irAwbIBdDGIOBxVYob7q
 t4iMlTeYDBtupbbIXBg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a857b79 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tYF7Tg-db0wKN6MUNa0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Q4c29MCDqREns-W3H-KFCMCQGlBh8GMb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MyBTYWx0ZWRfX72JOzm0jhh5h
 3SA/8gDx+cd40zbQRqN4rxo4Di6DuZtgnKlfVthi/Natu5PlkkRl8mkr456dR3cDK0xUkYg7MfP
 TkXMECd5jLWeY8p4j0yooZipB6ob9DY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190073



On 8/18/2026 1:44 AM, Jeff Hugo wrote:
> On 8/17/2026 4:14 AM, Sumit Kumar wrote:
>> The MHI specification defines a LOOPBACK channel. The endpoint firmware
>> echoes back whatever the host sends on this channel. Without a host-side
>> driver, there is no way to exercise this channel to validate MHI data 
>> path
>> integrity between host and endpoint.
>>
>> Add a host-side loopback driver that binds to the LOOPBACK channel and
>> expose a sysfs interface for data path testing. The sysfs interface 
>> allows
>> users to configure TRE buffer size and count, trigger a loopback 
>> test, and
>> read the result.
>>
>> Co-developed-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  39 +++
>>   MAINTAINERS                                        |   1 +
>>   drivers/bus/mhi/host/Kconfig                       |   1 +
>>   drivers/bus/mhi/host/Makefile                      |   1 +
>>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>>   drivers/bus/mhi/host/clients/loopback.c            | 289 
>> +++++++++++++++++++++
>>   7 files changed, 350 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback 
>> b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..1622a146110c2069c8b51e5bdf665c882b853303
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> @@ -0,0 +1,39 @@
>> +What: /sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
>> +Date:        August 2026
>> +KernelVersion:    7.2
>
> This series missed 7.2, and will miss 7.3 since the merge window is 
> already open.  Next oppertunity is 7.4.
Acknowledged, thanks — targeting 7.4 next.
>
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (RW) Size of each Transfer Ring Element (TRE) buffer in bytes
>> +        used for the loopback test. Valid range is 1 to the value
>> +        reported by max_tre_size. Default value is 32 bytes.
>> +
>> +What: /sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (RO) Maximum allowed TRE size in bytes. Reading this file
>
> Entry before this and after this explains the TRE acronym, but this 
> does not.  It probably should, as someone may jump directly to this 
> section and not read the entire document start to finish.
Will update the description.
>
>> +        returns the upper bound for the tre_size attribute.
>> +
>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (RW) Number of Transfer Ring Elements (TREs) to use per
>> +        loopback test. Must be greater than zero and must not exceed
>> +        the channel ring capacity. Default value is 1.
>
> How would I know the channel ring capacity?  Should I just try values 
> until I get an error?
if you try to write any value bigger than ring capacity the error will 
report it with the max ring capacity.
Would you prefer having another read only sysfs to find out the ring 
capacity ?
>
>> +
>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (WO) Write any value to trigger a loopback test. The driver
>> +        sends random data to the endpoint using the configured tre_size
>
> It feels like these kind of interfaces usually give an option to 
> specify a byte pattern as well, but I don't see that option here. Is 
> random data considered to cover all usecases?
Since currently we are checking the data path, random bytes should 
suffice for now.
Happy to add a pattern option later if a concrete use case needs 
deterministic content, but I'd prefer random as the default.
>
>> +        and num_tre parameters, waits for the endpoint to echo it back,
>> +        and verifies the received data matches what was sent.
>> +
>> +        This is a blocking write that returns when the test completes
>> +        or times out after 5 seconds. The write returns an error code
>> +        if the test fails or times out.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 
>> a4b89bd497ad5051c190025838e0e93d257ed061..098b12692140514da52565a3200801f5e24a43b7 
>> 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17469,6 +17469,7 @@ L:    linux-arm-msm@vger.kernel.org
>>   S:    Maintained
>>   T:    git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>>   F:    Documentation/ABI/stable/sysfs-bus-mhi
>> +F:    Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>
> Commit text says this ABI is stable.  Seems odd its being added to 
> testing.
Commit text needs to be fixed for this, Thanks will update it in the 
next revision.
>
>>   F:    Documentation/mhi/
>>   F:    drivers/bus/mhi/
>>   F:    drivers/pci/endpoint/functions/pci-epf-mhi.c
>> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
>> index 
>> da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 
>> 100644
>> --- a/drivers/bus/mhi/host/Kconfig
>> +++ b/drivers/bus/mhi/host/Kconfig
>> @@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
>>         This driver provides MHI PCI controller driver for devices 
>> such as
>>         Qualcomm SDX55 based PCIe modems.
>>   +source "drivers/bus/mhi/host/clients/Kconfig"
>> diff --git a/drivers/bus/mhi/host/Makefile 
>> b/drivers/bus/mhi/host/Makefile
>> index 
>> 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 
>> 100644
>> --- a/drivers/bus/mhi/host/Makefile
>> +++ b/drivers/bus/mhi/host/Makefile
>> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>>     obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>>   mhi_pci_generic-y += pci_generic.o
>> +obj-y += clients/
>> diff --git a/drivers/bus/mhi/host/clients/Kconfig 
>> b/drivers/bus/mhi/host/clients/Kconfig
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..312a0b5a8e83b6ad7246453908bd552841a89188
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config MHI_BUS_LOOPBACK
>> +    tristate "MHI LOOPBACK client driver"
>> +    depends on MHI_BUS
>> +    help
>> +      MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
>> +      as defined in the MHI specification. The LOOPBACK channel is
>> +      implemented by MHI-based devices (modems, WLAN) in the field, 
>> where
>
> Are modems, WLAN the only devices that implement this, or are those 
> intended to be examples?  Current reads as a limitation.
those are just examples, will reword it.
>
>> +      the endpoint firmware echoes back whatever the host sends.
>> +
>> +      This driver exposes a sysfs interface for testing MHI data path
>> +      integrity between host and endpoint. Users can configure the TRE
>> +      size and count, and trigger a loopback test.
>> +
>> +      To compile this driver as a module, choose M here. The module
>> +      will be called mhi_loopback.
>> diff --git a/drivers/bus/mhi/host/clients/Makefile 
>> b/drivers/bus/mhi/host/clients/Makefile
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
>> +mhi_loopback-y += loopback.o
>> diff --git a/drivers/bus/mhi/host/clients/loopback.c 
>> b/drivers/bus/mhi/host/clients/loopback.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..02a952e8e01222cd8cb842c9f9490479df8ea2bd
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/loopback.c
>> @@ -0,0 +1,289 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/completion.h>
>> +#include <linux/errno.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
>
> I'm pretty sure this is now incorrect based on cleanups that just 
> occured in tree.
I missed the recent rebase on mhi-next therefore missed these merges. 
will rebase and fix.
>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/random.h>
>> +#include <linux/sizes.h>
>> +#include <linux/slab.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +
>> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE    32
>> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE    1
>> +#define MHI_LOOPBACK_TIMEOUT_MS        5000
>> +#define MHI_LOOPBACK_MAX_TRE_SIZE    (SZ_64K - 1)
>> +
>> +struct mhi_loopback {
>> +    struct mhi_device *mdev;
>> +    /* Serializes the sysfs attributes against a running test */
>> +    struct mutex lb_mutex;
>> +    struct completion comp;
>> +    atomic_t tre_pending;
>
> I'm not really sure I understand what purpose this is serving.
>
tre_pending tracks how many of the tre_count queued DL+UL completions
are still outstanding; comp is signaled once it hits zero, which is what
start_store() waits on. Will add a comment for it.
>> +    u32 num_tre;
>> +    u32 tre_size;
>
> I'm pretty sure these are the wrong types since they cross kernel 
> boundaries.
>
num_tre and tre_size are sysfs attribute values parsed with kstrtou32() 
from a text write,
they don't cross into any MHI wire-protocol struct or UAPI boundary, and 
u32 comfortably covers
the valid range (num_tre is ring-capacity-bounded, tre_size caps at 
MHI_LOOPBACK_MAX_TRE_SIZE = 64K-1)
Could you explain a little bit more about the boundary concern.

