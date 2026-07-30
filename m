Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F273E51E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403568; cv=pass; b=YAqbrhRk0pHq91rrfJNZLGTm6uwz6mpYvhHwa4Ys3au31AtO3BMZwXml56/xzFRt375sQyG7tDJRoJsWboNK+pSTlQGEWHk3ZU6IWbdjjs+0ZLuqCjCQ9WYYhY4DLW1l2h4kbjt1frfUQOE/jYYWGiDS5lusFPtcbnF/0Dcx+ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403568; c=relaxed/simple;
	bh=d6jBdyE9RvlKKjJldB/+re0AqKKURAyopW6Wd6wovmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANZuRwDRSkse1YBmWbbu0sWSsdsu0rgVbqGZRDKqcgwZ8FD+j1qmZmbnqk8tkYjRB31xi897p3YhdbennNttGLtQi6gcy/W4GF+6o3E5rdg1s9A2G7wKbJpoQrgiofz79lePz6HvLA11cU41HcIBaZpJgECSGyViN5/GBgO9Xgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDP2u/ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuOk13eN; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDP2u/ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuOk13eN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8u6N8263828
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=; b=FDP2u/ftT3BNPClS
	pHrm3gZy9cvUA4WRh4VSmAjAn8keKOeY2M+hndXYumQvmD+epXd+Qybd3LYj2iYD
	FO0JxrePbPEKMOYfPbvv08aT7TDNCGRSKzm1zl4iXTdc82lmLA1hjf7BmfZpYGb0
	BVh/ydCnlydc0Cv6vhRCi+shywvSI/JiF2+rTs+5bPX7g0akiQNrz+CTdV4gnsvh
	HNRpQOunKhAj4mTrEXpVxzriOe7A/BQTv9Lpagni0UlYa+OXQstb6vmwvQiBaTTz
	s4kDRKmeAOfce082GQdk1jjNaIy7AWeNqvpB5QGEJEGDJcx+qsjK0PjkXcDVWxWE
	kWh1Nw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3hrg4tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:26:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efe7db1c42so21616036d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785403565; cv=none;
        d=google.com; s=arc-20260327;
        b=MwwW1caCjqETZLSNYQzr6yDf9slKiOiEF+4QIWq11iorplyAhAEG9RntbwRYfzHzRa
         r+0a/WWecZEv5aWf+xVqet1WGnhfyZM6gDdf4DtKhYY6/Arp7BVdxNAMjnI4YsUTXu0y
         2T4/p9GxKMHZMgkKNmv7Q3jeyCPRIPu5Bv5dni4Ze4RDbFzJrUGF520kbNcz0CRINrFq
         sinubCNeTl45XOaH2ztU8CwSjsWDWMJbfmMzGTyZ9wHlao47u40Kwd+cpk9te+53sbTd
         6RIDvH76gwnUbHkoaimcMHcItoBiMX1JOHvuUWShTVYUFxjXMrNjQUAIGrt8bZpiQesI
         V84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=;
        fh=5D6hAWjEn4jBPDJ2Y1kB1XLAJg+zjo01uxWxbsPs08c=;
        b=PlBdYUSXvfcNeEQQJ3YwyNBh46kDkVngCLDtDwsTt85ywPKtXkDo4KQySOnF9VS28w
         A6F5S8jP8A3K20byIyrfVeQpwu5g5jMfRYiIvG+/uHPlvbBBbhm/gfba/8WoR+VAFnHb
         e3dgEfauORfr7e4OvyHHeBwwHL7dldAAjHjMWvavnBOA+hwXcWNnsMJY8A0KEjIDsZ66
         ZnB4FOf0t7pqbhMV//f34PdQkb87sgegvWAxVKDVqE54I7sdlEUnn1DDjfWW7QfxeXZf
         mutJNqFrHyltnAVeEEizKiLrLaDCNLZ1qGLVrW4oykxw7ofEErrXyqrgqPzU2wjrcbki
         /vXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403565; x=1786008365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=;
        b=cuOk13eNWtReVDWgYASJpDsia4O77VPmTutmCPAhbJjCkpPViVTNsh419bGmm/lbBI
         YsuQMizzPnMD3Uc4nWuDcb3GOHGZqsn6uVaMIMVa8N+1U6i9qD8towa/ztJqTdSoI6jW
         feMn2nBF6lfwsDAqystmfkqWpOruABVb8maEEUiKdUW9JcWGrGXTblII4oihTVHH/Onm
         u9MAVI3HNNkiTVh3HobScKcI1Lai6Wrs/5+lgjrDUd0MV/ZHssKtgI32oJEyykKIh3AN
         juVNPcyG6gHuQr40YiLN+cRfVrORxXyk0kfCoIPVSNW76ijvY06yDU1NRBV0V7EsusSf
         EAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403565; x=1786008365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=;
        b=jN4F+zueuSeSExCaQwXtyGV4UbrVLGDt6LHq7ArHG0MbGKNi32/MJq08Pdf08HDJhv
         Q5Dq7JG42bU8CACkB4I671kCsjQ6+O5V19L1zggKTXIea+OBnaC+Dy0Xnzu7JNs2KSIg
         Y1Edc4Gn7XXTUwknmDsg8iuJBA9+wcjmmq0eutsNXZUl0hV8J31f/Po0SpGeJWkIbcgn
         kJT2E0Fdzw8MNikMxF8RSF/bF8pycHDFapu5T4QHT1EEHQCVwadSI64DEitp11/qt3ac
         TeHTfcwIGhPan3Z2a349AG4av38QXW9e/zGbVqo9wWMFV/1VILQTCqMEYSRNdoviTcue
         9I1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFV9O74EG7nC7UbIbqXmNQj8IFNS8kD0toieLUaB0zUnlnwEAVY3ajdKwlDgg4HkvCYB0YsvAj7b+Eu73E@vger.kernel.org
