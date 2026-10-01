Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130C3E7151
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850039; cv=none; b=i6+G3sCwzko/b2kmZWwaYthLMUrRZWdlKwMoOq4vZD4o1zCW+a5BjuQp4eemaGZT8LHCUbXpE1qC9jrAskGpjQuJv+LrbTUoFU+kH71GImrH13d1tj9Y0BlS1PbsoY2ox+4N1Nu+yp1Kp7onoIspc4h+AD4s/0JCOGU/7FDpsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850039; c=relaxed/simple;
	bh=1mf4MTx9Pa6vRhpupXXbUv13bWQpU5GBXn3uItBYgmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0paP70Cu1zy6GRs20u2tqLkqwnmkhCqw865NIMILY6+GeE0Vg3eQ5EiCM8ba4JFdy9oXXCIG0tL4MbFGEUw8UM3P22QSZNa20OjEmV7JrGgZl1ZVBBY4PuBErGzUCzbepgDW9UPk9AkxX4A/1/Fp0S5FDYC2ATgDFqVJQYczPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6JutMV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdlXIQki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6JutMV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdlXIQki"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xhmn1512002
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSpCcHH8wAjeJ5TdtmF8ldo16S+gbqqBxsDCYAsOOik=; b=V6JutMV+QAWbmB2+
	NtsLjsSsxFTIAHk6oRgWmXUVQHKtZaW99MV255ZBzAuUCt+VebpaoDzugyp3x9wq
	bQ3w2qn45qMdyUllmpAUPhshHhFjgU6p/J7PrAM1R3FqssiPH4RDb279kLMmI6ME
	wgltB5/WMtGb6yNF6LLWybzh9j9HTslD0Ut/xKxJsbtckkws+MSQR3zmE6HUCcjh
	6WkagWHL7rgrBYf8t0JZh7BnHzGqO8lVnbYL3RtTagI2B2Iuy1O9vRix8XT9YJGH
	ndht++sGaZkcoG48QdqcXEjx/hCEs/V1EzErl4rMlZUjNL/zFshQ/7h0/+QtHxGM
	hPyB9w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188su607-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:20:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso3671474a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850036; x=1791454836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSpCcHH8wAjeJ5TdtmF8ldo16S+gbqqBxsDCYAsOOik=;
        b=PdlXIQkibM1lP+SuHXk84kZhN94vBgkzk3D+bSR7gb9JAxvVMFae7yuPmCRv/9YNhL
         4HHWoXHsVdzabSSYHJA6QY7WqgIolJSYhOUZyfrDuK/jRACSkpuIrHcX+4JcC+8ueGhV
         4t63YiurgUX29FXyYf5TzXhTvRTiFV6oD261C+RKuUmBJABRZvFPgcdF/AXUFjraNkLD
         ixYIktyjrlCojOUty/fRbNQM5srEryFZLGAIFb8DLRXUuljxB9ANs1Q8N4em297vhheu
         Ib86Pgeh/vkgXYiB6CQo8bzR477joPigNnYrscvShBkVBmQm2e6+t9bGG8awMeO9kifm
         9MVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850036; x=1791454836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSpCcHH8wAjeJ5TdtmF8ldo16S+gbqqBxsDCYAsOOik=;
        b=ZMxplhv1w1riDf+S6wGPL52W8Ax+GTeAfvxdbkfPkriqas0pu0YcC7cLfptACz3i0U
         mc6B19X4XNqOR7UHa3sQJtv/4ppfMtMkIXfxJ5XVgM/hX7xrFCQp9cuNAhFrWe2dlWLa
         gsBF7OvS4UDDRi5VpR5WPuWzC/nILBUE3bZnLcBvf1rgQzesVcjsja3gAklqiVTxrSO1
         nM1VfvaVXfshiCF5wx8898cwFcE9WjunHvk/KpHVG+JXcOrSnG/z33JD8PwwKuAizdZK
         qBbgzh+6Uqp6FGBkiFAF4NwQxr1d446zUf7648fii9i0ocRIKaDQREvVOtV9B0rpt3pj
         KTPg==
