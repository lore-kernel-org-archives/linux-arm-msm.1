Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF2427A04
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137381; cv=pass; b=n/Pu1PWsi1o9IYVSUGSaaPMMjxMCxCjjQgRK5TUGQjhhY+tBN1OnC5N8VGtiK863qzPDz22nbltscTFf3oBSrt5WPoor64Q1V9fLMN8CJhwRGswPNzu6HHNaconhdL3YI444nStrF+G1UTYccHWn73liY4UhKtwi6ELNfz3AHD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137381; c=relaxed/simple;
	bh=VxP0hZ31lGhpRchEzyV+aetw22Q2teS81UDVEDMeCsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaO7hxNv4GoKlVNJy6wh2hOeo4BZ2adoes5lPoZHptTcZCG8cvjw11cRKsfgGCR3qvNHhS4LME5SxqHOjFtwxL2k8S1R8jTTkCmDHbqJm+6slrEiN4yeDn08WYePHq3jxG5C1Oq02mbY4EW2wIYKtlcLYEL+5qWFAbOO8PgIv0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzYyKaVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfMq1sOq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzYyKaVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfMq1sOq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G44InZ3462832
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=; b=hzYyKaVeBM0t6oN4
	OqbN14OwDGvh7/Gbx8Z6JXtEVWmqZ/V6E02Jytm44sRuu+SYlIYXZgU7tYeeyIWq
	BewuE2ei2LoXTKh9cydz7afjbXT+jI/rOm9HqUItKCdC9QiIt/2v0VXogxYvHjUE
	N+z5NR4yoS4L+16yWKBE5ADTaH/GPPppx5PKaSp7wmpRSSckQg/Rk5BC8SCgSEdp
	kfpBzQAwwtODE3Zt/iVQaqb9Ge2u+IpQKyNpFoNU2JVdoCVvIDqv35G/WFwhNs/q
	GSkDxzBK4gEG4SksIDGzbE8a3uJAXpSqWylygxkxwSjwix13qtaDykg0Rif+uFbQ
	4H3Usg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6btvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:56:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so1365730885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 00:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137378; cv=none;
        d=google.com; s=arc-20260327;
        b=d05pCms/F7uYkLu/mFTW0J42P8NV0tes6zGJScxvnkoS7II2GYsSjICbvYOPjAtRk6
         Z3XJ9qyOs3orvf9jBjbIqZw++eRzczqde4HMfakkXoP6V2nUoSLlse9dCpMBFvUdgGNh
         SfbjtGOL5EH5JfG+SQp/FHjhr318yXhPlNJtQkJC7dcwrS+CHE04zuOHRWI22arYSNNV
         wZmiO0n+EGLlzPV8AHETQIIdt+CVThrgBULBbNzJG9SoDnt1B+rsPVNbAV7KFr4gpnVP
         uIph6T9nw0/zUVyn0vAB+D9mN5KnfAEfmpGj/pPl73oS0BNlsCu3uHmzABby9OBwCkW1
         C4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        fh=t5+FN6vV0dNGVLe8PzLa6QCHHWWQ1e4af2aqzlI3pbM=;
        b=T74c2NNLXl4Ribe4+KzxB//gS24I6bdeRGDXRA16R4gismtaLJa0TdVkK2uHWtqcfJ
         TKFMIspiwNSjG0vz3CznMdfz9gIiJujXLb1ncdUNFWb2b8aByekeME4/t2x2uO6pP/qA
         uDhCIpPSSHUvdsrfbfcZOEyP2weH40VJtjzmcdjLHdEDYrYu/iB26fVpkW6mLVdbCfgQ
         wwWT8aQ1vlfzG0X20Yqd9vpM3fnyHIh/TmI+RclAu7C2sx46Exv3GZ6oRGz6YK2On+yN
         Js6efDcxRXzPSQKR/WuUpeu9nBmOLt+vANRAxpN/1cjFEoKIOv6ujisXaVRgPHbnov7L
         F0IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137378; x=1792742178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        b=gfMq1sOqb8pg2AD55xHEQOts/sz3nW5oKCPLtUh/iZ3QB8AuLI6bDm57bkzhPTluD9
         Ur3AVRrIo1NcayCfymyt1++c7hXdWwTeSSvoZ1wXH+Qn8qRprB11nckdpkjc3Z13SwsQ
         1UImJqsonjm/8ikqSUl8IUB8LpCsFv6BUoQcej4MT9/+cPDBtWFoFXPP16ODtS60jWGw
         UWkjAyKLlXnEO/RPibj1K/27cvdc5/45SiaBrCP3JoeafW2w+zKKqck9EJgN9A9HP/+g
         3G2TWvUJM4kofH2VTUNExRWRqclP5wGMmnd7xx0rc/3HGUhAcPx6TR0NOsw+nE9hppE/
         LnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137378; x=1792742178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        b=oHibUdJkYjZVxz3gANFGDdnAOyZ7Ebfon1dGoMjFh9h/h3GRP2bRUC01S4ByiWTJVq
         ZF1y25aRV+wG5+/elH7xHkSuPdKa6XBNQyEt9fnyvl7OEEb7fyBYKMwEiP8rSJCNnK7Y
         cjHFwLW6m7nF9h0Qfb9Zsfys1Qg1IoAzkGjyR5VDd15RKuri6CT5zWoIPELbA17EHnb+
         ISMWTow6Ca1B2H1iwwvvhs57C0LDXzajMhtSfH89vR+Lhzo6g7lcrWR3tsB6Tudzuo8N
         +eYC+sjdAc4Nnc1E3h4zcyn1fz/7wzF07/MGrEYTpNpOJ1NPOFjICVdL3vSMnAV7PEZB
         VoMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1XaWVddoA74HC5OwhEMknvzQOnG2/aDjBT1oGmUsj4DJp39+MgNUyLTYG6eZNrBRsPwSr3b7EwBMvBgsz@vger.kernel.org