X-Gm-Message-State: AOJu0YxP46LjZ+d/Aiv3PCyUYtvGaHLjA0WjDkL3J/0fAtJwyXdyhUGC
	4crSr8TkYI/w7MVZ39YuSvvCMaWLB+xuz0+vFSUlS/6gSdHA53AaGzAZ32w+ru349tNWlRdpGUH
	akzBWziW6BarsvtmleWkE68P/HIg7ADf3lhwUWODzV5Q3EPjUf+WvKMfkG0afTx8BrF5lpumeSC
	ZdopCjYK32PVYC6Ot7HE6Ab06ygktRd+nbElFXYyOiRWU=
X-Gm-Gg: AR+sD13n83DY7u6z0t8r+Z0QW9oGrJ2zPGZezdKYBOwsuDrD8sV0G/xwE5Kt51ODm4Q
	Pfyza9rhzBexHSgAbh0UfsqvI0kHj+VdByGp/MFoAK6I/5AVn8RedvPApVx6a6twP7z99155HLp
	Jb9bgz75qFjpkbU5ueB307Fs/pEhfE2onhBovRqabFxGuuLf6Qg+OHhwrsl5WDUGEKsKBhLn7uS
	IOhPY7VNo7TRrc+nbxNVIk207os+rnLf3VuA3EDAh+H43KYOyPzC+1xwk6wkn9x+wgqh/sEsG0=
X-Received: by 2002:a05:6214:5702:b0:904:2a2a:d3 with SMTP id 6a1803df08f44-908347eb8ffmr17145866d6.47.1785403565327;
        Thu, 30 Jul 2026 02:26:05 -0700 (PDT)
X-Received: by 2002:a05:6214:5702:b0:904:2a2a:d3 with SMTP id
 6a1803df08f44-908347eb8ffmr17145746d6.47.1785403564947; Thu, 30 Jul 2026
 02:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com> <a4a1dc46-ff07-4ecb-b41f-341b6aacb3ab@linaro.org>
