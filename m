Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A033CB554
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534200; cv=pass; b=hds2/58A9j3OgumYJyaRyeZEH6Gq+DmPqqaqEtLhtuoWeeoGSH2uPdnWX4EM+tWZQjRkwkA7A2LoZp/Gc+27pRA9Oc4AsDWBd+Vbw1gU4WWQmAJ3xGNi+Ub37saE4iPPiFa9dKOCp3xWVS/OYRu20vezytK5l5SX6C3dPPa2Q9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534200; c=relaxed/simple;
	bh=KNawkbizrPB6DQqEzM2VoxGVA9Emo1zXV/i7J6HcVI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+KPb0hlLtB4dAO2TLAyRaZB6Pp0R8w8swPK3vqI6v+U0cCsHfGIgc1XzfUbHEODmdXyeHwMDhlzxOPg48M4DriPxzKUeAdOScM19ZfykLswvzJ/WbAQm3A89ZYeZKsE94d9eqSqinGKdccwEdk3pn4673yMWHMbI1atly7t3dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pM51J8TH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTroU0zQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pM51J8TH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTroU0zQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RZZJ1506405
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=; b=pM51J8THMxVSmfZ9
	oV83G0nt9ndIi41r98gZXwFtTa2H+P5HW3RFnw2hef/TUvzkKgaAfPnRpntT17UW
	dtExUqziRdHdOhv6TwJKgnyOxe8HSm1EL+Ru0/xQ1zxuxBC7wChhPFLWNELBSnNu
	bwq3agvRjaXh6k9SpXok3doTlDiL1+tSPBXZ1Wk3vqcuhrQ1saSDrHn2pW9OGUL2
	iwxakjITZmBUvGk0zh8C7PPSu1MTEXDIAn9+IJoPlnK60ZgxbzqYoI2FwPIWhXF0
	tDOZBh49n3qLdQ+g69DDzVNVNfeUfj4KThZ4R1IFl+HISWmSaet9NaO0u5GbCMKi
	6tfeUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvw23r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:56:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso251930436d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 00:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784534196; cv=none;
        d=google.com; s=arc-20260327;
        b=a9DBoxrsJt/19Rq/jsq98qmzKZvhO+hJIuk3e6wb52e6NHwO1uWqUVPexpYtQwKCf3
         zTsS4OT4PLnuOnOG4LCrT7muGWsX/8c2U4QFJmVzZJRTDknXwefENvzj2XD++74i5xIT
         BGTNbOaLsN4zVxaCYa4+7Zyg1p7hCmYwRzN+OdLma3+v4WnHHY0sHVvY19e8zDAqYkGo
         NXeQ//vCdBdaxALHZ4fiVAHz4vQc9Y0IQGUC5jNlQnHzK5Xpw2T1JJwO269bnNki+Dx7
         CegT6dwXqHQ9fNij6DwMJNqdp4xKDGYMNz+KF5gr3SkmnXW1mfnSt2lQAJJe/1wvWKcF
         /hZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=;
        fh=ZMyRYRUjkrOR+vJrFa6+pyuQkguukwS4beKRyYm3pBQ=;
        b=GR0Hol8lpVIFSgwg6YA0w5yMyQ8vCbguf8yTM0TkvcFPe+YriB8jZN6oQBrJiWht4N
         T0cVovIVeqi13N1BiHZtZICC7ti1MyZtYfVCUWSlHDQQB0md44QQ3PIMlwVi4q+d+Xq6
         1ICc8qTdePUN35Q8221yt+eLgVhzj3XbU96uktdJ8fS+/Aev6ST0EJlVTu9VXgjbjU3q
         kZLLDkkiijIJPM2L2sqUR2Kg7GssJkCT5OdrfuhBMLP7MmevHH7c50V/FewM+W/w6HbZ
         y2Ym92L5RVbO48FGpIMTicHBnNNr4xTACSgORxmSvQaSLqOsumREEBRglZXY/KL+Febh
         THrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534196; x=1785138996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=;
        b=gTroU0zQzShciE1licOraIhytNVP/07uFDumYXHGBM0KqK2j4GD2QnnFzGErsKsb4g
         aJPIGKQan11k+Bmra1fCypoTl6OMt7SC7XRT/4RlsxiETHmPr2kGVwr0VshwcvZ6No1R
         WBcRUnOImn3ej07USVODQpVFq3k8ot2ZrEljbtJtUWO58nztx1QUWTHoGjZFFz47DI1l
         ZmBJy9chHioin+6TpYIalB40RtMOi75Ga/PZEWe0CtfdIb4OsXrKYJgCIce4mxDvt9No
         FAtEmkVPKb7FvrYfDKLP0RXx/zSlmYFhY25Ch+2bsUkzOVQQWFgCabKKVG90Y6g3JXrY
         49aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534196; x=1785138996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=;
        b=EE3h0g6B0weinyTNm1y3kzrgfTCaLbCREUd2Baa993+qyNcG0PUmMwdRLY6BldW1G0
         CKcXVyGSfGhEPgV30FpnMBprLoT/v+SBgNVpd/3Di5i7YxqBF7ts4j0WafZF2Q41JUDs
         9h357t1mdrUnfPCS+qhxJ/N9N0hTJ+c0vJFsXJUmkR2gTSQda3/htHqSO1dzm3JJJojz
         Jruve/TqExOOzycFQC//1EWpuNXxF47WgjC71lNomrai/LlIV2KKQP4XkO7/qET3rkKt
         BVuO0eTgFQIfyi/52YjdpSQZ9QgPBgRhF2TCvXrXS1d58AT6uCyOghdcW8hptmDho3vN
         W1dw==
