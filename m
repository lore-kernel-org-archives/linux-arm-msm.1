Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830323;
	b=Nccv+nB0THpYCNSw3Y3q/Cv31fqjIebRK/0Y2G/pFvMEgC4C32jnrozbW8zrbzKr/sOQ
	 QEfrfGnYXJu+M43DasfZDUnsdDQe5Qebh/KuC31uMCqoJnE3S5G8/6CGuLRbeGOV0tpGX
	 LQdFdMPyLIPmCbFe2IOv5uW5IcEG6kf7Wdk0AJFJm4njvVxHtmvnegWMmVS3espII/sFo
	 rkqobUMcV3cs3xwgaSaWn2b4z3nI5EO7PWAObh/wAqFzV3TRkWIglhy/7axX+FrITmX0i
	 EvzLBZ5zL9QaqY4TIshY6bZaLr+4HWO2aZ1/ILXclYxxGRUfy6iE3P5uXPBdQPGricg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
	b=fkWi3CjpEH3ikhidxFrE8oQRn8/f8n8OFsJyj4Hjda3+l8aRlOWjJB2HFOA8+fWLaTAc
	 TzUkb8/3E57thO4FqfkNElU0FIEGfMuqcorL6U8cVlg7dNaQzHyljwBe+QU6cGWphAPGk
	 XYXJ9s/X616AyjeRNgv672zNKKpTU3MzFBJ6ktr3Ix1uRrf8AujHVadumf05eDMv/5cDT
	 CK63okI3HLuGo8TCSL11AxQV27Auiq65qL4F6jcje6vcNPLIBUo2VHu7fjpHbVC0FOmwx
	 aLJi6pRwzF5k/KthcD6BQf1Hm7IpKfMKtTNCbowoQ4rvCoZWrYO7p4M/NHejLL9HSvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h70xA2I1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnfmsgFU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908756070317
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 22:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908756070317
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h70xA2I1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnfmsgFU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4H3AOK3031496
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 22:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=; b=h7
	0xA2I1xOUhDBkTTwFd3Y2vgiA3FBpt8z0GVTxo5Z80TEHVxaIdPqt50JXBrFoFw4
	+YhsMcPobW7taryWOxNEkhkusXUyIv4SOjBq9JwJDKMCvlJn3eDTdFUDIJp+seHH
	jzBPDEV+a+yyLz//eNdZ4wO2XNMroQjPZv3WVbXlqyUC+osDrBP9moQwgu2eVOw/
	ji1SVFa4f1GADGy9FBZ9eSxZnZqopFznMAfgIC7XF4Ms/Pl05P1aiZO1Byqr6UVW
	4X7RSomoUm0190v1+hFRbfa7JT9g1w43gABb6WtelVG7zjGzyyqaD/+I6+kg4oL9
	5BAC0jq6OgjIJ4SGlCpQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv1akv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 22:12:01 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-703d7249379so1589555eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793830316; cv=none;
        d=google.com; s=arc-20260327;
        b=ovSmtJrjxVBN32dPf8rxzsXoPfAtHwBDVFQtpnrwHtA1D6xHLEl2LCvqNe/pjtD8Nh
         DNXN/s/rnBpQ342htAmMEu8o/kTQQGj0TSdeFUXoYHJnTwP9YOGLvva7GLIDlTMIVJ7Q
         O2I/dntKHUNzLrnl8Nn6IVJ+W6XXg3eGKBxiYcYhnUf0euRH4AjXzvq1F6gJP9p8L+tJ
         uuSm92YfJKatIVZ2HQHAEDjy2cN+sjDXk/cCegauvbsUk3kvGgoAyb5Iz8PxGzgRQA4H
         myKjyDtKi4KMY+9IPb+ZI/I2PsXXgjFiGw5YgFdcsowd67bhkHb9xN8ry41vqwn5Jro6
         a9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        fh=+0xosAOHvVYDyH23U+a5EZkRIr0oXPbsM2aIGC7qY1M=;
        b=q6QobhreGwrqrw/+keYWMq5Gfiu2qFPO+cUkWuqF/A7ERbhlQUVJkAAMpkifa1xhXz
         r8mH8z/JxNAqvEdOjeGDgh60QmB1+hSScVR8fuwujIQckx33nbWU104t0NHHMfwHsQUa
         ikZXrsDNfqeXImdd/y9H3hkOkDN+YNxzYnIS0v5ugUl7a+i57gliHrwiV7PtsjEhYyzc
         G0V4lXr7RZipMiDmHJaZsFkzwIhFvCuSd5z5dTFCeaVHhxeHjvMNfIK8eorRcTrkpCkY
         BusLg5HaXMVx/s3+yaxag4KPtCNkI/sbeEVqR0Mi0q6/pmb0CWXxZSCwmhEyQxUJ6EiV
         4ACw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793830316; x=1794435116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        b=QnfmsgFUjMlff8nr6ZBqL6J3ZKh1gtmaQQ/Is1qws8uLXJ8fGrbnlyPy4U1EbYGCAj
         OZaxUKJsfq4UA3rObUonLn2IT8zEZm5h8QxSSydV3VGOU+NGhkmM86/rbiP8z4F4JoLf
         UoomRDMUhmr3c2cySC1AkVfa0oSBXevqQs1aqdoMWuPMnVINlVjI23IiNetm9YUw3Qx+
         eSrKeb0q2W41OkyZbg/lLhqYJUYV40UDJi01R8nyhNoXp9PRqflppKXIRTtG2QQcKaGw
         3iKKSmosibd1vrc27DQvu1onA11STrMBl9TaFyiWKJxq2yxbhjpZc0GWZF8I94YhEDDd
         WBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830316; x=1794435116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        b=0IFTlGXPErkf9HG0cvINL86ZSsfOo2YIjOPFGA5i4haoBK4mNojXR4Heu8x5qY7s2p
         /FEoioqCbp4EN4zCxsXee/z0+4MdPlCGtinTAjhpBRpO4RK92WDmzmuWy1Gr190ub3WZ
         WzzbtDWhkkgTiTgGgJ+X+lD3LUlCULiAXRxlG/4Z/3OAUzFs8QzwkjFhOQcsAEdtIRO0
         qziGe+pQLhou3TDw844WDhcd4cHWBtlgl3D7kyX4i6jxECG1BZt1O6XCAvuhql+kDeAF
         mXRg4yfUyKNV4pwFvmuFA76TjF4uMB05Jwt8FbH3TxEhAtCQpEw3xjZhhH9c9aIaB1/m
         i9uw==
