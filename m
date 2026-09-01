Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55570306779
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264152; cv=none; b=GCmZIeAEeptMI6+sS22QGthgWgnofv7fbYOZJOKRdYLUR0MAotnIb1PDYoOYYJKcjDSzCIWVCNlRG9I3gZ+hIPiOqKxu+0ccZvhQIWuZs7xIv3OvD0DYUofCseTYv574bhkwoSwQP6TJbCVvghWAPYmNKyrxVA3UfpUKZ6NjffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264152; c=relaxed/simple;
	bh=Y+YY7fuD9LrO+Sd+3rCyEQKeYw2Y27X6Y7IIOYZzetw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEqkhK+KeYKSz1mP0pBMi4+JRzqcAJJPn0DpsHjN1mn+LVFEuFO6u/InbWjWhJbhvX/BPAu8Ueigy/1fCCJ25RwqQvXW2GF2mqp3G1IcAVM3maV6uCzIxNDK8QEGCWJO4U+lD3XgxjdB+muLWi3QOrYuvPf2ZfHqIxMrW2iyXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZESKSub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMW0XzEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZESKSub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMW0XzEJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJeAU1713145
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xrSaMuuxA+xEooVjCUF3b9ip
	BwSv1171iBrFkM/JXB8=; b=YZESKSubBWnr1uIUSJ0VB+PzUVtwyreIdwksW8eY
	5GKXgeX8Pf9Q1pXkm8eosFuu/5oE3W8SrJK+W1uIw8o+vcQzmqNa4hHf8qXGUu2d
	DbYLjKLlXjLuq0ajvWg+NeVnBHy7sovuCWRe0ar/9myDh5zr2gHscS8/nAyTcDmN
	Xf7F4roMl3S3/INTqSgaLJNmLMPyGkEXw+eRc+KbENx7NRqUSI3FNIOEkS9+IS5G
	dI+mkMEIvq3xm9R3mDVuORyVeU7DRmeU9sTuN3/AiiVpEeLB/DOfni8kks0eJLK1
	f2n//Og94CFv/ejIr89i2IinnEDG4ucyQ1cOP2mXg/fd7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxachj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:02:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7866c4ed349so617426137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264150; x=1788868950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=OMW0XzEJbIhk64V83UzbfWZSieXKI9erR2hFdTh/557iBT9grnTIH2QSSTO07xHttU
         vPCBi7T+85wc6YF5Roi2gOtmA+Xy1Mc8WCif6reStNsYFEFH6imRSc4ASdDxRogLBJEa
         drmv8VnW7pG/nc3oUbWcX8CiJzmaZH79pM8Tl1AeXJfMTlkGRrrD15/GLV7HxEzz8Uau
         SNgtqcGU6osps1xb4WPj25h7zSsy6GX0bzEUmUdQ64z850Tks987W4+H6KwOmEUvbjsC
         reKv5x0h2u6zkULBvGRkNdi9bCCrRvyJgONKvbOcCrHymSY4AgkONl8jWYhJbh18DBCC
         hAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264150; x=1788868950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=EHjzTr3oPB/cAJCu3twKOVVUyHrBnTg/Ft+xOWskoyoVn5uI38vA1naruw+L0Z7WSZ
         oM0e/qdeEIhNiplwXHHnag2HnBCxLQKi62uVOBUAp9XujAMr6RIDAKIDBTyO+rLnagxB
         rNmZmX8o2IPSCgYIU7JuPoGIEtRaj2bPjqQR8lVp3E6BZcXjMhc5EnR/kmhrYEIFsx0y
         Ur/UQOK6BZw9gXSZL/jOUijXHjU+A2oP6KL60IwOpB+a4mCzL8S8dv4LN4e1sphfUah/
         GPIFm5bk5OqKmB9rfBvuJ8mlx5IxSesdLtntWF+E7elVvx5Wnbg+x+kdh52fVcrq3iSq
         gy5w==
