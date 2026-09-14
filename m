Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B53B14D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385351; cv=pass; b=DojKgs4D5rO+A8f8C06kgtIVw48n1WVMyPnhqvZSrgMw82IpRx6kzJgxRxuRKvFBO4Ia6co4XTVRf+xxNy59yYmbO7G/yAkNf0BCYH8C52tA9Emxaf22i99rkKIx22YAVTB30bJ4v7V13wK1hJfNVWFvWDhEYVPnqU389vbvgpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385351; c=relaxed/simple;
	bh=sESUPPWq/CMboQ5PQmmk2MKfkkFYJhL7/gKSrRe1IkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONFvNowm5YWCyx3wYtKKQ9X66YKIo374qt0eNxCg6igzsacQcxpR6qnOhLS07P7DFtyCnAXVdAqdcQ2CYd6C6Le0tRju3LvmzHRrlGATmSgKIDM3Jfz4e+B+zzYJuK3S3lAkJPAl7qNIFo4oSs5ip+WF8h8P3E8EahmzL6y+oII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caRqaS2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD6oI3Qi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caRqaS2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD6oI3Qi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmAVC377879
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=; b=caRqaS2AxVs7aeG1
	acaSpuQ2wtaqMV2Jcb1gFqnQboOUQA7+5b2IPrpYgQnnX9Zr4dkQkPJI0QaKMFnp
	DVhFHKvbuIhTAG3fC0NtC1mHIvH9NredhDP+UHMr63HmwvySYOdpXrRn7GQgwWPx
	4u14ckoPSnF26FkPNgKnP6qJB6JwIkRjd32bfjr97v6JL1W2LAVnasrkrtZzkVx4
	0sbWMGZhSmUVBgXPS4f6iAEXOc2A+pahveMCJo6mfcphbmhkrReAyjcSJNKPzWBm
	8dQ4pH6RbkAwsHkAjh0Jey6w80HXZJTpkdTydOXKsUNG/F7uYu7oOxQZm3vlaNqW
	gJhHog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8fbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:29:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so4058178a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385345; cv=none;
        d=google.com; s=arc-20260327;
        b=HptdTuayr+sH5FP8EodWE5oycUPve6mxQiPrSvN7PyqRiaUozzz6LF0ZLevbJZWUBf
         j8cUSCCXN5iQNoLNiKqT0TIWWjEjEJFg6SyN49FMgZEVNUK4aO99PAHP4wa3peexTV/5
         E2eW4rD2wEXajfEA9tnLQoJhT6sP5Izs+r/HgPPJjlvYDBkuo3xx4wJIwFAh16fmQiJC
         qeZJ33vLyC6FItSYwsnTxd8KHqZkiOmrTIro78v4nTwkQ6udmw+5NdQ/I8DdyJoO5H6l
         hmjizTvN4FtT4+nT9C6pcFLrCt1jWYQadUMJZmqwQQJrM8RuAL9BuUlYj4g/xOYCjqB7
         8Rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        fh=7eP/HbOeHMesiAnIyNyVKD9ATusmepWByV0711xiUHc=;
        b=V52cDvPSxlPoE5CBJCWASxEnN/RCYwCPSwS77qLpRyy5UNtSyuHng/pwDm7+Jk8QFv
         6ei5QJ+hCqF2JvwlvchLqKr02i4OuIkoUBu/POOGVZFsOnaCKcxIvQqd3ZqP/5nuztnQ
         1tiKdjMfL+kEFJi1WRLwGy5KUO6+HuL0EqvZBKwCFLdNMbCwk0TFYPX00TGBjcR7kj2m
         Kz7j/dAUj1daNksxDMy08MUVKy3Ro8dFmJVAHPhi8C3u1vPIXYUfT+nhRnhTfQXCqKaR
         hFCyYKCpOpwsV2kiZ2LVLfLU+gp4v06JJpxqx9/8kEXZxwAKVFBVczHu690Xfir9sZfr
         OLaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385345; x=1789990145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        b=YD6oI3Qi3gGlDyV8OJnyOo6COs2tfUMcwjjTCdlHdirYdWJzVpTLLjhVHNXKtyHfvO
         ItHmNw3R/nWMaqgQubJwa4uqJiYJvgv11yz7uzqU6QCU/uGeLpWREUtS/dXSKFK2OP4l
         RhrphuojRzL48T/oYvNqdIWmOODpE7k41ujfxprHdcP9Ud3BhRdq3yTQ0GKqoKc6Np3E
         +fCAcYVBPyNb0iUKr22Wrk5YjCX63ecJsrtCteogKp91m+soHao4cuyLq6OqGFWzGFOE
         HQ4uRl/ZudnP8xui3ISSevp2NLo4jCSztd2D9GyyG+DNEGR4YVjMnpR5FglG3Xcbc9FR
         xoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385345; x=1789990145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        b=YO0c8OiL7vBkvJ1nfoJZLpPsT5sdEfx3wQGB08Qchwh0hXkexon00nGJ8a4PRJVhQG
         ExBIE16L2iW1F81WsDhwLNvVY95ymacz2CUyBUknuzPLx7l5R9aMGS+1XBwfpirdV6gd
         pQtZxTU/XKLiuV+q+hAkzUJfknKzq9E7ox6WFn6trnvskc3ClS5M27HE6Vvuh98m4KhC
         kMUGxo8FPKpxgbaAT2wa3ITYsnoFywsPs4XhS7KCg8GaXVOD6jmA7heNmcDz2PDlErwt
         VpKz+eLiqU2z0Q3WJY4931+B3/OW+WCIuUNKQp4M6vpIsQxvFFld3ZyUGfZOZbjC994v
         O2rw==
