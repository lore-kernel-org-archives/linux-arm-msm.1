Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D964582F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117619; cv=pass; b=R9aWasi72aSwyMEm6Oi+57jWctmZm5BBq3zSp/h6gnhz1/+q4Mqd11hJ12T/YLDbI2K8vbSZYefD+yXjxR3j4HtdSDUQ3qjvvxz/DK5jj1UHZ23opY2/zs+jrmRKhvtIrmxe50QZUATSaBiZEDt7ouAg98uolcfePMRsXa/napA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117619; c=relaxed/simple;
	bh=0IZ1IYuxL6vp/xvynOZG7HVgZGxFaXmsNSio8l++Ccc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQz0Ec1aW8ZCfDaiXQ/8P2Sx1Jlxo3SpQVQzYCPX5cKRIE9VJFBrIA8ctEYnsgEW60lEpIZHpcfl7ZqY+h817kJEgmB+TNdjeYQF5kq51dMcdmXOFPUfCC7wipy7aEB+gWrXlhjpXRlkUL9M+P2bq9UVf4Ss1grmIg2A8emfo2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6asSxex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8GHmzw3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6asSxex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8GHmzw3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kXmR2801686
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=; b=U6asSxexnwwTSr7x
	RbRkx2DFoKaGix+Qlmew8tf95/+2tBbS8aob+HSj2TbxYCaSgzdLrEdRRQWU2mIe
	3IIyMGnDBUNwp1koopNOYatlPFfgn+Xt8Rb4kbPbKfxH6SGX05PG8YzcxAYUfQ/F
	2kPM3GF6jeXpmHlPd1XPzRxqYsNmpCPTGvg7eV51nZx7Oby28/8FM2Ng2CXFZwFe
	Q21PAWuL6GSXT+YyzpwR4qHI0PDj/oW7hg7uRTiO3bRt+5wv6iGXs5QuulwmqN2h
	CFv5F5MdeO84DgTbjqXY02Rbetszf20moct0L7api8SlC12EfYe3o1qDesnQo9hh
	Prsmbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729hss5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:06:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so1247391a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117615; cv=none;
        d=google.com; s=arc-20260327;
        b=Xczmz+tENIvjduidAA/baoUV6MeZzoZqKZlOiBAIjMfE1GOa8+ggSFLtzvbYHc+aq+
         PmiA+k6kOSaq5b6fDHwVow9b7ELkKh68e2a+1Rjsf1KrT8qmyJt1ui/4O9DIqJoREoda
         9lVjdQbyRa6JWRXbLL/e90tl/VEIRaS5WCZ/CnVDRs1+PR+7rAaSG3J1Ym/44F5O9Eto
         av3h410EaE3wj1mlj+Zi43dZpGWtlSOFrBBv7SacNLGSRcH9rklRZwKkZ60nWlo4ITHZ
         95xiLmL8Pk2DcmXH+ETEjYy7cDWYNBu0BNclQsYEy8WX5pinJhFFr8Wosv0RN5UIHlAl
         14dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=;
        fh=L7WoWdl76NSUFmD4hfYrmx0xTLjTjCmnnqGXxlYzCG4=;
        b=DX2DtBhxnlFtxWlmJLQMxm+TW6quw1b0dRgcxnUqWqXbWOF/mcF7xqcoj3lpt0kdLK
         3nG/s7fwWUdHRapJ6VoTb162xF4w1EVqwXjasJMc6WGmVgSX1nv4PSV+sMIbp0Hkwhvu
         +bBOgl4EcpPUYdTELZzfTF5cdpNnXfPYhJiSCyBfSgYwe/86UgBaotMT7pQI7rZXQnoN
         j5Musw6nVCOO24wvFBI+RRCx/xCNuWB+JCU+EkEhOeKy8D148UJR2MXU/1MMv1C8o52X
         VgLJqZRkz0HsV4oWZkry+OCva5fsWN8CcliJI/FwOcpnCjoNZ0Pp9m8wral/rwpOdXme
         fR1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117615; x=1789722415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=;
        b=d8GHmzw37GSqYCy0klPKdcChhCS8uqK6octBRth8xZi/H9Q/FYxHZs15VXdqr1IGTE
         k8iA8Nn3Zb1lowS7UNJkXd3VYwaMJ4SOFaEum880IiMut3fdv6d+resY5QAgrkPVaQmD
         yDj4uxzfy3iNG1m8k2HJS23xBqZSFEeosOZhHRec0YIMIyAjXOPUXwpspDtEDuJYYs6Z
         WmSEX4yRdQXum+AsUF++WNcrTOt1KBOezyRFYT4213WjBI2bAXBnRg4RWhEOazT1mXlq
         IXcvLQnFvbOtxZVuv3WUMibBbQvIfHXY8VnbSIE9a9ksaT7oEmRzUlkdalE7a6cklpgM
         2yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117615; x=1789722415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=;
        b=FAdcw1u+W4cvBBLdBQqgyyH+wXDa+H2MVVdkTPCq6meIF26UwfljYV5mamwUIppFX9
         PWKRzihSbvCYAYQGok0CM16DvZW7b1mGj/hw++mm4eggpjt9EJXrJApBokHBwy+UksXs
         37/MyPnq8q5XGFFMyEAWixGpaD+UIwfVAW2DFUZfdWUlqAxYj1uVL+irACaTL2Hb0CQS
         8xSEXgsJlb0qfgQtvWXzcGXwMIaKvC2vi9Usg8ZZ982dTKscSvmJ+RnRnfgPrwI3Rwci
         wpnZ+jd6iW834QdWyPu2UBokjEQlmFzPiAzEd/LbuWfK6D4moJjb7cGxwnY6CSRB8GM1
         Y99w==
