Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8EC3F6C58
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801750; cv=pass; b=jmsWg4nz0gozULk3WSOMqUfu49wMOH1T9jFo7esshoe+/SWzqTq9YRL/dv1KGaano8A8B5XR8MmOtlbMtpfTZE2lyWom56BqcBa63opshG3N1nBv0xaDVFnJNAhWpodsW5BWtlyjvBxgMRKBXDjF2Q+2Gy7hj2YWSx7IiFHzg3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801750; c=relaxed/simple;
	bh=3js71wal8EuozFhnWmZJAshhXKELMieO/Rt9CwfgXJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDbuGd6kq03s3OyoIZ8GKJGR5F+aHadAoEIIsC0wnB3LKb3cgBROTj9IBKwSuCKg77ywFx1Ua6sW4evSnLGjpm85XntOxihu5cY5Tqj6XEW9urOTzIYXVD5S86I5AMQVinaaSwIOqIPuQQtKZeALQ13yUwTzL/+3Wbw2tfe0m7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wh+glnP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+DV9SGd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wh+glnP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+DV9SGd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K8Jf2796117
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=; b=Wh+glnP9ybHEz+Uz
	/XOQXKVBaksswsmllB1jERKb0YlmTqTGRBWnz3ldvr68yrORylUjKqPZRRLEoPVH
	oObG4iri+sbB/5ZsyKVVnVaCkCnBfxaxb7/DhbZO2Cc9YY0XEajuZkLQ+/7uvRdk
	MFu/pEg4OIqsW2tQcxxDjVviN6q/YUL5/4aCfXl4yibdWATSisym4ENE0LIiODLD
	TfvdXtDgaF5lQVam5BB5yv7WBb4ftGEaRBfgOG+Zke3ZlIY+1JzX07L0UR1ki/qm
	lMm+fDccheWEbuyH6YEPQyO6gfH2l9bYUa/c39aDSfW9EMktE93Tlj4wor6WMKwk
	6Zg7nA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3grw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:42:28 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677afa56a1cso2210106d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 03:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801748; cv=none;
        d=google.com; s=arc-20260327;
        b=qCAkroQ9l8bCBKB+ZBPHvrEGPED7DCqhJPXhCR35uuWfCO+n/4Qci/7iNHspfiT4pJ
         RpFpJzxuzqBWDEe9eJL9AYpxtpkmrHBAfcVdEgb4nja6Yw7XGbJE55h4JHKbCjhFTL2/
         XbwunCAT9mFpsbRE3B4jvoGacsoXRUwYUiE0v5yb20n8P30zYYj1xJaVoWG+uT0hmyBf
         OFP+C2RKxhGB7Fc5sGKoeMe1i6NX+jJ21BI9LIKN51dDgjPNGfRfZWrsb5aAKSaYeKyz
         verDgCpkcCFy1d7aapISf2h8s+7bZdjRrt4dzac8jZpdtKnjMtVZFvnOckhqkfeLtgcW
         UG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=;
        fh=mtJyZ48kRE2M9ZWXnW0+YOhaeNVlcf37AwHtio2GGss=;
        b=QH7ol5BMsiAGu/Pug3I4uANZdVOCXFwZMEA2tfAOKjqJiI2IvEryMGgoV+eiV1RtBy
         mkgtv/og+hSqdiZtWqdlQtDmWE8mi2eQqyRqQdTdvD+dfbAsJ0MXE5PE1r40z9GVZn8Q
         MeHrOYZZsdV4J6pRagKOGNj/NBQkwfYgvbpSZfy4ciNm0GQs90UZaKxg4S1SbnhuajA3
         zkW9L2JbwL46YRApQOerQ7OZspF02jN2TwdqcGybU4hPq8deoZtcHDWBC48fTn9znsge
         kUIJ4+iQwoRglAd3IYHPo61dYXUkz7q4moFT0Y1y4mFaSY5XPEzFEcd4IuvRaM7qpeyL
         5vZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791801748; x=1792406548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=;
        b=I+DV9SGdpOVMIIUOAtxIzUXtkSmwUl2OkfFHRYT4d4YiiKIFlJ3+lM9dEYxTV209kQ
         dKvIwIj3E5ocvPrgpcVk8aFGDVaOtxCJBEVGw0Wq5GalRxTAKzaBht1bfcQQOsa4HnHo
         w5/82yMLb3YZDuUcUqPTW+CXv7uOoRYsFVXWj0Hk3vgysDnHW82iAypSybAYKV9+e6Ej
         utO2qqE/Ikh6TCQ6jw94CJEWIb6s1ePs4shh1p/gfh8EcUhO2WkUBopc+GxzqtNn2lKY
         j2W56vlvKEpPYOih1aOj/sW3PgQpGLpVcjTNckd+0b5fm8zBH6lkGjGOXrsxgoFNKzd7
         CMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801748; x=1792406548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=;
        b=RuEcwgIujvZgOUbPQ78bXdb0us3DVM9+xm4ZvPiS2d0M4nvukLae00XZ5YIiobLduh
         k4LFCG8sAQQ1WaxysPGDg2F6S6GnL5aNyLVmv/7b8QWaKSgx8wnz8X85GQ2qHlVqe1Gm
         HwKYO1MNjoBKWMMC1lFpdqyxS70LhLW32Azc9zn6dTV8zBfFCl/lySIINGaQTfB2XRix
         YuEL72kZ4VLVtiswceO90WB6GRGGnel6fkYOmTD5JQ3GHLw7PyMRGeZc3PcDoGC4UzFI
         gHNjrtk23jAWKbxI5bxtfukrJMq+Fr4quk3HJ1NfLGbGH1B5/q8ozZTPR2IU1FTIpXe9
         s0fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdBsPqopEUcYDZN1ByhOy4mpD/eHEgLl0QH/7EeE8muBs0y3RatiSKwsqxAnO07+O9PWNwQMZ+M0+d3G43@vger.kernel.org
