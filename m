Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B5C3E44F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052709; cv=none; b=WpPHIHs/OSLXkVGKHY7OqoDgymNt4TKETe+mK7wjqaQLnEaqYR/82L42vCeI10TzY7V61ZFolTSQknkQzdoFR0gxKvHpQZxdLpnioTVxDICPoYPqFl7tJGIM71EKdQYqawhaf2Dqbckn0+bAaMnUsiMIztmpZO56+3zQBHA+B54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052709; c=relaxed/simple;
	bh=NY86+UtTeN18brVKhHbm/eqdMY5zVtKQJb4K6zcHeRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqt1s2eVAM2swxJZKqo8YOxnphPX91dR+6KiJQZbxYM2HR8s81rjflt1ms5Z7urq41iTH48qbGDK6bJf6xrf+/hnU63/V5KHgRZ7HdKV3HnftNcRPMAvLZKYSmVjQ7tx0152P+5k9kF7wQx9i+tuML+n8cbO9Rq/4LUOlvSjozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDaYJE67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gT6fn8WP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDaYJE67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gT6fn8WP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZ9E3979096
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mY/6T9BzpgCW5+CBVXCrMzv9
	tYsak1ues+rkztrNeAY=; b=aDaYJE67/YJaLsP5MU26olE2o/gnHt3LF2RU69y8
	1IqTUHUJl/2OsJr1+y73hzZhoKOKhGMMnLG8SwQFX9aAWvHgGSbNdmAQScj5JlZb
	48XUUcylx2IAAp7VjYWw0JAYmH5Gz5OuPnQ1I8mouO+ftuW013CqQKRw98KV9zMn
	17TjJyOIMoo/3GuYLJLAaGLCpJjSK9i8vI7oSDOJoSqLwyf2w4udVE7U14KqsoWm
	wwj5WGgSEShk/Awvgl4JMyob1kPBdonG/4++uRubgGe+Z83pFuK7xJyXJbCVDyQ9
	oTYnOx1ugBcUmLpJ8qLkWD+HDjSdvXWLKSdzulIXwh9Ptg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt6v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:31:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so493466385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052705; x=1787657505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mY/6T9BzpgCW5+CBVXCrMzv9tYsak1ues+rkztrNeAY=;
        b=gT6fn8WPiFwPoEee+yKy4B3yMMHDSzpFBURuLGCAGibnN8Z7fstcaVK+FSumiIhSpU
         xUg96daFGf0mJFEY37C6ZFrIMpN+r12R0MyDAa/RgekEWfpIYoplEt6DtxDLWJiG2aPd
         UHs4Q9NaMI7B0686xVmGYBhGqQZnvHQm3PCqdmnyitkfEUVjwRTnnNLZlFSXjUkWT8Ux
         shNffN3iqxyw1fHCLlyb1tJLsdkjBosUJoXc7HM3rSJ3C3y4m8GVNN+0R5N54YmeFxAG
         oqo7gTB8yoK4GW9AGEC0TXfBFCFLuu0emnKFFDL3ZzCAH4CFtyHMuRqOLxAiI4aGzNYo
         eNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052705; x=1787657505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY/6T9BzpgCW5+CBVXCrMzv9tYsak1ues+rkztrNeAY=;
        b=SNC4JnP8/pvVb3HBw0AHlnky6q/H/ZEd6gFy7xFAivfLluwuFMkf5WSxeE2U0zQZyi
         8kwJmSt4ucfJHWkwpf5KLoBpZ5EE14cD51JvXT3itKT1LrRf9qkxY+UuIg2W+/+xWRLV
         aMPtloUFI+vG3X1NPx+Kr5Up1hcLw4hDZLuv9FawTFGLwpA+WTh+zQDkIOBElnFyJtJx
         OBrJPnWBOF9oQviaU86RdEHxGlIbBhejaABppbvg96a85OlW+bwzyFQn+MX0z2Q+h1Lv
         00B9iczec4XgMtbngjg51LnT7h+i+gnJavXKicFpL2GOaurUQOBb81PpR1tEjlAD0lAm
         d0Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrdQy5BZ7dxRAiM0qSwHlz9bnithvHc49DCz4Mvq+za4MDMTsSERg/QhEmBT9+l+XMsWbbo7jQTxh9BGIjW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dghWNsyB/jHw6Q6HTcHHhK//J0sa1Itud6c7Ah0osWohEMyn
	NZZRNxkW+JR3/4BfkqZ5xUYcB/iaDQL7YtE4ipiYHrwHC7iPQye3pxnybJRlmopRQVk9GumMY3u
	wzpVrReoza06+If9Bx5c+BgsffxQf3JzJytSa8o3FlY4WntATfFEudLL4275p3snPnwWE
