Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1A35C197
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038231; cv=none; b=OQSwjekSQJmlsibpPqFJE+qkFUiyYpDLu20waTz+7ArxOYm3fIyzWypw3VKf+5Ey32Yny4w4BNf9NJXUypZFC3rP25rjrX5nd11jvkSEQoRe5pV+JYIreP92PdlHzcSvOc4JiA/cP57NVlexDsnuFe7Hu+3Q+My3e33USeFjpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038231; c=relaxed/simple;
	bh=E04EyvSx6Gt8qf83NiF6Y2/tkcCyg0zyaZ0LjYr7o0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lf+tgp11Yh2OpZliZAaUWvhQOiKeChzbV4nENl1sWjz/eueYBpI96E+ES1dIAjf/nm/DJQGg6YulB2fqsuglWUbexRJVLyRMkDNygikE8AEmgTXwuzsj2TTmX/b0gMvXetpxxvxqF6l3VJpPFZTL5dUm+QL2Ev771UZfs7nSb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBK1IlHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNvFnYxX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBK1IlHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNvFnYxX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7E5LH112459
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4CAQwC+qFupWfe9HEizdVYgSXCg1lT2JkrfLxqsqX08=; b=iBK1IlHVuFJHKvYS
	E3KNYFgjeI5JBl7t9Qbbus7z13NIgwGCgMwPsDetH8vuh29RtjfTOEQq1OcC+uz4
	v86mgJk1hSQzhK4KklTMZkpBbTMiO4hJL3N3d0BTstGb6iVTMnIncL5N/fnajvj5
	QCXRXVhdI9bzC++f2RpvjPo7mouT2RCULvwQ7gcXAaOVAzL0U4MofV+kQ1VZYTJ7
	B5Z3DQx2bPrrDTrtOM0RaJdFtZUluIsAjPAo+l9Oi7zdpVyoqwI9h0vm6s85EpBn
	OYyVm3Ys4eikPBO2gNWTiQxsgt3JAaBvliQ3m3zV0S+G033nD0qU4e7l145vLhqM
	1ysOZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2h9u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:30:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso5086987a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787038228; x=1787643028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CAQwC+qFupWfe9HEizdVYgSXCg1lT2JkrfLxqsqX08=;
        b=TNvFnYxXk1h9v0jPVRrk38+VQq84nRPPkAIunQwPAYSxFZ0bODThO79fFaZL6ElYRn
         qh0kYsHRgb+TEhryGdt4ZHC0lnjqRQ0SjWJJrdnBnVZuTPkZwoqZbaS95ApAKPnGQHRR
         uLUCXUsQNFMhxI2I25mpLqq+HrBddw4YQelm5Tj64fwLDmiuPxPmNzhqLpjvlAjdT2kh
         Ex3PdcaSBrv816/fvUVxXunf954qOXNRxfZu1FDp9u4B8CsUPQFy5drNFkZm4IJbAa6e
         azWSMGhjVxfGg5o49pRtd9OWo3RD+vga42Mxh2xriKjWb0ZbYmLde6lKE1beH81VCUlp
         1KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038228; x=1787643028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CAQwC+qFupWfe9HEizdVYgSXCg1lT2JkrfLxqsqX08=;
        b=UflxEE52qq41iXmOlEU1N1VOkyYOyGj1jp5P5p6eAr7tRcLQcKYxts863IkYqEWiCw
         pxqIBZ2rOyfGlBdrp/Fg6ipa7qgMfc1DzoMjus3MEDfJz5D9m45Klc6wsDEBEXTy0Wm0
         liClQJFHpJdSe4o2tuVE0J8EZTlpGWzOFmgQGdBywBUhqsjZbKMNszCIEdFK1iOFxk4H
         u9+aD+Y35JYnL26bJ+gBupU8NOtYbBn3/X77ahhFEm87qK0sUf8Dt6ZNuzDLTZ/0hImF
         Y1XQjt/sbqH4mxXZ/TTksV9wdrYpj1pMipR2uji9EY+EiVeREskV5evKEEO/KtrssFPe
         xfJA==
X-Forwarded-Encrypted: i=1; AHgh+RoowN1OPaworaA9Yn0Ne5ioakDO+b1FQXfZYPxHMc+lin7VCetT+WG9aOzahdjLBRfDd1bEKnxIy4yIZxPQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/AY9BnsN4Z0qFUcVL33QxPyAG9O3Cw/I9vyOYot+oUxsiF4N
	Akk7o4LdbZc/XL623oablfT+hlKezVAY5YCCeGusUIGdRPUOcOq44kL4FfXKOurQBo1oVqV+0qX
	w+Nff/ZmGru8RLiEgIN3wTZKMTK/u04VLGwa7GPEU++PdY09OYjduF4z+KTEWyyUIOeI=
