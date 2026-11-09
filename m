Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794228985;
	b=KZk8RpSzEe8ZxJuCqaRYbeulFZnP24TcOYYXDohnaovd3la8J89SgRxUVg0QZU6JtLuc
	 YqVHBQSG7xw76OXoBXc8ikYL7MxNjBxQuu2d/p0Uh54VlhanlEQxaJl7h130lOIksV6Nz
	 VwtY/DOGIWONdOC1GWN/LM1s2h8C4TH/b/q8HNkPaFsMP9xXEO+nBhGnEBJ+fZnNOJCn3
	 BC5GiKwPalOyeOv966WggkqxlzVk1meGanYE1gWHD5EVlzOODtrvPvLb5aI2AOAEakjfo
	 0PMsnFWxyou0yMPfe1rsBbV6y2z+kb4TN2cwz0877hZB7YYkAIB1hV6NQWPx6t3Vhaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
	b=1cm8ahqlJ6JhN0HHu+CzzFURAp/vreDR/7O3q0hXF3eOA6EC4xpVLOi9oJrvZ5lEBCXB
	 F+3nrlHf/HPhB5RasnWtkhq/S7Pib8SJ9+Ca1MqzR9MfgZMVLyol0k3dUAPfqVtw3kxSI
	 7IQVhYnXxE/xLeURkzULOib5c0PMSujjOnsreg7crm4UZFus5evitC125UAWVuYgiW7eE
	 AF4GwNw42EXPxnwc19TU7XmmQdQ9lgYYOJ5M0K9v6o6aQxM94Op/bzUg0e8LEvDMH6yXj
	 XGm4EugnazUbSbfxNcKCZuRxsnTG9PbQgrQ+bi43ROqLKsrCB2nCi2AknLufTAuap6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZHRCDNR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLJyUKIt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312E606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 12:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D312E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZHRCDNR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLJyUKIt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5m0561914
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 12:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=; b=GZHRCDNRmwLs1HaR
	aEnt0Bt8GmyRP8tfkk2pxl/tz4eT4kiq0Ew+hnyd5cc5VwdjVIaShGiZy2qdKLK9
	94AcZUZT5jnIfCmFkVFD93w4YorUstdbreUI5BtjWbcnmJ9N0sMrwHyurjstSGVM
	zEVOzP+otwFJa/kZ79JHZa3u8Epgd/bHTzXuGFjk8iOZ9sTLGxkXQnLCIzQCOpWV
	sULZf2JSYAjQKlEej9AI+e5VZnuZn8WfPdPO+Kp/ROl66OHdLPcLoLw7IlYGYPvG
	jd7EQKWSPNt9zNGgDv+J3W4lXQLIfySev3wzR1o2zQkfNxxqSH34WFhd2tsIC88m
	hfkV6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxeet0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 12:56:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9440b27c1feso149286485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 04:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794228983; cv=none;
        d=google.com; s=arc-20260327;
        b=THamU5XhFz1TToXNDECC0o1FChwHmEnBadd8UuCoyXugENMHoEgNlNZAfN1VONLR2i
         4e8tzpVW8vy7pJdHt8jiFY1IvqXIfxdZbdXmtyeSEamjCnFYamzpcpJMGXS8uu6vZifM
         rysFxuQc38Jg6Ya9XLu8P9FlLiAhfXQBz5LbOSYd1Rpdlyxpu9Yg0ZGBrM/tddPZ8ROI
         7L/epURwN7pTHB1IF502ZhUxfr2ECVl2cMZKIT5v7z144eo+FnQEJwHT0J6d/syyLHf5
         ZoD6nz2ZOA/dbf4Lbco5QJECkgcb3PqxdFS/z4GUgpowVlF2mO3L72fZwnweVWW/QP7u
         IAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        fh=sSpPLTc6u4enrSJtygk5B1EJHjFWzJN5Bv6ak9+Bono=;
        b=ehP55t9do1d9GNPX0P/uGg6n3m2pHOrXL94R5/LlAvRp+N8pSN8F1m4xzVlFJfGA7k
         saxn7O0XAHis7H84PMY9gvUbwKDLSsOv61yq57cMT5GZNjJDYpeERDZfJbHIdGJs0aXk
         gSYV5ZVvpVQFVo4sSWeMIGSY5PDPeFzN+efGjPJ25UShFUaZNoarGImJ7oLywoRt8SIu
         /LzcjaLE3ualgiEOtKA8lHwl+V4n8bcttMxr77tzRG0KoU+pt1JgDB2ORHNcJlWe06VB
         OIPv5FXLhSUO2vIRWWBw1ZKJmeM0d4N71Wc+QoOZByTsMb+cSeQ3liP5qrCg2KwxRClT
         aO8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228983; x=1794833783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        b=gLJyUKItZurL5R19QpsemoNX0HxU7Y+G4TOHmG7l3282u4W5bxkhcRsm1Ww1LrUKFR
         8/cA97lGZn0PA30XaDfPUv+w5BDAs39ZLQOATo4prG9JN1uwSw3gukCCj9vMhrYqSaan
         0hi19UIDZitR4tkDnru4zfHZU4KizutmTrGm0AFBeyYCFiEqFLNCsXf8fxQZ+efYeUxU
         /ZV+5aYkUB465w9sPny2drfrAcR4irCfzdFJA2qaEAT16tuZ2uEU89xNGYW0qZ6qDbVL
         CQ3PHiDTAYsBhNTtJI8tDJSQLdLlpUPqxrDEfvA2zaAOtxO8GtE+eDvc9Gw5U167eNTH
         dDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228983; x=1794833783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        b=sUjGqOysytKfHSoxD8WO7/mYuV2uKTmL5z/Rul48Di/uvsCHvKljI2jP5Ew5DwPxa8
         5wUXo7YsnlnCVQkifkI0s0iLJwqV+OSJylv1CWD+QrPHsA/Y3epmwtafGz1RGCoYCTMV
         4oOvGfmQ3R1OIbAbwDEdg1XR6NNy70G2/thujLSaGYeCodzjNzIVlpQjjuoyLu9Vj7M7
         Dx8sKu26j/o77sEPUpRelAzMAoxeFsGyCDayay+hdi0M0ANV8eH0CPH62GCfvY0ClczT
         KGl6b0zLHqPpfb6q9jPGUJotUYz2cPLmaNC+6w9pTnzoZ0f0LxVVWw23WECULmv8NXT9
         H8jQ==