X-Gm-Gg: AR+sD11qpJmdEPh0dqUIoSZIdkh9pR389J8+NonQEe+HwEWLOooEYZkSD9E4L0CG1ZR
	oXDh17rDLhDq7ZdC143LxDbENygiYSr61ApkEP3Mo6QCR6cbly+pZEz24dSg1I1wkjlIJ5KSBCy
	ia/uWiUNri8N+ZrkN/wCsntKLkLJIy9v0J4+Z7iaJZDad3F94ai3J+udW66HYgzF5Lzzbd7W91G
	EOXHVc2mM2QdCyUFQcqGSot0vW4Bkpe5CiCHRkd78GaKWKLCl8zCNsqFEQ0GfgWmHwCypVznZeK
	ILEvG4EsEitow4fTxDqeICE0Uh9ScvuCsGOWTQG8YOCkH+5otPeembzDVYm43HPU/c0zlH7hw7J
	R613jKEqG8RsmVfPBebAEUxFnKQLfAqT6hBjA7bAg8QxCx3lxSZ0MM69oh1pK68rcjlmCeHz2hs
	mKqVoKLbOoNt8t
X-Received: by 2002:a05:620a:454b:b0:92e:bbd0:260c with SMTP id af79cd13be357-93704baf1a1mr666050385a.36.1787052704990;
        Tue, 18 Aug 2026 04:31:44 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:92e:bbd0:260c with SMTP id af79cd13be357-93704baf1a1mr666044885a.36.1787052704548;
        Tue, 18 Aug 2026 04:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcc39sm10808521fa.29.2026.08.18.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:31:43 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <54w3hlnu5ta5v6coj74o34nt4idolyaabecsse54sebpnyawyc@gbkvunxqdxj5>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-7-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-7-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: vQekzrSt849-LMRuhbtD1xBnXLSqFgfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfXww6m7j36M+et
 PxFBmGclspgmqyYe0q9BT8h+epgMO1YUEAvBzSeM1DrxsWrVbqv/O7fPfEbw8Nr5wkmn4P4fYcM
 9gSwtFcNjAHQVgNEESSefjkWq7SEzFh5l68DKKolyJYm0DtTKmXYDL2Bpm48mziOxTvmNKViiZr
 g9R7FIWYyJ/5CVAEdzE/lMnA6bFQGTh6fCtdnQ2tA5vfX7pyTkRO0Fa5iWM3bUZp6HfaG/J//ec
 wBtwB5Fi7ylZ5BTjA4kM1Wjoc+TNG0NXXKhlFDupOdOe6om1dont1OxzuUdHFKcMlKubnEsYaG9
 GWUiSo1G5tiPTf0p7BI0v0r7jgyBRnyyDrkg1toPlvAqxvoN6cWtfVOMlIraLM1/345Hj8+8MZ6
 VICUpSoYkK8+gAIhEanJNss4iydcP5GRi1R5m47xfaaW6oseHz5LJ7FRJeiwbvl1H7TR1ZSjBvC
 AB8W5f8SiD3H7D3LHVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX7SwWmsOoLukE
 nZsgvI2BdoRApNihibckVbTvHs2lAqGWwLLaK3lv9gDq05MLJZdyeOM+xnF4C/mvG/6KWMboRDw
 gqVmwT5dZVtlNBYBOVQoRUdIV9mNM1k=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8442a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZfTvDAhhgTXKM-HDKzAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vQekzrSt849-LMRuhbtD1xBnXLSqFgfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On Tue, Aug 18, 2026 at 08:07:48AM +0000, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
