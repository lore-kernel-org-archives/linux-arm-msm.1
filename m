Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639814;
	b=hvkDZCnD9qCQNHjFNBH4+p7N+EJQmR265TZq8rSLkON8qlmNn8/Qm//obdHtkeDoY9DK
	 +E9NNRGlRMhJwtn9fYHRYcmCM6s6IL+j4EfPijAur8a5mvwTLbQ7y9z3zn10L640G6SG1
	 UXfIyGTZJ1ex7hKA0WnmRpJ39+XN7kdli9c+FDCjHj2hKTcrL6alF35nyX9zjGv2XQ7AW
	 dWF6gY5/65jCaJTmLpeHH5m6Rvedq1utj739d9PmRzYcQAXBDj9DD2ehzXBxIsptiQMy6
	 kFipkso2yDrDV2mknSOQRMSXydYXkr8FL44lc5GgAsz4/WUGXeajHw2s2fTGZVKYPLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
	b=fq9zIIZLyuvg3xJmU3DRk3Nz881J8EWoXN5SSOK54/0I+iZ+5tfZBJpneLpCasAmkFm3
	 31+9bIjYWlN/rIBdgNHhy8CW7UmlUy67hxYoi4v/bsGxLVvtq/Ro58tAIiiBujJfnG7Pq
	 8erzp7WgwLAXuAT+T2aVRmdK0GxGeb9XhUCgR+WVULziuP3Uyt/rExweV8jQCPtVC0mkS
	 HkTMd2CLBOdQOmnT0MyKs/GPzOzRJDWJqCFMjtFOViXoQESc4F8BAIXM2kDSIX0G/0HFA
	 2Yd1RbrUkKT5CkmjMbRZpHIgITQ38W9pd7ujqf+PX6I8Tr70DFWvuiw0cdn3apoIL4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3KjOgZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erL4VWoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1511606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1511606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3KjOgZB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erL4VWoR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAmV62028115
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=; b=L3KjOgZB78vnDg2A
	baIrgnhBdVc0qeP90ncluFInuDz8yg8x5HxOFjcy4cnYt19ME9F/hJBw1GVgc+bw
	QdLB3Wf7V/bu1keMiQR7Xr+QM/jdxtZAveg7U1u2HmnSBpDnUejSA2IT8b6546XH
	bXX8eIZsDOlG5scZXWl2ZKNdzpmkUT7MSxPE+QeUNNoJHOjxrcwVJCtYEacXm0LO
	EJHj9X/n2o4d1dF1Q4+wS+j21CJTdh8qY94FPPDqh5biOS04x/k2s8sil7L2yivI
	t9MxXiTK0LrNRwpmC9w4m/bAAg/UVo0Mpvi8yO1d0i9QtU1lgEzBKwfrx77vQLgw
	K707nQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vas2c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:50:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso272464585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795639812; cv=none;
        d=google.com; s=arc-20260327;
        b=eUopApzPIHF1d7gjz6kpcD/+T54+fsMdriZ7SohO2mC8aJXlAlGiGk+bf+Xi12HFf2
         uTpUF9RWVpYy5d0tbIxo1M7Ij4Kk6JlJS1uqWpxbmfYmpMACMTF1KS6u4A942w63wDHK
         PLx6WKPLeeBmTqc6romhxn9dY0Rd9QMmNKhqG/rIewAYL0lSTg7Odgc0kBEGV+7Tgax9
         UQjd6QvbVU9HAA6KqzHHJ+AohF0K7Ro+5vG95kxIEaULN4DDEd9GkALsYPxMCP87mncN
         ug3D6a7Utx5O8+gLMis313CbKNo4sCYczLC2XD/h3h2iJdc/S/xWXySD15QvTNLXysMZ
         Z5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        fh=k+rO5jKCCiBZbmJt7WRLTamMTxJSc5EBwgVyayRARKU=;
        b=iK3mpB6R78eOK3Gje0261eJhJS31HTi7mm3wOuGMZqF/hLcekYI5VCUJkeHey5lHg5
         EYwe2IOOEn/LTjhD9koRg+lNOkyVqYMXk0RWijIbTMpGf2cl6wSj0CzXtMMMI4J3qXQr
         B3mwdYiNdJCjdFL0tUne2aBlsBHRwUkp3fOdt/Wn75LUsKs+sGl9F7epzgThox9BuF/U
         2p1yHMfyUB3kJTttHYj/qdHjeIY9zOfYPX6XBQ4Nt1pe0feUDT6XHGTLeRg836Unqr5x
         IzuiHexoB18SV/+GhrRfmeQgoJQ+tpFpdIlzA9MPTgzyp/ONhMGcPwZaWzmdoxkddSJ6
         wVXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795639812; x=1796244612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        b=erL4VWoR333+SGGowJLUl03vdR7j9gv/4yGrXRxCwgZM9QH6g6kufYcT1PqI/Yr6hQ
         4TZOxteKGvx4tOFDYhMRYFiPYF7Q2hEDP0MrUMjpzH4Z2L1T5szSY/vA+krpUCgFZJ0f
         DnQXepyhlEhaoyYEuzdDextySiXm+M6x/NSss4Sy/Z35RA0eFTtGvfCgxC2zatwlVs5g
         86zjTfy0nnKSPfaSKk7XT+d0/BPaKTsIa6BnuGQtOzRbp9TmNiWnQjXkeJTB4oapLn+B
         wRsHxoAEK/617mesLWiYpnz/Np08lj+pNRCswN+I82tfHd1ETOcKbLtqF+OyUZemESxL
         JTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639812; x=1796244612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        b=LXf8y0iE/+qRWIaAFZHhQ9jkwaaDEBQBca+z4/G8JqRYVF1aiQZCm722MTtExHbEYk
         B7AWF7wAyg+ObZnJ567c79BNdnDk66oZTCpeAQdXv23kFB6P72xS+XbVanv3Ex6KWlEn
         Qnl/UixMf3edfAGTSKKDvPE2l8liabFAZB3UKrNCScta3WaNItpLJz7lwUgWRFbXjPnL
         qchCzEVYvZxr3/QxjLRNxElVyDWTHqyZ107JTNCmy4M8jO3CXqQhIMQzZOY1pfY8UoRj
         /Pf6MIH6wwq7bK1c14AOGrB7afGG5jR5Fqzyi5GYe8v1AuyK1kYe0ICPpS6nkSiOpWTj
         Rx5Q==
