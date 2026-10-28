Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793185213;
	b=IWhulsA0HmTyXH9wWkepdEfgk7Nr0C/hepF2KfEQBiY2nIsczSkVxqSNmRe+5Sl6P5hU
	 OMBojbhWMsEQ1rWLP6Rg4jNbp9nTwl1m9ZYeaWasMyOYAYjj85vXjgTC9C0+1wWjTY3Pl
	 ZO3vq7hz2Dbj0YttjHC4f/Nmsz0NZsT8Z/bcA+BQ+dBUr14sWIlCytAGnTQp47qd/GEBy
	 2esp5YEY1eFqFBPhljvs+E2oWFauAttcTw+xceXaJjrmantxEWWKLbBet38srX61dua43
	 JwpFKVrDyXkEZnIQr8dDiY0fhFMKY9sA3vfzweJwZYtTdtiEFongYAsM6UB2aNby+qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
	b=F4qk9ayDAl290vz4d/YEjy46UOecfUwJQmr4mi9oBtODWeHXIM/3eyujL4c03ONJnClO
	 SRM9Soy15/HWgEeSXG+eat/GFdY9L05p33aUHwOTtt+mixt+PAEOhlXA0v63BK4kA9hc4
	 1NbMXtmBF6QnI1mHBl+C7t1vqtG7hYbWrwW7Ey3jWq7zH6LvyY2MyqarnYZQt904K1O4Q
	 wTJ6YCbszUwEN3cMV/r9J2vYeFT3FG2kauwOybqpYd9EqyyX5G7Elt9MZqCur8OIpGcW1
	 pl6UpRITBFlBK4cwo3VKhhqqEm4wdwF4lBC4T0LW6Nz5AKzZDviy3jwgdDJ3tDoBp8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLZUaHMv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BNTo6+zh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34354606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34354606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLZUaHMv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BNTo6+zh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K3hs557133
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=; b=YLZUaHMvORb5+JOm
	pG6DIHFWDZCgl6lavcglKsmKSBHvYojRNB2UznE7BHNJKjVtjehpaXBSngpbtnCk
	OCsMb6xLFLL3Jh43HIREbPjEargv4QqJED5H3FeXVbxaZZq4l2oKrdsKuJYSw+L3
	hQ78YRw5ihdKxJhXhM6aPpnwoZa3jIod3pDbSwgb03x7caVeMeOfyClpTss+NY4R
	5W5yXsZZSkpoN829u+IQ13XhSJr3O/Z1iSKu8weAgT/rYrQsz2dArQgUcPf/35hf
	PpGI1UXTWE3PDnkkbsMwa2L6nA31G8p6B3vQreWi9edsjsOrUuoq4Ge+uwnY//sI
	XZbljw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsqer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:00:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so11519825ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793185211; cv=none;
        d=google.com; s=arc-20260327;
        b=BDOWHMgHuvRKNOxk1w1JSfmPkXApNdYfUWq4T8+rQqBVjCQQ6mVuL4jyxHeQY0NwsM
         vlism5pjTlwHmNFsiPZkMbXenZuk/Tvz8NRlV4Aa6VNu2wnmF4nsVXkA6flN9XWknd3H
         8YOjeL8zhbpv/YOyQvO6RbYhwKaB5UQfGK3GgZpr4Tu05iLcZ6hZcIQN1dsauxRh5hqR
         RFCxEKHQPGu6iJrJ6LJDWs+7MisiHzn2+AD/NZo6BRm34q5283Mx3+KniK/CtLchhvs8
         +lPbPYkdCsZRpuhoShV4HTOvoHJqOSYFNidqAIOCXh9xfpKb45Cuw5+rWcQ74XPiV+nF
         5juQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        fh=348Nrjgmo9BDdKK4hlhz4pnYKCfR7yKn1VQsawRY8v8=;
        b=mS6LlUPTetrdpM1/x7ntVLalhRmZot8iW0OxrnG4e40e9kgLflGTZSo9uiP5kp5iX3
         uD8fYw2+iDWpVo30AmWlCdOiCRcukxbaOJmUVYhf9P3i7V8Er8lZJhTkoG4d2DaOEwVL
         nzCkf+FYPzahYnEG7IAe8MibpKofpy+kqpk6bTw5aRh1Nqbyph4E/LoBhHWDfJvH8kHP
         ACDmIBmhNQD6JinDPcFAqSQZh0Lnvw7jNz4IGVs/GXafx3e7zgkOBkqOQEdfZLpoJPt6
         7q5cirR9c+0btQPfl5GeDywTPli8LseSbQT9wc1blbP7XxAdZTEhKdAlgIEQzcalzIHS
         mjrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185211; x=1793790011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        b=BNTo6+zhxClxij1kiJQirXkdbVHAW6Ix1afUYbPL74kHviU/MEciuhN6nwikaICGpJ
         Y6luAEvRR3UDmC76gIcQfnESNk7vpzoGXKJnIhB5+kBsGAHDohuWodvmyHwrcrYQpAa9
         xZO7y/u4fGH/gkY0/dSXz2N5SMqn//Ir2+GaOAmQv6QlFTaOWz4LFOXLEwDUJns+iDQr
         n0WGDn7A+VgUc23tSZXaQCTBv2/H0rXEmCwVZSmarWn5EZeKvjoMqQiL/kZEiqFMd9gV
         GMUWyjapACNtttfAcOYKNlv2kiSnyCh7aqZOzPfPIbuXgmFeGTC6Iho8rMcLsbWSIJjU
         oh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185211; x=1793790011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        b=GUWeA6W0JFvKTb/xIdwnaMedWHzbVqUWOsChR1phLGvJDWz+Poavpzqu2uwNZGsVj/
         Xk47ViYb/AkNzV7NyV89vqxeJAnzxhY40Cec9C58+3wcHj5vuHqty0UZBcMqOrF2ythZ
         lDJJlCpqzJU4JQCj1SUmD25YCwmZahK2wgG8NHg4uaT9XjjGiq4857gC8vRajoCJBpzF
         kArr/e/N0w3QyQzk63+xcKTINDVceHBO0rJEUKLmE1cStuuFHFY18jCsXf9gdmuib/Kn
         piq6ehKj/FnL2by+AyZAou6n5Mr/gVhvNK9Q7I7mkZBjAKNR5O3zohLY81d2tyq7T8h3
         GEGA==
