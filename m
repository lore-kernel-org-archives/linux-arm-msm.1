Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183163CF96D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414873; cv=pass; b=n5lbleSu4C9pVIKLpCHrY5oABWIlLOCtEJCPKPwCyHYFy+MDFa4hiwsnOzg6qktK51fMCx48SroEsCA+uKa99djkK0QWVGT+7GmJVvPGNpV1gtYFDh8O4DMhVLUScFhlRAUI2nz96dsgQv7nIQnc588g80C4gqsGRFm6RwRZ7Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414873; c=relaxed/simple;
	bh=NxWEunGjGB86A7F89AhMOE8cJDXgKJh1EGHFuiKVhl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=toYsUxdXEQxRQo9+NGf8pbAkazmBRh8FQ0qeVpDaYEQf+bwX9kjdgsEz1m0BvpwGcBJbnTKIUv4p8WXnJtxyUT7oYomgTTpM1sRcUVRKmqUfOcfNyec21FtOtGFwG/JSPzFBhyole+C1GnnDhzdZ1U159MyFYaRrikYShXRiiT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2NXF71a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSJNlEKj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2NXF71a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSJNlEKj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB8EDX825671
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=; b=X2NXF71aPsY6oyRK
	kpXT1OTMuzTzpetDZa/SgPtRNGCr2anNPQiBNRyyHucvvNxO+rrCpfqg63C8e3AV
	jkj7Ah1nEElTgWEMDyOAfYuYPptOvFs0Ha1HuQR6HQP92ChR7LsYDCg0cOLkcrjt
	DoFWV2PWfx2oW5CWlKU40WKSssB+SXacd92oJ411MlhXz4mxoPHmXhipcpuPdAI1
	n3s00XzCIP10ZCT83954Sb4CbOyUAX570SatOTUvHaJNWQ7L9IyHL19FGGWW/PMP
	83w0l/7ypMeaHdJ1A7ckAjYrhwEoh94C038E33wvqcFRDP7qTya5YV37s3q93Iyi
	jDh7TQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5fpra3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso69807985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785414870; cv=none;
        d=google.com; s=arc-20260327;
        b=F621H+pRwNjHkrIanPpC6oN++GDw1BEzUb066oA3jsxS9tVktArnKKn1NN424IJtgd
         V7djkhKr27UWMEXs+cfQZEaPV4FqC3b7meKDMmTTWNCfy3U9gkK7SA3tAV2ImDEmDdVX
         YImJOZXDfzXJv0n7E1M3NPIsaHMsCVc1QMzgwghIP32suG3yxkMAUDjSA4sRfyCVWg4I
         jrlikGJpD6oir+OeYGMf1AmIofXIUrGwR9TMIn2jB3yKk7W9Rw6Br6ElywU/jmxiCIaX
         9Axyqv+1FSZU3BtrlLH3q/7qofrimivygaHd1sVjaZARRqfVo1jBbHULKeNl68XfbY4u
         5hUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        fh=cHv6Kk+ZXEzR5VGqukRalf/s7EDpGLgmgcohDDTJe+Y=;
        b=hgSTfG+D4ibX4dKBu5LWgUmqx1FzGSfOm07cNOEJRdJPykAtz+yd69KftQM8Qdmz3/
         2zEKQS6nmfq97j3xJv35ic7ZOm6UnIn7nEEY7hiTuQ08dFgKcMoiG5sVZZy5QDhcUJtp
         mnbPsxPtlElYIEvWOvkdrOPXsnuz2jIYLyozQMwWxjhbTQ3U4C444Ol8Omh5q0ixKc4e
         k9zuaDfh0Grqnc86hbtJ1vwRJPKyE5GfvszUnHRcHPUltVx7oQXiVCeKkIakkZdzpCML
         yhpMUFZT4t2LPfvyzIbYwVJndMAYggjOiveDhgkskK62aJ5hZOf/oLiEvRl8bBppHKxB
         sXcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785414870; x=1786019670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        b=HSJNlEKjmlayVed3YFWXi2+ZYH+3hwYUoQf1HuMXvNv1dd8Ti02RCaOKfIbnMT07rB
         gNDcKfkrFWwUNPaZOYQBka72qkqS6tyLJcVi2hJpunRuCMQVNaXUkeraAZYeYammq21Z
         owUdjihl7A4fhfsECCzy4dm5GSYs8j3J4FWzvEYS2XXvXzGcrvlR7ZXpwDF/BMyaI4vK
         UQP2yUERYAYhxqzuEsO2DgnEHgyF4JdCL4wTk7QKvAy5+n6QvCydfvYWHRgH9GBFrAs0
         21OzR4qqFwBtmZ+Si/+karTGQKqD37sdAzqmNGKKyEM0Zpvq1FViGnvmiPxgiDNTkM+s
         qeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785414870; x=1786019670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        b=LDW2NU8FnrVdSgXGixE2e82SbQZAoyK2tIaZQsItZng9Gu/yJlZe6inom6M/DW/P+c
         p0MkFYJMhgQp9NciEZj/Vamv1i6HtRxwpC/KOga7Zlsk3H+sKCI58cdqUydlHiG8s8c5
         QY/WREp568sFzAh0dKlWlNX53xbVUwNH82acwgPrZz0XO+f7ckCqTDF03x+HVLAy4CP+
         0Ap3oTQ70be+3aphtjk4Begv4U5FsZrhs3czdgcvbpHrOTAaVsNbklZvI9KW1ZIzffK5
         UzN0/x9bPIk4/bGDGQuZGIlTWSj7mN1wHjFIItfl4bsVDFjaXJMtQqa7bDYZTntX9pbp
         5PEA==
