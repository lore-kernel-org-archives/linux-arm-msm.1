Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECF3BAD8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734711; cv=pass; b=E8vdPoekySSzMGcHJJKfFiEBUGo0gfxY8krFDHkYuQC3Y4Kx01hxh9R3PIpDSwnQn6OUpLdP3hXLH+jC8z8YGkkr8Sm7YptPQstBylOO1KueiGy67mvjWxn4yAF6wiY/CTSLFkPfu7b28ls1mqQ4SBJsBAkS+TavBdpnsHnkGHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734711; c=relaxed/simple;
	bh=dMtQSwzzM/lzPFWkfTlT0aoaZ6sOehs9FNkhsO+E1hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBBrf8jyx3rd+SLM55WdvsIHeaPyT9099+AeXDp27CXa1+ViDVXExe6QWU0g3aiNRuiJELfTJfLb0+kXlQHG8lGNKZLAF6YIQgvNng5anjBGeIlMvhCe95U4nAfes7+IN5K/I346oTh7K9eHfqf7ocXBp8TDFtJ8vDYcP8XhH70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvQaJ1Tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKvFuCyV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvQaJ1Tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKvFuCyV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RqbV3210724
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lecaep5z0/jqobjy63SLhwDOEjbRilDUBJBdieaIQ5M=; b=MvQaJ1TpP1vtLU4V
	GmQ9KAwM1u6rzF0xwsv+a/MK6VtwHYfOdI2GbIOEXXalHGci74e63isaN0+iQW5v
	aR1HEXi5ezVuxU8DxKJs6l4FVBL4tGdXSkuyPdHoftDFVinRCIWLkDLLhEeViz2Z
	58uzq1Xt4W4V/zVGWHnmnyuJWj5QzX37kdBZ5gyQNRTmrNCLXW3ZerNWJ/9X/iuw
	inlz+BFa8pM2LA9iA1orFUemK1rvnped9r+8OAMo4YWzeagvPJXbKtSFbXghm+JF
	efbbVPWohhG4Fd0/EqRIuYmtFhXzR/FOGyjLr+o5npJDg+uSx6+7Ithm9YU1QXp1
	8TKSYQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgrb2m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:58:25 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-669864510f5so1061550d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787734704; cv=none;
        d=google.com; s=arc-20260327;
        b=HFypV+fbHYY53wZrQxtrrYrpNTxdycVDzlT3QVFrilpJyMavYE4uSVrTG408Y6Ehgn
         y1o98FHWGFWdGEiYjiK0WKDLPOeAluOikcEY8R4isOaEr32ZYvMS3co/inYrCNJXMM7F
         qUMf9VX6QQdVyK8eRMoZCSLxql0gOzWWZi3r8E6u3OEEKHkKrGSEiQygzyf0WTj5wTKS
         9mGqOUTh9KlMvIk9jz4Dvirt5vW2tqHmwAn7gAD11JxbWL7t0XGH6PSGkMtVVqBKOavl
         IivQT5QIbm0LaEd6qfigKPAN/bQ+/UTPq0g0t8eqC9YoFMdTjbTrkb2ZD5QOUJfypPLa
         +XkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lecaep5z0/jqobjy63SLhwDOEjbRilDUBJBdieaIQ5M=;
        fh=+h/6SQ3Q72gjC8bOry2XsSgmhbJzAp8YJnYIpM39QbA=;
        b=kjIbkXFKu3RuvEXhpFl1bL5CYeiau5kdBvB9ZiL0DIT3MJKeFLx9INJAAd7At8LD3+
         xjBp1NBipacdubKD6Hd5mvWkeafQ5Dw46cS3zjyTh5RYD9h2GggxyvjZD8Pip9cn0KDF
         VLqnWYkr8OEH6EyCIKVpnVXVA8CtfzgytcTNjakj46vn5BVD+u3G+8xozpWIeNHm5D6B
         HMJbU6yipv0+zuRpzHnBWTF+u08GB0wgfJOuOFomiwFnycOPL85hhoVVCEkyOqQG13so
         YRLTZ95OaY7YPoRVjT86O4bB9dl42aGUxnn6vSAEkQyAFD8Ine1gzSGu8qgumI4yWSO6
         PhBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734704; x=1788339504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lecaep5z0/jqobjy63SLhwDOEjbRilDUBJBdieaIQ5M=;
        b=MKvFuCyVyeJr9opljkYpfkiaB6yewJd4HefzL8LoUvLbMzDQ+snZlhMYBjn/NqIMWh
         08Yaoh2nAGy0tGzpwthMaaaWIeezFVYgmX2v+NjBfCTWx2dPkkhqq2hC+7myXrEt6TM7
         DkjDSHpz3R9Xcp8tpJmbkbtZX84L14lxtiGTnrSRuAsZZm2r1GVHv8A5vAI/YP8yLjB+
         fPlIpJO/ECsnj/LpCfzSdzlo83fH8cz9EK8Yj+FybZgbh2UE4ysag/P5G+hlb8bx48rZ
         Sxe7UhpJVNcofWMBQy0qyHocVAvdtWAH4i/4TTajKBWPY9I3OHIJm6vCaH3sueW4wQvq
         eIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734704; x=1788339504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lecaep5z0/jqobjy63SLhwDOEjbRilDUBJBdieaIQ5M=;
        b=llKNzqRnYdRZpmC9t8ltQVTAHluOTDeMNdvqyF/AIQ1fsZlAcijEJiqXjE287xE9/o
         N4FrV2aDomnXWHu9I5YEGXe45EETUt5kfOZaD9GdRzZvJZhJPMwTdqnQpQlV0ZilcxyG
         KDLk7/oE6qdjtUgV7HoS6CDzYlrJK43Iqb/RVYNyeB7Fn5y4Lep7a1abU9N73FMqt+PZ
         EORb8BQLDNrVI8/wbpmjPg8VF/bkhgT506VEXkUp/uEyqBrn4zBZCNbL4KQCZrD9wCdF
         r5rigERuh0t/UAzXyvcBo4k/7guj7H363KQ/Tw9rCYusBaLIyngYBRcl4Nl1mhcNKKMG
         V/8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5uvDv6SqWouhqJMt7sO2zsrjMcJKca0kIg5s96FcdTzi+D9lc53DNi2aeYqPmv7M3iIcSGksV2XV8Ta/X@vger.kernel.org
