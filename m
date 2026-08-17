Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C035A18BC3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958595; cv=none; b=lWZ0TkML9SfgyFsKayKeyefYOf2NnIGbx+XRB/UgjFuwqh9tWUaU6XMwbNwIJBTsmisL2q1GnFbvAfVamcmEKzMGExJXevsZWhFLs1XxDXWfEf09tGADLggy2eiiUszb/JauMtO2AGbjLk7qQNddghqj5MClPhNDQ92ytpzMQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958595; c=relaxed/simple;
	bh=j5g3yfIkDrLBj+5B/CahtbPvCTJOVV0fOGXayw2/b88=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=o8+G5SN8gAMf3HZwVokQcVOsdHETvJsivOfgszw5DMDEYxnpzxxV9aAoCF9wHcc+Z6X6FEK+kYYh4JPcamXo2kjltX8nzPnysbeNB5yfHQ7Fp9JoQO0JrbsQ9d3bxHykAEEzceoytPGAdynEhofXONvG8nc8jsoR4Gf+/7haXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSqBkeJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDMWi6Sz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSqBkeJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDMWi6Sz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7c06D789303
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 09:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVaMj0syyeRHIkdagyrNZ6l0PUeNTpkp0efYWtQXW10=; b=CSqBkeJhXCh3Nymr
	TbmwicqsgoBBsNgsilqe6va2kwvuL+ije5Lh0nSZLOvxsKnJb6hEFU4QSRKi4rgf
	LrU8UjamnNGX5A/U4ssnl5SxTjcOvrpyiTuzZAVJXAoFMt+QhqS/9xsycZxbAk32
	s0OeBraa19L+Xactdn5RAteUUSoXNaRSVeRS+5uCPT5591xtW/o0IUJmDdHETzBz
	MmnW9pfmbVd7Zdlz2R1Cu9lkBvSE/86j0FtZ4qhUVnpkA0BjPUtKapaDhU1JLWPq
	XnfoExgSxzudXJxV8RUeru4BdfQ7+xzEjvljLrutR+UKz2sfvOZdnWhcMI2cXfAo
	alpQ4A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30gd58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 09:23:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5344639a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786958589; x=1787563389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVaMj0syyeRHIkdagyrNZ6l0PUeNTpkp0efYWtQXW10=;
        b=ZDMWi6SzBdwuH6/CVUJNn0jrACoEz9U8EL/3NUOZFIlkQjV+6Bb43lo0rIUXPoDJrQ
         Ehzz2pCtqQjoVD7uhhqq2qdr26dr74MpHhLhoBe4PDyYA3R4bs1BWDb+/b2Dffg6H+my
         /zYfU3v4PJ204o2Bh47Q5zoGa/9HQHj3QMAwRK3HyM9DkptNdOZ5WHV1Sn4SzZ0wDYnf
         DKQE8fvFZPsfB9xs7qN7u9RX22jIlSD9Xn02Ew6GFmzfFejizVVBS3MlRlbk8HDv0ws6
         8PA1O1Y+ksNSI95WHN5TL2vPxSbBI0B5/BSyjIrYWGGS61Jmm/7JJCZBJKZ7jnz0f8fY
         ELHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958589; x=1787563389;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVaMj0syyeRHIkdagyrNZ6l0PUeNTpkp0efYWtQXW10=;
        b=eUpo9mqd4tB+QukOm6heOVJVdr13eGfUggXULDQw+BNuQStadC++JGECiizd5JhiOP
         Ia+q6EmflDlPSl4Rtv1XLaB2NJVvCNmR5sA6UqAwX7F7mC0Iw8sCfnzQXtqrTEG1Oi2p
         waEyWHYR4b04VtIlOEOW3cF3k2Fi3Os28NOlGhvE3pCHC8kuWVueF7f9IYT2XmVvYpsy
         IlDTMp0IPkuvB+pyWxhQRAX8uXprBGGWOUXTNy0HgEx+p/D28I0+R+vgAnx4kXiYdUbn
         iuJaldNihJlgWP5ufTkG1qA8XF+ZOOTM6ZJ/+dGrBwQtM+CogJL1FvBsae2nP9f14VkV
         p9jA==
