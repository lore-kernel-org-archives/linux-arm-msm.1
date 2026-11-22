Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377786;
	b=SNz86adeMf0gDvL0HgoQN0d79py4CHU9fGtGRlt0ipFW/atLEbIQ1tl7pElDAx8eztPM
	 YxH00gF5/VaSGKmXtvyGKbDPTaoHI0iVyXWwCiJpwJ67bpoXij1zfIrcyg0Fimvjfkg8H
	 BrvqunlaTQpEUXq4IrBHhOXNeCTBzTWzpBckiBHvUt3PLqwabu2kk0mopuyHsMfCBd4q3
	 My4yZ8jq50gtEzxCNw5FOWMbhgcPDhwoVzlkdfjeKWuGVxcUYTOfGwFVFvpFdSCYK9YWO
	 pC0PP7BDJ0nMbo58imKMZMXuDSa9mDm99pHJ2JBcmekf4d9mwX1151yS+iWW5ZnxAAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
	b=d2MWWPbD7zw6/TsJXJKMrYAnim0VkgStzcgxdlm+vb/Jt2Qlfo60xy7RIJSBE6Wd/Bwm
	 AskHVHPGVy37JRKHK/AoT0Jo3sQA6vffowd0l8UvsJvPUJXK1wVTDKQ7L0STlX99D/7RF
	 xdVMtGARc0ukR//Zg47y+nHq3ITRq5sbETHwqf4Lm9gSAVSPUWHzrPbUMnRBEAVd0XJf4
	 mPRB/YzISl1pIy2yfdOitwP6ude5zA9l6YYHPdksP+JdCCMYBxxTFAtUH2ejyA7DsGo3P
	 2f8PE7DrOTxnxg8a2XvcvjtOVi9Mzf4qzV6qZzfVXthWdhvz9TeoztpnYaBX5uHsqwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ayWLu5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvFr2LGy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB6606A327
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EB6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ayWLu5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvFr2LGy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVJfi3516019
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=; b=P0ayWLu5HnEkBhci
	hqj0rSLBOSLGEHUsFbgNsTAVcxYL92RqjUDAhCorsGhVJSYe84ozL+qTAwQliWT5
	n9HKMwnEzq3CBsuibwubzPVKdYgQc/PIcdVm2D0v9YMQ/xk4J3CNTHHqib8lCMto
	P6M8w+1ucoG11tsYx6XVOYw3hXYV1YQMODVoREPALC2ROQBgrQfraFqOdNS9wDeC
	vH71v1eVs4EkvA6putFC77UKumA2AgsCMyFGfSd9nCmhpp9NLPT1CdpZGrXjqlOZ
	iSffFFL55Z3vutME+TXwtmd+HkuffKQFPT0wbtp5Wp1lScgAG2j/xrsXr6Z5iYFh
	K7BWmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v3e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:03:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94970ad532bso423807585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 12:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377784; cv=none;
        d=google.com; s=arc-20260327;
        b=mZxHzCIpQqP+O/1ckRhASgeK/ggvrVcZThpL4f3p7dJAt5Sd8RVw7543mDtkkrUBct
         C7L2WXuqL5Pjt4PRQ80/xorrLqgbtKuDtzpXvmcyR1xDUXtT71sVa2r+o5/tbWN6vJvo
         ioMB/AStDvjUoRsVQS1GLQ9tPSFYBcj+ITwc0OD/lKdEcQ9OC5EDo3257Hacvmqv48mC
         xeCTy9s88O1El7RrlSkybdR9WTv2ZYv98S6ucV21CPLyZoaZ9CQD+31bf6wCEyko49jl
         CHsg0uwOYPibP6jw4/UADZ5iOOuvRW3V3eNxV6GjjwmA/5fxjW692fHr7hMrudbG15Q9
         LteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        fh=zH/GSOUnKmWX38f5r86DLrxKwmU7Wmf0zUSEN3AGstk=;
        b=lCJH3i4rO7GPuGW1kg1crSe/dRn6NNPoczrC4Einzv92Q4zbr37czG9JoCc0LAQqfB
         3zZxnLguvbA1cqjBg0IaSvRKr3oL9gZAnDdoovCjspzrxXKqHQiUwuo1qJwQKCR3JBCT
         3qc93Z509UKeI/MJd13wpfn4nJxua35ePAuOmxNasWJr+YwSfN4WcLj2PzW9ck4PZohX
         jpl02NupymYkEy4ioE5xMkOVVizNGoSW10fMKmGG0rCZ5NUswM/clX+61gKrCvpLa6bP
         N0di/4K5ahRunh+QZxhYUgbBn159XtORkcq42f9f9OGHKFnqYVnYgKE4hAaYSGZQtV3p
         8IrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377784; x=1795982584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        b=UvFr2LGy+v7afv3pmi3Lkl/6532eeVrvNyXkJITHKW8t33FDEwfCcVcO8QeNXJRg6A
         362q1zSB0rd1nmAIjaUWmOF5tFo6R2HJfW/8MHwQ6LxvdAl2SPB5MfOVx6uvR4df38zE
         ebqDhbJgw3t0OZdMJR02GwItJtSsv/fJQJ66L72PcHHSbmLG1613zJFHRusffyXZoUPI
         vn9aJlb/dWYYSY1xKQe36ShY2O9jgcuxpVPzlVXypgeQljKav5tkszwfqT6aupWODyjV
         J6NvBbL+60ipd1GZrSiU7FjFnajsE+cxyAHTAnJV32T+mUrcnwHRB2FdI5OX1+Pc1Zou
         Dvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377784; x=1795982584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        b=VEirZacIS3S1cqTrwEIv0ykJCZfGOoWrCOwTWT0FLhrr7WamnUXKgyAwbBfbzuOUfF
         Vt7CpI5WnZkFlEzbuVOrurw7hnK8kLaSDMbpUr9d3A20UqzPMOM7B9lU6DT3trSM7Km0
         lmumWQMOvPcHh5KM3lYEbTkMcNnszxMXickvdILcULzIMZy8zXE+avTF2ATWZ4z5qnLP
         ON7S+r2Mzx+rqcDlDt+c9MaM8avCkAYq8C4HOKjOSNv0/FKO+b2LmsjRKM99TWzd0P5z
         yiIacZJqd7ItjAtpb2pY/aJTNHTi1B3RksAAGgHo9bDX/AW74plt8H2JYx7j72pKd3/Y
         +wpQ==