X-Forwarded-Encrypted: i=1; AL+hErE69e2rvMaI76v+ka1yJaDtzIk/aV1l9uQp2p7NYlwjeNQG6m1KjWY/H1yEYJhAj6h5M0EK+8qsagcG0olk@vger.kernel.org
X-Gm-Message-State: APuU4Z8/pUErsIEzODglBZRQshgM06IVCKfBtiltGpboWLW3sAsq6rFP
	/bQ9yMkkGhQmuwT/XjdZOT2uBKyOQl50FodYZEk02zNw/wUymQ/JcMxpUiKU1ciriO+kZShu3he
	noGJxNMSGvTlSPiOmV9mkjp0E0T0dFg66+mRs/65cQDArVD/dmB0cT87GAqq7yyONz8UbPsPyhQ
	p57Cc4VJcLQNR3iCx2tpvWgW+wueOvKcd/dCyHptLmS93JP4a6DOo54NLB
X-Gm-Gg: AZFdTZcOte0x9EtY758XqsAj4vQ0VEQMYB+8xaaQMuinXWXAToEmPJdw2JPteWXGXxR
	2XRIyG+Goz/q/O6XR3psc7bPlIEchwiRAWEbY7ZGAsv2FRRY8qxbCWyc50jB9RBWCTyW4s4hdzT
	Mr2xsDoCMvKwgXDVJ55kmaXvZtsX2CTy2isE8bj9LTirN4p3z8DQ8X+FFOkoJEX+wt7uMvLBvI0
	TGhPoYN0K9o9rXL55Gvokq0hwgxihE5IXFDSF8WNRpT76VHPFUHhCOwqtSvR0G+/HUI3VQR/73N
	y3djZFVgL7QdoHczsUWGaqQnjW+W
X-Received: by 2002:a05:620a:19a2:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-949bab4704emr3161346385a.54.1795639811751;
        Wed, 25 Nov 2026 12:50:11 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:93f:5f83:2ca3 with SMTP id
 af79cd13be357-949bab4704emr3161340885a.54.1795639811253; Wed, 25 Nov 2026
 12:50:11 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com> <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
 <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org> <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
In-Reply-To: <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54r5e4YtrpiKqlTGITgZpLV-C59D4ietV_KMYBl2cdChQY5r1W2JV88JQmM
Message-ID: <CAFEp6-17q7nH_WYrNAg6bUMjmg0OZuxMt2E-i6aMA8huNpnHHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA4MiBTYWx0ZWRfXz+Bu61uRNMs7
 +EUIA8KtPNy6A6qmxDLnjucPNYSSXH74lOKrlNEsqfNpq7OegC9Rnk/J05k7GjarmM/cLoAGHNL
 3lBY4xNLCCrcbo/m//esDU2ph7iKn9I=
