Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84250AC1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650357; cv=pass; b=W7ma5qOZD07HTljnOMjCgvYZ0kyZ9HkzOycQKzhVPcW6lgaDPRqRg8HCKC/1O+iLYYrPwSdbc0bMjcCDF0jIC0de9LSYZ2g5vPclaORDaQWFdqlWNSBQ1A8aSo2ntyzXkoawmvH7mYtRH+2p1jmMA7oWOLQmlqie+slOIOuEwfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650357; c=relaxed/simple;
	bh=8IL+9d/MUTxeEtCVy0R3kJv8unHhhXQBzwpVyCii6HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+VEUY8aJ9h9cyif68q/KOUzNlHHefgEd4pZlnCioA/9+iGkDbbzHVLJa1KZoFUB/ncDIbY+O3Q4IDQf1EkJN8W9ThzEMKWfTAk8ye+5+7v8APbxKssbYRmo+4thR7ibVA2lcbUN06iqXHYXoohlJRnqST82XEhPxKWEZf9lxoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItBkVj2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhqC9v8E; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItBkVj2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhqC9v8E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zcsg1257865
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=; b=ItBkVj2Bg01+5DVV
	A9ABdg3vzKHIuZtLrjMF/Es16yvvPGMZsEHLHt+Z9ymwOyQ+6OLWB1P8yVJH4BYl
	Fk7nT1p7Nhm74LxmZnbUu5yqAK0PTn0reKoeYiLJInqOgBhj27UCOZpWAhb31ecY
	qqZ7aU0Xy23DuklGx1/ocnQTY85eORgZw2cIKDgdR1M7WFEO0qN7tQlN8mZZQFMG
	mS6tmwN+pRFGRgm/pIcjqmU49r9LQn/tJAP5UB/ZOLVALnw4Jb3a4zV23/e47BDr
	Z6mIxYSKKA/0yPQbOczWLi8Swb2FiV5ED5FiWCSe8L11ihed2L7B1ebIu6Uq4NPC
	b7WpWQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgvcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:05:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so1452987b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650345; cv=none;
        d=google.com; s=arc-20260327;
        b=sfrfJH3IwPBu9kgqRh+WQGG8Z5rZ+HQMWAhpjOiw5JLsJFpkK8YqJmYeE6DR6cK5yy
         d3emsgMI1pa38oostABuGe97im/RDqQtfHYz6NbnnNQbTGIISFTdI8LqnwJ+lOooKmkm
         u6kXyua+8Z0j2Ch6tHVuFUHWHkEliL4kf/P5QHmXX1zmN0RJGmXfVodB0yvpUbeLMv6F
         e/002Bu+4CIW96FSDZ5ilbhJUWCnr27cO+eoO/Z1hyMLA5ywhz9w1SUMmKEXkYSAg2x/
         1yeG+Ek4lcXT4eDc8qwmbNqX3OU+OutZgB2YJvxCA3GI+ZBGnrjJN2xRZcksTP4zX4Ld
         C11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        fh=mhfcdokn4To4R13xQFVzJEBe4OUgViSa54NFtQVDHnU=;
        b=iinbVU2f9PPZQmkzjm9h8rZAVGx7FA6O7UC5E7+rVuGeU3ztVWCC9PMaFMzxm/lGyp
         L8VOLxRq7v+1wN1NzqSYm6bN3f2BaygQl1JwixAde1yv27uDi6X5xy6YJ1lrot3i5Eqr
         H3LugRC2CTyKqibuwZkn/m5+tYpubFLuNhS/SGDt+Ss0GQNr3HDd59vP+WFQKCZYWhRi
         ulaKTYa3j8Eipki6KbYINYDE6q3n/Y3gRHmE2jX+hqHQKsVE6C5Ve2203JQVDdu6gmcn
         HWpGNHs03/2Zyp8AnCdOYAuF8nz8yRqJWoMxdFymYkGJ7A+GeZEf5jGMe6UEdtIeNLjZ
         YUYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650345; x=1790255145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        b=LhqC9v8Etozb6CdBUdxiq2wuFrg/A1nP6C5fWiXxiQuHngsOZmO+wjdmikCKCL7CpR
         EozXy7ON8M1D73P8YvoRWjB4bEl9IU4zHi3AKSFtGUYTdITTXvE3C0F5Rph3rl6jr9Ii
         GwoR1TKA4az18KlKJTk9hK2sZp7lj73ilrGeZjvTVURRGidhyD43jENE/brvx3i+s1zP
         fP+xrjiqBpjavPfTDYA6Fmtfbt6nmIRh4S2NLQJxEB5P7T8NNJv6RLdUpB9P4wA2sYia
         /pFrtXM7O2R/VSK/RiOOGPrmR2HkukPlgnmKPxbRB338ZFc1zYfD9Wpo5uiyMBmq3Ozk
         65tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650345; x=1790255145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        b=i3aw969tbLC3Nx9UQwZySi6n7MPFtq7IgY3MO80K4CAf365Qp0BkmcGNfTKkY/aQlW
         +CfxV+NyzQhA4MrKR2dMgam/qaBYGP+VrTlqu2oIEoQAcug65hT17FyNpvAyL3btofH9
         lJmPCCTakF2hpM1nzMK78GKjEGa01Gv+XObuCflgYWZRn4mHSaqWCBFSq0pzXz50suo2
         /Mx0jgK9hdvDyCyJ09u7WbanuJsxTyoYkdye3iLGsIsNlgq6262qJJh1d8O5QOS4OqNl
         MwXI/AmO0k8berE2RqI+y0JdPwkftUN2TxitGT2aY3+RgIlTTkyS1U91naoRAk4/PN10
         Fk4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvC4VU+NtuTTxDW/Y3XMX3l1dYQcBWQYgCslxncI5iz49kVlB4rL/p4ZfcJNQzSCVC80I2ntdRej+Yy2+1@vger.kernel.org
