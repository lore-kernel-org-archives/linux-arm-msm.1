Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2141DDEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830580; cv=none; b=JP1KLGdMxqa/kqwyan22+9AYyMMAA7PqurhLaWc8oZZoiQt3VWDx86dDDLE+tpnJcQPUKN+8+xRJKkd9beoYuO/QD/0ZbfK2ouXtTd/4VVKjd7wqRL6sCMnmi/265gEFcRG9RS1eRAoW3SVL+EdqDdpJH73sUE2fRL1887i7tug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830580; c=relaxed/simple;
	bh=ItmftQzY9V2K6Vzxdj5P7tUyKeTXOke51vP1UHWVJjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mzf5iTGydmS+92U4qFjd5DcOLl5joDWyrVW/w1G/avRrAyFLgeJkSQ2A1efWyQAXfQS+6JhuSl/7vKPOUGryqLVuLygi4WB+uuMGLNIRsQ86mbO1JbsvKszESFXbOuETTPO+x0QbLmA9pcOsC5sJOvG827JGr/dA+M1HRUw0w9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP516jcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jG/2aDY4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP516jcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jG/2aDY4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9H78U027707
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xEyLf5GnYTFrBzKMSzDyyYRM
	ykV+2OTNRMAXjDG7gpg=; b=hP516jcDUyywB9SOD6NtifVuFyUhJ0BDlnL4CI2P
	Btle1PF70X1By+R5KrwwNWQq+/nZvrIbJpGUq1hDGCRELwlT/Q2E7FSXoc/J+ziG
	essTXDLpX/uCgRxUtDlSccnjH2tkCPZ3UnDR1hohc1aHGCwCXnERQSqqGTT99Itv
	upfpi0nMCPftpY+l/5JmOJJfP4XRlrnmSAk5cPAeqs5G2ZURr4u3D39JT2jz6Ocl
	YRkYMGawBCl8Ga1O9Lmc46bCvVF0koaKSx2fNSd9hN8gRFdSDCB1jYaOB0RsJohN
	ua9E4YseTppglLTmYzy+6VoBCojvdJqAlvIiKw3PyiZDRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbveu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:36:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9377829a759so164784785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830574; x=1788435374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xEyLf5GnYTFrBzKMSzDyyYRMykV+2OTNRMAXjDG7gpg=;
        b=jG/2aDY4igkOwxldAImRz6tYT9/ARNr0RC6BrKNwv+7qcdZOWzcNe3J4Mi7RKEFjGR
         R/ozQ2c84cyJVKuKVLNWXLKn4hABupVtBm6gZ7EttNzpMOkLDY3nx7VphMmEqAOdPchb
         ZhyMdwwO7B7HEOrhtsjAS43Qat4tVgHqWwbme2wdyV9QCASKVVP1johUmxDfynmvCmHK
         HfdIdO0ObWqdsCZV8+GZMFk1BFBt+c+65adhWeT2eykALogvcM5NUkArVkXXI26vMu7m
         zesRuelaw2Xqq2zfE2wvvoUYIwuRr6C/5/PDP0YaNv5xpwESZ3WRoFZZBuw2qT155Po7
         Z/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830574; x=1788435374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEyLf5GnYTFrBzKMSzDyyYRMykV+2OTNRMAXjDG7gpg=;
        b=J7nxZp5RKu90WVckJp+r9gpccZpK1L7QhrwktwVQOM1HQaXeysVkZcavj1qjViHayB
         7xtKyFnJL3gIP4RHaOdQXkYS66Hn4EgM0CaOGi4WBY6abkzQDpjLQ5evRCSMaXUJfz9y
         /XtyzkdYKVee+Tfdr+twAKe9fO8o88SJVa96oOzfWaKdshRuc32Spc9R/Pa98vUKrEjd
         sCIVhsLsmM28+wWlXmKPzDaP01wtIvTKr+syi6TTJvhSz/PbjBbWCcr2HHGAHcx20Spf
         EBeJWyDPdd3VY8DVyY3K++dIRFrgjAVi5wLjQqT2Oo7tTXkQWdOG5ApMteI5c2oYD6OQ
         w0uQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro953ahzfAAs49n2QWJ9vHtHrVAtHSHocDeNhugXCheUw2jC+XQTMFP4burXWrmLvrDQ9FgxlcqyA1I42N/@vger.kernel.org
