Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9843D79E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465477; cv=pass; b=gFWcy5UD3z2Jo+iwOZ776Gvg9SHZno7q+3RvlBnxekgVznenHvmn0vZ7gu92vmUDlmUjp/lfMCcO6WJZKXKeg4OhqETGZGJMNhsQlJlNEsSYmrbRrJ+cUc9suWzsnwfs0vGSZgztdNQ5+4Rajb8rYFudzn6LvGhquyDXl9Z3XSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465477; c=relaxed/simple;
	bh=bnMbNVVj2v7D9H53XLbDJbbR1wetYWN0pnhL4iZAsKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyadXjF9fFGiyvn9PRuQH8tGBCzIiYnvxRsQcHDHrlx1DGnLtljhLkHSr/fQRrJ9XonmRenH3nZPDHq5AHewcS17tpOXYlSIibFEXos2NHNg7GiINH6npUNBL0S8iO3Wm+nfN6jLyzczxA6QyqID5uhFN4k/5U/vTfcOHo3MYAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CswX52JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqO6+CL0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CswX52JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqO6+CL0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJhF2674910
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=; b=CswX52JO4Piek7S1
	Nh5bNU4VoO1KLQKJHZi2GoNsBO93uwTsHWczoWdD5kh+m9XZtxEd23AQrjfDPOqB
	tX5Cjr+nIN1hQekrHcniYNtSI7eA+CV1XEJVBv9UwvTrgzNsnyjK9evluCd9rGjz
	+DkpQKne67MJuncyzn9NhnAmvFCbziH8n3MzIJ9uckeogat1TJEpjZHYbk5E7GFE
	hnkRb8LlCj/uwSTXPsevc+/qgw6cPGOY0d0/N1akFR8jVQ/8lqNtqBc/KHR1wL0w
	7WxbNJx8Mp54CGlfZ+XZn3I5piX949TDmuYC234iyBEY7w0iWqTsMCg78sI/1IXC
	z37DOA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye714nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:44:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so123163246d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465473; cv=none;
        d=google.com; s=arc-20260327;
        b=lmJ77DZ5BZpVb6kFtAV5yap0c0JV60rvgPeAAY5tS9BY9CHKG1T+Hk6w2pne1Hrh3o
         QSJrK7jXvzWXDIHdd9ikKd+k/CGA/Sy6K1nZuMUGQLxCz5pPe4cjbIZK3PCNKsffSJc/
         /ixnNvnHlXfn/+0bakOo6D3kz3ZpYbm5VGMTbEJjjIlVqTknWSeHcjBoayqEB9VMEh6a
         qw922WLykAjZr+U0Ez6frgScdWNbNM3iAw7sM00QqeXkwE5p45Q1ycRJ7sDqR6LluFtm
         uL4wX3DLzX27iR/+MWUJGmaTj7hkgcoSYdYzHm/3GSAGO5vJ1tNT/kWbd9U1AGnMPxZQ
         IbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        fh=EzXjmGvBlnLwq1d57bAIwCBKnUOuoHXj52ybeEJsSL0=;
        b=J86VuQE3zq9Xmz+Yb+tHI/usyNgP1PY6Ywl0Og6hYW8qQmx7D5PBYPX2i3jBZMTM+T
         EehNj/GkqXSw8TAVWYownsr1XKlb8VIZJM4iCcHOr8fRgC71PaJ49qpipPBnyx6QeK9T
         MFmopc+x6vzO4tokOkdfJ7Zq8DKuu1RiQ4ve6lgp9dnIo5QzfjovCiNk1v9tFkQ0uMVD
         fVV/jwWIcwaJvqW832lPODsR/gnJ4sG+PT5d/B67ujNi2Dpm93J68ZZ0dYMnHVWkNF7m
         iqNlWLEgG18Nchb4HLv541bVMAYy6TmZzmzv5aGgd3nvRGcg9pfhOs96s9gXA/CnSkCp
         VXKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465473; x=1790070273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=BqO6+CL0bnBgpS1KoPFMfcK3hk9hoxkrNc2XYwBLMu14pNQTHeeR2OMQd98FD4vpJg
         vZ/lrPhoaEgsekh7SyNuP+wx/1toQyIeZLR9WJCeavjV2DfV66q1aHYLsT83oKAGvdT2
         ZP5Vd6eJA/k6EQ/CWpGYkJIX7TPJos0MHHBXon7x+E/Xx3MAxFwTnwmSDDi+Y+/mLsm3
         4AGYO3DW70kx68QyNv2dirIAomy5i0hl0UcWmTaMLboU9PcrRpag4PUXtqPlaUEKg5rd
         /iYf/vKf2G5b7AUoK/bhcExLygqWoa7ck92fChzWwtr6VrHgI0H6T/W8CB5ObCp5gZA2
         DTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465473; x=1790070273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=ziaxYoO1IWg+jUFXvLMMiA/A0qmapZZkDOtMYqsOoyYZ8Xf1wF9hhZwt3NDu+qZzDt
         FeUu/R2xcLRl1N9XeP2vT12/xeXgP8k2Ku0WhHpMUcOCc6106S33k/5gV1nYgf8gEDha
         M2wX4pLS5d+CEkys0i9F6kOJOpRJkuh/mVBXt90X+gwhHVJUsMEShhm90oYpkGik+id4
         fKWNER7EbnnOz6vwAy8vzpxTz0D98Kt4rxiuAeFgU3ulYnLWKMbyLe3gWeUv7NHVkal2
         OOycSnFoLcqRaTiJsY9zwsdCWIOo5JCs1VMH9etkTuSbKy6BWpVoCZPulCKbUYD7k5Ri
         TvLg==
