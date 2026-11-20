Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163473;
	b=j5k0cmknAcFgfopyxUAKiZIZebvX2uKKm+idpfECUQpywGwipwXrIpj6UOFhrLbenH6k
	 4ivNBYUxop7oW5CADAZWvAtvUmOfwW5799CABaZUt6UdcC9nc6RNp2NJdYi+0gNhzO4P0
	 7cNcPBpAZjz01E1vuxB6IYMsd5E3OAjmXuk1i8135iJrIFTPq4yaWj3HM7+2m2pVwmAen
	 9HXq2Bg3BFAO55JRcwcVHhcn6RkyZqMj4BoJ68Ahkehqf1hZd8H59EibfenOsloKy3mE9
	 GbTmvGMhQk0sf59Bdi07S89g9SRgvj6mP2LIesRtuItoap0gh4rkPpa1Wlka8SxbPoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
	b=Pyd3McPkHp6yPWtqNesEoHfEG1MeCpI/b7U6VIbEfC107uQaMwJo0EYao49X/y49npBU
	 ecJgDyO0RPSbkCg69cr44/RoujXmmAuehtAJQpWojRv9/gu5tEGqo77cF8vhS1y7siJvs
	 h/dmQAUxIk7FzsbdLDzRvMDEIKU8yugHZEGucH6Nrjt3k5f17yoi90zxz1eDjg8dON+VD
	 pNQk/qqhKYYeupsqAFQHaSvBe3LW+kyqjrNnjluvm0jHcS4nWTrkXw3IuKbPFGYkZFoy/
	 +2DcvYbFnimfTI5xoPz7mwtS1405VxurEYIAR5Cqa2R/60APq3rSxYw3KrGC4FyQbPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D59606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D59606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esGY1048780
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=; b=LU3Y3XD1hN5TD/oQ
	pz6hWJygeLPcb9SMWjd+b1jhQYq1E+SCUds4bO5A5I5/r+64PMwci6GVVLVHnJDc
	YHttmuQ4yepW1NYCQ9XNTNheIdJULK5hfkYwwRxXYZzz9yFtVEChw8ApvIyTwOPw
	XqgcEcRDQC+vhnD7uMBX8ToyWGOZp9xPdICJj2zs9iFq80ZmcBhK04RdWAU4qShY
	gwGIiXb2BKdLnte9LCJ/RED9pBr6ZiqlVjh5GqPdQn8Xdo3yf9b1zJQQrOcyyxeZ
	9GqamWgzZlYJ+N8MEhuGoUZKzn0QnbXI1K+z+39bT+WLOZEC1RuO2JII48lv5fRO
	vK02dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guaghe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so113796285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163470; cv=none;
        d=google.com; s=arc-20260327;
        b=fuMj3UBnltAw4cOjBJGqsVKzwcu5FCX8CQApMdYIy78RnpT4DH1tFHm/BxTmLY/AXM
         o40NBRr9XqSjqxFGRfTKtq4g24D7kpEkQLUuvOU7sAk66OByTvy/glOkoG0X47F8+U20
         TJjOm9dyqJVYXLTp4uLfZosja/UlRaGwDIFAw5BN58FZKXnDCaApl6QWwg0VNFD7TOh3
         NXzlGuxpjtl4/I4ErWm3i0T3SXmY2FrTQ6cwIv1DMpazFXkBth7sQTSllNZEGuHeZCu8
         77Dsp4Om2J3P9G1Q+AI+Nh7NJgE76BpdsSf48yG+LLgSqpxBg+HcmhzLopuNkDwW2s7R
         QQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        fh=huVWe/hY4FdgmJD0Wrfo3rtwuIgofbNeIp8iVe4FrMc=;
        b=F2Bz9i1NV3wNfdAGgqDqHyWWmBYnJnMIpE2IqXlp566LXeivQ/cAidDZU8dADUjb19
         eKaLmP15HS88krTI8kfFSMJLEfZprXncXLKymm0hWbF3pJLT9Izh0F23eA/PmOuEF5lU
         0/vfLk9iWLkjKEZ/qu/9IYsCXPEYb65rEC/elO+U8TrOPb5tye4wVEGoqCZi7BPzvsmY
         M2EbTFowZZ+1++94oLO6IRwpAjFiMJeNGjDeqAtZWj1ePqzbAViMhB06x7nTYMYtiIPc
         LIjaWLQkLfR9XHnmmJ8b/jyOn1r43VQ0pxwh7exPZ+1/l8zKfss5Ing6sMK2AXngJLxz
         b9Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163470; x=1795768270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=Py8Ekl9IfA7utoB0tDdW4cpxXAHzKw0Gyh6IDpWmT8EmgVSp2OiBfPp7H/yrqjbP80
         wiY5EFNEpvWT5MH1SgRtPVfbqPXz7ngDWkdLCIQApz3rZaCp4QHVwEONbsxvBhRo7yIW
         3asJ9sr0bFo40+eLjJFQ/MTCjo9Z7VSVCr5VqMhyEbmDnjkBfM+JpgTumLAHYFAmp1L3
         7zs2dy/AhSdxx0NpyqGK2kyP3xiG4cnUZBn/vWii/ld7Rexq2zHx85nbJ0koJ2qlwd0e
         22cCvjw23HJxgK0SqSTaMJHwU/4+yGtC1cRZcT2EBawVd7H1O8PtLkyrY+OyAieiqZxN
         xzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163470; x=1795768270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=y2+YfFqftCEp8v500gnKpXu663yOMasWoyWtgSG6nhuUMlO+nmpi18+9YZxZc4lunS
         /brGv2m99csBfxe0K641pZRQ3eP4cJiNSYk7TRM3vwJbdy6xbpeHpeE6YdvkfMb/AgGW
         r3eosrgdEY2/MATMWo0TY7A8unO2DOuUHiUzAYPvhWH/PdfZ8XV9otWNPGPuODsfhXE2
         kmNbJN9XHhkjwyaQA1mu34sXv+H9n41ekzGLVCAFxGIh7AKtx6DmOegfiuHTZlVWLqKl
         2kCVofFTkcnZ9y2FVMeFP00L9Z3k2CkxjciGpmTcIY5VTroBQzC/JeMNt5TkaJURSL4W
         GQpA==
