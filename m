Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695693E173D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553033; cv=pass; b=Ep368yCky7a5VEd+VqQ8+sgv0rcL5DDCRovQByg9xfDzces6gvw4oCns5/PoFCafdNYFPSwecxUZaGd5VDnIOfQz7Ath04oxppKv5+bG2wrgptG1NmvsQKlrRUATTiwQEvaBCTuh2iQKehu0UXyamXzcZnZuIXISJs372CfvMJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553033; c=relaxed/simple;
	bh=ye7a1U2+Qid8ovzQbkmGTf8UHVH2C3CVsSrYv/e3tCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o532UY3Es41Drdfy9boAHu2fzmKupcSqZIhnuz+PJSo6StNq3G8pNmiBw1wZVq0T5tmwskKJfJ4VYpCV2XHQTVGClvZR45b6FC79tDTymhi+fXfdSObgG3hGVPR1fmDklYtxbSafmxCs8xMFJMYEbX+oHbP3eHx/g0mGpR41qag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGVpVZ5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmRoLkP/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGVpVZ5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmRoLkP/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RE012602040
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=; b=mGVpVZ5e033eMNA9
	+Ly44u3PsIlJKGGhryilmBrXg9e+vIJQfQwxBTQAU0T+AALyCvI94wS8+aK1x7Ud
	0IOrvJgiyLIr7KLjcEw1wRHtiWzqHphE78zFpfeCeGsqyNcNm1QobeEKVX7mMng+
	DQ2+w9Ds0iSZ5chUTroyW4nVefJZ9SJKMMsUYh+oeEMONg5UWYy/IwWz8dpHDgCD
	/1qe+msBOiF/U1b3XBmFIZ8M6ooz7aLSAAGtR8j4QF0kX9mQNYQQoBZzdMWEBoAF
	sKKP8FkFNQoeb6wFczYzndr8kM8OpG1AJLZ6kJH954fHK25pkPx+C7DhTf/4J2nd
	1eM5jg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwfns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:30:31 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836caf085e0so132057447b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787553030; cv=none;
        d=google.com; s=arc-20260327;
        b=C8Kj5b5CSubZng05I1NAuVGC9EUTjDdc6xtfmAAyfeQja2P9GXFXPOOBKla2P7WDiZ
         wy+UR4IQ78/6gwLTxOofriebss+7lRDBasPjn6QhVPq2t/OO07mZ19ItmJenlQvph2RG
         y/FVXrUwAfVJEs5/u4rzEr2F/5uzXg0Ldpx8SFaePv7Z5B3ywpMcQx4xlxxqAD3/k8Bg
         eWJDRlHT6vJSCzzMxwSx2rhW4oH5DHAe7uDrmrX5PNLHE+HwihpfY4hXqFK2DVVHit8X
         BL47u3FIXZwn+xOAaCBaSCR03NNRBhlf9B6gmWL4Ex+byTVM9wcHHAZAoghKpmvpHTiU
         UkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=;
        fh=9L2CqqllNAPtQB1zBoxPTNxlSs7q9pPJ+DTaxRKqycw=;
        b=gAskVh+KRmbufUeLA85NFfgz0O657C0PFi2azSu2Sr5NmV2l9N1N5/WCK50ljLWWGc
         kqzGSbuvSXBiszBB+oQzDFra0ym3uyuALi8hwd6++NOHlMzXEEdMEXs96qJTJt1w2Z8F
         x2b1BQOTNYEgSFtj2vUcciymcDZvegJPzI3jrS+3AkjfKPo6OO963oS2iIwgwA7sF6Pp
         CPl6jLQ6p06Z4k7K2fZdzVoaya5JsNRbY/exXWGp9hSmLpyF4hl2jKqVadtJuAxOF5lH
         3OVSMyI0lDS9tjzdq7gx5pK5h25ia0/hUVfcGXe4ohk4bCcSe2oxkPcdK00tTLlT+5uw
         g0og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553030; x=1788157830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=;
        b=GmRoLkP/3375+KexfJ5uxWgXMHfqvpfVwPZlNHzP8qnszF0GL74wyVQF08JrNiLcbD
         furtzepvp6IWQWOLFDFq8jLN4ui5KBGHcxyVj1Vo12+6BOTEi0Xadx7K/xympIJxGXAD
         1ieUaQZJHZT5HvBrUh+hzaM5wzn/1zk0gFarBbaWF9MJLdNuCrSGOyHBWz0z0Cj7asXv
         74IDC+P4mZHPDyABtPFofvnvIlkC0nW5SrUzGcuTxzwUZvFed6s1J4Pz6R6GYABzV0tE
         HSH+aEhBU9L92Q79xsXI8Ba4ptAQMW7qdeQa68E8NoaV35a6BIK2BUfP6uMEbPfOC+2E
         pLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553030; x=1788157830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=;
        b=eCszdKcFbFI/NqZpg+kE07vht2vM3tC+920T42pQhXCgQdBeEHEM0uVxc5ja3kb1mT
         xY9T40ZdKkh+HG2Glgti/PPdAA849Xgc6IiBCfw7ip7WZDaiuG7Res4WvRJ0kBKRLwrn
         tKGGKzBto8rawOb5lU8wRml1jXwv21fnl8quNWorZZssjQAL/xSmaps61VjVI/89xkWZ
         sU2D21kf7CUZKwiP39sowTjvYCLqeSJaMjZK0nIO/z5KtNIIqi6wvpoJE4OIP96ERh3B
         er16J/xEm0EmqK+Ue/M8oF+PNy4wKbGiQebDKviwKUJDnWNueqkFSYcv5V4Aft/FI1uU
         VSmw==
