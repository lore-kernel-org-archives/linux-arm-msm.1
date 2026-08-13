Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6853B3BADB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607128; cv=none; b=GZVIfNB39sxzUPuNPWWmZ9fQTeeEowlKjfysqpv8NEfFVHyxMkITiUTo+/+bZ4BTHfRxC9OpxxHmJEDzgtIgpBIDurjAxZrdmj4zSLO7Q3PPKDUz5Ke9Q9VOJHCSAPh0LmKJzJvN2AlYfnTiZFULWzhbjsER+B/+6fjVxcRc0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607128; c=relaxed/simple;
	bh=o1/2zRuAHRZkP0L2zzElQ/qi/n7LBBGbPZnLdCNlov4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcCTS+EA+kUYbF6Sws2k2jvhQ9IubIM19wEGkEckWnc7MFsa5DzwU0CW95NAXz08blQVcQOP46fTzMOIqjzeMFEtNV/Vm1eKrCvCZTEqZ0LO7TzmpZ/vb3NdOgjRCDcCOBUCO6YqlxmAwt9VoqasN0G/PqcOwBAzf/Mbft3DXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPY7uKtA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iA4NlSdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPY7uKtA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iA4NlSdg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5fman2974509
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqfMyeLa/enZs1Q/aT9heNul0cQ6BjO2BGjlXPqgzCg=; b=mPY7uKtAsPiUK2LD
	xFJBQsGTDdscZ7jwDMzGPj9JcznqlTdZHjjrdCCoKB+TIVvg5PCbYU/V1YUFpMf/
	zoZNv+3/gP16bK3VSzZY9oyTKVl4GUqqv4AF261DsgzvdepWIvdFMQ8AmR//4sIf
	/xGjOb6l31s24Zq2TZKcJvcXaXhjA9Z9T2heLn4iUNpiMGU8aGeExy13ak6L8wPy
	IrmAy+LuHJSU3+jpqvygZUMJhohes6VF8Aaw+Tjdxn/1L30LUCpOVjhy4JQgr7DD
	HJc157pZ/zs8Odn/9NDyB2IUA8AvGO7xstP4rLUX5cv+peYunxOj4OBMj72wh7DG
	Qa7+kg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m959u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so10330461cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607122; x=1787211922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqfMyeLa/enZs1Q/aT9heNul0cQ6BjO2BGjlXPqgzCg=;
        b=iA4NlSdgnXw5HdNqh2YXFVEfC+uw2K7fQAWhGls26mhMJLwCjFIF4bb2+p40/7Moma
         rEBf7waDv5BfpI38JDK3u9FBhi6U2HCg4/l1TeVF3tqmZIyR6ShSqoPknLEr+KRBQwr5
         rzmgy3CxpzMfzTB1PJwK2HkHL2KVQLaHCQs9o2GJ/IOm6mYmTtAgWICCFfJ6YYngUVBm
         mStD0YztHWqd9GNCJxzDr7dozg0D1dHpUpph/nMbzJEfbuFnZI3Jq5GQXYmoZHVh6LAu
         snB3GcAsDRgvt4iqVjl9IAKISGlrwebOc3nrS77Sw6638QnLpoq6l7jHnKJm+mBl44ov
         CBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607122; x=1787211922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqfMyeLa/enZs1Q/aT9heNul0cQ6BjO2BGjlXPqgzCg=;
        b=bgTAKJnUCeXS8TKOXwkgWub2XeHBG0blx0v+SjCOi8ZLMs0VUMOdMUQxcntn3s8K98
         i44BbBoLOeC+DHKB2ASG89PxRpyIzxly/XOHNXdSlOFNP2tgaaULdXulvY6xrDK7YnUB
         eCJZC6FaBQMHw0TFfXVTl/YUPBNIu4xfyJF1gAn3z0cbFfWI6Bh1HDI4rYH2Ul2tzlgu
         cO0D8Wi0ffg0WtJH3z2JqhsTypWkudyT+0k/6DkXSVXdvDNU6/f9TbS+cjRUJyiV11j5
         oS115klyyGKqeN43VNU6GEYaGfWNAXp1nCmoveOHRpJN4ENFdYBhDN5G85RVHXYVfb83
         cWeA==
X-Forwarded-Encrypted: i=1; AHgh+RofWN5TGATw244WRp20yKQmBkkOk++1Qe6bmwyNSb8nAZY8LuESqiDoP/vMWUSmv6lcvPTZeeXb3n7+3DF+@vger.kernel.org
X-Gm-Message-State: AOJu0YzakRMCYtI6PnQV7HmAHQBkhLWa1tcAUeCKPapJzp7kmnc/M9jK
	p8zWOctq2+2bZEAEA9TVM9e3ra1MuLd2/42ZMpzkjmS11l5CZ/4qFtnv+Rb6GNdk+H1tTwRlCdI
	LAf+3l5vWCTMlGm2sXALgBzCaoH8lCykyMxoIfqxeN/R9Q0Yzsu9J/xffZjbpa+W7xTsI