X-Forwarded-Encrypted: i=1; AHgh+Rp78jUqhw09b6Qj5Rok9/ooajB3v9/HO/HTvm2L2G7iCJ6hfxJpMbQ7P/f150pckitIRtbMVJ3FW2X9AscC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64iX5ggMjJs3RCTHxXpd9JVNoGU7+rAQO/k0ze8SzhLX7xika
	eF5YxzO4W75PoXiOr44lX5w4LimhMY9PcrNSEXs3NWIELG5iWzoXpCN0HPwL+usqKnrsaDDMkFr
	yGuuOqdAMLbDOFpdRZ1W/24e3gpeZ2IUeA7YDh+yNqdEM4lc4KjIWshJ6NldrcMrxHlNcm2HSMM
	YXTGpOi4C1S1cOBEL73IcIWx5h16S6K3c71IR9ojjVM4g=
X-Gm-Gg: AfdE7cm7TkRrezjwE9pW+850V8p2wUJs860yCdQC4oEtdR0zmJeQTw/wyZ2gU+3KVw2
	6OA42E64/tMGVLA0P3KcL0/oEBLKnpWNmBw6O34nF5B6QdUn+Mxq/q4nxJGl9w58jo5y4wI9J0f
	EMqg19l29U+plvcTFGknB83UyIwOUjVVcMy4hDPtLl+yUjIfr8okqpTbrenDcpMbueTeEVz0z81
	rMRqQjYUVmSttlBBI3hqhhxKYzv5Fcaeei/6Fwg8F2QjRhoC65wYq21tIabwDxH64O6/ICapGU=
X-Received: by 2002:a05:620a:4505:b0:92e:c118:18bc with SMTP id af79cd13be357-930b43dfac4mr1345111685a.91.1784534196010;
        Mon, 20 Jul 2026 00:56:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:92e:c118:18bc with SMTP id
 af79cd13be357-930b43dfac4mr1345110885a.91.1784534195669; Mon, 20 Jul 2026
 00:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com> <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 09:56:24 +0200
