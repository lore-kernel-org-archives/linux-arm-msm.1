Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E141DEE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008535; cv=none; b=ldt3DmYi6KO/RhViPq6i2GUVErl23taD1kSyDmHNm3qfuPHMmBdatU+7RvEAIbNe/H/hfmgxyp/G2SZF3rAO4xuMnqaSZAxyAHov/8ZiOTQjbXm7wdr99t8NkvkX0lkjqOkzxMfYFr64ahgTzHgSM5QZhuRYP63qiX61Vy5x/CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008535; c=relaxed/simple;
	bh=G7mz0q0mAi1g2L0tt6r4DOwAc/YTdbeN5mjBQ0fVDec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXZWI95aiICnELAcV6B3ILUoVoRpZLuDAvzBDsxSqAIuEdWsRCx91vHRJGd7+Qu02Vk114uffOXz1OGKqb92z9CULIifAEk//7sXfcxvx5F/hlm0rA6poTBgN2FyuftRXXIPxt7kfB7LMbAAiBNlZCfbLmc9s67Pt4Zk5c1SixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d85jKkwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLguxbIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d85jKkwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLguxbIf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694NPq1172693
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cYQg9aDclHgt9drJn2G90Qwm
	T+I4UYiJA47ezYOii7Y=; b=d85jKkwlU2vzLE/EIHCmQeANQQenfy7rwq2GdVOB
	nwZ7/DPpLjOn4hNiLaWPyIUB6SBEJ1KCXdleVqtEU+iwIfuNA7pcYKIToThGt6yE
	Tbvh6JSDBd/sOguWF5woaLvDKnAm27EfpyqifvviNb+e58txyjMiM5esQ6NZD7TM
	Kanj9KY050hb3eo8NV8MM7xU6c8lUPvotmkre59Kzzvh+G+t6sxXRzSxRKS4HNGZ
	Qw4zcRvQo7v23w/bgOzvfHoddfq1yAHhpNMYqe4ldrKjzwMg3DG9Zpm/EFCqwWVA
	eBbl8wLJDksQXCz/2OnQ6HDPnBoZDntwv083s2KBsLYmuQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueh9r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:28:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so5823686d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786008531; x=1786613331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cYQg9aDclHgt9drJn2G90QwmT+I4UYiJA47ezYOii7Y=;
        b=RLguxbIfBcexKI2/FRVUV0fmPPggLM3QEYlDQ9bC9fLd9Ox/XmNUBcZd10l7GgsATd
         VIuzz9KVvowI6+vLT4T4PfZVwnGWlpdD9v9khOJOyuKCVQo8WdkJR97WltU4+OlVZGvi
         NBeoErp6WQHNoBFfZprRc6REloLyXdvvKF2+0LRHNXJegLY92kOzor4mOBsD3ZSJJCvc
         SNmFBj7Ha4x6TMq3IzioUKDnnc7pvDkvpDDXuxCFJivUcgZvQbnwhQTryvy9Frxj4xPq
         MlfXcsEobLFLz7q+sxi6d9+XJ9Vcu/ajZXHJ0S5/QJMeIY8x3P84FYaqn0pB7nS6MH69
         oqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008531; x=1786613331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYQg9aDclHgt9drJn2G90QwmT+I4UYiJA47ezYOii7Y=;
        b=BtvNw/XjULKU79ZQYm4a/WyixoQxoLrfLlE+GeD+M83EBO7WtoRgLP5y9P9e2ZL/zl
         M9jtVa2d09rNBR6OClrSqvbpP0pfjqTpPnJooNG2RUYUJeNzDC5UNhWYPsje7flCAme2
         49D2tiGA0Fxcbb9in6PHT4nYsF+QltIGRq2H5pg6Nt/W6xpY4RsuO53F61+C0w0WIeYU
         ih+3uAhC7FxdHWho0SgSYz0dDvUAaiyBP2ErVUXRUfhaN7mQmuIs2B7cfADW7nZGaSTa
         RcPC2PPN4dbo8r1P2Y0x0bHHVKGNwZp/0sCBZxGllQZrZLypZqfPhm7yreXur3YSODXi
         Z3JQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlVtYY2+4Ou1MyJAmak/fdFHpn/T4M482XZ4fc8hy3zfM59FqcjV0zz+eU5sL+0H52rekSnD/h3kSFUqxd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9h/IUgNj9A4CiyYV1sMq6yJ015kcr6O+INGxIhAYCqEJ2npUm
	j4aLcFY/JCgZGfsEvuGFwCNYR9x1UtIWaKEAgU5Np9vDWY5yoU5HLrgxm+4PLFiWu3iMGSeQOoi
	HwhdftZ3bVDWUPgwBNgWuu1ea5L5eK6vbFZ5zqwq5Sv4ZmVYEynniM3JIlTZ1Z0/AeD/W
