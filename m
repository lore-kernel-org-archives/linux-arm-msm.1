Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B4483823
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401480; cv=pass; b=XCmnenNN+ZNMF9qvP+Ywmrvtceuh5kWAruRohLIMGJdedwuebnVVpg9h540zljHXbb9Qih1Cw3yRh6h2G6p8gvAaRGITaCZz9KIJLyQH8ckhPQaE3JPnXubeSlB3YF/IWN6PMOZ2DvNA5prAhu7xdYOBizjKcbx5zOHGEYYo+UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401480; c=relaxed/simple;
	bh=9Ta1M8XJETIIM0prQ4GdP+3MHzBhGBuNdaGROU6B6gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX6z96UqWv59MAi7ARjAtpdxub6xFVDxSDAthLdcgK923dmHkamyGIaITQRZPmBFR3X5zmJqlOh3F/dwzG6rH7MONlpA/m8s5pGRMorldcbN1PKWcKbxv0MwNSjGvUFxHVETurn02rv82Ne/3EFvcRgxgmY9OzlPjdvE4SePtYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRxHVYez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkqNsvZo; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRxHVYez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkqNsvZo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0PeX1761273
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=; b=TRxHVYezCwqq4q9Y
	kN/buNB1dNTxgIEKMCqLjzqKrWxwtgDKQB3Tnem/QBBWs/BFqMXfDsRARBJcPo/J
	/sGEIkskxBFRxqY/rIfx6nUIgkXd9RWzSmUo208JD1HMly2JxsFUQfvvA4Uu0Qfc
	TBCG2ozceKL3gE98q8vPlDQBeThe3s4u5U6stgE1TJV+Fxnut16Bue/NS1hAT3Lg
	mcfppt+wy8P41BWph0loM75bl45JoEgbF/DPUBpROD+RdNrC4+g3NuH8Ye4r6X3g
	Xan6vcbVCZT7lQxnL+oRYM0DwgixpKtviJ3BQj0JCm5CrjMlWu76/kLQPu/HmVpN
	Wl239A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex9gfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:57:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso591752285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401477; cv=none;
        d=google.com; s=arc-20260327;
        b=dQPLeni73z4gpJvvH6hwgipkhlfZ+e/JHZBWS5PuqNUTj4YavMBTxmr4IRhqUck5B+
         uXOPJ1IHeQZePKJCXKg5qRBdOo9TQlt1CIdm3mFJRWng/+hN+6n7JI9DWYs4jJVb7efL
         GUzkRJHTGcA/dxLdWLXd4vOJebB7R28DmffyPBN4Qt55EXeYg0E9zrOjOSkyf+0I57jv
         Mtada9y7dMBOdxuO3CaIRMxH4wbXOoaUvUaW4d5UAXYumuz5yOB2Mou854YPMtQeOcWj
         5jiPAHUl2gEKoUWd6arbNvCLzXlhk3zbZiCwjIN0VLrq9772zxPalMTMJZO+15Gpj3cO
         wBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=;
        fh=yjzYhNKGoTOFnTk1DXreRPGrSBUJCsEhlKQhglFCiMA=;
        b=cB5W3V++Q/HvrEhVudWd6ktuQ2nloF1LrmjavA34kXm3tO03zwwIjkQIbaFaxexPzB
         i3uKkp1EsDnf2wWVD2Rg7sLSLpW+zxGW9Vp/ekg2/uoAJANSJO2e/K/1d3plS/4AAZAy
         DYrzfhhE3q7tZ1aZNjObUDCi8+DDFqx2Y7POqOplygWy02qt/7ouyEhp5Y3V7r7Bmsff
         98kJZNn6o8GW2g2Nqxb52JaYkcSbOlxJ5KGufAfDoWfDGl55KnQR23Q+IMVRfv8RH5iw
         25d1abB4JiPOia7vG6BocvBZCACQS25GG0uFRnk/JdFJHZvIOP6zy/CkUdU41RpqcKeV
         a9hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401477; x=1790006277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=;
        b=YkqNsvZosI8JGf1LVQPH6OoC9Jnn7+wJUJ81EV+mV4NYfwC809F+7gAQ+102BknV7y
         970XVif/B8pFlyecVqzn+wA2lEc10JtP+3B3gtNkgqZd5nWDadDO99FVN4AVQD4Ujsvj
         dTXfPjDuSl6aw/nugZuPZW6YoW3A80lnryTr11nnniL3iGHOw0T1UwkyvscYtCf6wnOe
         ulkDpHBdq4lDRDcS2Y5TVTq7/g7H7H49OgLYWoWpehY5VQM/T3TZs0OWOJt0Bhpg9ptP
         92uBe/JxGJ0bFwlJDooft+1HRHaAlR4TddyYAdCQhf8ehG5LIjwd72mLKqWO8YEelmhs
         /n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401477; x=1790006277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=;
        b=hTpeS3RjKoMG3cIsW/op1L8HtqihSV48hMozPaXGAijKkRfrAS6TMMoTZKE8T5ZTAy
         9xQQdoeaOpX4jxm1oTeYydFvTk3N30kRWbd4O9TYRtSDqZGHvxYMuHIwVq6yQlFk683V
         4ZeNhxQnCb7RH2eLlHGhiMwtPhnCWimt7oRliSHRXwmGGIQHvwYyRzmjzeZhxAy/kWIL
         i0q41NmTCK64+09MnxxP9vad9Z0YshS99Zz7Fk7kess7D8X+kidTZkp1NY17ZkiwN5Ia
         BGVxfQgfwECJn8Pxh6BnQXY8qUyqz0UEqFeMq+G5K33bgjgSt1R77YgPTybo/nmH/+0i
         PBoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4zgs82idrKf8viapuvWo3rzDnfhiTdQ0yzA1N9MSpLYP8i3MdSSxb53hVf65Qq6/HD0MasnneZo/+A2/h@vger.kernel.org
