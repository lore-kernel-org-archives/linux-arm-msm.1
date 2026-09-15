Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C03B2FD4
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477233; cv=pass; b=oEB+Y2beQoH1YJE4y9s06yA/FSD/njxls5qBB/tiBPPhMZhrYmH32KUX5RGd7JFs9GhRNuxetRN86VP1YCwn3TMJFZlGtOms/FaZCW33jOMN2nY9EF1BISu5yZud5y1qP8WUfZZMGiDwXrkSSQneVkIVieYg2LuvjIoWJD7OoXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477233; c=relaxed/simple;
	bh=gsjyJrh07JlDH9AvGcFVcXgZkOakK3WLU3t0Bnw/WuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmnnELyLwCc/uKo5NaKkbmWVPU0Nfaj+xPJY27Ow8MdMTFM4fobqTyP6wsjI1O7oKdpvs9aQym4DrDor3KCnYzKIBj97P1hoOAAQGZrN52BM2uP3+yvFr1rxbQ9ZTvxqw2WZUKkugLoK0QWIEp8WdxIydcRRPD5VI+1C++BhDBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj0o3g7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aj5aJDGj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj0o3g7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aj5aJDGj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Vo52528289
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=; b=Jj0o3g7VHs529msO
	s4GUSHT7/qFtDNIpVy23u7/aBez6cIjA5NnWpG4ItziwxuLr5TPEEqO5dx8czYP1
	aUt3hJX8dechE2d7fj0C9k5p/pORyPy+NoR76Yl65bHkhnZVZcPEnEu/W6OLkbGV
	1fmf2PQLZFlBgXyDpnaegKzS7vTK834D6HgG2fwwZWsPWjygqMkMVstg8MSCCqEh
	Utpa743q2pTi3u+MKRFbJOn8lUtt1VSEb4oAE0pTqle3ukLiS/krPe6dYe6GUcOL
	OuQzx6z2sXTAzVJggHt+R4c8u7mFRfnscLahNDaZiSWXscLgBeUxEIB7QTWq3AlY
	braKFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9jqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:00:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f27c80a3so878981185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 06:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789477182; cv=none;
        d=google.com; s=arc-20260327;
        b=hqpsvO27R9XZunWTHI6LKpWxB1l5D3q37AHJC/m7unGhWRPyNel8FIk6xZ+jRIYiTr
         yuqDO0kONJhzCuRVIBWjJs+vHB7VlUsIcl08ZhW6qtrW9AosJTKGrJ9FeJ6CYT3tD+0t
         4eBPe1WQIiT9GClmRDlZ9EiF0K/eoZFxLuY1XM6adG7ghhPdy9J45Kc0DGsieGjaaA/o
         wtfeaDl5c0oIOha1Q9DvLuiUoW6ziTeIjhnrK3WhxdAvPhIGxwjqrLcyx0k+UmHd5zwL
         mZwuoYX//IlyObrfuNukLL68h2VafHdIWs4t3XX4jmSzNVBACv7BhcpkIgKdN6R/JMSU
         y7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        fh=HpvUgQfkOPGh6UYG3uIN3KzRT/Q82jljXniQW/XyYmY=;
        b=WfWbnhpJtpEDkURD2WS7QaebehPr7wvS+LyD++o0QoGTeCHfqJtt4MP0uMm2KU6mmg
         45DsVDsF448hYQfKG2X9W6/1Ac96vxrg5PrsZwRsIBskI3nfN9SKy1Ey+D3/hrsR/bAy
         tlXf6Puf7VAaWdepmcrvvSNHRZFRBm07wf7iChSlZcFL+hsQmCbHMljfXiCEvtvjQpn8
         FxjeZWDRaK2aUhWR7/y3eZSg7GTJNe3RtqdOxSbgguBMBBl5Z+ps/TYa+E6Rese1YcGy
         sethLe/M5ZrM4ipss+lKQhPI2RZZEegLV8xJvH/pI9RjZOjKyzhkO8acFPMoLO73MOl5
         7yNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477182; x=1790081982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=Aj5aJDGjQVk5DHANNpJAmnr1KoWh7aL06u/iubGDdBy4xoWOXOMO+u69SJhzJfC0A8
         dst4wmsRsh7N7Ibq6NILnZmk/+qVVaYOt/vMuSevAo28HqmdMdfxcLLLBmnhjr1uzwMi
         yJqAY7t9ipFpZJ8d29bpyb2bAX0QlkK8UhXrEFb7fOIcSrLjq1Ixtbn/UzgXeohbDYJW
         4i9EBqCpABrBXdrNFJ2FIK8cm3pBdfqDKkQiHkFlJvg/+Qwi3Q2esLj9cNhMYuuPMoLY
         Qgy/2BWd1Av29pnFoOCKvyaCLFoR1E+eaeVUt9e1YfsdRqhTC4JMmgaDZXIpsOOQRdtu
         yobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477182; x=1790081982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=YmXN3Osdwq1KGGA/C1FkSLonEBWXKT05R5lD4QdtebB8IP45cxU0X36wedQbdH0p/r
         IE9PY6Rn9o2rSBDtlk454QZhugVoaSazN24i+pmLTrrfbNZA94Ne8Is2m+1JGCEI/04+
         x0CWJ8MGZxHX3qMxibaQR+XR0KBZ5go+J2x2rSlW8LDj4PrpkkXbHVfPSoAYHf931isb
         IlBA//jUOCOEncEts70oLHSFys6xVdvG/KEmwbi7k9FdQpzJripIGrZKyrfu32VLYS2O
         WnE8qMOrc0KYtZ/dMJ/4krukrFWnmNgTy+HcSE1kqhPlVAA8EdN6GIIvVroMsyRCfqiz
         NNQA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ72CcifqxvD279RM1J1ggt0MT3hclFrz1MMhN3Ik5X+Ghr/b0U4bvA3irAkopKmavE0sHgpqDrDdbqWKu@vger.kernel.org
