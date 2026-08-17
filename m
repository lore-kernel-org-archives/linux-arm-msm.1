Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB53BB671
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965887; cv=none; b=cuojsQcKzWyVZ6Y6A3ZcfyRBr1c8Cfc2VDKit364XmcXyikUTy/ErwyJCr+hUZbdkENvRXsblAh4VoJtfqHx6ATiw+OnqXJ2e/tIhptl8jTiiJGpdA0Wrg9S39yTsZEvsXNWxrWPcpoQq2lhz4f9Na5NH7ijGGuNNpXREEt8dpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965887; c=relaxed/simple;
	bh=M1QVpyQl+tfoWBjiEFQ4lxipLnUlVCZK93NhJ2zuUVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fe8tJ33KcXQLoBFhpJLyuiwzrwMGJVL99N91nT22CSUpUrYW1z67bKSWH+q9qxI9yVLPtt4Vhee1V+SaFW4jmnowLKrEIjaHT9KXzctrbB8CZtftGK+QQ2mZjyPXr5TzYfqyEetvLwzsTENhxQnDx1ckhi5Q02TWfySusL8gGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWEMgDI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzRvDfAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWEMgDI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzRvDfAw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dfLv1962560
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qcs1zBqNu56tW75IOxQG//EA+2Y3fUZLHsadckfVa2M=; b=HWEMgDI4T4XA/OQa
	W39aEezwHqNCSHjTBhPeW7KbSS55m9qsAPm7j0HeE/zvoTSypT1LipWPoIXLJ8yr
	yoWUJYHqOesGVYgLnS2csP9IXtlWb5E5RRMU5Jq0XEohhfOZ+vPC9qyfvcDEWpR1
	K+zwP6NtQJgBkjMxKtc4KjfnlIFLOD0UBU8e8fSThvpoFJeVhjNQZmpmDJk2c9S8
	+thd4uPVhH3ZfI9tHN8ZhhCT0TwnXgDpC1XU6z19TA7xc1mAvMhZ9hj82zVmmUvN
	MRVu8E545TvuZNKwZilpXqMvHD/b2hr2tzMpOQ9hiq4JCQ9fBEbHLeVyclCnUPQn
	E0//Xw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wregxt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:24:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so4002061cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786965883; x=1787570683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qcs1zBqNu56tW75IOxQG//EA+2Y3fUZLHsadckfVa2M=;
        b=DzRvDfAw6IlFYZPtLuXQKp4DseW1zysNrBPcLvMdNPReeDovk2MgJG8ydl86We3Db9
         U8th3PyGenMjGE0Bh2enZit4sMgJswZnAK54t6F6MRs76P/rMvq7oqn+c8JpjO6BIZkd
         BfQS56aAvnhqqwLb0Hu9GJ1vMW8zYRE518OT+lvGug12EMeH2hX6YI7Qotu9yRauHchy
         GV3NW9ByXrCqcLSCXiWT6eY8Fif4fuqdEZZ/lcJ+5wzXnqWszog4+d9x6hFLSDUzbNev
         1t558A3rt6S3WxVB7Ul17ruIaJa5+srKtGeYBeNZjXv8yj7wZvSSB7PxHXlwd194I9wE
         EmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965883; x=1787570683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qcs1zBqNu56tW75IOxQG//EA+2Y3fUZLHsadckfVa2M=;
        b=ZWUj/fxwIGKi3BLMrAc0n6+u9Na8uHG9suHKtxVrYQRAmZDcLIE6VhPZvGuzA452Rw
         6Yp2ySwz4/HJcDRdVj88T/KhdYRxRwIAAhOExpyrMSD4DrAFhtx0y89qNwzFAzQsGV8Z
         +IMeJjdikFwTSuVO7/Kr227HpeHn7GSA1e4Hza9t4w5gSzlueA6w9JLbPjfz8gNwlp0N
         ogJ9FSZ5qva4+KwCUWzf8iO847GJlHS43oulRHpqbkAvXU8HahRJXGw/3IYvnRL9LpxU
         G9SF8MmUPjtazxAJWp2tkfrUKvzU8sx/IykXLEqHmf55ScdwRHqbeDDyGrH1WVThj7zM
         zSVA==
X-Forwarded-Encrypted: i=1; AHgh+RrhkvLwG8sWPfmDN8P+DPbUBRJDGmOoVnMa5oCRoCHerLf+FR7ikH4J7Cpmcqs2Cmm0N1CD0dqOweFJsu2v@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQDPnZ2tzpxm6c0wkJMifuwlbRcvRVzuFjQkaPw9j+s1B0tak
	8qRrTpAQABsqvwhmBoEGCbXoHRB7bOTqiIT32BUSvippWZgss1xBVk98OqacOQR1xVkcMZwHbcb
	DqQNV+VPakYiWiq3Orgj0nyWTjlvszHIuOSqj/6AnxPdeqQQrqHCHx6u76NAvCZVt0ABz
