Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808B2BD09
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796717; cv=pass; b=llTbSReDKRo2z/F0vDM/D4QPswXyOoPEG3NIimhPLMlMtB4S94/ExMohEnyfggKaJquvkMoq9MXUXWi82KXUjPq3Kaan4c744eG6N0qUYQNOWeSIDVvxfPyveqODVQB4htjeUal8jyAnUq0ds9+VIrQgLPhwdRpX1MU81gp2mow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796717; c=relaxed/simple;
	bh=iykpEjmfj3py3tFXqIO/8lYbrm7769mPGBoqduQDNAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFL0y5uaQju7x8pJt0pEz13ydGr6nz+5DGrqUCX3n4iy2zpHZmDjddMg5JdBlUeCAl6m4qh+rw3BzhdtQQtzvw9Kt0qSd/pd9s9Fscmf+hmNFwh5df+N9IEOn///uDhLmXZfiDtMEDcmydoeqynb8Q5F8bnjRcbmPaxC87mQzl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZEUZ4QDW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAR24yYa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZEUZ4QDW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAR24yYa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KgNx1192617
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=; b=ZEUZ4QDW3pKDaaH7
	enBOUXI9Cq57lG1SlOQWSR64rd4k4Vn0jnbDl98nPvkBTB2fs1m6Q10/PUlmp1z0
	7hheaqgadDA/cQ65euiX0Y74PYwtwwpWDD9XRP9YJ6N0Os5/gw2NfabXFL/LguGR
	oRnJk9ysCSqzVD3DoergKQKt2TgiKrSRaVLqmA7NFIe5K69Q5JEpKIk0nBWBLIX4
	WOZIkHxm8CGUahlk9ve7k9DPYhTq5nsxBcOBmk9emXglguNy/70Xn/GBR7cK9c8X
	z+7DpRNbOOBQechsolEEEgcXGKGrIwhf03lLSOsoKAxPc3TKDtJuunrmz35ntu/d
	Jsx0ew==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4edpmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:18:34 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67935d0ddcdso2299043d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796713; cv=none;
        d=google.com; s=arc-20260327;
        b=ahNtExXwmoX6xrlUBRJxIOSrHGaiAcjpGBRK/hi4td9mM4prtUVFZlwWZ0+zyUt7H9
         YwzsR1cfcGFTpdpZAiSaQxywYAsAF7k8h573gDciJaKZqOlUODdZRqZo6OQE5c3Zclgv
         6oslzRGzOO76AZk1buuxmy/SfiKlAiu5ojK+bD5IF06Nd60DF6ZDSm7FkHVWVgcYje5K
         wmwwuTJJufZ3WmTscc11k94tzot152HM0MwufLaPlq6/awp0EWNlyunWGK6jKfRzctZS
         NHpAYRWWG6XNeDuoBfho722pS5R608MzNnVjNFLWLx4PjkR0eiplfwI1YRNlK0tOMsZ/
         llWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=;
        fh=fKWmvM7B3U+h7PKnVVdAqmYr+e8B/PqlHgTNPzJ+mZE=;
        b=OD02Hx+iKSZhisCJcyVKm0yyo31I4rjSL6Yx7XpYD5cinFlq1s51ibVRUMqy9L6jvN
         UdTb8VbFwSEgoW5FBlUyI1vNGgjFKiH9Wumof0QAZ8rXZ8EkCW0vXj7EVcY0sXhdvwJH
         DqmHnYqynuo3PyQ0u48rAhTRHd2e2R3ZtsSk2Yysq7o4FB1P8v4+FwHfgJ/Ph6nLB+nb
         WmouRsDI4Wz+pWxVIpOqd3DLW8ZQEh9WcVonEqhBcVq7Tg7udMNabSS6tkm7pjmAleBZ
         4GxlKxudX4wjijaUCMPVg+WlKmVcYzsIjpSJBbVAqwNGCrvmvGFWXak+ksX+WYYRe3H7
         xcOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796713; x=1792401513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=;
        b=bAR24yYal6XUk7ZvLf/XZoit1cwCxiz0H/qXlgJjdigQDVIYxKyda5jNSbidHIEeBD
         NKsVdwXe0D5KPJBdi0ODNS5Qg3XbZiE1lwct3sl5nYOx3+ace7WSxN5s4whMXOS5xeZO
         8D4dw70lxLVGwkDR79TVu4SDhatmoXb/BPuQmzNAkRWArZMVifUFTK4lrlGMgHKpNizD
         C1xdESrEyFMm2+jcC0Yeta5xPf+DrHJ6yHPCA+N95MQ/mLokknjN42NArXahx4s6NZ66
         Y5h0Tnkt/J7DLmplT1j/EGjpnKHeJVTEcQFGeNZ0YSvQ7CxGEoq8HGNNWoA5urIGVu5l
         qJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796713; x=1792401513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frmH3qtKGwi4OmF5xiPce61fPfn67lOzyDsHP1hrqrk=;
        b=q9g6rLaRfJbTQieowwi1MZNcIjSaW6Udcf5uL3NZgwvN6vK4C+6Kb/O9DcW/c7Ogna
         rf0K/Y/fmM9jAoxmBf3OE8ZHdWOWjxyNWtfHQyTpXgLloK9MvrCxpP+KfrY8W6I7IWR7
         ZpRrmi/G2lAZsAELBTsoVbNGQNqcJKCaDpaShkBYAHxMz8WfFVwbnf/SjNEude/DZcN4
         cSBQBGE2XWo2v+LLCKMV3Ktef7TbIIxFgx84zOTVFX2d3jzXCzW/fklQw4Iqjj+rB9RW
         4+FBpbaC726y5CAuVfPJfhv35gwcgqFmmJwoECg7D+ohqpe9s4RGVdTJ0ZehTi4jFCO/
         LkVA==
