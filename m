Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881C456286
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776481; cv=pass; b=M0BoHo+s2mgc6kYYcA2hdHmfmRNHo2WA+c8VARu35fcX7TRzaeq9tOrx3NP0qflG1WOaEkVAnKuDM8foBMbgKACVbTJPLyYWdRosA5EkcCJwcLU7Bklf8FCWW8H4nliHcDMQ6SKl4gA7FlRaMlBmqfeN1hxL3CHMtVkmrYlgvjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776481; c=relaxed/simple;
	bh=7TI4vt9W5TNa/Vam8VTAvr0A4YViYgfj3DgkpTlwbZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpVyCYoKG4AM5kSRoDozp5mrCiHYVqYfER1pihDuGl5+H+l4CQtEoxX2/ppLQBTQkPNeRwuOo/QN83Oh3kkC+4MqfVHEx5uLjE8KYMLyU51n2Nz2JcFtuVmPJNViogHsHqg6/srGNXY6jTiLtbhd83TRzeW+1DtoV9qpV+vFduQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bcy9UktB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYLLW3uA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bcy9UktB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYLLW3uA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bUEB3189564
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=; b=Bcy9UktBH4oVROwE
	RifhQdsu0OGWptbh3PQ7tg5u5T7NPqvUPO7Ns28E4AGl97CqJjSGvLHnfQLY5O11
	Tu9n7dW47TcxMes38doT5qMKchJGt5dtpi/bF5vAaJrZgTmzD8UpalGrCtv+SQ5S
	qa8TlPxvZ2C86iKYSAaQIkyU4DuS0cnSkS2ELj0WRF3K0hUmdFEdeRoIzyEsfIOb
	+uMmk256TBD3SktRNSBFKCQhgFEqHAwckK1cGK9P42bhrCqBKgQltY4BcCm/tn15
	wZwR2cRFQ4Ra9iemknbDMNpAHbMem+12NIfTEAkJ3q1IiqtG8ym172pL5Hh3Eqhi
	0dZ8Ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0abv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:21:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85722fc5a21so4265986b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776478; cv=none;
        d=google.com; s=arc-20260327;
        b=EVfPPR1Sv6rgoGHO2Aygo38WGf0/10OaI9FUvbtolNwyJbr52sGtfa26+MzdlAtlOV
         9vgHvkWPCLo2ztFoYAwPN+eE/jTKZF9cO/zmxTJI9+TG8MIvEJXZTo2E0NzN+H6mVaBA
         SDuL2jstEJC5LaOFLsertoTtCQISaqe7JZqfwv9CSYpGjJfY+S5XbBi3iH8Jm5+LVVCG
         hecW7kUha0wyGf6CHgkPKplOEndxu9oLksojt6+5Bfo1qruJJxvuE9u9lLRqyneGdTr1
         7hPgOQ7LYimFbpPMkBTMIu44P6giEZz3Cs1lVxcNnAk0CUO5TM8/LbaUc2yCJAh95i8c
         Z9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=;
        fh=r/Ii8yqM6VLX53oi7nYZuDornzALBEZYOubt9wNouwk=;
        b=OAhwyrgw10CYQCZ8G0nvrqSlsK2TvJ7LO57EfZsipI1jQ4I4aVKCFH/1zB4E3sBB+/
         EfDrfVfSPjT0t2IFYvuXuUnB7RjtLDb4oAI+XqqfMwiK/CFvIoMY+zbBeG80ammvhdQ6
         nKDIRpi7XgzD0Dl/o2R9XIrTeU2Qnf6LAfSGcHEsm22zjYnvDYs6EhnHHKrZ9xTb/8d2
         MkCZ4a6HzrI2tdd15NXwj6xYyPapZJ56PdPxaFzPfRBxGaANdjTR5wOVihl+1WF7z0Il
         YPdfcSdoQ512XfFaCnCQCbJzgYGjxxxJbv9UL08IzPeBozuZrajrwWXlKG9DWlBhtGH5
         tj5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788776478; x=1789381278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=;
        b=kYLLW3uAJjDIl1AR3fOb8LE+Q+6PY0IjD/v/8jZQ35OMHLOOQN79oKdDnOzYTIq+0X
         0T3t2JtwC3kdMYD5PZYxTGCc8VqTXCmzEV46yyDapRDSBQ4u89i2w+blgCszjzKXNm6E
         SNPMHzalKAXGXVCTLtKFg4xcyjEVHBOq7owe9DVQ+k+Si199a8GOUIlOx+RsYi1QTsVs
         /k8m+ZZcTP/2L3aFb2WqqKgZ5/NylrICzav8Nxcr2KR+/jC6aKtxwFfL5lD0nvdk2Fr0
         AMbXY0/BDvhvWmsRisTRR7QyhZKYPyDcSHJlqc1RqvRYtPdPUictLgH+pWjlZp1TAuUW
         S+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776478; x=1789381278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=;
        b=lKED//hk6qrHkDYyRBifoXfSY5Sg0Rz4kjgY4IfkYczlvZspqOKhwjgXjudLWH7r7f
         u/zjVsa2+ik+Yz1i95xwJ+U8eaA6cp2zwHavq0iPgatZbsfQjTcu1JF5JhtoSe7OMbqx
         9ZeweS5USV7cG2n2FIfiomqWiCau8epq0SWOW1LmeLlfiWPJLzhlKFgtqpLU654EK6kR
         h7rZcHFpHoaR+k0kvujGu1EPQKosJ77AofDRrGEkmjsfdXQps361dLXtIe+V0Itjblt8
         /IgWKQ3OybRFPsycIpJZeoiyvMhdsjk+9xONv8c/D0sIvn19M+V6kKJEMM+6NGXC5zFg
         XYYg==
