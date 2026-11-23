Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428307;
	b=X4LWpZcd10/rlXtSkS9VRDkBo+BblzGBN7h6kXROmMiThn14pHJV5Dd06aDLJaVkGurK
	 2yYKacEErmOKZ6AkErEmP41x36ZpdgZ13Dt+MIB6oEw7LVJ0BSuk7uW4/jbKevFr4uUFw
	 OItcQTbscD0Zf6qAeUrIVuI8xukqJdakoP/WBHt04lyfArtZFOlbOKObmQ9D/EGdK3Ta2
	 V42AH1rNjJvYWw5xAqKLh3sPlip9ZYBJe9WcdKYjQnVhMXhl188ai+n/i7rcIZ5Cfx5F9
	 kn9VYFwBoZuup7+kYlrOSt1E0znTySPoExdx9cFWnQDT/4QO3o4H+rvLHV5b1Imr+tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
	b=vq3KDgv29b3IWRAMa9/Z9JC+5vtTXYK1F1NWiT1pdtLY+RjcTmEQ5mTaZe0OmsFRpZhQ
	 tFZlQkO2kl0aHRQ2gk6ypCPDpviHfDLhrsSoSaMoN9G6p4+GJuLSG85Rv7fr83q0gLWdb
	 B9oHDjw8FPfVP1ZUMpjXFoNwS+4jyTUACWn05hjQpDdsA3gOaQ0HKOFksMikR7fieVdj9
	 Gie5t0UiWUUSodmuvwKD3he0DfUpystjw+8Sl8U35tfu9cUAlWtSE9x3CgW7AWGpjDAiL
	 zgLtZrXj6WZXAgoBopr+ijyLeazie4QlrxJR6TiMsSdckYpa3xVCeVGjY76EK4CZ09g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pH98vKFH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGnWdkMH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF6606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pH98vKFH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGnWdkMH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G3Si2528377
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=; b=pH98vKFHVs+7bIMn
	wTFuEJrt3xNrSlWJc5ufbvTEsB6nhu3QWQ03fgL/LCbpbcLE69qbFKAhOjjpTB5I
	BDtcmnCmPmFP3Ke2rgEB7NUln8hhtGP29BaZht3rtBAN9dbctbLjr10MYdXRipa0
	cBKIBu9z/qVWY/hO7fCnKQBlJIo4a5wUYpKFWr9eRUQejO+77AYioI+FOk7mgSMj
	7pbvn/wWxhY0/Jvf7g1LcQX4s1pwj5NoQ9FlMdXQ72lqAa1jD17U2YSuWPEv9Fk7
	JgbpKqRGJkLffAE5h5maUP/PURvQdEV0+U+2irkKgQoXOlrD9J1bPQKoPw2agXc3
	VkcQzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rfhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:05:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso444794885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428305; cv=none;
        d=google.com; s=arc-20260327;
        b=qBVctRm+xCXxw9qeb/vbu0CIqhZ7Lmsi8nQOkcKEfb7EZNH1kLZNcOYy76ndzQqmHP
         wQuKI0i7pz8ZHIpqcenltqATNI/Z5Fa2al0p8lrk43sAnYGDbTkuevY3KIe1DY58EMME
         5+2keUiEdSI0PNn1b2zjMZGzThawtBNvTsjJ8jyJQdHvoHtxgBvnfGfEiVUUggQ+T16W
         H3nSZAMW6rADYchMspwZw/pkoH4TVHXCXB8W8Q/JRiOgq4G8PxEpiYPg63EnNuzQPn2n
         KPsrB8hQ9+SNvofIzwnw2F/4k/HHMuZU7+VqRxmpSf68sRKs2FxHsDCyG4/E8AmWAu6N
         6pKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
        fh=3M7J8jT+8TVXbJIT8s0MaZrnn/MM8hTQcOD08B9u4Qo=;
        b=U8RaLxmoOWLzE3mE/TMMCkAaKfyx7xRj5DcMirik5sSBuYMMhc30t4KyOhDQ/N/Mkg
         +mJ/hHWURF9eMEvxnRoqJWr/feA6FHH00ZNS/AhTGUHAUyP0ZHgOv6msoNZOJ5yFvUvg
         cFSwNALlQFQIX/u38fGbixiPllYwI/59E/JuV0EX/MKLDnQmITEaZzMjVQNrgf+XBIw1
         jzTi52jMBvk4NZbfOsd4ldGCG9lA1jbJMFxWqOHOpLeY0746oApIvg+lDnIlKqaxjtTK
         klhNo8cn5RqfuN3NPXFJuVJUjLJHtXvSRrLCF/i1Ql4+53csjvOtTNeUTuuWOGRnm2cy
         0Vcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795428305; x=1796033105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
        b=AGnWdkMH21N8On/EIdZBkpluKf4MDgPTS/4PWdBc5dIJjqj9dtqyMBuz8QvIrAkTfs
         sn7Gl9a1o1oVEOk34QMGfRKsJpwigQ2O0vI2fY1IQ1u2kCYVVctGm0yoOBQq7Pfgd/+P
         SG7p52RrexkxxrDLyfNbD+7+0G7f+3VxA73Ya8AGtH0ke6myKShllObyCnXutKXI81mq
         j0EtC6CYqw8fO9oRe6SdALMRlAZHzvpwpgiWTtkH1betI4eU2kkSakVaHFp5xPnplQcz
         8y01bUJ14kXzJr0ahBYzYZj67yD6qMQpmp0J5YKi48KFqSS8hV5JedpvqyCxXZUQJs34
         8Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428305; x=1796033105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
        b=2JGK1ya8frgdgjz1H8ciIf+DjMuIQ39ObGlxaItWbCLp3vBvAoQR936Td4aSJ7skhf
         ssHPUr+GybMHihm3TN2I7z+iALZRZP91egSxfL9g0M1ziri9aj1PCrEQWBFjf+fVL5FS
         rYDIssveNjYs54undR89pM3bI48imJ4aYyjh/DGgITSrhYfiDv4P4yyrjfGIuZMng4+n
         U1GKraO7nlt7WZfvHMRRDbS3/kacnpuvw+9EvA6YjYMhb9+z2VfBx8hEEoaqmpKigda0
         uLMSVTmAxLAyFJyBQhyEwR79305t8n8k9skoe8i6Kzy2gvmYTGDRIcdECWqNnSQb2MfJ
         QC6Q==