X-Forwarded-Encrypted: i=1; AL+hErGuOESphtg69Hi+87VJd9rDKkivsl3o/riGhIbhRgKe3nSaej4vVjokms87eyH/xOjjGw8Zk+zSwpBoLlVL@vger.kernel.org
X-Gm-Message-State: APuU4Z+73Qdv2njBm+uybg58TnFRHRSUXnqNeq1B9ZfjUpuF/U9jySS3
	WASoi9DYFIYlFFsCbj/DLK1Nul9l/hnzbqOmPjrrvTfR+OyOgO0GcTEI35Ffz39tf62FBGGFBRW
	cBfx5V3fWUfxm4Qur9hdG7HrbXrkf8dzXi/39knLUyRSkwKzz72a8tAHFS3gFfy1kl96C7s7k/F
	WfkGzj/9zSLl+s7BH6VTSyFjpLJxmIwFW8B6sxEK0UrfM=
X-Gm-Gg: AYBFou3asLhjsxfIUdZV5EBj/+yscRNnlTd0SLyDrwsfNjmAJyeQzvmyOui5gHFk+Xg
	xPE3e6V6Sf0v3OwKxAlhz+ER3RpL0D8RvZyVBy8phwBD72gMjgSM2JgTrLKNiphqyktCf4/ppwn
	ATpWAHZkgT86sNbBD314/WgNXn4Lq3Zu/glSLNmItZJQNxt4CdEWergV9zuRDfyvkMU23nNpPlF
	MUYF+Xkp4grOrLn4/YV8PWzdRmYnTWfhDJOovewyiaKZHIXS6DzA69BXqq9aKbHYXphkZ3UZ9sg
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id af79cd13be357-949ba8236d5mr338132185a.2.1795163469900;
        Fri, 20 Nov 2026 00:31:09 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id
 af79cd13be357-949ba8236d5mr338129185a.2.1795163469416; Fri, 20 Nov 2026
 00:31:09 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com> <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:30:52 +0100
X-Gm-Features: AclHuK-2t8-3AjSOfc5mzRVYC-Pl0iOAGyB7DrYCV7YVpEsHwSudVmzm65JQBp4
Message-ID: <CAFEp6-1HNo5fJ3k24sM_Ed_WsrrUY73ZHz3+ZJwa1S4pSqQshQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX2Lugyo5UUk67
 LH+PSWAgcrA+uwFHd8bnAZHuxvT35XR/hRizlioK8dZBQ6Rfp9u3GUs57xQEE3N7zoZOsBpJjOl
 MkuhcQq3FnCw7V1lC4I4IFWpQ/tFffTyGIPECunz144WccQ8u8a45S4wnOmqyjxLER7GeZMqFod
 +OFjxDochn2/B8enHyWzdOraZTpbVTCGHYwxnYZUyTrAAA6kwsi7B7srAYHPihEUYFnyFVYYEkJ
 qTe4B1tebqkIMNPmfD4REgEsRg6+S/RKPeMg9YZ3BFf/FTinjIWunzKslz69UbGtoKZvw0sKfvl
 ctOa5dhux0Aix2gpuVTdkRkOsJYCABcmTzU+Mdq8qHHLB0wh03n2rTSmINLZLzHYoaEVWCuqXxp
 +FX+bVvz/peVL2OFxzKM5n22Zi9/SOJoJU+IcYVGOBN17ggsoLdVHL6Kw/PTb1+BMK4It5YSIiQ
 HWf3G7ys1xLKLY0kuow==
X-Proofpoint-ORIG-GUID: k9K-VKPcYz9MiIF6Gs72FMIo8D9s5sOV
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b000550 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=J237TlFOsQyoHL5R2bcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: k9K-VKPcYz9MiIF6Gs72FMIo8D9s5sOV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX3f7+BBzCfULi
 MUoIrFjdXMpQ58/kXDUR42nAQc6Tr2a5kiccZVgpFO+0QGes/cKEOSrmYncvGuHcWBMBt0Nt3Mv
 zHkS77fiVoJ+ERJ4i17LqqLvUNuklF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Thu, Nov 19, 2026 at 4:04=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
>
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
>
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