X-Forwarded-Encrypted: i=1; AKwUvBxO/mbZLcBxTW2l//F2/T7DleSt6WWSMrpDtBTzM5pPWlRsD7pR+PhBuxm4he+Zl1BGq/da2fRNzcFgnKwh@vger.kernel.org
X-Gm-Message-State: AFuF++n9hBvPYJrB4h4sjdVvHfja91o0v69Uumw/2xq6MXX9nkTqPGJB
	RCtu7+aAdz8pKXDkoOm71GIXELmIGfDqVdss4WnVXKaoicKNgBCva9X+8HnsTsfC0OG445Q3d34
	ax8Nl+iMLT4MOEy6uGW70zCwxV5mF8ET7Brzl55ubYOeQxLrVOvw7f5vJDA01BDlqgp+paeVn7P
	m3Vpv0pVcT0uCUOZgxgcBFZJAEdGWRK+lwxn0SIuISxPw=
X-Gm-Gg: AYBFou3sger/afM0f+fIUUN2yAot4DqLkkZdWS8t2MFiUvGW68jkmmdid4RneQPeXXl
	ABTqr1Ns9OpKUoXmgTFjGoFWtPRcS4aWrJhC6iiXzLxal6YLCxDKmyllX0ODVmywAlSC7gOi4Bo
	onbE0cFzPqQJxqDoViXNf0wKE0gwSIOitQIQG+D7pISoUyC4MocGt0nwkxlQ==
X-Received: by 2002:a05:6a00:4c8f:b0:84f:5cd7:e3c6 with SMTP id d2e1a72fcca58-861662d4ce4mr30999455b3a.5.1788776477927;
        Mon, 07 Sep 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8f:b0:84f:5cd7:e3c6 with SMTP id
 d2e1a72fcca58-861662d4ce4mr30999352b3a.5.1788776477149; Mon, 07 Sep 2026
 03:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com> <12268d64-08c7-421f-83e2-e6306fde9a88@gmail.com>
