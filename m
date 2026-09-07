Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6D415F20
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765875; cv=none; b=UdYe3pBhVrOImIWnVnfudjUituoORy+sP5NcDflKWhNd0/1Lp4NQMuBQF2IZ3IDPLwNP3v3RkGVAEBZOmRkAasdc6vrkGFDGQW0c6yqIx32DIAAmprcHakpu96akUZ1QdDZ/UlzUag8n9pACG0TNBujfojlGrtPlzdvW29Q1L34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765875; c=relaxed/simple;
	bh=KxMqKpP4pT773qfgW11vDRiBR41pjOdpqBHigF4X5oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lueVUeHIbK1mNwZ54T4ntyc5KIkuf2LInX7+7sYjEoKDiwKAOeWvnt11WuUVL0nDM52OKF+azRkuAMmxrBhN5VBILrocIootdxitXQRa6KEAKmSAtXRnqi7Nx0BTSD1m0HMkvInkXriHHb6wKym5Js0XL+ymejrqaljrU46/xCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkCZwzII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvuWTSSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkCZwzII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvuWTSSa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777fiE2146290
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VMX/yV6LzUMzO3mW4OB10xo2hXImRBI/wgtKMD2Jbk=; b=EkCZwzIIA5UgcDks
	V9fU8GiRgieVDTZaVUJeMU++AKNDCzUuBz0Gj1ii1/hCgAQQ61MrZwZ/CzyiCRcg
	5c03+INUELu7Qs1lfiVhZefYouaFVlJoFGCkaD8PBoWUHI0zP/z/DjvBJrWenUbM
	UA1ut2aeTHp1c2yefrK6osO40nz17wBwe9qsGDuqtel/ByE3VRUxQQc2jE52ahZy
	bAdG79TUTsqDSu88f5yO6PDcmNn31RJ/FPOjghbKcySZWPkvVYGzvbeAf2IVCscN
	U1vjUOZoz/lwHZxO2F4i5UxPN6mR8ooqTj0H2Ug5J/izlP9533eC2U65lo5Aq2/O
	LdAdOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdhhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:24:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7293f13c6so40917565ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765774; x=1789370574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VMX/yV6LzUMzO3mW4OB10xo2hXImRBI/wgtKMD2Jbk=;
        b=LvuWTSSangnkCnjs7RV/KNmZ5gKD9HfNRcYlzlvwUyHrHAqZ4J0SuYWQWwqQFegwJV
         VnBmdySuwl0Sp19v/Ea0VhpF5cPLUZbFdVXqF3ibPM58js7R2TuAMqTkrUnjxpAsirFl
         XOItU5FUeep5csZSikRaISrbYacYsf9YKaxtcoEMQUWLSLOLUEYrmpCdP3bE1UO0KN7B
         9zUN2hX+lT8kV5T5wat1/LEV+NmhHKs+3/zoPIJuSWjgxfx1P7lP7iSzgFgBHnReokt/
         pkV5xhu/jK2skCo9imeahnqAn2Fiql+xzNKczrbfC31cIw4IzQ/Uvn/aAr2H/tFPUSHM
         1dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765774; x=1789370574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VMX/yV6LzUMzO3mW4OB10xo2hXImRBI/wgtKMD2Jbk=;
        b=lj39+aW/UwatzdSV0dtYKpRFkzmaIx2M706LPpoZ4+XZMEaMVDcAEIHEwunTiDpFFM
         Vfq+wYDQA/0fFIy/5D7RscWo9MgmzULX1mzL5Dfik7H1yVt1gacP0FWOTz798vXBtx1K
         suHfraL3OzicdPXD5xTCqhPy7QfsweP0eBK7FNl0A60OrbJcbEvhsj7tCmDmHkNhNBdr
         Sqi/L66ieKesEgyUYsJtrCKekbHkaHHeCUANfCxDBuTiVMa5qoGtnCRyUgBoepOr//ea
         cS++4wXWpFsb+UX/bUMQXjhU3hHP+t9/aXoHEyN6ZOrZShzSJFWKdf9B5fGQGgTaYdJJ
         ET6A==
X-Forwarded-Encrypted: i=1; AKwUvBzKKB3+7wgEYOIp6OXfA+9im9xTySy9Tn/rDWHr97lWYgGPeQdwTrDm0vrWiwO7dM6iNplrG33LR6bI6Wsi@vger.kernel.org
X-Gm-Message-State: AFuF++mxBQt3Ego1uHAyK9EjpmGNRFWi8/KLAoIowj9TOs3vPXwbZbYQ
	AmuTyx0J647mVaTTsrhHiwH/NMuXXowsn3n5Nb4LEvUnBycIGOel++3DOI/Xt5jciY7Gj0sqblZ
	o0Op3DzbhWXWlwr1FMF9H9qXHliCyZ7YJglvUJ7mJWSuvV0vom6uzYmmdADurbY4AcQc1