X-Gm-Gg: AR+sD10OHntDKawDKf71kztVP8jpYDsXAGIBe/lEkJBUyv+R2vyHs6qW6yib+CDb2qd
	LKmmQoWQzxlek4/wAOiCHZLF/2L9LNYsmNYeezHCawgXhWiL1rm4Xz8aKKtRJjdxXbEL43AuU/7
	659kCtAgB19mwHSzxdHaojgOdV3geXGjiKwSta+YB3ApR/6ifomUUTsvdXP/QQntv2RSrob9Itu
	RJYJTKffhcUIO5TTGRw4h/Q21EMvpN0PmoQ7tD4u7Ot0OxN5+n5iZh3xHl6E+0LmwSvL9HDwcLf
	7AEe7Y4UD46MeGsRaBz9swUfsyOJAfORDzs/9H/egZcvKAuz51db20Ip+ffqwNlpve0U4RMDYAL
	8Lwk/DyA6H1fyQQM1QGsPF6hJSWKlv8pJ/He390rSPR4UX8DdP3vCBsXeuqT4Nd0r
X-Received: by 2002:a05:622a:148b:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52d74a35488mr27934371cf.2.1786607121637;
        Thu, 13 Aug 2026 00:45:21 -0700 (PDT)
X-Received: by 2002:a05:622a:148b:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52d74a35488mr27933901cf.2.1786607121072;
        Thu, 13 Aug 2026 00:45:21 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:20 -0700 (PDT)
Message-ID: <b360c4a0-72ec-4121-b16d-b7aa94e1a1f1@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:45:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
 <nwz6ail4qwkmsejow6757nxkutojc2q76tw7lt6oj3h4pncp5f@w6xkgj3bnlmh>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nwz6ail4qwkmsejow6757nxkutojc2q76tw7lt6oj3h4pncp5f@w6xkgj3bnlmh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX7FV/oS0Qudz+
 LsFdFS+zLPNh4u1AEa1ZGN2LYkSORvJpr7Hg9Xpo8XJvZrIX+XAh7Wkk/q3dh8c061diD8UcRaf
 +yaOf9Z7L0kEbtcqlq0iiIr2dwGAz0o=
X-Proofpoint-GUID: CoDkVI9DiuyaOyqkdHwSoBVc8_Y2Siwk
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d7616 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YZRirGJidSSDptMLQzoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfXxEcKtcbTX9JW
 4V9NsAxYt7QtTrXXxxf8WTA7S//yJ7HZQqD+ESTkW/Z1qd/Frv6VAZwjNyLQCVyUzYwo1I1ZODP
 GbDHL8Gc1+00xhIrR8YHvZjMZZCJAVTdqehtmGqXo6hTb6E+NFynfZojh0xMuFjS6d5YEFcMhL+
 xvsq4GfhtUa0N3jNReq9kmWtLhpxejz4eq8pVRTHYvUh7MOTpqr/U2BmWH+U+JpHUslwbjNmXa2
 tWl3C3z9R74zsqiGNdwrLBc7FQe5g1E6xLl6QoHdYngZxsy9d5rGTXAqhGXz49f/0dLxTsPlkYw
 hLqMrYFqE7j1Rk0p7iAsX0YG+okhTdAimKfIXLuoRbIoXOObGlACsUVS4vD0SvYhvjpptWXERW5
 JHhD7oQbCm0ufFwHxSI1kbkGY89DYlZtQdc4fWEUeWHY6zp05jQ2geXoatVzN/iZPJ33fS0xuUX
 Uf2IRi5lYxWItS9cHgA==
X-Proofpoint-ORIG-GUID: CoDkVI9DiuyaOyqkdHwSoBVc8_Y2Siwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130052



On 7/22/2026 2:40 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:43:54PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC powers
>> a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).
>>
>> The MDSS driver currently relies on the default runtime PM handling
>> and does not enable the secondary INT2_GDSC. As a result, display
>> pipes backed by INT2_GDSC remain inaccessible.
>>
>> Attach and manage both power domains explicitly and enable them
>> during MDSS runtime PM activation.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 53 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> Why is it being handled in the MDSS rather than DPU?
> 
Will move it next patchset.
>> @@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
>>   	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
>>   					 msm_mdss);
>>   
>> +	/*
>> +	 * When two power domains are listed in DT, the core framework does not
>> +	 * auto-attach either of them.  Attach and manage both explicitly so
>> +	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
>> +	 * CORE_GDSC.  Single-domain platforms are unaffected.
>> +	 */
>> +	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
>> +				       "#power-domain-cells") > 1) {
>> +		static const char * const mdss_pd_names[] = { "core", "int2" };
>> +		static const struct dev_pm_domain_attach_data pd_data = {
>> +			.pd_names = mdss_pd_names,
>> +			.num_pd_names = ARRAY_SIZE(mdss_pd_names),
>> +			.pd_flags = PD_FLAG_NO_DEV_LINK,
> 
> Can't you use DL_FLAG_PM_RUNTIME here?
> 
Got it.Will ust it next patch.
>> +		};
>> +
>> +		ret = devm_pm_domain_attach_list(&pdev->dev, &pd_data,
>> +						 &msm_mdss->pd_list);
>> +		if (ret < 0)
>> +			return ERR_PTR(ret);
>> +	}
>> +
>>   	pm_runtime_enable(&pdev->dev);
>>   
>>   	return msm_mdss;
>>
>> -- 
>> 2.43.0
>>
> 

