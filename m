Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698407;
	b=3i0qwGc3grToNFioWUlHgIsd0NbnUKBP4hc4hhkq7vE+6gYt6XZK9bT490XZw5c+fxBj
	 scrESjDzEir+9kmeM7ya4vVyPJPWzYW5b6k7beVG2+JyWT44oZCUbNkV0NHnJ/7OmbUKb
	 faM46DMYbiKP04d98QRHxYo3tIVJQrRO93y0XT5x6B4X2DFX1w/kTn+FZJCLITuz3tuMg
	 qiBAepjfAqK1aK9rZspEE8LfLUz49ZJ7POePutPPddlsbV3j+Z4EVPXLUH4AT0KUBxq+l
	 yxHb7XIrEHbTyNNaP36id80BlTnaGXs4jnnqiVgUnP9LO+yu8LeB5Up0ZD1IyM7E5eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
	b=QP+iet1rCji+kgcp/dqAWqgvK7VsAowXl3IkC97PE2rYnN8nW5jLTzcrVeilWFoM+pAQ
	 8GtaOWqXeUU5SCA/Wm0TmWRXy8wCqzPbHEtvDYVTPBbnQLNPTOjDBqgUpCdHC578Kjtgq
	 R8PBZVqSx5k6eHiuprMD4g7JF40cBtDoDskBPrLKqD7fWtIj6zvOktAQR0OJMkKj+qtjZ
	 mNbr7HeLKuCwZMp8iH1WPVltv/L3tfM+/Hg+0ZU5DEGbXK4EcvTiPnovoqeAl7lwAWWkG
	 uOFlNcmDXItidX46tVlyJDYVfvzzQJc245cPAqGEksW9psv2R2qlXPmBr3wGCsgwU8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7tuCh4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSP8u4IP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA0E606A327
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAA0E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7tuCh4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSP8u4IP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352mo92449132
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=; b=Iv7tuCh44+CGqboC
	S+tDXs7SWnEBRZTY08koWYlhCpcT32OFgJTzKXKgQpTcgKL5Q6Oo94r0v3locmuu
	pjVS0w2RKdDsiLbwtQKbUP3fRhnBhnDXfAEnRyBuqsPTv01ZPIxE0MR3uY4MVaBZ
	v/ygxMKoz+7V+adSNf4NHcYon2Zmc4Qi1WIxZ6n3GAJDcoJx/XyqyHFkaivoRbdq
	xeZFQz2GSmbhfe00ccnyB3km50+XscI/epeNqF3+Da7yW6sxLTX92MTsDDtFLT9p
	b+P1mRNKzXijh//bUfa2Gt36wuZ+0KIl08b8JWMXnC+cVdv8DT9mD/n8CQqgZWy1
	xGdaOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs0y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:33:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so713082185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698405; cv=none;
        d=google.com; s=arc-20260327;
        b=J7n7IKJVA3U+Ve7Nf1FAdYkip+1kzffISFajpAANvmSc9BT8PoGWR63BEZM7ZS5Hzn
         QaC4U2WhEXfd8erhbguUfHxIHqnQfzFRqNYvH3xlmoc24ZoKspmehzwya/jZyx/mmfCy
         obVXw1cju3AaEf7/AwS8DgmmcvyZwCHqxsvkQtGZ65rEYH7owM4BBglmRHodJBu64lXw
         8VXPwreghvxR56aEwvzk+qJzErYjx8hmYO+qS7oYeZQg3H0pCNIwAt1BjKjmpyNFw35g
         Uh4PGeYB0XprWqRhzLptDnQXX5kjv1FSwBtWNqBdFX9NGB7bNUuwUxMAXrXpzOb110uQ
         sNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        fh=Z5P2R8e9DAmVsxDmoux9GDCNkt2pgGRY9Bq7rpbRfdU=;
        b=Gys4VhkAOL0icnpz0gT3EpHUFyKze92OvMx7tvEGc0SNK8okvgG9l22IeSEUay/hTT
         A2m7MGQWiB3HnoKMypgPjq/HuOHRIcRmsHAgPf/IrO87dszEyWFQd+GFwjuNciDfxmh/
         p66W1OmfY2KCQb0nw3dhbp6rnlALyrnOJTBKxXivKLVmCCeAdEbf4R9dNlRQbMsvtyKd
         9bcGYoqK2IdhS9wKi3wPsrACJuYP4rSzwLEmxCYEF8zblkYeVMiwO1nujduGW6kmDcCT
         sLgP60cqmOS26jiufB/9Wfiz3vHcuC8/WTdxjI46/ni1tONm9R2rn+s8t1tm6HcU5CLL
         Wawg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698405; x=1794303205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        b=TSP8u4IPna37B++prxYE/LAi7sHIVeGPxivsaV5QKF9CxFQIfLgotVOpSqhDyrF2Ah
         RVErf346Ge4dTRkfqShk4jPcrnWq0VmS/4VRLK3NmSFEs/Nd+ImY0PAG7ZVkQsgLHjgJ
         lnvXnryncBPcUljhqiY4d0fbbUzpAw5QABKsrPPEc3upwetZueYopfcH09hPDYFo86n7
         beASvvMIb/1Bhl+nrvqx65myMiJeO9eBoLfAdyX8GIlZUfecJcZ/iZmh+4ivxhib2bP/
         E+Lq30AQv/Ev63nJkBfYEZoZLwBL5I2IIpYWZayc5sKuNa7VOYABl8QQXMbcLoGaFtcZ
         qPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698405; x=1794303205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        b=fVzXy43vai/YsfUgFjvSzPYvmUiuuuKG05qOtqFOlASUj+uWIjzdPt/1TiPf6xb6lE
         wPfKEYvt/20KpgbpIIZdIApB2AeajnqBZXxk0GgVz/R0w7JiXUKehzW82UUEmWYgiLIY
         XNOEnxbbIxyXltABYW2eSSZ+TJV9/WXR0AxaObFk3gvxwCyXYYvdCo2an/pmoSHET1So
         LJ1EptaBSdCSfGrV2OqH8vzupwvoGkEPJWuhpxwC8a+7KZ+p4I40nQfIsT6CxYNbpQpo
         IdDYjkvaHtCnSKFOsJ31S0FyjA57Hv2h8dXGHceabpV03Gau7ZxsjYZEeBUjmEpiNUr4
         eNjA==
