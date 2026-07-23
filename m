Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596EF3D88FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792680; cv=pass; b=UW3V581745b830+2NIW43EiJlEGyd6HCM5/w5+Um/y/Sl8R/AcywPB3dQQkrYKhDfPiMKm2nZdIIL91TsuGP0jMYwklEo2wuSrIGyBp/kyH/pb2GeNpJgaY75IAhoOsCWSFZHcJIzydjKTRJJqSzJqo1uH9DyEq9v0nlgOtnXko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792680; c=relaxed/simple;
	bh=w3y/jyFFCTw8i+47DEKYD3ltrovK4xEt52qH7LpTfHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMaomxpuq2G3u9EkuzWLUXG4MjT+BfmTHqY75Zs81C0CgyBt3Kxv+b69KDSQ+qJUT2xSs4bBIdVz9UguvddJpD7mzuMvTngBSCojudHfC74FlwQNumkZ/uLAUksfjqmHzUdkx1OpAaQhy+ER8J9Ks0E73nGE5gbxv4yWcQe20JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTvLJ8zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fp40Fup3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTvLJ8zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fp40Fup3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BaFh3030164
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=; b=PTvLJ8zEbkyv9lYa
	zyvh8Pd5xDakwYRCQcXAy+xtt6/h8JhtyWTJDSmVWb6/U4SzNwxcCc//vD5qZ1CM
	3fzs0lkyAr7+yhA1YoWucM/ptO9sGVXQ3ZT0dW+zAyO9rGhwckoH2UDmQTTwd2+f
	8lFNSJVbRnMkE6OLPMdkc3Cd1uvouNr3dKdQQjRj5BRHJCF7hcFzFocl6X2NlUwS
	7Xkfquy0CbwHH84mwNw2Uos2tGZtGBfu9z2XLwF6/mjGBBPXMvJeUAju2SJlasrT
	7N0BvEWNZUgLb4YLNBBbl/fo+iAyvwG35RJ6QM31xSAtGabJ/52k56FtPLJgx7aT
	L2Z6Bw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw11ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:44:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso26255785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784792676; cv=none;
        d=google.com; s=arc-20260327;
        b=BVmW1U8KXZiKf+H/Hp7Ui3NHVd7riclQtv4LNef98x9HObEwsLscTznxNa+bfIddhQ
         UqZG7C5cnnijN9f64tjt/HhxDtH0GjxrkUdVf9SemSfKtzMaoL8yH3Da7gFT4nQwPpl1
         0mxT8ueZXG2w5BatgIYbx0X9FRqOdzuaReW7/CW51azQM4Tg73Ll7ByQQoNtE9Sxxfpt
         hciairXyfdnaMqS3vVFZuLqqu0j9UqcjwXe1HgT1ygUXDQtxKQtBEJKoCAynMEnDgStC
         vpEinqs1ig/M47byw6N4d1HuSmSvCTsI692fMhNbH9XlwoH2GY03tP3s/0nkwLDM872G
         QPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=;
        fh=fXPrgY5nw8P2/LOKvWPTXH0ZktGS5oWDtLhntKMk/cc=;
        b=Y7uW7vDiGAM77kl1PsFIk1zbT43mYwZ8xM3o9PwC8rwdUAhRHkYPHEgns/IfV/iGqH
         JHg5vvysgeR9ZYHa2uc1LD2RDQ9xtOZwSt8aJ1GOFmPGgr40Tk88raoG65fVk9aoLaLY
         SyDUC10hn7/mWM9tkNQjPfGgXfJAYPGt5ZAd24Fd1fvVVjK1IQNIaCVH2QlDNYpT/qCn
         0yrAIj+DaM3IKknENXtQJzBxScSsKgoacV4akbGW9s5CDKV8sJDwRW57eXHxeJZhtRVl
         SwFqYhY8Avtns71kP+rcV+bh5+clxS5K6MXRhIdcBXe5RMDM/DtXw6mYKJzLoJ33KplM
         waCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792676; x=1785397476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=;
        b=fp40Fup3BLomOmQ8tgRH8bkI9qlFBf85eShW8Axnsx3E6mA6KrVhIIK6LJZ8+b88CA
         yQ95n1Knwp6n8soGvJCaC3ux5b02rSA04tLtU52Pyd4iFJQ8Tocm97jjVUC0TSyMO0TC
         bbtjja2eKQI2hQuNCF8Ro0iZ328YO1VsT4IVlsai1insbdgWmk5oT1AdG4zJag2rR88d
         KywRejAUAShAYDKRXKwUbEklaSBnzOitUgUb37MGonoC1wOyaXsa3cHqiN+h8aj2SLcY
         OK+2ZQAxIawxDCTbVoPFEeOZRr5WAPnmvx8ldwLVn198ftaCqAVJiAbxOrnTGxbJYsgf
         0l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792676; x=1785397476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=;
        b=mKNXQeuwQNv2ODBuTOlS+wMzabj8z3Jly+xAkOYhdKZ5LhOoJwAU/wQOVhiMSrZcOL
         BylEQ8XnkvRcnFH9iF8D4+wOrcx8ip9KOFDWPhQ5nFcU2mNQjV+X30M+E+p2L0tb6P5V
         Axn7/KmARfqv2RDaD3EgCoWlkoiOvjK12N7lGtbQQ4Ml5f3NqZEWr8gbeOmFAsY6m1e0
         vZSiCcsTT98UMciXMN92sO2wvZ5cR29Idgw39QahVmnYdXUR8kj+VWiQeS+Ul99Vwyvw
         AZ/+bLRdWq/zirz0WP7mdstGBmXpNBTObo0Cc2Rau72HlZtY7eZFapDFqyL+EYQzBe4H
         zefw==