X-Gm-Message-State: AFuF++m1XVNiUPmPgugBGXXKosl9RJou/gW+Ria5w3mamhVme91809kq
	Bm9o13aJBmpe/Vp0E+6M9CMLkV3LiPPO6NGqd8b1H1sD8WW+g4N96OOIx1rbksoolweHv9LOwUC
	BMb5etrNT90HoS3JkgIrA0hiIMrBYlr6FYUYuuAkMr1d4G2iJTAO6SJ0KQa4y1u772/jlyRLCYc
	c79gwjAFz98+TGwoFBULgJeaNCXM04kTfVSwQd4JodbSU=
X-Gm-Gg: AYBFou0AJEEyodbUKT20guqQBJCY/eVKlny36pS7/s1DvJACiPzuJD0s3PWsyBFJ8mh
	wvScHwv30TSfs2NRIAId1BUg+DEmcbGqk8Bts5TGU3r9szrDD1kY7oxo3TEX+TA9ceylnATJbIh
	XA67T/hUJprzH/qrBRlX1MIbnrjCQWMzIocs0PfhYDW0nJBfS5KVyXssdoaYCsjFb1tAm7eWjL5
	oCGsUwg3x+QLxx6DTcd3KFEX8GzXKJ9+3Hx9rCn3l41ifdoAygifqtmQzTW7PVqf4qLwMccIA==
X-Received: by 2002:a05:6808:2221:b0:4b9:e65b:8c34 with SMTP id 5614622812f47-4ca4cce354dmr6980281b6e.34.1789650345234;
        Thu, 17 Sep 2026 06:05:45 -0700 (PDT)
X-Received: by 2002:a05:6808:2221:b0:4b9:e65b:8c34 with SMTP id
 5614622812f47-4ca4cce354dmr6980206b6e.34.1789650344582; Thu, 17 Sep 2026
 06:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:05:31 +0200