X-Forwarded-Encrypted: i=1; AKwUvBxQx5PudiCMyXYgH7J95inAsFDgC54LLXSwVYWiAE2JuHX9dTPyZv6AdIOBo2i7sr9HJYMcDffQy06B1MYl@vger.kernel.org
X-Gm-Message-State: APuU4Z/Up/7SQpQNeRBGV07UWTI1andBaq3BjyeUWvOCoCl0ufnbkeqm
	8RBTYglMb8JcTeTfJNyT7r+QLGulIEXpwMdg5OlUfcsyGyPAG14d6zZP3LbXVwC+IJu0x2G8jsX
	cgOPiHVMD/b1ESpxkKSvrnh9apKsIBfhRO+q9zOVtvQ+snH48OQz3T6Igi4Uj3VKfsyYjgH+Kic
	CNDqEFpXwFOu3ZFTGDoE/szeoe7pIySqzkt3WC/9SS60U=
X-Gm-Gg: AYBFou2ldsL57mSvjXuDtt2ol8iuXcC/osTTqrBweje7TChpzkEAyK1fXgq6Tn9rf8c
	tY29Rq3UygLIxAQ+Ji9HuVcYsCDmGS8+dFS5Fbz54R7Rl8jz+XTDCnCfpcPpQ732HYG/QP8Mgqt
	szvV9cXPKqtfq2pNIsd/ZWQgyrkz/emkViF8tsh40/se9cin+4/HdRkb4I4KSNHpzueupSa1J8t
	XO8s6S1amjSWt4OHmtas35+1p/EIdYIRf3mtZm6mU2R7nErmt6ZRW3L+ewpKMVUgRHJ3u8HgiQ=
X-Received: by 2002:a05:620a:801c:b0:93c:5958:9de9 with SMTP id af79cd13be357-94421737389mr1925345985a.33.1793698404953;
        Tue, 03 Nov 2026 01:33:24 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93c:5958:9de9 with SMTP id
 af79cd13be357-94421737389mr1925342985a.33.1793698404383; Tue, 03 Nov 2026
 01:33:24 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org> <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