X-Forwarded-Encrypted: i=1; AKwUvBzbtVQCDiwPcIV4us7IsNYcGfelkxUPlOQmeAJkCG9PeNq/vkOmkISFTv6faerq1cEaD4vlsq6IsJ4Kf4il@vger.kernel.org
X-Gm-Message-State: AFq9FYLV2cHbDNzdbK+/0YIuUAPaQ90Uz0J5beswYlRyYntndSKrX6No
	OQ6yIjzKX7bGiq3fKcCqsANS0BIyYFFmuOoOq7e2ORXHqKy7nrMmBIoh0IJrdvBvHGKfZNUoAsq
	fbh2q0lHeda2OJMco3CLXoAbOfGjsdfkXcmqavsKjlirrUHD5XgTZ/BdCTWY+kvD2sBHtzyXRh3
	JSxfj+Ke5ejizhaEFjGxqArNkDxHHyAr+LsnLbhXuGFX+vw3Dn7YvKPA==
X-Gm-Gg: AYBFou1XvJ6ke849wMoIoI0Cyi1eoOPQLxjxql6fGS6OILONuyRgxtjpMt+cht2ZdqO
	M6z3yhpHZlz33FEiUmCWkJ3FIQjbXmQI8jgPOjy75i1DFsj+xTkiXvYd5GNhd8saPuh8YNeipuw
	j4UDrMM3+hRvJVnrUt2rnJeU/2x7V+YpZMTa/C2apA1JxBwZ7JwlNzBf+mgUM=
X-Received: by 2002:a05:690e:12ce:b0:677:be91:d866 with SMTP id 956f58d0204a3-67936279c3emr3691384d50.47.1791796713540;
        Mon, 12 Oct 2026 02:18:33 -0700 (PDT)
X-Received: by 2002:a05:690e:12ce:b0:677:be91:d866 with SMTP id
 956f58d0204a3-67936279c3emr3691374d50.47.1791796713019; Mon, 12 Oct 2026
 02:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com> <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com>
