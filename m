Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453C353A9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145285; cv=none; b=aTDRpa8Zyhd/hqU0jwZGdprj1VG2Zrjvow4uUcxJNTYeFqk8RPanl43KDZatNkPHDIR03qe7yP3J0bVXWqu7yPCscAK3tHNFtEDy59TcCdEekb7RN3nNpCUU6klYjecwjRbi+U/SRaw9+LZTwpPtTsA1AuqMnBnctW36h7sf0BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145285; c=relaxed/simple;
	bh=RCr3nOUng3cORR5flGuZas6z0ULDaAO+wDQhBJjNv4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ljic9duY5+Ua2KvWLXqFnXGNeHPwLp7XVAAuVNf52jsN9X1/1PrT/q4rRgcUUyXx/a6cVjE9M4EIWrTHH6t99iZpOBv3BPA5tBwaBnmUoLWgkaOWBI47MHOcUKCm2ED/xakY7GrjPmNlFcTyDNZXZq5BJcUXPsEWRc0BmGoVZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZKRvwen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2A2tgkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZKRvwen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2A2tgkY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0QZT372683
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKFqy4Xe1zWA3eV617cMxEXyAiEWPIbn6jwL4vyO1S0=; b=YZKRvwenfTL4WI2Y
	kt9PJpIan3gvYc2ryiUf+zX8AxYJifYD51XlRT/nff34kDjBilJ0iiYIJ2TYmylV
	BCtfvOQI5LB90K+ubk7/56C+EGNUWztkQCbf3CTImK3CyaPw5haFEGNiLo7GrDBF
	cMCZIrLvJznqOJ9fvYh6D0OL/xMH6jNWgX+F4/Xgez+noSHIMEfwWJGHrHEJm6GU
	cfqn/KKR8Dn2PWDV4JKUSkgRKxshg+7q1oN8oOi5St0ozD1lOGbAxKHjJN7v1WIr
	AKLipN1e0s3ebEuycROgdR3ngSTFf/WhBQxyxylSM+f9TXg9FVMQqRxLV3WC2ubs
	2x1fpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbbrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:14:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d35a38fafso853311cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145279; x=1787750079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKFqy4Xe1zWA3eV617cMxEXyAiEWPIbn6jwL4vyO1S0=;
        b=U2A2tgkYruPhrqibRdY26qPDb8eo1i+HGji13aRomGXMgk7OobFrMLiJqQMJMMYOzQ
         tIPg+IcAKANqLyivLlAppN/r82PDguzOneeS3f+enNFnc7KC3HVAzQVjhnpTYEbMZlSG
         vZTuDVemng2VM6+7DmgojRvBS2NvaoFihstFkIspKjfMyvoIdICbN5jFUU51pkjkRaU7
         Zuq5etFCFEg74ZhyXszFpmZObAn9VarR7rWKXsRvy26PsTel0MtnXRBAiWHLg0fDEvaM
         9ohqh+87FH49usroJY5UHXKw/CwflEkCuhSc3fqafghRQd3fDqur44No4+3f5CjiifUW
         C3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145279; x=1787750079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKFqy4Xe1zWA3eV617cMxEXyAiEWPIbn6jwL4vyO1S0=;
        b=bmOlTWkdst1f51P1kncOcMFpvmoK6IATnfifvPdNnjFbhj1S52X78yxAgdYbG0KdGr
         mT+SU6hvLhyt7w+wy7SIt9evXidVEdCISYrbIP55ozCC5igeiNoE87TF5HXNmvoXKL/y
         mCj19uo4nBEX/E44syGvuGGFwr3Xkxp+a/YHDwcvU3UK0LqMjJtqCA3FFROOljaF6BNn
         uq/APlu65Xuzh5JwYbfua0eDUOBKZhrUfEG2CPO/bLkCuJbutoSG1VAtvubqGisWUE5v
         8Whd7V7ZkljWVqUusmRLu6V+my6ETLgfezkBNze0KI/0bjxG48kSF7I5g/kcuQwT0ZhF
         vbXw==
X-Gm-Message-State: AOJu0YwoZT5JzBYmRxz4MJU5WLoVm8/pMFoqb8OpIh6r+RmBXN883cDS
	XeJKG+sEXj6gAb6W5hOagh9cHuGC0g2TxfXHU+olqgi8nb/bXNfZF4O+wlukHyLG7sz9X/SDRpV
	zUo0pAIRfH8HRFfJtDgNPu3EY5NBBgIH7JctoHvp/G2Yp1FZPbhPNCYduniChM7DKynWb/LRWNf
	1N