In-Reply-To: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:33:12 +0100
X-Gm-Features: AclHuK_hAJNMdcggM-t3OB-XwNys5QjccTnPIaxMgSrXRRvM5JChrPyvvoLuA3I
Message-ID: <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9aa65 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K9HSDwGVA6T88df_oCgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tFQ4cjFf1czoOCZIZuhd7MXv5f_w7jNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX5SiDpyH0C+nA
 hDJ1IuhzLDu0XmThBRlXfybfQSz7zYo8D1/XvzpW09SPqdYR7sHA6/4iTj0VSA/i1/ePXwUBAku
 6rt0XAulaRjSGBhfZXhccpjNGmkEUXyszoPtYKoOmuXAvx3j+rJStd1TWCbvwcnUydfJoekgC+P
 9zVe6XQk6v0qgNyuGuNWAcdPDV5Vk+n984DOSe7nsT4dh1hX3oaC33BLf9vgGqmA/fg+ktJfDpN
 VNnuhe1ObawJcXh4Rb8lC1VwT+eZQZmkb5F0kJvEZxw7iHtpguYdzgPT0DH1w5wIh/7CU6pfNEZ
 CL/YKB9nyVKKZex3VVl5sV60JN2qErZPiAy/FQoAJqESDr/Dz4pAB3S4T2JPCb960EOssdSk+TI
 Yg/ymwBTJgS5Ii3s567EdNQWwycpy2s1pPGG9U5HbfgZjwryzrGkaaGB6p9sYSC20SoBIygNDLv
 qd8gfTNBvl4HozHFCNQ==
X-Proofpoint-GUID: tFQ4cjFf1czoOCZIZuhd7MXv5f_w7jNB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX8E6qdKCoUvG5
 RjV7u5EWWeutTkr/venWhWYuUGuDuT/zhAPzGANNn4ZsyuMlTJE/rFYOq2g0kpXjd0gjb4TpD8C
 wePIqtKhx/WXz3exgsPzLwuW3tglv8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030037

On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Bryan,
>
> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > In order to communicate to user-space CSI2 SOF events we will need to h=
ook
> > into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> > implementations of FRAME_SYNC have CSI decoders which support the event
> > always generate it in our case if and only if an atomic user count
> > indicates it should be so.
> >
> > A flag in the CSID descriptor indicates if frame_sync_en is supported s=
o
> > for each SoC that supports it this flag should be true. Since bool is f=
alse
> > by default no negative enumeration of existing or in-flight CSID is
> > required.
> >
> > Subsequent patches will enable on a per-CSID basis.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++=
+++++++-
> >  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/m=
edia/platform/qcom/camss/camss-csid.c
> > index a00791b00feb7..e9b399fcb9c7a 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, i=
nt on)
> >  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > +     unsigned int i;
> >       int ret;
> >
> >       if (enable) {
> > @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, =
int enable)
> >       }
> >
> >       if (csid->phy.need_vc_update) {
> > +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> > +                     atomic_set(&csid->sof_seq[i], -1);
> > +
> >               csid->res->hw_ops->configure_stream(csid, enable);
> >               csid->phy.need_vc_update =3D false;
> >       }
> > @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *=
entity,
> >       return 0;
> >  }
> >
> > +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsi=
gned int elems)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> > +
> > +     atomic_inc(&csid->frame_sync_users[sev->id]);
> > +
> > +     return 0;
> > +}
> > +
> > +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> > +
> > +     atomic_dec(&csid->frame_sync_users[sev->id]);
> > +}
> > +
> > +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D =
{
> > +     .add =3D csid_frame_sync_add,
> > +     .del =3D csid_frame_sync_del,
> > +};
> > +
> > +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh=
 *fh,
> > +                             struct v4l2_event_subscription *sub)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > +
> > +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> > +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> > +
> > +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sy=
nc_en)
> > +             return -EINVAL;
> > +
> > +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> > +}
> > +
> > +void csid_sof_event(struct csid_device *csid, unsigned int id)
> > +{
> > +     struct v4l2_event event =3D {
> > +             .type =3D V4L2_EVENT_FRAME_SYNC,
> > +             .id =3D id,
> > +             .u.frame_sync.frame_sequence =3D
> > +                     atomic_inc_return(&csid->sof_seq[id]),
> > +     };
>
> On first look this was looking strange because the id is used for the
> control id events not for frame sync. But on second thought it may make
> sense, but the question is how the userspace should interpret those ids?
> As of today userspace does not have any info for the VC and csid internal
> pipelines (so called lines). So with the current state of the code
> the id is VC which makes sense becouse the SOF/EOF packets are recieved
> based on VC. So i am thinking of two options:
>
> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>    and will be well known to userspace for which line is reported.
>
> 2. Add and propose extension of videodev2 documentation that
>    id of frame_sync event types represents SOF per virtual channel.
>
> Personally i votoe for (1) because it will well fit with stream-api
> support and usespace will have clear understanding of the SOF to which
> stream belongs.
>
> Given this in mind it will be good to open discussion with Laurent, Sakar=
i
> regarding SOF event with stream api and GMSL cameras.

I think both approaches can be applied independently, forwarding the
event through the VFE as event proxy would likely be a straightforward
addition.

Note that the id here represents the interface index. While it
currently happens to be associated with a VC, that is not necessarily
what we want. Ultimately, multiple interfaces can be configured for
the same VC.

Regards,
Loic