X-Gm-Gg: AR+sD11BHFNn2momZtH6Z8isV3ubj2Pwf+7snjGFUB6xNGR7XBxddpz3Pu4ccGTaPWI
	W8w3ltMxFU2UeukbXcn84cplWtugrGWUKnXE2uFExedhyM3P+AXZfPfIUb5jn0FaP/ol1HmtEHw
	YV96n5tSg0o2YC7kgWEVz7676M+JhlfmO2iljqirwB7e+2eFdD3uEgiCsBtyBaiyUofEuViShUL
	JOUn9lrmlp0Jk8cOje5rkJdNBxEk7Eg5o501YVtXnSaLURADhqiWc5Ks5i2cVT60P8gJiQ/474H
	WjKpwdjcH20vwX8geea+gWHDMBlZ0cdlKpyNafCzKx2cYZLaAt2JRv0juyAgbbVQKoerxaXin9x
	DIq2g+zGvIkH/xH/I1AHjoEY1
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr194454381cf.4.1786965883386;
        Mon, 17 Aug 2026 04:24:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr194453971cf.4.1786965882931;
        Mon, 17 Aug 2026 04:24:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85883cbsm495142a12.15.2026.08.17.04.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:24:41 -0700 (PDT)
Message-ID: <cedd23f9-4ae2-4215-aa12-5481783b84f8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: venus: report the frame size of the codec
 being enumerated
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
 <20260812-venus-8996-v1-3-6615f82a63b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-3-6615f82a63b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a82ef7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FViGdUMYcZh3DYrJdpUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _wbfS8hKu_bzVqHDUzJmS-VsZ1cYi653
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfX6JPGHH6Is1bA
 vKkwc8m8ac9qc8tYOl+aMPygwvK7pvVZoSGbaBSXKbPO35O4pFGuiAFpEPmn7g2RqQ5j9rlUbFi
 9RHF23+sq7DnUJ6Uf7dkX1jgHgB9re102kSudHSxUkj968d37aqE8U3Rcu1ta2zW3pOmtIPxRYI
 AHbzTjYaNU0lDYM1CoknC5E+xB3BKG9KBg3LlIHhElSKGcJHJG9+c5jvrMSbsbRqyd3kKuDJRgz
 N+V01nvY4Na8FgY9fwju3Fl6L7O7deiQA2NDWKhOS+gov3NbYR/FT9vU0LTCQGZ7Io0UCEaoP1j
 KpcOH5YvQxgvYCwIHjUHgqb7MkDfFxqyc43TYBP6HGp1ACw535vst4ELOHv42kolarRnLgsVnos
 kb9+h24E82nGAwuHv18HGVATu2xlwklP0bXvrA2U0x3rLUcI2WpRHMOXw4r9YgKH5zdovfXE4jP
 vgGjATv9YDamDROfXIg==
X-Proofpoint-GUID: _wbfS8hKu_bzVqHDUzJmS-VsZ1cYi653
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfX1p53tb/oDC3p
 rt8UjDlsGmaxJocATpd/+aRpjCi6T2woOXNkRrDa4LlZmwXWK9ysaxjf2K4rxYUX1X+aGSS+0pG
 0hZxRWOBAr/B2M6MGA1A+RoA84DS8Tg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170085

On 8/12/26 10:01 PM, Dmitry Baryshkov wrote:
> VIDIOC_ENUM_FRAMESIZES takes the pixel format to describe from
> userspace, but both vdec and venc answer it out of frame_width_min() and
> friends, which resolve the capabilities through inst->hfi_codec, the
> codec the instance is currently set to.  Enumerating any format other
> than that one therefore returns the limits of an unrelated codec: on a
> freshly opened decoder, which starts out as H.264, asking about MPEG-2
> on MSM8996 reports the H.264 limits where the firmware describes MPEG-2
> as 16x16 to 1920x1920.

You gave some numbers for MPEG-2, saying H.264 has some different numbers.
I think it would be slightly easier to parse if you either skipped them or
gave numbers for both codecs

> Resolve the capabilities through the format being enumerated instead,
> falling back to the codec in use for the raw formats, which have no
> codec of their own.  Both drivers now share one helper, alongside the
> pixel format to codec mapping that venus_helper_check_codec() already
> carried.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
> +static u32 venus_pixfmt_to_hfi_codec(u32 v4l2_pixfmt)
>  {
> -	struct venus_core *core = inst->core;
> -	u32 session_type = inst->session_type;
> -	u32 codec;
> -
>  	switch (v4l2_pixfmt) {
>  	case V4L2_PIX_FMT_H264:
> -		codec = HFI_VIDEO_CODEC_H264;
> -		break;
> +		return HFI_VIDEO_CODEC_H264;

We already have this - to_codec_type() in hfi.c

Konrad
