Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286069;
	b=D0srqjaI6wDW1lX4OsK044AZ4E19idkxHDeFp9b53hX/nyMS2Ri+J6olXYu2Z9KugUse
	 3ZYPOXab4pJtLilWhB5kZ2VYZ/qZRCBNEleeJo8nEebKzlqZWZbqrD+/T1vTttBm3Z41D
	 QSV3eDR0ZHlho4SesO0pls101TMk37iexxYcqGKpFl100enHZDOu5TzfMHKXMm6IYCRr3
	 r2LOMY4WVbcI+cZKU9VA3yx7m0ZfCztIZHECzLSX0zPgUjRpT9HJHIeQ3IpgKyfnXWivU
	 bkNXpPJOEaW4DTpCZTNso+SnKlPsocL1vHP+4YCMQwvJWCXT0gc9IWedR4rMKRYKFHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
	b=Fo/215xqqElUOp1PwHbTEkdYOQEouM2fiz8kOVDdewSjANv22HBaAzRk9FgFILIAnBzh
	 Fn/MAtJC5y/m5TBUgB5pJzo4+IyjtSKlrdsRYkfduQmfOT4d/Ax+NvVi1vHL9vYdpIbY0
	 SK4Qm9V+caOLjOj6F1psRhDxFbaaTukZoKtxBRM4WoTfRHj+hO3dNJw0L/Ar3gPws/XFs
	 R7j5VNUOxjJGobnL1Qi2ma2zx2z4iKRDr7W0wm4nUmsSU7WGkvjKMj/3VCnXub7atRzqj
	 BOailKu0teEFIjyMVbrgdP0gqxUJ4S0ypD+diAIbp0Y8NKtqnD2EYWEPBfNeQf0ZIAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3h6ZnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLzmPHnT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA0606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBA0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3h6ZnZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLzmPHnT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeHVK2761913
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=; b=D3h6ZnZPaYF3lbYG
	blUwG57DFfm8azwZ3tjiyes/cCXXOepQ7KEpiVmDR2F5Q9tz/C3T1AJ+jjUyx04p
	NvYfJp/IwPiUDRqbwkDw9OrBNvQNrMyN+NT5jnZjLVmn6SDd3WHnuWcwMwgSPZxE
	Ps1KKeLOcGe00BSyUS8x4J6ASp3t3V+0ybmCctvmCP1WldtXbw/mWHfVDtrmegJh
	i2uv/tBpvWN72SX7y0dGF8GZe3pvvs36O6uK9Aa1cHue3E5Xi92iW8nOMt1o8xaU
	jfnZpRKx+KGZOT4bhwzL6IxnIDJ0r+xxSX/+BDXyVr00pxoIRlYsjPgKT9NfOTEn
	hUzoPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b1cm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:01:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so198182785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286066; cv=none;
        d=google.com; s=arc-20260327;
        b=eBUWJojGs/cyJ3a42NpGoTFi56LzLGEIyMQvWCoexRD3XbW3/jCxVBJbKXCQ4M6Qrq
         kwPhxLLKkHtrKg1LUZ8tf+Eh30u/60WnZJqp0tiVzVDmxPbcmvaHFTCfj7qaJjyaIWHQ
         tkhJw+HIQieJzuCu/QKHSIU9jH59RUZNMRDvSxTa6tDJNk4Vxc3PPcUbAH/nq9XXbDBZ
         OZ8sRh7Jdp4dWNwkUwdOwsS/iJM7ClMLAl+MC3ZOBKqxwxY8Raaks/06wlsQIgqneNWu
         uuLP7eRnRy3rQpmMxZhkP3M56dvcHrZasqRqMeeSTn49FPjwcwFgmti524i3YkRzZ18Y
         /4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        fh=wx/coQXKoSEE2P09FGaZXJUFBz5WOmIN/gNwzMXBQpo=;
        b=aauR9Hkyivg5lHrhj6CrCkoa71rn5h/D9m3vR/+7yKt+Jp7eIponC1lL1PxnRVENpx
         7E7xMaP0QYh+xzXLqhOtZJ9q7JY80x+ivVyGBGR+M0TYgMs2jKSMmLqldLgrshFehcvm
         VelDnSayT0d68+ypkCJkBUCkyc/x8aWw4YEJT1ne2IZJw6VpOXF4vs8tPrPG/6Zr2o9N
         ynAGzqWg8oQSYidHwiMoZF5F0HHgANbEw/ER1P+n7Ey3MFqxDs9ehvo5Nyqtwm6aFDh2
         U/u+aVSlFVBzzta1JAUEgSUzx9jGAXFWa7G0qNFYAHVUGul8V3IPVzpKB3nbmrm6UP6M
         vzYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793286066; x=1793890866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        b=DLzmPHnTtmHP+Hg3Ewokbi48PkweneldmYzVU9yYYqweMbME/VzPB/dJf5rMSOqnHl
         EhP4QtXHuaHrYEoxhB6wSOMFCaSwJ2iEglO7JpGFjzF1dmJ4+hu1vGPqYnZ82Unj3o93
         u4f9YEmX3VC8DNhDucP8ibIZW9SzHpBG3633dK4FTLA9Pohla62s1SzkNhOrsDyEF4I7
         1hR+7ZRVkbDjq9MW2ptfEf2M4dJ26gDvd4kpuAV9eYw1jR7UI1Hv0Awf9e+QNGaq0Jcf
         VPKmqTAe7EoFS/juvxfCOq6cnvgFVf0UQgcqNcJx6dk6YItNxBebNak5Sa7ywzXpU1bR
         TNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286066; x=1793890866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        b=qM3BFyN4AIy7nD9UGFDs9lwlVE9ZukwgHjDKBNRNiq8zako3uaPGwnIA/Zlx48MIt4
         Kla8PySsyrMjCTcy42Fnd0ReF9EhhXIdLLgbq0fzZ3dEZ/tbhgiDCFUTTrMco/k2UxPk
         mD2oyvoNVmR6hOZwb47J5YEJ4IB5C8akPm0jODwvDU7qRKQGTAFxVAuM0AHYam7LB3Zq
         TMyotoYy7XQnOslm+lMwPNCMCJvZX6PP6awvtJfgf3CaI+1KL94GL3NWCeT3ArGG1nDy
         K86nLHlLrtbZDl0DRsoOIroBoOxY/eyPs5sWRODpwCEG3C7GyQ1xN4wgR9pnd7d2Pv+j
         /nRw==