X-Gm-Message-State: AFq9FYLgF1vLix2Sa6GdirxJm2OZQ0ln9V5mtp4bD/VY8B8n66ym5GKs
	QjBfkMtgB0SFTIGoB+A+v57QJhZtbmFSVfhJc1DatjJ4EBKtHp4llHTHb8P6buUy/gtEaYUBwT9
	FrIuPE1fqwmtx7aMXk8eXI2+v1jj1LfrFsrCf0ZK2PcmjCZZC9bFlFHxMKOCzKR3rwx4M+lJw10
	fUF9XCSsQCF9omKahL9xJiGXEaRu/VUx/ioIP1nLUaFcM=
X-Gm-Gg: AYBFou32zyNCDAY7+MK1VRFIlveeq7YO9ZPhmbU2G07RAXwHO2i722RZvm65c8Piqgm
	1FeipnCyL2o+LKTdzXSErGUY4yX5R8yhutDOy8l1xWcfLJ7IRCwsK83cyc3Spil8Pp83/WCSsf/
	bA5iH6bFX4iwufN/vcVt68TSisUWvnTEH1XthfWSI3F7plWJhvGC0aUDSU8T4=
X-Received: by 2002:a05:690e:4809:b0:677:c075:a576 with SMTP id 956f58d0204a3-6793604a27amr1951812d50.57.1791801747642;
        Mon, 12 Oct 2026 03:42:27 -0700 (PDT)
X-Received: by 2002:a05:690e:4809:b0:677:c075:a576 with SMTP id
 956f58d0204a3-6793604a27amr1951806d50.57.1791801747134; Mon, 12 Oct 2026
 03:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
 <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com> <CAGptzHPnOx+7iZhtF+ng4ZonucOH9UDWTnOD=KUnRNGMnS0JHQ@mail.gmail.com>
 <asyvBTR4K6ebxI-K@RAMIREZO.na.qualcomm.com>
