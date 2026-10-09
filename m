Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FDE1A6815
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556013; cv=pass; b=KbkRA0ySnzoIu5Vu5+9x+T9ADwuQppW94Ew8N4chxihGOlCE4Z7YVvMCjkZVkrcWfHPbyLRZGkGEwmHSUzpwoaEOPS8DibofbA/IFA/F989nc9OJTaKKFMsvtvlOaOCVMgAnoJ8yJfgLDIW5ggRL9ZfMbcDjnWotQzG6Fy2MUAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556013; c=relaxed/simple;
	bh=hjigRTpAheShvm4CUT48bphb627DqEDqb9jtmCAaHI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHXIvkLpk7GOi/MLnuicOQXCVfttaflgWBO3eU3wMazjdltpu5+1lk8yI8ZDydXy8G/66eUCmV3/BERYYUbm8aggwgUCcbbQYInalykrJc+3R3Gt+7A+jmr9GoxXrXxB3GffHbDvWI5lDa8Si89C+xvRtTMTS0SBNhBRdAHdCdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVytQEUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPUMoJh5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVytQEUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPUMoJh5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DkoGo1956561
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 14:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=; b=KVytQEUjtqCMeEs+
	IlaupvZ6HdAWnkXDlu8DGKXcQmaWAhzC0hIo4Kuw+rT2SBbUn608lxqOTXIFx76T
	24L1342L5BBnS/nn70pm7616hPPD6f+ub6C4saRgX6+Oh5yryqCVFUtGYKaOhS5c
	zgLsWmqEj7ZaZEp7S/eO0Y/80s9DthnY4YhFmWXCUUjG7ul5bG/KUKBoWQNbcyK3
	SQomoBHOudb/+o7riht2a3wZk6GBA4h3jy4kmfuoh5pbe4K3LKlS+uf88C5flLl/
	Ktj+xd+ptKntIzvpPsUgq9MqW0h+HO0ZSIZQ1DpnZt13t7Hv9dAIdLS7e3cjOm9O
	ia+Nsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f285e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 14:26:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso4411618a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556010; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtbH9Y9b+W93Cu1Zu64umfzQSfxdbJzniCE1uCTpwG9k0RhqCcQTl/eva/8t57y1Tq
         BqoAPqhr2KiSQoof7qA/wgjAzJdfUg3DPxTYA2xf7Bpb5sv8wOXp7WFt73ESO+9/Nk9D
         +5uRvnkrp0Bk0UCuuqQUXdRlYfyxmtnIOCkryQw3WxJrbpHrw7Jhs/ybLfAF2JpTf60T
         389/6ILkuEAa2XWwChmm3gYqSKwrpvz3bfs1lQ6Kwg/Q9xBshgK0vXJDcv/oPAsqpiA6
         +Vo1tkYI/oWJMYcYFM+3JhGYVcrBsLceQ30TjDBzJ7kOgALrhr4BFTFrlqAJqq+ThKie
         MyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        fh=Py/flmHii5VHc/09PSl0MTTnTBVheNjaUTXisXuelww=;
        b=dH1SaXNz2lZt7AU7Eu+S4d4Af0+AdxjTO0Nr9cKAIYwzXFTGJHlSpGrh+r0/ziDoae
         GN5AyWBth9LiaZphAnQA2Ve++EjkqpiZC0XZZk7nuTraDLtke+/mLVav0ubgHhGZQnzK
         nBbc12Fy4oQbL66yINcv8FOwwAF+0szsJ8j+6+GAGLEgDBRjTBJXpNmc5PooV5zpoI1i
         eE1STBDe6CBXuP5eWiZZv3zKD2NN7zlUapII/hvIp3YEo5zk+/bJd1BgBcz9hv6I36zw
         TWz8c7EfEjQUpbz4APgqvYpD1CgsIGXSMOnJLnMHZIK/IBGKsDha1KxLJjnkQWuFhlWD
         ISdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556010; x=1792160810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        b=ZPUMoJh5LLh5HIysbwYgMlomKhKToUfr6nDpl2ewjy4fekU1obJZgxQNP0r7BsztyZ
         /R4847sxmxTZj1kSbtNyxgi9W7LL6nXLWvIIBUZ2cJcCBOWzFf5S4y6MA9VZJNelindF
         ILech+56ehDtGequ2HkbgggqEYt5/Q5RGADMBrOdA4X0P5kWu093Ilcl/W9xZDzQ/85g
         p0WmyjBlhDPh3IO814T+rawAZ0ZunrwTgguTHdbU+8kRiwz+rSRCFxP2gzJBKSHNyzF4
         y+kOU++JO+WmDsQ1GUYxQCk/x8jrNbedNsZSvYi5Ki3G7CzAJ62sPeYuYGOSfJ4rNNEq
         iGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556010; x=1792160810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        b=nHgaCTKN28dmvYgWSDa/8gkuym/lFxGZNDMlRxn21X3AO5wE09TDNWk6sWGYXF3QcW
         MyX/s8pDNHxM+eiyO/XQ8MKgFrznDghh9XBi5lvnKUFNVIAbQZKAyEWjWezwcolgGm3w
         LYrElkeOFT3aLda9/qwnr2LIceJCNzEjy0ojUfA5xpBLu0t37kH9fW+MeCuGiDhjA3tB
         K5gdUvLesq+FVSoHqNU2U6GthXLVqoSEwnEzvY2+2UfgExP8Ra5A2t9kBSYss8Q1uW9t
         ZRXEJf+DLDJXGFgh6EijTc7s8KhBPlYp3B1cfz9A56Dk5Y7r+oAjQMfsgR9vjhB8wVDx
         njhA==