X-Forwarded-Encrypted: i=1; AKwUvByrnGfDsM9dJz5+cB5v04r9Bpekzt40CuCLGU0WM0/ZGxmSbLZ6HABVuJDLhS1qn5xerfuvNFdkKpi02cl7@vger.kernel.org
X-Gm-Message-State: AFq9FYLa32MOwP0e3vGk7Y7IU0QTftlo0pn3Fht638o+I5cG1bhnk4BU
	H925VyM9zhUjkx0xdrztrhAw1O/Z/S1u/2D7KAWOAzTaN/yffSPYInqv0zo2gZINHPz9/3IbulN
	SiUP1dabMTCYm6jt94YCf4LV/aGNpFRpoFJAPexgNQoH2sXrAVoI9cphCDB9TTAKbmzFHyYd0fg
	rkzMJ8m6KOBK9/3ypq5wRZ7lsvb+NN+I7xahKX+Drl/f0=
X-Gm-Gg: AYBFou2I7qaMRF0xovLUIcFZMLm+3HWIYR9iWWD99SuSQ2HNSEPHaDVKLIMAvG7PcOu
	KHwRSXFQwB55mueXiPfMGhaPsuUPKDxsx9rn5tH92+E138qeh9dOxwhqJ9WXDKDmzui7k+a2SCS
	TMpGP0tXb7QwZDjoPQZo8wGP/qaAAAfb1ShpSUZpNmHY3QydjbkGX/y2n6DPZvyjw+rhvWLCECq
	L6wVgKoXot1R6bF24EcORScZ721WhKjNhW8QRTLRYxBvZX2BeEfxHHaF/l7OlxKCHIDQ8Bjqnqk
X-Received: by 2002:a05:620a:4505:b0:93f:2ed6:1f3a with SMTP id af79cd13be357-94408cc0ba3mr830857485a.49.1793286066114;
        Thu, 29 Oct 2026 08:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93f:2ed6:1f3a with SMTP id
 af79cd13be357-94408cc0ba3mr830847785a.49.1793286065425; Thu, 29 Oct 2026
 08:01:05 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn> <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:00:53 +0100