X-Gm-Gg: AYBFou383PKCB1cOFkdYJe5PW02jvGmraH2FURUq9VQGbEQOhPCN8nraTB8bnvyZMef
	x3GNNWwitXi6Qok9Xu1BNXvEMw+ktneoRR1UGw2KRBH020nbHxeZDJYPtFXIeZC8Gm1HTlc1Poo
	XsHj3oIyVW0ZqJ1jeiWh3LDwz+c/n5jZ790SECTBk1vrtophneqoojp+50e/sYlxVcTivKSbf5E
	U+s4GlcOrI8LnwGcv1KT4NV8BPucoQKhor4mpIm43thmuGD/PqAacO3F55wUCjBt/qrHcQgQpYx
	Dg6eFrHvhp3+/SUgAn1VkwK+m+0cZFsM+qa0Ty3i6jGITrE6oBn9cxCuOrq4Q/m98NAfCDRDntn
	Fc7K9LG0JDpAjJTP6Tqm9oQ5TI/RhYFShHA==
X-Received: by 2002:a17:903:1b0b:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2db12620112mr364269515ad.15.1788765774193;
        Mon, 07 Sep 2026 00:22:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b0b:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2db12620112mr364268745ad.15.1788765773598;
        Mon, 07 Sep 2026 00:22:53 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3385c056e13sm1775705eec.29.2026.09.07.00.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:22:53 -0700 (PDT)
Message-ID: <69e25f54-80a9-4f17-8453-c74b2e346585@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:52:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
 <20260827-master-v8-1-596bc81c5cf9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-1-596bc81c5cf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cwDnlk10zcK9nFWmuJY2siAlpv4yXJMM
X-Proofpoint-ORIG-GUID: cwDnlk10zcK9nFWmuJY2siAlpv4yXJMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX+/aIN7iqNev9
 lwS6EA++jtOtB5fHGOcniY66O5hMycajJ11BSxHEF9o1ulqB+BUzK5A54uvPQH9u7MKhB7nekMQ
 yoJP65Bn9N104bAE7ARjhbgoAH3BNnxRibnyDF3GVppP+VHZlz4J8j0rNFNr005+P/2mtd4U+FZ
 vr5RFZl6tMHH5PcRM8V+T0HEN6e2HbVIreI3V53yrGDflHnmEWkqMvZ7VZeh/Q7OQSICSoW05h/
 j9kqo4LHoJssXn37m57/XpReicYhXS2OsfBG6Lg6Hry3BUo5w+xSByJKDxXX4sh4PUphVPcM+vf
 exzg+xn1PlYU+RhtUZCLLj+AN+13e79t1UTPE6REBTuEy0G6yQu4UhNOhyNrfEMYhihTdtbSlAs
 p+DFqih2p9fysNp9P9T22gQQW6xh1i7H8svM3rJH6UqG1FPOveyHYmgzfOEWaW6uSnBKwcUnCDE
 z62/4ZLZw9zwiHagQNw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e66b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HGiDy2AwKuRvI8HKZgoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX9i0uayuOivaH
 fgzC3ABj68q8NGzLrdMX8zPprSiESjmHZoZFynIljMp5/zUThCu73zbmFjR7siWfnzkDh3hN9XH
 Tg9ETRTiTAgiR8d0dkxGdjTEcTHBzsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070078



On 8/27/2026 5:57 PM, Aniket Randive wrote:
> The transfer timeout for an I2C controller should reflect the actual
> message length and bus frequency rather than a static 1-second value.
> A static timeout causes unnecessary delays on error paths for short
> messages, and may be insufficient for very long transfers.
> 
> Add i2c_update_timeout() to i2c-core which computes a transfer-specific
> timeout and stores it directly in the standard adap->timeout field.  The
> formula accounts for 9 bits per byte (8 data + 1 ACK) at the configured
> bus frequency.  The caller supplies a safety multiplier and a minimum
> floor so that each driver retains full control over its timing policy
> without those values becoming public API.
> 
> Storing the result in adap->timeout makes it visible to all consumers of
> that field, including the arbitration-loss retry loop in __i2c_transfer().
> 
> The function is gated by CONFIG_I2C_DYNAMIC_TIMEOUT.  When the config is
> disabled, i2c_update_timeout() compiles to a no-op inline stub so drivers
> that call it build cleanly and the existing static 1-second default is
> preserved unchanged.
> 
> A timeout explicitly configured by userspace via the I2C_TIMEOUT ioctl is
> stored in a new adap->user_timeout field and always takes precedence over
> the kernel-computed value.  When userspace has not configured a timeout,
> the computed value is used.  The ioctl keeps writing adap->timeout as well,
> so adapters that never call i2c_update_timeout() continue to honour it
> exactly as before.
> 
> As i2c_update_timeout() is an exported helper, guard against a zero bus
> frequency from a misbehaving caller with WARN_ON_ONCE() and return early,
> leaving the existing timeout untouched as a safe fallback rather than
> dividing by zero.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
