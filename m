Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BA438014
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614719; cv=pass; b=EvCo+0tDyUKx97H/qqRiC5UfceqF46eAZbNHyQG9iAGR1QWwJY3nXs+FbHA7VJA9FuUjM0ZiEZsiXlhRGOEX3JqWg15uLbubzWIVzmlg57GThzbglTec0YqXcCVSGe39l2yrubDwOf310p1F5DzC9sUsnch02nKHlOKzfYtnvZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614719; c=relaxed/simple;
	bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpuAqQYmz1vDJtmBf2uZtWdp6ET2afHgMVQeeeb0pF+gDiDnxKFm/VFWKCPWtJ+jcXpq5SEiSqDGsTDc83g9SZiRBCzMF2ksVfxbgYs8zzjMYndB04/YzbWrw+nqbss7M18F1wSoTrXlUt6BNJGDXTtU3YSAiR/HBS0WqDUdaeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFUCq942; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUAwQvSR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFUCq942";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUAwQvSR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D91ti22849509
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=; b=UFUCq942nrPbctuG
	znqVroq90ZHi1z6V+1XxkjtfazzjyNXp2Y5VDZ2/qipRLuIKKF2bhPW20H7MJyJn
	ldj7zeVIUXvmcnOP6NqpwPSHfc/gOTnu0k3wh6zQ37txwhhZhyDi1+4xp5s9E5EP
	J89+jJvxeqB+yci1ay4nwuxkLbFEn0PiNs3HFW9pX2biFiMB5Tc9UFn+eojAwBZh
	20AIDG9+031yQBtGkVM5WV9lJP/wToh0JbZCeSDF7VH2Wj0oQ2CIkar/zmxa6vBE
	QSeQfgHKFd9Rjx5CtCeAgvmgh7RFgWC+xDJRgdnEHwcCl+UXNb1Cw0kdOi+lMxIU
	WVBh8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5gxyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:51:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so8574235ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 02:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786614716; cv=none;
        d=google.com; s=arc-20260327;
        b=kwal4JbRumY9rdyjnR/5pHRMPQGYuCKX7kyRlZ4fJaON3Tky5djWj5NS2mcEZVN8It
         iXbt1+Rf21YhEcQFeCPqcS2jsP1cTYXy2zcI1x6BsjXjL6vy7bUCDTl0riZNdAj4Uj3z
         s5iN67/5VorNdkNsipSgUHU3KOiSV3i8tNs8zeUBePYRTVnwA4QIb62/FB2SoU4uGtqC
         Pv8TZ/XLfINrc5Wj2FpdISMMnkmd0R5PBGu8YU9mMsUZinZ3VYJmUeygzTmvkoNtT4nh
         7wHoP6o2RI7IaEXdCJZxJpcL3gQqx6jQr7ZIypH44O8SyNzmvGGE9GJwb5LpNcX2K/f+
         2CBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
        fh=YljiuBXSON9DBsR12spwttQMNVIkMHEZGkep1PvlM30=;
        b=BzOVq8H+xQ72umnNbRys2BiARF+2DkDOalvUN2ro19n13LWRZB3bFo0ETcqClkdvaW
         5Dljo8JwSiHItCnzo3WlRyt6KBnfP7nIlPRm89AoHeTEK+G9q0RqPPKnLiKzn8BfaDh7
         nojNt1EdAa3MnYOb20K5m/MBk5OwY1ueBqrHzsFY2L6sxvGuKUFzDBWc0mxJ3A0oU3wL
         rIvs2zWkXnO0zQqQmDBdBBQGA+A6RyRRuDJu52/iEi21vN6USx/2XqLBVQjsZsQM/AI4
         oM0invG+5FRt2ylGPLFUbjURE/5T3ZZQqft4ailXhEPQ6ujjkdk3rT6GcapMKopvzl61
         bC1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786614716; x=1787219516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
        b=AUAwQvSRTfXDusTwV7EaUVE8EuqK8HaK2UHm+OpHhi4uNUkQ5TpWFd5eGAMunjXFCn
         u3AYmuY2uCEczp/CLOqcEKKX66+OjutnC12fACR2Sloyz4KLxJwLfW3vQbSaRjtRRIVE
         w/tbg93ojxJNYKbtWMvwbMdeRb5gEsqNa2GW95h4FhG6GRMvg53asaNKPPnSyXIYtZwU
         bHal9WbK0xbM7X3QlnzROsHujwRfjIO1qKL9bTI3GX0AMGfxoVIiTn4ZPh+bY0Z5Vrsy
         JesnwRNpHZipUp2vlgAWcMA/VHs6xMm71ggzK6qTamaClyKomm0z4hLjVxvy2+OKH+ED
         9QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614716; x=1787219516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fL0Oyp88GwG7kNOMBo/yujFF8wNjRPW6Iy2PxK6WeBs=;
        b=Hj2p2CuToncmpTVL7TZzvx5kt/DHivPiN65G66Xr5nSDh7MtLokrD0MNlJ1mAvjsxO
         4bFQq2CTEU3Qji4pCyWR0KtPDdk+vk3q01UfkvH8izEQDsrlslfxtxpg5v2PdpygwUWt
         Q4n7QKTfW8aKJCDrq7ygukffHLlTevQYFIhAVamIvFS2W3wyzthdadRC5nFLVhXda4ku
         YVIOPj5pJTTTDfP1wyD51bB8aJCeoEw4YU6a1NnuNKPOzekpDpj91dOfN/b8mEKhbIpz
         xnO6cc06vZbFAfGO4UXcZZmm8Od4b+1mEDP7pKSSdtiH0hwI4dbNQgvo1TSfZdQIxKng
         HOnw==
