Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7363DAABE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792638; cv=pass; b=BBS6D74LmZMBicJY2gi6cwfZ9VWF15Nf7FQ+7K0UpRnsYO/7OSoymhkaYaxdLnZW9hOcmpMZ6ZVC/9g4nmescG5D1jXIqklOvpUq5CRMTr/p0PJcl9Qttk6A7J0cXcD+p15YeTWklIfthhikqU+XXlxGFA23ytkhq5W1mpv+YGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792638; c=relaxed/simple;
	bh=lbZWNXAQg3rFB115wbs1+93TmZ8GPedv7f+hlCxp4n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAIC4pbSY+Pk5BbGV88ozekYFm8kTyitYwNtv91GmbNyqFAZ92GmkVn3cnTPkKJE7iT6BKozZHsAPwnFshMoZgt1qMHcBzyf/iuv+eNibGjB6BQAGD6Ha1lEAacfPPJwPIGEfbCK8I8midBuK/H5Jn7D8uY+BwiVMLYs94/Kb1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9onEu9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAAV11ZP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9onEu9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAAV11ZP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BaLg3030167
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=; b=k9onEu9r7wqN8b4Z
	d58QjA+aijJCMU+2nJAnf4HrNs8yG3xpLYI3O2y8CmTG8rcM8fGcfrMth+C3npDf
	npBEaXEpfkj9fpNYLqBJW4RGsvaNNtG+Iize4rHkGK69ZN3X6eKazjN6MtlAdhOC
	TgdrsuUMB9RJhn25JV7atxOhs9NcSH3X+dwxQixFO+uTXyXVOP435/bvXwruijvt
	REWykGwi/NG87mIlV6bGljXxDH4EAPeasLDpCfgGSuUaOBXuOsM7Tcl2cWgTX7aO
	hRmapXSbBwwtj1ylT34vPBASlXtMC8VzA3bkfpTUWEEYveLYTbpBLmZqt4a4AS30
	wCPkRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw11dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:43:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so29891385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784792636; cv=none;
        d=google.com; s=arc-20260327;
        b=lApRK2ndCBernQAKBGPjkLzE5XMQs5p9drrJvQrFCzddydXbtu3iHQQXv6XKO32RW/
         D182TZlFXIQBkyEtd0KlEbbzXCZ4SaX0tGPBfpx46yelhOFI52Iaeu4+lTqH1E8H+eu1
         05SuxPGiYvxJiHO8yRiJN4HbWECPe5n5F76B3o/p3CXboMjrDa8Ry6/iRKxLoRp42Tqx
         2lxSHocytlD6GsY2Me4YynNTRDTAZjzxUruZM++r1hJvgfk634ZSw5zJiZCR1an94SRn
         +LMrm6Zi6pjRlgpylldrOmmWu1DLymUHa7gQ9mQ5XiTOIu4EzwJO4W9+U0vAADaFltBZ
         pNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=;
        fh=IXR4Ije2+P8HSLsQvPRWcckm8UM63Or19d2vUM6H51c=;
        b=Q81ame4Is3J8wOjudnbFBwkr8beLeUQxYYsntVNtIiyRDnprjVB91GgFiGqE6+4RO9
         0zyUzH1OFTGoCYpoTqv9ktJ4cGnzVoTS03IhU8PH9JZoPg3cy/RRLl2BWfSx20YEnXlA
         21JP9UjcPzzjVPNKWm3Ke2hiiw3iQJTeal/7OE1htvYMrJ9fV986R/B2Ui/QUado1Z1G
         /OVRU4muIVfEHT6tiH6ayh9QWfeYwbKvjju26feo1cC0UWzrbRGurT7M63TlNfattPl1
         zzGDQPm+8xWJSiE5VSuXWBpK14XLr7dXHzrSNwfs0QNj4HIXKP9Vp9J7jwGTn24GbQdu
         folw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792636; x=1785397436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=;
        b=OAAV11ZPvjEEQIDi01HwE0kVY5hB8SACZn9dwZgMMxAfyMBCyfBt2niCzDny75vZ2+
         XGAwQloTrN6FGLNosvV1ZiGt/HWWmk1dakno+rzOeZiuC6xgwlDGs43UvWppG8Oii9Fx
         9WxPyVcQSYY/4MRqqUKrMmZTs/RLXT9RasW/t06KbfSm5TUMiPlmI2d6KDGXmhyN+qvu
         6K74Hs5gx7YolsXgWwHzFxQvHciXdNMPSZ3kRBQXWdwzWpdeEvQ1NRw7sxOEp2+zbfkf
         ULZotrYwjM6fnARqwXkF+u2I2upP8HYrt+I+XO/UVXsV46+9C5R9kHgx2ZLxy5MwGMcX
         1mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792636; x=1785397436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=;
        b=A3YNEPqNkS0oVC1l4P2WzyY4kmy/uWlr3V+KEvaFw+AX7AkzlMyJvdggDJN6EuJdfs
         AWBGwU8Z9NLkotTWaDdjp0+7XumIIgKEaP2CtK6bPc8mbSa+a4ArHHteX5vEb7fdBJ6y
         4dKe06Oow0rSb1DJusb8WjYkIQNoZFtQK96cYONApEt8KtZfnZ4i18Yuti1Z7fe2kp+r
         APzrKGfWspSAF4QVXfY8XtEdvNVCBfcdfAS5U/kpBlxVrNPmiTF1cJmDcU45bwSCSnjU
         hpOYu+I1/Y7FOI+qtcaxBiqoPVFIVFKsAwE6v41Wy3uxvyXE0oGuUG0WCswXRcTgusHi
         LE5g==