X-Forwarded-Encrypted: i=1; AKwUvBxgn8j3bu7PgpBrpl2MdQV4LW2UyuXss81NAxqVl4xAvD7wt4d/4ImOBkHa1pdWYamc8oyWnKGoNPmNt3Y7@vger.kernel.org
X-Gm-Message-State: AFuF++kr0l0A3o4OysGBpwZTWFXNktPM6PseAFpf5jd0ajom5lOq3VBS
	ijQoY5p22fZCVkiDpG/fWflnDtk6/X+qOQh72qjsPp2dYl0AIGWhFuBijZyCyaLNoeg/qjqumVV
	ULednH0MXNTFKfyNLvQdAvYPdvwCnStNr+2FJhGrAixvLjix1WiaL3vnhcAGnZKW0PpB/JaWgKM
	H3l3hDddZ0NamDWnB0EbZDl3lQZVzCT3cXkpexBwUn0EY=
X-Gm-Gg: AYBFou0wSVMxCTTrPjZJWJJ4vkmxlUKI/jhw0bOIZTZejquyDC4vZtW/dU7p/uLcaNz
	++4Pzr++JPluBaND2obgogqOwhfNY7ttJusEBo5/vfSHqjSMD/jM3JifngHLtfj+wSLm/CWO2pb
	E+uelQfvk5iK1hvJpBRjJ4loirBneMYLppGijwVF6jcHk+3XtOQot/+hzNeQ==
X-Received: by 2002:a17:90b:3147:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d9bee5d69mr5499760a91.10.1789117614512;
        Fri, 11 Sep 2026 02:06:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3147:b0:398:ab03:95b2 with SMTP id
 98e67ed59e1d1-39d9bee5d69mr5499696a91.10.1789117614000; Fri, 11 Sep 2026
 02:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com> <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
In-Reply-To: <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:06:43 +0200
X-Gm-Features: AcwNN1WWtbHklmpQXJKRAIYWnaeeJF8livz9f5GEdPQsQLw78oZnmRYUG5Wxguw
Message-ID: <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXzHbBumzfiFPs
 Z11H1OH/fhTL4p/e9gmkPchzoNUVtDKZHe1FgAdZVR2w9uNwiRwnaBGfJuOEujOCxx+GXcLrKrk
 uHsbNKR/0GMSMiauQomF8SXOkWDsioQ=
X-Proofpoint-GUID: L_6669_0lJmA_-PE03bjnkA66ab5GROQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXyjekM/ICfFFc
 n+y5eXvCg+MAUOF7c8PgmEZ5/okGWk3pLl+qUxFipKZrV088dPoVCduQfu5/dBqEkZqHNVfK2EK
 T5Nn2nzcQLBsft8EdEadd7HaigUCuN0o5KPJSfcIr8seIVzNriX0+R7LBWewD7K6tZo8W2NmBdz
 qT9H3vIgPD8x/7tKr/j8Mhrp/oNba6sWgQ+XUlBaFYYb+r3yVooUhCz564js9DChV4BDdJ8AeT9
 FsPrrO2vRRv85ch1cYx1d9IxoaYpHaboOJHJOVQG+lu36Y77w4biLuc4fkIxasduQVTcce5AiS6
 xjo9DNTkG/bMcBKzjDb9RyjJilzLC9oK1RrqYY0YR6Y9JeVsbs2mwOL4WAZIOR6Yzp0FFYCq5vX
 hj3bIw5ml9PRYuqm13N/1euFaXGaedcQL746dgA9PAvimm3MCSdS6V0z3s2Z4cWMzrLHfos1bHj
 zjoy30ftKfZ3Z825jhA==