X-Gm-Message-State: AFuF++mfnqdspMypzjf4xPQmrr4BJkWhYcWJCJTJ6EV9V1rmBAc+hsrA
	enLtIc6YbgkGTEY6mbq7ILA2bOn35q7CkVEhF2KZqIzq32kO48DtMtgWk3thHJR/ACfgeMA+yhy
	woLc+yLrtMcMuU7YVHBKRZB40guOe6QFP7wGAlxQs9J4uYLnQF7Oo6QWeg9KqVPOqrRQSMQhnKZ
	bwqoiCRBtvcHnCwN4DDvjRAyaYMVLOCv6cxjGJTGU8DuQ=
X-Gm-Gg: AYBFou1p46lwGEAVAGA7hM9YsRWghnqIYk1kmq+pOjV024JCud9sXoXkADrZZroapm/
	OwHDys3zTnk4nQNd+hhNikrNosn8czIwvujoVsATZqAickSKlHwlOc1MlP8xMITkW9P+KOAJ9Gm
	blZs+WI8lfa0dOOiI4i9a9l9PeoWw0DHMS3PHCW0PLyvdI8UrErpsDL4v0cZM77pv+FmVcWaH8D
	a9pm1BlUGWkJP5XIvt4qSbpxVdafeJKi7vIx0ZFqLA63gvcr1kAcNGDPSe463sfIB+Oo6NLP2c=
X-Received: by 2002:a05:620a:470e:b0:939:b43f:341e with SMTP id af79cd13be357-93a2987f902mr442694185a.22.1789401476738;
        Mon, 14 Sep 2026 08:57:56 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:b43f:341e with SMTP id
 af79cd13be357-93a2987f902mr442689485a.22.1789401476216; Mon, 14 Sep 2026
 08:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-8-hitesh@ebytelogic.com>
In-Reply-To: <20260914133416.1030231-8-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:57:45 +0200
X-Gm-Features: AcwNN1XINkaus2FnglJoOiLWFzpVQZwTJhph8aa6885b1nGo29uYeYlIMD4gkXI
Message-ID: <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
Subject: Re: [PATCH 7/8] media: qcom: camss: drive streams-aware transmitters
 through the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNyBTYWx0ZWRfX3NLF0pU1nNSw
 wspY6/CYT6zVnTNE370t//TqTZq6rrnj3/j5Qnx9Hy0HgVMeSZo9dziUPpS/6rehUJaldZueZqW
 CPEwb3wfsQ1euJH/lYQoPJoFBIrQjVBhyfBbNh8Kn6kYX39CISj/eu7PBatPow3QTiXHiXSiuzn
 Xzxr0blXAvHjYE9jS5qSbrmnvgXZLwr28w18BKW+y6PfKxXC1GulUHphZ1tntkSxs3v2+YIf30a
 FxMc+OVrqKgSXwwHv0HqouB9QW8uRbU4AhXH1RNma6DvCyW/E3R3vNNu2kFN0KgbodxSJL/02Jd
 BEWGU6JjWPzaZyhE62JnTT3EWod4UxmlL0noABjPswDFtxMhIrSOak6GP0qd5UGRzrk5+pNLtLo
 5J8Ys5gjrW5741+atU6BmMh9b3teQ05g6l5X0S2ZRnRYv+BU6i6kYx7oKSgfdR6hRNnLnDrwk/J
 +ZZLYKyeav6TLIdj2iA==
