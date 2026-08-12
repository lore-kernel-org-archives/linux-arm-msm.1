Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB940DB24
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527239; cv=pass; b=KaPYNs1QA3nfy2h9pFAHKoxNfvz6KI3mABKC8xtYyubWMI1G6Unu/tYiPkArqlytJQGUW0p6cJIhOgdQAsz3WpPYGWZkwYops9F6pJHP2XxAnpU7uddLuFjUtlXcAUhTRfj87rCkwOX6REdP+eTAzem6taQxnqmHWXJOQQd5Wyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527239; c=relaxed/simple;
	bh=vmzyDh+wY4RI+VDwpzAkIKa5bTxBYc+DCmkQVlORqHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9uPBfGkhNEDqfcWKZsikl3VsPNmg5QjMHEYb6TN6SactW46jza6Awagy0ayIHuabyh2+DnSj5GV/ej1oEWvpTrfFawPZEviBWqYhNVyeqdNmJgrOEjAuuN2MC5Rg3YdhMsdOPOrl6CbTY4socmKX3HDxFxuibtI4SvApJCiQZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFsEgs9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHo8gDau; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFsEgs9K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHo8gDau"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YIrR2527481
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 09:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=; b=iFsEgs9Kn2SP+ADc
	UyW9spWpFNQctEnMMn4PpsmqXVyKZCc3OUPe02eFhUrZaAL6rZRURmXDYHiC3c2i
	0O8aKFIu3NlWffaJwDuUyg2rHFs8yHv9pei7b0mctZc7TOb1HwgsU3QacztK/Ltq
	FhnJl70ArFP8R1P0h7/RLq1sqVWEA6tZnxwpgjo1dKEltg3so41URrgoW8W0c6rb
	Mf2KItT8MGASwIdzJGARc94prVxEHQPPBwvyrSaVY5zcsN2X1vXOsrqNL7TJ/Jrg
	kuEQw2ckiY1vbTsQmPP/dDvrxxqAl1ps28/Or0ySMtc643+u6XuWTkxF92ppayqE
	CQng+w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnd8dn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 09:33:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso126069137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 02:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786527236; cv=none;
        d=google.com; s=arc-20260327;
        b=T2sYwy6lMvIRbFWEucS7i4h6Rhr6N7T799IsMQ7NYiIxOO02bib8T7iPKruoL5hy+h
         Y8O8784UPUsu80iJc5DIk5o87wEO3GU1dt2XoSLFkUyCNshaHpL8R6/LjvGYxbl1TZ1O
         ZYmzOwz8ymdFu8Uj/J+QmN6ijVgFmqEwPVOYBZy7JkYUP4zoA4CwWqEUMwHl6ECkq63d
         L8d6BzMFgF2uD1feuaUgcpkMikBScwPfapVTgH90CogeBXX3MOrMPgOvokGfiMw8QIj2
         St1WsU0ejHZyA4YYE9O1uo8s2/zPzo8s+T00OfIOoVFOoyzWPJEPT1ftffo97pzXg3rb
         QVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=;
        fh=SyqBZ+Buyz0a8cIdOdZIR28qqdRKrE0GsZSkENEo9Yk=;
        b=dkyYi/gJUD9es0tjGgp3tQDi9unGIahkzPiZWoYQxTfqTg0jZSI756ycwY5hp7gLVl
         8XMogtHDzdiXx85lPw0F4LvmSkGsyzTJhR3eyrp32lQDNMGFW2QTw9NPhlwKRjI+MEd5
         iBgQBNTdAt2xNbn3kU0mxr+UZqj+uMWkTZXFVp2fom6i1kUEpARD2AMEg+NVUCsGnzn6
         jFYPpQw1z3nU5L0GtkILk2uZKkHhq7x4qu3BeQIML0tHc+ClNzN9WBXMASvhQgPXfeGV
         tbIlitl43skZAlFxPKe8vmIXto4N7Ycoa57OPOrHgr86INSlbbPXiao3v+pZaLXAFYIW
         gITA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786527236; x=1787132036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=;
        b=bHo8gDauON7XVOt3LAst6anfr6M35tuCGGrSxiks7Kt/m7tS7OCTM4s8D8qMEXj52L
         9raNPjABqLe98hfKlSGizxx0AVh+Yip0Yg6yZefvsPS8YKOtmtmIGS7kDqCik3vfRJ2K
         Co49obwR+jdck1O6fe65cCSD9ukS8JqExb78q6MXqQcSp/U+WtF1xqDIq6jqQ6Bo0B5e
         +w03/rLCbEcZ7QDN2GeXehf3o+XwmAbqSyn24bGV7Er8/HJYWSsxeRoI/U7AEHsi2zb+
         AGSwWrdINQ3NYO3T/mQIU6BmKOo7MsTMaUdROTy5EWVhmUZnKO7RIpfiM6qoxhVkBZM4
         o5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786527236; x=1787132036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=;
        b=sfl0yjUr6dWrNRzNwjxRSZ0ON4NyXRlsiaSYwpa5dmewJkDCRuSxMOl4Tvb6LCHU4z
         RQTdlOScorjIq8ycsh4IevE4OO65mBTQ464VROGRh3S0h8/t0T1UyTwvlftKRAldJjdc
         Tip2uqiJ6VBaOC4qW/19NMHl0d+9kn8ZHtjU0bcPqhJc8flMHs0VmkzoWAq7civLJSFX
         1WJ21cRcaJqzSweR7c4w7nCr3vUY1lAbKkm4rOdlE+HJS0gxNfYO4xwVwQBHcxcX6Pcq
         CSqR30+TST/lsTqJ9tOuKeDFDpeULmp5niTaD+Z9EPEgEshuwChOVsEPx8FCsNuDJpVE
         kwlA==