In-Reply-To: <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:48:22 +0530
X-Gm-Features: AclHuK8cie94nVha9kpPm0-A3e2nKzEU2Wbgvp8ortr_R4B7h9niD3vVrzhaPm8
Message-ID: <CAGptzHPnOx+7iZhtF+ng4ZonucOH9UDWTnOD=KUnRNGMnS0JHQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: mukesh.ojha@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org,
        harshal.dev@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXwbkUZPsJc0Q3
 0DglNuRGa3hhA3+3GWf+QvI4cQcqdjy84ejdOYGliyzKVZSWuIzyi4Q26X+hQX7zr6Hd/Cegh+8
 C6riTIsaHUQMuEwNcCB1CvpobgqiXvwReeautfi9L2fzUfXskys6jVD98keRyzQ2mB2c/UYKmia
 FJHlIncdWa6JJnImA3CZA6QLeZK29hFfuMUTGgtFq6bTo/hdPPiJJd0MBvJWUqC61BRzx+92VhO
 KgOJY8Jw3C5j/RAjnBOGw6XDCPVuIqgxuu+NumU/IjITbhyyKZwTJVAR+O+YoyZWKhm4XEnf+wx
 H9Nbx1S7OA0Rr/QXs5vYpoknMBi81agZ75Z9+LzfFPFRuJ4G+A+TsF1kpVX9XFd2uazGJPpP6mP
 8h0F0dQ4/GDxv/yhvggS6sBSDEGYPaCfp8pzV/ceSs6cgkcc6AkxIZJM6gK2wsWa9MHSPoKHYNz
 IPmyGcmU7YUI+CCEMHQ==
X-Proofpoint-ORIG-GUID: lVywA4HeryUkbJBqClrGrhw1p4hI9-hh
X-Proofpoint-GUID: lVywA4HeryUkbJBqClrGrhw1p4hI9-hh
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acca5ea cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=5OJEbP_EH8M4abXODLEA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXwwtARucdNJcQ
 XInCqKXiFOn0vBlutPhGtMJvo2P/t5CqZk/+61I3TWYuHmIx0m4KgWugMgP+ZPUN56QpBLo+tcN
 VFw7ShHtUKRtiDHRJm7S299GWGG5sU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

Hey Jorge,

On Mon, Oct 12, 2026 at 1:33=E2=80=AFPM Jorge Ramirez
<jorge.ramirez@oss.qualcomm.com> wrote:
>
> On 06/10/26 08:41:49, Jorge Ramirez-Ortiz wrote:
> > Stopping a remote processor clears its cached resource table pointer
> > but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copie=
s
> > from NULL when the firmware has no resource table:
> >
> >   pc : __pi_memcpy_generic+0x110/0x22c
> >   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> >
> > Zero the input size when the table is NULL so the copy is skipped.
> >
> > Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qc=
om/qcom_pas_tee.c
> > index ac33a00687aa..a52a7df385ff 100644
> > --- a/drivers/firmware/qcom/qcom_pas_tee.c
> > +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> > @@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struct de=
vice *dev,
> >               },
> >               [1] =3D {
> >                       .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> > -                     .u.memref.size =3D input_rt_size,
> >               }
> >       };
> >       void *rt_buf =3D NULL;
> >       int ret;
> >
> > +     if (!input_rt)
> > +             input_rt_size =3D 0;
> > +     param[1].u.memref.size =3D input_rt_size;
> > +
> >       ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
> >       if (ret < 0 || inv_arg.ret !=3D 0) {
> >               dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err=
: 0x%x\n",
> > --
> > 2.54.0
> >
>
> could  we merge this? as mentioned, it  protects against blindly
> dereferencin a pointer that might be null. I submitted another patch
> that should address the issue in a higher level interface but regardless
> I see nothing wrong with catching it here as well.
>

I would rather prefer to error out to the caller rather than fixing it
here. Doesn't tee_client_invoke_func() already error out or it causes
a kernel panic instead?

-Sumit
