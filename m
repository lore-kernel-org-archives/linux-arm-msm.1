Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4C435CB8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680534; cv=none; b=Jx9pG5kd2sOwqEIYLasnDobgktrWZVIbbbc8nk7n0DhUFonP9eJH8Ei6upr/XmkLN2i3DRlP8mUMYo29ruakBGVKieyQ/JvjTxPVo9XVbvXdORU0S8rbQNeNYqmrty4KALGQHZnkNdVpff/dtNVqTn2UWehmBg3/zktBNzDXd14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680534; c=relaxed/simple;
	bh=ZiPa5vGVE0Ss75ofMG8iEgYQ4iiyAKjmGWoImxrg5CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH7VGEAEuqPGaeNMRLMkMoKV0nGimzUPMI4S+4EMlOrY0OuNwVk6xXmqN+irNJ2ZOzzwyiKN7uSSVwzdRwA+QtzLC8X4HnGbOrdLWpHF22DXxYT6jiu8tkTwatImQuqv6mMtf7YOL0Zdl1TUmqYjwOsCq4jpYFycmFMQugHnIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGtFjSXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kw2OWMr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGtFjSXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kw2OWMr3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZfgU3196741
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0V09DaOcz09+t9yB3GnAscn
	+Wyme+f7EEbXFshnkFU=; b=hGtFjSXJcWYAewpEj3csLzDMonBIsp5X43ygTqjg
	TeyApyY33614BCpgbmMQIcbVf9CXn8APaRipjqESQpIaASHM/BuXAMtv+88YNwYI
	w0ALBUf2HmjP22VP3hyUizfMBuUpHaajrnM9pvSTl/pfVWxb575CQeBFY4Mzx+P5
	U1pgmOECBVfDe1mF0sbqbVpwU1H9E5feOb0jBWWlbpHED6E9YPgrWq7v1mtbMyug
	UM6M6j6Fsuqu5PZvar4vJItmJw5Nn+afHJ8uYK8ctE9no0L25AQoA+Inz8tfPU6l
	fMSQKhjmaNNqukcCCVcZcloH23e84soehSZlpSN44LKdBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863p3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:35:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so148451491cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680529; x=1785285329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0V09DaOcz09+t9yB3GnAscn+Wyme+f7EEbXFshnkFU=;
        b=Kw2OWMr33q2jW5u/K/eh8O/tb6BN5P69nPJ8gmb7ITSNdc26rDW4fk12vTN+c27zRF
         JjI6j8LF/SAIN1Kn0g4itZbGu9i62BwkizivLB1QDtEuFzBg6CZ/Mt5MoshfifUDX3Ux
         TLYvVUfAMYfIXG828afCEoMeWX0zEq4ojIBdNmqr6R3wuc5GQYN0jW8NglidztFOlv0C
         qdD+ggQ05J40d8uVlq088pf72OjqrCNfZ5XAkk0wCFq+F/5gwqk9OuKkG6GESvMLrBuI
         8Wy2T2++WQ53tV/fxu6/Y20/04TUlw/UuXT4neejrlcWnJkEYd2kyjfUa1bzlzlIBezE
         Zoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680529; x=1785285329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0V09DaOcz09+t9yB3GnAscn+Wyme+f7EEbXFshnkFU=;
        b=Tn7qMlUs9cb/S1m7JF+lh8RkFe9tkG1NOteIVRsz+JHWnTNskwkpz+tL3SByPsTwBg
         rVrSO44Hu3EUTFS+pHL2TXhUWlSdO4yhHa/6oJiF+BvG2TK2Rfu8W3cII8ZL33vHCa3a
         GGi/1tSlLr2Ix8hSpKkRfn9xtyXxPvoZDvJCQ+IxEkUp9Z2A/YiMMoxrErsa3Di0APir
         litpLEQn3GppLYtdAEXHO25tEqHcXIB1mP4/dPPkbMDPe50Yf2n6hlbxPuJcZ9Svh9R1
         GyIx5QrOCUuJHlmaLk+YLpwWMj6dCXqqYrlpfwcJfNhQO9ypCflpbff94PE9U/iMRZEL
         kM/g==
X-Forwarded-Encrypted: i=1; AHgh+RrBId/hQFl2qLj+d1OQNSomkIoLn+SiC5a1DplY3Q1oaTUqzgER3vOekt1sglL9QECgGN2QsLpfs34tfRU4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1leWrRDvqGUzvN68FzDedK62pBy4eTlDYjHr922GNW+VJ4Qo0
	aipCDxTcj4xvkUgPUhIegwcVd7c4xIE5l1SlBZ+3cX6Sd8rgCUMOySrLEgU8O/jwQ4pExcxAmVs
	0r2Fq7Osz2PFymrNtUd4qSVpHQrfctfa1QkKPPj6+AhaBuoUveMpjooha8+OAX8mLCEal