X-Forwarded-Encrypted: i=1; AHgh+RrTGW5+hZTNcw+X8KTHr7VScNx6nCA/PpCmI6V03WawUQIzGuY0e8Mv9xueoXnjtBL5u6Y44hZMGZJZsOw9@vger.kernel.org
X-Gm-Message-State: AFuF++kq9qViWc8ohQbnjxu6njnD2WQDvKC65doJ3FxS9nr81a42ZjBc
	xfvuOr1DF/gc/Qv5+poQypsWXySghRKLDXW7VZZRzkDAfKgnbIeqLZFncQ9d5dHpXSICrJ7OFwp
	h7n+wMUWLIwYfmyxhAXVgB08Byt9ZYLg9RhCelWrgbU6Y9qSGGZlpMoRmYU9gQdLwAue2RnffzK
	cxOoNcK9Xi6IsU9D9+Nrng8FM8B7C03vAWuyJAXuLsCu4=
X-Gm-Gg: AR+sD12n0LdEKttPffbvifnNtYam6lFzV/sVpiH5zXGOcC4gj1o7KMtwzTIPaHcQbDE
	p7Leit1rOoFsndj4C/a/vy93LjlL+sAtS1s88n87oERA0FqlcMOYbPl7lVF0hRY2d0qnUIu75NF
	hnVOCshgrRdvf71oO7GAxLLqyhAlJCRxOmgtHPZQpqVakpkTC7OawR+oTCthQ=
X-Received: by 2002:a53:c3d0:0:b0:668:96a9:e54 with SMTP id 956f58d0204a3-66ce4a4f19emr7177437d50.23.1787553030427;
        Sun, 23 Aug 2026 23:30:30 -0700 (PDT)
X-Received: by 2002:a53:c3d0:0:b0:668:96a9:e54 with SMTP id
 956f58d0204a3-66ce4a4f19emr7177404d50.23.1787553029698; Sun, 23 Aug 2026
 23:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com> <20260702-stoic-chinchilla-of-nirvana-3bfb14@quoll>