X-Gm-Message-State: AOJu0Yy7A9tqJiirUnNgN8MQSWRAqA8MRuJb0Yk8+qAXisk9cguo0lpc
	BfxGT1l5FcQia3KhNEyyECNQsa94clWX2qRfBkNi7f8rO6DTnLz8NIKhEkKnH0Q/+LX87ETlo2C
	PLE5dkl3iLKKrUoDLbjflhf7XxU+Dl/jGLZV45gTmloLh6q2aRSaM/sQN01iuykl2yaMz
X-Gm-Gg: AR+sD104Q9RzkvlEcpcoPpEw/I5ZNXBLAHVNqfcJ5nR9tfJnm0+sSpykMreYUOSlHVd
	y7yNHmVv7dQKVPtirE/jwk7aBEYZpQN24V3FL03StKzaXDBfBs6krE45a96NVlBPoLIE5rmiC23
	okQKXW4rfGToDlHy6JwSp3Edf27hM3pF2SbF4ZTLVxPX8dlZfZElA0YXqf5BYS1O+bPaCIG1g8j
	m/1hhdlpo96p6/DjpNevxKd0gp10Jqnh7eGT9GYfifAr9PQuyYO2hMI8+St1vmyYxkIzM9huQvL
	ggLif3IwKywDDmU5VuqvDvhz/XOdFojhhDeL7Si0h2gCo4XwRjDHNNLmp0aAvc28PkKch7poCFF
	B2Xz5oKXHypEYMhLAhYOcBRrN3CcOc9lIHw==
X-Received: by 2002:a17:90b:538c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3933b8744cdmr25296052a91.11.1786958589251;
        Mon, 17 Aug 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3933b8744cdmr25296022a91.11.1786958588743;
        Mon, 17 Aug 2026 02:23:08 -0700 (PDT)
Received: from [10.92.171.149] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d0a6asm1575303a91.16.2026.08.17.02.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:23:08 -0700 (PDT)
Message-ID: <823843f6-b829-4b9e-ac74-b3c4f3531448@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:52:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
 <da616225-4be1-4c28-adcb-c32e392703cc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <da616225-4be1-4c28-adcb-c32e392703cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX6TgUSdA+wunY
 V7/B7jTZY0oECBKKoljtMmjBiq4F2k+0WkeD+4gzde9xkpRcwK9hGqD0SA9wQUPMpjB8wjPrfCf
 z/nvzctRY7Rl2w9p2nLlfw957K5eiL+ztIqF8u4XcoSHA2/oPKrfK6wWdrymPzNufwlxvgzMS0g
 e+ZT48DNKUDOaT2uvTz+82X1LF+BBjmujCEfMimwpwAR2qynu3LAxr2go3KhkQvQ/lfB58J8Cgs
 zLJCHqdYvwg73ILPegGQNM72GNCKF/X562JcrDKUUyfO9cTg28+S74yhKM70f0Pb8t8Q20z8fJp
 20tXfgXh6qBZ9u+MKt2BwoNPbwpfdkGwIv2yTDQ0W62hb0UMc1EVkPhzTPzsQD0so0Bpj04+8y4
 2hEq2y80UzB7dGERChJkaMmysbU3CjVgQxtIlB+64E3QjfBNJR76+XgIhz/PUYxvctSJKj6LCyP
 Du+bPoN2HXID7M+H0yA==
X-Proofpoint-GUID: ewL8CGokx5rQ3hhYGdYy-N3v2_af1449
X-Proofpoint-ORIG-GUID: ewL8CGokx5rQ3hhYGdYy-N3v2_af1449
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a82d2ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=I8l-se90OHnaKV8gZv8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX1vIbw+COJeSH
 4bpJ8gcJW+fLiobZqQZLhRJEYP97aBtOvistB2wnWEu6RGA4MS/ntTRW0+dTWruioaoY5IxxHhi
 bZtb414dJmYVkgnEIjWxwKV0p0TDLL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170070



On 8/11/2026 9:36 AM, Mukesh Savaliya wrote:
> 
> 
> On 8/10/2026 11:22 PM, Viken Dadhaniya wrote:
>> Switching a channel to a new frequency without first disabling the stream
>> causes the channel to be re-enabled without a clean shutdown, leading 
>> to a
>> crash on the DSP subsystem.
>>
>> Implement qcom_slim_ngd_disable_stream() so clients can properly close a
>> channel before switching to a new frequency.
>>
> 
> Better subject name would be "Prevent DSP crash during channel frequency 
> switch", it highlights the issue fix.
> 
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