X-Gm-Gg: AR+sD11aiHxHwGcwft9b0s8QUexwWQHPwcm6xSaLKdc+PIPFUu8xJZM9BynCJ5kK1nW
	hkLxrxhTtGw4u5Txe1tbigg27HC213uNcrKD3gOvs/JxIh9v03gkvd/rSX6v4uor6Tfu2nrA6/s
	wr/zx3V4RKk+fTEI62GG6p94Os2I7gfiYmAUM2qgoio8qkAYSdB71jzZPBkrTFL2lgqEIko9BkE
	IsUfhnZWaw91UppBAhwEKONHlH8319N7buUfJIS6aojXDm4ciM0YU69JuDBwJUYcRhlwOHCf956
	gs92w0py5nv1ivWTl0c5k2aKw22VfNSLTAFvm1W3PXcrCE387G3YVF2EkEFXTicr8yWXc/ueG98
	1wUY+bUSBpVBkfkVfg2IxTxlbvGANUe3LdD/BwHMOVbRLGwl+BRRL3ngpmOtDvZwbOgh43BTu0N
	4Bt2ds7Io4YSrOrA==
X-Received: by 2002:ac8:5a86:0:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-5213c8e2bc1mr196938801cf.17.1784680529235;
        Tue, 21 Jul 2026 17:35:29 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-5213c8e2bc1mr196938611cf.17.1784680528783;
        Tue, 21 Jul 2026 17:35:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm179116e87.83.2026.07.21.17.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:35:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:35:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
 <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
 <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX0V5yNGEDk/X8
 86NnnSxjjbLi15Rc8VKtJ0aPE6GSjgF2Gcet7siSMFRCGIeUnodHDTU4s/HawpqjiQXWtjDCZWX
 Ufm/3ImvMH44tGQNiakHzCfAUbhFngg=
X-Proofpoint-ORIG-GUID: fIyrpe5vVSsK1yKJOcf1qOB2EDvTzBoa
X-Proofpoint-GUID: fIyrpe5vVSsK1yKJOcf1qOB2EDvTzBoa
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a601051 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=OQN141zOAAAA:20
 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=PhrSGFbiKP9hCI9xACsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX7Eb7GYjC7/WL
 rff0gdmiWbzHYpfBkdKTJaWLCVZZNoKOfi5Whq+XfOGDNL1EJPQmjriVxvp63m0gdyReyep8Pn7
 XhLKNb6wjN9UQ6QFxfIZsXaUWenDVNy2vZkvkGNFsQ+1r4d7frwn1Z6zj0gczO4if71TslN3Zlm
 ms41MbeewuE81iKWxBEaUxR2zoRQzxRzoTxjidIqGDKrS0VL0rzUvfd8wUPUx90HeChB3E3QuVh
 ZNvLjDt4gccy6ZccgHxwzJT5znqGwplQcZA+d/ZOPHAImRDSLcCAbuVFIxVqgCvJK9kgaTFZiWf
 BxsbyHUDCtZ7ygOxF8eoJA3hZzcsZMeZcX1zdsqXJ33qNVUsNnUPvmEAq9lgfI5mf4h6aHVMqcU
 RL2PguZsZKUcr9JDkjYPH6F0JOD52JPuIH7UdN47dPNstfh9fDohEiQsti0anbIfbH69OhjwpGG
 6z5Z8b2pnFipSBHtbug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220003

On Wed, Jul 22, 2026 at 12:18:10AM +0000, Esteban Urrutia wrote:
> On 7/21/26 6:46 PM, Dmitry Baryshkov wrote:
> > Checking the hardware docs I see no mention of v1 or v1.1 for these
> > PHYs.
> 
> I got this information from [1] (SM8475) and [2] (SM8550).
> As can be seen downstream, SM8475 specifies a v1 PLL while SM8550
> specifies a v1.1 PLL.
> v1 tables are used for SM8475 as can be seen in [3].
> In downstream, the SM8550 driver [4] defines both versions.
> The declaration for the structs found in the SM8550 driver can be found
> in [5].
> 
> Please check my findings.

Quoting commit b5383dbae381 ("disp: msm: dp: add pll params table for
4nm PHY pll settings") from the SDE driver:

    Because of changes to ref clock frequency, few of the pll
    reg values are different for kalama compared to palima.
    This change differentiates between these two 4nm versions,
    based on pll revision and also introduces a pll reg table
    to differentiate the values.

So, I assume, that v1 vs v1.1 is a clumsy downstream way to specify the
ref clock differences (which affect those tables).

I'd suggest adding the comments about 4nm-v1 vs 4nm-v1.1 rather than
renaming the structs.

> 
> Regards,
> Esteban
> 
> [1] https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/lineage-20/qcom/display/display/cape-sde.dtsi#L70
> [2] https://github.com/LineageOS/android_kernel_motorola_sm8550-devicetrees/blob/lineage-23.2/qcom/display/display/kalama-sde.dtsi#L71
> [3] https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/blob/lineage-20/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L195-L282
> [4] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineage-21/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L131-L152
> [5] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineage-21/qcom/opensource/display-drivers/msm/dp/dp_pll.h#L104-L129
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
