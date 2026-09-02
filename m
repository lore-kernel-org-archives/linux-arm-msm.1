Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E064A2E0F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359646; cv=none; b=dkcLcG8ulkEDb/9eCgrZ/uZPBLnTxxY2crs3602MfnpEYozdE2CF6t/A8nsI8eqdyKxszBQSgebzHUzroBiJSyHZIt4z4vDSU8I3monb7TcJi3SM9mbq/aD6mHOR2B9d72AolP8m30ZNYBO8uwlCOvlC3XlqpfAv5xuAQUpyckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359646; c=relaxed/simple;
	bh=Q0t/tq/G1G6iYahafSY7REe4nCmiASWINvH8wSZejrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDm04m0GwCBPmbjC+1IMHRZYE4Mph6JI8vCL3syW6TH0gEOK5EmzdnNxIklv0LZVUPm5rm+Ef4no2vY6l2hS8WPPtXuuA0uT3kZ4Op5C5dQjh0PNaZlhYr9/7/YLNHRJOBFs0DljLldbRPIMoIbBYO8W/5jaGbAgv2L0B+5Nzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmHgb0re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVr3REQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmHgb0re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVr3REQQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DHCWB1046587
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 14:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+TRtaIih3SdU3RFxUDMrL/VfpbAnPIZ43woQUPKeWQ=; b=hmHgb0reI4KPyazS
	m1EBlfFCVaCwOx5ItvaL/B/YReYwWgdiMXG/cqxtpdFqGdFZF9Ja2A/8ItVVBAgn
	ImHh1v7wQFy7/y/DUQHsdqS7oz6qW5Lrp2V1KFrjCvsqqsAG/rBV9iJwNO8e479K
	ygku/DBzFm5PIvJtu12ovbncCrgxAzqzHuNXc6Q7nNPj6UzpGR12FBSWgkV1tc/P
	3cbqhNR0yAyWK2roUmEYpaAAEI8Bwn71o827B1WYcYaYKOehrt5xbebCvF4+q+qA
	276AChT+PJKJfVoQVPGmhq5zFs2Uhl6LNg24UHGblMReLKlUXl3vDesCqQ5aLPx3
	hnEdZA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4r9hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:34:02 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c767e23f6so1113751d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788359642; x=1788964442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+TRtaIih3SdU3RFxUDMrL/VfpbAnPIZ43woQUPKeWQ=;
        b=BVr3REQQ+YWp4cBtUpiqzdsk9dB4ZHiMD1NytynDhDVbCXrUUgtir904cI8IQB8ryP
         O+WJrxcEByXhRDEG6WZcCVCyUKpyWgpysZ3mKSDgeMe2g8tTSdYkGJW373daoI+E61xw
         3EI1rS2sWGiLL3zIGSWAS4WFW7nxbgu27igmvTQsshLL7DlRuqvCkUIS5ub2HIF+yKI5
         OqIo9Jc4IRUDPttKroIS5WAqi8rjvrOmMTD2LnOQOoAhJgwV2H+wGY1UfYKk8KPbGn7t
         OSCLT7rrkKdenenhhY+TECfRzdcAgLuCS5JSrIB40RGfceILub58GJB1OFDGrVRh1i0B
         biyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359642; x=1788964442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+TRtaIih3SdU3RFxUDMrL/VfpbAnPIZ43woQUPKeWQ=;
        b=hxNCLvCIys2HxyzYxZZXXCgYJKTOkMMcAhdbI6tGY2sNigaTraXaHlZJQxWjTYbzcM
         h5dng0WNl2Mmj0X+4VKuR8qx2yUamO33T8O8zxaj1O7LzZrFhl+5Pql1SREbZHvHv9Cc
         DSGtMs5WSe3bM5m6FMbVVx0yP57FNEFpadfkPuAoBYIZqxu4XfaIhMomlYyrsy6VZcIS
         GjUgWvnQsnCsYRngZXkjO3rPfjWTsC3I4kZWzU/d1j9FmlnF1S2uqZKH4NvO7A7DtKxm
         NCTKaMyYdbFdAWQ2UcG7IE+UvH3cf5P13wlfpoAEFQsmbSO4TN1xsxNhgKNcTK8cUBs7
         4CAQ==