X-Forwarded-Encrypted: i=1; AHgh+RoIxx+p3xhM2slXHFtSEusk9bJYmCSd4AhPTgzGoeGxqMYOhXtkCeUgekYUiTM9TSWIlpArP9aja0Fu1PNf@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQ26XXrfGIRWPcMRhFbau4kg63fhGCei2kD/AOV9br8G+vXUx
	XJmJIvBHj5VPaKJhHURi7qCujbXzRMpn31hv6JzdklN6OT6ifCq+x1Imw0cegtmxdFnwG+Tn1bV
	/yGtUJ/zN6lp3jx23XJzoZsHVqGf15ZUFlPF3QfE5f/Tg6NbWQYJJDTIwZHKJ2bdcn/f+jWoCUn
	1yk3RIsDGn/mFzziPzyX0TF44c0+HDfGVa1A+R6dB6oPo=
X-Gm-Gg: AR+sD12MDuOIbDhwfEkN80FyPDcnV3nfn5Y84MmxBX8uyyeTBn2l/YXN6QagAE1OBoy
	sQe58xCrrQpwXLO4UGWkls4l2/z6qWjs7+3h3nGIGTJg93eZPwBW1EdLbFU1Lhp1MRz7mJnufY8
	PYsoT6FyyXZdtCs/cmo4ZYJIsvCd83JBGTYQkqEP/e4/vDw+Ref8dzJLSEV6cy8XkA8rMyDWeKc
	wqFlmRf2fazaeFs/N5wQ5F2VSuHfxzU/JwQxDiOCR8NcBV8s2Fc86AzLkLWgFNPSLDoWko66rQ=
X-Received: by 2002:a05:620a:880c:b0:930:866d:f86c with SMTP id af79cd13be357-931048a6bc7mr139452285a.34.1784792635649;
        Thu, 23 Jul 2026 00:43:55 -0700 (PDT)
X-Received: by 2002:a05:620a:880c:b0:930:866d:f86c with SMTP id
 af79cd13be357-931048a6bc7mr139449985a.34.1784792635091; Thu, 23 Jul 2026
 00:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com> <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:43:44 +0200
X-Gm-Features: AUfX_myzqTqCuLiR-4itT8lXxIA4rKlhYdQn1IVqV94j8_vfXwq6MRoyP7faEcs
Message-ID: <CAFEp6-0dg+nUJH5EQ5KtAnbsgKWKEqF1nLWQY1T4=RM=+LXy7g@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61c63c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=GaiK6TGL3l2XU-kOEGsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3-s8irUqivWZB43cl4-qbTfo2GV6s6TR
X-Proofpoint-GUID: 3-s8irUqivWZB43cl4-qbTfo2GV6s6TR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfXy3E0lX4KFlZz
 FfQgyDqINNxnzBZcHXp7XBQSkrdAhIU33N6nfxij/k55u8ZligbUKwF+w+itJMxOJtnuTEreF5S
 3iMgkMyKn85c7DWgXxRB1LjhTO0oHUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfXzStRh+GFT/wv
 GF2+UyzJU78MnK7rWDhxLtdtdsuzUR+a1aexPy4YAmGL1xzYgTjQng4AYLBrS4R0HRJ4CH3CcCC
 Nz9Ahq+pBvo5gwvn5Bp5WPbua3aRxn25YNRlyAWtUY4QfsrJrIne392ikEy8Hz3X21IeoosbDLh
 N+Ag8UDsdxxw1cansruYZyjjyJsMreX6+23bfMA368m7bzpeNveryUygxnnzzVLxCvDcpEVk6M2
 DKRdIDSSy/tT+ugoxr4r+vgqSrKEKWiFx0j8vQ55ZLvUzJokVWSMNffxHzY3vunD8iv2KLHElC8
 kj3HCYnLxpc4nGnliKPV2S7SAyoLJOIJcZjzyc/XxwvA9hEH2xtgiX3RFl4guLK86QNrI/6rGJP
 LWalPzbWhRxqPv+2l/E70w1nH4XpwPFSnKJSkkyyPlSmU3eLVbLyLEfvoFGtt4igChSGW71oYh8
 6dCd7s4pa0jejwB51gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230076

