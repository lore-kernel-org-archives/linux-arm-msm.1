Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434957;
	b=WT92mFEqImxUu/MaIViH6VtViRRShyKR3Gvf1OTPkuKxEYIdtUP0mLQVok6zVXhreOWx
	 JnTv4vOPaDsU637TdNCqxVFc7QsGpLfI0HAt4eySa6ntJ+STS6ZFSO/elJ74bflO4AZI6
	 EwWe7YwHiM2utFsjOrpW9ufUQRxW5bSj7OSoT/KGiivwFuMAZ3tMsGG0HDtuGLImCkfpa
	 hVglC+86Uf7r7rufb6qx10dujFhjnG1CK2GuI6Yu81bJmhht4t99l2/snYFN8kUgxx8Mk
	 f6DzGgSWQQbChtju35sahGu3VN2HVZszAtHv0eBp7F4blFq5mLKcDcQOfP41H7Xff7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
	b=TpR06sFjJ/1LmEltJL0Rf/TBlZCvfRtPCxdvUntzv4n1aPIM7/vxF1uamzsox+2ZUj6n
	 yYxXg7/Uufzkxm+16r2J4eSSh4MfAwL8URByyp+sZCFaalPJfRo6R3fXxhrfmBFG8VGyE
	 PXf56o+CYJW8DKPjNpq/WUlz35j63UfvYWQlKFqItqFRQw/UijIHy7nWE8Gfg/fNNPXtC
	 FrDstHCCVYhEtunXBtQsMl+NSLEt0C3M3b786XIgsVTVmujVRMDdHxT8a7tPU+Rdy4H/g
	 ith6vt91gFkr7TeeSwq59/w9Ct4bCNcO3RWb9u4Lne6gwLwqufE8xLcDjfBDoi+bIeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442EA606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442EA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G10K1899235
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=; b=YgSwKQS3SPovgQxN
	GUmINrmPXDWGKW6q/ioYH0ObUPIVX51a/+TwH7Njh45HmrwWoo4cUva59RqEoz3i
	tHzHZ+PdKTh8sVbrg2BnL5olufnr+T4FKpWHWp4MQwDwENAeCulBVJHBMXv/PYVT
	opFWwysZ+KmyuiIC8nQHq5c9ocdzxnbTFwYGwGNzm0HzLttVBiX52PzeRH3g7yhX
	K/G9PiwiJxch99qx6zW4uPiX5bcvaxYzGWyaWtzazNp3cU5gieqIQ7jJ9oLDcRTI
	L3JuFXAtvn/KdW+dwvns2cIvmsT+WZhWRqgsDp5AP4OaTUZ3C3/XpsShQybdiZnZ
	yg8Fxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k18h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so644760585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434954; cv=none;
        d=google.com; s=arc-20260327;
        b=ZN1Lt+KU52yOErIX7B7p64RP51E2bklexQsjkB8+aqntPpujK2YcNYWdT6lliuWOny
         o2gcau/c7sUoqA0P6epUuR/Ijfu3V30LASa0GPrU225O0WNRv78olQb558yhRcZU8KSL
         tK4Tx3CcCCvHH7doQ68coZ8m9FPsndBmvNYkX93D1LgSWrxXaqDTod54qmVNegjO1PVv
         XvKmD4fw2bSql6FdFEg0BeUpk/3mnI8nXh86J1/Ayad/6c5orhNDOPJatwbrdk6oDEXF
         gCF04ZAeNf28zXGr4KRqe/sDWsJ8NtNu7HJ3/yVyk7h0/mN19p9zGz0WNt3XgxSuqlYt
         FDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        fh=J3Kj+en10PPu69B/16RPLFu7DUfZM5XRz/boPRY04o8=;
        b=Q+IheOv7aQspzmfRotBXPmcuXKCY9fQjY0exaRhsio1y7RhOaOZeaLXUsIh9p1htMp
         xqDE4mbYVsrQT81tl8lhWc1ya/vQlEi1Z6pV6wGY/ocsnzJIt0Hd9Yhl11QNRZnxZsZx
         uvhlNznjvzmjn0DbYhrej5CXp2ZBT0loMbzwiqEKvVEELs16/ls4UclHERceYJBiEjkE
         CWt/KYKtueFmwvA7z597AtX5HCim6+940WByZUR0kpl3QMPTQdUux4pmLaTHPAuNZCpm
         2G3MuknLXatqmQErAded77sLts5dW2vwExU9GKmIR/2txjrFOpHFN7i58IiX3BlyeOvL
         dthw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795434954; x=1796039754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=JCR73BE0OGo9DDilbWsp/GyyMFZupxVJaH5T7/HsEMTauoI8z1FqyUUyYvhpGOdMs/
         YQmUquYDr52Ivxj2z09Tp+0KPTZl5pUjVlrgv3Q2TsD252NNet8UBg7wAZwypEEKvFiv
         zOx/aV8qLOXkF+5vYNAHCO7xHXXv+g1HFjLGDGabnmWsT9k9pdsn5VxG4YvZ5ScGx8dz
         hRRvNgPAlw9HzL/7/xcDYRcLZ52AWmNJa5ikTNDUy5RJmQZS98PTSLXQwbmeXPz7vpUN
         MQtlMfAt66MC85OeGESHWLiXF4pbgRKN/bvkHlEgGdh4q54ekWL51EW17IWxQxmcUQOS
         4MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434954; x=1796039754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=mVU38Q04gE6BIFW3RtlGfAGnDtKEoclMvkfDFL/75YDkGNBC0N/WdopklTueCxtprZ
         QwGL3uDDihD3I5VHV30WLitZIdbhCtjZ8IvH1cQepMa1G5D7ORdj3CPE7goKwL7N1zHP
         ATV7WXwu2hliO8O9enWzVUXWU0FEWKvjbGv26xbjPBmXTRckJclKhgupKHYdO1E6YVEI
         Ahkm4bAjgvmKUxN5pAKRvyI4RBAGNk32+qWRZJSnWenZcRuvGsIEDPW8se9hP3+J+Yyn
         N8AKuGI/I/glID0gV57/OAQrKVj0exxczVV0WIVhDJnqal+gh30hjXwcfvOFeeMtk5c4
         6STw==