X-Forwarded-Encrypted: i=1; AHgh+RoeZ9fQh1H6gBqaKajjEm0jAlosqh9pDekzLpYqo5qFX13EAJihWI84iOinumk8lJNia+QK0Q9CRGC/geei@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkO5xPiYwANATbaSn4rjT5YvPvNbzAO3DzbEfaBHyFXW0fzkJ
	LfbHqW9PoKyc3igm6Kd2hAF5HhlArRM2GdPITBzRC7QMaaBo6PLHIfh+59QXEcM95cM1kpElq6S
	jMi9NKEJjjkJ/WENgXFrblxyrSVInZDyiDgiLKJpTsJorwvTrxhzYtNnYCLLC/OYMXzo2cxIrVz
	fgIVVIv13ZbSxHsTPbc8lWc5pbbJffwAXQRhu6XEsqeVg=
X-Gm-Gg: AR+sD10Kx1EJsKoVNPdx5j+j4n9F4Yj4oJUCpyB355CrAxh6oemR3uC2laNQRyFXX2F
	Ttxh5quFZnc3UpApyULPn7nSo/fT5qvi/WdBAcrOMP82wugaFJKLYNS3vc75BWf6LSe4ATJOeg/
	BhlNsTHVw9wVxPb4t84VMVkbECvswCZtkoxdYKC3CxBYihBA2nnk/1Gv8/1zKsH+3WRCcdx8C3v
	Y6ezNY6R1PGkC9S
X-Received: by 2002:a05:6102:94d:b0:74a:be82:73a6 with SMTP id ada2fe7eead31-76c88b5d4f3mr653455137.8.1786527235654;
        Wed, 12 Aug 2026 02:33:55 -0700 (PDT)
X-Received: by 2002:a05:6102:94d:b0:74a:be82:73a6 with SMTP id
 ada2fe7eead31-76c88b5d4f3mr653449137.8.1786527235189; Wed, 12 Aug 2026
 02:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com> <20260811-domain_off_ss3-v1-2-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-2-6a0a0fc023f5@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:33:42 +0200
X-Gm-Features: AUfX_myst2nAw5V_YUmuhaFbQdg1Mey-MuLYa2PToXnP1p5QWau0DOIrAmPhVs0
Message-ID: <CAPx+jO-FAL1asnPRwhdH3R8QZvdTnCiRG-uJh7sT7p55nqBw-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: core: Initialize state_idx to deepest state
 for OFF domains
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NiBTYWx0ZWRfX9AgiHQ0rszJ2
 d64jWab2qW/vQ5KtjAFi8NNpy2vvr7LoKDkBWJH6m1GFh79SY1IvOdEfBSYOOUfH2e53ytkxwl+
 h6O7s1HiIYEVYo6OynNBmUOJw4+tENQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NiBTYWx0ZWRfXw3Z6zh9LGuLe
 wdn2fDGpxaOwQRnkTI3PNxmW/GtdRo6uIYOhEtBk/cbsWnG3jUnJJfjQO0rZhbq65mxHtCFgM4P
 OasQ1KqOGN+sPNmegCLglGTo3ic4a/VmHlN4B3J4CqFVuugCdSOKIIjmrXnz//MfmrSj/jaZQ4e
 OYA30zGBulw9ghDTy7ANQmivCoFxuvW+uH6jGHvAoS/DcoTjENNsMKOH9PhWnqxR2hZEyW1q2G0
 Cw1rnd5UexCCgLvJdHNGuQXN2e2aF5A92s6Xjs5Tu9zbzUrLI5avW7e++hQfo21Hvgz3hDpwUkS
 LWR4MUIDnABHC3cdYKCnHc55K1kP7m9u4hwozU1+jTru0YdQWkj7mDtwJ9FaMSaQaSHHyjkyKlo
 /r3iHmiwqGUemaRtLlUkT1bqL3GgMeYjKTx0wPCXsAbJhnNtv2QOyIzE9B3HDGAoR9CWcFbgDF4
 ZyJL3Zi2L2r7kzgxtyg==
