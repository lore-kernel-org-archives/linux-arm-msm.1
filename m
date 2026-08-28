Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F03B42D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910096; cv=none; b=D8kvcu1MXEeCAWSty6y8+HLUXvBgfHsz6dUblNEUCrvrgP6BhcPmxlgbzuCCrCx9WO0XPIeOglS75ANFzQEhSehNDEnv5onJoXx9F15vMNXbVFBMJA6m/J2yWqvpVXGkfaOI4LLn7S2U1kaNbqpInJ1D0vl1oPW9T9LEBvHUv5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910096; c=relaxed/simple;
	bh=yj6gi50La8FLoRtxSYbRfrVOHomJ9GNONjGvGVywHYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgmAjV2OQrox2jEd7gUnD8u4GESTGP5AOuQze8krNLoQ8YDrPk9V3Ki5hJiPUig5lAPZwQF7aMU/Dq7v2o20ACMeeUiifoVNXw26BBk8x7ig7sE3sYL9xoc3O2fbTFg9nM9AD1V7eVkzc4aOp5TkxHN35N0xYxopf1KyCwXNX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl9E6vkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9Qf//vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl9E6vkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9Qf//vk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S7YZ0n2446846
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EtMpzl3b+CTzx4h+tcUh4CCK
	Y/mVuzcYpGeBAu4Fum8=; b=Wl9E6vknji6d47rxNS0bYe60/NkvUOpNoAODj3+Q
	PqQ/fP7FcBUfl26Ryc+0OpYKtr2DH8YTTFpMMOjVNxk1roEckbv+DyJCdIxe9mr9
	+CCtU291q6ppMUPw5EG9JbMqTv8wB1aUkPSeG8zI7AGrWF9Y0/xqAhs0j42cmRhR
	v9tJudFTIeLYnGfNI4MFOAqUqovT2JO+qlv19S0/q4pXjTWdE7gcKnKdO+Z+QVGM
	csgL6ofG8IMSsXwkv7g5pvyLWFEhEo++OfEmEDUtiHBQj++Qk+k6AmFm46NRKUS1
	HdKhM4ebtt/Zr2DYw+MmmelZV/BxB9BL9J0JZvHtsopyMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h0gfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:41:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fc3bff8bdso2552811cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910093; x=1788514893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EtMpzl3b+CTzx4h+tcUh4CCKY/mVuzcYpGeBAu4Fum8=;
        b=D9Qf//vkR6IFg04/CWphCGBW09L2zZoZUNiDyb1PVXM7TxMWIWx7XAKvHrRXjTp/Cf
         fBeFoVywnOaoK02u+b8kmVRyDEmfzvLIJc6Pz/qlhALzq4CJBuDKRFupxe4l0pqdNV6S
         RvnnNGb4ICBWwN8A1JMdQ5f0yPaM3rZPLo5XuM+WZ5ibhO/T3GkcRNGRInQbZ2+aY9jP
         13pjrD/vgwNhxAO43QpKrf76pX6jc4sEnZ/MnVbAVXJ8I4pMGtOynt1ecJNrhEfd3eBi
         /g8MOk4YTNwKGuLLGCdEDJ5VFipVsiGZKh91X2M2azFkaLsEn5ZHciIPfEKedRavdI8+
         ctDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910093; x=1788514893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtMpzl3b+CTzx4h+tcUh4CCKY/mVuzcYpGeBAu4Fum8=;
        b=q6H6WfFci7Aok0NcepxAj0kz5l2fQNvd11OzZtAK4YNXpg5Kmv8Ak0XmsDjTMJiyVj
         eSt75rXTV+Qz9CsX1gYntAm6YtkHMwRrvF6zdzhHpjWVZY6bfYId1gPYLuOrJT/oS4UL
         KB4xNi2VVCv8tsyn07predfgHtGpbX6YHak9UPSJhshQKbPVC/iTyY9mCH8LUfBWy+mz
         k4g+sxc2h8Hp+6L85lcPlxOwNkAXFtD8nh6C/pk2JD+bH0JIU6hAdb5Kmgjz4iTIUTva
         VInImgUmRY4cClRo1GUtu8l3/GtmTs2wksj+nEyyGpxdeMy+3ZKxk+/FmjCqpry09PmX
         JS1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpmX2MWi8+DFTeBjYFLvieBYuUN0J4p0j5+MsabMfSDIGYJtsDbvPhVvtUE3fj6+YTQi6QLeSORQPKpUi2x@vger.kernel.org