In-Reply-To: <a4a1dc46-ff07-4ecb-b41f-341b6aacb3ab@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:25:52 +0200
X-Gm-Features: AUfX_my2K2kAR81YYtKMh29QHm6PVDAYVdCeK_BkR_HVuUNHZjZo17pEJloalkM
Message-ID: <CAFEp6-0ZBEb6x52dabGjF1XLgq4j6Ty3dKtMDJ1qNUTPGS+kHw@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jiByZ1e6ZuJ5GP9NEv9F9Yx5jwW5J5E0
X-Proofpoint-ORIG-GUID: jiByZ1e6ZuJ5GP9NEv9F9Yx5jwW5J5E0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX0gyCBipPJxhx
 9omwTaWGmJr0XnsWK2/nYk/4WOXD+UilBkbnn7UV4eR67fL3/A1c2bxEW7gvNNdJ+Cbd9YcJ/1/
 +k1azWOceVxx9cV2K+uwDDzcHh74zOYHZtIBHfugWhoylvEgBK1fFYD1cDABNmHW5WAu7KSQfca
 szKUAfgSJvaG5SitUWc7GzcPJ6zzw81RR3YhFzBDG9uoSc+OFudxTrzdpvpAyEzR0jmtZOkyHpL
 0TEyGvbf78vHcBRkhwbxvb0SlvaTh6UWmMj2mOau9Cx0nWc72flFpvui7LVuecsvmqqSvekUzLn
 lWSbVgB3xYsRDL42m02hslP/kikqM1+9jrp6CN6kXeGoGkJ1kXkUIrHqUrUhK4nIdEG5BiU3Xdj
 MvoAxheOIksldquNLShmrh3PZZUP6mxwRd0XdkN7r/qQq/MSoYMSTUojqsdPllPd4TgDsB6peRB
 248ee1iviWzt01Phzzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfXxg5iJo/MlEzL
 t01t1gOS96AtkvKmEaV3dcxnJRgFpp9U2OrxPXvkB3QdVI8f4+yuVUwTr4kVxGee9iBu0d2kG0f
 Ies6iveI3lial0Lh16gw3n13a3Kuuew=
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=6a6b18ae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RhRaUx0EnXGA07yME0YA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300069

Hi Bryan,