X-Forwarded-Encrypted: i=1; AL+hErEABECpw5Nj8BXRmbgEim0vxIKOo+ktbJm80aUDFveYLheCznSq89LMr/KzMTuGa3b2zzZYa12EDOZUyG8d@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z4qxypUqPrA4joClf4r3liSwRiApslZYKyO7SoZ34FaBKLgQo
	PcJquNGmtPjNDmkOLw3JszFUVW1PE4VEVxhUNcy36j4t87KWji83lqcyITQKOQw2XcdWtDWYMth
	Rm27vWd+W6hMP8sFPqs1Do5M2IEb+X0HPJJzLSpbrELfYgZYRGwbuUJfOBY7JNSvOFeslU1Ky+f
	H53W2u0OlfEHRCWIJIIyWYjvtKm4pczcA70pilBCy7CEg=
X-Gm-Gg: AZFdTZd7Td2eJSaNGjox86HYKZHSOG9EtPPd3PaCxTzD2tnW48Gvr+UICIfXHw/i2U6
	tGkjX9N78XNPZcm7E7sy1YUFPu+X6eHOv02dG3vUj3crxDPdSuFfzsXbLAb3VxnMjBXEtRCvWr+
	Ljpo9hFszkRTgJbkBr2kAeF+LFHp8XAb7DmbwGdS77JAu98wVnvX2Ye8YZgQBTJYvbxBwSk/MGl
	ASO/MADftsWk6EIYzUNTI4vUy+YG80/QgyozBS9UdQZZgyxPp2YllmY9KSdr+I0vaM3sP3zwdi3
X-Received: by 2002:a05:620a:170d:b0:949:67ff:56c9 with SMTP id af79cd13be357-949bab4e414mr1844866185a.70.1795428304971;
        Mon, 23 Nov 2026 02:05:04 -0800 (PST)
