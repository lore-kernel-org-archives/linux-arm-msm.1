Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C42474255
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548867; cv=pass; b=H0itVBwESwrP9sM8KydhDAQKhxSw0kzt9P2q2WIgqkYdfHR2zBKFTQ1JUQEUYuHEYJCxdHN7lsOdSg9YrDOk+n7+PQC+7B5uuRzRihzaD4sgHJUf5hbS7Ew/KKuf2zhg/w9AXaQsqSSeVxWTOykGXxY1osk9vGF9bzhrIXlYzB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548867; c=relaxed/simple;
	bh=AHnyE/VGGU+pB0Te00S4wwqczmz7s/0F+49HO35slqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Guln1l9/K/TJEgBqCSZVezfzq+/i97KeebvniUXfcgC717KhrWG32R2nwuTTDBUj9axVXOwfVy7kCRxyUlKp6VagL0DXZyCgKSQPFLuYemYKGjSUXrVrMGlCQs/4f4GjKSuz4+KSJ3f9pYZxezLdrgaOXbx32z5CajH4ltld1cI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jangk5cS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEgL++Oa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jangk5cS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEgL++Oa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbp8x3597943
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=; b=jangk5cS9zu/cD7m
	+j8n6wlVBBPd55ggNuStVgGcN5H6+La3N96Wq+k5/c4IfcXx7/+6n8PMugoo6F25
	rrnN7adv+gWMsaqjaSfN2VVR0z6L6aDxAgnDjfDiLjHKj743h2yhRr20cexZmkQH
	1H3yipWwBHwHCfKgC3Axd5qgIkEPo+3xDku5UkCw1bWCpJMLuILQYbVi1enadwEu
	y4GSF6VBnv/eNntq0L9o8ld+NoV2AGXNZVmagYGJGf4FVzrRxwqNAKzomKbNyjXs
	1XgWIkjwEKUbp/SbfXzqWthWNo79sbVck3rtoJEveDzA4WbowgXMWqslst0fXqjb
	isycRw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrmpx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:34:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso14653785ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786548859; cv=none;
        d=google.com; s=arc-20260327;
        b=ccAIpUzrwan9Mqv1JW/hoAKOJUwb6KFudfaB/cS0kEZQbwSltqfPAIw4eotxPlxGUz
         3PuLgyuDIL7owsupDUyWxIyFsLh5SiwYAZTInxf72FH+tRRwqeX+aJ3/AIb/Tw2JZK+L
         0JTR0E/zPI6k3lb7RYEK03FpmkwC/aMTBuqwpFSlXpabknV3OQjTNZGgrEDV63ZGSYE/
         bOGM5FhE0EZtreHzJpcglaj7jeCqZVj1biV/FzZv+u5DY0bsCK5kFsKpIAPrysRWhCG+
         lPjVyosPub8D9aI4xg1V3l/8GmJtTDTUH88Mg5yAAgzKGae+Nn75sZYqaM2DL+DNZV6L
         o2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=;
        fh=z4GYpIlPj2HLiGZUorcMc1fD1g5gQFyQdb8wlDPOULk=;
        b=VOnhI2EY+cHsabC4OQzr4/e4YB2XYrlEnCfCO7vQxwUVsn7I7cffflrpCrilALdIG5
         ent7fP+vLshXgLqrtzAB0XD7o1PMPhHFcKcwYiGLlyVgH7N4pmv7k1OniHI/ZEJxhMVi
         60YJuPztnJT3LHwdRWjE1S2NewS4tQ+sD8Eg3IM8Ns20rwYdz/F0QtXJurGCONTCb6o4
         FlYwaMPZChP++z9o9jjxwpy1t9MXXrPEOWU1gWyJES+oS+OkG1mXZKdv3MxsIX9ooGxu
         LW0Xv30z66ERfyjv3MxHEmZP8Lb4bx7McLpvh5t0KJ9PeMze2/PpTBObS0eQMtGw6FM/
         Ettg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786548859; x=1787153659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=;
        b=WEgL++OaOWLOVlOQuUHRN8UqvTlJMRvQ5S66NXHDmD2nGDsF0rYBD5I/ZVLqKYjplP
         gLlkmHGFdP8eB2XtNg3HYb47vq9gXQ5vqtlXJIv3vfglpDeZLXKapz9p/XKmflx4U86h
         pbDVms6eImU83jNbh40kAmy+H2EqHFvTlpVEDb43nqiZB4FyeJq1gc8G/vN9XlTurA/t
         v7FuMLEOfQN0G8swBEx3fXwzKSdur4pvskx73qT5nUuAWLf+x8XaCE1FAHVggflyoJcq
         WNVlK/ouFeEnuO0wwpNI9Md3ptyEflTmKwdGVZPuDQzkJhunwx7SQltRySiGAncjyEgL
         QVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548859; x=1787153659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=;
        b=ffYvBv2xhB6VP65L6m4Ovg5jPXYAeGm9UslqokLB2OaV5O4abKk04fh5qd8jiw/umn
         6K2ybSq1Zf8jxR5uhuQ2UT3keNWKP3I0I90+GtzMxD3Dc1JyGzt7gXTo7A7SJIATkd0t
         M2luYch3LPDMG4xfN/3z2hfIlMROJhEKwmQlk5V/7jpwtim+mT/af6+90xLHum8XSYdN
         NZIwzYIZ2OhGcOhPVnMhM1fqvpthwiqSzeBr1k+0IpfWxxqWm4eWkvPVlI0/X8Hbermz
         TRA+TxBA5SpAeEUL732nhESXndXTHQVSugZGXndykMqgTfmeEymimKhOVAVYZvzrG7J1
         7L3g==
