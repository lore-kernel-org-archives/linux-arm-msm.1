Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197916;
	b=jmmmwwbQqoPxFc29121nlm4dVY/awXCtNBkWncPtDBykJhloxTd2/PgrdsKWg+Kk5aIm
	 iUKrqqDdOKUkz9eC50rFyQY1nd7QAILzOXvsLR9+mdFNmJtpzb1YGb3udxgtp0s+7E7VD
	 o06JT1d+rCLyal8ty2Dpo5SgXeCUFqZBQHmCRseIymaZ4Xe+QA8tEnLHt/4ltu6sHc3k9
	 WqXgSwm0UuDUu8rmplbv4rNY6yiqAF+Gj+1FudUIaXecDWUWjndxK2fGLf5RcysxdUqjw
	 OSK1w4MXwCvWUKSb89co4ZtSfBI7Yd55gTyttBrycWhSgkV3z6PIkfeEKUQiHyruu4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
	b=krzXcgXuzHMyNwaV/CNxVyePKs0p/ENWDPvAEYkRHUqkaTimUq6tj1sox/+1FY+8WlxX
	 XLdV8slKAtdzryVEhvesUauE8w1hmnRKFuydDmjDzie7xL+KKSXPnIYeiIR6svsUVK4rd
	 Q1KGl+NCWR+72rg5Z6CjVjBjRboN6qtfdXbemXUN0hBWnpORL036rFmcHzTzbHdF0w01t
	 s/V0EnCMeZ3iBys7TM7V+bHsKkaUjY4rPSCuwUcN7ldWsM9FswICenA2vU2HfMWx9gdit
	 DQEBl6Vj8H7M30IuQLzybldZAMANsRV9VV92NrsplBQcR/5JK57esOAu7BHKn7cxLgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5EjwMR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CCQ8Wl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487A606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2487A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5EjwMR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CCQ8Wl
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdqGF137443
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=; b=Ip5EjwMRu8GypD8d
	vmz7DbjstSvLvVFPMsypePAHwg8buUeQgw00rGjw7YZzvHjvzbQ2XZy/bAoqFp0n
	Ae1cxOec6EaoiBkw5orNHBN/+w5CPm4zhBaIdhYfCqRJzdyf39jsK3QKU4hCPwyA
	HuoIN06dyAi8Us/jvpJjxKSDXMt6ZE9TJmlwJ5V9fvUZw1Er96kYm+Z/Arn0HiYo
	bdtrUybRSJ1XBqfHAnKDV58ualIQYh42uaIM9vsVPwYdNjx0EIlDJFLsDpBs6rON
	cqrCVMcCqaMdY8nxbSn8FxIHeO5fM+Yh4UGTkunUzZVkB/mmHCaww7Fj74GnhkHN
	oc06Tw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92wfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:31:55 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0e4c2f052so15580707b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197914; cv=none;
        d=google.com; s=arc-20260327;
        b=qG27YojKXTfzNerJ4JALbt8cYs7JjO46pSnwJm9mZTXRjON7NfQUWNOpez7RMWGF9h
         eewpxtVF/r90YRqlB1rP++bd2lBHdtYDIgRHYSSQorHpRiVr9XITlb86xO1a0f+zgH/L
         3J1Dp5lO7OaE4/aqkxR58UmaPTrC5Dvlmxe5ErDvp38r7SHK0o82zNOaKB0ZExHUgQBy
         kev4t1Hpp+VLP1A9bTW7s0HuHBUnd1P63mj06qcg3Ny0Htr1XfGKDwGhIzYT2LSRFu2G
         ngBgF4uSdXLze9RvtHyz2jTaA1aKYVPFV0XduebCi7NRHfkzKXsgTXjCCqZ7acUfdBgJ
         vgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        fh=1UMmbh0Y3sxV1PjiUSnXKZ/ylcRTk+mY5jdu1oRn08A=;
        b=nva7WvE+/KDABcHENNlXMNQXzpIYOn3Lwf0x2+vOEplfBljP02Afg5odqNVK9yYkvk
         7RsirzoIJ25sDVPf5XSdH/gc7+O1nYU1hDZ3Z60joEGZegCr7dNEEMKSP01o/H7DCTlK
         MZZCyhJU1bCzoJmmzQ66cOsNgBDqFE/RNerORz90vtFjuwJLBub0249wdQkyPW7NQlyO
         Lh4/pvvbvGPZncWYCa4gqaWKqDtiET4u5F/g/xGF99F86krzvBV8zm7rbZFj1pT/zhDJ
         67Z3xgk7xwuU+ClBiBlc4tcc+bDnb3aA8KJrMwgH6GWFJu2U2QCK4zpr+8SIUUY9yG63
         mEEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197914; x=1793802714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        b=B1CCQ8WlPbHOxHSGlEQJHyf2cIBsnEazIur5nmeVCdJqSdObS9xpFYrVMMwQM+JqL2
         AgunTgJhBAxRDmN5gVxmcUfD8mU3YUJ2p7htl0Ri/2r+VB3G6svO6nDWIuUdpJmomXmc
         TZH76o6OnTp/b8HPK/g/Ix+UV5PR34YVXFmjvWm4FpVjegZIXPlgEb8OxCu0JM9Ybsgq
         ihePli8x7s9oL/QL4mw876BQfZFCxx00/y5ppMdJJpggQAUzzqAX3bDud0O17Ax/e9fl
         XloD73cJcnwYOygWZ9b/GFnp+dPF4bAs+meXkcaw9c3zeZypNaseVX/HICFYPwJlRjfS
         3wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197914; x=1793802714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        b=NX/EI/JnpmH6x3YTyB2E5atkKxAdUZZ/9FJOkD6NPyQ8jf2kDkO+5dhGeDJfEQWei+
         Y2S5PLSgeC4UWI2JGo2JjzT/BTtJH3YqjDcQ7BVrOyoNlPq1mXCiemAg2vr3MbLH/RPE
         orfe6zKe704jn1m8l4bqb27t3Ux9qeN10osc+J2qv/9ADOr/f05OsK0aHqviIhUn0DTj
         4gnymT8oUTuRct5noOZv8HRJFo82tD8VB7PO8zi3KQS7tVqkWWpfOwSCy0dxEWr5Hnpl
         y4bywBH6dnp0pUHT2dQoYaMmYh7tXFx4Sm4BLPwsOl5SyfPPw1svfz+NzzOfkEg9/Sku
         tnuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5qyTQVMN0EuJJLrIfHBMuMYZ3ezN6DVU3hXvNZjUzP0A56GCHVOR1+Tw2jsJTtu+g2ZHzBCpKhufjTDNF@vger.kernel.org
