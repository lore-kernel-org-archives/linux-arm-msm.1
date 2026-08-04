Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEB3BFAE0
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853876; cv=pass; b=DEBzq2EHql/itfUOcMpJBaK0SQ5Bh1M/e5mRSO/Ra3y7XPvuo3+LXbQwLr4M4rMhA5YC2CZWSNlq2E3GD6bbwZZqEutxdKcdtZZCLR8nqL5hJFAzwdHva1yw6Lbju/Axaxiaty+mLzFZ/Rg38AW2GfIs2s7yWzPkNGSHTCwM4+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853876; c=relaxed/simple;
	bh=5mCmR/6RUjKq6DEM2vGmt/KL+t14Bd5bccAfyxQBxCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAk6Z49g4W7GAnLqZ0HvhFeWiul7SYy1aGngCqAL612E8z57vEwMLlodTBVxj9cwZVZnI1c0BfUOlIrVFd/akOuSIzh6Za/9lxn26D52Szo7pxYs7zYSovbeAInFjeNwYfaATGwIiTH9PgbckxSBO0hOanuvgbro1LbN7rWfMmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQE+Atnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Emm1Aj0F; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQE+Atnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Emm1Aj0F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXAJu4129554
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 14:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cg6rAo/MJYlbCvgNVBkuRq80ZlIkgToqz32zBTLhVSg=; b=nQE+AtnlVP1fUw77
	L1Amwx9hTTIRUxtU69jv2ipTe0oLZs76ubHtqVbhaABic/DOTFTjCZW2Pyf2wBON
	0N4iD0wfDbONJCGJ8mFP2aT+y6B6YIr8SuX5XMBNaL4N/fMlMW8cDSZPa4Fg0aU2
	HXT8ikgCCUqFtZIN7O0toIE2FXuJDApEvheHtUhW1BQyPKPXyjJ8irn86G5UJWx6
	ZqF+/qZVVfLU1Sl9jT7GDy+26BuMXGN16MZkweuYTEKGpfrxoAyaQ9QCUta2MdDW
	kOShYYbYXRjSokV3WoAi1SE3IccyPjrAIrG+Q2hbJepxm3qCUaB429RS/rHsVB9G
	gqqnKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug658hdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 14:30:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907e49dbae8so36423106d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 07:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785853858; cv=none;
        d=google.com; s=arc-20260327;
        b=n1Z/4pscrWc6gXpP90sBKQGE/0g7Y/K96ol+hm0NIbaTKRpmIpfGAqQLoVTacEgL0O
         2DwqG0uVTVkEr/AebegVNcDeGv3u/QOjnTHTVwNbwrygR/N7481p/MMuYhOD3ORb1/c7
         VeGj43StWv9rEusOsBRVLmS+4zVsyLtJVTjBnJrGeQxXBJ8WM7M8zM4yi4wPKYMJeqVP
         QXEgdCIC/13tOORqb72k93z1CL/cVlQCI2z8NOvBbLvDWgM4kaMaAgMkYLNZgE+4oH49
         e2MwlKBlFeBCPPvx97F+RSCglSOVLvf/B4wKR0BrI5YPZqeJ15uamZ/Xn0o1V2a8rT+J
         F5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cg6rAo/MJYlbCvgNVBkuRq80ZlIkgToqz32zBTLhVSg=;
        fh=xTMpnBMvereayYQEW8fw7G/JfxrwLZRhlhSV6AgloX8=;
        b=osIiRb46m4t6pjQ2z2/V48LcNYM7zIcjR7DTMEKXQ9LtLnwqa2zo5bGwU6YNZ/LlXA
         AYZQDST1Y8pfmQnMU+5hEx7jO5kvxQJmrBnD/MxXUzePCWiuOwahmvwZ5UnnrAeBXJqN
         Fcx4kBSiK8ycTuK0S6nAmDvZpYD2GnGnqYbGwPrJgyHRu6hohBQS5vMRLPsPTxLdBsny
         pjpUinMUfFZRh9mvWKMzYUeyYD4nGjraaxKlk543EjsLGbtOVWVNQh0qH0xJW0DrOrI4
         DK27vcwUwdCsrDISs2W6yo5+JhhNlZeIBq8qfsjtDQkn8/FBsaIyDXsWNbK6v1Zjio49
         wVuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785853858; x=1786458658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cg6rAo/MJYlbCvgNVBkuRq80ZlIkgToqz32zBTLhVSg=;
        b=Emm1Aj0Fgv6sNDYK5t0S38AU29p0v6h7i25XYm/kDi6+m6vm8WdJr0oqg3kZyrzioj
         0KHxlRPAmTdmsHa6ouJnN9krP0cTs9/CyNQ297wPPOEte1ID6GExYIEgJ7gagkbzjWR5
         RD6kztkzcKCmJJdlWejJ9GJSqSc646xQplMIDRrTRCflAU4p8wCGx2OI27DkOgoyp+Kf
         1TnbhK6BTpO6BSjigoLn02/lbs2H78He+vJHqW0+8f34BxWXJjM8pGpxCYrjVVacVix8
         bWza/8wjDwoVixaW+VGnJgsurQIAfQOUGPjoSwPcLS6dbLn1hvJBiZUWVgVSck6l2Abi
         C6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853858; x=1786458658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cg6rAo/MJYlbCvgNVBkuRq80ZlIkgToqz32zBTLhVSg=;
        b=M0ualF8o9XrtSpH3LVu4A2tLUXV/9nVceGacwxs6vkg/+NTNazkxxDD1RZfPEBqzNl
         1g2sPZgv6lZNG7byenwzCg2qG1wPRY+QDVr1x5LNyBHTjz3eHuVMDrL3VN81GyHPQ7ql
         bScIgYoxIshK0qP16BDycZ4q5pU6TGSZuWpLV264y7vUeQIRJahPRXEY1QdH0+1SjP1L
         V/9Ig2Tu+3tl2FlGOyvSa/pVcHUr3zcb7OwY7LjAE5KmPeQo6DDGoykZ5AZ7E2+UlxQx
         EQFunCweVFV/hj6NoayhHHCTkYElquWTRglMPdnQR7syK7aQ9PKchCarV6/2CeV2lXmn
         8DwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9pqJvcTWA++7sv7pmly/lpYKiTclCZmLMxLQv7W81RTI/044+Vp/c+0f47Yq0X9ih2Z8bRzzoxJzLcT1P@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjqKkRC9MLdRdRTpWEzx4xc/2atNxUMBAb1LMwNflsEco2iyl
	GsqrcRKQ83Hv4TEC2m2mlo+iGA6JNZy+2Lkjv6v1rykiMy4++0Y0wKFh4J03SDbDG2umQToWE10
	gCKxqReAjn60DiDfZq9pwTJm4XXHjdy3mw43iLZCTccYVhcvUJvpPwD03VbEVp426u7bZNZgp91
	hhafkhMvIRQlQu7DVwgFOoybzpC57Vvj1+wQ+FRilJIsE=
