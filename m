Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008F37DABE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145857; cv=none; b=E78nfxWo/YuGeU4NqG4W8u1qpigWou29v8Xz0Eq8fxhnpU5lrp3DUuDeAozFTO0FYUf28y6ukAxoT6FuO4Q9vZbb87pIzyPJV6Brhq93g9YMI1N2ZasV9IPB6rjvWQ4z1tZpPVhpwR6SmB/F+dGlfqZ5JWlzgY+RTPzOJ8I03cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145857; c=relaxed/simple;
	bh=c4RqjY6KZF9m67IHoI3DmJuEKYlcA0wH3I4H2KYFB1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlAC9uyQm5VzjcRMxiHrb5QphFXKExnxjkH9/vWrWB2JPiAxVaSUdpLukZlUJAVOiW9otSZM8C+ZQ/GnM0DRwsJsXNN0NDdq2epAqFibxHMjnMJd2gHPyaJ9eEiZjAruLfJZV08WM7gtfvKGYZTSgeLsxBvB2+hcYVe5TJx4sPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXXZW8Tc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7a3ySGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXXZW8Tc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7a3ySGJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9Wxj83316245
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFwS8dPPBX/iwtv/BEnalT5oLdkzhW1l834RoovjLDI=; b=lXXZW8TcxUOvERm1
	VSlD0VtELDYugWRaxAenx04bHWWSlRir1qZSZDBSQcXS5HxwUgWKZde/6aj4ZPnk
	vsY29I1qwFWlyXqcQ6fjJCRnOAK2N5QwGsuCFny2l8ZmNeISLmZWFSu7m+V3QRqs
	MAPhMVFekH43ckwB//O+Od+vlRRJ9ectChw01nbDLRMa6S4izmbKm45LVHZS3ONT
	wlgzKJ8QFKtI1wgbl1Gkw80aB0wqLyh688N0uV06WLq0/e61fzYMvqg+wJPAemh+
	Km8nY/3srSsPLxhzYNzesVmNDSn7V7ExlucXaiwbBwRz8siv8znWIpVcNvQw1/QU
	TFJ86g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs1ye6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:50:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so6724242b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785145848; x=1785750648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFwS8dPPBX/iwtv/BEnalT5oLdkzhW1l834RoovjLDI=;
        b=c7a3ySGJZn5Vy3vS+fIqZxEYBTLHOfkv/cVZ/LakLc/2ea4C8JQK430Q6vs/krmG+s
         dGy2eFE8pLAl5TMX6Ck2HmIRN132zPIBzQveMyuxeYm9m15Xk9W1PtElejqkDSJeAW1/
         WwWw8x4ASCAe02+BvurpumtnoqCwRdwfaOnwifhAN+gP4v4wxrwBbbhmo3b/79pgvVjB
         gtLgBGcvXkrqRCNh1yox5r1jyYdiI/cAfwSniYaDLg72kQFUbwPecfcwkKi9tBnek3/k
         DIxhLU88hQjweEaSKMu3/f15plAC2oKHhTh8za/sf11tzniXSCBL9TSfTV10HOOWcAAE
         P9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145848; x=1785750648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFwS8dPPBX/iwtv/BEnalT5oLdkzhW1l834RoovjLDI=;
        b=Bln2Rgb3k+EOesD9UKULunDQDs9YLnADOZS2xntWdkor9hZWFP7CaMxaVBfj9QvRlB
         olWMc74B71BPhZOgx7VHT1vbVmPPdfyKsQBkc4ygm9dlfwxtciMEW8zbOaynmqkrzYZr
         EyxHDvAmeFccm3FOiue6wZWd0ulmdSVFOkLignyLzbWePfwIaVX55NP46986EPg3esgY
         emPJ7xTY6npUJkafeDnaGXOXQj6bIMQtUtAzNCYi/cL0+F6+cplT8pGvyH6QHp2Jk+bh
         Ot2sohtOv0FllYKLXZ7z7GkyOkzMSPWKC8DRyzzcH5IZca+3Ip1xTshRh/qO3jCWHh5M
         iZww==
X-Forwarded-Encrypted: i=1; AHgh+Rp3b6mgwS6ZljykFaooiZ2UZi+kA3wbsXv60rZgkLYGzdtaTq3xTaXqfn4LlIxF7xxEk5KVKy/Ou9BF2HBO@vger.kernel.org
X-Gm-Message-State: AOJu0YyRchdK2hbHJpOjR9c8eH5plAsvCha1a/kbkuA3CxJBb/AwsXmP
	fGVUAc6cAwib3VrejMR/fU8qAJQQh85ctXplla1Idnw2p1HsiAH14W5GFPIpcXWPhq0M/a1eiUf
	shcvPfV0BYKrGdnunuBj1RNWKAkdvenhtqthqsI+UZUCymgjNNbHSjszTWwRed3ywvv5Y
X-Gm-Gg: AR+sD11CoHLACwq55NkHWKx4UHhx1ZzMvwC9hk5VmWYeNcciiQ/iUiRztosB2vJdZVx
	WwgsjXFULs6pT8o4YudgD/xpN+jAjla8Ej0NJcpBUiRv8brcO1ReBM09TtzckstfWUsAtXFuile
	cFYuauWBE9mDkA+kRhIUbS/hPRMTLVXeog9VkafJxEqvUuCB02OOqaj4dAt6xtiC75DkKBU3Qf7
	dAD3rdnnYX4BfqTWNz44TfSq4iMUdoD28WMb62+xiCnWhcSclWn03C+ce7chaNahu+bpnt0TjsR
	QhKX2vmMLWHX61e5ru9sYIbNK81lDIiJXnYpOaketXnNvBNONm8j3U9+mKsB86IRUXWhXyuriFK
	QEa79ljwilVaPY8H0iYKZsC8JWOqO48kjHA==