X-Proofpoint-GUID: pp9Rpna5iNLbD1l-A3obzXQAB1cKN2sf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNyBTYWx0ZWRfX5GH9uYseFrEZ
 XJqKiBeiMyusB2JyqKbjYlA5czMQ/ALdgm1fTiFGQe9e9A2z8mxjm8AJq9bDTUne4VhqbnXwbTj
 EtGfRFSL7Ky5AGNlQ9TsZkeVQGVfpVk=
X-Proofpoint-ORIG-GUID: pp9Rpna5iNLbD1l-A3obzXQAB1cKN2sf
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa81985 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=HxDX4g0csZKSo-3CQAoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140227

Hi Hitesh,

On Mon, Sep 14, 2026 at 3:34=E2=80=AFPM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> video_start_streaming() and video_stop_streaming() drive every subdev
> of the pipeline through video.s_stream. That op is per subdev, and
> the core allows one transition per subdev, so a transmitter that is
> shared by two independent pipelines can only be started once and is
> stopped by the first pipeline that stops.
>
> A GMSL deserializer with two CSI-2 output ports, one camera routed to
> each, is exactly that case: the same subdev sits at the head of two
> pipelines that otherwise share nothing (each has its own CSIPHY, CSID
> and VFE). The second camera never starts, and stopping either one
> kills the other.
>
> Such transmitters implement the V4L2 streams API and advertise it
> with V4L2_SUBDEV_FL_STREAMS. For those, enable or disable only the
> streams routed to the source pad the pipeline arrived through, using
> v4l2_subdev_enable_streams()/v4l2_subdev_disable_streams(). The core
> refcounts enabled streams per pad, so the two pipelines no longer
> interfere. Enabling streams on a source pad propagates upstream to
> the sensor by itself, so the walk ends there rather than starting
> the rest of the chain a second time through s_stream.
>
> Subdevs without the flag keep using video.s_stream exactly as
> before.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

I would like to point out that Gjorgji has recently posted a CAMSS
stream API series [1]. Would that series address your use case, or are
there requirements that it does not cover? It would be good to
understand whether there is an opportunity for a common solution.

[1] https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos=
@oss.qualcomm.com/


> ---
>  .../media/platform/qcom/camss/camss-video.c   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 16c5f3748..90f22ce76 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,6 +249,32 @@ static int video_prepare_streaming(struct vb2_queue =
*q)
>         return ret;
>  }
>
> +/*
> + * video_source_pad_streams - Streams routed to a subdev source pad
> + * @sd: Streams-aware subdevice
> + * @pad: Source pad index on @sd
> + *
> + * Return the mask of streams of the active routes ending on @pad.
> + */
> +static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
> +{
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_subdev_route *route;
> +       u64 mask =3D 0;
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +       if (!state)
> +               return 0;
> +
> +       for_each_active_route(&state->routing, route)
> +               if (route->source_pad =3D=3D pad)
> +                       mask |=3D BIT_ULL(route->source_stream);
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return mask;
> +}
> +
>  /*
>   * video_subdev_set_stream - Start or stop a subdev of the pipeline
>   * @video: CAMSS video device
> @@ -324,6 +350,20 @@ static int video_start_streaming(struct vb2_queue *q=
, unsigned int count)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
> +                       u64 mask =3D video_source_pad_streams(subdev, pad=
->index);
> +
> +                       if (!mask)
> +                               break;
> +
> +                       ret =3D v4l2_subdev_enable_streams(subdev, pad->i=
ndex,
> +                                                        mask);
> +                       if (ret && ret !=3D -EALREADY)
> +                               goto error;
> +
> +                       break;
> +               }
> +
>                 ret =3D video_subdev_set_stream(video, subdev, true);
>                 if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>                         goto error;
> @@ -362,6 +402,22 @@ static void video_stop_streaming(struct vb2_queue *q=
)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
> +                       u64 mask =3D video_source_pad_streams(subdev, pad=
->index);
> +
> +                       if (!mask)
> +                               break;
> +
> +                       ret =3D v4l2_subdev_disable_streams(subdev, pad->=
index,
> +                                                         mask);
> +                       if (ret && ret !=3D -EALREADY)
> +                               dev_err(video->camss->dev,
> +                                       "Failed to disable streams %#llx =
on %s:%u: %d\n",
> +                                       mask, subdev->name, pad->index, r=
et);
> +
> +                       break;
> +               }
> +
>                 ret =3D video_subdev_set_stream(video, subdev, false);
>                 if (ret) {
>                         dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> --
> 2.43.0
>