X-Proofpoint-ORIG-GUID: tXSEcjtWmFUiyZ3lZYkTjpDSR7nvMJJj
X-Proofpoint-GUID: tXSEcjtWmFUiyZ3lZYkTjpDSR7nvMJJj
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b074a04 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=4mQD8COH9B449bK-myMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA4MiBTYWx0ZWRfX8HjgOXTPDlZq
 j0s0ThnY9e3r2PzKXhZo+mVioRsDIP6ezLQMzniOANCIVyJWSJq4gSWXIadTOG+V1Ym3SBwWfwU
 lWu9+UcFr1VnUE48odbjVBgRu+c663y1qq+3syPPcttgYebckpKSJ4WdA2nAQx0LJbYmgVgzXOT
 OsH7hltqhoBp2paZk/5uqDQFCvWcMUVwpcRb+ttfLEbMDCxyYFW117DPubNVkgVkvNDZno+D4xl
 FXwc4vrVgOyyG8wCMgEvCjQrKAmwzJe8xSFPs5Hp0FEmKqu43E7bYMCP2i7dtOtheOS4Mxbaa8r
 WbDM3mDw6cH6YRkyXm1feHRB8QWU7wlBEu01o5CHzWCYZjhrzGir3u0PjPdxhkG8tYHudKhAHYL
 NKIqnV9t1kpQLry/uILq4ZWvkFc2QPKXmWrVACGkNlymOnpH4gsayfuZr5UU7ECEnYXgYQDl4Ll
 iR0z5atbYevGmDikNIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250082

On Wed, Nov 25, 2026 at 8:53=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic, Vlad,
>
> On 11/25/2026 9:39 PM, Vladimir Zapolskiy wrote:
> > On 11/25/26 15:21, Loic Poulain wrote:
> >> Hi Gjorgji,
> >>
> >> On Wed, Nov 25, 2026 at 1:29=E2=80=AFPM Gjorgji Rosikopulos (Consultan=
t)
> >> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>>
> >>> Hello,
> >>>
> >>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >>>> The timestamp reported to userspace for a V4L2 event is taken when t=
he
> >>>> event is queued, which for an event signalling a hardware occurrence=
 is
> >>>> only as good as the latency between the two. A CSI decoder able to l=
atch
> >>>> the start-of-frame against the system counter knows that time to wit=
hin a
> >>>> few microseconds, whereas the interrupt handler that gets to queue t=
he
> >>>> event can be hundreds of microseconds late and is not consistent abo=
ut
> >>>> it.
> >>>>
> >>>> Take the timestamp from the event when the driver filled it in, fall=
ing
> >>>> back to the current time when the field is cleared. Drivers have had=
 no
> >>>> reason to set it so far, and every in-tree caller either uses a
> >>>> designated initialiser or memsets the event, so the field reads as z=
ero
> >>>> everywhere today.
> >>>>
> >>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>> ---
> >>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >>>>   include/media/v4l2-event.h           |  9 ++++++++-
> >>>>   2 files changed, 26 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4=
l2-core/v4l2-event.c
> >>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb07=
2d691ffd7853d9af714a 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-event.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
> >>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_f=
h *fh,
> >>>>        wake_up_all(&fh->wait);
> >>>>   }
> >>>>
> >>>> +/*
> >>>> + * Hardware able to timestamp the event itself reports that time in=
 the event,
> >>>> + * which is more accurate than the moment the driver gets to queue =
it. Fall
> >>>> + * back to the current time for the drivers that leave the field cl=
eared.
> >>>> + */
> >>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> >>>> +{
> >>>> +     struct timespec64 ts =3D {
> >>>> +             .tv_sec =3D ev->timestamp.tv_sec,
> >>>> +             .tv_nsec =3D ev->timestamp.tv_nsec,
> >>>> +     };
> >>>> +     u64 ns =3D timespec64_to_ns(&ts);
> >>>> +
> >>>> +     return ns ? ns : ktime_get_ns();
> >>>> +}
> >>>
> >>> I think it makes sense to add an additional field for hardware-based =
timestamps.
> >>> Converting the timestamp to the monotonic time domain introduces prec=
ision loss,
> >>> so it's better to expose both to userspace and let userspace decide w=
hat to do with
> >>> them.
> >>
> >> There is no loss of precision. The timestamp is actually more tightly
> >> aligned with the actual event. So I don't see the point of having two
> >> values, with one being less precise than the other.
>
> One does not exclude the other, since there is a way for this platform
> to convert to monotonic time maybe is not an issue, but i am sure that
> there are platforms which has separate clock just for the camera hw and
> maybe make sense to propagate that to userspace.
> And if there is a hw block which can generate sync signal for other senso=
rs on
> using camera clock domain i think make sense the whole camera to operate =
on
> that domain. But those are just assumptions no real usecase as of today
> for this driver maybe.
>
>
> >
> > The hardware produced timestamp may serve as another unique id associat=
ed
> > with a data buffer, under the circumstances it might be helpful to rece=
ive
> > and rely on this kind of information.
>
> Yes this is another aspect which might be helpful.

Okay, I see what you both mean. However, the goal here is not to
change the meaning or UAPI of this timestamp. It is still referenced
as a monotonic-based timestamp, and we are not changing that.

The only change is to allow drivers that can provide a more precise
monotonic event reference to do so. Adding hardware-specific reference
timestamps is out of scope here.

Regards,
Loic