X-Forwarded-Encrypted: i=1; AHgh+RrCrXuzSt39PRhKIrwO56+oYDHbYxSJcLjQWajCMg94pVP9PXMmjAFD1n8Q5zj99g1an1Ocmr6hrVfTLGE/@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDeLve9ooMtpb1UzCdoxQqCCOzDjqi3chjKl3Ed+vr1fjPKjn
	3uD5LRrSdTYoccKIO+0PE+jy4yCSj/3Jeu7+T2W0rkWjBE5zDiDrrbVHf+kIsVVWNR6XV9lcAmN
	DvRB00lcxKvQW70ZdAP2v+7nYC5lAWLO/5vD7AOo7R2ImvVT9HrhinkwNNI+xBLQMEBmfW5xgzY
	7g3P9Jz8BmRoIzva9tAwswxVBHuI9yN35j9U83q8dBKeE=
X-Gm-Gg: AR+sD12Vyjnam7vR2LfOqA/v7csPCD8VVSD9/M3z4ASYOr/MZz7PruCfcXc9sGM69cO
	hRhcdNkhjtuDEnw9/zDWWpM1Pnn6NWsIfsMZXZXsSEtRiOLmFt26t3u4ZmnFL9Ksk3X1JXFO2hT
	46u8Zw8KJ1Jymma6c7s3GcnMfYGaF8+uiyEsmErFRKYuYLH2ZrxkH5Mamdxg==
X-Received: by 2002:a17:902:d4c7:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d37e833aa5mr44485615ad.13.1786614716134;
        Thu, 13 Aug 2026 02:51:56 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2c9:a5e9:c26e with SMTP id
 d9443c01a7336-2d37e833aa5mr44485025ad.13.1786614715579; Thu, 13 Aug 2026
 02:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla> <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
 <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com> <20260723-light-aardwolf-of-swiftness-1c46ea@sudeepholla>
In-Reply-To: <20260723-light-aardwolf-of-swiftness-1c46ea@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 11:51:42 +0200
X-Gm-Features: AUfX_mzzSEQffGx9CifuPbFV5RxAKHUylsQq-VNyHO84epcOG5G-e9RJOaAN9Os
Message-ID: <CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Cc: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>, ulfh@kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2OCBTYWx0ZWRfX2OeNS8W+l4Wp
 ysiWlIm9hsxCof+vNpf8ezLXrCaAxsSUDV+hz1ezzQ/K4/wU7IE9/r7WAiMESQi0TxN2du0T/ID
 4KJe/cQvk69V40KHOPzO7nmbPti/6UM=
