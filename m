Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF752CCF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984935; cv=none; b=ABwusm/6wseYhX04vKzL9roAv7TIzrSdidbgMdA21ixCruZ1dhPOuips6/uF8Emr9EWNHI0bIFyczZPBrCQRkdqVh7JSuznRLwPqksDzGrGSRU2iBKj7TOW+jJOKm3KP8y5Hbu22y1BimUGxLna0FvnhJh1HpHIMua1tcb7nQh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984935; c=relaxed/simple;
	bh=IlpqbHrz26EweNTVebA5NYWFDrcc+dfp5s1FMniEugU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpTFrzbuv/gh9L60Yy4AjVJCM0gz8X6W5GivMA4pcka4XFMd5eI5PA1hsXsUAM6H4rq9CEgLis5h7myaoBREBejEAh62RrP8oxSjKJfYy21fOpodsKdQg9ohqfKJeV+XSesKvREkl1nCKsztbPCYgHYM9jb+ydzs0d8g1hJEE2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSt/rCap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6jgNpt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSt/rCap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6jgNpt1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ECa63A2088027
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3oJjtNP80ClUlRJQPIJ5xMzy
	E/SdWULvgaeOPu3tEZU=; b=YSt/rCap38oBSiDonvSoUHWYieDW7AA788/GQYdp
	XLSfI7xGEpPtB4boX8OLXzQDk+fVeGUQ7VGylvdw5mgsvd9T/NLoAD3NtZz5ZzP6
	3wnXds0whZCrHtYV0mWJeCYyHLhzb3sCEgiXlkbBhTZoxbvHWKcUQx63iEvUjaZh
	F/V7B4RRVZgCvCVQY9FnsUCjgsEQ19i9Pnp30oJncktV7Z877VVQlLA1zzTtyGVs
	faOK1oX1MzhSSMddM/HEB4wZF8JNZe87v87lecWDb+i1UKYMjSp/BC2bNZmk5Mpa
	und//Lrbq3Z41nSs6BTvUMWOv5BqGngNkO1wphfdKQe7cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49k37d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so62595685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984922; x=1792589722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=C6jgNpt1DWcLNRj4vqBChWiM5uMqjGW3n964BSYPPd/HvSoiIidMFNCVV3yPjInPDU
         CLp1WRvOH2VEv37kDSOfUEHXoTp6zjL8SwU/cWqdkJXRh7fim4KHGD87PjBFuU5Pqf2v
         odQLkQuSof9aJ0vFwtMbC2XVucu0Z3YpYhaO8XiANrIRRk74LKYQpfpaJG/1K+NHWcXC
         PWzw3VljDykEEby+dYb39YVz6nj/G9D3rVsGhOPROLoCxJ348HHtxCJNNKslCy+NdhPf
         fro5zB/UmqOglw2CM0rLSGPSHrAybyGEyZtGF+Oem0p78BDgYEF3LNIbOJ/n+nmddkAU
         ZjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984922; x=1792589722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=LY2Ofima2jTR5q48Qp8+BnkeIyrr5Jepx6SkQXq/vsCCC871ZtmGzaRD5/xguPWwtD
         S3w9MRzt/lBr8OoNFQaPYP0a1RUcwm8NKMhrQeLlfkNZl/9zhTFluz6mBHx3K0TIAe0X
         dXL/LZOWVzwzYhFHLCNFb146AKfD9pi6kpoRV5hSNY/sWf1uTIbLi0WwxqUB1LaXxM47
         mUkOHfuIVSYHlk9KuJJIGDVb8PXu+we1DT1nV1Q9BYrvYpV3kRruM822Mfbx2l1p5kj3
         +zkqpGhsUKlOj5gtZVnDxAImM222mra+4EyjWJ1N9e0afWRTusw6mFObh4yeQsPJ95t8
         3k9A==
X-Forwarded-Encrypted: i=1; AKwUvBzNLwHFu5cnA4zWMPTyU2fmFdNR1u1oK1TEW6FnWlgS/kPHCPuWZsRgl4TPDMnwGndRsLHzgOiBAPy+hbL6@vger.kernel.org
X-Gm-Message-State: AFq9FYLN0a6kBe+PXUfH44t4DN518CKsyrlHGHXX22WD0xzBwHdhIvcf
	cH0+S/0iD/mlLsH8zKvqH4mF5o8ieA0owN/VIPF/9pu2/DX8sGnBOL9SCRqD1jtGPoPMqPmyy4J
	DkjW3XCzsHIOowfEtn3dgW110AihFpWRLpa7QWUhDGvX+Kyd4GCZovq69hugyiw736RD/