X-Forwarded-Encrypted: i=1; AKwUvBzgmIX2gfsCCdF5njO1LeZytVj96YPwaRsCUJzN0iG2X1OsaXoX2EObBeie0SSQX+pXhd4hdkTMgMRBvsRn@vger.kernel.org
X-Gm-Message-State: AFuF++nOrbT9s0CGuneLKUQmn+JXHYlr/J1vSuiM+J9ugBXr0N1e/gl7
	JZT2IUSmGVFb6vDKxE+TQirOKnevfytwHXzUOMt7Ww9bpPrbWufj3hit90IfWtp33olG6h73NsU
	Ark+/BinTReL122sZ5+eF/cCNR3uXz7Y5djGnIrdWzpBOxErNEat4Riu7Skis00Mgjz8KJUdOTy
	xs9Y7iszPLHY6NGdUsoivfSgFinJTTw9ZMcLIYFktnqOs=
X-Gm-Gg: AYBFou1NMQaSTQziswKdBICgBnXbEMankkb3nYR9z1aFUcvhxdeDNBN2Zfyb9oTSb8l
	W287BZc0otT8A1ZmKfs78oWOzMT/K3sMP4kA4B2/U5Fl3d1EKrxcS0gp/tvW5AX6jbkGz3do1ci
	B6dfpwY76f27kOj1UhrC3lro1Tj1Vj1lC7y5SjrcJaxX8Vx3QjKQo0IAcpwg==
X-Received: by 2002:a05:6a20:ce49:b0:3d0:cc29:ff64 with SMTP id adf61e73a8af0-3db40642804mr5427118637.15.1789385345388;
        Mon, 14 Sep 2026 04:29:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce49:b0:3d0:cc29:ff64 with SMTP id
 adf61e73a8af0-3db40642804mr5427033637.15.1789385344914; Mon, 14 Sep 2026
 04:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com> <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
In-Reply-To: <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:28:54 +0200
X-Gm-Features: AcwNN1WlCy19af4Kdfv9qzAUmpjAMUrSlWlur374POXIbZWJybPNGsXjpQRAkBg
Message-ID: <CAPx+jO9P=7i48OAjCZTRbdKgPSLvyKjXW+z3sRcNExSc3-Zd6Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MyBTYWx0ZWRfXyY6XKW0yv8ns
 /65UDQM2SIaOC3/TFHjgTUtzLffLqz+48MhBkfw2MxOfEzmLcLTR6JRAqvn2BXgav8vpQs9t0zP
 rD/mh7sDZWzFExdErhB9YCnisA7FfDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MyBTYWx0ZWRfX6gMBc8/FMnJ6
 IFBT7RojQ3jQrhzUJosBLRiGXwrE1HBwWdDeEqBJ2EMWPMm/m0OwuTENimh08+SBJKSkxICubEy
 gUG9om+vhAK+esN5i3FnxraVZ1R39zK9DWOnSlBhuovy5sPyau2SmLw+7D4yviYKVBhH7TbO1DD
 sSL0a/AoYhglwqSPzMy4AepjEiNnj8Az0RF5w+yEGQPhjia7jcCOUOG8gDfRlSMqopGlPT4AAzf
 rwcAl8+bfmFWPH5FHKS3pR3RjAUhy39wCvygmIFX+twmcp8BZVDkTyK431neZLJiBvRoZXU+JAA
 OeopveHpI6/ryz82vvXv93pMxOimVVNQN70ZpM5AWfoX13m2TxPzWT1Jh0rD317kOuDrzqPBmTz
 LtJmIlY42mxUhze3A0o/khCi3c2m7OKX341jFNMIV9N0o4t59v+kas5kR64TnUbOuMP/+mM9tWg
 T3j4iFAFHY9AdBEuEDw==