X-Gm-Message-State: AFuF++mgJT/NQC03RH495x7+ZxR7fB1aJHTvWQtdVJSl9c4KjDGZ8R62
	1ZFnvvJKYKD2WMuGWH+SCDYFKz3RST87O7ivmqfyDXPya3XMo/H9BpYl/BU5L3eRtl08Il/BfzC
	wRDsSjitBBZDl3Rwq6wodpLvwfBPJHiHQxO37WSA3y+vPdmReTVTzLSbjtv/CQR91KYFP
X-Gm-Gg: AR+sD11zm0CInJOE5HPpiMvGIr+pztb21OwJhVm3iM9Zhl1H1tVLFHLW/iSIeDdoZX8
	nqOF5QAL6suk5K2Gh3HgUTxwNg3Et+FxX+m9b5MhLTLosAQKc6BS0irJZUo5UV9+l2rtFe1+/o+
	dncMNfFcYlmlY8aeeT/V0K18bd5hOIY7vIOxYkozRhs6IL5LmA2kpF/67cd1cPgXu1SHLcpfY4t
	5kjP9WVxfgMUKlmjrCAHi9LHAqpcwz8BpZrrCDVbpQ+13mkcP7Yb4b/ErpU9hk9aBK5uHuXUMUu
	G/RAdz58KQAtyBwKkIz7tZwyxaS/hnzH6I1jPdwARvNncdIl1I8LoiHgcP8aT42Gb6XPKDrWjCK
	BG4XBI+ZwqWTzAg==
X-Received: by 2002:a05:622a:4d94:b0:52d:9db6:6c28 with SMTP id d75a77b69052e-52e42283b20mr147635061cf.13.1787830573785;
        Thu, 27 Aug 2026 04:36:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4d94:b0:52d:9db6:6c28 with SMTP id d75a77b69052e-52e42283b20mr147634271cf.13.1787830573148;
        Thu, 27 Aug 2026 04:36:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm8916521f8f.23.2026.08.27.04.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:36:11 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:36:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
Message-ID: <zvs72iseaipj5ouljgrivq2y2cv245kt37gjavbh26he4576iu@d67g25es7ojs>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
 <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
 <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
 <6xbm6uq266y42ga54wkdn6364gjj44v4mmsjg53rhfi4e7rzmq@i2uwudm7pxcf>
 <a144bd80-f49a-42bc-90ef-a114467e4b39@linaro.org>
 <tpoqvfsrny7xqykjevjiyyuctwceenfjry6pf6zbwf2yg5hi7j@5rq554qe7ghj>
 <b74c2990-ad2a-4ec3-b7e3-e78797c3d4e0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b74c2990-ad2a-4ec3-b7e3-e78797c3d4e0@linaro.org>
X-Proofpoint-ORIG-GUID: t1Ub9xgwKzeiEAOqhtehRnMxKTi9qAEz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX6exOIsAjkifP
 GIHBXmyqc2qX89cz1yZqAWRrN4noQox91NxllHfvCE4PHEQaOSK0HThuaKp3F/O67E+LIot6w2M
 /oF/qwoBlQ5kpfLPe8mi5EzewpQU9NQ=
X-Proofpoint-GUID: t1Ub9xgwKzeiEAOqhtehRnMxKTi9qAEz
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a90212f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=i7hnFCAnuYUrP2h5eRAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX78pDQhzHoEn1
 KGA1SmckuJDHiiqBXzuBV3gYMu3i3xNzShkW5L6c8xnvLIvAcBPnzkpNzP7ta9fb+jQahCZA8iM
 YyvjW0GAtGRxmIZ8N7RKbbPZ2DGAxTKDIOdW4mS7Yym36lt40OKU1fvqrCcACa9+9ZDPcspvSX5
 oyTxy3Cf0k7WXCl7d8G4hB63e6ybIe2hlcE5S7NwsiIa5GE1PbFDhS6ETmstm15c9wSrgdcRWLo
 VaPhyINxbXFa+5430LTUghSY2yTmnbb641A9jVH5SwRvZZZQzZL6QS+Xw1mCDSQriZ2LeB1F41m
 Jf6fE2sAE9lKS2YFbfcQGGCnF/HZhUsgxWXwMJljGgYyYubWGlQpzQaIzDsMW9+bnVG4/oPSK8p
 /eCBC6nmYZ0eOyiMn97Ycc/aVX47WE5bzx81+bmfKlzt/H8i1C5vpUqVUEarG6LO+e/mIg1J/Rr
 kxndVeORU1310LIS/ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270096