X-Gm-Features: AUfX_mzE5vqE9IwGS7O0FROooFx64JOH68KLJ_NIf2jV_ur-HQPARxyzCPheAms
Message-ID: <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control registers
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fO8z-Ve7MRf-34G-hPItrQOgvjLNT-7q
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5dd4b5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=evg9lOI5Q1fJqvf7AZkA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4NiBTYWx0ZWRfX6Rm/wBW3QjZU
 osGvZl+QtfPj0xP5o3DspG07W6R/XlbO/SsgH+p6GaS5mG0PVxJw18G8Q/skz4tScHo4VY5uPLj
 mkzlr+IGk6oEGYxfdM5ncZy9tm5EpwwgmC8nDgb2TT0Iixkxj3CauoI/BBtIO0uW7O5Z3dti0Rp
 iZTdB+YAkeP/CAbaD9se/zGF0eXXqYHueks0vP+7TGAv77ItJtj5PFtySQbY8Uz360s8QNyCe2/
 IZYHbhpaEBA50+G+G23y8Li7hlsDlKLLUs4i7HxjV4UkWJEcafoCWbD5Vg+wuFsRJ2evL0V6xVY
 M9SHUL3p8ClcGmz8MaEaNEwpxfPj3Ne8MLxe5BOO1rvUhjCfxmFKwiW46E/EMxAI+YMxKVzwpof
 YSef6vkdsCSEmWdt9Y9jQpr6mxTws++VnLl5RxDteKx/fhi8uHGqo2axxCGwCDk6G98E68fKjHr
 1Vak/Ha3ltz1mudPufw==
X-Proofpoint-ORIG-GUID: fO8z-Ve7MRf-34G-hPItrQOgvjLNT-7q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4NiBTYWx0ZWRfXzSo+nklyXBsQ
 DAdoihJmKcY/j7ly0mUgCPY3zGqVDQG6xfyRash4FBXXC+mqik8WQeNlbwQn0KRXJ+JxIuiKjTo
 zS2oYWeuVi0xwQ8tfvqtButY1/q88fo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200086

On Sat, Jul 18, 2026 at 1:13=E2=80=AFAM Anusha Arun Nandi
<anusha.nandi@oss.qualcomm.com> wrote:
>
> From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>
> Program the CSIPHY common-control registers during lane enable so
> SA8775P uses the required 3-phase 1.5 Gsps reset-release values for
> both C-PHY and D-PHY. Keep the existing reset-release value for the
> other CAMSS variants.
>
> Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 36 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 25a3554ef201..11b7a236e607 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1031,8 +1031,6 @@ static void csiphy_reset(struct csiphy_device *csip=
hy)
>         writel_relaxed(0x1, csiphy->base +
>                       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>         usleep_range(5000, 8000);
> -       writel_relaxed(0x0, csiphy->base +
> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>  }
>
>  static irqreturn_t csiphy_isr(int irq, void *dev)
> @@ -1343,9 +1341,37 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
>         writel_relaxed(val, csiphy->base +
>                        CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>
> -       val =3D 0x02;
> -       writel_relaxed(val, csiphy->base +
> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
> +       switch (csiphy->camss->res->version) {
> +       case CAMSS_8300:
> +       case CAMSS_8775P:
> +               if (c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {
> +                       val =3D 0x5A;
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 7));
> +                       val =3D 0xE;
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 0));
> +               } else {
> +                       val =3D 0x02;
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 7));
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 0));
> +               }
> +               break;
> +       case CAMSS_7280:
> +       case CAMSS_8250:
> +       case CAMSS_8280XP:
> +       case CAMSS_845:
> +       default:
> +               val =3D 0x02;
> +               writel_relaxed(val, csiphy->base +
> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offs=
et, 7));
> +               val =3D 0x0;
> +               writel_relaxed(val, csiphy->base +
> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offs=
et, 0));
> +               break;
> +       }

I don't really like this big camss-version switch case with magic,
which also introduces more magic values. Maybe we should have a
different version of csiphy_lanes_enable, based on the phy compatible
or revision.

>
>         val =3D 0x00;
>         writel_relaxed(val, csiphy->base +
> --
> 2.34.1
>
>
