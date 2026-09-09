Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5FD3033D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979110; cv=none; b=FPKRiAQCmb1/h9W/ATVH4CqI9Dz2QW7QHrDxj8FU8vbcriWvKUhdKcD80IgUl+kOpKSqVULah6Iy4Xy0wgL/pEcKt+DmLUN2L+xpEtlbcvgIQNdai5Gvi1KNSNhYfMVE8X+lBNVs9B/kjyewU5Ed1fp1sjbn9ubigtbGJx9RzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979110; c=relaxed/simple;
	bh=xJlaGtrwdP5cLYNIsR5a8Ru52c6mVVmPB1G+LrKzZrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2JIhp2h78fLa5QmkGAU/4Wgp2IPJbgNmFb+9WcxsdfZpBPfFsQ1LVQ8r8pqMr8WVWfLHNdZ+dgUrTgskhu5/kLSLXcLwnlpkL4CD3NkUv7i0I1tTFahzSKjOs+AJBf5UPJh1B4YsPlGR1fkKK7OUF9IJLaax7pskorJSHSzg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Orwzo4qz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNxQu0/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Orwzo4qz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNxQu0/j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7TL82771661
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 18:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=olXdUPsz6yciolTLlAiU9YdD
	DI2IXpo0jVQq3Y67Grc=; b=Orwzo4qzsvHpMuc3+Y8OXgxXJsPAJ7HIzaMfRtGr
	YeV5+6cS94dUawhI5nXTlOW8FxWJiyQiTQgjD1hWyivkpAo0CFX/lV5mC+LbSiAq
	P5ErLboCuE2xxnkUTPj4z2gzp+HT1NrZGo+euff31NKuQAgu4qeEbdC9gNtJm/jR
	ZpbIkNoiEZnkD+iuS7ncafBGc4bbvXdnbZ8gujNR2sQiyLyChP4T7ksC4khij/r6
	aKayAJVkHX4PvLQmvt29z5Vh8IaG4PF6TFnMOddFiVbbMuC57M3JNWbLLDSIZumw
	atktBwKt4hsaYVVFR7IbLHVtbmIHLEXTxpBDH/23BMogFg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62xa52s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:38:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97a4824dd83so5037073241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979107; x=1789583907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=olXdUPsz6yciolTLlAiU9YdDDI2IXpo0jVQq3Y67Grc=;
        b=NNxQu0/jxyUGdllfKLPz/m649UaU+zBRgoJkKVc7bEIwI43nFk0n0bmrAlqLfI6COw
         PU+4d5RPG4Sn83ir9R9Xo6Ip09Cbb1TvBth+smL3bKHVRE+Cg6eVJpYaAcyTLwJLWkhr
         nK3cREs7gS2tmBuGTuEG3LL3kt40rtW0+Mxeh1dxnbMkNWvI+e0RxFUDsPMHKNz2HWJB
         XV3BXe48ZpFZKJmXVl7HQQIlGIo5BgMcap0+x8X4bXrsieNcxYJ8mf1hE7Zmqtq7EuwJ
         oyMKyZP+KiLgRa9qt7+alFLDmI2XfJyGHFRa0aFDdghNjcZial7LfpFfHnZ9rsB/DOh6
         WnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979107; x=1789583907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olXdUPsz6yciolTLlAiU9YdDDI2IXpo0jVQq3Y67Grc=;
        b=h6N8gosPIb6ZhLYU4gVX4Ta3RGycOAiycdXhHYvRW22/XUo8WJljzn2cijyfe635ph
         g8t/Xka6BL1xYCL1XF+YIuGYTCEmB9/lxEfRdJA7TqbMqyN5T46rmZhOhAvXzZdLC2Nb
         nZ4W5E9zmNbXGDDuUJbaPSv2aCMS8y2EsWPsnuSlqvEpnjBy2yaspDlxr7DXJZIepEG4
         vMlUYH0sYMkZQs9fZYt0NdBqIgK/UOPceSJFaBUeVE0oe4KerhBJDmr2+64SEvdJiAvi
         esrnHLKHPcebL41sZAE8ZRn5/GRwq+vlt6v+x/EcGDExpb+kSLl1fa/pR94FyEHWyyHg
         iiWg==