X-Gm-Message-State: AFuF++lRCEJfB2H6IKleZT+dXYAn2ya10jVZ02tI+NRw+nbWHJZPj7G1
	mY57rQ4WLmqKq8+uYy92u+n8pHO/8JdERhZKp6wH03FhsB2o9r3y1miKYYIYuDH8hBLURo+IwZk
	BjfV6ZZlltESgP4DqiBuXHQaR99EC7/hrKnalPu3tvN3DtA2XchVLaRWlY/AW1kiV78ymdJRirb
	eNj+Qtrzw1Z1H1hwwDlUNKxo22owkZ0SwXCvz/0cMzPbs=
X-Gm-Gg: AR+sD13YgGppK/U6Yo6pELxQikCLtYSbQoWOvMsDfFlbMlXQSBUHReh8jXk3AjlK2LT
	sacMWq3+RmtDHLipp2joiT1wLu7ule/djsDJzfJPsUTO2tPTSBDk4zUWrczVKTsLLURp0p/bISv
	L7xxvVw9y/zB3eN9AZr8fw6VnwW1sZLPhSRgnZDbELjg2veuXmhfOxJ8j7zQ==
X-Received: by 2002:a53:d004:0:b0:66b:1640:53e with SMTP id 956f58d0204a3-66d256b5645mr1226781d50.20.1787734704280;
        Wed, 26 Aug 2026 01:58:24 -0700 (PDT)
X-Received: by 2002:a53:d004:0:b0:66b:1640:53e with SMTP id
 956f58d0204a3-66d256b5645mr1226762d50.20.1787734703696; Wed, 26 Aug 2026
 01:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com> <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com>