X-Forwarded-Encrypted: i=1; AL+hErHX7G1hfCKd7cqlBT4J9745u5vNqoF2i1/1fUGspHYbLni3EOS/JnIY4hnJiP1cRWkk6tQyL9HoEOfdxFNV@vger.kernel.org
X-Gm-Message-State: APuU4Z8GbHQ86J1H/WjVcPpPQwMkSyVx4P3I3BBxPZtKTSfsyc3jWtrn
	RQ+NJjXtCMFbvmyCFOvGKayrWkDL9LxrrkWn24dw/FeFg+e2BhQ2kvUBtSmRT0bQy5HbXjCquT3
	wND36a9iCw1mNNfpmkI5mkfAvRrbP+bYjVR22I8zCWpgp6BiR2RM/4QLtx/MlGQ422a5ImDS8jE
	HoxWqjwElaHoHNfrfqcCwqxUAEAvp2cZ9Ix8hC7Qofrf8=
X-Gm-Gg: AYBFou2z9uC/atLk3q7qb5O+K9kW9y6L1m4DQ0iPLWWvYTITx4ewJ+RzNIHg6rNEYpL
	KlUhdlxhsa/9Mz9QdPNzVVfzIfDXpmKmGhypYoav7mefV9VopxrS/xHO+Ncu2/VENm9C5sudk6k
	9n2MsNPj0Kk1bllk21pdjSjLQXU/GcECb8Hi8d8lbx11wSX7k+K8COw/r1QJ7DcJwIgXnvMWW4T
	dnZdgjPxFhYuhRVa0Pc3xPDgpMJuQeRiePC36tWnysTULqXt/g7uaCII+FebTUCIeTnWcepw9c=