X-Forwarded-Encrypted: i=1; AHgh+RomhVwcXTEMPvzTetfyUPhgaNp/XDLgNXI8GMHhcxrlZyMLaK2GJRrrXVpjNRA4MMQGvOGFGaDgQXW2J1Xe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9TIEQfKIqHQVLg2jW5lDxf9+eLorCssmr2e80VYgTa/CnnJW0
	qX4Zv/AbN+iKFHv3QRqr0c44EkAXJB3lL05Rsxsdksg+ZCTGMQxRrTZPYjLJZ+SWLO+YP3Omn6+
	g/KfdcczqW17G/PJpo1ifWn7+/Tk0NyhsfmZ+hLkqYZD8NAZIel2VJT/As9gcsGlDXXgcWSwFH5
	FiTUDmzZHlFTt2pOvg5jodI2mP3ROo3CXdF/Qxye3h9kk=
X-Gm-Gg: AR+sD10XjUO/YqlFBr8eNmSWjci5rAdCNq2hK8JMnUsET4tcaxud+qkimGBRbgmI2S2
	9F70aS5q63XykSLGYruLvpeUIm6hRS8OQBD6tLup4wxh4OsgrjsTKeeLSRKz0rZhgULUqDd5YWY
	XJkSoXipqqqGsaLZTQLA+KNiVnqflhqmqHKRzT96/6o8mdH3PCgVdDTIKLj5qGjMpgwgKtrSXJv
	tBqwf62ZQttutdvbsVdiYuLIHWKWpy4Rc3jO/Y4XZiZfIULdw7ErGdR366waydMFIc+3JLiCpo=
X-Received: by 2002:a05:6214:2388:b0:8f1:ed00:7fd8 with SMTP id 6a1803df08f44-9083a3ed266mr2312356d6.3.1785414870299;
        Thu, 30 Jul 2026 05:34:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2388:b0:8f1:ed00:7fd8 with SMTP id
 6a1803df08f44-9083a3ed266mr2311916d6.3.1785414869813; Thu, 30 Jul 2026
 05:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
 <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com> <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
 <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