X-Forwarded-Encrypted: i=1; AKwUvByRvP1G3DzwpW525hNe/Jkpvd6M9f0cTvqRLa4BLQCawq/DXpWXGsM5acpB8qbzn4UTX3tnEZbjyEdS0Pen@vger.kernel.org
X-Gm-Message-State: AFuF++kxSfzMszSpjBVEHdvP3RAlvwkFHqljJpBt38lNqsi8g95wDzOa
	d7G+F89Hohgx5i8J/Z+dGzdyaSCPJMAhI6eezLGfPYNA1s/zJBheWQZNhyE/M7vlzqVfrY2ENGK
	KUqnrOS9LNUrkFz+Z9NQ5iIPoim2Z/gtoiUW1Us2PiHHvJhRs0wAYxnR4L1Xro2G09lWy
X-Gm-Gg: AYBFou2ePcv6vfGsV+6h+GQN3yW4tiXhSdY48bmfI0Y5OoMegbBAu2B0/xLVezqXcUn
	xVifg5c9sRnFKN4Lnae78lDz+2G9cobmNS2ac1DuAvCs8LXBPAJxl7J1IqGxX2DjhCnC+bvVdw9
	rDaHu96UioakQvVnkXUx0P3tVWDl4vE6Em86eDEGvipD27+THxEUJJck0jOnBriQPh6zMJhI1A6
	g2XaGra9ABr21JEwq8dfqJTqzJR6jXTsXh8LlRbzFyUsKCY9HURqMmjDcHjcRW3L4wWkpnav959
	qucd50ae9ZNKOWfc7SuLOMeFsvGlbWwPflZ6Vs5i+m2xb2fuctVu16C9f01kQVQDjSN+ryPGc9d
	cupQAfpPmG6rkP4KvsIRw0xoZiFNn0OZOjT//8nXEepEakXQuID/Zf81/Lg==
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f9b6c6c7emr1566002d50.0.1788359641750;
        Wed, 02 Sep 2026 07:34:01 -0700 (PDT)
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f9b6c6c7emr1565974d50.0.1788359641287;
        Wed, 02 Sep 2026 07:34:01 -0700 (PDT)
Received: from [10.110.114.54] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c184e4b52sm18439867b3.34.2026.09.02.07.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:34:01 -0700 (PDT)
Message-ID: <2af521b1-3b74-417d-8b0b-e30bc6d8df03@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 22:33:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] FBE virtualization: inline encryption for
 virtio-blk guests
To: Eric Biggers <ebiggers@kernel.org>
Cc: axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827184219.GB2137493@google.com>
 <d81e347e-8ca7-40a1-a428-5bce6f0d4b02@oss.qualcomm.com>
 <20260831210759.GE86114@quark>
 <ca838905-f0f8-4f0a-96aa-2bc05ab6c0a7@oss.qualcomm.com>
 <20260901212834.GA3585187@google.com>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260901212834.GA3585187@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyOCBTYWx0ZWRfXxekUh5DVHLKg
 yofkrrR/A8nD1UDkzoEgrVFRI/1ISEqPBUJ90vRhmClhNB03wLdLXneRuWoicmKkjT6x6YYwx5m
 Lg2nm4AC0cDpP3eaNkhpWZuqVLnHEKadxkn7uqnd3ejYCtLlS52zt0F8E/GlA4eW8Qo7r5d3Vet
 xkQzVlEAdFclkMj0LgwffKVy6m1iTUXQpW19Bk6vra3s5T/bBt4YotZGnzKH20Mo4GcoMwcnIj7
 wJbBH2bBc5P2i99VdKMxHmOFArkBpqJKo+jOqQ0t80G7ixxzNCS2VzenPUjgPNbT6QEaLB6yESA
 WpC6P+WkwldmXvsXN3FuCeJTFzRnkzFHL5rjg+OOA/CNwf+HUG4OSfeAWN+Qz7q8zMbvoqoWe65
 ZxU18sAQRk0tRLcvLsXGNdHgw0bTdQcnoUYbEOiWU3zaY4CSNehr5bR1mVt5yNa14SSFtETHyq5
 W1p8MMPV2vEazrAo1Uw==