X-Gm-Message-State: AFuF++mTYnTK5aUejb+6O48ln8M+767yzpFj095rcE1pL3k+Itb5Dkhw
	3IgNigGlC0Gt56hU7VXALOGn7XgCbXmG9yUJRoRC/I1sUEA49AAB5e2QxgnTh13SLMCNdWcav3x
	22JKc89b7ZVer2ORSmywx00Z/GExAfPBYb4uOYeNLT5HMGSbEiMBB+I3Dx7EyjyODRGBOWuibY9
	wc
X-Gm-Gg: AR+sD10wn9OsuD/8DsHZceI186oOhwN33ev//lynt6xm2Ga2xkatQ/+qqS9PogBqY6v
	oehHeZyeir3Poj5ER+4qArgLOjh6xf21FrRJBETlNDkQLWnW8M7HuuFZd6mfkq/ke8HsTH+xbEz
	eMpNkA5btN+TBBiG+dgZPvWoWeOD2kFysjDWJhcXMGOXkxaZATrAphA1VxqeyXFiOMDj/YMrbWP
	2sf9Uj9E8YybSEB43cRpitz4hzWqYJogOnZmaKKjjudHByCPlE/BH1Eg01EKpaBfEzzpgKhudNj
	be5KAf1NMLT1mVjXdXfwBxA0URAE/oO5AVnKXGTMmKWRy5S37lE97jFygsxOfOf1r/aIrLV47Xf
	j3bKDBQsH1+q71Q==
X-Received: by 2002:a05:622a:38b:b0:52f:9134:832e with SMTP id d75a77b69052e-52fb96a2896mr50763841cf.39.1787910092639;
        Fri, 28 Aug 2026 02:41:32 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:52f:9134:832e with SMTP id d75a77b69052e-52fb96a2896mr50763471cf.39.1787910091831;
        Fri, 28 Aug 2026 02:41:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb284cbsm2835417f8f.30.2026.08.28.02.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:41:30 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:41:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
Message-ID: <jq253omgxgpplvhxupyo3zl6fgg3vero2ykogduwpvmd7uh5sq@3h5cyoqnsayy>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
 <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
 <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
 <6xbm6uq266y42ga54wkdn6364gjj44v4mmsjg53rhfi4e7rzmq@i2uwudm7pxcf>
 <a144bd80-f49a-42bc-90ef-a114467e4b39@linaro.org>
 <tpoqvfsrny7xqykjevjiyyuctwceenfjry6pf6zbwf2yg5hi7j@5rq554qe7ghj>
 <b74c2990-ad2a-4ec3-b7e3-e78797c3d4e0@linaro.org>
 <zvs72iseaipj5ouljgrivq2y2cv245kt37gjavbh26he4576iu@d67g25es7ojs>
 <abdfd5c1-1965-492b-bd02-13452278704e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdfd5c1-1965-492b-bd02-13452278704e@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfXzdrZdOFbK/pI
 EIs1tBjEMnk1GBLSZDX0PxXBGSF2XpP7/Tgh05ejbAD+hK37YQzOTNVw9vEMKneHXWg81GA2Bvu
 UAKYPGEERMLZg/ZOOC4nm50iIhUdbR4=