In-Reply-To: <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 14:28:12 +0530
X-Gm-Features: AcwNN1U8FZm19Lv2OLqIXPgs9hXT2dAKABoQ9nh6Lo_7bQATSnzrXnRKXmFWhrw
Message-ID: <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Gr2dtCQDXUrDl5ZMvze02p5kr5E8dRO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX077exDuadCWS
 XOLz5fmoWUWsC3WIyLrmImvRH7V7WNgeCbgWFyZ5xJF+d2B5W/WvLWnQl1HzTSbo2kxryYo3oIO
 2MkB8+A2GbYc9816pqxc//MF+jIXQ1ox6Nalwu1b639UidiSXGA4ImfUDAMAuq3vuAd7mb/M/Kk
 mZoNT/EtRLGHX12OK/2azwghvwdl2zPJEypxnJGGzlVumVU1dVLda+/JEPz1MG+hqVqe646QzP7
 443sXCNZJZPBXo8VGIihlNIeNqtKxymwyPI8ERt0X8zUg5/ZhymZDfFsVNtaNRUQ1dpOys7bv8i
 vA9UJGrwE5us7KziuYGniatC2un13X06kaG/nnsPhJxtLHkwbedzaauX0Sx/1EnIP965KYSGaps
 5fYpo0Zrhsy0QlX5FPdew1ch5ymi3i0iLE3k/9CFEYtT9M+NP5kpOYL3kUU86jSfrF4cNrrBHKk
 MIE+NRwuxLYJXzkwc3Q==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8eaab1 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=RJxGVaC0DThiSzlc3RMA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: Gr2dtCQDXUrDl5ZMvze02p5kr5E8dRO0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX00XDJ+om7VY9
 UrWLU85gnFrFlQ0nwpmHXatTVggsKz/HWE9TNJ76KAsJRo2wJ3dPgq6RumDGG581JHuUeXZoN0K
 v2mNe2bBJiG4No41EIFBqnSa9EE6vnU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073