X-Forwarded-Encrypted: i=1; AL+hErGW3PbxcroFWJc6YyRHtsYUo0iKCI9AEuZ6LOv5kL+TWKyKOoiu3wYxOcHZChD2OBZdIGRZ3bkzRgG1Cm0C@vger.kernel.org
X-Gm-Message-State: APuU4Z92FSXcNK2pkJsjICOYTU3whaIX3rD99vm1Gk+gGkaE5P8DnfpG
	Ehpc0bnz3YSmOrl9mZMXWruOmyl6b+8u9ebT+ARlUGO612z9kG5PHDaFt/y11DbZITr9lzo1dur
	6kQv6Gj+YCPpIPNf0+mCF1pMVvKF8gQZmP2EkYxiOkMnXATqjD3x9VWvwWXsOwMr8uQbwrJBKrJ
	O+RvtRhv8XqYdkmGfYYer23i2wzpY6oUz13fNJmjyzwXk=
X-Gm-Gg: AZFdTZe1F2yhAV5oU1HQ7stSZBx6EL/b/F/bqo+jgrrFPUjqkTEVD0ODj5LDHmznUAA
	JxHaV/TQ6sUjP5r2KWhknKt0ht//e3FQsY+ofFEpU3DLQi+H/XwPyWfi9ato666EnHfXu2G7P7U
	n3Bd8Brnq8emEabOmndHXOI+ljwXtA4YW9e1wy1AM7pt/q08wBJY8J2cTBO+6W7wyT2EyFGWyAz
	fYKP57EhssxFKV8Mr1Ddl8+7aJ1X3KNM1JorJKw5P0Qp5IyYg8Vje/MM7q9KabGSt0qWs1O4ivX
X-Received: by 2002:a05:620a:8394:b0:949:75de:b22b with SMTP id af79cd13be357-949ba81a715mr1583868385a.2.1795377784463;
        Sun, 22 Nov 2026 12:03:04 -0800 (PST)
X-Received: by 2002:a05:620a:8394:b0:949:75de:b22b with SMTP id
 af79cd13be357-949ba81a715mr1583863385a.2.1795377784020; Sun, 22 Nov 2026
 12:03:04 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:02:52 +0100
X-Gm-Features: Aa3M54qmPp4TGqe-hJJ37DMHGOwtKCGfgNTUpZn8HGSt-w7F-HPYonR_mEW5WQw
Message-ID: <CAFEp6-3XFf83bT_uuYEvu4KVin2ZmS4N=B8EsJoJ9HP7ZDkCmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b034a79 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX+D07ORluS5Ai
 IMLQ7ap1+JAPdHvDwq7nJ0rgWLDaZ+5+gdUDY22abFDEAI6Uo+U4YWwlHWRw4O6G9UZjpWWnRE4
 RrJTeBVHDjbMkM+Wk0mVI/k7/FkDqfE=