X-Gm-Gg: AR+sD10bkPye7STQOiPD6Zy9rrr7R9/aSzc2gMjxzfr7jBhlWk781D891iv8dorNolC
	CaAAgWwmuV2hn6jm9fZ9AnZv7Q3CEBStKYDJ1X6DmABtJex1Rh/Fbwqktx09Ia/VNNwpd9iJ37t
	0nf9RCSW+QfC4DCjT+v/DUop0OY6pJ6KUblKOJmCKtixIBWxjIcXqvYxB/eu45VhgvY7Q6NXNKK
	BuUJ6gU2FeJopAYyby+SUMNj3ZlySoPJ12h2+IomtmwtAsmpOPCRTBUoWSOOTFTXq9cwhW3dL0a
	FweXi7EcKBLMZw8m5B377B8O+iFbZddZy8CcokRaAb3LuccrgENJsYj5J9+uacgBt1wGR9ZuAIv
	vkYZNWdl44CD6G5hcKVTDp6T7qGuk8NclfFwGbJ52ezdGn9WPa5SHUlu6Hfgagtk4WPWUY3O7tL
	zg0HbwmVQRziqDiA==
X-Received: by 2002:a05:622a:54e:b0:527:7756:3ee9 with SMTP id d75a77b69052e-52cfa9ae110mr53895921cf.0.1786008531209;
        Thu, 06 Aug 2026 02:28:51 -0700 (PDT)
X-Received: by 2002:a05:622a:54e:b0:527:7756:3ee9 with SMTP id d75a77b69052e-52cfa9ae110mr53895551cf.0.1786008530768;
        Thu, 06 Aug 2026 02:28:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2fa841e46sm532312e87.29.2026.08.06.02.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:28:49 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:28:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: allow cpuinfo max to decrease when boost is
 disabled
Message-ID: <35it74zycctxhpnbsuvp6a6aazrjavarhq43fqgruafjv7xkt2@recuceutrqrn>
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806044230.909961-2-sibi.sankar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a7453d4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2pZFztAVUCvpMdXWLIQA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 08zceCnPha4PXRs9-EX2MYKpvw4qosJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MyBTYWx0ZWRfX3VNVpi2FPXfm
 egl4ZiPlmYWzkPofVzb2/X1bIisOBZSf52Qu3mZxOEE3+7oxL5btnh7kVxC+/j/3Jqww641jxXF
 Ges7fo1qHujUzxkJkvzWA0nLKgAJ1NTJAi3nt2dUYumte2zI1t00EaoqGI52tYYV5Mgr8Mrzaz6
 znZVhV8+ovq1LcSFOueNfqsvqH6IfLOqw450EYe7ohWydLRhXR3U5Qw6mpYN0MRn0YLIn+I2Jsh
 +Du2r/MLYMowMAp8XH0oBxAawrAxkJ0jfJSyGECHbGv3v1wKEzQ57tuvD7B5bxbZPPrsFiNYCsA
 3VlrVUp+XbprWlL0uvGB0BGrNdPnpF4dVZo/UXW1OWXRvZJ6cBpMAXIX4lfJ9EqDmuWuyzKo743
 TK4tR6o5GipLE01qoenLrwStdZwXMXefw/9/259Po2gZc+c/JF3hvjwJwEgpB3PmlkN3lIvpr9T
 7buFTnoB0Ue+I9wAu0g==
X-Proofpoint-ORIG-GUID: 08zceCnPha4PXRs9-EX2MYKpvw4qosJz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MyBTYWx0ZWRfX43DmFoTsP/97
 Nyj0IAc6gT+ozy6uOlyP1IKFQNhw77cSuL+DgL/l3q0H/wefZlOnH0LUMMKYPa0L5X6Vt5XsRrZ
 +Ehd2IuQqhMNHyjQ4bHAUWrg6rOPjyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060073

On Thu, Aug 06, 2026 at 10:12:29AM +0530, Sibi Sankar wrote:
> From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> 
> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly
> if max boost is known") guarded cpuinfo max updates to only allow
> increases, preserving values set directly by drivers above the freq
> table maximum. This prevents cpuinfo max from decreasing on boost
> disable, leaving policy max pinned at the boost ceiling.

Why is this bad?

> 
> Remove the guard so cpuinfo max is always derived from the frequency
> table scan. Drivers that correctly flag boost entries are unaffected
> since the scan already excludes them when boost is off.
> 
> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  drivers/cpufreq/freq_table.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry
