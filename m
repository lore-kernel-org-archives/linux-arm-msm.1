Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FFB3815E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886311; cv=pass; b=Jk8sWkaOOu1EHITpPxPabm4fIj3OB9QRwJK/wimHrfOc94EHg+Dc/S8eeuquWGf4SZ5Le92RCVlVBMVDiTf2twlP4QZBfI4xMs5omPz4ewmLLAubSPTrPE+GB/E/IBotf/932595v6GKfVbuuwkjCJLbce+5DSynbVunsG1rI4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886311; c=relaxed/simple;
	bh=Rh5sLLxFP2Sa8hBKcYwQzVB6G/uNzhJkAl2GeVbLNj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVCGBa9+vPxhwpharQsIDgg/GCHVxI+bNjmlOoyyLpFDz1uPY7DgFwm4U/HVwvcqyXNqSRLm4GOx83i7J6t5jz3bupG6xhdto/rhxY6MRwC2finji2OvmkFvmDDfr8H+xrBh3GACQbs92DU+kVyBnPadgj28B7nrQHOyRPUbmB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvRCFEAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M79G7bPn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvRCFEAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M79G7bPn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OahL015549
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=; b=SvRCFEAHC1G3i8+Z
	H5f1xhAv9VzXlMCF32lhbEXY6hhKiYr7KIULE1QmnmUvLrCOgHh9sDkMBm9SGhjp
	bqII3sAoH7+rin8gJUTN6sLFd3hgwgdAoXDC9yzz9cnqfdQj2marcOLs1MfodNPG
	SL9cnWywJb73QpHQlh3tteCcIq6leEXn1RUVnALb9NVdu+Gqjn6+vZemBhOcZq2Y
	imEUjif+YNdqLDXh7TTNrJMnr++xjbnfkKvLoVpMu56nZApftJYoPdqghGKTwgsD
	TfJYJBoVFeT75Qa/pQKj0sFE6c0VLw14hGbiW+WU1lmcqu1+r+n+Ly5PyxSCz5cd
	CLr91w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugpr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:11:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so25213255ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886309; cv=none;
        d=google.com; s=arc-20260327;
        b=VeVmr0QOPKwzhpbfCFp6ArEPok26kXC7GisunPC4M+Fvc0/FYg/cfIAyJc3gnPbCKr
         zvslsNkpmwrC6WfKrKflek7pzjq0pdSteFCOYoou0oOLQzszDSgflOlpAPXQIHN5VSwu
         Me6nCgCHK7oyKKrqJVHIR7QDHt1c1CD0WmsjTMjFxJ9ul/g9nCaMBDD8Hy/vpNd+G+XS
         ClvcNfZLOwa61ATN8v61+CmErepzOQGBgYYptrWpjJtIjTqA7s6wE+MZc9y+c6l55k3n
         kpBC1ktVi8gmVwxjpgB1MXC1OPFquPsHlNZ4eh0H599tq3A9DszP+WLtJmKJVfAkXVg1
         SEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=;
        fh=oxS4S8lBwmJ5/PFU7CdsVK0OsNg/SW8rEV6gAXx6oRU=;
        b=Noy9+ayVmTgKN9qu3+RtdCAmS9o9pA3By6giNCfM26tnlTtDJgingn+Hpx8zcy5PuG
         2MS0K9fI1lFtgp5PQcabRg6dJ6MsMYtfsg7Zcle9UCsAH8MAtqydD6yhBuk1Bwx/6EO+
         8ie5lMOZNQ1SnEuwsvXblWxSrfRp/nueTfMU38+8qxuO/Uf/fPlPxWUEXqrtHB3jlpqI
         MMsMyF7bENc0XOhcF16usd3z1aysAILzNs35f7B8NTSoGuhYEBmMdy7rA3P/SKn8uzKu
         vSlrpbX0Omj+j0pU7aYV/LMglWo1yAktl3dKFyERylExyOvSbpn9F9WiQf1O2Zssgnda
         GvUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886309; x=1792491109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=;
        b=M79G7bPnFeucwk+2kyYzjwBtcG+6pNgc6mmSDQmK1sPN/0NUVTF/UfS45Wmd0FkYNk
         UI372eTdP2GeZfh3GLrSmKW3RlJCYH0FnIporq+sDcvmaBDRS+L3cfnk3D8nn+YU0+em
         vQz7fXP7ZhR2kWlBzpgKgINFQOHWFBTi//1Hq/BXMa7p3Bt/R7fPrKJWFHIAQrVt+7yU
         ONQ7N1EpzdVDL23dXet0CdqtUk8BJLgQPP/Fj73MK0RbjGcY7ny/kolnfv00itaON8N/
         UnChJu6wwZjSS267PlFGqszAEG+hEYfQpARuqH3M1mqQve1P/qmAN7NpVhTtsH3i66b9
         bGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886309; x=1792491109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=;
        b=hUzyumz/Vkp6zP2pqlvsgh9QoKVO41J88KLGPJbMz6xIs5xCuSd8STvDpRdbBE38fS
         vF4yU3vb8Rk8KWr8JCcQrjSY23/f6pllUFux/L++K7f/Mk6yWgO0ufTJ1TGAB2PI1Ii5
         FHq343L/bRrmy1QR6XwLMf5FQSilxfBe8R7wqM9s/OuqTx54o3lxSq7sDpBAspUMWuTp
         gnw43nYhYMeRq9HhztKByrIep+ulx6UYoiJL1BZwlgK1ZzmDEp9ilWjz9YqQK+mXOgR4
         MU1y/UNqSbHx6SHXOZa/RZeyia3LB0b3imagy8kuRXkcx4obNJ3ySZ1v8OVmIcWjjpin
         hxwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZti7vHdWsxV8lKVjIgCaOPeW/LzZGStDkq9YtX/DdE1O13RR1YotCSydeRuxYHDJZ7pwlVx2ERrPS52vf@vger.kernel.org
X-Gm-Message-State: AFq9FYJp8S6dZUxYLFz9npTl/bro4GxVBrR1h0Nc8zbpFHUuovbY6Uck
	QNCFN6/EaeM6FKUGaBgGu4ZJ4L15N/uH3t85MU59U/9hErS3n6td3mYHFpCodsc8ywIS2tU8tCY
	U+GhLxw/BS3SYhI0Xt0uk6587PtAAQjViS2Ixh+mT1MsoHdH17fXSTPGEn9az+4c+rE1XKT7bMj
	IXRoMUrJ6K79Q3sy8DxppuKp9muhg59HqsjCw9usfpb70=
X-Gm-Gg: AYBFou1RtvZPsFJjRfCVnz36aypsPR5WPUUDYcTuAeSc4y+ZZizFQHdFkN/Wi0+getS
	XdtJ/t30qXA+xL44aJRjGrPR1uJ5W6aUuQV+MvMNUgx7GrK8dc/LskNfFUDw4GgJ7tUZE66UrlD
	9mDMHBn3yIeqLtSTephjVeT7+IMwaA+g5cI7X7RDNFwkSrJ2zB/IpEVGA6zw==
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2e842ab6a10mr89373595ad.15.1791886308591;
        Tue, 13 Oct 2026 03:11:48 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id
 d9443c01a7336-2e842ab6a10mr89373115ad.15.1791886307458; Tue, 13 Oct 2026
 03:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com> <20261009-skilled-mature-bittern-2206fc@sudeepholla>
In-Reply-To: <20261009-skilled-mature-bittern-2206fc@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:11:36 +0200
X-Gm-Features: AclHuK-hucqj9IGIiaorMG2xXuxJ-qOYNImY5Izp_FoXJk3fQG3HJiolhaI8eq0
Message-ID: <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXwAZO+V/1+Yt9
 xz6lg56vmBTvfx8dNi/9oCnQf4M9iG2XvFCIhZ/gLk5Y149fWJu4NAFoDyMRjF7GsVxw1YqC/P7
 phuDAxOorM72UGY6xWcz8L0oqiyt91DDdv5HSsEPR5k9jefyywnriV944nJBucs8P9BeugSnLIm
 SHgor97cBHBceznuTRf8ynGoqbiVQM8OSrEdQI62anlKIt8mhfH0bxsA20SQGypSv2rs77+gROI
 TdOMHWx/u6W/2kRTSxICuNUKgcTjM3hv9AXYGB0RVVclEVJAoHllWSSUtS+zcD0/EzcXMDuXw2f
 qZjT2HHs3++pD8Wa0GcnrD4cXhLakXccVFuPouDt/UnIOHkfHo0idV5UFslRi0qPG7MjveH94Vy
 J/XbTYHpk+oY14Znna7HU+fArWrdBXODa+439oOBlGmaR4FqBA+A52pW4x8L8R2rU72xXCYoNly
 fTZRboPqCK9RtyAkClQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace03e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=d8yA8qk_i9ZICp0znskA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: xS2ys_fpg6tqNJ1pedd74kVUPU0hTi_z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX+uYr1XGCI1AI
 0UKQ8QA6L7KuW949BT9m8c0+b/5MFXAMp8qv3gxekmXR25tNkHg2Pq6fRda4mPmS7/LBJAms2WG
 IXuV+umaT+jRMd+QC8/hjQtiNdufVP4=