X-Received: by 2002:a05:620a:838d:b0:93a:2150:ec06 with SMTP id af79cd13be357-9478422fc8cmr547412985a.31.1794228983148;
        Mon, 09 Nov 2026 04:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:838d:b0:93a:2150:ec06 with SMTP id
 af79cd13be357-9478422fc8cmr547406585a.31.1794228982628; Mon, 09 Nov 2026
 04:56:22 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-4-allan@fatecpompeia.edu.br>
In-Reply-To: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:56:11 +0100
X-Gm-Features: AclHuK_pX5cjcq1dpBPF5s54jQuJQpNTlm-1RA8DMjxVMXKjxJaJCgy01Kzjzr0
Message-ID: <CAFEp6-1Ok1S=t+yuBu6XB8_WZkJ7h1TYr=S+RvpuDzLimoByeg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fp8W2_R5pEVqr6NlsbCVKF5o9rVJJtDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MSBTYWx0ZWRfX/rvDDDYEaUo/
 ToLB0tG28aiv2Dt9+5EXKk4+kX94zR7fkQwWbLYEVrKwU5o1txn6gjQUtbo5zvRtl6/GZVB3Iif
 Ba0kW1e3QpWIF+Qub4EV//N/QDpFjBDOt7ew4RK7gDRrVl/jgDqKEQoYR4wOPIeBgwY6TkcT9Qh
 ks4UBIX0ijYxorpytKPyoujSUDfjKB5964VbHqY1JS1+IDrKyJ66luuvjuvnlk7PHu/xHZLCLNd
 DHWbybYNIkqFedKUwU4YPhF+mEhGdfyG/DHBiYNwMoxPkxmFEVbS/VfExwoupRSJUjiJIo9oqKR
 524QJAOe3PGrgtHeMMPmfxEqUd1UhY9TgX1yE54pIXU/mWqr9inTsdaMmY9UwiDKRquWzGaC5Ri
 0+LpOhc5JrsSoBDQ5oXpVMODwLShtBHkLcC7CcTv8HQ5S6pnbbfmaXlLo6SazklsEH+ej4tGZiG
 i+n5tn5NK8t9ff4hn7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MSBTYWx0ZWRfX/R19Kv23Nnh3
 CmzzlXvpbJVEkfPY2cI0PJLngR+Mjriwf6X7pPQZYW7dB26NSbAq5Do/QG+s0pxP5LhYYzGJfLN
 AFP2yWoorbBXuqusBCFNpBEZw4SgJhI=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1c2f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=17UmKnwEPstP-2NXI4oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fp8W2_R5pEVqr6NlsbCVKF5o9rVJJtDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090051

On Mon, Nov 9, 2026 at 12:26=E2=80=AFPM Allan Siriani <allan@fatecpompeia.e=
du.br> wrote:
>
> video_stop_streaming() walks the pipeline upstream and calls
> .s_stream(0) on every subdev. It gives up on the first non-zero return,
> without stopping the media pipeline and without returning the queued
> buffers to vb2.
>
> A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming(=
)
> already ignores that, but video_stop_streaming() does not, so with such a
> subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
> driver, every stream off:
>
> - triggers the vb2 WARN about buffers still owned by the driver,
> - leaves the pipeline started, so the next VIDIOC_STREAMON and
>   "media-ctl -r" fail with -EBUSY.
>
> Treat -ENOIOCTLCMD as success, as at stream on, and only log real
> errors, then always stop the pipeline and flush the buffers: a
> .stop_streaming() callback cannot fail and must give back all buffers.
>
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stoppin=
g for multiple virtual channels")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 5de6ff5ec..8341666f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *=
q)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               /*
> +                * Subdevs without .s_stream(), such as a sensor pixel ar=
ray
> +                * entity, return -ENOIOCTLCMD, as at stream on. On a rea=
l error
> +                * keep going: the pipeline must be stopped and the buffe=
rs
> +                * returned to vb2 in any case.
> +                */
>                 ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -               if (ret) {
> -                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> -                       return;
> -               }
> +               if (ret && ret !=3D -ENOIOCTLCMD)
> +                       dev_err(video->camss->dev,
> +                               "Failed to stop %s: %d\n", entity->name, =
ret);
>         }
>
>         video_device_pipeline_stop(vdev);
> --
> 2.43.0
>