X-Received: by 2002:a05:6a00:2288:b0:848:2f84:733 with SMTP id d2e1a72fcca58-84e5959cb20mr6015787b3a.70.1785145847622;
        Mon, 27 Jul 2026 02:50:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2288:b0:848:2f84:733 with SMTP id d2e1a72fcca58-84e5959cb20mr6015766b3a.70.1785145847141;
        Mon, 27 Jul 2026 02:50:47 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f23csm2821805b3a.17.2026.07.27.02.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:50:46 -0700 (PDT)
Message-ID: <77339c83-3fbf-4903-8ca8-824dc7f45839@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:20:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-3-c3958f28b045@oss.qualcomm.com>
 <f127746a-6b8a-4146-8872-6790431b563c@oss.qualcomm.com>
 <CAFEp6-0bZXmh-2+ZKujZg+vbJc4ZYzVOq9zXbsbDwVGz3XLBHA@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0bZXmh-2+ZKujZg+vbJc4ZYzVOq9zXbsbDwVGz3XLBHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NiBTYWx0ZWRfX1nutqH9LQ+FA
 P1bx4uc11CuD5R2hkk4NioHKurNtD84S3hgMaLjo4cYwsa/DeNJkYxQ5ptAegf12Axrui6CU4Lx
 qegOboszAsG6wNSmbwRDHcRH5aYdPYIkJlW2wdZhxh9jELOI+jyl+h1SUScI/B/2v3Uy3iLZa9N
 421mLkxJPhHjsuM1mvKDIN3pgnNo0me8U6PBehBWXDQpX/615VojnRKf+WfRfFPmQMyk+yk56p1
 ntAofq5jE6O7VCVG3vxl1kh6zNuJZxcNyIEVzRLV3Sj7bCnUTgUBdoi7EXQ2LgB5TlT88YaYbmc
 IoLeTt4MnEqNaX0E+85Wq2pM6j1Eaa2A/wDM2ZKjV/3rbna6T0h/Eq7cIPSbvznof/+bKR4Q5NG
 MQ8LYCBl9VESlKqXs4V5/xXA2F3UxiJbg6o32lOHNLA0Q8kZtJYGLQl94G139Etu9IJwIKeTTMS
 2PDv6Ac/+FumEh+kqTg==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a6729f8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=f22_Un8MVmwWBd_wUBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: EcuodwvFLSEU6nas8erUz3QS_sGldaHG
X-Proofpoint-GUID: EcuodwvFLSEU6nas8erUz3QS_sGldaHG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NiBTYWx0ZWRfX+hKzHwSBej/E
 ZxzCATH1dNA/epC+V0cjV2lYtIUVPbkcLCO6s4Mr53VRqf5HDg208JqitX3MVWlUsvfelRj6xkq
 NLeTUnfqQLPhvacq3ccZ/nGiFX/A8k0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270096

Thanks Loic !

On 7/27/2026 3:15 PM, Loic Poulain wrote:
> Hi Mukesh,
> 
> On Mon, Jul 27, 2026 at 11:33 AM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 7/27/2026 2:51 PM, Loic Poulain wrote:
>> [...]
>>
>>> @@ -587,6 +618,24 @@ static int cci_probe(struct platform_device *pdev)
>>>                return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>>>        cci->nclocks = ret;
>>>
>>> +     cci->cci_clk = devm_clk_get(dev, "cci");
>>> +     if (IS_ERR(cci->cci_clk))
>>> +             return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
>>> +                                  "failed to get CCI clock\n");
>>> +
>>> +     ret = devm_pm_opp_set_clkname(dev, "cci");
>>> +     if (ret)
>>> +             return dev_err_probe(dev, ret, "failed to set CCI OPP clk\n");
>>> +
>>> +     /* OPP table is optional */
>>> +     ret = devm_pm_opp_of_add_table(dev);
>>> +     if (ret && ret != -ENODEV)
>>> +             return dev_err_probe(dev, ret, "failed to add OPP table\n");
>>> +
>>
>> if this is an optional why to return with an error ? IMO, further
>> operations should continue which are not opp dependent ?
> 
> The OPP table is optional only in the sense that it may be absent,
> that's the -ENODEV case, which we deliberately don't treat as an
> error. If a table is present but malformed, or can't be added yet
> because a required resource isn't ready (-EPROBE_DEFER), we do want to
> report/propagate the error rather than silently continue. This is the
> established idiom (spi-qcom-qspi, qcom_geni_serial...).
> 
Sorry, understood now. hence protected with both the conditions. Makes 
sense.

> Regards,
> Loic
> 
> 
>>
>>> +     ret = cci_set_core_rate(cci, cci->data->cci_clk_rate);
>>> +     if (ret)
>>> +             return dev_err_probe(dev, ret, "failed to set CCI clock rate\n");
>>> +
>>>        ret = cci_enable_clocks(cci);
>>>        if (ret < 0)
>>>                return ret;
>>>
>>