X-Gm-Gg: AR+sD13bkqpm1CyCHwWYKP9o264Hp1MYOyJJ2YKi44LvpAVwkXknaodoV5O/VF68ogi
	mbyJIUiL9Eot+JlMmJopM2HaBVcUL69+GZ/6hMn/Q+WW7+RXpTkEVWOHJnlytWj1YcNyJI5Y44m
	NVN7Qqw+6EZpxz7g+DgbQuN3l+Y1Oflj+tkFvXVPW2/2AOf3+Op0Q6J39av/QUugsYkHB5ZyX0P
	yXC7SNM0+baJ8GI73foCeWPBZ4IqlZM678kMyC+RK+KOO/dGyrGH5K8g19XZWKRRvfijeS9tYf+
	OI4ovGAMKwHCXqdILgE3yXyRTCC6lwoDEFjp9ZHewIHw5PLDOrATxTGbaMfRzH+GYfH6GAx2TC9
	tatbR7CS5ZE81s3Zvv6MOe2nE
X-Received: by 2002:a05:622a:588:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52dd579195emr30916291cf.2.1787145278948;
        Wed, 19 Aug 2026 06:14:38 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52dd579195emr30915831cf.2.1787145278493;
        Wed, 19 Aug 2026 06:14:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c277ba8sm70288366b.56.2026.08.19.06.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:14:37 -0700 (PDT)
Message-ID: <3b924a67-a229-4836-abc9-0985e3e10d4d@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: Fix write to read-only firmware
 buffer
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260819-fix-write-to-read-only-firmware-buffer-v1-1-be86532fe122@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-fix-write-to-read-only-firmware-buffer-v1-1-be86532fe122@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4OOx5O3wXxZTKqvA2-RGsdLuT4GoCOU8
X-Proofpoint-ORIG-GUID: 4OOx5O3wXxZTKqvA2-RGsdLuT4GoCOU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMyBTYWx0ZWRfX+TXrdcWcG2iG
 BG0Qfpg9dojb+mU6paPUugHR0dOZ3lHETA0sag1SEJNThaoK7ZhsqmCKUFZj4B0A1M4PYxi/2Dz
 SJ+mbF4JdqyOfgB/dhPPi6oZhnbIWlyC7aoRqjoVykMdCLZpVqnn+v7wZh47FpxZRpQP27I3C1e
 35HY5hYef6po9WtPRAhyRuJyXw5FXC0sd05nCUVp01VJcu/0amvSYSbJfJV7r30mbkydXmIr6JN
 BKy1V9gwkxcftw5cnDzrshmmvsmPARw9ydPdJAfJ4yMnZfEEJnO/t5x4Z0IVhJuz7jI/Zfq+UtY
 j2hT9kfCT++6zfu1+W5LAhDQBNM2LqQiKTsAoKz1DjrXcsT5dkTNcQC9XfwpSueA71tLABDlPTV
 4wXoUA1Rie2hJ36Gtj6lBzdWnlZjtcupLVROK7emy82C6xiUs4mYB2qtcJw8Fs22xIoC2Z8E+oY
 G5Yfank5TMjztrJ1kXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMyBTYWx0ZWRfX7wAKAeGUhiSz
 3LGOKCXPkP/SkCVOBOSqhlA0suv+ZNZJUe0SqiDIZjc/V3bynvNHgRgeLffzoKjezWr7v1+clQN
 w0A3JPykcVgskSv0gCxQiD430wKRJ4o=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85ac3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=nqMQGrT_VeaHhdO9ox0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190103

On 8/19/26 12:14 PM, Viken Dadhaniya wrote:
> geni_find_protocol_fw() casts fw->data to a non-const struct se_fw_hdr
> pointer and writes back a rounded-up fw_size value:
> 
>         sefw->fw_size_in_items = cpu_to_le16(fw_size);
> 
> The firmware subsystem maps the firmware blob read-only. Writing through
> the cast pointer causes a level-3 permission fault on AArch64 and
> crashes the kernel during driver probe.

Bug 1

> Remove the write-back. fw_size is u16, so incrementing 0xffff wraps
> to 0, letting the bounds check pass for an unchecked size; widen it to
> u32. The bounds check used the unrounded fw_size, so a segment with an
> odd word count can pass validation but trigger an out-of-bounds read
> during the copy;

Bug 2

> round up before computing fw_end. The caller re-reads
> fw_size_in_items directly, bypassing the validated value; propagate it
> via a new fw_size_out parameter.

Bug 3

> While at it, fix serial_protocol being compared with le32_to_cpu();
> the field is __le16, which would cause the protocol match to always
> fail on big-endian.

Bug 4

Please split this up

Konrad