X-Proofpoint-ORIG-GUID: dE4RNXXb9DsAbOe_fhx70ivmkUlJH_UL
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9833da cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=v6EDwWi3nRXZDjx7Lu4A:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: dE4RNXXb9DsAbOe_fhx70ivmkUlJH_UL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyOCBTYWx0ZWRfX5ng4GpoRh4H2
 jT6kxKW8m8uXm8UA8bHbAwnDTS15tH6DjheMbeF+wiNzFJbbP43qrS0B9WoXHGmS/ej5PQBnNly
 G+EBIPT7Zg4T3+e4ddYaoCEqruKBEdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020128



On 9/2/2026 5:28 AM, Eric Biggers wrote:
> On Tue, Sep 01, 2026 at 04:22:33PM +0800, Linlin Zhang wrote:
>> With this design, I believe there would be two VM exits associated with
>> encrypted I/O:
>>   1. Key programming
>>      Before encrypted I/O can be submitted, the guest needs to program a key
>>      into a virtual keyslot:
>>      
>>      Guest virtio-blk driver
>>          -> VM exit
>>          -> virtio-blk backend (e.g. QEMU)
>>          -> ioctl
>>          -> host virtio-blk proxy driver
>>             (stores the blk_crypto_key in a virtual keyslot)
>>
>>   2. Encrypted I/O submission
>>      The I/O request carries the virtual keyslot number and DUN:
>>
>>      Guest virtio-blk driver
>>         -> VM exit
>>         -> virtio-blk backend (e.g. QEMU)
>>         -> ioctl
>>         -> host virtio-blk proxy driver
>>            (looks up the blk_crypto_key associated with the virtual keyslot
>>             and submits I/O using bio_crypt_set_ctx())
> 
> Most I/O requests only need step (2), since they reuse step (1) from a
> previous I/O request.  The kernel evicts a keyslot only when it is the
> least recently used among all the keyslots and another one is needed.
> (Or when eviction is explicitly requested.)
> 
> This is especially relevant when only a small number of keys is used,
> like is the case when the per-file key support in fscrypt is disabled.
> Programming keys on Qualcomm ICE has always been very slow even on
> physical hardware, and the kernel was already designed to mitigate that.
> 

ACK

>> I have been wondering whether a model similar to the passthrough
>> blk-crypto-profile used by certain dm targets could be applicable here.
>>
>> In such a design, ownership of keyslot management would effectively and totally
>> move to the host. The guest would no longer manage virtual keyslots, and the
>> host block layer would continue using its existing keyslot manager to allocate,
>> reuse, and evict physical keyslots as needed.
> 
> I think the virtual keyslots are still useful so that the key bytes, key
> size, key type, algorithm, and data unit size don't have to be
> transmitted in every I/O request, then all revalidated and processed
> again.  There is a reason that inline encryption hardware uses keyslots,
> and I think the same largely applies to virtio-blk.
> 

Thanks for your clarification!

I agree that virtual keyslots still provide an important benefit by
avoiding revalidation of the crypto context on every I/O request and
reducing payload for most encrypted I/O request.

One concern I had is around ownership and lifetime management. If 
key programming and I/O submission are exposed through separate interfaces,
the implementation needs to ensure that a programmed virtual keyslot
cannot be modified or replaced unexpectedly before the associated I/O
is submitted. Otherwise, I/O could end up being issued with a different
key than the one originally intended.

As Stefan pointed out, this sounds more like an object lifetime and
permission model problem than a keyslot model problem. My current
thinking is that blk-crypto-proxy could own both virtual keyslot management
and the corresponding access control. For example, key programming and
key eviction could be exposed through blk-crypto-proxy ioctls, while
the block device and its virtual keyslot namespace are instantiated when
the blk-crypto-proxy device is opened. That would allow ownership and
lifetime of programmed keys to be tied to a specific file descriptor context.

Separately, regarding the I/O submission path itself (patch 08 in this
series), I'd also appreciate your thoughts and block maintainers'
opinions on the direction that would be preferable from a block-layer
perspective.

My initial prototype introduced a dedicated ioctl for submitting I/O
carrying blk-crypto metadata because of the additional validation
requirements around DUN handling and data-unit alignment. However, I
understand the concern about introducing a separate I/O submission
interface that bypasses existing optimized paths such as io_uring.

Do you think these blk-crypto-specific requirements should instead be
integrated into an existing interface, such as io_uring, or is there any
precedent for introducing a dedicated interface when additional crypto
metadata needs to accompany I/O requests?


> - Eric