X-Forwarded-Encrypted: i=1; AKwUvByLPaPWp8h6Wa9Yq6S0773A1X9u19qvxWiF1/nWrkDNtOtWhHXoYhuVho0QhSDYdoXMQfF6cCAFt0kkV4+y@vger.kernel.org
X-Gm-Message-State: APuU4Z8hQaSHj4Aczu+1kymAQGHho8f3zf1mmywr0nBzWqCKfV7hqNOA
	Ai4PNXLSB8O6iIHxOOKaldtRCOaCJ80dk8Bq7Yzp421dmMzqLQGwsHmtopAcUizFVOKrZpIGR6K
	54fj/r+S7u/HUMOrOKppgGPefVPbg1rXlnHO6WSYgIwNl4ComRcrkcIXnC/svFmFUfcoFptumz+
	7axy+n7DqUoF+CcJP+Ux0nFBATg4epQttECJ9s6jky7JA=
X-Gm-Gg: AYBFou1MlBnkIJrZLA20N+3AC5PIK6/Ms7rI0Om4GliTeCVXOLIjmezreTmPcfjgBIt
	+A6CUL4HIFhAgANoQOmZj4e3Y2mzdkyLSeC38G+vwvcWJiWcTc6hvwJpbYgITvYohrtYDJJax9E
	usU5+echl6MdPyueDiA5Jt+i3X7SD7WCUy9v9fpn1EA1jv6DqyYe1EiXKqPLpli0J378xV9SlYh
	hjLfjIisvATQvnnfKMa2A==