X-Gm-Gg: AYBFou1672FsGH4uvpMN8JDrq/wbA+JPYSPk4BTljMIZzTNw4F31/ZTsXMvi8d8E9x/
	HmAHKkVRNXguY6H6rYYbPy7XhY+PJfAdtPw5ySKBD59f8F/LOeAZf2J1UWlRyO7tS6EWXZXyOWT
	g7YwFB3XmLq9tsOPbSgc2Chi88RM/yPPxsXwXa2s/RXVZz7CM6vUHtETxz7GOtB+2ClSARiDTfT
	TbSx9dsRlfGzQjmenDSx4R/6jAKKZmyfiFQS1JRN6IaigoZs7OdS6sKLDNp3la9amFcxTKdBYtS
	hTsu5+5PPW38gUg3mv1BHZAqRp/YnIjHVAJnf/Uwm3a++LXUp9K0YXjl31B9l8X/9Cy76d9r8Ax
	yrkvl9Pd1yvJLgsAaLLwTNmdEyMdw0oamrkKUXrLXekYYba3M1p94d4/Nna34CTV3iRoo2nIBvs
	S8tQzMcMBZI3iM
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236550585a.67.1791984922408;
        Wed, 14 Oct 2026 06:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236544685a.67.1791984921806;
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm662845e87.49.2026.10.14.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:35:20 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf851b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3h-aFR46GQ2hTHGVm7IA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfXxuKpTjxpOo6q
 mkYzDEdaLLbwj32nmsCq2b9pH7NduyAlxp8fcU7q64tyGKlzt0YIKelqz1NpQC8lVX4aJZi9RHM
 0z4U6c/HzlDMDZffzdg7y2aKYxe2uduHhvaI0GEpRX3TpMBQGqOKt/GMha2WNxi3G/L+KAWvxyZ
 DIzD02nKPXB14LPXC475RKlsc8vBVzzshYqGFt60lkb0RgocuEYr6WIrWsmJKLtbS7+FlIGLK3A
 9GRdssPC9U6hSgUAFe5jvxHG2PHVoA0yKqs6pdSIJX5ZT6865XVgkosOuYGtCjxJ90S+USjFcJS
 q6k+eiltvaH+RUyEO5ic+P5dQvf9bZNqSyBLGyVkIRs/u3YYXzrLAF+xGsTaTzoXQ0fXhtYbpMu
 swSEBJdG14/Yc9PRNEddtcbtbl95fLRkk3MHuu+FK6uTvTmn/S2lU07KMHyLUPTImVkRer69OQb
 wOfe2iWOS70ylLtkBgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX9BRLIoIDvKap
 yeoTHBXM0NeTMGO/743Hlie5NQpDN6XWaYtI7VwbDPPIW6iRVSR/fepnue/FkRR5qhiunU3IC5Y
 m1lgw0frxl4kzu7+5Rh9jKXi2guouRE=
X-Proofpoint-GUID: 4W5ndAPPAYATXIfr3goXg5DVPabzQe-x
X-Proofpoint-ORIG-GUID: 4W5ndAPPAYATXIfr3goXg5DVPabzQe-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140054

On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A failed OPP transition need not leave the clock at the last successful
> OPP's frequency. If hardware changed before the error, the default
> single-clock path can subsequently skip a necessary retry because its

What is a necessary retry? Shouldn't it be: try, rollback if it fails?

> cached OPP matches the request. It can also choose voltage and dependency
> ordering relative to the wrong operating point.
> 
> Treat an incomplete transition as dirty and use the observed clock rate
> to establish retry direction. Do not trust same-OPP or same-rate
> shortcuts, or allow table disable, until the state has been reconciled.
> 
> Limit this to the default single-clock path: custom callbacks can have
> additional state which cannot be recovered from a clock-rate readback.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/opp/core.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  drivers/opp/opp.h  |  2 ++
>  2 files changed, 65 insertions(+), 9 deletions(-)
> 

-- 
With best wishes
Dmitry