X-Gm-Message-State: AFuF++njrEW4uJZiSXhaiyQXzTnMNlVVtYHfqHiTDIJcekKfJkhyBUrs
	9Z7od/9CeGH4e+ATLY03y2V2qRQ0cgtEeJv7p0svMzDX3KRJPBrLCwph1nyTZJ2SwCGZcLcawFj
	t4DXH9V8McE+awH1xouLsyASh8t2Ug6HX6QZZEt11J/W2wnHDPc37AJVGcdz+5mKY8dR0+DMNJJ
	mfH5pn5tcmbr2sfWxCco6IMreLcpN2FhPg0jCqThNi81w=
X-Gm-Gg: AYBFou3EjgsvsTGN7z0Z4jP7R5TC6aaomNZcfQRi8hRHeiywgt9RYKfOlTHlQizr8LM
	HITE1cKG9z4+/Ga+tOHdSs9sXuBc2L348omYzqGwjqcyv0HgQypIy3Mil1+PYSGE5WUfZppcqet
	k6Cs9OMYC1Fbs8baIF1LqfqWfq8Kup2WUf1D56lJL7NFg6bQmMGkTETl8D2Lg+IGOSmRTYpKfLd
	6TnjnryClFAEwAhfGYzmTozJreN4G7gdHdd9RN1gTDCnC5fKfKuqUfM9LkLlwsyu86Pec6sa82t
	8jpVkXYT08GwbeLYFucBfu4B1lb1
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id af79cd13be357-93a29bb3b5cmr992165685a.48.1789477182038;
        Tue, 15 Sep 2026 05:59:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id
 af79cd13be357-93a29bb3b5cmr992156585a.48.1789477181359; Tue, 15 Sep 2026
 05:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com> <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:59:28 +0200
X-Gm-Features: AcwNN1U5ctkEm4DwFkBSfEfQg9_gGH1ZHa_iPM8quhRMcHD1Qgxe4V5aAf56VIY
Message-ID: <CAFEp6-3wmGA77cKaOgDUxsFSFaa_q4StNkVPrz23jN8r2HaF1w@mail.gmail.com>
Subject: Re: [PATCH v16 03/11] media: qcom: camss: Add Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX5D4L+/rH6uIJ
 i4/IC2m/1X2dcQS+NyBCRhSBt0fU1MAvaK4/D0S9JKG/myt+XmUoXwjO92mkLKFfQM5Cgwa5/op
 SocHWQxCHa/VWg2ZnkDJyweVA2g/vLM=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa9416e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=DkjGjKK6HQ8r0z3qK2QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4_MwZZ2FbvETsgWrLp-5sM3TRxlQhnGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfXwFdSCNyxWpZJ
 OouGRbPVezJ3ZFxQSAKBboW50bhpukLr7YWdCRfntHifE8pwcEA3vOQgtAxkcsNwPMo2Auqy8ah
 Jj++jF33nSYK70ogB4flBNNlGrtCLUCtVAiCcEXk4I1t32ykoul6vSy/VZML76LaSjOFajLQzFd
 YF3oO9Md5z0s+Z3g+5Hnq0IPzLKxV9i9Q9MNOflAQBjxMgEqDTykpYJTl8UZ1ubSSj5md/42QML
 5+XvkiGV7CL4uflAi5MX1sxBEKv1INUzTc2HkK1/jk2jeTOtFxQuFZe82OtDArWq8ReIHaQWBIc
 Hv2jZkR3E9ImLkasNFQZcWIuGd9XcUmxv+T3y5dTh/wGFiZLR8mqD1+RIcY07gvkZ99bVAmdAPi
 ynM9TdgsyZr9tLUpjyayWotGZjDNEJ67eIgpFhtZMU+pVHV5XZySBr0QOBRgoZ36tMW4cYqTTit
 umYhRXnog+tu0bsjkbw==
X-Proofpoint-GUID: 4_MwZZ2FbvETsgWrLp-5sM3TRxlQhnGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150189

On Tue, Sep 15, 2026 at 12:10=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
> private data, the private data just include some basic information
> now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
> resources.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 07b3cddca584..2c9f02bca809 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>
> +static const struct resources_icc icc_res_kaanapali[] =3D {
> +       {
> +               .name =3D "ahb",
> +               .icc_bw_tbl.avg =3D 150000,
> +               .icc_bw_tbl.peak =3D 300000,
> +       },
> +       /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +       {
> +               .name =3D "hf_mnoc",
> +               .icc_bw_tbl.avg =3D 471860,
> +               .icc_bw_tbl.peak =3D 925857,
> +       }
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_8x16[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5596,6 +5610,13 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources kaanapali_resources =3D {
> +       .version =3D CAMSS_KAANAPALI,
> +       .pd_name =3D "top",
> +       .icc_res =3D icc_res_kaanapali,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5829,6 +5850,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,kaanapali-camss", .data =3D &kaanapali_re=
sources },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index ba3d51d9c0bf..fadba57c5efa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -96,6 +96,7 @@ enum camss_version {
>         CAMSS_8550,
>         CAMSS_8650,
>         CAMSS_8775P,
> +       CAMSS_KAANAPALI,
>         CAMSS_X1E80100,
>  };
>
>
> --
> 2.34.1
>