On Wed, Jul 22, 2026 at 6:37=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
> info and use csiphy_res_8775p[] for the qcs8300_resources.
>
> The only difference is that the qcs8300 has 3 phys vs 4 phys for
> the sa8775p, so explicitly set csiphy_num to 3 rather then using
> ARRAY_SIZE().
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 70 +----------------------
>  1 file changed, 2 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 477358dd39fc..eba14a6ae7d4 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3657,72 +3657,6 @@ static const struct resources_icc icc_res_sm8650[]=
 =3D {
>         },
>  };
>
> -static const struct camss_subdev_resources csiphy_res_8300[] =3D {
> -       /* CSIPHY0 */
> -       {
> -               .regulators =3D {
> -                       { .supply =3D "vdda-phy", .init_load_uA =3D 15900=
 },
> -                       { .supply =3D "vdda-pll", .init_load_uA =3D 8900 =
}
> -               },
> -
> -               .clock =3D { "csiphy_rx", "csiphy0", "csiphy0_timer" },
> -               .clock_rate =3D {
> -                       { 400000000 },
> -                       { 0 },
> -                       { 400000000 },
> -               },
> -               .reg =3D { "csiphy0" },
> -               .interrupt =3D { "csiphy0" },
> -               .csiphy =3D {
> -                       .id =3D 0,
> -                       .hw_ops =3D &csiphy_ops_3ph_1_0,
> -                       .formats =3D &csiphy_formats_sdm845,
> -               }
> -       },
> -       /* CSIPHY1 */
> -       {
> -               .regulators =3D {
> -                       { .supply =3D "vdda-phy", .init_load_uA =3D 15900=
 },
> -                       { .supply =3D "vdda-pll", .init_load_uA =3D 8900 =
}
> -               },
> -
> -               .clock =3D { "csiphy_rx", "csiphy1", "csiphy1_timer" },
> -               .clock_rate =3D {
> -                       { 400000000 },
> -                       { 0 },
> -                       { 400000000 },
> -               },
> -               .reg =3D { "csiphy1" },
> -               .interrupt =3D { "csiphy1" },
> -               .csiphy =3D {
> -                       .id =3D 1,
> -                       .hw_ops =3D &csiphy_ops_3ph_1_0,
> -                       .formats =3D &csiphy_formats_sdm845,
> -               }
> -       },
> -       /* CSIPHY2 */
> -       {
> -               .regulators =3D {
> -                       { .supply =3D "vdda-phy", .init_load_uA =3D 15900=
 },
> -                       { .supply =3D "vdda-pll", .init_load_uA =3D 8900 =
}
> -               },
> -
> -               .clock =3D { "csiphy_rx", "csiphy2", "csiphy2_timer" },
> -               .clock_rate =3D {
> -                       { 400000000 },
> -                       { 0 },
> -                       { 400000000 },
> -               },
> -               .reg =3D { "csiphy2" },
> -               .interrupt =3D { "csiphy2" },
> -               .csiphy =3D {
> -                       .id =3D 2,
> -                       .hw_ops =3D &csiphy_ops_3ph_1_0,
> -                       .formats =3D &csiphy_formats_sdm845,
> -               }
> -       },
> -};
> -
>  static const struct camss_subdev_resources csiphy_res_8775p[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5555,13 +5489,13 @@ static const struct camss_resources qcm2290_resou=
rces =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> -       .csiphy_res =3D csiphy_res_8300,
> +       .csiphy_res =3D csiphy_res_8775p,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
>         .vfe_res =3D vfe_res_8775p,
>         .icc_res =3D icc_res_sa8775p,
> -       .csiphy_num =3D ARRAY_SIZE(csiphy_res_8300),
> +       .csiphy_num =3D 3, /* qcs8300 only has 3 phys vs 4 phys for the s=
a8775p */
>         .tpg_num =3D ARRAY_SIZE(tpg_res_8775p),
>         .csid_num =3D ARRAY_SIZE(csid_res_8775p),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8775p),
> --
> 2.55.0
>