X-Proofpoint-GUID: qgwYNrLgSgUck-FHGIN70fZRSMzm86Yr
X-Proofpoint-ORIG-GUID: qgwYNrLgSgUck-FHGIN70fZRSMzm86Yr
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9157cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=69W8V337GvdsK5Qz-zkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfXy+83ThO7SkL5
 dwXkDr3jvNej+7PPKCn1jWrQdizeJ+iAslsxnEVFaXb8TX5QYIkHIZX/P+LH6Mk3RFqn0AdGvp5
 TG1OpNTh48QUFsM7hlcU3kG8zqqMrleV4RyXPswRTCe4K2IOMuVEtwOfnEBhuZHuzPfNtBgaJN2
 GNay1g7Q0DZmlH+93yV7PJhytm2SglDaciVJx9/QmBnsQswS3TNeNkgwJ5VP0S2yDC3ZCc/elQp
 DtwTwV2DnitDFSPYFmtzWI/LAMNrkceN/vPbG5U2x4vPgzcQ+0oB9Tvi8fbdnSw+nZn6UezJxlx
 bMnuCagoYTZ8xTEbHLY+ubMmQRLYhkJE+OiqfZg7nhRHPo+dOqxt8xu6ASgT03CR2OgbrttbRmT
 4pMy0jc44dA724ckYbJm3w/sDlTWFYyXXTtTHVI+0YpiotmSR7xrQPZ2TfQEZqS+edY/2VKE8RU
 H09EnaKzo8dckhWIDUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280082

On 26-08-27 17:58:30, Vladimir Zapolskiy wrote:
> On 8/27/26 14:36, Abel Vesa wrote:
> > On 26-08-27 01:41:31, Vladimir Zapolskiy wrote:
> > > On 8/26/26 16:05, Abel Vesa wrote:
> > > > On 26-08-26 15:33:02, Vladimir Zapolskiy wrote:
> > > > > On 8/26/26 15:10, Abel Vesa wrote:
> > > > > > On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
> > > > > > > On 8/26/26 14:31, Abel Vesa wrote:
> > > > > > > > On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
> > > > > > > > > A clock controller driver is expected to be embedded into runtime
> > > > > > > > > PM framework iff there are specified power domains to supply the clock
> > > > > > > > > controller. If there is no power domain, then it's a noop to add
> > > > > > > > > the driver into the runtime PM framework, and if there is a power domain,
> > > > > > > > > the dependency can be considered using this fact rather than relying on
> > > > > > > > > a probably stale data from a particular clock controller device driver.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > I don't think this is right.
> > > > > > > > 
> > > > > > > 
> > > > > > > Please elaborate what is wrong in the statement above.
> > > > > > 
> > > > > > Enabling runtime PM just because there is a power domain attached to it
> > > > > > is prone for breaking consumers. If for whatever reason the power
> > > > > > domains parent child relationship isn't right, the child PD vote might
> > > > > 
> > > > > If so, it's a bug on the consumer's side, likely this is unrelated to
> > > > > this particular change, and it should be fixed independently from this
> > > > > changeset.
> > > > 
> > > > Providers establish the parent child relationships for power domains.
> > > > Consumers don't need to be aware of a specific PD being the child of
> > > > another.
> > > > 
> > > > > 
> > > > > To be precise, I don't see any interference between this series and
> > > > > any side fixes, the changes can coexist IMO.
> > > > 
> > > > This change basically says "look, there is a PD attached, lets enable
> > > > runtime PM".
> > > 
> > > Exactly, this is the expected situation to enable runtime PM if there
> > > is an attached PD, this is normal, and it means the change is correct.
> > 
> > Wrong. There are tons of devices that cannot do runtime PM, yet they need a PD
> > attached to be able to function.
> > 
> > This is why genpd doesn't try to enable runtime PM by default, just
> > because there is a PD attached.
> > 
> > > 
> > > > But if genpd is missing information about the hierarchy,
> > > 
> > > Sounds like a bug.
> > 
> > Yes. But most of the platforms still don't have an issue unless runtime PM
> > gets enabled. And you are basically enabling runtime PM on all clock
> > controllers with a PD attached, unaware of the consequencies.
> > 
> > This has been my point from the start.
> 
> My intention is to keep the change small and identical for all clock
> controllers. But if some clock controller driver is known to be broken
> I'd like to know it looking at its driver, however right now there
> is no distinction between two cases of ".use_rpm = false":
> 1) there is no PD, and therefore runtime PM is not needed,
> 2) there is PD, but the driver is broken in a way, that runtime PM can
> not be enabled.
> 
> The problem of distinction of these two cases is resolved by inverting
> the "use_rpm" flag, and, of course, manually mark all broken drivers
> thereafter.