X-Gm-Message-State: AFuF++l8mD1WzDfM/4sxz9AesaPXMjiJGuBK+/CXb2JhKLKh+OISk4Hg
	B/gCqtUFk0lss9NPizyWa+5YSDPXN8MC7npRtGiG+mhSUbZ7XJYVox8eRVyY3DWsKsO3o6wYoWQ
	Dtn/OUARlh5+0BHuOnvqwC3nqWGu6lq0Ac76VTXGakFVUGpRI6rBAZQVqXqRBC5SKoDON
X-Gm-Gg: AYBFou2rBG1oqSOC2Uu8W4TAnvFtEHT1vrTXvOvgxhHriagJufORIiflYSbCqNSuGJO
	DmDFI9bLZY6+nA7LY8vPpYgv8bvlLXDTgYvY37EeKZmfpV17VeKFYbAUQylBzUJZsVFiMKOO5xe
	vJQaeCjgl4BGR8fAjjFwg38E0PNJQHL90tAxRIjUHL3RdSR93rnCSB3Hl4B6EuovBMZrTFydyds
	ArfKLWnGecQ2r/ihPTHRoC4EFnop6085DNaAFf2fzKU6SLJNO6r+MIwpTNpLyLMM2rUmuRed+mR
	0orrH6jhz5xoRnQ1kMO5ir/Ss5jCkQVH+URixgNA0QoIx475AlaGb6asLgMvi/N0LZLaAWr5OB0
	pwISZy44QDf9LBGBtBXqkDeO/oCb7lw==
X-Received: by 2002:a05:6a20:a12c:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3de9e6e23ffmr3870947637.11.1790850035831;
        Thu, 01 Oct 2026 03:20:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:a12c:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3de9e6e23ffmr3870936637.11.1790850035415;
        Thu, 01 Oct 2026 03:20:35 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818718205sm876406b3a.17.2026.10.01.03.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:20:34 -0700 (PDT)
Message-ID: <5edb42e0-1fad-4383-a215-5ca90390e2b4@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:50:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
 <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXxL2zGdIXUDFh
 J2bMTmjrXgV+yQ/tugwidVqbI9Txrtlman5piLEg9G1pmaVq1EFF+dbFJqXCoY3MKhNw102WHqj
 tFA6us7biTryI7h+EUAdUV8pQIL6GJ4=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe33f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=C0Wm_ytjJX4dORp1m8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: S4w4kdJQI3ICdBIpDRiEiKa3OYGaTmoY
X-Proofpoint-GUID: S4w4kdJQI3ICdBIpDRiEiKa3OYGaTmoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXw3WcSJV/QII9
 DYLApSfpLYF7ZYHp9FoBp4+4UESX7wOomE8x4d/VY3e79tm4NIrmiyO84RQ7tpvrzY6iMZcgA81
 DGbb7jvf56pmfYDgLhZh02GSjSLiksxQHe8XIBHy9aN2O8/JMn0KZJFgSyWohTXGVfjJUddviXT
 M6hFSfpsNkURSdeIyaMvRH+l7+qGQWLA3bhj2eM5IDOCWqqrPoJKHHH7U8WCwaYn0VUcAGcSvXv
 VNQAqSBGwncI7l9sT2ueLEm/aqHiq3C9Is204s/IwW9fBBbaOdbS/2FlA9kOudiGYM9vmu+/AAS
 2s3CACBcmiyEmSZbRhoYI+z1lk/VYXiMUZs1MblPvYkSXJuxwSs1uPMVnySA4VW9y/U8Z90tIva
 LLZqQ7PObnnA1xqlvOrc0nCW4sYSdZXCt+yrKq2ZLr65IWjVidpqUr58W/tT9654xh7DfN/MIXF
 plqm9SL5Jn0+akTGAig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010041



>>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>>        { "modem", 605, 1 },
>>>>        { "wpss", 605, 13 },
>>>>        { "adsp", 606, 2 },
>>>> -    { "cdsp", 607, 5 },
>>>> +    { "cdsp_nsp", 607, 5 },
>>>>        { "cdsp1", 607, 12 },
>>>
>>> Is cdsp1 not the same as nsp1?
>>
>> No, cdsp1 is not the same as nsp1.
> 
> It would make sense to explain the difference here!
> 

Will add comments to explain this.

Thanks,
Navya

