Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792673280;
	b=Lz7WQVtCHVlJUvEsA4wf9kWBbn+BzGDH5/Kthh/p8stueMKSE96mimi2BtbyUEnO9rXo
	 l3IIptou33H6JV+Bj2EVin/tEJ4wnwkEx7tA2Zt0WmmKHfj8XnrjgAiMjGfqDVxBmDuzo
	 9RibeIeuUP4TRjpznpkFTJHHqQgr/8jGQsfJ9P0Lcx1B+/CVAHW41LyVojxTH7f8wY6td
	 vejJ4uJayNGZlm4kQKBbXLACJXdaPlT0uNgpeR70r8NUUOIqenQN+UYxOGbDVmfWc+uQl
	 A9q2OLXh23hc+8GQLE/rPXAllsAp7rKiY8f70U+iiZX84+9ipq2+BPubrPPVO6swkjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
	b=Aom8nb2tu8dmJvasu7pM75cRMIXzuhe5hipQkJ2MfbJZcHq288WI3v4VTUqLCzR22/7d
	 dAS6E5KuDYVhJHUR/1v2SciMZLSaelAX7B/fuxBqwJwlgXD/Pja6rsHOnH7HuVGeAOJ4I
	 M1TNCa77fnqc55GJHjeqcIe+hzTliBBD4j+GwGXMmXB45fpzealKdmtnpj4MlbjJiGJLg
	 xyR6k/Z+ushvM4gFEmP8JUl8DL9FMeVO2TuO0JyXLDT6nsNVxvZ/Q20fKs8h4cy6yiVki
	 adNMkcluHBlyfrU9DUVoZBy9Vol4rAlzF5fpy+ZnWdf62sPzt6W1TlxUd6dcgbk18Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DHejP2Uq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkVHx4NL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE88606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE88606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DHejP2Uq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkVHx4NL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBuJD93734960
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=; b=DH
	ejP2UqKqnZRcjb3dBlJySyQ62Va4PpCZ3lH+mvy9or1T8HObGB0TJfC4G6h3wxzl
	xVPSoBw/Xy17TcuaBdjwd43QXaRkck90qrK/VEzlfDFbeQo26ggJ3Bb1pMJcsV8f
	ZV6OBhasP0QcQbGExDwvasAZhmjnoyPkglpToyrmCfqMsKctky6OjEd0eQuOvnku
	v5QHtohgNUYOe04uNysp2Kw7e5wobZ12qXZRHmMCBljN5QMqZvZDVxmT+kMvTrBK
	n2LyUDlHAOp9ki2QV9GzSNhNd1MUNOKw8KL/rq6iTjyrJebf+gxSI4ptdYQMu+Et
	TquK3SHU9+1tnQaGCvpQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93audhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:47:58 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6e0509533c8so862773eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 05:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792673278; cv=none;
        d=google.com; s=arc-20260327;
        b=UwY8L5Uc935FaC7q97ogsCIAdlUg9lcENKlsnfI4Drx8sYEsNz7fSZhNRCZvN0Jwu1
         p8MQxhvBuPLOmpGIVPPY3DuCl8AgLmd+hbogL1ruZBpa6u3UijGrgqYS/jOGcT0j75vY
         Ye84njPQ4EWtSq0F1DMsPhz/8vtwKDCAMB6RqSeJ4ctiPLm+TjIyGQ5M4vl1Ex4etpu6
         UXXB7JO80eCLnvZSZ8XZlCnyOn8d9FMkut3/lLOb2uoYAwIcO2/uwTLqIuLJ4E/0kPqz
         jIJEWz0Jr1BCzzux9Jbf1oX+ro5zaVIcdTJcsyKfgICZybTUTNvgyhXDd2TLau7xRK6P
         KkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
        fh=NRikUv0WPXHhnC+RpKGa3FB55X86McZPQ49J9V9lREA=;
        b=AlaH5KQI2299/VSc/6QleBfoNmb4BIb/oEqf/xDooGYviHLrQHNnUehvBi60a2NrUz
         /bjPS1c0okDm9mNmKEzRqwhQXsqJI4h/zVzTRDbVQVSKzl07Jp4VA9pTUcLmoMYmqZ1I
         igD2wYhocu4lgtcIOuS3sl2vvzPPuVOD950m5QEBBXqnQQswsu1RuZcsquihN2NxWHX0
         H6eLVUuspM+2r75LcQ4Fg0Xuz1UWAJBZR3oj8QOv7k5OOdd48wjzNtUNaZE+uRps0Zx/
         y00C0bZbVtIM5h1uePjmjgu1pn8V5B244IeS2deCmRB9darZRseXRITqcinNrqeAJ2NM
         TAww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792673278; x=1793278078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
        b=YkVHx4NL+lY3LpTRnPvq710SV0Cl7bJFukKDud6A9PA+Axp+P862ozU3U7GrWzyDha
         097QBk1fDGLlGTH6qJ7sdib+X3OoEmq1IIL0mnX25WmXVOeYJZSnDbADIB6jH/vieu58
         lRIL9uYxceEMX8K6JT3mF3rpQkWLc1iUk99R5OFsrW8RQkA/V5aH6WvFnT9RZ/27GZgb
         1ravdv++8dk234r7knuSAdGJO8iOldeQxjuNacHilP+blwMw/9Tb2za2ELWbh/HT+sYQ
         ESc9nyJdJnxe4QPBhU2yEWVJ6bWtjasclv3w03P+hLoyZ7lt/vJcnsGT2n7P4q/YP8nk
         +GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673278; x=1793278078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06kemhZBYWxkv5vRs3riZ3fnXQfC1fnOjES4AGUZ0io=;
        b=WfMRKp4+VRy/GZb8AN2Mh25uSH2CUGy7gcoTShOmFci+6/hA7GpP/sVN71mG4sKaJz
         YY9AIzeae0jfGEWE5jYXr4TtE5w5qmweXKz0QNbf4br/TiguA+IPDKQV4vLClN1EIGKT
         YnN59HCHofqs7aXDCD7fX4cRdrewA1B5luBcAq4qqgJaSqgKVtrIyNvzkbE8dM81qneY
         Ga7Ydf/zY/NO5o/c4HHMgkK1bXXjVNpAsgaqE85gJyFi2Y3siRlmDeuMW2HMyBKZWz4v
         7zQf+VyXkNqLQjtSNiZ3XNVgM6ISLoM0Vn32dYgioVb2OvV6nu8L2bKdrt27NkB6DVZD
         Oh6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2O1IOylp/AJHxiK0vvd2H9YFa5fpjPfjd+VLTGQ/aDcVgQag8e4OYFmaKrVC0DV6QHqGoJnnIVzlK3BR6@vger.kernel.org