X-Gm-Message-State: AFq9FYLUhZKlVzkH47rrHexeEN6a0Iq2oGT29t74m8QBsQ/3Yk0SktRS
	gqJS0U4BSvZX5OblAUEfUoTOSmmM2Dn24FGhOZwYlTlURsRUWMmnnm+Px7nj1hyK/6JBtFTsOrt
	v0GwCrvKJXo8dHlqhCAr1Dxbc6AIgNgdwRfz51G2zzKW1P4XAm1wNG79YD1UYoJcAbTKlCj502h
	g3w+ASDNncaLpYruE/tuVvq8dxV0k0V4tmOBPzm8gG5nZwn4sFKhkyWaYM/pU=
X-Gm-Gg: AYBFou1BXt7zwzbXGCNS3gSMV52rL4guievTuNmE+svkgoQEWO+M3K9pIKTZSOzh8DX
	9uM8oXJyTtyYjbmPN7K5kxEs59ljN9n8rXVSAhlyakGvB/QJUOpfOQa1Y4g8DaXXf8chlcRtyDQ
	iCaAQ9ymijrhpyS4tmuXR24prNDLM9AGIwSynQNu5GF8CFB6ZRm44wDGtfts+ELrMIReDt9x8d5
	wHIYndXhZM6Ob3xOIzdShKd/dSMtNjl/HNKgaU6JhNzDm2zyEbLRNkdLQx6H7WG6QEr/H/039SH
X-Received: by 2002:a05:620a:3947:b0:93e:6325:ae6d with SMTP id af79cd13be357-93ebd248dd9mr3909710185a.40.1792137377711;
        Fri, 16 Oct 2026 00:56:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:93e:6325:ae6d with SMTP id
 af79cd13be357-93ebd248dd9mr3909706785a.40.1792137377058; Fri, 16 Oct 2026
 00:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:56:06 +0200
