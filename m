Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040018A6D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749540; cv=none; b=IYVZZOp+EzGfGe/3K5FlWyV2cgRj5eGicSWgdaiiaJ+kyV9Lx8rJ/oEMPPwbhy9s+7glUHClqBdKZWXmSQcT6odoBehFf5Rip4ZW4VXMHY49IUBLdL0Ry+GPtZiG8f8wdAd0c5FlO/DsaYdn/zZlQADaY+emOA8wrrsxG7w1GtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749540; c=relaxed/simple;
	bh=j7Jv1DuZlURCls3bJrENIAr9LicVNE0zvWqzX0z2+h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkR1aexpR9XUq5m69s6+KtLTPNLnjMJmt+c1Zjr2TMWyNX74HaLJvi4jkGi6F/e8B1ujHh98eTpaJ6o1joMWCaH4omd71YN1uoTwbkThsQvaiSRpYgiW3biOhX+3jSqHiqBPPq4tufpe3ZQAY35gPKa4SkX9yXNrYdH1fZnc+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyjYy34s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFPybgBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyjYy34s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFPybgBy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCGDj882045
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AcA7aGSO2hI6gJhYafjaYQ2P
	ZN3lEvu5LhikLXEwa9c=; b=EyjYy34sJLnWcpbUQnsELFezY4ehuPCEkpSS1XCN
	g5rD6KP5PiOcfAveNHs0XrfFPEPVybo7c/wdKVO8aH8gd94RiWhaAymPdGGo0+Ai
	ZdlPhWOFYjkkRZReWCuS6QK8vMp3ArAJchTWjr7AwmQVk7mszt0tLWV3DInTxnY6
	k6OxLIz5LK72fn7wWHRsVletfArx6YBnHKI3ZnrWs50rePKz/bqLD/QYEWeUD0Tv
	efboO6mHJRrIt/yiSDxl74dD6Wdae9AwYtc3EoV0CzzlKLgGCIRqlNi5k/GsUQdF
	SfLn8HwMpJ1AGagMG35TbYubMLrXZOnbJvLCLyAw8tVDOg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k283n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:05:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso178971137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749538; x=1788354338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AcA7aGSO2hI6gJhYafjaYQ2PZN3lEvu5LhikLXEwa9c=;
        b=EFPybgByOy/qEsEbm0pUU2oIz+N8w0GrzRfIIrM0QMXTANUn7xBFsupEQk1v8GLjTX
         VOyq+WEoLDYRLZRqvmINXGCiYj9fR5V6SJRonVSiYtHCfZDAD/HVXVQh6V9l6CxsVWZn
         uUcViK3b1zE9GxSOkF9WQpJRINnftMGHQ539l2vkyy1+DXeTdVf7mqH+5wqdLxKBJVIn
         j8ThzgClqAbCpNyHbAFZk5Iy4SqPH/nwtePkNkOXxwIJ40/9/qkb41r8X2/Ie3Z/IlCl
         /3iAWzfLh+2rpS62OVyLiwMKyENBeJlfKihl8qE0/fr8kUGSL9ZagGjb4XqhPvJhwMZr
         /iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749538; x=1788354338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcA7aGSO2hI6gJhYafjaYQ2PZN3lEvu5LhikLXEwa9c=;
        b=P4qOguKTtemqpNSSuB35cWGjwpUFR79oZDuG9RTUeiaBywVlHYq41Qw0doQvX8iyS0
         MVmRtO9xsO2JqtpvIj01VYfUydXjEMp7o/7/2gzQwMI6Ij50LdTeuesBFbur1+0PydzN
         O2rCwLznHK/W0VFHq0mYseptE6c5xoL8R9WwciRX+xQQK62419+Xk4XgYkvmh+PIEwm3
         N0GQU56zclw5p6J99zQSiZEkzvxTPi/jp+i61xkZp/uvMdtbsU33NZsxYLGuRDxOKO/w
         rabfhkImcto7cvYPJN4YjlFTMfTU/JL3U6xR0kkavcITpV+ACq+o4VopDhbLO39RRBid
         mxxA==
X-Forwarded-Encrypted: i=1; AHgh+RqEVzYNUGg3w+sCKeAR3gHvNivz/7A1vpUR8qMmxT0l2KFIPQPhk1RdZ5vGPmySSxiUQdufJ6+qrAUGgZ1X@vger.kernel.org
X-Gm-Message-State: AFuF++k2YbQ8uQsCvmTh8WAioNJkMLN0FASZ303TV/vodRpGnhBwVTM/
	bZGx+KMrd8f400AaOa/OEIINVZ4+o8ojrR1MRDJ/DRWH1pRtd4DHB4bIz3UYhFX+u8OhrVPtmvP
	OwQnZTD9qPNmEP74PwMUyC1hxWBjYR/8mZUqCThezqJhMWVDr6vjSZm9+pI1VNhhvePGe
X-Gm-Gg: AR+sD12upkdT1p8sujhUHsPsEyp1Nl9uFM+nSbHcjrYvJudXnXTZQCAZvGzT3P9/rNi
	7k0XenuK6Mczap8uGIPDidcBJA+p2d0p+ZA/YD6xBsq4ATr3M45E258YR2DIL1FZGf9lgzgMmPj
	jFKqqP90vHeyDoWZVRk1a+gRAayfiRM3a36GYNuqJapBiVAq1nkgU6wV1SEz/sefMa8NEZFFFlp
	Bscb4GVXsIlrFlu7Pqr6nTYQJw4IEQ9NulvS0TGZe1ln4Bj2JLoToWEZiFHLO1A/3t5gbcj2Shn
	fCPrrRWdtyv6NvgQocLAaYyEJOJI45RXKpMlsVClBP6GrtOd4tBlFvAfcEmdjNs+PXQMIbGQ+TX
	PafJFsaCpZT3tAg==