On Wed, Aug 26, 2026 at 2:05=E2=80=AFPM Mohammad Rafi Shaik
<mohammad.rafi.shaik@oss.qualcomm.com> wrote:
>
>
>
> On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > Provide the Shikra DMA-to-DAI mappings, DMA and SHRAM layout, clock
> > names, DAI driver data and power-management hooks required by the QAIF
> > driver. Add the Kconfig symbol and Makefile entries needed to build the
> > new variant.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >   sound/soc/qcom/Kconfig       |  10 +
> >   sound/soc/qcom/Makefile      |   3 +
> >   sound/soc/qcom/qaif-shikra.c | 425 ++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 438 insertions(+)
> >   create mode 100644 sound/soc/qcom/qaif-shikra.c
> >
> > diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> > index e6e24f3b9922..b7088b1e5cad 100644
> > --- a/sound/soc/qcom/Kconfig
> > +++ b/sound/soc/qcom/Kconfig
> > @@ -71,6 +71,16 @@ config SND_SOC_QCOM_COMMON
> >   config SND_SOC_QCOM_SDW
> >       tristate
> >
> > +config SND_SOC_QCOM_QAIF
> > +     tristate "Qualcomm QAIF audio interface support"
> > +     depends on COMMON_CLK
> > +     select REGMAP_MMIO
> > +     help
> > +       Say Y or M to enable the Qualcomm Audio Interface (QAIF) driver
> > +       for the Shikra audio platform. QAIF is a DMA-based audio
> > +       subsystem that moves PCM data between memory and external seria=
l
> > +       audio interfaces (AIF) and internal codec interfaces (CIF).
> > +
> >   config SND_SOC_QDSP6_COMMON
> >       tristate
> >
> > diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> > index 985ce2ae286b..cf50b7a24bcf 100644
> > --- a/sound/soc/qcom/Makefile
> > +++ b/sound/soc/qcom/Makefile
> > @@ -47,3 +47,6 @@ obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) +=3D snd-soc=
-qcom-offload-utils.o
> >
> >   #DSP lib
> >   obj-$(CONFIG_SND_SOC_QDSP6) +=3D qdsp6/
> > +
> > +snd-soc-qcom-qaif-y :=3D qaif-cpu.o qaif-platform.o qaif-shikra.o
> > +obj-$(CONFIG_SND_SOC_QCOM_QAIF) +=3D snd-soc-qcom-qaif.o
> > diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.=
c
> > new file mode 100644
> > index 000000000000..484ffaa5b304
> > --- /dev/null
> > +++ b/sound/soc/qcom/qaif-shikra.c
> > @@ -0,0 +1,425 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/pm.h>
> > +#include <sound/pcm.h>
> > +#include <sound/soc.h>
> > +#include "qaif.h"
> > +
> > +static const struct qaif_dmaidx_dai_map shikra_mi2s_dma_dai_map[] =3D =
{
> > +     { QAIF_MI2S_AIF0, QAIF_DMA_IDX0 },
> > +     { QAIF_MI2S_AIF1, QAIF_DMA_IDX1 },
> > +     { QAIF_MI2S_AIF2, QAIF_DMA_IDX2 },
> > +     { QAIF_MI2S_AIF3, QAIF_DMA_IDX3 },
> > +};
> > +
> > +static const struct qaif_dmaidx_dai_map shikra_tdm_dma_dai_map[] =3D {
> > +     { QAIF_TDM_AIF0, QAIF_DMA_IDX0 },
> > +     { QAIF_TDM_AIF1, QAIF_DMA_IDX1 },
> > +     { QAIF_TDM_AIF2, QAIF_DMA_IDX2 },
> > +     { QAIF_TDM_AIF3, QAIF_DMA_IDX3 },
> > +};
> > +
> > +static const struct qaif_dmaidx_dai_map shikra_cif_rx_dma_dai_map[] =
=3D {
> > +     { QAIF_CDC_DMA_RX0, QAIF_DMA_IDX0 },
> > +     { QAIF_CDC_DMA_RX1, QAIF_DMA_IDX1 },
> > +};
> > +
> > +static const struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] =
=3D {
> > +     { QAIF_CDC_DMA_VA_TX0, QAIF_DMA_IDX0 },
> > +     { QAIF_CDC_DMA_VA_TX1, QAIF_DMA_IDX1 },
> > +};
> > +
> > +static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] =3D {
> > +     {
> > +             .id =3D QAIF_MI2S_AIF0,
> > +             .name =3D "MI2S AIF Zero",
> > +             .playback =3D {
> > +                     .stream_name =3D "MI2S AIF Zero Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "MI2S AIF Zero Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_MI2S_AIF1,
> > +             .name =3D "MI2S AIF One",
> > +             .playback =3D {
> > +                     .stream_name =3D "MI2S AIF One Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "MI2S AIF One Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_MI2S_AIF2,
> > +             .name =3D "MI2S AIF Two",
> > +             .playback =3D {
> > +                     .stream_name =3D "MI2S AIF Two Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "MI2S AIF Two Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_MI2S_AIF3,
> > +             .name =3D "MI2S AIF Three",
> > +             .playback =3D {
> > +                     .stream_name =3D "MI2S AIF Three Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "MI2S AIF Three Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_TDM_AIF0,
> > +             .name =3D "TDM AIF Zero",
> > +             .playback =3D {
> > +                     .stream_name =3D "TDM AIF Zero Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "TDM AIF Zero Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_TDM_AIF1,
> > +             .name =3D "TDM AIF One",
> > +             .playback =3D {
> > +                     .stream_name =3D "TDM AIF One Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "TDM AIF One Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_TDM_AIF2,
> > +             .name =3D "TDM AIF Two",
> > +             .playback =3D {
> > +                     .stream_name =3D "TDM AIF Two Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "TDM AIF Two Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_TDM_AIF3,
> > +             .name =3D "TDM AIF Three",
> > +             .playback =3D {
> > +                     .stream_name =3D "TDM AIF Three Playback",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .capture =3D {
> > +                     .stream_name =3D "TDM AIF Three Capture",
> > +                     .formats        =3D SNDRV_PCM_FMTBIT_S16 |
> > +                                       SNDRV_PCM_FMTBIT_S24 |
> > +                                       SNDRV_PCM_FMTBIT_S32,
> > +                     .rates          =3D SNDRV_PCM_RATE_8000_192000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 8,
> > +             },
> > +             .ops =3D &asoc_qcom_qaif_aif_cpu_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_CDC_DMA_RX0,
> > +             .name =3D "CDC DMA RX0",
> > +             .playback =3D {
> > +                     .stream_name =3D "WCD Playback0",
> > +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> > +                     .rates =3D SNDRV_PCM_RATE_48000,
> > +                     .rate_min       =3D 48000,
> > +                     .rate_max       =3D 48000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_CDC_DMA_RX1,
> > +             .name =3D "CDC DMA RX1",
> > +             .playback =3D {
> > +                     .stream_name =3D "WCD Playback1",
>
> No dai for WCD capture (or) it's missing in this patch.
>
>
> Best Regards,
> Rafi.
>
On Shikra, capture is always through the VA Macro, irrespective of
whether the source is WCD AMIC or MSM DMIC and the stream_name is only
a descriptive identifier.
-Harendra

> > +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> > +                     .rates =3D SNDRV_PCM_RATE_48000,
> > +                     .rate_min       =3D 48000,
> > +                     .rate_max       =3D 48000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 2,
> > +             },
> > +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_CDC_DMA_VA_TX0,
> > +             .name =3D "CDC DMA VA_TX0",
> > +             .capture =3D {
> > +                     .stream_name =3D "DMIC Capture0",
> > +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> > +                     .rates =3D SNDRV_PCM_RATE_48000,
> > +                     .rate_min       =3D 48000,
> > +                     .rate_max       =3D 48000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 4,
> > +             },
> > +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> > +     }, {
> > +             .id =3D QAIF_CDC_DMA_VA_TX1,
> > +             .name =3D "CDC DMA VA_TX1",
> > +             .capture =3D {
> > +                     .stream_name =3D "DMIC Capture1",
> > +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> > +                     .rates =3D SNDRV_PCM_RATE_48000,
> > +                     .rate_min       =3D 48000,
> > +                     .rate_max       =3D 48000,
> > +                     .channels_min   =3D 1,
> > +                     .channels_max   =3D 4,
> > +             },
> > +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> > +     },
> > +};
> > +
> > +static int shikra_qaif_get_dma_idx(unsigned int dai_id)
> > +{
> > +     const struct qaif_dmaidx_dai_map *map;
> > +     int i, size;
> > +
> > +     switch (dai_id) {
> > +     case QAIF_MI2S_AIF0 ... QAIF_MI2S_AIF12:
> > +             map =3D shikra_mi2s_dma_dai_map;
> > +             size =3D ARRAY_SIZE(shikra_mi2s_dma_dai_map);
> > +             break;
> > +     case QAIF_TDM_AIF0 ... QAIF_TDM_AIF12:
> > +             map =3D shikra_tdm_dma_dai_map;
> > +             size =3D ARRAY_SIZE(shikra_tdm_dma_dai_map);
> > +             break;
> > +     case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> > +             map =3D shikra_cif_rx_dma_dai_map;
> > +             size =3D ARRAY_SIZE(shikra_cif_rx_dma_dai_map);
> > +             break;
> > +     case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> > +             map =3D shikra_cif_va_dma_dai_map;
> > +             size =3D ARRAY_SIZE(shikra_cif_va_dma_dai_map);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     for (i =3D 0; i < size; i++) {
> > +             if (map[i].dai_id =3D=3D dai_id)
> > +                     return map[i].dma_idx;
> > +     }
> > +     return -EINVAL;
> > +}
> > +
> > +static int shikra_qaif_alloc_stream_dma_idx(struct qaif_drv_data *drvd=
ata,
> > +                                         int direction,
> > +                                         unsigned int dai_id)
> > +{
> > +     const struct qaif_variant *v =3D drvdata->variant;
> > +     int dma_idx, index;
> > +
> > +     dma_idx =3D shikra_qaif_get_dma_idx(dai_id);
> > +     if (dma_idx < 0)
> > +             return dma_idx;
> > +
> > +     switch (dai_id) {
> > +     case QAIF_MI2S_AIF0 ... QAIF_MI2S_AIF12:
> > +     case QAIF_TDM_AIF0 ... QAIF_TDM_AIF12:
> > +             index =3D (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK) ?
> > +                     dma_idx : v->wrdma_start + dma_idx;
> > +             if (index >=3D QAIF_MAX_AIF_DMA_IDX)
> > +                     return -EINVAL;
> > +             if (test_and_set_bit(index, &drvdata->aif_dma_idx_bit_map=
))
> > +                     return -EBUSY;
> > +             break;
> > +     case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> > +     case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> > +             index =3D (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK) ?
> > +                     dma_idx : v->codec_wrdma_start + dma_idx;
> > +             if (index >=3D QAIF_MAX_CIF_DMA_IDX)
> > +                     return -EINVAL;
> > +             if (test_and_set_bit(index, &drvdata->cif_dma_idx_bit_map=
))
> > +                     return -EBUSY;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return index;
> > +}
> > +
> > +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvda=
ta,
> > +                                        int index,
> > +                                        unsigned int dai_id)
> > +{
> > +     if (qaif_is_aif_port(dai_id))
> > +             clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> > +     else
> > +             clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> > +     return 0;
> > +}
> > +
> > +static const struct qaif_variant shikra_qaif_data =3D {
> > +     .ee =3D 0,
> > +
> > +     .num_rddma =3D 4,
> > +     .num_wrdma =3D 4,
> > +     .wrdma_start =3D 4,
> > +
> > +     .num_codec_rddma =3D 4,
> > +     .num_codec_wrdma =3D 4,
> > +     .codec_wrdma_start =3D 4,
> > +     .num_intf =3D 4,
> > +
> > +     .rddma_reg_base =3D 0x8000,
> > +     .rddma_stride =3D 0x1000,
> > +     .codec_rddma_reg_base =3D 0xc000,
> > +     .codec_rddma_stride =3D 0x1000,
> > +
> > +     .wrdma_reg_base =3D 0x11000,
> > +     .wrdma_stride =3D 0x1000,
> > +     .codec_wrdma_reg_base =3D 0x15000,
> > +     .codec_wrdma_stride =3D 0x1000,
> > +
> > +     .rddma_irq_reg_base =3D 0x19000,
> > +     .rddma_irq_stride =3D 0x1000,
> > +     .codec_rddma_irq_reg_base =3D 0x191A0,
> > +     .codec_rddma_irq_stride =3D 0x1000,
> > +
> > +     .wrdma_irq_reg_base =3D 0x19078,
> > +     .wrdma_irq_stride =3D 0x1000,
> > +     .codec_wrdma_irq_reg_base =3D 0x19290,
> > +     .codec_wrdma_irq_stride =3D 0x1000,
> > +
> > +     .qxm_type =3D QAIF_QXM0,
> > +     .rd_len =3D 512,
> > +     .rddma_shram_len =3D 64,
> > +     .rddma_shram_start_addr =3D {0, 256},
> > +     .wr_len =3D 512,
> > +     .wrdma_shram_len =3D 64,
> > +     .wrdma_shram_start_addr =3D {0, 256},
> > +
> > +     .clk_name               =3D (const char * const []) {
> > +                                     "lpass_config",
> > +                                     "lpass_core_axim",
> > +                                     "bus",
> > +                             },
> > +     .num_clks               =3D 3,
> > +
> > +     .dai_driver             =3D shikra_qaif_cpu_dai_driver,
> > +     .num_dai                =3D ARRAY_SIZE(shikra_qaif_cpu_dai_driver=
),
> > +
> > +     .dai_bit_clk_names      =3D (const char * const []) {
> > +                                     "aif_if0_ibit",
> > +                                     "aif_if1_ibit",
> > +                                     "aif_if2_ibit",
> > +                                     "aif_if3_ibit",
> > +                             },
> > +     .aif_full_cycle_en      =3D (const bool []) { false, false, false=
, false },
> > +     .aif_ctrl_data_oe       =3D (const bool []) { false, false, false=
, false },
> > +     .aif_loopback_en        =3D (const bool []) { false, false, false=
, false },
> > +     .alloc_stream_dma_idx   =3D shikra_qaif_alloc_stream_dma_idx,
> > +     .free_stream_dma_idx    =3D shikra_qaif_free_stream_dma_idx,
> > +     .get_dma_idx            =3D shikra_qaif_get_dma_idx,
> > +};
> > +
> > +static const struct of_device_id shikra_qaif_cpu_device_id[] =3D {
> > +     { .compatible =3D "qcom,shikra-qaif-cpu", .data =3D &shikra_qaif_=
data },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
> > +
> > +static struct platform_driver shikra_qaif_cpu_platform_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "shikra-qaif-cpu",
> > +             .of_match_table =3D shikra_qaif_cpu_device_id,
> > +             .pm =3D pm_ptr(&asoc_qcom_qaif_pm_ops),
> > +     },
> > +     .probe =3D asoc_qcom_qaif_cpu_platform_probe,
> > +};
> > +module_platform_driver(shikra_qaif_cpu_platform_driver);
> > +
> > +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant dri=
ver");
> > +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> > +MODULE_LICENSE("GPL");
>
