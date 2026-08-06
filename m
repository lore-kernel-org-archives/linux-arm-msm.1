Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410C3348463
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050054; cv=fail; b=I81GVVdWmbZWf+su2xf+YGO/mzsOcOZERtZvi2Q6XZ7nQPNkyLSy53MEmnFvdkw0udYAQrcPWcLjWMuj5p6nKUc8iyAcK3iIdbj9wPPPLrR4m8ZASvN2xbhDNsBwxSGlEgd47/nhhUzWRnfaP6k9kl21UQqpCLeA56azik2WZcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050054; c=relaxed/simple;
	bh=2m/MezBLD4L9Sm3qZKBo7QcHD2jdQUmxgA8N2cAddlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvOlwUXDRWL51j8WeMq331Er90LGnjmaiUvAmOb4Kinw+K0N+k5ehDWIZav310ikunQJzI2Y3E3ybKjHpJtP7h3fd0Xw3p+xwX/jyYujJLaY40QeorHJYVzRorRagGzyzgmknfu4/EdzucTtVW+feu8WAb9YKKpZwyLa43ghiP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=MxK7WhiR; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="MxK7WhiR"
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IDM7J2690023
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 14:00:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=lGo/gZLpo5Hr9mAvTJPcSXUi62nYZCQQZFmDq
	daORas=; b=MxK7WhiRX3PQSToO7bcU6y/HrAiDQ4GggX5OSGMGIpLAJDxgYypY1
	H0IL1GSSN65qK6FoF05Q8swRWZuHAjlUr9ZRdZmgkJt2IOTFrg/1ZdfrAyBLuq5Z
	dmD+BlhYyrA2lfq1b9LOomI3rnTR+8MXAewJasF/3ufqgJYZrgNcxnwPi77iNhEF
	VR0n0ZLwXW56djpAf7BMG0OnZi4vSl0YZ0rKw20vR5BIGY686sT53MBXcZmWNbIs
	OqjRpPlyt4FXcv052edU1Se+6Ustt5JPv4pRBFOpej/evv6aTtpJXnrrmqzCHEcr
	tNuvEv9Bw+Lw+2R94YYzyivuQslZI8raw==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fus5x7hu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 14:00:50 -0700 (PDT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1686e23b9cso217835466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 14:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786050049; cv=none;
        d=google.com; s=arc-20260327;
        b=k+/b1FlwflOwj9kng9Z6TZ5SQVPU5AwYBby3MhWNZ6QZPQQloUhDAxxPAafT9xSLpW
         JYhRswxEIFkz+VyFrawirB37dzVrbiyHGK2A42Ei5XuZob8HiedZxTOA/x9yrah76IYO
         Xf4bBBbL9sseVkJQ/ijxSuQDXRm1mjv3UCUbMQAUN48a2h/lR8i+PcgTu5D8WLIAh+ue
         b7y06VSYHbSl7qR4QLjlzeK4dKSLZi+IiYsC/qEhbjq0ngmp8DT66s8KbKHOqOgb5QKZ
         PMb5ohbD0hPOVUvblA0BDf73CscXdPeAYyRb4mmhGTeulST/06WXZXvKq9/UZr2Ll2wx
         WeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=nTp6hXk7VZVV5fQRPsG5rxZpnIFm2RbQ6Wg97lqHG98=;
        fh=y1J6FQsn5PZ5tEGQaU2rrJBKNSLfK3yHR9wBnROxxc8=;
        b=fHR6Hcs6tfcprKeaR3bOte/C1MDWFvwGAmkmrB8qMOlp4EPF/UplQDaB+radKR0j+U
         tCQ20RKY3+Ix7NjIBgy882lxrTOA17YmYMI0bFwOsRkjhvWrvKiufiR9yyrm36XadpdA
         tt5Sj/YgHCdydLq/UW34kx50AgPt6h7pPMePUxfkRsGDu/MLlsYdyN9Mc5iRrLGgOMQL
         71jorgI5Os7onILgSd7/puWPfh99a8r1ejsPOHx1kuBig4XZU2w8J4JCj4ScStasTybH
         ISik7dmPE/F+0fQPtiYuPedxXmfU3Bb9bSv+KfmPp+lsBgrtFpHgP87VgCd6sMtIt4SF
         UrEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786050049; x=1786654849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTp6hXk7VZVV5fQRPsG5rxZpnIFm2RbQ6Wg97lqHG98=;
        b=MYE9mR8QVFZhQtfLJ/kLAtQ+8w5lTJZaI1w0xxiB0QTrIVkE8yLA2JaU7TXNdmzxp9
         offuVdheqtBGMpoyok8aIU0MaP59cdnCAV3wfPsX7iRRkXBr6gTF+BnELjngGg9KgaPR
         zx/4M4iUcNKXgfyZhH2iTudoeOEvq7Fy0ZQfC9FzPCWxUYjiFCu5JkHa9p7TV6Cqf20r
         L5HIRBAVbo9web0Pk9CQS1wQKBt8FMEVN4IGwKpj/tnF6v9sj1OcO6uVhu7bdd5wY3se
         1KGyU/U/2lRaQkQ582ymRY7lZ71xx8+eRVpcauGKmrhYTEJRUo6n6agYK+CWEKLmsYLt
         AwpQ==
X-Forwarded-Encrypted: i=1; AHgh+RriaHlgZm+tJBYUPHdH8ouQnvfPScg3fgqZQdCPoV29D0UbLeE5U1U1dZWetvASsdcehZtwC15xEYVnx38M@vger.kernel.org
X-Gm-Message-State: AOJu0YyxK8P6BvMW8jSgXPtq8cZVhYwoiE6+xBxsnaT+17qFUdVJ8VO9
	WTC48jnjwlnLX1E2rSmvRLVlsFhpXyX228oRbu/Npgu/leLEfJrJruWxH0cndMUNrhVnXShla6i
	GZuuxXDYOTqsNcZIbJp6AY4yULEPHMbFPRYIZuy2/Xj7n95/nZGfrGhxKSKjevrgwL3lvqqs5bO
	gdHIS7v0tSKyeffWdAv3WVBr+oP+PvrATmto3yGXNQ
X-Gm-Gg: AR+sD126HAQdY+0ptJZE7lHkD4dWkzuf8Ki9c8LxAuZS9Anja2EzVcgWcdtMW5XIu03
	F5e6TX84D5zz3Ummlx3rFixWl4XY6FWefefghvzCJJpjHu9uFkdCQCKhq5Vtn+isKC2YHwx4hBL
	U0mJsbKk3PYXtctcD3Lcj7kaxnRg1kc4+jZKp5BjnuI5j0yYq7K6eh+48ukoa5JrQCCsG75wGe
X-Received: by 2002:a17:906:99d4:b0:c1c:66d2:7718 with SMTP id a640c23a62f3a-c2039d5209dmr854596266b.14.1786050048695;
        Thu, 06 Aug 2026 14:00:48 -0700 (PDT)
X-Received: by 2002:a17:906:99d4:b0:c1c:66d2:7718 with SMTP id
 a640c23a62f3a-c2039d5209dmr854594766b.14.1786050048279; Thu, 06 Aug 2026
 14:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731102147.127082-1-git@jaseg.de> <CAPx+jO_dACmFfdy6v32=V31HYiBFeU0NpnvhVuFWvLQ0Ls845g@mail.gmail.com>
In-Reply-To: <CAPx+jO_dACmFfdy6v32=V31HYiBFeU0NpnvhVuFWvLQ0Ls845g@mail.gmail.com>
From: Saravana Kannan <saravanak@meta.com>
Date: Thu, 6 Aug 2026 14:00:35 -0700
X-Gm-Features: AUfX_mzSDNGyLEl-UUPi4Oxyi9XZAz5DTONgHQRD9ibtZ8HcFoU911_qnyQ_le0
Message-ID: <CAKJaZcON7n66Sk0RFAEiccw2G1aKF5jCR47Ph8+0RRY-Zz88aQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Wait for device link removals before
 dropping genpd->dev
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: jaseg <git@jaseg.de>, Saravana Kannan <saravanak@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?= <linux@jaseg.de>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Qd5WeMbv c=1 sm=1 tr=0 ts=6a74f602 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=K7AIXQN9CNApSj4PEboA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=PsfoTyiJ_72bb7xyA04f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX9czL0y0evcQW
 d/wtud1di+k3VGDzmICFmFyDtJf/ZMqrHollVBTFns7th7K8cWdNTZYYfMOdOrTvUAZXaDBEz92
 gOChJ5ZovxnWlAYiUncKkWv5FI75dsH58mdVH6nFdGK/mogoIoHjcDSYM4FsRXo1sr7+Yu+WTwZ
 wc5Jlk4qJytvAy0E4+x/1QegHU6S77UwTNttGuOsZU664RysRLOz5zeQt7ca6fhp1xbuU/5JgVl
 R2NV/7ifNQ1aP5I/fdVYKMBgK1KfHG4AzMbVx2i7K3z3gO50MJ/vHwXsqO/QN9REMkeBk2adkff
 KABpLt1D5aMKBjmb32O10HNmSHw3aQOVHc1teuD0X7JHK2LHmZwVTe0wZTyCYxBZsVPq0PFTRai
 1GFVxPtOD+BHbfoaPlA1Xlmf3SlsUVXjN7uOVqq0nxjIbMolHg37XX+g6QIg8ykubVebWivrIeD
 P69glls7hADlG4DzqZw==
X-Proofpoint-ORIG-GUID: g86UYWZEjzTL2_Y10B_2kID8VjNjV_mJ
X-Proofpoint-GUID: g86UYWZEjzTL2_Y10B_2kID8VjNjV_mJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX8Ja6DJrMWbfO
 hvn03OvfoOzLexIzrZYmZN5HU9MPZKcz5WjoJhwgCg9B+JqNrIjUHGsHwPPF+o+n3qqob/wV4mF
 PkoZ9iUQO7OzApV4yvAUEoHIeRIwIJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01

On Tue, Aug 4, 2026 at 7:31=E2=80=AFAM Ulf Hansson <ulf.hansson@oss.qualcom=
m.com> wrote:
>
> >
> + Saravana, Rafael, Danilo
>
> On Fri, Jul 31, 2026 at 12:21=E2=80=AFPM jaseg <git@jaseg.de> wrote:
> >
> > From: Jan Sebastian G=C3=B6tte <linux@jaseg.de>
> >
> > genpd->dev is embedded in struct generic_pm_domain and its release
> > function is empty, so providers free the containing genpd with a plain
> > kfree() once of_genpd_remove_last() returns, ignoring its refcount.
>
> Yes, there is certainly room for improvements in regards to reference
> counting and freeing data in genpd. It's moving slowly in the right
> direction though.
>
> Anyway, the release function is actually set to
> genpd_provider_release(), which ideally should free the data in the
> long run, but we haven't fully reached that point yet.
>
> That said, I guess you actually are referring to the ->remove()
> callback for the genpd_provider_drv, right?
>
> >
> > Since genpd->dev is registered on the genpd provider bus, fw_devlink
> > creates device links to it, and those are torn down asynchronously.
> > Nothing made genpd_remove() wait for those teardowns, so the provider
> > could free the memory backing genpd->dev while the queued workers still
> > used it.
> >
> > This is reachable at boot on qrb2210, where the firmware rejects PC mode
> > and psci_cpuidle_domain_probe() removes all the CPU PM domains before
> > returning -EPROBE_DEFER. The bug is asymptomatic on defconfig, but shows
> > up when enabling KASAN or INIT_ON_FREE_DEFAULT_ON. In some builds, it
> > causes the kernel to crash a few hundred ms into the boot.
> >
> > Call device_link_wait_removal() before dropping the final reference. All
> > link removal work is queued from device_del(), via
> > device_links_driver_cleanup() and device_links_purge(), which precedes
> > genpd_free_data(), and flush_workqueue() waits for it to complete.
> >
> > Note: This patch was LLM-assisted. I reproduced the issue and tested
> > this patch on hardware, and I did my best to verify it by hand. However,
> > I'm far from an expert in pmdomain, so YMMV.
> >
> > Assisted-by: Claude:claude-5-opus
> > Fixes: 18a3a510ecfd ("pmdomain: core: Add the genpd->dev to the genpd p=
rovider bus")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.de>
> > ---
> >  drivers/pmdomain/core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 842c4169e290..4eeb980e5a40 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2348,6 +2348,9 @@ static int genpd_alloc_data(struct generic_pm_dom=
ain *genpd)
> >
> >  static void genpd_free_data(struct generic_pm_domain *genpd)
> >  {
> > +       /* Pending device link removals still reference genpd->dev. */
> > +       device_link_wait_removal();
> > +
>
> Even if this fixes the issue, it looks wrong to me that drivers should
> have to deal with this themselves at device removal.
>
> In other words, I was expecting the driver core to deal with this for
> everyone, but that seems not to be the case. Hmm.

I agree.

 I'm not even sure if device_link_wait_removal() should have been
added. The point of refcounting is that we don't have to worry about
who releases in what order and the last one to release will have a
resource freed. Needing both ref counting and a say to sync feels
wrong. Let me take a closer look.

-Saravana

>
> Note that, the device removal should typically happen when the genpd
> provider calls of_genpd_del_provider() and it calls device_del().
>
> >         put_device(&genpd->dev);
> >         if (genpd->device_id !=3D -ENXIO)
> >                 ida_free(&genpd_ida, genpd->device_id);
> > --
> > 2.53.0
> >
>
> I will have a closer look at the driver core for this. In the
> meantime, maybe Saravana, Rafael or Danilo have some ideas already?
>
> Kind regards
> Uffe