On Thu, Jul 30, 2026 at 10:39=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 17/07/2026 15:20, Loic Poulain wrote:
> > Add optional PM clock support to the CAMSS driver using the PM clock
> > framework. This allows CAMSS clocks to be registered once and
> > automatically managed during runtime suspend and resume.
> >
> > This is especially useful for global CAMSS clocks that are shared acros=
s
> > multiple CAMSS subblocks.
> >
> > This avoids the need for each subblock to reference and manage the
> > shared clocks individually. A typical example is the set of clocks in
> > the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> > blocks.
> >
> > Introduce a small PM clock descriptor table in the CAMSS resources
> > structure to describe clocks and their optional rates. Initialize
> > these clocks at probe time and delegate clock ownership to the PM
> > core.
> >
> > Hook PM clock handling into the runtime PM callbacks to ensure clocks
> > are properly suspended and resumed alongside power domains and ICC
> > paths.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++++++++++++=
++++++++-
> >   drivers/media/platform/qcom/camss/camss.h |  1 +
> >   2 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..6a2bf3373e8755805c8cd0f=
8fe5037b788d68fa2 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -18,6 +18,7 @@
> >   #include <linux/of_graph.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/pm_domain.h>
> > +#include <linux/pm_clock.h>
> >   #include <linux/slab.h>
> >   #include <linux/videodev2.h>
> >
> > @@ -5346,6 +5347,35 @@ static void camss_genpd_cleanup(struct camss *ca=
mss)
> >       dev_pm_domain_detach(camss->genpd, true);
> >   }
> >
> > +/*
> > + * camss_init_pm_clks - register shared CAMSS clocks with the PM clock=
 framework
> > + *
> > + * Clocks listed in res->pm_clks are shared across all CAMSS sub-devic=
es (e.g.
> > + * top_ahb, axi). They are managed automatically by the PM framework.
> > + */
> > +static int camss_init_pm_clks(struct camss *camss)
> > +{
> > +     struct device *dev =3D camss->dev;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     if (!camss->res->pm_clks[0])
> > +             return 0;
> > +
> > +     ret =3D devm_pm_clk_create(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i =3D 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
> > +             ret =3D pm_clk_add(dev, camss->res->pm_clks[i]);
> > +             if (ret)
> > +                     dev_warn(dev, "failed to add pm_clk %s: %d\n",
> > +                              camss->res->pm_clks[i], ret);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   /*
> >    * camss_probe - Probe CAMSS platform device
> >    * @pdev: Pointer to CAMSS platform device
> > @@ -5434,6 +5464,10 @@ static int camss_probe(struct platform_device *p=
dev)
> >
> >       pm_runtime_enable(dev);
> >
> > +     ret =3D camss_init_pm_clks(camss);
> > +     if (ret)
> > +             goto err_v4l2_device_unregister;
> > +
> >       ret =3D camss_parse_ports(camss);
> >       if (ret < 0)
> >               goto err_v4l2_device_unregister;
> > @@ -5775,7 +5809,7 @@ static int __maybe_unused camss_runtime_suspend(s=
truct device *dev)
> >                       return ret;
> >       }
> >
> > -     return 0;
> > +     return pm_clk_suspend(dev);
>    CC      drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs=
.o
>    CC      drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.o
>    AR      drivers/staging/media/ipu7/built-in.a
> In file included from ./include/uapi/linux/posix_types.h:5,
>                   from ./include/uapi/linux/types.h:14,
>                   from ./include/linux/types.h:5,
>                   from ./include/linux/kasan-checks.h:5,
>                   from ./include/asm-generic/rwonce.h:26,
>                   from ./arch/x86/include/generated/asm/rwonce.h:1,
>                   from ./include/linux/compiler.h:369,
>                   from ./include/linux/err.h:5,
>                   from ./include/linux/clk.h:12,
>                   from drivers/media/platform/qcom/camss/camss.c:10:
> drivers/media/platform/qcom/camss/camss.c: In function
> =E2=80=98camss_runtime_suspend=E2=80=99:
> ./include/linux/stddef.h:8:14: error: called object is not a function or
> function pointer
>      8 | #define NULL ((void *)0)
>        |              ^
> ./include/linux/pm_clock.h:77:25: note: in expansion of macro =E2=80=98NU=
LL=E2=80=99
>     77 | #define pm_clk_suspend  NULL
>        |                         ^~~~
> drivers/media/platform/qcom/camss/camss.c:5841:16: note: in expansion of
> macro =E2=80=98pm_clk_suspend=E2=80=99
>   5841 |         return pm_clk_suspend(dev);
>        |                ^~~~~~~~~~~~~~
> drivers/media/platform/qcom/camss/camss.c: In function
> =E2=80=98camss_runtime_resume=E2=80=99:
> ./include/linux/stddef.h:8:14: error: called object is not a function or
> function pointer
>      8 | #define NULL ((void *)0)
>        |              ^
> ./include/linux/pm_clock.h:78:25: note: in expansion of macro =E2=80=98NU=
LL=E2=80=99
>     78 | #define pm_clk_resume   NULL
>        |                         ^~~~
> drivers/media/platform/qcom/camss/camss.c:5851:15: note: in expansion of
> macro =E2=80=98pm_clk_resume=E2=80=99
>   5851 |         ret =3D pm_clk_resume(dev);
>        |               ^~~~~~~~~~~~~
> make[7]: *** [scripts/Makefile.build:289:
> drivers/media/platform/qcom/camss/camss.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
>    CC      drivers/media/usb/pwc/pwc-misc.o
>
> Please fix.

Thanks, I submitted a v3 with this fixed.

Regards,
Loic