X-Forwarded-Encrypted: i=1; AKwUvBwRILPjjPy7ES3t1cChw7k6SPfC5LmNqkwCUIxBv4d/7iJHmdz0crXNUBq02wqloVHZhYuW7snNiLWDY3BN@vger.kernel.org
X-Gm-Message-State: AFuF++np+CCP2zz5vHqHszb73ZW+pJ8Q9pAi30gnOvztmfm+4493C8OB
	PB6k1h8fLkFZv8KpYHRi+eSmXTuHoAkfUZIpLxEDRKEZlAfSKDk+zRV5FvBZNz4BcgFPilMEKUo
	i9W7UrGTBHb9rLdw5KwG3Xjq5i5E9nx1Mda3ZS6CXp3MAaCdMwDCH9ZeJL6d6FWDZ0c6yjcNidg
	Ss995k9kk92BYfdsqJilaqyDP2O/JANCfwb7Bp76Tte1Q=
X-Gm-Gg: AYBFou0OSGffPI6YaBOP3F3cN6laUpsO2EFh3hNaB+NuBKhLt02WPhC9T2OvjYLC6uk
	cZzPLi1dl6aPLPCq3hGoJt3iRbjBwuUGnfJ4NUlWH7hSkaprD6Xz/HoadTKtkSwqgOiIEMOiKQw
	Xo7o3fGzpqgWCqjedsWXdDLebqcGPI9NMHoyqSOE6+CAPy72+GdnIcfPpgqA==
X-Received: by 2002:a05:6a20:c79a:b0:3e0:b71b:a8f2 with SMTP id adf61e73a8af0-3e16c010522mr1735695637.40.1791556010035;
        Fri, 09 Oct 2026 07:26:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3e0:b71b:a8f2 with SMTP id
 adf61e73a8af0-3e16c010522mr1735661637.40.1791556009444; Fri, 09 Oct 2026
 07:26:49 -0700 (PDT)
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
In-Reply-To: <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:26:38 +0200
X-Gm-Features: AclHuK_Vubf4k8TpvsD1c7GgWbgnBlZu6M1U_szLd1fRdLCNfDEiyzf-bluvzDo
Message-ID: <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: Wis9FOiy0lbaU0aMj_7ztAQKimtGrWC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX9OryBIIuaN0B
 fh6HRzhxA481CYEkaCg7qxdUC0yaB8uassPtlKsONpi0ocUoYGAwJoivv7nbUJ2zeuztjsDuxbY
 twLW/XVhkmLIE7Ghix/i94Ge3OwETx1Zi1aw8q7dKGXBy4WeNJmH4/wjuSyKXVe/arr59LFUYcE
 VyQoQGExq/y5dUrxvuUDikiwLtcANFF/cmg2XOcNjr6zsbHUauIBPZhX70V506L3Si7BGZpSr4p
 ItKpcDpJo1UH0mKKcgrzZp5hExKAwtdY3Rll8eEsu14A/YY1hOtp8jzyCw7ddoCVFx7bum9ni9f
 1KUl9sa80UCAjhMqSVaABV8DxJuojcybhefnUk7He7rBazIg5+lRyrdwMXXljapcwW/vRk79ZRv
 +BLYFZwLxD5gy9Wf0x57lxhFT7jnlYjozi4zyqbQRH6/MjkTzwQp+4WzzTfyuU4ZXIuM1qjsjQ+
 Ih6jqlvzNt7K0UjJB/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX/3p5rRarR4/6
 FIImtgtJfBByzTq+8pCi5vFoEz8wBg/zgCZ5dl4hlr6xpJuC9U6jYSCp1TOUqPXEwvGb7coRI/f
 +Kr+PZPz53uRDAgHZbMeLCXTVQ0VjZA=