X-Forwarded-Encrypted: i=1; AKwUvByUM7hRBH0M6qpAmUuyRVKpCweZOO0Q99ZtLJTu99VvDsfv7WlWHCfGuJ1G6SRgYC+qcEi5cdJIM1N1uNk5@vger.kernel.org
X-Gm-Message-State: AFq9FYIsom9PJH4dcRvfeGV+qaMmkFix2jJOPNjCkcu7Z7vF29oWVTMQ
	ewy7aOg9rPoc2UIHY1qxiNQ7nxqkG3p8G1zkUYnX4DT706ru7D/mRlpSLZdNWbYQWcEFw4RjzGh
	jnnfEAKGgNAWTRQOLgBalNaJsuBSPJ6obGQZwB1E1Hn+EdRk360UW1V2gQx1FP40HcANS23sGkP
	y4j9fCSaJedOR7B+l07bz//iTRx+5wqk+H2SI4cxf1AC0=
X-Gm-Gg: AYBFou0EQeFiU/DytFTLIpFuYvERz9qI7KujxhPG1BqTLj1RTeRDX8qqa+YFFQSuNI1
	9YPLrqQI+O6AguoY2RNJCcULJYtu4cHaqBAhcvucxICA8XlpkF7vgCGqlUxEs3mex4zEWF/81aT
	OLHzMbl5QRNtWpFClFBJCOwmqf1llxS4yZztS3/Inu9arBhCwImF+6drlhRVFEpFyNliyRJ+sZ8
	NBKBc4xWStcVBS7aQ==
X-Received: by 2002:a17:903:244c:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb003cdd36mr19356255ad.30.1793185210940;
        Wed, 28 Oct 2026 04:00:10 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2e9:7dda:bfd1 with SMTP id
 d9443c01a7336-2eb003cdd36mr19355325ad.30.1793185209362; Wed, 28 Oct 2026
 04:00:09 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
 <20261009-skilled-mature-bittern-2206fc@sudeepholla> <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
 <20261014-prudent-mini-duck-377cb6@sudeepholla>
In-Reply-To: <20261014-prudent-mini-duck-377cb6@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:59:58 +0100
X-Gm-Features: AclHuK-LQgnIpxOBv6YIR41I8lr76Fns1lvAAUTxZNI-80rsX3bNmiwX8o5xW2c
Message-ID: <CAPx+jO_BOwbKeRytBezm+piLhb8Z5N2eQO=LRwBQoSZ3kXOpwQ@mail.gmail.com>
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
X-Proofpoint-GUID: k7V6pO-Bn7060n7wtrm8doKFlZSvQhoi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfXwPenLsyDAouP
 nAMA/wRyJOKDyOBkOJs2zP0YBkxPr8N8YthOvlQHbZ1gU6lYsb9NElqPJKCgHJNtHPgL1Zj5/Ow
 myf/5F9/UHmFAv+8vJWhp5RkIMakj/I=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1d5bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=Fkqsunai0WhB3pQShDEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: k7V6pO-Bn7060n7wtrm8doKFlZSvQhoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX0AJpKu5qHtYQ
 pnph0IZ0Buc/ADujmu4HCi1/PQfVEP60uggKofBIHj1mYsGVi4xVMdLLoCNRZee8Kv1sYXPNBee
 3Xy1QgGeAmCf1bc1Nmn2Zw+jCU0Hg4kU9z8MNUp21oldXH7prXGl15HTH2nQI00+/kiVPI5xoyh
 knHTlNr2DW4K+hb8f2DzN5xcfE1gGfuVG1VTQ11AiDPP9vdurMBdE7bnLxquZSEgQdFZSCtvV6L
 jgGBIHUYlnr8Z/68zyLaO3sDT2OfO8AjQ7lED0ytYgfEKFdm0FYgkpaTgNtnz1C2x3y2R/DIbju
 8cjayi09JLrbZhDQ9jH3Kyho8ieX/FPBZ0mgOOcHxeKKMwi8/L/nrkH0yg7uAQwjQ8Uei52oRWx
 6jI6P3+vh1IKtLRMRceFwkY3dUQP3zXTm23Ze30hTy31wDX/rvknwJ0JW6o0xcT0EmOsVAwBcgS
 M7c0Du1kvB4s8KN8DMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280043