X-Proofpoint-GUID: tso8txmzOjy2Sb62vaStY-NObsSENbYw
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c3e04 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=P2j-IMcOwh7rrdvbTMwA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: tso8txmzOjy2Sb62vaStY-NObsSENbYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120076

On Tue, Aug 11, 2026 at 7:50=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:
>
> pm_genpd_init() sets genpd->status from is_off but never touches state_id=
x,
> which stays at its kzalloc'd value of 0 (dt_idle_pd_alloc()) regardless o=
f
> is_off. A domain that starts OFF without ever having gone through an actu=
al
> power-off sequence is therefore left looking like it's parked at its
> shallowest idle state (state_idx=3D0) instead of its deepest one, even th=
ough
> it is fully powered down.
>
> This is visible on hamoa, where cluster0/1/2 each expose two idle states,
> CL4 (state_idx=3D0) and CL5 (state_idx=3D1, the deepest). When CPU-cluste=
r
> genpds are initialised directly into GENPD_STATE_OFF under OSI mode
> ("cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI is used"),
> clusters whose CPUs are excluded at boot (e.g. maxcpus=3D4, leaving clust=
ers
> 1 and 2 untouched) never go through a power-off path, so their state_idx
> remains 0 instead of the deepest 1. debugfs reports this as "off-0",
> meaning the domain is off but parked at idle-state 0 (CL4) rather than
> "off-1", idle-state 1 (CL5):
>
> genpd_power_off() and genpd_sync_power_off() both gate parent power-off o=
n
> every child being at its deepest state index:
>
>   if (child->state_idx < child->state_count - 1)
>       return;
>
> so the parent's check treats these fully-off children as "not yet at
> deepest state" and refuses to power off, blocking the deepest system-leve=
l
> low-power mode (SS3) from ever being entered.
>
> Without this change:
>
>   $ cat .../power-domain-cpu-cluster1/current_state
>   off-0
>
>   $ cat /sys/kernel/debug/qcom_stats/apss
>   Count: 0
>   Last Entered At: 0
>   Last Exited At: 0
>   Accumulated Duration: 0
>
> Fix this at the source: when a domain is initialised OFF, set its state_i=
dx
> to its deepest state (state_count - 1) instead of leaving it at 0. This
> makes genpd's reported state consistent with reality for every is_off=3Dt=
rue
> caller of pm_genpd_init(), not just the PSCI CPU-cluster case, and requir=
es
> no special-casing in the parent power-off checks.
>
> With this change, the domain correctly reports its deepest state and SS3
> is entered normally:
>
>   $ cat .../power-domain-cpu-cluster1/current_state
>   off-1
>
>   $ cat /sys/kernel/debug/qcom_stats/apss
>   Count: 218
>   Last Entered At: 726792712
>   Last Exited At: 726950687
>   Accumulated Duration: 199888773
>
> Fixes: e7d90cfac551 ("PM: domains: Prevent power off for parent unless ch=
ild is in deepest state")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..5d96d9eabc1f 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2409,6 +2409,8 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
>         atomic_set(&genpd->sd_count, 0);
>         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> +       if (is_off && genpd->state_count)
> +               genpd->state_idx =3D genpd->state_count - 1;

Even if this is probably the most sane default value, I would prefer
to keep the flexibility.

That said, please make this change on the genpd provider driver
instead of in the core.

>         genpd_set_stay_on(genpd, is_off);
>         genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
>         genpd->device_count =3D 0;
>
> --
> 2.43.0
>

Kind regards
Uffe