X-Gm-Gg: AR+sD112Tdgi0iFo2uqLHdDwebfqghdWlITOfD/LnSq5WhlQhfxx3XFORlqLROUt18N
	dHXx+5fibDNc8As/NPm+mQ/OxtzEooz41uAWqA9neZuvCWfZcgM2Tl6kxH/uN4mKZLiKK9KwwqX
	WZiVj5QPrQBwCZ0KYbH+jbfaoS7Adq/cgqMHyw1xQuTvD7OvlolVQBdbEqxA==
X-Received: by 2002:a05:6214:3286:b0:8ee:b05c:596d with SMTP id 6a1803df08f44-9084967def8mr342440166d6.22.1785853857785;
        Tue, 04 Aug 2026 07:30:57 -0700 (PDT)
X-Received: by 2002:a05:6214:3286:b0:8ee:b05c:596d with SMTP id
 6a1803df08f44-9084967def8mr342438776d6.22.1785853857275; Tue, 04 Aug 2026
 07:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731102147.127082-1-git@jaseg.de>
In-Reply-To: <20260731102147.127082-1-git@jaseg.de>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:30:45 +0200
X-Gm-Features: AUfX_mzgivo-E3HGpQ3QfM9X418W4Z9nE91hXAlBr_4P1WkYtGn-e3ZUQvB34SE
Message-ID: <CAPx+jO_dACmFfdy6v32=V31HYiBFeU0NpnvhVuFWvLQ0Ls845g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Wait for device link removals before
 dropping genpd->dev