X-Forwarded-Encrypted: i=1; AHgh+RqBzkxmkMFC92Df90iAgxyZ5JTg4mcwtA4q+qN9aD+lClysRfyqibQXuU+2Ky++BDKRPSC3XAVMvEkDfAQS@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfvgNS4uxNV29ebz888W1LusXYeReqBxfZVYEk/VhjXm5TObR
	1Ee2vksc08+84VHRDI1XI7mGvhHN8N7UH3mD2nE02Tr2JJWLQRbhn+7FEktfv5WYBHFMZ4ZHzas
	pBBVhnmXlcBt5N6WgY3sE4JosBWtgiI83Q+IkxzTEhlnV17dzoAg2UBxOu7JLfpuebCdK9SKJrk
	ektmNKxfaMBn6ZcDqATuTxw24ZZzmqsCJchDydcchhVwU=
X-Gm-Gg: AR+sD11xej3hbOw8Qh8IojhlPOJj6Yymddb9+ZpeZc8/PA/5SjE65kT4lZ0Exq2GcuR
	lTUP9+2pZoS4YaNw8BeH8YoSvaykyM53XVuxFWl8CnAsq+9+4mRFCQswQN9BylgRRMPivt6rlPm
	JEPcfRzZVlE8/OnTcQunUWEd8DWM5MeWh22OB73xlfBB+3h62Kd950pauhgiDUM8rH4TAO1N68k
	sAYhcD5ItKd/5uY0SaHCGJBm/VCvEULxVx4fUZhHolRo3uPXsgMQSjcmYmnecLFVir+l790Cpk=
X-Received: by 2002:a05:620a:6014:b0:915:92f3:54e3 with SMTP id af79cd13be357-9310468b3d8mr135743085a.4.1784792676572;
        Thu, 23 Jul 2026 00:44:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6014:b0:915:92f3:54e3 with SMTP id
 af79cd13be357-9310468b3d8mr135741285a.4.1784792676034; Thu, 23 Jul 2026
 00:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com> <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:44:24 +0200
X-Gm-Features: AUfX_mxHzk7-ekNxrR6YHZYSOZCvGJXFcA068sPkpn4S5C2k4NBZwk69GXbglpY
Message-ID: <CAFEp6-2L5vjGXLGCgyr14hO-n+4bv7TfPQUwfGKr3=2x-jmKyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61c665 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Pud6JYmB0RDRJANqHoQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LGqteJuvT7_YQ1QkSyf1TGnkPq0TKpmU
X-Proofpoint-GUID: LGqteJuvT7_YQ1QkSyf1TGnkPq0TKpmU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX2AxHApI95usU
 RTFwF3hFf109HezoxWJyeQi5XojeeYRdIJheyaIxKT92G3NJGplPMEAFCiOS70tfHJoks292mU8
 qSVkvHLadcqLMBFFJmKOLUqXjqOqxfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX1CcNuq9Av6eX
 n3DTaNlutvW1r+UCzoYUiLdWz7LrXp1cETagHXX5ddKXw2zj6g9ZokgkrG3MbttIn+zD0ovD9Bc
 Aw90aBEuAMA1Qjl/a11x0ltVvuvvWf6PvFE40M5LtIFb0+xsLClrZI6ChHaflFCVnya71ls3S30
 GqzycRRV/wsCJadi1UlqvrD39INP8tNrmRRY67smM67JMPv43a1dy7WRvNJG6TQkyEZPnIG/Pkd
 h31E4lAYUPoWfOCnP/m9NlIRY+32A+c5J41veS23HW8kuu+mgQ4Ctgt3fS7F349aLC14kW2Invo
 xrAfnTdx9BLWSJDCYmL0jhD4/q8pO6Sd0qyHJTNs6GAMDL6e/h4TtwzEW1H3UppeBIw3hys6zRD
 v8uIkVB0razaJpU/poe0zACv6Ic9ndB53v465m5yWsMbdfBdmn8PWxMRJN32KAGe6jiShhhg6JR
 mywe1dR/FArflKVlluA==
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
> The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775=
p
> icc resource table and qcs8300_resources already uses the sa8775p resourc=
es
> for most things.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 3efbf2fb4472..477358dd39fc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4161,19 +4161,6 @@ static const struct camss_subdev_resources vfe_res=
_8775p[] =3D {
>         },
>  };
>
> -static const struct resources_icc icc_res_qcs8300[] =3D {
> -       {
> -               .name =3D "ahb",
> -               .icc_bw_tbl.avg =3D 38400,
> -               .icc_bw_tbl.peak =3D 76800,
> -       },
> -       {
> -               .name =3D "hf_0",
> -               .icc_bw_tbl.avg =3D 2097152,
> -               .icc_bw_tbl.peak =3D 2097152,
> -       },
> -};
> -
>  static const struct resources_icc icc_res_sa8775p[] =3D {
>         {
>                 .name =3D "ahb",
> @@ -5573,12 +5560,12 @@ static const struct camss_resources qcs8300_resou=
rces =3D {
>         .csid_res =3D csid_res_8775p,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
>         .vfe_res =3D vfe_res_8775p,
> -       .icc_res =3D icc_res_qcs8300,
> +       .icc_res =3D icc_res_sa8775p,
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_8300),
>         .tpg_num =3D ARRAY_SIZE(tpg_res_8775p),
>         .csid_num =3D ARRAY_SIZE(csid_res_8775p),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8775p),
> -       .icc_path_num =3D ARRAY_SIZE(icc_res_qcs8300),
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_sa8775p),
>  };
>
>  static const struct camss_resources sa8775p_resources =3D {
> --
> 2.55.0
>