You are not improving anything if you invert the flag. You just make it
worse. Most of the clock controllers do not handle runtime PM properly
for now, so inverting means you will add the flag to most of the clock
controllers, without a benefit whatsoever.

Not having runtime PM doesn't mean they are broken. It only means the
feature wasn't enabled yet. Your assumption of "all providers should
have runtime PM enabled by default" is wrong.

> 
> > > 
> > > > enabling runtime PM could potentially leave the child PD unpowered due
> > > > to parent being powered off.
> > > 
> > > Sure, but it is not runtime PM enablement to blame, it's another problem
> > > to be fixed in the driver.
> > 
> > So basically, you break all platforms and then we need to fix the PD
> > hierarchy on all? I'd suggest we go the other way around:
> > First we fix PD hierarchy, then we can get rid of this flag, if needed.
> 
> I'll revert the flag, so that it becomes a proper quirk flag for broken
> drivers instead of serving as a questionable "quality control passed"
> function.

It is not a quirk. Nothing is broken w.r.t. RPM. The feature
isn't enabled yet on most of the providers.

> 
> > > 
> > > > > > not trickle down to the parent PD. So if runtime PM suspend happens, it will
> > > > > > drop the vote on its PD just because the genpd tree is missing stuff.
> > > 
> > > This is expected and it's a totally valid behaviour.
> > 
> > So consumers crashing when some clock controllers do runtime PM is
> > expected and valid behaviour? Again, we need to make sure enabling
> 
> It's an absolutely expected and wanted behaviour for the PM framework to
> turn off the power, if there is no consumers. It's someone's else mistake,
> if the hierarchy is not described properly.

Wether or not the PD hierarchy is someone else's mistake is irrelevant
as long as this change of yours is breaking existing behavior.

There is no value of this getting in if it breaks existing behavior.

> 
> > runtime PM for a provider does not leave consumers hanging due to
> > missing parent-child relationship in the genpd tree.
> > 
> > > 
> > > > > > And you're enabling runtime PM for all controllers that have a PD attached,
> > > > > > even for those that do not have the use_rpm set to true currently (e.g.
> > > > > > Eliza).
> > > > > 
> > > > > What is the point of specifying 'power-domains' property for Eliza GCC,
> > > > 
> > > > Having a 'power-domains' property in DT node, doesn't mean the device
> > > > has to do runtime PM implicitly. The reason a PD gets attached to a
> > > > DT node is to make sure that PD gets enabled and stays enabled for the
> > > > device to be operational. Runtime PM is just a great way of reducing
> > > > power consumption when the device is idle.
> > > 
> > > A proper runtime PM enablement in a driver ensures this "PD gets enabled
> > > and stays enabled for the device to be operational" target, no contradiction.
> > 
> > But it is not proper runtime PM yet. Not until we make sure genpd tree
> > is accurate. Enabling runtime PM in bulk isn't a good idea.
> 
> Okay, I'll invert the flag and mark all incomplete in sense of runtime PM
> support drivers by the new value.

Please don't. See above explanation about why RPM is a feature, not
something expected to work by default.

> 
> > > 
> > > > So GCC needs the CX PD attached otherwise RPMh could drop the vote and
> > > > result either in undervolt or actually failed reg access.
> > > 
> > > Is it going to be fixed one day, so the drivers earn "use_rpm", or not?
> > 
> > Yes. I'm already working my way up through clock controllers, accross all
> > platforms, attaching PDs where missing and enabling runtime PM one
> > provider at the time. Even with this approach we might break stuff on
> > some platforms, but at least we can revert that single commit, if
> > necessary, instead of one that applies to all.
> > 
> > > 
> > > So far I get an impression that all these reasonings above are unrelated
> > > to this change, it sounds like there is no problem in the runtime PM
> > > framework, and something else is broken
> > 
> > You insist on breaking all platforms with this patch just because of
> > it's a nice rework. I'm trying to prevent breaking all plaforms.
> 
> No worries, I'll take care that there will be no regressions.