To: jaseg <git@jaseg.de>, Saravana Kannan <saravanak@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?= <linux@jaseg.de>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: F_rfxPTKf2gW17nRwlqnf7CtYQo3j3g4
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a71f7a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=18yQujymN4OLJxJT4uUA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExNyBTYWx0ZWRfX7D8f2AT/Q8xj
 6n8jdCmrCxSBZqInOz8g9rkO+5FDU4VPhR6HZwF31iJBSqlF282WOGavRHmxFgesF5BDuxx6i9g
 AGBXomKGrkD1IVHnVQbFjadJDFWnVOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExNyBTYWx0ZWRfX+V6wvndp+Hle
 xPR1qM4szDA+r5Nj0cFGxHl+soWxEf4GHl69VIlqkpHydpwPhf44wWYtqQ8YuJZ0pBmNpzjtJxY
 aEUlSBViCSSkH1HygXUz4IcNlwDb9WCq6vuqTM9v3CYpOyr9d6Csg8UB4KtRNYtllJCo0UBTKaT
 RI8dkOCzWb1doVT5fNP6xov8MbXVNcGYJmR/u52LRdabIP6TfbgvQqKpRGUxfzJvuaqN8oyLPk/
 hJIcPHNIizTCo+VWdCs6rj+2zvSHC/8EQg2eYNevCQ6+/d5E6t9GLReK3R+iy1oPIZ8VJftx0Ig
 qFTlYGIhurev+EIwk7YYXGINEMDv5isg1zxAMwc8gMcncNA9kTeXo2e+MBbNF4NpzbBxWJZ6LLn
 5qTEIMISiL4LK2WRjMa1oGOtsnBzu8rPsMkaNxcPXFAL3elZIUOUkNuttwOzB4aWP8Bnq/ZjqQE
 Z4UQGpJyD60suu0gSgg==
X-Proofpoint-GUID: F_rfxPTKf2gW17nRwlqnf7CtYQo3j3g4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040117

+ Saravana, Rafael, Danilo

On Fri, Jul 31, 2026 at 12:21=E2=80=AFPM jaseg <git@jaseg.de> wrote:
>
> From: Jan Sebastian G=C3=B6tte <linux@jaseg.de>
>
> genpd->dev is embedded in struct generic_pm_domain and its release
> function is empty, so providers free the containing genpd with a plain
> kfree() once of_genpd_remove_last() returns, ignoring its refcount.

Yes, there is certainly room for improvements in regards to reference
counting and freeing data in genpd. It's moving slowly in the right
direction though.

Anyway, the release function is actually set to
genpd_provider_release(), which ideally should free the data in the
long run, but we haven't fully reached that point yet.

That said, I guess you actually are referring to the ->remove()
callback for the genpd_provider_drv, right?

>
> Since genpd->dev is registered on the genpd provider bus, fw_devlink
> creates device links to it, and those are torn down asynchronously.
> Nothing made genpd_remove() wait for those teardowns, so the provider
> could free the memory backing genpd->dev while the queued workers still
> used it.
>
> This is reachable at boot on qrb2210, where the firmware rejects PC mode
> and psci_cpuidle_domain_probe() removes all the CPU PM domains before
> returning -EPROBE_DEFER. The bug is asymptomatic on defconfig, but shows
> up when enabling KASAN or INIT_ON_FREE_DEFAULT_ON. In some builds, it
> causes the kernel to crash a few hundred ms into the boot.
>
> Call device_link_wait_removal() before dropping the final reference. All
> link removal work is queued from device_del(), via
> device_links_driver_cleanup() and device_links_purge(), which precedes
> genpd_free_data(), and flush_workqueue() waits for it to complete.
>
> Note: This patch was LLM-assisted. I reproduced the issue and tested
> this patch on hardware, and I did my best to verify it by hand. However,
> I'm far from an expert in pmdomain, so YMMV.
>
> Assisted-by: Claude:claude-5-opus
> Fixes: 18a3a510ecfd ("pmdomain: core: Add the genpd->dev to the genpd pro=
vider bus")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.de>
> ---
>  drivers/pmdomain/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..4eeb980e5a40 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2348,6 +2348,9 @@ static int genpd_alloc_data(struct generic_pm_domai=
n *genpd)
>
>  static void genpd_free_data(struct generic_pm_domain *genpd)
>  {
> +       /* Pending device link removals still reference genpd->dev. */
> +       device_link_wait_removal();
> +

Even if this fixes the issue, it looks wrong to me that drivers should
have to deal with this themselves at device removal.

In other words, I was expecting the driver core to deal with this for
everyone, but that seems not to be the case. Hmm.

Note that, the device removal should typically happen when the genpd
provider calls of_genpd_del_provider() and it calls device_del().

>         put_device(&genpd->dev);
>         if (genpd->device_id !=3D -ENXIO)
>                 ida_free(&genpd_ida, genpd->device_id);
> --
> 2.53.0
>

I will have a closer look at the driver core for this. In the
meantime, maybe Saravana, Rafael or Danilo have some ideas already?

Kind regards
Uffe