X-Received: by 2002:a05:6102:5f0a:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-782bfabe54bmr1777214137.2.1787749537050;
        Wed, 26 Aug 2026 06:05:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5f0a:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-782bfabe54bmr1777183137.2.1787749536447;
        Wed, 26 Aug 2026 06:05:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88b169sm495279166b.32.2026.08.26.06.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:05:35 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
Message-ID: <tpoqvfsrny7xqykjevjiyyuctwceenfjry6pf6zbwf2yg5hi7j@5rq554qe7ghj>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
 <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
 <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
 <6xbm6uq266y42ga54wkdn6364gjj44v4mmsjg53rhfi4e7rzmq@i2uwudm7pxcf>
 <a144bd80-f49a-42bc-90ef-a114467e4b39@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a144bd80-f49a-42bc-90ef-a114467e4b39@linaro.org>
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ee4a2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=a5D9ImdwOiQV-jUow7cA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXxrtXPaPDBTS3
 vlK9638OwKqlWWGFM9opJK3hHNh87Bfop8PjrpWj/kVBIq3/iv6x480dGRzj1kyr/nsXT+nyyST
 C9qJBwMMjYOlb7TLCPfOetqX73nkb/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXz58YXjhYM8Ok
 fLX/mpyzXdQsZLUKSoq8LjsnD0ng9SDUye0PtEQiCd8Bbpe/hcnVEesrkgAeA+teeIA4CscHZy0
 XtKYeMy6I7B/hlGkIw1J10owJVT1NWhghECY6UNIerCaDPV36ATICUfLwkKWEJGS0c7iFAxtx3T
 QEggRc3V9iDaVepfQdfJQXyGPfxg2HjKHqhZoFbbAfN+XvxXLRcidfVtZqrfIgVQ0S6ndPrGpTT
 9I5GeTb2ran5yQQym3Ry9OkwxeJfrJQyGYpSRj6GA1qNX5vXevI9UmqVbEfEuweK31ZzoK8Q0TD
 sIYWjxSNaAQLOYdbSrKJmlrlsq84y5E0UT2PNGEKHv0hvuldg587Wm4cowyCN86yj6G/RlMj/ll
 WmpZCfkFL2QxhSX9TuN9EkvOBFkN6P+Z1rJRZtcEBMobdL9E/CosscGLrRRI5j8WhEHbDTr5v0l
 gsGW3OkWtEnn2TPHgIQ==
X-Proofpoint-ORIG-GUID: B5dA6rLN9itkhLHs7mPKRov0-viyTWHz
X-Proofpoint-GUID: B5dA6rLN9itkhLHs7mPKRov0-viyTWHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108

On 26-08-26 15:33:02, Vladimir Zapolskiy wrote:
> On 8/26/26 15:10, Abel Vesa wrote:
> > On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
> > > On 8/26/26 14:31, Abel Vesa wrote:
> > > > On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
> > > > > A clock controller driver is expected to be embedded into runtime
> > > > > PM framework iff there are specified power domains to supply the clock
> > > > > controller. If there is no power domain, then it's a noop to add
> > > > > the driver into the runtime PM framework, and if there is a power domain,
> > > > > the dependency can be considered using this fact rather than relying on
> > > > > a probably stale data from a particular clock controller device driver.
> > > > > 
> > > > 
> > > > I don't think this is right.
> > > > 
> > > 
> > > Please elaborate what is wrong in the statement above.
> > 
> > Enabling runtime PM just because there is a power domain attached to it
> > is prone for breaking consumers. If for whatever reason the power
> > domains parent child relationship isn't right, the child PD vote might
> 
> If so, it's a bug on the consumer's side, likely this is unrelated to
> this particular change, and it should be fixed independently from this
> changeset.

Providers establish the parent child relationships for power domains.
Consumers don't need to be aware of a specific PD being the child of
another.

> 
> To be precise, I don't see any interference between this series and
> any side fixes, the changes can coexist IMO.

This change basically says "look, there is a PD attached, lets enable
runtime PM". But if genpd is missing information about the hierarchy,
enabling runtime PM could potentially leave the child PD unpowered due
to parent being powered off.

> 
> > not trickle down to the parent PD. So if runtime PM suspend happens, it will
> > drop the vote on its PD just because the genpd tree is missing stuff.
> > 
> > And you're enabling runtime PM for all controllers that have a PD attached,
> > even for those that do not have the use_rpm set to true currently (e.g.
> > Eliza).
> 
> What is the point of specifying 'power-domains' property for Eliza GCC,

Having a 'power-domains' property in DT node, doesn't mean the device
has to do runtime PM implicitly. The reason a PD gets attached to a
DT node is to make sure that PD gets enabled and stays enabled for the
device to be operational. Runtime PM is just a great way of reducing
power consumption when the device is idle.

So GCC needs the CX PD attached otherwise RPMh could drop the vote and
result either in undervolt or actually failed reg access.

> if it is anyway explicitly ignored by the driver? It sounds like anattempt
> to cloak a bug, and if it is necessary before the bugs are got fixed, then
> the 'use_rpm' flag shall be inverted to 'do_not_use_rpm' flag for broken
> platforms.

Well, when you add support for a new platform, usually you don't enable
runtime PM by default for these controllers, until you made sure that it
actually works. So use_rpm is basically saying: "we're good with runtime
PM now". So I'd not revert the flag either.