In-Reply-To: <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:34:18 +0200
X-Gm-Features: AUfX_mwG_XLqff8We1-VjUFCpEv_zMOLloZt58qLvXWmamPVEeHzeVGoLatBSdc
Message-ID: <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ErfiaycA c=1 sm=1 tr=0 ts=6a6b44d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wb1n7jFByJHGHbbB-X0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5NCBTYWx0ZWRfXx3hoV6IFx3hp
 fiabm7mptYKVgMx2KeyHYgYlnMUj2NoPSklLqL670qDUAoZDqkp7CqhuL39k6SXeXdHx61DcHeM
 Y/NuBtu8du054pCsqPlaBinZmOPPpeQtBhmd6ikUH3RHQII7vB9O96AlM51b2lqkB7F01sz+bL1
 I6mnxXCopldtvzG5kGNvPVXctPkG4ixcYVOumyEV1Dc5u7UzGldX5EQdsYJLt1tu4zERTeQTXLd
 jdpmPFKLjc1Dto1GW9k5o3VYsV75vD8B6ejEiiMinXK+JKNF4YnlrGGdKX1INJ9adaazKj27wGd
 6WRryG49vEn8pQ3YY27Ie5eqD5BudyEFzpexyZFV3d8YXpd/JmMSOL3evgYhartDbZ0K3jz7rOV
 VzI8i123rRxvyH4v4g9pXuftXuAmtSNc6NBH78PEnRC74YM82rOJ51c2laX+DLQIbNlM7B/iWtK
 iY0eS6EssgjeozjKM9A==
X-Proofpoint-GUID: _b-mih92lbl97KKIL0WmTIaRp7JRCQu4
X-Proofpoint-ORIG-GUID: _b-mih92lbl97KKIL0WmTIaRp7JRCQu4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5NCBTYWx0ZWRfXzhiPkWgolap2
 //R5EhjAz170aSqMkIOOWlGYPBXZt8oWhQ0ora86+9Ajb/9r0cFSrWS5ykw++PUpo5LAJBaOtF2
 z/JJMpjhq4+sqthEkW+TMRFTWTIyIxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300094

On Thu, Jul 30, 2026 at 1:57=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 30/07/2026 12:44, Loic Poulain wrote:
> > On Wed, Jul 29, 2026 at 8:28=E2=80=AFPM Gjorgji Rosikopulos (Consultant=
)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >> Hi Loic,
> >>
> >> On 7/24/2026 3:42 PM, Loic Poulain wrote:
> >>> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> >>> Qualcomm CAMSS ISP parameter buffer. This format is used by the param=
s
> >>> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> >>> ISP tuning data such as white balance, color correction and chroma
> >>> enhancement settings.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >>>   include/uapi/linux/videodev2.h       | 3 +++
> >>>   2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> >>> index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55=
d59409dd6cc97522943 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> >>>        case V4L2_META_FMT_C3ISP_STATS:         descr =3D "Amlogic C3 =
ISP Statistics"; break;
> >>>        case V4L2_META_FMT_MALI_C55_PARAMS:     descr =3D "ARM Mali-C5=
5 ISP Parameters"; break;
> >>>        case V4L2_META_FMT_MALI_C55_STATS:      descr =3D "ARM Mali-C5=
5 ISP 3A Statistics"; break;
> >>> +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr =3D "Qualcomm CAM=
SS ISP Parameters"; break;
> >>>        case V4L2_PIX_FMT_NV12_8L128:   descr =3D "NV12 (8x128 Linear)=
"; break;
> >>>        case V4L2_PIX_FMT_NV12M_8L128:  descr =3D "NV12M (8x128 Linear=
)"; break;
> >>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr =3D "10-bit NV12=
 (8x128 Linear, BE)"; break;
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> >>> index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374=
e6fb2570cbc6bced230 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -888,6 +888,9 @@ struct v4l2_pix_format {
> >>>   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', =
'5', 'P') /* ARM Mali-C55 Parameters */
> >>>   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S'=
) /* ARM Mali-C55 3A Statistics */
> >>>
> >>> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
> >>
> >> It seems that this is generic format for ISP parameters, can we update=
 the comment and remove offline. The proposal:
> >> /* Vendor specific - used for Qualcomm CAMSS ISP */
> >
> > Sure.
> > Loic
>
> Since these are not the full list and as I understand them not the full
> structures for OPE - qcom restricting the full formats ? - I'd request
> to move these to an OPE specific header.

Yes, I think the params struct can be OPE-specific and defined in an
OPE-specific header. However, could we keep the enum in a generic
header so that we only have a single enum definition? We could then
extend it later with OPE-specific or non-OPE-specific parameters as
needed.

Regards,
Loic