X-Gm-Message-State: AFq9FYJqPEsOFlfv4uHq+e5hRFn/guh1y8ITtotU1qtJGihLb26BNwMN
	0moFImXSPo9VXOFlUi6DaL+M6+vpB0Fp2GFFgozeBstwB/J2wvIVoyb/inoke/2Q0jmTxFEm9Wh
	WW5zFrU4ivlkiA3SHTyLV/97Ix/4d8ZPao85Ax+/SevoWoQBAi5VWnwM6kJzLF7hkB0gdNP9H9z
	Ef/RqTkRMPFnSQxZV84seKDOw6Xj5i8UAcnOe57mMUPY8=
X-Gm-Gg: AYBFou26xM0S9Q0Mb+tnTJf10qzrzAXbMhE7ZCAI7otQEUQb+e9ltggHib1GsQQtTwb
	2CTKFl9bQ1054Kkn9OWyoCtc2/D5BaFx9LTVBR/KXx84CZFTcmnw0IWyH31/uKb70xMsjsiKq7r
	DWURlqI2asQKAKGCv3DaO0p4OpktbCtfyg2T352r8RxK6IGTS3YkuHQ/Eo6w==
X-Received: by 2002:a05:6820:8ca:b0:6d3:abd1:9b90 with SMTP id 006d021491bc7-70a817ffd79mr1195058eaf.54.1792673277870;
        Thu, 22 Oct 2026 05:47:57 -0700 (PDT)
X-Received: by 2002:a05:6820:8ca:b0:6d3:abd1:9b90 with SMTP id
 006d021491bc7-70a817ffd79mr1195042eaf.54.1792673277444; Thu, 22 Oct 2026
 05:47:57 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-6-robin.clark@oss.qualcomm.com> <aa6dda5b-419f-425f-a9b5-198a9bf7eac2@oss.qualcomm.com>
In-Reply-To: <aa6dda5b-419f-425f-a9b5-198a9bf7eac2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 05:47:45 -0700
X-Gm-Features: AclHuK_bU7poutswK7uYA510NNIdE34sTKZBdGNumfyeiwA09wzxHoW41SK7b2o
Message-ID: <CACSVV02OCkPrTBuGN1n+nCkVOZP4WGacDSNy1GUp9okZqPNkuw@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/a8xx: Add missing a850 ifpc reglist entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MCBTYWx0ZWRfX1bM3QKbeAd5u
 DWPNHRxT4rHxwj/pRxqmVY3RffqJS4h3MF5gMKBEH8Kg11qrd2K3WyPYgoa4GbMM9u+HJ+LnJuT
 w1SuslcCXAoRysoTue4ecY5FXVzqNqpzMwCswsNJ3+YRdrRPJ0HjwHYcXLvP83WlSi6ab1nDJa3
 5xKnjTp+/bzY21aUDG2rYytSJKC+WBaQ483EqE1jdlOSZ4xAhJHhgnmliiFJXEC90UStcnnr+NB
 Yab47Hm7wAXeyRNpil9SNEDJJhetVInpN76wQv+blTxNmM1Nss5EGBWQambus57YoYarBTW0HjN
 tEPIU1IMmib3eU3vXRw8jbW3Ep6r12eocwXpd7LFfNlYmNbftAM5Uf35OXcyOVjrdEzb3kMpGMF
 ccw0+yqDExTtM3ofnlzx5N8P9P7Dgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MCBTYWx0ZWRfX/7VYncNUR+1R
 b3Lwx9z0KglVeChb1/PXbCMfIC8mSPyns/R8Nv3rilttYay8kb9TMxEIPXlwawhQjuVfOwzB2t/
 u/fXmunipexMp605DxeAoB0DZ48DyoQ=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada05fe cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=arxZg2z8A5urglJSSYUA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: wR9A4NqehFfA0CZkqbikTiyAjnzJ81Tm
X-Proofpoint-ORIG-GUID: wR9A4NqehFfA0CZkqbikTiyAjnzJ81Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220050

On Thu, Oct 22, 2026 at 12:19=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/21/26 10:41 PM, Rob Clark wrote:
> > We want to save/restore all of the CP_PROTECT regs across IFPC.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
>
> >  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a8xx_catalog.c
> > index 55a805ab438c..45cd986ad4b5 100644
> > --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > @@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] =3D {
> >       REG_A8XX_CP_PROTECT_GLOBAL(53),
> >       REG_A8XX_CP_PROTECT_GLOBAL(54),
> >       REG_A8XX_CP_PROTECT_GLOBAL(55),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(62),
> >       REG_A8XX_CP_PROTECT_GLOBAL(63),
>
> Sounds like we should autogen this part of the list?

yes.. but not yet :-)

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