On 26-08-27 01:41:31, Vladimir Zapolskiy wrote:
> On 8/26/26 16:05, Abel Vesa wrote:
> > On 26-08-26 15:33:02, Vladimir Zapolskiy wrote:
> > > On 8/26/26 15:10, Abel Vesa wrote:
> > > > On 26-08-26 14:50:03, Vladimir Zapolskiy wrote:
> > > > > On 8/26/26 14:31, Abel Vesa wrote:
> > > > > > On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
> > > > > > > A clock controller driver is expected to be embedded into runtime
> > > > > > > PM framework iff there are specified power domains to supply the clock
> > > > > > > controller. If there is no power domain, then it's a noop to add
> > > > > > > the driver into the runtime PM framework, and if there is a power domain,
> > > > > > > the dependency can be considered using this fact rather than relying on
> > > > > > > a probably stale data from a particular clock controller device driver.
> > > > > > > 
> > > > > > 
> > > > > > I don't think this is right.
> > > > > > 
> > > > > 
> > > > > Please elaborate what is wrong in the statement above.
> > > > 
> > > > Enabling runtime PM just because there is a power domain attached to it
> > > > is prone for breaking consumers. If for whatever reason the power
> > > > domains parent child relationship isn't right, the child PD vote might
> > > 
> > > If so, it's a bug on the consumer's side, likely this is unrelated to
> > > this particular change, and it should be fixed independently from this
> > > changeset.
> > 
> > Providers establish the parent child relationships for power domains.
> > Consumers don't need to be aware of a specific PD being the child of
> > another.
> > 
> > > 
> > > To be precise, I don't see any interference between this series and
> > > any side fixes, the changes can coexist IMO.
> > 
> > This change basically says "look, there is a PD attached, lets enable
> > runtime PM".
> 
> Exactly, this is the expected situation to enable runtime PM if there
> is an attached PD, this is normal, and it means the change is correct.

Wrong. There are tons of devices that cannot do runtime PM, yet they need a PD
attached to be able to function.

This is why genpd doesn't try to enable runtime PM by default, just
because there is a PD attached.

> 
> > But if genpd is missing information about the hierarchy,
> 
> Sounds like a bug.

Yes. But most of the platforms still don't have an issue unless runtime PM
gets enabled. And you are basically enabling runtime PM on all clock
controllers with a PD attached, unaware of the consequencies.

This has been my point from the start.

> 
> > enabling runtime PM could potentially leave the child PD unpowered due
> > to parent being powered off.
> 
> Sure, but it is not runtime PM enablement to blame, it's another problem
> to be fixed in the driver.

So basically, you break all platforms and then we need to fix the PD
hierarchy on all? I'd suggest we go the other way around:
First we fix PD hierarchy, then we can get rid of this flag, if needed.

> 
> > > > not trickle down to the parent PD. So if runtime PM suspend happens, it will
> > > > drop the vote on its PD just because the genpd tree is missing stuff.
> 
> This is expected and it's a totally valid behaviour.

So consumers crashing when some clock controllers do runtime PM is
expected and valid behaviour? Again, we need to make sure enabling
runtime PM for a provider does not leave consumers hanging due to
missing parent-child relationship in the genpd tree.