In-Reply-To: <asyvBTR4K6ebxI-K@RAMIREZO.na.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:12:16 +0530
X-Gm-Features: AclHuK8SYeokotpnm4k42NtJjHxPe1iuk-XJHNtnkG-wqRiaHN3WTmFDP13zk5s
Message-ID: <CAGptzHN3OQfLu=Ry4Xcqy6RtfPpYjVwvfZmDyrZNoK9G=EXyiw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org
Cc: mukesh.ojha@oss.qualcomm.com, konradybcio@kernel.org,
        harshal.dev@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfXwVSj6ylbuN4A
 N2x8IllZPV3A4kzkzkvMR4SH2Ffcr8YRIAdSpGAqnNQO/f0I5x7OWd2kVWGoJ2VPnKEYt/LZFiQ
 Ult1oQieTfgfZW8zmYpP6srQNb0F+AGFGD5aQmPPkXkG2gO791Gx/2rzwNNQhvMDcfT9Hqk/Q/A
 vhTg2INXGkFCVIRJdZGnjEQvTNI4fZLu87k2NeecNklOeOzkRwvwG8A302VHjrI1gd5AubiN35E
 V9cVbQfpxaeQdN1iaQNMfa/rtjRSlw1oB1FuRn7dQZiQNr/T33aKHT3dtVYGS48GkhnbGz0pYVf
 gIyoqT6l9QJ+4MVKBrauq42GTPADxTPAMwUzarRQkzRjqwHuGJnmly0qhEdGlGn5WR+qrYns93E
 SgVphn6C4TCf5bpQAuojUw8LeTa8oRD56TPb633HgsD4b4+oQhuu2m1u4Q0iRrRzgtKmwV0DD+e
 slBEc6ummbJ7Q4qF9Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX5cPPNeNWCdG7
 ik4BM0wKXP+ykl644NPp7FvcxxBmoqOfOdXZY+D9dMuEAV2T2mezo2UHge8/Aq8aufyarzs/j/c
 5nB9YrignADFDfV3npFxbLH5qzoCRlA=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accb994 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=BPBVSY88CwwMiwvihUEA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: dxEIf3oK1VHUEGdtAlpzZtsCCUbl_trM
X-Proofpoint-GUID: dxEIf3oK1VHUEGdtAlpzZtsCCUbl_trM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042

On Mon, Oct 12, 2026 at 3:27=E2=80=AFPM Jorge Ramirez
<jorge.ramirez@oss.qualcomm.com> wrote:
>
> On 12/10/26 14:48:22, Sumit Garg wrote:
> > Hey Jorge,
> >
> > On Mon, Oct 12, 2026 at 1:33=E2=80=AFPM Jorge Ramirez
> > <jorge.ramirez@oss.qualcomm.com> wrote:
> > >
> > > On 06/10/26 08:41:49, Jorge Ramirez-Ortiz wrote:
> > > > Stopping a remote processor clears its cached resource table pointe=
r
> > > > but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() c=
opies
> > > > from NULL when the firmware has no resource table:
> > > >
> > > >   pc : __pi_memcpy_generic+0x110/0x22c
> > > >   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> > > >
> > > > Zero the input size when the table is NULL so the copy is skipped.
> > > >
> > > > Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > ---
> > > >  drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmwar=
e/qcom/qcom_pas_tee.c
> > > > index ac33a00687aa..a52a7df385ff 100644
> > > > --- a/drivers/firmware/qcom/qcom_pas_tee.c
> > > > +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> > > > @@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struc=
t device *dev,
> > > >               },
> > > >               [1] =3D {
> > > >                       .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_IN=
OUT,
> > > > -                     .u.memref.size =3D input_rt_size,
> > > >               }
> > > >       };
> > > >       void *rt_buf =3D NULL;
> > > >       int ret;
> > > >
> > > > +     if (!input_rt)
> > > > +             input_rt_size =3D 0;
> > > > +     param[1].u.memref.size =3D input_rt_size;
> > > > +
> > > >       ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
> > > >       if (ret < 0 || inv_arg.ret !=3D 0) {
> > > >               dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d,=
 err: 0x%x\n",
> > > > --
> > > > 2.54.0
> > > >
> > >
> > > could  we merge this? as mentioned, it  protects against blindly
> > > dereferencin a pointer that might be null. I submitted another patch
> > > that should address the issue in a higher level interface but regardl=
ess
> > > I see nothing wrong with catching it here as well.
> > >
> >
> > I would rather prefer to error out to the caller rather than fixing it
> > here. Doesn't tee_client_invoke_func() already error out or it causes
> > a kernel panic instead?
>
> it panics
>
> the advantage of having it here as well is that other backend(s) are not
> restricted in case they chose to take different actions.
>

Ah I see, feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Bjorn,

Since this is fixing a kernel panic, is there any chance you can get
this fix in for the v7.3 release?

-Sumit