On Wed, Oct 14, 2026 at 9:12=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Tue, Oct 13, 2026 at 12:11:36PM +0200, Ulf Hansson wrote:
> > On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@kerne=
l.org> wrote:
> > >
> > > On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
>
> [...]
>
> > > > If that's the case, besides that the cluster PM domain topology mus=
t
> > > > be modelled accordingly, the display device should be hooked up to =
the
> > > > cluster PM domain it belongs to.
> > > >
> > >
> > > Ah, I thought that's the way the whole domain-idle was modelled as we
> > > started this OSI discussion a decade ago with an example of CPU clust=
ers
> > > sharing power domains with some other devices. I am surprised if that=
 is
> > > not the case already =F0=9F=99=81.
> >
> > It works fine today, I was just trying to explain how it works,
> > considering the use case that you brought up.
> >
>
> Ah OK, good to hear. For once, it sounded like that's not the case. My ba=
d.
>
> > >
> > > > Beyond that, it's the corresponding display driver that becomes
> > > > responsible for what should happen during system suspend. If the
> > > > screen needs to stay on it may need to call device_set_awake_path()
> > > > for the display device - unless it's a decision for user space that
> > > > can control the behaviour for the display device via its sysfs node=
.
> > > > If things are managed accordingly, genpd_finish_suspend() may decid=
e
> > > > to keep the corresponding PM domain powered on during system suspen=
d.
> > > >
> > >
> > > But the s2idle and s2ram anyways suspends all the devices, so they ne=
ed
> > > to vote in for the power domains to be turned off. If they are suppos=
ed
> > > to stay on, the system enters the state it can based on the other vot=
es.
> > >
> > > > The above said, $subject patch doesn't change any of this. It only
> > > > allows us to use more states (deeper), which are limited to system
> > > > suspend (s2idle).
> > > >
> > >
> > > Still not convinced, if all devices are plugged in to the power domai=
n
> > > hierarchy correctly and the domain-idle states represent or carries
> > > the entire system power domain topology, we shouldn't need this extra
> > > information. Having it make cause issues when it conflicts with the
> > > topology information IMO.
> >
> > No, it's still not sufficient to model the power domain hierarchy corre=
ctly.
> >
> > These "system states" are special since they require additional
> > coordination in FW/HW, to take into account votes not directly
> > controlled by Linux.
> >
>
> But if Linux doesn't control, some other entity would vote and until then
> the system shouldn't enter that state. Without knowing that it is system
> state, will the kernel be unable to choose that state as it hidden vote
> is invisible/not tracked ? I trying to understand why if Linux chooses
> that system level state as part of idle loop, the platform can't downgrad=
e
> if all the voting requirements are not met. I am struggling with that
> and want to make sure we are not working around a broken firmware.

For OSI, all the FW would be able to do is to return an error. But
that doesn't prevent Linux from trying the same idle state again and
again.

For PC mode, the FW should be able to downgrade the vote. Although,
from the cpuidle governor point of view that would be suboptimal as it
means that we will try to use an idle state that isn't really possible
to enter.

>
> Sorry for being pedantic, but some real example would help to understand
> it IMO.

I will coordinate with Maulik to try to share some examples.

>
> > I realize that the description in patch1 should be extended a bit to
> > explain this better. In principle, we can compare this with the PSCI
> > SYSTEM_SUSPEND support. The difference would be that PSCI
> > SYSTEM_SUSPEND is limited to support only one state, while the
> > $subject series would allow us to support multiple.
> >
>
> I understand that part. SYSTEM_SUSPEND is sort of platform co-ordinated
> once the requirement for entering is met.

Right! And I think that kind of explains the problem we are looking at
quite well.

These "system-states" are similar to how PSCI SYSTEM_SUSPEND works.
There is additional coordination needed in the FW to be able to enter
these states.

>
> > In regards to ACPI. I think this is as simple as comparing it with the
> > list of ACPI S-states.
> >
>
> I need to check if we use ACPI S-states via S2Idle which is the case with
> this patch set I assume.

Yes, this series enables the "system-states" to be used for S2Idle -
and prevents them from being used for the regular CPUIdle path.

Kind regards
Uffe