> 
> > > > And you're enabling runtime PM for all controllers that have a PD attached,
> > > > even for those that do not have the use_rpm set to true currently (e.g.
> > > > Eliza).
> > > 
> > > What is the point of specifying 'power-domains' property for Eliza GCC,
> > 
> > Having a 'power-domains' property in DT node, doesn't mean the device
> > has to do runtime PM implicitly. The reason a PD gets attached to a
> > DT node is to make sure that PD gets enabled and stays enabled for the
> > device to be operational. Runtime PM is just a great way of reducing
> > power consumption when the device is idle.
> 
> A proper runtime PM enablement in a driver ensures this "PD gets enabled
> and stays enabled for the device to be operational" target, no contradiction.

But it is not proper runtime PM yet. Not until we make sure genpd tree
is accurate. Enabling runtime PM in bulk isn't a good idea.

> 
> > So GCC needs the CX PD attached otherwise RPMh could drop the vote and
> > result either in undervolt or actually failed reg access.
> 
> Is it going to be fixed one day, so the drivers earn "use_rpm", or not?

Yes. I'm already working my way up through clock controllers, accross all
platforms, attaching PDs where missing and enabling runtime PM one
provider at the time. Even with this approach we might break stuff on
some platforms, but at least we can revert that single commit, if
necessary, instead of one that applies to all.

> 
> So far I get an impression that all these reasonings above are unrelated
> to this change, it sounds like there is no problem in the runtime PM
> framework, and something else is broken

You insist on breaking all platforms with this patch just because of
it's a nice rework. I'm trying to prevent breaking all plaforms.

Again, first we fix genpd tree and enable runtime PM one provider at the
time. Then we can rework this and drop the use_rpm entirely. That way is
less hassle to debug and easier to pinpoint a commit that enabled
runtime PM via the use_rpm flag for a single provider, rather than having
to revert this patch that does this in a bulk.

> 
> > > if it is anyway explicitly ignored by the driver? It sounds like anattempt
> > > to cloak a bug, and if it is necessary before the bugs are got fixed, then
> > > the 'use_rpm' flag shall be inverted to 'do_not_use_rpm' flag for broken
> > > platforms.
> > 
> > Well, when you add support for a new platform, usually you don't enable
> > runtime PM by default for these controllers,
> 
> Why not?

Because runtime PM is usually an extra effort, on top of the existing
functionality of a driver. Specially for a resource provider. Done
wrong, you break all consumers.

> 
> So, today there is a flag to mark a properly supported platform like it
> is a wonder.

No, it is a generic way of enabling runtime PM.

If this generic way would've not existed, you would've not added runtime
PM APIs calls for all providers in a bulk way, right?

> 
> As I said above, a properly supported platform/driver shall be the norm,
> and an ill platform should be marked as broken, and the quirk, if needed,
> should be inverted to the yelling 'do_not_use_rpm, I'm broken in upstream'.

It's like saying genpd framework should enable runtime PM by default for every
device, and provide a flag like 'do_not_use_rpm'. That would be bad all around.

Again, in general, just because there is a PD attached, doens't mean
that that device has to do runtime PM. That's why genpd framework doesn't make
such assumptions either, but rather gives you an API to add it yourself,
if the device can actually do runtime PM.

> 
> > until you made sure that it actually works. So use_rpm is basically
> > saying: "we're good with runtime PM now". So I'd not revert the flag either.
> 
> I belive it's wrong to mark "good" drivers/platforms as "good" ones
> explicitly, the purpose of quirks is totally opposite.

You are thinking of this the other way around. Again, if the Qualcomm
common clock implementation would've not existed, the we would have
added runtime PM API calls all over each provider, one at the time.

The benefit of the Qualcomm common clock implementation is that it
basically takes care of calling RPM for us.

> 
> If a complete removal of the flag is not possible due to "broken" drivers,
> then I'll invert the flag in v2, and then remove it for the clock drivers,
> which does not require explicit PDs to be enabled at all.

Why?

Again, RPM is not a given in any scenario. Proper RPM is done per
driver, after the driver brings the device into a functional state,
therefore an extra step, sometimes even impossible for some devices.

Inverting it will just force us to add the flag from the start for each new
provider until we figure out properly the PD tree for that platform.

The value of this patch is outweighed by the current functionality of
all platforms. Taking this in will most likely break that.

Due to this facts, I think this should not be merged. But it's up to Bjorn.