X-Received: by 2002:a05:6820:168c:b0:702:efc4:807d with SMTP id 006d021491bc7-714f29eed8dmr10906940eaf.49.1793830315872;
        Wed, 04 Nov 2026 14:11:55 -0800 (PST)
X-Received: by 2002:a05:6820:168c:b0:702:efc4:807d with SMTP id
 006d021491bc7-714f29eed8dmr10906914eaf.49.1793830315450; Wed, 04 Nov 2026
 14:11:55 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com> <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
In-Reply-To: <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:11:42 -0800
X-Gm-Features: AclHuK-PejnPAeVcWn1rFgQSugIaafHtbuWuLOPuri8tnD2WASiqu_5BlPlNCuI
Message-ID: <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Robert Mader <robert.mader@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aebadb1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=guYwWtrNydk0MfZTwrkA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OCBTYWx0ZWRfX02TcPbVHvsf/
 Q/d1XlniABSh90eXQH/y4Z8aKch96mm4QYzU/pmCtLTsM/vUH60ZRYhNXeO4xki50w7lpobKzZ1
 PKVm2Wr+hMXSq6+JbGDI/HugXHuo88M=
X-Proofpoint-ORIG-GUID: 0sXIcTa7Eyv4TqkpiyiUKxYtjqjP7ZyB
X-Proofpoint-GUID: 0sXIcTa7Eyv4TqkpiyiUKxYtjqjP7ZyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OCBTYWx0ZWRfXyNgPv8DC312b
 gy/tHbpYXOMIX5Spx2H6W93MlrElEveGxKh+U3QBSKuJytJvKYNsMl562kg7WQugts3jhl5y4kR
 g5NOmkK/c7uJM+t4j1T3pGKKnZOQef7H67Fu8oD77vUhP/SKASGR7HgXTARLf3xMYAgSj9xy5lx
 sqXvYAVSCs9+HHeVZLBqFxsHxhOJJ4gcvCbt+l/QvRnk20YVOc9/AuI+R5pN9aZXQMncV1TMv1e
 62Swga7L/fyk0/7mM5nkN/emyUlvhitOUNGl979D6zZoH+vRx7HRSEsslIck5FzgYkKEPbU3R4t
 YXchBi9HFbDPc6vESRw8Hf5cHpK/HXtitLJRuU9cIjYuwLlsda1Yb+EJsVCD63sfkqrJfB8b5XK
 HirtSu+doZaWnBrd+0fGWv1f5xS+Et+YehxDP/aubWrDqiBMdhNQ5TIB+fNHpMkWyEjXrVv8ccs
 caXJGM8VFoZfEm+YROA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040088

On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@collabor=
a.com> wrote:
>
> Nice, very happy to see the series!
>
> On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > The comment describing the QC10C buffer layout calls it a compressed
> > P010. It is not:
>
> If I'm not mistaken the display engine / the DRM side (including Mesa)
> describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire that
> up everywhere etc. OTOH if we want to keep the DRM side as is, then the
> comment should reflect that, IMO.

IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
as distinct formats, both with and without UBWC.  I'm not sure if the
same is true on video side but P010+UBWC was never exposed, or if it
truely only supports linear P010 and UBWC TP10.

BR,
-R

> Best regards,
>
> Robert
>
> 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/81=
95
>
> > P010 stores each sample in 16 bits, QC10C packs three
> > 10-bit samples in each 32-bit word, which is what the stride computed
> > below (width * 4 / 3) assumes. Name the format correctly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_buffer.c
> > index eb8de60c1177..ec2bf2a2d953 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_i=
nst *inst)
> >
> >   /*
> >    * QC10C:
> > - * UBWC-compressed format for P010.
> > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in=
 32 bits.
> >    * Contains 4 planes in the following order -
> >    * (A) Y_Meta_Plane
> >    * (B) Y_UBWC_Plane
> >