X-Gm-Features: AcwNN1X4DA6jbYE-gBOX2kSb59KYnpL-Q1fbs5emwf1TV0R6vxzWt_eKkq1SKk0
Message-ID: <CAFEp6-0QcUpJ51ud5tOQAX9Vy5U26oJKwe10gSOQV+_o-crFRQ@mail.gmail.com>
Subject: Re: [PATCH v18 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX9LD4y+hyuAqP
 QupYZ5ki4MJMt3kRBevfVwKwCwoVp1v71Omn3jH1DdCygvEzwivd4xXYrpOy6xlC1mSVg+Wx4nw
 TC8IuPdMRFnRCycn435NQnqwPRfVMHgfZeYaHP+RYda8NjSVjj1jlKqtuLOe7PAaIphxka0v28U
 cyvmHpn6r0r6fCxIaDBYcTzhDOohoCCxr05g6s9aSgLhdNnNsVJjYy6K+RD/JBvEDAHOzWUcqst
 xpxWxUG203GO/5sV6llSYJNs4Wrsv+2UkEQSzTcv98eY2sJOgZ56fO+Y4U2CHgCPWwCJsuUGWwy
 UfZCgaEbPRWS+Y7YVGFoV6N0rvIBN6Kt0wom0qbDoEqZVApV4CbiLHuFNyQVVALUSpfEP7BNRwh
 OuW/b75sjzUGSixKiLFMnfv4LgtDxlxMW3pGmHmrdifxfW6TS5bTxRE3TWIlZMRqiP0mxKejBZU
 NDWXFWqMomNdtSGsdGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfXzeylXBM4GWD/
 lMFz7DMPy09eFo0E6M9SJowJ50q+DT8uhlrWjNoyrMnS3Ya9riz6h9GRX9rxkIkrvV+PKTjNXRH
 i347JXUauDaTBfT4VzqUJTERLFovYiQ=
X-Proofpoint-GUID: zvHJ9jK8ylpxJVjWPsLHSJJoV1w3cNKt
X-Proofpoint-ORIG-GUID: zvHJ9jK8ylpxJVjWPsLHSJJoV1w3cNKt
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabe5aa cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170184

On Thu, Sep 17, 2026 at 1:08=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
>
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere=
.
> The PHY side code normalises the input data to register level meanings so=
,
> replicate that logic on the CSID side.
>
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
>
> Existing bindings are not affected.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
>  drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 7a357044b9fdb..8c3319f2ca1cf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -21,6 +21,7 @@
>  #define MSM_CSIPHY_PAD_SINK 0
>  #define MSM_CSIPHY_PAD_SRC 1
>  #define MSM_CSIPHY_PADS_NUM 2
> +#define MSM_CSIPHY_MAX_DATA_LANE 4
>
>  #define CSIPHY_GRP_ID 1
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..6f58e729eaceb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_o=
ps =3D {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>                                      struct fwnode_handle *ep,
> -                                    struct camss_async_subdev *csd)
> +                                    struct camss_async_subdev *csd,
> +                                    u8 lane_base)
>  {
>         struct csiphy_lanes_cfg *lncfg =3D &csd->interface.csi2.lane_cfg;
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < lncfg->num_data; i++) {
> -               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +               u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +               if (lane < lane_base || lane - lane_base >=3D MSM_CSIPHY_=
MAX_DATA_LANE) {
> +                       dev_err(dev, "invalid data-lane %u\n", lane);
> +                       return -EINVAL;
> +               }
> +
> +               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_ba=
se;
>                 lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>         }
>
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       u8 lane_base =3D camss->legacy_phy ? 0 : 1;
>         int ret;
>
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>                         goto err_cleanup;
>                 }
>
> -               ret =3D camss_parse_endpoint_node(dev, ep, csd);
> +               ret =3D camss_parse_endpoint_node(dev, ep, csd, lane_base=
);
>                 if (ret < 0)
>                         goto err_cleanup;
>         }
>
> --
> 2.55.0
>