X-Proofpoint-GUID: d8l4Je_EniuBYAetpKcY1T_5qlMzxpUI
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7da82 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=rXashWC7mhQ_VnoTN34A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: d8l4Je_EniuBYAetpKcY1T_5qlMzxpUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140163

On Fri, Sep 11, 2026 at 6:34=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> On 07-09-2026 16:46, Ulf Hansson wrote:
> > At the point when the PM domain and the topology are registered through=
 the
> > genpd subsystem, it's not really known whether corresponding CPUs are
> > online and thus if the PM domain should be initialized as powered on or
> > not. Instead this information becomes available when the CPU devices ge=
ts
> > attached to their respective PM domain through dt_idle_attach_cpu().
> >
> > This is a problem when using PSCI OS-initiated mode, as we may end up w=
ith
> > a PM domain that has the genpd's status indicating it to be powered on,
> > while it in fact may not be the case. In the less severe scenario, this
> > leads to selecting a shallower domain idle state for the PM domain than
> > necessary. A more critical problem is when a non-CPU device shares the =
PM
> > domain, leading to their corresponding drivers not being able to trust =
the
> > status of it.
> >
> > Let's fix these problems by initializing the state for the genpd's to b=
e
> > powered off and in the deepest possible domain idle state, when using
> > OS-initiated mode. The support for ->sync_state() is maintained by sett=
ing
> > the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> >
> > Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc0=
23f5@oss.qualcomm.com/
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v3:
> >       - None.
> > Changes in v2:
> >       - Fix a bug in the call to pm_genpd_init().
> >
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index b9e4ad7d43a3..4d8c63d329c2 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool =
use_osi)
> >        */
> >       if (use_osi) {
> >               pd->power_off =3D psci_pd_power_off;
> > -             pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> > +             pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWE=
R_UNKNOWN;
> > +             pd->state_idx =3D pd->state_count ? pd->state_count - 1 :=
 0;
> >               if (IS_ENABLED(CONFIG_PREEMPT_RT))
> >                       pd->flags |=3D GENPD_FLAG_RPM_ALWAYS_ON;
> >       } else {
> > @@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool =
use_osi)
> >       /* Use governor for CPU PM domains if it has some states to manag=
e. */
> >       pd_gov =3D pd->states ? &pm_domain_cpu_gov : NULL;
> >
> > -     ret =3D pm_genpd_init(pd, pd_gov, false);
> > +     ret =3D pm_genpd_init(pd, pd_gov, use_osi);
>
> If CONFIG_PREEMPT_RT=3Dy,
>
> psci_pd_init(use_osi=3Dtrue)
>   -> sets GENPD_FLAG_POWER_UNKNOWN
>   -> sets GENPD_FLAG_RPM_ALWAYS_ON
>   -> pm_genpd_init(..., is_off=3Dtrue)
>   -> genpd->status =3D GENPD_STATE_OFF
>   -> RPM_ALWAYS_ON + OFF is rejected (pmdomain/core.c: pm_genpd_init()
>                                       rejects an RPM_ALWAYS_ON domain who=
se initial state is OFF)
>   -> return -EINVAL
>
> Therefore, on a PREEMPT_RT platform using OSI and hierarchical PSCI domai=
ns, psci_cpuidle_domain_probe()
> should fail while initializing the first domain. The genpd providers are =
then unavailable, so
> dt_idle_attach_cpu() fails during PSCI cpuidle initialization and the dri=
ver rolls back its CPU
> registrations.
>
> I don't have a device on me to test this path, perhaps one of the QC devi=
ces + RT config
> can reproduce this?

No need to test this on HW, it's certainly a problem. I also noticed
that Sashiko pointed out this as well.

>
> Should PREEMPT_RT case instead initialize these domains as ON?

I don't think so. Instead, I think we can simply drop
GENPD_FLAG_RPM_ALWAYS_ON. The main reason to use it was mostly for
optimization reasons.

Since we don't assign psci_enter_domain_idle_state() to the
corresponding ->enter() callback for the idle states, when PREEMPT_RT
is set, this should still be fine without GENPD_FLAG_RPM_ALWAYS_ON.

I will give this a try and see how it plays out, cooking a v4.

>
> This might be safer here atleast:
>
> ret =3D pm_genpd_init(pd, pd_gov,
>                     use_osi && !IS_ENABLED(CONFIG_PREEMPT_RT));
>
> Regards,
> Dhruva

Again, thanks for reviewing!

Kind regards
Uffe