X-Forwarded-Encrypted: i=1; AHgh+RrvG9b2H+XmVrlnbb5dAIlzt7+pcZIHlLeYKYXTocZYrsyclcIc7ofZHn9HE7FCr6QO3AWhulxJuvE+52vU@vger.kernel.org
X-Gm-Message-State: AFuF++mysVFuO5fG4UT2WQNpHLyGmyYTitGdnSsPSOAcypbBtRO9qzR7
	6VrPvwoi2pGXY63Ew5ktnFtwFG+WXI0MKfI22o8ZeFkGjJp/RmJHQWqg5doQUFn/WxPJLbETyLz
	IQ4r0FfS9iAPXwLdW2JSM7BnbaNdtDYcb34sIrqp6O8PhSAaKcyHUg1KKQi2GzsCxNE74
X-Gm-Gg: AR+sD12OxggpjjJMJJiCLSbHS5cEdpQrIz0hMRyLzzIlE564fM24Rz1FjAfUsl5ii63
	1KY4YvBP5IxjEbvHClDItT3hDXVig+FJDDBw/z3QiF2s063/viy3mAs0JpqWvaJyOjr+mPTVNdS
	t9bWPqCvv68gvrHRiU+GxI7bYMfxO+BaiTudw4uhMv8wkkNpDyDZ+V6RwOEioPMzpMtitPK7vGM
	rN4TMwALixAsFiC556bf1GxKNGYL3Wgp9HclSC7/SN23y90QQxD9Ewd3V7B7VFXeeHeZPRawenh
	SF9jNMGB9kZOm3INz/CP5xS6kP5CjbZa+bdSaUr6PGDtZlJaeBJp0bhkIXGG6ueU5+NNSKsY8oC
	M7DfNlLn6eppAwh8=
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106826137.1.1788264148115;
        Tue, 01 Sep 2026 05:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106780137.1.1788264147437;
        Tue, 01 Sep 2026 05:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce18dbae2sm18891085e9.13.2026.09.01.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:02:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:02:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Message-ID: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: xO1SC83dZ37z2u0YT4BeW81OGUiehSLZ
X-Proofpoint-ORIG-GUID: xO1SC83dZ37z2u0YT4BeW81OGUiehSLZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX7zE0mS8Lv7+s
 zgu7p6ulxo4WUCjjy3h4Zn2j0ndVeo3c0I1dpmzW5QwTPTpd0ckoGByYhgEasnxbUbUCGtAnMIK
 4ILbt6ncPI7xoktOn+zXT1HMIbAPi58=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96bed6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX1FZD3QTZEiBG
 sFPS5XcZ5YDh6sH4AJku2dmWqCdhxu7tEIYxXMWe4fRhrmTbk6XJXnBz90rqAj32z3NTA25m2JW
 G1daqrrbpRgkWciPbhdkvHsnCBomxFOenIXZmkcu7qLV4CZWpWiF78XDoW9QOwJZXDdKm6+2z1J
 Vo23Ro6gBAGrGOUhK9xCAiUFlkFRXkY2ntJi2H0AQfEC2sEg+uFpQGn7FLfaoWFbpDBci5FBBqN
 jHf3gsxAezJko/aWOQP+TWSfbOlA5gXPo93WHbn1KrlL7rEYqzko7EW8KeHCGznmIsfqJ+322Jc
 kJ46lGIoCMhNemY0oSLcK7h3sAstZ5/qWrL3bJ6ggL4H6RIArv1dmIhvAttrB3z2BgTQRnayRsO
 mJ8gZHWXPn5O6EbGX0/qH2qzNAJD1afWpAg4iX+dRvsgeOx5O4kC0U04JdUA3V5fANxjZNib48z
 ztW8cQB9AGYTyEZH37w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010107

On 26-09-01 09:24:35, Sreeshankar K wrote:
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
> 
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
> 
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
> 
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> 
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   Make all clk_init_data instances const across the driver.

You sent 3 versions in less than 24 hours. Please slow down.

Give a chance to the reviewers to have a look at each version before
sending a new one.