X-Gm-Gg: AR+sD11soSHbq43E7spjmfTZ53RM11N/xpO+piLbgT5xyeCwML7aJZPMpR0SPqTKjIe
	usyHM5H1S5q98bt1Zqvzs7CYrfihmnBCMkiHLUvCieD33nK+LwQU8dlgsLL4dEboEiYwz1GcDMv
	mdDT4fDhXZjGphJPlXXojl6ZgNexAU/OIy9DZLedHA2ufgEp8+xTxQM9X4c7LC5xrpK3gGguFYU
	SHRpL7xdaUMq7FTZsFMK4pKOGRs/tuMtwsXt6fogxE+yNicaBdiG8F3qJRqeWERUjMzsFF/P2j3
	sM+wR+c/HwUPkdxpN2x91CmAa0deJ+LHqgHlsMGp2ZhsqaiEAuVfx2+hSheTIgjE7FXjjLqZt4I
	U4K2kjq2OjTSdNTMuZ47iH0WU
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr33889831a91.12.1787038228231;
        Tue, 18 Aug 2026 00:30:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr33889664a91.12.1787038227557;
        Tue, 18 Aug 2026 00:30:27 -0700 (PDT)
Received: from [10.217.216.18] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bbdasm5117597a91.11.2026.08.18.00.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:30:27 -0700 (PDT)
Message-ID: <877c20e3-625c-4ba8-beed-305393b18cfe@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:00:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] mmc: sdhci-msm: Use pm ops instead of macro to
 restore crypto keys
To: Eric Biggers <ebiggers@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260811151759.1258525-1-neeraj.soni@oss.qualcomm.com>
 <20260811151759.1258525-3-neeraj.soni@oss.qualcomm.com>
 <20260811190851.GC2895176@google.com>
Content-Language: en-US
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
In-Reply-To: <20260811190851.GC2895176@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1NCBTYWx0ZWRfX+z4n51mdjyvF
 Be6p58BhQRYQtwFSLAlm8u+/pVQWIPncNon/ESrVsxRKQ8avRoVvkPHqK+k0NtS2Efz37d5r+QB
 p2yBi2AfJyHqzX8MunzsZzGJq0n4f9iohakqtKLXCfoQuC4cAIDGQ2YiVk7Xd1sXfWvOb6vGqyW
 YhpeN44Lk/rayW45Yho1Mfu5G038DFjZgTRmrQjkHlFhuZ07wtIItzn2QW/3PEKs8vrktPOSf8I
 T5Z2yN2c3qoHuetOYZ+OPkEzVUswgiCtCAFJFyc1F106SdPp1VoU6+SCW8lnP2mKuEes2UDI50a
 +7zeuhI4cZF0m4J8ORBjHFjXeaRR7BgQQzUEoq4Mr+v2Cou7Ere6ly9MrW6wAbgnRMBfj7QKzRQ
 xHZ048aZ/B398JqXDgf5Pep4nJEdhjxQV8Wt09t/V03KoK4r7EikmrDDjqo1WXTjw2cWxy6DzMa
 nUb55zngrj7Yjznsdpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1NCBTYWx0ZWRfX+1LeR4DhiuNb
 BHpv+OE4VySnJonH5lyvqp2gc4TSz2ErdvqxBBtOBIc40Hsq0FHtI2xUgC1enV6EG8tAWQwcQTp
 GvdzC5W/e8+F7pamHu7qDPsaupm/w/8=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a840a15 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=j5mz3ktRbTo_uisptNEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rKqjtLqDxgDIY1IMFN1E_6pgpaREXxes
X-Proofpoint-GUID: rKqjtLqDxgDIY1IMFN1E_6pgpaREXxes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180054



On 8/12/2026 12:38 AM, Eric Biggers wrote:
> On Tue, Aug 11, 2026 at 08:47:59PM +0530, Neeraj Soni wrote:
>> From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>
>> Inline Crypto Engine (ICE) keys are lost after hibernation entry and this
>> needs to be restored when hibernation exits. ICE keys are re-programmed
>> during sdhci_msm_ice_init() but it may not cover cases where the
>> hibernation image is already restored.
>>
>> Unwrap the pm ops and use directly in driver to add the call to restore
>> Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
>> same state as before hibernation.
>>
>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of ICE
>> keys is not needed during MMC runtime suspend/resume.
>>
>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 32 +++++++++++++++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> So with this patch, resume from hibernation will be the *only* time that
> ICE keys are reprogrammed.  Are you absolutely sure that is enough on
> every SoC this driver supports?  What about resume from suspend-to-RAM?
> CQE error recovery?  What if the hibernation image fails to be created?
> 
> - Eric

Hi Eric,

There are two scenarios where key would be required to reprogram, first is when
rail powering the ICE goes off or SDCC does BCR reset.

now during suspend-to-RAM, rail powering the ice wont go off, so key would not
be required to reprogram. During CQE recovery, key would be only lost when BCR
reset is performed but that is not happening right now, to be taken up once its
fixed as part of recovery flow. And in case hibernation image fails to create
then device boots from normal flow where there is no need to reprogram the keys.

Thanks,
Ram