X-Proofpoint-GUID: e0zAalyhYAUqYHBoHqyHlDNt9gienl-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2OCBTYWx0ZWRfX0y3VtbrY+MpF
 GCvWg4KtxDawRz4DS4SWhl4kipOWvmjpbyvTlvV0e+HL5MJzjbYVPDZ4clvHOBnYzM1aW/I+cRi
 13NMxtoHwxWwgUH6oHBMQTe3JCklRUrwQpDV49I16cGs7HGlxqw2o8s1XWzwV9OgvqPMhQzdWJW
 Gf0yjyQf1QvU15XA027JONdOLTAKrsD5I6GZLYG0ndYbqW/D5JUdOnDFskH//5Ub4Af3XNAKXuZ
 9vfcR/qUVh6wRRTmfpnkrHy1clFQBTzNsBPY6JnIcSegAmTLDOWgcO/U6L+f8+JxrihGIWaRiT0
 vNhk2Kekra1ygd0isG1mohZGlbVHbSsemqxJXEp+zHgp3NLETMtynGZfzUYb7RXduowaPIeymGp
 TBU4xK06V4Egy2ugNhIFCmYM1NbQ71T/vQxThXP5gQ5yyHm4yLsMH8vdHtC59O3Np286RJetkNe
 qUdOD8yozKTpMyi54VA==
X-Proofpoint-ORIG-GUID: e0zAalyhYAUqYHBoHqyHlDNt9gienl-c
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7d93bc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=c5Fe1Fe05ZhRYI1i2R0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130068

+ linux-pm

On Thu, Jul 23, 2026 at 3:45=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Mon, May 25, 2026 at 06:47:27PM +0530, Maulik Shah (mkshah) wrote:
> >
> >
> > On 12/19/2025 3:51 PM, Sudeep Holla wrote:
> > > On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
> > >>
> > >>
> > >> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
> > >>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> > >>>> This patch series adds support for CoreSight components local to C=
PU clusters,
> > >>>> including funnel, replicator, and TMC, which reside within CPU clu=
ster power
> > >>>> domains. These components require special handling due to power do=
main
> > >>>> constraints.
> > >>>>
> > >>>
> > >>> Could you clarify why PSCI-based power domains associated with clus=
ters in
> > >>> domain-idle-states cannot address these requirements, given that PS=
CI CPU-idle
> > >>> OSI mode was originally intended to support them? My understanding =
of this
> > >>> patch series is that OSI mode is unable to do so, which, if accurat=
e, appears
> > >>> to be a flaw that should be corrected.
> > >>
> > >> It is due to the particular characteristics of the CPU cluster power
> > >> domain.Runtime PM for CPU devices works little different, it is most=
ly used
> > >> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genp=
d
> > >> framework to manage the last CPU handling in cluster.
> > >
> > > That is indeed the intended design. Could you clarify which specific
> > > characteristics differentiate it here?
> >
> > Sorry for coming very late on this.
> >
> > This series is intended to handle coresight components which resides wi=
thin CPU cluster.
> > For the cases where cluster is in deepest idle low power mode or all CP=
Us belonging to cluster
> > are hotplugged off, access to coresight components can not be done.
> >
>
> Sure, but the question is why is the cluster entering deepest idle state =
if
> coresight is in use ?
>
> > The implementation tried to address in two parts,
> > 1. Using cluster power-domain to know which coresight component belongs=
 to which cluster/CPUs
>
> OK
>
> > 2. Schedule the task on intended cluster's CPU to make sure the CPU (an=
d cluster) power is
> > ON while coresight component of the cluster is being accessed (using sm=
p_call_function_single()).
> >
>
> Why, just block any cluster entering deeper idle state when corresponding
> coresight component is in use. This should be taken care automatically.
>
> > The use of power-domains in (1) will limit this to PSCI OS-Initiated mo=
de,
>
> Yes
>
> > to have this support on PSCI Platform-Coordinated mode too, probably in=
stead of power-domains,
> > cpu-maps (which also defines the clusters) from device tree is a better=
 choice which will give
> > the information on which CPU belongs to which cluster.
> >
>
> No, let the platform deal with it. And the whole OSI mode was pushed givi=
ng
> such use-case as example and now you are telling you want to solve the pr=
oblem
> for PC mode. I am confused. Just use OSI.
>
> > (2) ensured that scheduling happened on intended CPU and while the acce=
ss is in progress, CPU (and
> > cluster) will not enter power down in between.
> >
>
> No, just block entering that state in OS(for OSI) and in the platform(for=
 PC)
>
> > >
> > >> It doesn=E2=80=99t really send IPI to wakeup CPU device (It don=E2=
=80=99t have
> > >> .power_on/.power_off) callback implemented which gets invoked from
> > >> .runtime_resume callback. This behavior is aligned with the upstream=
 Kernel.