X-Gm-Features: AclHuK9EtofJ3KdOY7tsLgDR7QBNZwZtJcvmiZFhadgSBrUvuUDEDEKnQ2RLZCs
Message-ID: <CAFEp6-0GrFoMFe8kqhkOdvf5_XkuZG_AmrjTMxxfBABda7132A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] media: qcom: camss: Configure C-PHY through the
 PHY API
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: c7OgemS4iruNxWC291F7TiXkL2MHSv15
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1d8a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=jTXrqqeG4OIbzDD8fVYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: c7OgemS4iruNxWC291F7TiXkL2MHSv15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXyNMP2A5+VPkS
 XNL7vD6kCyLseZjlpJ+SrpAfZP8flMtCKZdz+tPTv7KRJA7sgYM9wSL7wh7Knq1nmbkypjDnOxU
 CW5ImLCi/jAduriefz+qeYH+OizZCu3NUQKHtqsoU4MTr12kTBXSsvELHF/bbeknS1lx/IJtQQM
 hek9iweRveoD6bkP2rhRfkGewMcPyS3LnqDCIgfW+kdnE9xGFHZv2Pe0ztUGm+p+3wu6ulP9ecG
 1mOrJVKzt7gSDxclgFaIcdW2eIDt5XZYDu2cNt6gG74HYHst9/I0K43EO5ocJm6iq7cRX6po5Qz
 SXeONFENTOruzCQpKA8cRvYeMPsBVEBCl4mqaoW/VQAzD8ELbPV2DNE/3sjzUAyO71wkZebPR21
 jziCNCIaOArWZYeEAfdGOSObNhLfMj0+Y8I1fTo4iykHqMPHQuX6in7VPhKWYohzb+hiZPaKupS
 sxweBfCeMqxzlUz3EFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX7DbgXS4MRia5
 agH5A/OnZCIz7fiaq2tCta//q5qeN0cOW13lt34WXmCimsxH2AWqJheKwf+4tM0hxkHJ6123q7u
 EwWG8zBAgXN7F6g2oc31zjADcEHAL3Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> With a PHY API CSIPHY, csiphy_stream_on() always asks for D-PHY. Ask for
> C-PHY when the endpoint is C-PHY, and pass the trio count and the symbol
> rate, which by the V4L2 convention is twice the link frequency.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 35 ++++++++++++++----=
------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f44f2aeb9..8e1b4335a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -329,17 +329,15 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>         u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->=
res->formats->nformats,
>                                 csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>         struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> -       struct phy_configure_opts_mipi_dphy *dphy_cfg;
> -       union phy_configure_opts dphy_opts =3D { 0 };
> +       const bool cphy =3D lncfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY;
> +       union phy_configure_opts opts =3D { 0 };
>         struct device *dev =3D csiphy->camss->dev;
>         u8 num_lanes =3D lncfg->num_data;
>         s64 link_freq;
>         int ret;
>
> -       dphy_cfg =3D &dphy_opts.mipi_dphy;
> -
>         link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, nu=
m_lanes,
> -                                       csiphy->cfg.csi2->lane_cfg.phy_cf=
g =3D=3D V4L2_MBUS_CSI2_CPHY);
> +                                       cphy);
>
>         if (link_freq <=3D 0) {
>                 dev_err(dev,
> @@ -347,23 +345,32 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>                 return -EINVAL;
>         }
>
> -       ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num=
_lanes,
> -                                                        dphy_cfg);
> -       if (ret < 0) {
> -               dev_err(dev, "Invalid config for link frequency %lld\n",
> -                       link_freq);
> -               return ret;
> +       if (cphy) {
> +               /* A C-PHY link frequency is half the symbol rate. */
> +               opts.mipi_cphy.symbol_rate =3D link_freq * 2;
> +               opts.mipi_cphy.lanes =3D num_lanes;

Wouldn't it be cleaner to use a similar helper function as the D-PHY
driver does:
Introducing a phy_mipi_cphy_get_default_config_for_hsclk

> +       } else {
> +               ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_f=
req,
> +                                                                num_lane=
s,
> +                                                                &opts.mi=
pi_dphy);
> +               if (ret < 0) {
> +                       dev_err(dev, "Invalid config for link frequency %=
lld\n",
> +                               link_freq);
> +                       return ret;
> +               }
>         }
>
> -       ret =3D phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +       ret =3D phy_set_mode(csiphy->phy,
> +                          cphy ? PHY_MODE_MIPI_CPHY : PHY_MODE_MIPI_DPHY=
);
>         if (ret) {
>                 dev_err(dev, "Failed to set phy mode\n");
>                 return ret;
>         }
>
> -       ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +       ret =3D phy_configure(csiphy->phy, &opts);
>         if (ret) {
> -               dev_err(dev, "failed to configure MIPI D-PHY\n");
> +               dev_err(dev, "failed to configure MIPI %s\n",
> +                       cphy ? "C-PHY" : "D-PHY");
>                 goto error;
>         }
>
>
> --
> 2.53.0
>
>