X-Forwarded-Encrypted: i=1; AKwUvBxZM3mxUgZukNSMjHF84QJ1jGjlsDRMTKeIEg/hD1xLQSI8DO2BkkEYcl3naIfJXcapBj+6pHvc9tCC5Xm3@vger.kernel.org
X-Gm-Message-State: AFuF++m/k/ag31SlC3/gX9dvdr9apms59/HelvIDM5SM8Wxn4PiHuj61
	gadPaS+yAh29F0VpTFFACr8g3QzN3RPvJaj1STZkN0tAdjD2W5ts/gvQ/9W2M2kWHRqzF86GPRe
	Qx3SVyRYi2N6DJpEu+xsWE6aTMTmAgBqE1B/hRI/qNHviKpwdJxHVYV+tg38tuPDdbh8TkwHZ44
	Tc5Mye2YBh6rxbXyHgvRHXhXL8ojEO2p9Cqb0FxWCLjec=
X-Gm-Gg: AYBFou1l1B5PaeuSGN8RnS6mN0K1H1lbovxkz9xpgbYDfQbtdCz105QLFWgB6jrcgEg
	Ov8kCXfK64kVfe76cyPp2yFlDdeDhko2FxaBGc1PdWqp4zzJvk2vULbGWAydtltGpc/t2wjDVnH
	83Wu7cgw01vozHGweDWI1VfkjFp0WzSEeZY/Ye3/6Zbaohnipf4OlGUGXsY8M0DrH2br80nmXJ9
	WrKXDMoPRLgbqKkrcFCsEMF36MJtHq5vsytHjJscAnfmXe/8YMce95OJtLhlg0ApAbX9GBJQDs4
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id af79cd13be357-93a299edea9mr1021968985a.39.1789465473208;
        Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id
 af79cd13be357-93a299edea9mr1021965685a.39.1789465472779; Tue, 15 Sep 2026
 02:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:44:21 +0200
X-Gm-Features: AcwNN1UBt5xNb7VDMYWD4BT9h_axCpKQfZrvwQ0bvr4VpK98SvAM9POncAzr6Lc
Message-ID: <CAFEp6-1meC7+XV3nVUiqivnpPQwDnDBRNCtmDZ-OMG=sLkxAvQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
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
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfX7W/a/k+9H6WL
 L/25IT0A6z4qqsusZn+ohAtLaAYdNS1ep/rjtwmnXq/PO72YQoXABz8e5gH9uko6eig+gB54ZV0
 4wgLsiGv4cNMgEIZYrUogbtuEtqD7/tR0XDz2tjf4EATUnWFj4TnmqHem1RF/Ly15lPEHsdPjzM
 U+cvJGU5Z1Q4zxj5tquB+dZWWe3O+PWfJBi1RpVpuUG9PDKXSyqQkG3NDUZASnd68fmlBQlYXwS
 PAiPMtuIUOxstzfociX/cz518epxz6FupBq+FOUqgKFj8AY/mIJxdkV/kieMWvQItcEGug6XXnh
 Owgg/JIyw6XL4WD36jETo8FozJPMs4deoS0rxMAIlKpLC8ua69u3i2KyY0BKiniP0g8xfYxEwud
 Bel4J3/49/6pyV9UZrQz1JNP/CB7cCH0x690Gz+hFTGexHyUIHkI2/89fKgCE+8/uienSM7ZxsH
 x3oPbBOKa4gaVUR/iqg==
X-Proofpoint-GUID: 7axfVVrV9YmTKbADVrV4BVgZQ8iTnVZu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfX+WB6F9WPBHQR
 pi2sRutay2ZQAXDHplOL7JlwrYxjkmdn8ES0WEnfQumSUe3ZO4R00JI5iAYHhFSrP3/s2fYl8cU
 jOWAUe5CLeIuh0VKvwODPWWXrcLkKag=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa91382 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=aw8XXKZHl-0D_llVJ40A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7axfVVrV9YmTKbADVrV4BVgZQ8iTnVZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150139

Hi Bryan,

On Sun, Sep 6, 2026 at 4:17=E2=80=AFPM Bryan O'Donoghue
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
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
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
> +               if (lane < lane_base || lane - lane_base >=3D lncfg->num_=
data) {

I agree with Sashiko that a used lane index can be greater than the
number of active lanes.
So perhaps we should remove this test, or compare it against a fixed value =
(4).



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