X-Proofpoint-ORIG-GUID: L_6669_0lJmA_-PE03bjnkA66ab5GROQ
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3c4b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=I--eTaT0OsuqKzBIU4AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127

On Thu, Sep 10, 2026 at 8:31=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> On 07-09-2026 16:46, Ulf Hansson wrote:
> > A driver for a non-CPU device that is attached to a CPU PM domain (the
> > genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently no=
t
> > able to power on the PM domain. More precisely, to power on a CPU PM do=
main
> > one of its corresponding CPUs needs to be woken up if they are idle.
> >
> > The current support for a non-CPU device is that its driver can only
> > prevent an already powered on CPU PM domain from being powered off. Thi=
s
> > leads to problems for a driver while probing its device or when it need=
s to
> > call pm_runtime_get_sync() to turn on the power for it. From the driver
> > point of view it looks like it all works fine, but when accessing the
> > device it may end up with various errors as the device may not be fully
> > powered on.
> >
> > To fix the behavior for these types of devices, let's adjust the behavi=
our
> > in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
> > when it's needed.
> >
> > Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZ=
VYO=3D38R2cLV8nw@mail.gmail.com/
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v3:
> >       - Moved to atomic polling, pointed out by Dhruva.
>
> Thanks, but even in v3 we still have potential issues.
> It does not fully address the consequences of polling for five seconds in=
 that context,
> nor the parent-lock nesting issue.

Well, I assume we will not be polling for 5s, as it would be an error
and it means that we fail to wake up the CPU. But, I get your point,
5s is really an unnecessary long timeout.

Ideally the timeout should map towards the deepest domain idle state's
entry+exit-latency-us, but rather than looking at what is actually
available for the PM domain(s) in question, I think it's easier (and
good enough) if we just pick a common value. Usually these values are
in the range of a couple milliseconds and in some cases up to
~15-20ms. I suggest we decrease the timeout to 300ms and see how that
plays out.

Also note that, at this point I don't know of any use cases similar to
what you describe, where the device in question is in an irqsafe child
domain. Hence the polling would not be done in an atomic context at
all, so we should be safe. Anyway, if this doesn't work we would
simply have to limit the support to non irqsafe child domains.

In regards to the parent-lock nesting issue. I don't think it's a
problem as genpd_wakeup_cpu() is not being called recursively, but let
me double check this to be sure.

Kind regards
Uffe