> > >>
> > >
> > > I am quite lost here. Why is it necessary to wake up the CPU? If I un=
derstand
> > > correctly, all of this complexity is meant to ensure that the cluster=
 power
> > > domain is enabled before any of the funnel registers are accessed. Is=
 that
> > > correct?
> >
> > Yes, This is to ensure that CPU (and cluster) power is ON while coresig=
ht components
> > for same cluster are being accessed.
> >
>
> Or just don't turn off cluster if coresight is enabled and in use.
>
> > >
> > > If so, and if the cluster domains are already defined as the power do=
mains for
> > > these funnel devices, then they should be requested to power on autom=
atically
> > > before any register access occurs. Is that not the case?
> >
> > Cluster power-domains will be only available for PSCI OS-initiated mode=
 but also
> > will not help for cases where all CPUs in cluster are hotplugged off as=
 hotplugs are
> > platform coordinated.
> >
>
> See above, let platform deal with it. It is called PC for that reason.

I agree. If PC mode is used, then the FW should manage this through
another channel, like SCMI for example.

>
> > After discussion with our HW team to automatically request power on for=
 coresight
> > component GPR [1] can be used but they seems not working as intended on=
 the existing
> > SoCs and will be available on next generation SoC.
> >
> > [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overvi=
ew/Granular-Power-Requestor
> >
>
> You are looking at it from wrong side as you allowed cluster to power dow=
n
> when the coresight in the cluster power domain was still in use, right ?

This coresight part that is about to be configured for profiling
belongs to one CPU cluster. The current CPU we are running on when
starting the configuration, belongs to another cluster.

Hence, the cluster that contains the CPU for profiling may be turned
off. See more below.

>
> > >
> > > What am I missing in this reasoning?
> > >
> > > The only explanation I can see is that the firmware does not properly=
 honor
> > > power-domain requests coming directly from the OS. I believe that may=
 be the
> > > case, but I would be glad to be proven wrong.
> > >
> >
> > please see below comment for more details, This seems not a firmware is=
sue.
> >
> > >>>
> > >>>> Unlike system-level CoreSight devices, these components share the =
CPU cluster's
> > >>>> power domain. When the cluster enters low-power mode (LPM), their =
registers
> > >>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring =
the cluster
> > >>>> out of LPM, making standard register access unreliable.
> > >>>>
> > >>>
> > >>> Are these devices the only ones on the system that are uniquely bou=
nd to
> > >>> cluster-level power domains? If not, what additional devices share =
this
> > >>> dependency so that we can understand how they are managed in compar=
ison?
> > >>>
> > >>
> > >> Yes, devices like ETM and TRBE also share this power domain and acce=
ss constraint.
> > >> Their drivers naturally handle enablement/disablement on the specifi=
c CPU they
> > >> belong to (e.g., via hotplug callbacks or existing smp_call_function=
 paths).
> > >
> > > I understand many things are possible to implement, but the key quest=
ion
> > > remains: why doesn=E2=80=99t the existing OSI mechanism - added speci=
fically to cover
> > > cases like this solve the problem today?
> > >
> > > Especially on platforms with OSI enabled, what concrete limitation fo=
rces us
> > > into this additional =E2=80=9Cwake-up=E2=80=9D path instead of relyin=
g on OSI to manage the
> > > dependency/power sequencing?
> >
> > + Ulf in loop.
> >
> > Current platforms with OSI enabled, Linux PSCI do not implement the pow=
er_on/power_off
> > requests, as far as i know, runtime PM was never meant to implement thi=
s part and
> > pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is onl=
y used to convey
> > to cluster power domains about a child CPU/ sub domain being on after i=
t has already
> > been landed in Linux.
> >
>
> When a shared power domain has one of the consumer active, why is the pow=
er
> domain being turned off. OSI is supposed to handle that, I still don't
> understand what am I missing ?
>
> > The standalone invoke of pm_runtime_get_sync() from another CPU do not =
really turn on/get
> > the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug pat=
hs to enter/exit
> > low power mode.

This is the main problem!

Calling pm_runtime_get_sync() on a device, doesn't necessarily power
on the CPU PM domain (cluster) it belongs to.

At the moment pm_runtime_get_sync(), for CPU PM domains, only
guarantees that an already powered-on CPU PM domain stays powered on
if it's already on.

I am working on a patch to fix this in a generic way, I will keep you poste=
d.

[...]

Kind regards
Uffe