Will you be able to test on all platforms, all scenarios?

> 
> > Again, first we fix genpd tree and enable runtime PM one provider at the
> > time. Then we can rework this and drop the use_rpm entirely. That way is
> > less hassle to debug and easier to pinpoint a commit that enabled
> > runtime PM via the use_rpm flag for a single provider, rather than having
> > to revert this patch that does this in a bulk.
> > 
> > > 
> > > > > if it is anyway explicitly ignored by the driver? It sounds like anattempt
> > > > > to cloak a bug, and if it is necessary before the bugs are got fixed, then
> > > > > the 'use_rpm' flag shall be inverted to 'do_not_use_rpm' flag for broken
> > > > > platforms.
> > > > 
> > > > Well, when you add support for a new platform, usually you don't enable
> > > > runtime PM by default for these controllers,
> > > 
> > > Why not?
> > 
> > Because runtime PM is usually an extra effort, on top of the existing
> > functionality of a driver. Specially for a resource provider. Done
> > wrong, you break all consumers.
> > 
> > > 
> > > So, today there is a flag to mark a properly supported platform like it
> > > is a wonder.
> > 
> > No, it is a generic way of enabling runtime PM.
> > 
> > If this generic way would've not existed, you would've not added runtime
> > PM APIs calls for all providers in a bulk way, right?
> > 
> > > 
> > > As I said above, a properly supported platform/driver shall be the norm,
> > > and an ill platform should be marked as broken, and the quirk, if needed,
> > > should be inverted to the yelling 'do_not_use_rpm, I'm broken in upstream'.
> > 
> > It's like saying genpd framework should enable runtime PM by default for every
> > device, and provide a flag like 'do_not_use_rpm'. That would be bad all around.
> > 
> > Again, in general, just because there is a PD attached, doens't mean
> > that that device has to do runtime PM. That's why genpd framework doesn't make
> > such assumptions either, but rather gives you an API to add it yourself,
> > if the device can actually do runtime PM.
> > 
> > > 
> > > > until you made sure that it actually works. So use_rpm is basically
> > > > saying: "we're good with runtime PM now". So I'd not revert the flag either.
> > > 
> > > I belive it's wrong to mark "good" drivers/platforms as "good" ones
> > > explicitly, the purpose of quirks is totally opposite.
> > 
> > You are thinking of this the other way around. Again, if the Qualcomm
> > common clock implementation would've not existed, the we would have
> > added runtime PM API calls all over each provider, one at the time.
> > 
> > The benefit of the Qualcomm common clock implementation is that it
> > basically takes care of calling RPM for us.
> > 
> > > 
> > > If a complete removal of the flag is not possible due to "broken" drivers,
> > > then I'll invert the flag in v2, and then remove it for the clock drivers,
> > > which does not require explicit PDs to be enabled at all.
> > 
> > Why?
> > 
> > Again, RPM is not a given in any scenario. Proper RPM is done per
> > driver, after the driver brings the device into a functional state,
> > therefore an extra step, sometimes even impossible for some devices.
> > 
> > Inverting it will just force us to add the flag from the start for each new
> > provider until we figure out properly the PD tree for that platform.
> > 
> > The value of this patch is outweighed by the current functionality of
> > all platforms. Taking this in will most likely break that.
> > 
> > Due to this facts, I think this should not be merged. But it's up to Bjorn.
> 
> v1 should not be merged.
> 
> I'll send v2 though, since there is a problem I need to resolve, namely,
> as I've said above, there is a need to separate the clock drivers without
> PDs, which are excluded from runtime PM due to this reason, and the clock
> drivers with PDs, which are excluded from runtime PM due to their incomplete
> support.

A provider that doesn't do RPM yet isn't considered broken. RPM is a
feature, not a basic functionality requirement for a driver.

And again, most of the Qualcomm clock providers do not handle RPM
properly yet. So your inverted flag will apply to the majority of
providers, and without a good reason.