X-Forwarded-Encrypted: i=1; AHgh+RokiYxrnivXUjFEqa1YUGFSzxW8J8h0jen1qSzz6ieLOeHjyuewzTnPKZT4SFiX7L4fwwL6EZ3y7LHXlfu3@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTUuXxUG+164UU6BtnCZS5V48QuyW7QDnOlyQHheeMuoQDlTs
	ZMMoMmUp7kZ3OOMo51w4xautib2xHS2pGIB8RnVt9/UK147Hn+EmCDJyYf3klVyVugIikwmOhMn
	QtzDKGfQwKkuQqXyXt0G/LMjqvuRpVpWFPL5drBYV/LpJ4bnB/WCTI43TyE4NxFwtBjAv8QwkGq
	E55x8t7V3atNjuYKV+AU0/KHTNqyeWXVKP7t/6V3iHM1g=
X-Gm-Gg: AR+sD11QuX2WbDJ/OcEVJtp0AZrwbvWkrI5iWVqY4IvkCsByxeJGrWIE8RsfUgfEtLG
	ft4uvi76nay2fDVUIonWgfm0pNVNesAGbjFV9A88sLf+bOaR0pPybnyJDsSG9Y13RK85JwZvAdZ
	v2MiJYGrsV6rMEqgzkXy2VL1rpspcxZc2jPcBxYCztIBJgvCS+1yb4jVzVmg==
X-Received: by 2002:a17:902:da84:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2d3455dc469mr66326985ad.18.1786548858601;
        Wed, 12 Aug 2026 08:34:18 -0700 (PDT)
X-Received: by 2002:a17:902:da84:b0:2ca:6c8:abde with SMTP id
 d9443c01a7336-2d3455dc469mr66326205ad.18.1786548858148; Wed, 12 Aug 2026
 08:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com> <20260811-domain_off_ss3-v1-1-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-1-6a0a0fc023f5@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 17:34:06 +0200
X-Gm-Features: AUfX_myi2ZUJDsHfRryrtjfBgvDNohz0v5dvMDAblTITfqOs1ilaSpnA82VV-8A
Message-ID: <CAPx+jO_Z6woSz_ywFjNLhvEgYyBQR89+trK+6kL6Q1aPxsWtwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Start CPU-cluster pmdomain OFF when
 OSI is used
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: PlUvGkS_nU_h8mZ7eJLGcVfjO1_EmjmF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfXzj/cEO40ghhi
 GA+r8gQsF+I6CA+hC3zVWP2GwV9Rw30OqeSaGaHT5hdQA65tUt49u1PdAndWykFwMp9gRRsJhC0
 dCpIKexXHfQ4HMv65QO9RQ1htBaNW14=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX44rBqPRyVirO
 XexXJ4FdtyP1Q7dZlFACx9P5U+KIRREjHidEpjzEDM3G0KbFPJJlQjjK7L9qJDSNEEGCKMTE6QQ
 XFXVlmfly2xyLu0+xFJhv480RVCSr89xWWhZbN6yJ9cjDBR8+/95Y/Jqi69X/27LfC3/epTu1fS
 Kkny0PiI4pW3BH40veSNr9RQLIyi266EimsnEgKNx2RISYwEXYltxDDoD+pf8DDRJXZ7NpF0UQU
 JKghMaHfIXiC+RRD7RVeP5Z+kxVhbzGwo3ZBEEt2Qqk1Wnhy5Gkyjqh+uRCgR9DmMqJX9fzgVKq
 NlWLBcynC6lQavoieDPifnHLVfkpUxVx18IXnnwQ+pTRuLp1eF87BJO/MNI4bJox/kmplY2qR0l
 p+I+E6ldmtsam/ncodKvx5lCYPR7sukXOQo8o4e2AC4nDsgxaV3hjUR+X7PTe/bOllCWyr0RQ50
 A3fQCltNukA/Jj3Y//g==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c927b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=rNF3hdfX8ybiPTv_IDwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: PlUvGkS_nU_h8mZ7eJLGcVfjO1_EmjmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120126