X-Gm-Message-State: AFq9FYIIMm5eUCrdbi1cXUUlYl4MYmNLwjd0mETGdRSWYz99xpZMutKi
	CuXJq/58EcYiUTZNMDGxqSyN8nNg6CJ65bJFcMJAK1eQbBbxV4SyWRSL51H2ELKtC5Er7RF1sVh
	bYYbTenbHEeE0tlBlkODO6+HkYBDGl4PrlX+Io1guRzk2wRlvBTyKQ9BdoP20Cf8g8Sl1pA31GR
	fJfM1whZF+VaSs2Xm+s2D/WzOtwxvmXVlUAxir/o1SV3E=
X-Gm-Gg: AYBFou0or8DlyYAF4hKSLR9MjZH96yL8LlDbolzfitI1GldP0K7pMS0TdRAjeG7RskK
	2e7XRJVhudhk4zKK2eOr4OSFoNqmxTtNySNxnj4UTDV8sMKGXYU2HpCbHGWrfan1lgFzGWgHF2Y
	Q9EClt3tQkzy4zRlKcdRNOnz5WMgQ1PFOLtxavSVHrN6h79BepIKluclMm1CJnIeojcfjuhYrvN
	1kGQttOzLzhZtZ1ePHh8Zv+W44Au6EVQs1Kcb3fcJfH0K+OrRlMUGmi29Iv720lpolFLOf8du4=
X-Received: by 2002:a53:de12:0:b0:67a:693a:b1c1 with SMTP id 956f58d0204a3-67a7bd37dc9mr1723992d50.107.1793197914305;
        Wed, 28 Oct 2026 07:31:54 -0700 (PDT)
X-Received: by 2002:a53:de12:0:b0:67a:693a:b1c1 with SMTP id
 956f58d0204a3-67a7bd37dc9mr1723945d50.107.1793197913680; Wed, 28 Oct 2026
 07:31:53 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:31:42 +0100
X-Gm-Features: AclHuK-ZetXLnRlYyVA0Aar_ekVy_y16swNN82xfp1QmruhUCAZreqlcaSWQtgI
Message-ID: <CAFEp6-14LzGwZmX19fGP+TTBcUft3=_JahLjg5P1SC4sW6euOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae2075b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=04hEKUbGTPlOapuoViwA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX+lSMKBUojehv
 EQc2XCeyPN/hSlZKlWf3v3GuxskuZbNIsja8ayrSyoJG7wwnlUuVFUsFomvJQ1jwg7H+5Iq6tfB
 VQXP2s8wTPVUjk2X6TVjTXIBK1IrxYI=