X-Gm-Features: AclHuK8PQe0DwZ8FBjrux1Zc5_4AUwT8-TJVyvWYZ5AuJYjpyLWFa_T86llNyPA
Message-ID: <CAFEp6-1dRNJ9rr5JWJ0W-XawtE1nby14a-ndCyCxEnd0K=gSYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: camss: video: stop the subdevices already
 started when a start fails
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX6wqLD18AT3Wv
 w40CaJ/X8nm4FZC3a2hA4eeGlZfGcHvrFNJlZZmK6ZVxb9XWO32UzkrdQ3TvkCeZ+oPUdcBl1xT
 Kcf608639CtWC5YsXQRYCvlnabJbtxI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX4w13SbzV5wA4
 4hqSbT4FvP+3BeL32Vivsi/qciigPWSqbjr20iGR62CY8mfxMj9meHzg+jx5CymGY76u5uAX3Zw
 1vnGZLVJqsl6hWv2LPAHGgWYpt108DzZaFHczlH6kXWPM2cCIkUPDWXEOdZARCVQBGNIbUsXE7d
 rd56RZqPFMu426tgMDbSE1FdbQx9w61VQmDptoBi03HXwuAOOGIQEf0QcaD0S5WGBsfzIqwD5sC
 ZVUng7lkKL9rhOSFCwwSW2BXnG4pahtvNa5dAtTODnMCQrEaqeA3kZZ0KnynhgtlTKBwKyABz9j
 Xa7UVeNQR/AIawcaOGHm0K76CYV4Jw49rVDB4df92Aj46h6Vd28z4tIJEHHonlPwjMUJjDy9H+4
 OlgUEgYgPk1sgyxAoUvAsbys1xmhh8kGrQvMEWVigQN8ZTOmaDLXvPMnbzK9GVPIjOYGXykrJZp
 MYlAnvQO/Th9LuFt9jA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae35fb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ufGlPyg97rzgKyQT:21 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=hCK_lH1sK9i1C6WOWb8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: crsGB03oDS-H9h8VlIv8RjM8WMURtBfb
X-Proofpoint-ORIG-GUID: crsGB03oDS-H9h8VlIv8RjM8WMURtBfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058

On Thu, Oct 29, 2026 at 1:31=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> When one subdevice fails to start, the ones already started further up th=
e
> pipeline were left streaming, and the next start would try to start them
> again.  Factor the teardown loop out of video_stop_streaming() into
> video_stop_subdevices() and run it from the error path, stopping at the
> subdevice that failed.
>
> While at it, keep stopping the remaining subdevices when one of them fail=
s
> to stop instead of returning early: the pipeline is being torn down, so a
> failure there must not leave the rest running.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 027cf024f9..ee9ffd0432 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -265,11 +265,37 @@ static int video_prepare_streaming(struct vb2_queue=
 *q)
>         return ret;
>  }
>
> +/* Stop the started subdevices, excluding the one that failed to start. =
*/
> +static void video_stop_subdevices(struct camss_video *video,
> +                                 struct media_entity *stop)
> +{
> +       struct media_entity *entity =3D &video->vdev.entity;
> +       struct v4l2_subdev *subdev;
> +       struct media_pad *pad;
> +       int ret;
> +
> +       while (entity !=3D stop) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       break;
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +               entity =3D pad->entity;
> +               if (entity =3D=3D stop)
> +                       break;
> +               subdev =3D media_entity_to_v4l2_subdev(entity);
> +               ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> +               if (ret && ret !=3D -ENOIOCTLCMD)
> +                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> +       }
> +}
> +

Now you're here, It might also make sense to introduce a generic CAMSS
helper to walk the media graph upstream and start/stop all subdevices
in the pipeline, something along the lines of
camss_video_subdevs_set_stream(.. bool enable).
While doing so, you could leverage more modern framework helpers, such as:
- v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams()
instead of legacy s_stream()
- media_entity_remote_source_pad_unique() to locate the upstream
entity rather than relying on pads[0]

Regards,
Loic

>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> +       struct media_entity *entity =3D &vdev->entity;
>         struct media_pad *pad;
>         struct v4l2_subdev *subdev;
>         int ret;
> @@ -284,7 +310,6 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>         if (ret < 0)
>                 goto error;
>
> -       entity =3D &vdev->entity;
>         while (1) {
>                 pad =3D &entity->pads[0];
>                 if (!(pad->flags & MEDIA_PAD_FL_SINK))
> @@ -305,6 +330,7 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>         return 0;
>
>  error:
> +       video_stop_subdevices(video, entity);
>         video_device_pipeline_stop(vdev);
>
>  flush_buffers:
> @@ -316,35 +342,9 @@ static int video_start_streaming(struct vb2_queue *q=
, unsigned int count)
>  static void video_stop_streaming(struct vb2_queue *q)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> -       struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
> -       int ret;
> -
> -       entity =3D &vdev->entity;
> -       while (1) {
> -               pad =3D &entity->pads[0];
> -               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> -                       break;
> -
> -               pad =3D media_pad_remote_pad_first(pad);
> -               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> -                       break;
> -
> -               entity =3D pad->entity;
> -               subdev =3D media_entity_to_v4l2_subdev(entity);
> -
> -               ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -               if (ret) {
> -                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> -                       return;
> -               }
> -       }
> -
> -       video_device_pipeline_stop(vdev);
>
> +       video_stop_subdevices(video, NULL);
> +       video_device_pipeline_stop(&video->vdev);
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
>
>