X-Forwarded-Encrypted: i=1; AL+hErGR1QIxaS6YrVqCUf2L52up38/rA0mJCOASp3403zYKr8PPoyyvde0P4ZUIzfqJfrQ39QJvG/7sbuprFsag@vger.kernel.org
X-Gm-Message-State: APuU4Z9VGkIllLGVhlgOzEWCN+nfs1NxdlZ4Zt4F9rSTNG7v+vHBjYgC
	VXZHkldF9vNoCtxUSOQ6wof8MlUqDhWxw5xEE9gX1yTAD3v1lsPxykhsb1JE1sKERRY3mT8IND4
	jfZ+ifDXusiXXyP50/RIY7AUj+LHrsnRBvk3NPdnkQ1mxdnggtmAljT69bZ10MSrC25pv9s5Vsj
	yfmOiCFClGfeM6jXhv2Bo1oJbHZ3Yh79auBX/vLmB3w4E=
X-Gm-Gg: AZFdTZc611vJ/Z4J+RTgfA8Tv/Db3mponfsb2C8lrhvjf73OEqcWw17MPHUd9NGoOPU
	lb+wHYxP5nyXjNojyCvKDevtxt7HSGQ7vZGlxXnWnJWJnSK+rPqXQOwUVLA6iFGgboWMsqk5ds4
	lp/xKmbo9T2X50y/qv6y3q+OuooYnHb5kUNPponkSoxDmn2dwUyRCkk+L0uJhvrnwCCzfgyTRMh
	5Q/n6l5RQdmAMJpyIBmiHIjDEmtwjEj8y3/GyEAuZn5e1LVGuMZuwHe3FyLLPLivMOBpXDbru5D
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id af79cd13be357-949ba9d4cfemr1741029285a.50.1795434954537;
        Mon, 23 Nov 2026 03:55:54 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id
 af79cd13be357-949ba9d4cfemr1741026985a.50.1795434954035; Mon, 23 Nov 2026
 03:55:54 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com> <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:55:42 +0100
X-Gm-Features: Aa3M54pzaN1MMD5e1zJKHe9DPNQOJ_Dbh-NSm_ScNAiRKuU9oPpZJY6F7RsVn6s
Message-ID: <CAFEp6-2EFh=gEFN7-ot+dYKjigm-2tdKPmKjS3_irCq9BPSATg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfXwlQ9uHJD5AaD
 5d8JxKN6S+YFQOEeXJXAdA2QVQDnslzxFXIRYJzrobh2AWffRDzYWNYxFxqvKKR4LUxIJML3V+O
 FtZCQI/OgOC7OJN72wzr3xRnUeR+jbw=
X-Proofpoint-GUID: qRD8AI5DwIlm3kQlZ82A_2WyvipoidON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfXy9AlLXK3MWXm
 6CMMLXV9Il5hoDFiGiKV7WT62i0Wuck2y/Uglqf/VJARE8sXEtXe4L99AOItTybesNVlFY0BbWp
 0TARgVNahI4t/eL6DQh+iMcLth+WZNTL8rb+DQKPFrwCZokxqorB84e0hKbEusWOIFOhnM9Vx7f
 A8RCTySaZJTEhSw/64wIstXhmwm5p/SIq96at21TG3tzRuLqvsynVhgpBjc10t/FNufCp+2yv24
 vmkvVnjfoGoPvu4cv9N9hgUCkDI+GVyUf1hez2+d7MdypGIZ8ApI2fPJpeUeSlj6JREItflb7SJ
 lSL2rLvHpvEyoKNDsCX3msjkVwu7uL5Itsk0qYx902MWM8taaK+jWNT8GLi70v6NzjVhLH7TLzX
 ilruTDrfwHqwEt0vANj/JuAqUvEjbtdwynswAB6m+pYBZP/ubJ2FudefUtePJaJuI+0mycgLLOn
 WPdVR8dfekf/3A1Rwrg==
X-Proofpoint-ORIG-GUID: qRD8AI5DwIlm3kQlZ82A_2WyvipoidON
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0429cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=FShq8-UYHVsJhsOZGvwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

On Mon, Nov 23, 2026 at 12:36=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
>
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
>
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 42 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0c=
d4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 0,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 1,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 4,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources glymur_resources =3D {
> +       .version =3D CAMSS_X1E80100,
> +       .pd_name =3D "top",
> +       .csiphy_res =3D csiphy_res_glymur,
> +       .tpg_res =3D tpg_res_x1e80100,
> +       .csid_res =3D csid_res_x1e80100,
> +       .vfe_res =3D vfe_res_x1e80100,
> +       .csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +       .icc_res =3D icc_res_x1e80100,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_glymur),
> +       .tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +       .csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,glymur-camss", .data =3D &glymur_resource=
s },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resource=
s },
>         { .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resource=
s },
>         { .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_reso=
urces },
> -       { .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resour=
ces },
>         { }
>  };
>
>
> --
> 2.34.1
>