X-Forwarded-Encrypted: i=1; AKwUvBz5Twew8ZwbNNiYkrzmaK1aDGqBfYLd6rtDaMGYWd3aed2e6EtXDxfInlCgWcX2nIMeKpUIdgNqDB1BGpG3@vger.kernel.org
X-Gm-Message-State: AFuF++kpWggn4LMeOSlRojGIOTEY8aruTMOG1/rYrjhDTeouXOWyib+U
	KJFh48FGcFGcCCSCcBq0A302R7MX6LlfP2mkys3++bKySIrciRHGMKJBwnj28CfPdVrDL2o91yH
	DyhaUDL35Fi+dL4D5uTVkK+t/6KuTIYTs7UnKs4RuFGB8Xf71BcmfttOflRHo/F4AVwQx
X-Gm-Gg: AYBFou13NJaJNXnJ3x9P67z1JkUc0j3vwSHMBkxXQznefnl2tSREO5SISJ0ExWdeMMh
	GV7hqcASMswXLGIctcd4dHv3P0/OXSLX0eO6I/IbqMczt2LJFbDPqmLTQZSftPIyfU6lbMvIx7M
	t+d0/jQ9O0LYoeF+ntSPqE+B/Mvu3V0yc9Cb4e/MlW59jaOwk4cc2MF7pfdiHZOhOGxuilOgmce
	SqdcajhsZg7ZHQpq6uBV9WENYEQmoY3n0LVxdmf1F9H+/CIOXxsoj181w7HhD93KiJ6Uo/ANlPj
	/nYJ0R5ZxKO4p+qeUXoOrfhHuq0TmJWyK4qhA5M/ZR/iDg9jsdd8ejqy2ZT8A1oFY5b5Rcio6MC
	qnVxtOFFIzLS8UZySCK4+3AS6hdknX2Jn//6w0wiXLeJ13+t6xJtuaAV+la5Kau9+sLuAfdMPsY
	cQCs8yn8lPoDUN
X-Received: by 2002:a05:6102:5698:b0:785:a48a:e3b9 with SMTP id ada2fe7eead31-79076abb7a2mr1655341137.4.1788979106954;
        Wed, 09 Sep 2026 11:38:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5698:b0:785:a48a:e3b9 with SMTP id ada2fe7eead31-79076abb7a2mr1655313137.4.1788979106530;
        Wed, 09 Sep 2026 11:38:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370588231sm43978251fa.22.2026.09.09.11.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:38:21 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:38:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] interconnect: qcom: icc-rpm: Don't skip small votes
Message-ID: <eguvscm5rutrezg3n6oncxfbma3qolho6acj3uibiknp732nah@n7fhrx5jyfdd>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX5jVA85J4ADvt
 keuS3WvzU1q/T8GHNGXB/9cM3CeYHqWzYZlvTTxeHgNhp7isMJEvOdddqRYwahtbH2iu7zPXoK3
 QaXsueo/y7qlcew1h55dfa28XqibnYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX9jFY612mUeWt
 68PVxQVmj6IWrvgvFO0BgI7lMu+FBHe8lPITI63W9LDrczSQuBmOR1p0qfxpJ73mieQd4ctWU+r
 NBZHNoKuln2Zv8PubLUYiA6rkFxX5U+2hCpK0r2Eopj0jPdhPlwlEgkFFDHoOhpor1fR9E8495t
 hV+/peJbrJ8KWGq1hgAV8aZ7TPx9+RXJqFKIYdbYV/KQSJGjYUW7CZGYRCnGZZ1rZ9pzDnsBg0n
 RgRzAvfhXdZDVV1k4lHyd9Gl9fkYOA1kkOAIJk93grpuxtrvQtaOUtk9kgMxSldtDA6U0ASsjyM
 27nhyTUzKldngZy0ZL9fw3KDnH12tRr2NYHjzAfT7w4vYV7kq1291Bk3ZjNSsyASR/WeNP6H6p7
 hyNcsI7V8W4qM9dVHRVwjzuQFLOZ5180dt7gYcL7AOIF2n3JWir8fddgmQqmEBIhNCz8fPF97fb
 XkB8nSzZqocJfDAAHFg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa1a7a3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6T9HyGjP-Dkx_CtKVfoA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: ilYhls4l8gIg3oC9yL9tomherIAbYCrW
X-Proofpoint-GUID: ilYhls4l8gIg3oC9yL9tomherIAbYCrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208

On Wed, Sep 09, 2026 at 06:41:55PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Small votes (such as 1 or 100) can end up being rounded down to 0
> midway through the calculations. Use qcom_bw_div() when dividing to
> prevent that.
> 
> Assisted-by: LLM
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

What is the reason for the drivers to cast such small votes? Isn't it a
mistake on the driver side?

-- 
With best wishes
Dmitry