In-Reply-To: <12268d64-08c7-421f-83e2-e6306fde9a88@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:21:04 +0200
X-Gm-Features: AcwNN1XfD57hC8DPhUlZJGAy3-RlDshBPQUcpMqu3eRHVOiq1DrVi21R9DJBy6k
Message-ID: <CAPx+jO_OWjZpt5SZpCrFUXXVsJ5izV5Ez5BuEVT+s9YHy4enCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
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
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e901e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RK_iZM9tDnEtT-fnq2oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QiPO0ibj21XBPtW4UJYm0Shjx7Y1bbsH
X-Proofpoint-ORIG-GUID: QiPO0ibj21XBPtW4UJYm0Shjx7Y1bbsH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfX83XQu+hKWkhe
 sdEjui7obHckvWfeDMLGnW5NitUtG1QN/dyNbfQdxY0xk+Tmnb0a9dt85FKBZCDRj+pBoxstSrX
 cKeZZMmX88H7GbHyPihW/tUR+eV62+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfX+YII0QVwn1fM
 TrTJ/d/cw34/w0qhY9HNFV87UOkScf+uIk8ZFQo49RrjC3N8+v7lqh9vyEBYcGjNZ3/FmeFDVd3
 Y+UzldLqPTGS7YUY/ifXzhBYy+IZGdqsZAy0YRYkwMYOk5n/zwC4TOvNsU8akPjFJZp+G7F+la5
 skb4QSjSkuNie3hvZ41a6GvCpXLsIjOwisQL7kcx89+4ogQJv9hNTw2Te+RHAxU/30HLQCw6NMv
 DPGeoUTGrp38+g/hZCo9sIMlsj6O7BFID1teQW7HuRsx6bFcDvQXohxUeWGNnfjgv+h5JiH7DNG
 PIVE3rwz6FOcqr4UHZQt2e9anAWgMFrx6au7k0rOHL+Xr0zMo1LxscR4tGlEECNuDsX1CHc6fIE
 ItiwH0vuTX9HSY58r4xhQJkh8QK+iFRxVK7QTMKILi5dsPUr7n0LTDSOx5s5nVNHhdYSxtn4goq
 MeVd1p04/LGxBrh45vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070113

On Fri, Sep 4, 2026 at 6:26=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wrot=
e:
>
> On 01-09-2026 16:44, Ulf Hansson wrote:
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
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v2:
> >       - Rename a function according to Abel's suggestion.
> >
> > ---
> >  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 6ac1ce18fda3..97273ed2f825 100644
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
> > @@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_d=
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
> > +     ret =3D readx_poll_timeout(genpd_status_on, genpd, is_on, is_on,
> > +                              GENPD_CPU_ON_POLL_PERIOD_US,
> > +                              GENPD_CPU_ON_TIMEOUT_US);
>
> How is sleeping here made safe for IRQ-safe consumers and child domains?
>
> For a hypothetical example, consider an IRQ-safe SPI controller in an IRQ=
-safe child domain D,
> whose parent P is a CPU domain. CPU A is outside P, and CPU B belongs to =
P. Both domains are initially off.
>
> A runtime-resume request on CPU A follows this path in drivers/pmdomain/c=
ore.c:
>
> genpd_runtime_resume(SPI device)
> -> lock D
> -> genpd_power_on(D)
> -> lock parent P
> -> genpd_power_on(P)
> -> genpd_wakeup_cpu(P)
>
> genpd_wakeup_cpu() drops P's lock and sends an IPI to CPU B, but D's spin=
lock remains held. readx_poll_timeout()
> can then reach usleep_range() while D=E2=80=99s spinlock is still held.
>
> There is also a problem without the child domain: for an IRQ-safe device =
attached directly to P, __rpm_callback()
> leaves interrupts disabled. Dropping P=E2=80=99s lock restores the alread=
y-disabled interrupt state, so readx_poll_timeout()
> still cannot be used with a nonzero sleep interval and timeout.
>
> I have not reproduced this on a board; this is a hypothetical configurati=
on illustrating the paths.
>
> Is there a restriction elsewhere that prevents either configuration? Othe=
rwise, this wait cannot sleep,
> and the parent lock needs to be reacquired with the same nesting depth us=
ed by genpd_power_on().

Good point and thanks for catching this!

As this path is only for CPU PM domains (has GENPD_FLAG_IRQ_SAFE and
GENPD_FLAG_CPU_DOMAIN bits set), this is solved by converting to the
atomic polling helpers. I am cooking a new version!

[...]

Kind regards
Uffe