X-Proofpoint-GUID: BUmieqcm5XgNvoOPRlu3YbTkJxYRd_fW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX3A49ztW2s83l
 cuwjtdGp9rRNW5dWYcN2vaZxCOq8JAzWF8xdO5RJtv12jewjVQGdS2QUOqcXnb4l8SzStNmHole
 sFH0Wi2y9IR9TZNSM+J3RcLrmOhnK2BIp7L8ZEDG6/N9VIoDYv74ZdcQ4079Xc+0+QCUsLI9K/U
 0htEfDgsSJaF7//PwxVaJGp8aPJiwcngdEcXPxixLzg9OupaWdEo0bHynLNz5OSzqZ5hSNAJmbR
 znPbQjWZPjJGaRh2lUm6BhcJOSbuL9ZpXC4yF2K8UNmsXUdlWUzXjd1Myyh+Q9KJDw9i84o5Tta
 7hJ9Zf0teZkfkm074ut030KIdgMaSj+DZ5OJ9flj87La/mM7tm+RhKGC0Jj8gJbaHA4ucfd3hNA
 XcHY2CvN+2HH32XsJT4ThzQdcOL+y7nKojssy0PHaZEmsHtvK0ruPI1V8rsCM/5O65+eapiQzhY
 qY96YPX7J+hm/h7ASUg==
X-Proofpoint-ORIG-GUID: BUmieqcm5XgNvoOPRlu3YbTkJxYRd_fW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:10=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> This patch fixes a basic routing error that has been present in CAMSS sin=
ce
> the addition of non ISPIF platforms.
>
> The ISPIF platforms can route any CSID to any VFE however this is not the
> case on the non ISPIF platforms.
>
> The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
> Demote the spurious poly-mapping down to its 1:1 real form.
>
> Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_=
entities"")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++++++++++-------=
------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index aa6d01d8fcb2a..060879a55e483 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5257,24 +5257,30 @@ static int camss_link_entities(struct camss *cams=
s)
>                                         }
>                                 }
>         } else {
> -               for (i =3D 0; i < camss->res->csid_num; i++)
> -                       for (k =3D 0; k < camss->res->vfe_num; k++)
> -                               for (j =3D 0; j < camss->vfe[k].res->line=
_num; j++) {
> -                                       struct v4l2_subdev *csid =3D &cam=
ss->csid[i].subdev;
> -                                       struct v4l2_subdev *vfe =3D &cams=
s->vfe[k].line[j].subdev;
>
> -                                       ret =3D media_create_pad_link(&cs=
id->entity,
> -                                                                   MSM_C=
SID_PAD_FIRST_SRC + j,
> -                                                                   &vfe-=
>entity,
> -                                                                   MSM_V=
FE_PAD_SINK,
> -                                                                   0);
> -                                       if (ret < 0) {
> -                                               camss_link_err(camss, csi=
d->entity.name,
> -                                                              vfe->entit=
y.name,
> -                                                              ret);
> -                                               return ret;
> -                                       }
> +               if (camss->res->csid_num !=3D camss->res->vfe_num) {
> +                       return dev_err_probe(camss->dev, -EINVAL,
> +                                            "csid_num %u !=3D vfe_num %u=
\n",
> +                                            camss->res->csid_num, camss-=
>res->vfe_num);
> +               }
> +
> +               for (i =3D 0; i < camss->res->csid_num; i++)
> +                       for (j =3D 0; j < camss->vfe[i].res->line_num; j+=
+) {
> +                               struct v4l2_subdev *csid =3D &camss->csid=
[i].subdev;
> +                               struct v4l2_subdev *vfe =3D &camss->vfe[i=
].line[j].subdev;
> +
> +                               ret =3D media_create_pad_link(&csid->enti=
ty,
> +                                                           MSM_CSID_PAD_=
FIRST_SRC + j,
> +                                                           &vfe->entity,
> +                                                           MSM_VFE_PAD_S=
INK,
> +                                                           0);
> +                               if (ret < 0) {
> +                                       camss_link_err(camss, csid->entit=
y.name,
> +                                                      vfe->entity.name,
> +                                                      ret);
> +                                       return ret;
>                                 }
> +                       }
>         }
>
>         return 0;
>
> --
> 2.56.0
>