X-Proofpoint-GUID: L0hNYQh12yfn_reqWEEj2lBTM8HModDg
X-Proofpoint-ORIG-GUID: L0hNYQh12yfn_reqWEEj2lBTM8HModDg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX5p6Xis5fJ1YI
 vmaD6MProo4DpukbgT5JhbYnPNxuJHYx2XL4C1nlZewin6mvD324CK2UbJu/bAPkm3GOJw0Axvc
 j0v7PdQs2x3MYgXEPyskLx+rgZmO3qXoJ8phLdOm9ouXplCx0auRnhkfnw/l4YY2LXzbQHoRyzG
 fneBtqaILSOT/gbr8J1u9FYOOYPZ2aRej3jleNK6CNQ/dY/z71jxWxnFnHYZsL7AGtBRGaP1jBb
 mULRrAjTVgnTZ1oVnrpkI++drX8jjN/f4wL91Ne3BEeHCDDQOu28wV0Wj1XniY4v9ZoqSawHg5r
 PqxklWYm6Ylbo4brnazG3fw0RGZt5Nz3fyUPQObjYNR7Lk1TI2IMfVxlzxzeSzqhACo5xY4vAnz
 IDRO18Vv9XYkyWOgQBW1nDmHARYAlXlbyfLd40Si1sN4U5mDHJH/Zm1dtvGAKB1c7irVCqXSedF
 uPm8Bv1wHAY4lGDa+2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Keep failing when the pixel rate exceeds the highest rate of the VFE
> core clock, and clamp the other VFE clocks to their highest listed
> rate instead. Take the clamp into account for the other clocks when
> another line powers on an already running VFE, so that a clock
> running at its highest rate does not reject the request.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Just a minor style nit, but the dev_err() messages could fit on a single li=
ne.
Anyway:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v4:
> - Keep -EINVAL for the VFE core clock, clamp only the other clocks,
>   drop the warning (Bryan O'Donoghue, Loic Poulain)
> - Dropped Reviewed-by due to changes
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 40 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..bcc2c1929af1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -918,6 +918,20 @@ static int vfe_match_clock_names(struct vfe_device *=
vfe,
>                 !strcmp(clock->name, "camnoc_rt_axi"));
>  }
>
> +static bool vfe_match_core_clock_name(struct vfe_device *vfe,
> +                                     struct camss_clock *clock)
> +{
> +       char vfe_name[7]; /* vfeXXX\0 */
> +       char vfe_lite_name[12]; /* vfe_liteXXX\0 */
> +
> +       snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
> +       snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe-=
>id);
> +
> +       return (!strcmp(clock->name, vfe_name) ||
> +               !strcmp(clock->name, vfe_lite_name) ||
> +               !strcmp(clock->name, "vfe_lite"));
> +}
> +
>  /*
>   * vfe_check_clock_levels - Calculate and set clock rates on VFE module
>   * @clock: clocks data
> @@ -1001,9 +1015,14 @@ static int vfe_set_clock_rates(struct vfe_device *=
vfe)
>                                         break;
>
>                         if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> +                               if (vfe_match_core_clock_name(vfe, clock)=
) {
> +                                       dev_err(dev,
> +                                               "Pixel clock is too high =
for VFE");
> +                                       return -EINVAL;
> +                               }
> +
> +                               /* Other clocks are clamped to their high=
est rate */
> +                               j =3D clock->nfreqs - 1;
>                         }
>
>                         /* if sensor pixel clock is not available */
> @@ -1045,10 +1064,23 @@ static int vfe_check_clock_rates(struct vfe_devic=
e *vfe)
>                 struct camss_clock *clock =3D &vfe->clock[i];
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> +                       u64 req_rate =3D min_rate;
>                         unsigned long rate;
>
> +                       if (!vfe_match_core_clock_name(vfe, clock)) {
> +                               long max_rate;
> +
> +                               /* A clock already at its highest rate ca=
nnot go higher */
> +                               max_rate =3D clk_round_rate(clock->clk,
> +                                                         clock->freq[clo=
ck->nfreqs - 1]);
> +                               if (max_rate < 0)
> +                                       return max_rate;
> +
> +                               req_rate =3D min_t(u64, min_rate, max_rat=
e);
> +                       }
> +
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < req_rate)
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