In-Reply-To: <20260702-stoic-chinchilla-of-nirvana-3bfb14@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:00:17 +0530
X-Gm-Features: AcwNN1WG-ROX4FyK_RvAZB5pfr_kIMUR0tjuj86TanEWc12WQU2-2q0XXTylwRw
Message-ID: <CAC-tS8AzrQWPE2tQANBRVEE_2RwzteUkrKNZeLbu91iO__QTFA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] ASoC: qcom: Add QAIF regmap, DT parsing and
 platform init
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: _QEEhn7cz4hEWGcYsMhJpE2mHXeh-aEj
X-Proofpoint-GUID: _QEEhn7cz4hEWGcYsMhJpE2mHXeh-aEj
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8be507 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=sLgd8sIBHoX68nViayQA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX42eUdKyDVEr6
 hB9HcMnwChb74/7Szruf08FK6B4piOkbWH3RmhxIx5/rLezBdabv3Kh5/79unSG5e2AGdWm3d2f
 lS0YFyJ3MeyhL1uSQ+oPUc3IIsrmweSUyMvpG/erFxu2xOoGDlsF20Slc8AUo7xr0OF2kIudDtm
 mEDjR2ITkkrNeEE643ogHs1KQ3iK6j6Sx/6s9g2gxaj38PLaFGOstkqkKg737YNrc327ZXoPr3H
 09P0l+HaGl9JOi6zbEYSpVBQy/ckU+aPcpm62xUtDSNeuLaBamu+dLiOoOXw/LSHTdQezbGHywI
 KVagdmlo5RSXxH37FJE0jk0kP/NWxNzFhAaf+jaTJf1El6UC+uTA5q9YpcpvB79nhbrtzq4SNPk
 ty2RhE04j8IvUPYwHyQb5PCgI5z5Ujmq0NOjLiTwEVgmH4GohygITLinhybrW1o87l+Bcux6B+f
 vFCieA3wSX4zg3rWEoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXzuuSkftoDxms
 0YbpYwzK3WW5zQx0/33sVsCSwti4mFw2cDprhnB6tSrGOejSTQ+os+ylD/s+87439/KHgsY+bUv
 V/SD+kd0O0xr5qM494Y0eKH8JfKnv1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:53PM +0530, Harendra Gautam wrote:
> > +/**
> > + * asoc_qcom_qaif_cpu_platform_probe - Probe the QAIF CPU and platform=
 driver
> > + * @pdev: Platform device
> > + *
> > + * Initialises the QAIF regmap, parses DT, sets up clocks and register=
s
> > + * the CPU DAI component and PCM platform.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct qaif_drv_data *drvdata;
> > +     struct resource *res;
> > +     const struct qaif_variant *variant;
> > +     struct device *dev =3D &pdev->dev;
> > +     const struct of_device_id *match;
> > +     int ret, i, dai_id, idx;
> > +     bool variant_init_done =3D false;
> > +
> > +     drvdata =3D devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +     if (!drvdata)
> > +             return -ENOMEM;
> > +     platform_set_drvdata(pdev, drvdata);
> > +
> > +     match =3D of_match_device(dev->driver->of_match_table, dev);
> > +     if (!match || !match->data)
> > +             return -EINVAL;
> > +
> > +     drvdata->variant =3D match->data;
> > +     variant =3D drvdata->variant;
> > +
> > +     ret =3D of_qaif_parse_aif_intf_cfg(dev, drvdata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to parse aif inter=
faces\n");
> > +
> > +     drvdata->audio_qaif =3D
> > +                     devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(drvdata->audio_qaif))
> > +             return PTR_ERR(drvdata->audio_qaif);
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!res)
> > +             return -EINVAL;
> > +
> > +     audio_qaif_regmap_config.max_register =3D resource_size(res);
>
> Why are you modifiying static variable? So if second instance is probed,
> how is this supposed to work?
>
> > +     drvdata->audio_qaif_map =3D
> > +             devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> > +                                   &audio_qaif_regmap_config);
> > +     if (IS_ERR(drvdata->audio_qaif_map))
> > +             return PTR_ERR(drvdata->audio_qaif_map);
> > +
> > +     ret =3D of_qaif_cdc_dma_clks_parse(dev, drvdata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get cdc dma clo=
cks\n");
> > +
> > +     if (variant->clk_init) {
> > +             ret =3D variant->clk_init(pdev);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "Failed to initial=
ize variant\n");
> > +             variant_init_done =3D true;
> > +     }
> > +
> > +     for (i =3D 0; i < variant->num_dai; i++) {
> > +             dai_id =3D variant->dai_driver[i].id;
> > +             if (is_cif_dma_port(dai_id))
> > +                     continue;
> > +             idx =3D variant->get_dma_idx(dai_id);
> > +             if (idx < 0)
> > +                     continue;
> > +
> > +             drvdata->mi2s_bit_clk[idx] =3D devm_clk_get(dev,
> > +                                                       variant->dai_bi=
t_clk_names[idx]);
> > +             if (IS_ERR(drvdata->mi2s_bit_clk[idx])) {
> > +                     ret =3D PTR_ERR(drvdata->mi2s_bit_clk[idx]);
>
> Wrong syntax. Please use dev_err_probe.
>
>
> > +                     dev_err_probe(dev, ret, "error getting %s\n",
> > +                                   variant->dai_bit_clk_names[idx]);
> > +                     goto err;
> > +             }
> > +     }
> > +
> > +     ret =3D qaif_aif_cpu_init_bitfields(dev, drvdata->audio_qaif_map)=
;
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error init aif bitfields\n");
> > +             goto err;
> > +     }
> > +
> > +     ret =3D qaif_aif_cfg_cpu_init_bitfields(dev, drvdata->audio_qaif_=
map);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error init aif intfctl fields\n"=
);
> > +             goto err;
> > +     }
> > +
> > +     ret =3D qaif_cif_cpu_init_bitfields(dev, drvdata->audio_qaif_map)=
;
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error init cif bitfields\n");
> > +             goto err;
> > +     }
>
> Why do you need to enable the clocks before all this init? Do you
> actually access the device here (like its registers)?
>
> > +
> > +     ret =3D devm_snd_soc_register_component(dev,
> > +                                           &qaif_cpu_comp_driver,
> > +                                           variant->dai_driver,
> > +                                           variant->num_dai);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error registering cpu driver\n")=
;
> > +             goto err;
> > +     }
> > +
> > +     ret =3D asoc_qcom_qaif_platform_register(pdev);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error registering platform drive=
r\n");
> > +             goto err;
> > +     }
> > +err:
> > +     if (ret && variant_init_done && variant->clk_deinit)
> > +             variant->clk_deinit(pdev);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_probe);
> > +
> > +/**
> > + * asoc_qcom_qaif_cpu_platform_remove - Remove the QAIF CPU and platfo=
rm driver
> > + * @pdev: Platform device
> > + */
> > +void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
> > +{
> > +     struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> > +
> > +     if (drvdata->variant->clk_deinit)
> > +             drvdata->variant->clk_deinit(pdev);
> > +}
> > +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_remove);
> > +
> > +/**
> > + * asoc_qcom_qaif_cpu_platform_shutdown - Shutdown the QAIF CPU and pl=
atform driver
> > + * @pdev: Platform device
> > + */
> > +void asoc_qcom_qaif_cpu_platform_shutdown(struct platform_device *pdev=
)
> > +{
> > +     struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> > +
> > +     if (drvdata->variant->clk_deinit)
> > +             drvdata->variant->clk_deinit(pdev);
> > +}
> > +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_shutdown);
>
> I do not understand why do you need wrappers over single call of single
> driver. You do not have different variants. And even if you had
> different variants, I claim they will have exactly the same clk init and
> deinit.
>
> Again, this looks awfully like sending us a dowsntream driver which is a
> known antipattern of upstreaming.
>
>
> Best regards,
> Krzysztof
>
Addressed comments, will raise as part of the next patch.
-Harendra