X-Authority-Analysis: v=2.4 cv=B8ksQ+tM c=1 sm=1 tr=0 ts=6ac8f9ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=xZBbqvtqD373e08s9rwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Wis9FOiy0lbaU0aMj_7ztAQKimtGrWC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090057

On Fri, Oct 9, 2026 at 2:21=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 02:21:49PM +0200, Ulf Hansson wrote:
> > On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@kern=
el.org> wrote:
> > >
> > > On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > > > Some domain idle states require system-wide coordination and should=
 not be
> > > > selected during regular CPU idle. However those states remain valid=
 for
> > > > system-wide suspend like s2idle.
> > > >
> > > > Add a per-state system_state boolean and populate it from the syste=
m-state
> > > > property. Make the genpd governor skip these states during CPU idle=
. Leave
> > > > the system wide suspend path unchanged so s2idle can select them.
> > > >
> > >
> > > Instead of this I am thinking if we can QoS cpu latency setting and b=
lock
> > > system level states normally. Since s2idle is user driven, it should =
be
> > > controllable via user-space and we don't have to define bindings agai=
n
> > > if systems that use platform-coordinated needs this too. They may not
> > > use domain-idle-states.
> >
> > Even if we likely could make that work, it's seems not correct to rely
> > on userspace to make the kernel to pick the correct idle state, while
> > the decision should be based on the characteristics of the HW.
> >
> > In regards to PSCI PC mode, I believe we should consider adding the
> > similar DT property for the arm,idle-state binding and make a
> > corresponding change for the regular CPUIdle path/governors. Although,
> > it doesn't necessarily need to be part of the $subject series. I would
> >  be fine if that is handled later on too.
> >
>
> While I agree with this line of argument, I am bit worried that there is
> more deviation from ACPI _LPI binding(equivalent to these in DT). If othe=
r
> OS has manged to run the same firmware without adding such information
> to the firmware(ACPI in this case), why do we need that in DT. Is that
> information encoded elsewhere in a different form in ACPI and is this the
> right place(the idle state binding for DT) is what I am trying to underst=
and
> here.

I don't have the information about ACPI at hand, so I will leave that
to Maulik to be answered. Or perhaps, someone else already has this
information and can share that with us?

In any case, I don't see any other reasonable way to describe this in
DT at this point.

>
> Also taking the example of screen on, won't that be prevented as the
> system domain is shared by the system level idle-states we are talking
> and the screen/display device. So it never votes to power down that
> and the PSCI OSI domain idle driver must not be able to choose the system
> level state.
>
> In general, there is some device that doesn't vote to power down the doma=
in
> and hence we can't enter the state. So my question is, will there be some
> device that doesn't explicitly register vote and hence we need an alterna=
te
> mechanism like the one proposed in this set ? If so, what are those and
> how does that work in system suspend states.

Assuming I understand the above use case, you are thinking that the
display device (for example) is a part of a cluster PM domain, right?

If that's the case, besides that the cluster PM domain topology must
be modelled accordingly, the display device should be hooked up to the
cluster PM domain it belongs to.

Beyond that, it's the corresponding display driver that becomes
responsible for what should happen during system suspend. If the
screen needs to stay on it may need to call device_set_awake_path()
for the display device - unless it's a decision for user space that
can control the behaviour for the display device via its sysfs node.
If things are managed accordingly, genpd_finish_suspend() may decide
to keep the corresponding PM domain powered on during system suspend.

The above said, $subject patch doesn't change any of this. It only
allows us to use more states (deeper), which are limited to system
suspend (s2idle).

>
> Or am I missing something more fundamental the makes all the above argume=
nt
> void.
>
> --
> Regards,
> Sudeep

Did that make sense?

Kind regards
Uffe