X-Proofpoint-GUID: xS2ys_fpg6tqNJ1pedd74kVUPU0hTi_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>
> On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
> > On Fri, Oct 9, 2026 at 2:21=E2=80=AFPM Sudeep Holla <sudeep.holla@kerne=
l.org> wrote:
> > >
> > > On Thu, Oct 08, 2026 at 02:21:49PM +0200, Ulf Hansson wrote:
> > > > On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@=
kernel.org> wrote:
> > > > >
> > > > > On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > > > > > Some domain idle states require system-wide coordination and sh=
ould not be
> > > > > > selected during regular CPU idle. However those states remain v=
alid for
> > > > > > system-wide suspend like s2idle.
> > > > > >
> > > > > > Add a per-state system_state boolean and populate it from the s=
ystem-state
> > > > > > property. Make the genpd governor skip these states during CPU =
idle. Leave
> > > > > > the system wide suspend path unchanged so s2idle can select the=
m.
> > > > > >
> > > > >
> > > > > Instead of this I am thinking if we can QoS cpu latency setting a=
nd block
> > > > > system level states normally. Since s2idle is user driven, it sho=
uld be
> > > > > controllable via user-space and we don't have to define bindings =
again
> > > > > if systems that use platform-coordinated needs this too. They may=
 not
> > > > > use domain-idle-states.
> > > >
> > > > Even if we likely could make that work, it's seems not correct to r=
ely
> > > > on userspace to make the kernel to pick the correct idle state, whi=
le
> > > > the decision should be based on the characteristics of the HW.
> > > >
> > > > In regards to PSCI PC mode, I believe we should consider adding the
> > > > similar DT property for the arm,idle-state binding and make a
> > > > corresponding change for the regular CPUIdle path/governors. Althou=
gh,
> > > > it doesn't necessarily need to be part of the $subject series. I wo=
uld
> > > >  be fine if that is handled later on too.
> > > >
> > >
> > > While I agree with this line of argument, I am bit worried that there=
 is
> > > more deviation from ACPI _LPI binding(equivalent to these in DT). If =
other
> > > OS has manged to run the same firmware without adding such informatio=
n
> > > to the firmware(ACPI in this case), why do we need that in DT. Is tha=
t
> > > information encoded elsewhere in a different form in ACPI and is this=
 the
> > > right place(the idle state binding for DT) is what I am trying to und=
erstand
> > > here.
> >
> > I don't have the information about ACPI at hand, so I will leave that
> > to Maulik to be answered. Or perhaps, someone else already has this
> > information and can share that with us?
> >
> > In any case, I don't see any other reasonable way to describe this in
> > DT at this point.
> >
>
> Fair enough, we can consider that once we finalise what we have in this
> set is the way to progress(not important until then).
>
> > >
> > > Also taking the example of screen on, won't that be prevented as the
> > > system domain is shared by the system level idle-states we are talkin=
g
> > > and the screen/display device. So it never votes to power down that
> > > and the PSCI OSI domain idle driver must not be able to choose the sy=
stem
> > > level state.
> > >
> > > In general, there is some device that doesn't vote to power down the =
domain
> > > and hence we can't enter the state. So my question is, will there be =
some
> > > device that doesn't explicitly register vote and hence we need an alt=
ernate
> > > mechanism like the one proposed in this set ? If so, what are those a=
nd
> > > how does that work in system suspend states.
> >
> > Assuming I understand the above use case, you are thinking that the
> > display device (for example) is a part of a cluster PM domain, right?
> >
>
> Yes, exactly.
>
> > If that's the case, besides that the cluster PM domain topology must
> > be modelled accordingly, the display device should be hooked up to the
> > cluster PM domain it belongs to.
> >
>
> Ah, I thought that's the way the whole domain-idle was modelled as we
> started this OSI discussion a decade ago with an example of CPU clusters
> sharing power domains with some other devices. I am surprised if that is
> not the case already =F0=9F=99=81.

It works fine today, I was just trying to explain how it works,
considering the use case that you brought up.

>
> > Beyond that, it's the corresponding display driver that becomes
> > responsible for what should happen during system suspend. If the
> > screen needs to stay on it may need to call device_set_awake_path()
> > for the display device - unless it's a decision for user space that
> > can control the behaviour for the display device via its sysfs node.
> > If things are managed accordingly, genpd_finish_suspend() may decide
> > to keep the corresponding PM domain powered on during system suspend.
> >
>
> But the s2idle and s2ram anyways suspends all the devices, so they need
> to vote in for the power domains to be turned off. If they are supposed
> to stay on, the system enters the state it can based on the other votes.
>
> > The above said, $subject patch doesn't change any of this. It only
> > allows us to use more states (deeper), which are limited to system
> > suspend (s2idle).
> >
>
> Still not convinced, if all devices are plugged in to the power domain
> hierarchy correctly and the domain-idle states represent or carries
> the entire system power domain topology, we shouldn't need this extra
> information. Having it make cause issues when it conflicts with the
> topology information IMO.

No, it's still not sufficient to model the power domain hierarchy correctly=
.

These "system states" are special since they require additional
coordination in FW/HW, to take into account votes not directly
controlled by Linux.

I realize that the description in patch1 should be extended a bit to
explain this better. In principle, we can compare this with the PSCI
SYSTEM_SUSPEND support. The difference would be that PSCI
SYSTEM_SUSPEND is limited to support only one state, while the
$subject series would allow us to support multiple.

In regards to ACPI. I think this is as simple as comparing it with the
list of ACPI S-states.

Kind regards
Uffe