X-Received: by 2002:a05:620a:170d:b0:949:67ff:56c9 with SMTP id
 af79cd13be357-949bab4e414mr1844863585a.70.1795428304496; Mon, 23 Nov 2026
 02:05:04 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:04:52 +0100
X-Gm-Features: Aa3M54odtvdCdAgjn0TOtpSBIOP_UI5zPF3v3UJWEKMPAcgomYZEvssdXYfJed4
Message-ID: <CAFEp6-04oyWYxuQfXt=0WsrMe_tTa3pNpsLaEh53V7QqExOZvA@mail.gmail.com>
Subject: Re: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b040fd1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=8Ls76JZ0y08s941VHScA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX7npBKaFSP1vA
 eymmxz4h4xI+9GOoER/sEbARTfM3N3z8aFjJCmGRbbVLTcIblsfEnkS+b6w7pajKVbic65D3VLd
 oSgR0vpthltvPy427k8mBkV87jvepp1w84n+6xUdgcvuK4mUSyLUPJwO5H85nDiT/ibJegcBsLl
 BiCrO0J1HFPcQXb7pIyCs0cCOKKzmk/p2L4SoHr5KkCKYJ/FgTwu7zvJ+qSu+sIZZKMnn3I2+ut
 u3nTkSB9c+8xZngpgynlwaRdqUcr0+GFppO8WCyorXmXoWUAmQwvu68xjWyPJDa1WgnrDXP3nYX
 9AicLkhGeej+hsrBzNXzPR1d8unEt8jnygFBbqLKGLIpeljP+Hyy7+cd6KZmoQonCLwreH3yIT6
 ps7Rj7dgu8RWV6CCA4QsaPkFxmDcKY8C8c9suZSp/0o3U2XOONku7fs3aj9OHzkWdI/H7XYv4Z1
 3wZZAPc44fjUlzrgbRg==
X-Proofpoint-GUID: tEdbF2YR-T2GMgh0HddYkfRUoTWnUfnm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfXyJLLgMJjDBll
 v91cFOier8pNpkdMJtBhJKbRltWb5RAlsPN39pAMoFGJF2YOTblO4xSYL5MhT//aDcdllgWWGkH
 l6VKqGqdp5lXrWlCYXBoP3Vr8xA3XNE=
X-Proofpoint-ORIG-GUID: tEdbF2YR-T2GMgh0HddYkfRUoTWnUfnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> If a subdevice fails s_stream(1) partway through video_start_streaming(),
> previously started subdevices earlier in the pipeline (such as the VFE
> and CSID) are never stopped. This leaks VFE stream counts and write
> master reservations, leaving the pipeline stuck on subsequent stream
> attempts.
>
> Walk the pipeline from the video device up to the failing entity and
> call s_stream(0) on each already-started subdevice before stopping the
> media pipeline and flushing buffers.

I saw at least three similar patches recently, can you look at this one:
https://lore.kernel.org/all/20261031041154.308030-3-xiaqinghuan@mail.ustc.e=
du.cn/

What would be nice is to build on the above change and address the
reported points/issues, as I haven't seen any follow-up from Qianhui.

>
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video devi=
ce nodes")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 27 +++++++++++++++++++=
+++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6..6f7b9f3 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -253,7 +253,7 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> +       struct media_entity *entity, *failed_entity;
>         struct media_pad *pad;
>         struct v4l2_subdev *subdev;
>         int ret;
> @@ -282,12 +282,33 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
>                 ret =3D v4l2_subdev_call(subdev, video, s_stream, 1);
> -               if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> -                       goto error;
> +               if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +                       failed_entity =3D entity;
> +                       goto error_stop_subdevs;
> +               }
>         }
>
>         return 0;
>
> +error_stop_subdevs:
> +       entity =3D &vdev->entity;
> +       while (1) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       break;
> +
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +
> +               entity =3D pad->entity;
> +               if (entity =3D=3D failed_entity)
> +                       break;
> +
> +               subdev =3D media_entity_to_v4l2_subdev(entity);
> +               v4l2_subdev_call(subdev, video, s_stream, 0);
> +       }
> +
>  error:
>         video_device_pipeline_stop(vdev);
>
>
> --
> 2.56.0
>
>