On Tue, Aug 11, 2026 at 7:50=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:
>
> psci_pd_init() always calls pm_genpd_init() with is_off=3Dfalse, so a
> CPU-cluster pmdomain is marked ON at creation regardless of whether any
> CPU has actually powered it on yet. The pmdomain's own status tracking
> (and the power-on notifier chain fired from _genpd_power_on()) is
> therefore wrong from the outset for OSI mode.
>
> A concrete example: hamoa has 3 CPU clusters, each with 4 CPUs, under a
> single parent system-level pmdomain. Passing "maxcpus=3D4" on the kernel
> command line limits boot to the first 4 CPUs, so only cluster0 is ever
> actually powered on. Without this fix, cluster1 and cluster2 are still
> marked ON at creation regardless, since is_off is always false. Because
> none of their CPUs ever come online, neither dt_idle_attach_cpu() nor
> psci_idle_cpuhp_up() ever fires for them, so nothing subsequently

Why isn't dt_idle_attach_cpu() called for them?

If we pass "maxcpus=3D4" on the kernel command line, the
cpu_present_mask should still contain all CPUs which cpuidle-psci uses
when attaching CPU devices to their respective CPU PM domain. Or maybe
I am wrong here?

> drives those two domains to OFF - they stay marked ON for as long as
> the system runs. When cluster0's CPUs go idle and its pmdomain is
> powered off, the parent system-level pmdomain still sees cluster1 and
> cluster2 as ON and therefore never selects a system-level idle state,
> even though no CPU in those two clusters ever executed.

Doesn't genpd_provider_sync_state() get called for these domains,
allowing them to be turned off?

>
> Starting the domain OFF is safe under OSI:
>
>  - For CPUs already online by the time this driver probes,
>    dt_idle_attach_cpu() explicitly checks cpu_online() and calls
>    pm_runtime_get_sync() on the CPU's attach device, which resolves to
>    this same pmdomain and drives a real power-on immediately. This runs
>    from psci_cpuidle_probe(), a device_initcall, strictly after
>    psci_idle_init_domains()'s core_initcall has already created and
>    marked off every pmdomain, so there is no window where an online
>    CPU's domain is left off with nothing left to turn it on.
>
>  - For CPUs that come online later, psci_idle_cpuhp_up() (registered
>    via cpuhp_setup_state_nocalls(), which never invokes the callback
>    for already-online CPUs at registration time) powers the domain on
>    through the normal cpuhp AP_ONLINE path.
>
> Gate this on use_osi rather than applying it unconditionally: in
> non-OSI mode psci_pd_init() sets GENPD_FLAG_ALWAYS_ON, which
> independently blocks genpd_power_off() regardless of is_off, so the
> domain can never really be off there and marking it is_off=3Dtrue would
> be misleading noise with no effect.
>
> Fixes: a65a397f2451 ("cpuidle: psci: Add support for PM domains by using =
genpd")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Kind regards
Uffe

> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..fab9de648b17 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -78,7 +78,19 @@ static int psci_pd_init(struct device_node *np, bool u=
se_osi)
>         /* Use governor for CPU PM domains if it has some states to manag=
e. */
>         pd_gov =3D pd->states ? &pm_domain_cpu_gov : NULL;
>
> -       ret =3D pm_genpd_init(pd, pd_gov, false);
> +       /*
> +        * Start the domain in the OFF state when OSI is in use, so that
> +        * genpd's own status tracking (and its power-on notifier chain)
> +        * reflects reality from the outset instead of reporting ON befor=
e
> +        * any CPU in the domain has actually requested it. This is safe:
> +        * dt_idle_attach_cpu() runtime-resumes the domain for every CPU
> +        * that is already online by the time this driver probes, and the
> +        * PSCI cpuidle cpuhp callbacks power it on/off for CPUs that com=
e
> +        * online/offline afterwards. When OSI isn't in use, GENPD_FLAG_A=
LWAYS_ON
> +        * above keeps the domain powered regardless of is_off, so this h=
as
> +        * no effect there.
> +        */
> +       ret =3D pm_genpd_init(pd, pd_gov, use_osi);
>         if (ret)
>                 goto free_pd_prov;
>
>
> --
> 2.43.0
>