>
> This seems to have been pointed out by this corresponding sashiko review =
as well [1]
>
> [1] https://sashiko.dev/#/patchset/20260907111659.263324-1-ulf.hansson%40=
oss.qualcomm.com
>
> >
> > Changes in v2:
> >       - Rename a function according to Abel's suggestion.
> > ---
> >  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 6abe8b198949..b62d4e544bc5 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/idr.h>
> >  #include <linux/kernel.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_opp.h>
> >  #include <linux/pm_runtime.h>
> > @@ -19,11 +20,14 @@
> >  #include <linux/slab.h>
> >  #include <linux/err.h>
> >  #include <linux/sched.h>
> > +#include <linux/smp.h>
> >  #include <linux/suspend.h>
> >  #include <linux/export.h>
> >  #include <linux/cpu.h>
> >  #include <linux/debugfs.h>
> >
> > +#include <trace/events/ipi.h>
> > +
> >  /* Provides a unique ID for each genpd device */
> >  static DEFINE_IDA(genpd_ida);
> >
> > @@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type =
=3D {
> >       .name           =3D "genpd_provider",
> >  };
> >
> > -#define GENPD_RETRY_MAX_MS   250             /* Approximate */
> > +#define GENPD_RETRY_MAX_MS           250             /* Approximate */
> > +#define GENPD_CPU_ON_POLL_PERIOD_US  100             /* 100us */
> > +#define GENPD_CPU_ON_TIMEOUT_US              5000000         /* 5s */
> >
> >  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)               \
> >  ({                                                           \
> > @@ -1026,15 +1032,75 @@ static void genpd_power_off(struct generic_pm_d=
omain *genpd, bool one_dev_on,
> >       }
> >  }
> >
> > +static bool genpd_status_on(struct generic_pm_domain *genpd)
> > +{
> > +     bool is_on;
> > +
> > +     genpd_lock(genpd);
> > +     is_on =3D genpd_status_on_unlocked(genpd);
> > +     genpd_unlock(genpd);
> > +
> > +     return is_on;
> > +}
> > +
> > +static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
> > +{
> > +     unsigned int cpu;
> > +     bool is_on;
> > +     int ret;
> > +
> > +     /* Find the first online CPU in the genpd's cpumask. */
> > +     cpu =3D cpumask_first_and(genpd->cpus, cpu_online_mask);
> > +     if (cpu >=3D nr_cpu_ids)
> > +             return -EAGAIN;
> > +
> > +     genpd_unlock(genpd);
> > +
> > +     /* Send a IPI to wakeup the selected CPU. */
> > +     smp_send_reschedule(cpu);
> > +
> > +     /* Poll to wait for it to complete the power on sequence. */
> > +     ret =3D readx_poll_timeout_atomic(genpd_status_on, genpd, is_on, =
is_on,
> > +                                     GENPD_CPU_ON_POLL_PERIOD_US,
> > +                                     GENPD_CPU_ON_TIMEOUT_US);
> > +
> > +     genpd_lock(genpd);
> > +
> > +     /* Re-check the status as we have released the lock in between. *=
/
> > +     if (ret || !genpd_status_on_unlocked(genpd))
> > +             return -EAGAIN;
> > +
> > +     return 0;
> > +}
> > +
> > +static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
> > +                              struct device *dev)
> > +{
> > +     if (!genpd_is_cpu_domain(genpd))
> > +             return false;
> > +
> > +     /* This is not for CPU devices as those are managed differently. =
*/
> > +     if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >=3D 0)
> > +             return false;
> > +
> > +     /*
> > +      * If the current CPU doesn't belong to the genpd's cpumask, we n=
eed to
> > +      * wake up one of those idle CPUs to power on the CPU domain corr=
ectly.
> > +      */
> > +     return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
> > +}
> > +
> >  /**
> >   * genpd_power_on - Restore power to a given PM domain and its parents=
.
> >   * @genpd: PM domain to power up.
> > + * @dev: The device that needs the PM domain to power on.
> >   * @depth: nesting count for lockdep.
> >   *
> >   * Restore power to @genpd and all of its parents so that it is possib=
le to
> >   * resume a device belonging to it.
> >   */
> > -static int genpd_power_on(struct generic_pm_domain *genpd, unsigned in=
t depth)
> > +static int genpd_power_on(struct generic_pm_domain *genpd, struct devi=
ce *dev,
> > +                       unsigned int depth)
> >  {
> >       struct gpd_link *link;
> >       int ret =3D 0;
> > @@ -1042,6 +1108,10 @@ static int genpd_power_on(struct generic_pm_doma=
in *genpd, unsigned int depth)
> >       if (genpd_status_on_unlocked(genpd))
> >               return 0;
> >
> > +     /* Special case for a device attached to a CPU domain. */
> > +     if (genpd_need_alive_cpu(genpd, dev))
> > +             return genpd_wakeup_cpu(genpd);
> > +
> >       /* Reflect over the entered idle-states residency for debugfs. */
> >       genpd_reflect_residency(genpd);
> >
> > @@ -1056,7 +1126,7 @@ static int genpd_power_on(struct generic_pm_domai=
n *genpd, unsigned int depth)
> >               genpd_sd_counter_inc(parent);
> >
> >               genpd_lock_nested(parent, depth + 1);
> > -             ret =3D genpd_power_on(parent, depth + 1);
> > +             ret =3D genpd_power_on(parent, dev, depth + 1);
> >               genpd_unlock(parent);
> >
> >               if (ret) {
> > @@ -1306,7 +1376,7 @@ static int genpd_runtime_resume(struct device *de=
v)
> >
> >       genpd_lock(genpd);
> >       genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
> > -     ret =3D genpd_power_on(genpd, 0);
> > +     ret =3D genpd_power_on(genpd, dev, 0);
> >       genpd_unlock(genpd);
> >
> >       if (ret)
> > @@ -3410,7 +3480,7 @@ static int __genpd_dev_pm_attach(struct device *d=
ev, struct device *base_dev,
> >
> >       if (power_on) {
> >               genpd_lock(pd);
> > -             ret =3D genpd_power_on(pd, 0);
> > +             ret =3D genpd_power_on(pd, dev, 0);
> >               genpd_unlock(pd);
> >       }
> >
>
