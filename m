Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793611345;
	b=BMlfg/QS80LRB4Q9mA2RhsgPK3APO91xGmPCpMS1It3wg7ZQnayOKqNNlI0NmM1K0vcD
	 qunkKXncuM1IXGP3KFsm+0FsfSSUjQ3vW0MQVPUAh8NqK47qYEmQkShu5sMpl8m8f9w1s
	 q9LJZ2iYG21GKq6iYmXZ4ngaoPnaEYMk6ZGn75HVytdKI3TJoq34m/deV0oxzX3vko6cw
	 xUiFOn5lZ/5pGZ1SRThuKNA1ZUdbVcZflDdTNuImyzuqSBo+aO4af5Qp3TQNIHlJKolgb
	 vU6VjjZzUggo/nfhCJUc3ubz5UFZKyWlluxBsdVfeikt76TvJd6XgXbIf01noIaVjHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
	b=tTnLx8GDflg/oFnnvJ0H7ECXfzg4p3e/PxTiXECJP46XSnsXWMRPkye7RpGcyqET2fgQ
	 SQhyHewRwTfRVlkHmQ4Nd+EC8v7gURpW0YPs5isL+YCIQGX9g+cI1+iE707k5q8r+Cr0l
	 CTXU+BImGdDqT52nsIKBWkYwvzHOsM4U0EfBqWSl47bMPnc+7az6OHKSHb5YqIr+TjJEl
	 i1eF/2KgZj40c1XcZklWHnc0wke9APBaJLaHPC4IzVzfTt/QhkHu9kX9czwSOlmdYZI44
	 bhFtZDEtZiChrWxeYVoh4mcHvQbhJioZuv7jiEqafBIjboqVl+kOihzGg1dl6VxT2ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMaMoSoe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8IT2CZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B2606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B7B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMaMoSoe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8IT2CZH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3Wt260571
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=; b=gMaMoSoeQgqsgFv1
	/CctkgosPUXCWgDBD9gLv66iZFQgeiM+cuGtVMbnoBflkS6rjquO8F3/2Q4pqYKc
	x+UH0n/rMHsvuXld3O9vI+d7TUOv7D5QSlXeEu0P8LztqIFRAtJ8RBS1JEe7RSS/
	81FzD7jboIH/5GbXPhHRY1dQxtWQhiOc1TgJ/njxbVvf6zR6uM6wppb1QdZsKLQe
	uZ0J1OXzQVatEfEZo3YasAecugdrTRI8rmC3z/8Pa7M3bx2BHCGRUnT5LAUK2DMA
	ARN1JF3zV+LQ7LpAGiP+Jv8E5kF6tV1K4X0pWKjTWYs4QoEftsWjOiYvdoIxmWCT
	fq3P8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvr266-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:22:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so493500885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793611342; cv=none;
        d=google.com; s=arc-20260327;
        b=GRDb+XNMzFltI3kbZ/FNPwZyiZ7zBIZ2L4DNKUv9pahfedOYHP88Hl3KP3NOrmLZ+U
         aTyUPASDAA0oCcTaQVPunX0tlXkXz4dFS+NYzNWar1HAlaASnss+Hf4OoQUV2YGLNL+w
         dnskTyNv4XB42EY4YG0Vz/EwhuO2Ha0ydczeTu/Hvlh/2ACt4BKhXxGgBVW9EsRceQzQ
         +8jeQkxNebxYvNhST5gRmfAIUsPVyjkTzFCikmKc9UOUucCaz4XySwFYZPlfSwLdXDHW
         eHt8BR2eUf7fNhhkqlWKRciXkievUgr786R64rGqebhH3bh/7vB6vny1ujIYmHqpmGlf
         alog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        fh=BSNEI48MWC583ZLEvcKU4nbDxpLJs8r+3slNIUUC5WY=;
        b=ZkCNl99M0k+IZicaiCS0lCr6qAq5bbJhjVsp6QdXj0uO4njHWt/3OhIN8MRE/M72+y
         O+opqpww724d1DlsIyXrZr3zkbRlNR1zTSfcPAYptWoxrMRF4XFAkxbNaxr4FfP1cCak
         /U/ngAq9qDhjOg7PJtuS8ZNzmt2Zlj+zWa6MErYdqkR6TXefy2E+LU8UyEH/qBeneQjM
         eJ3xOAYDPmIbwz+2ibULeCw7u1vAZC3XAcTSRND6+/NXXnZ/6WbVraSfGS1iaYu+wtFE
         1b8IXX8T2P8a9E9QEwPdnGJ7AMqSxXDBa0lCPjBFMfr0sVRq9pWXZK8X157+sZTFuDCK
         7X6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611342; x=1794216142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        b=L8IT2CZHstffVikBa2AjgYmHu63nzOMiwE2su0RLMkKHNmzV3el5a7u7vxOVk37lMR
         El6tZoF9IXk8YJ0sVVf0vu6/lUw30QmoZuLY/vv89TXXHnUQp3Op5gitXFrGz25EXsjF
         JhP88VFwvDwY7X1RpkIoiAS8pIqtYxKG2pYkQvqTJlheslNr8eWPkmB6w8JvYl2SbXcy
         Zty3fdBlRUFexXhtMcmIFzCZZLZCbAnZeE7KCW99QDTdxp6+KYzgZPOaNMON5MvZKuCx
         oHs/SsQqwAp5dZuwtpoEjt69j7K0z3lBlrfKt49H3kPUabUPa+kdo6eyUp6kvpLQ/zFx
         NsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611342; x=1794216142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        b=ZsPWq4gUKHxoJeqVKg+j/RavSSZ6/nbw64wSzCAMpwklr0G87cSjsarj2iazDCARW7
         Z5nOdHCPwlPWi7WbpvRlTivpw/yLTJMh4jG66P/rkoXOXm/GAbk5LoSrIFW7/Bq6ALGB
         tScnT8mfD1NYW9nJerYPNwKRaNXKk2okXCxEO7qACSASVeg7vUjM+yserWpf2mtc44QG
         LmS61LpM0nAsn73zBOUJUWDJChQ2wWNG0Yc7daK5RulGbP8z+q4Uf77C2m2NMyB7UVfj
         mCsASvsRzAZ6mCXGEvjyUrMhnNZaejxErZdee5V4px3IGpXOU1MUiv1eEdY3Rrsy6Gsy
         eiSw==
X-Forwarded-Encrypted: i=1; AKwUvByUepnB3UYEL97PR31XGUytjhP8KLdBTJ7N0ZGUC1L45JBE3wLp2KlfG7TsFNN6W8L4EP/4lCTgSNVF23MF@vger.kernel.org
X-Gm-Message-State: AFq9FYL3jePB23pz/Z2Vg7FrFeKcuCti+MM+8/qK/7rbGpCP2YK25VVq
	X4F5hE3QelNSuqvi9AmKTS7swiF9wREn1jMTsktxO7lRFuEqAaacM7Qv7PFbJfLynjXGXgLUpya
	BXfYC1IVUM9CbeBHdf97dZhX6DPvXFegN/l3OpZEdohZ9Chpbh61WiZUI2brnSYByQnb2oClbcC
	7ZlNq2/NPQ/niUpINbkbfiXrgMDhlYdS/MePzHcCCaeLY=
X-Gm-Gg: AYBFou2qA2b97Cq+eA9Rwil+dLZZ6VCRgcKbW2jL0jliATLsxFlc/3CSU6AREBsLpJg
	NxvWNyQW4X1ErYwzsF27x+tIFOhPGhYdRFf10N3tEud8rvsHorM5P6xJTbgvKupHlNwTNIyba6a
	qOSlfJ+wyTzZKDZVECbpwodWtAK09ZJ3BGaEJAeYOkjQS+XBPr9Q7mzyjQjw1nP4WALePzglH9q
	QuGfpiF6kihzJypKNM0O0nf+jaSli4Fmdu/t/AfeCq1WEJSnk36A16csrUs+wwxwmoSdbtRjyM=
X-Received: by 2002:a05:620a:318a:b0:93c:6738:c2c1 with SMTP id af79cd13be357-9442158805dmr1513584485a.2.1793611342317;
        Mon, 02 Nov 2026 01:22:22 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93c:6738:c2c1 with SMTP id
 af79cd13be357-9442158805dmr1513582385a.2.1793611341849; Mon, 02 Nov 2026
 01:22:21 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn> <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:22:10 +0100
X-Gm-Features: AclHuK-lrKv7QKtCbq49GJ8Hz8MVkUY0WCwRGtxP81qzPU50sKw5_37IniqXuGk
Message-ID: <CAFEp6-2PjOg6wJ5SotsdGkkOvqeDHLbZo8w9s746LgfJTnpfvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: camss: video: factor pipeline stream on/off
 into a helper
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8564f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VJ0GMoCyF0DcjFHwqmgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YcGOuGy_rVQTOcBmQ0oercD2r2cahJky
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX+95xX3YmyftS
 ls1Io35OQw6p2R3qlxk+UZEc3f/NqAqSxwW82ZiofF0EIhJwN6Iv5LAjVTOfNzS4clm/8fhBS6K
 mqfZPhDzbQwcPwswfDNgEHhWIYjX7vo=
X-Proofpoint-ORIG-GUID: YcGOuGy_rVQTOcBmQ0oercD2r2cahJky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfXyEiwveS/sr44
 5b/8CWfLL7FozfWewMNwB9o34KWG1SxVd2+GxRmxaHXo2fNhJg0JBsx3eGL51gPXOBwlE2979/u
 FrAjHio5rlH4Z16kyg4sOnZr2XD9SFyYZWUHxSmhi6Tw6QoMuTOqcuamkSAojfw15BrfYGFp9Se
 wpCf88oghzY4AsRCEtdq3ky85Xh3G6biWmXMQejzqzPftciAf+e7MaluDGZHh/KFl4L/5kKqSxJ
 /xNSDQDmtGy0VwMTtDcuOrocNH/l5AWsG4+T6srVYi1LUPMcaMRShGJrntEvmOOV52FNaHt7Irz
 aCxspdX2vWJrGpiyBjpOzFv7RRVnOEkj6eAjVhQ6F3M8Kyl+RHdPbnQk9dAf/oOQlRXp5lZzkfp
 2rEl37PSf5b6b8IGjWJ54trKxJpluwlTGlIdmu/49yqKDLGxRoHhQt2dEIjTF/yzgpHAyh/7+qm
 t3SHLGlJvvbXzJMQ/EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On Sat, Oct 31, 2026 at 5:11=E2=80=AFAM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> When one subdevice fails to start, the ones already started further up th=
e
> pipeline were left streaming, and the next start would try to start them
> again.  video_stop_streaming() returned early on the first subdevice that
> failed to stop, leaving the rest running while the pipeline was torn down=
.
>
> Factor the walk into camss_video_subdevs_set_stream(video, bool), used by
> both start and stop.  A start error now unwinds the partial start by
> disabling the pipeline again; streams already in the requested state repo=
rt
> -EALREADY, so the subdevice that failed to start (never marked enabled) a=
nd
> the ones above it (never started) are left untouched.
>
> Locate each subdevice source pad with
> media_entity_remote_source_pad_unique() instead of assuming pads[0], and
> toggle it with v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams() instead of the legacy .s_stream() call; the
> camss subdevices only implement .s_stream() so the helpers fall back to i=
t.

So the patch looks better now. However, after looking at
media_entity_remote_source_pad_unique(), it appears that it returns an
error when more than one source link is enabled.

This works with the current driver design, but Bryan may want to take
this into account for his pixel-path support series, as the VFE
subdevice could eventually have multiple active source links (for
example, from both CSID and Parameters).

So the change looks good to me, but I'll leave it to Bryan to decide
whether we should merge it as-is or address that future use case now.

Regards,
Loic

>
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 109 +++++++++++-------
>  1 file changed, 65 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13..9a633ca066 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,13 +249,66 @@ static int video_prepare_streaming(struct vb2_queue=
 *q)
>         return ret;
>  }
>
> +/*
> + * camss_video_subdevs_set_stream() - Enable or disable a video pipeline
> + * @video: The video node whose pipeline is toggled
> + * @enable: true to start the subdevices, false to stop them
> + *
> + * Walk the media pipeline upstream from the video node and toggle the s=
tream on
> + * each subdevice.  Each subdevice source pad is located with
> + * media_entity_remote_source_pad_unique() instead of assuming pads[0], =
and the
> + * stream is toggled with v4l2_subdev_enable_streams()/
> + * v4l2_subdev_disable_streams() rather than the legacy .s_stream() call=
.  The
> + * camss subdevices only implement .s_stream(), so the helpers fall back=
 to it.
> + *
> + * A stream that is already in the requested state reports -EALREADY.  O=
n the
> + * teardown path this simply skips subdevices that were never started, s=
o a
> + * partially started pipeline is unwound by disabling it again: the subd=
evice
> + * that failed to start was not marked enabled and is left untouched.  A
> + * subdevice without a streaming operation reports -ENOIOCTLCMD, which i=
s
> + * ignored here to match the previous .s_stream() call sites.
> + *
> + * Return: 0 on success, or the error code of the first subdevice that f=
ailed.
> + */
> +static int camss_video_subdevs_set_stream(struct camss_video *video,
> +                                         bool enable)
> +{
> +       struct media_entity *entity =3D &video->vdev.entity;
> +
> +       while (1) {
> +               struct media_pad *pad;
> +               struct v4l2_subdev *subdev;
> +               int ret;
> +
> +               pad =3D media_entity_remote_source_pad_unique(entity);
> +               if (IS_ERR(pad))
> +                       break;
> +
> +               if (!is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +
> +               subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> +
> +               if (enable)
> +                       ret =3D v4l2_subdev_enable_streams(subdev, pad->i=
ndex,
> +                                                        BIT_ULL(0));
> +               else
> +                       ret =3D v4l2_subdev_disable_streams(subdev, pad->=
index,
> +                                                         BIT_ULL(0));
> +
> +               if (ret && ret !=3D -EALREADY && ret !=3D -ENOIOCTLCMD)
> +                       return ret;
> +
> +               entity =3D pad->entity;
> +       }
> +
> +       return 0;
> +}
> +
>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
>         int ret;
>
>         ret =3D video_device_pipeline_alloc_start(vdev);
> @@ -268,22 +321,11 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>         if (ret < 0)
>                 goto error;
>
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
> -               ret =3D v4l2_subdev_call(subdev, video, s_stream, 1);
> -               if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> -                       goto error;
> +       ret =3D camss_video_subdevs_set_stream(video, true);
> +       if (ret < 0) {
> +               camss_video_subdevs_set_stream(video, false);
> +               dev_err(video->camss->dev, "Video pipeline start failed: =
%d\n", ret);
> +               goto error;
>         }
>
>         return 0;
> @@ -300,34 +342,13 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>  static void video_stop_streaming(struct vb2_queue *q)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> -       struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
>         int ret;
>
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
> +       ret =3D camss_video_subdevs_set_stream(video, false);
> +       if (ret < 0)
> +               dev_err(video->camss->dev, "Video pipeline stop failed: %=
d\n", ret);
>
> -       video_device_pipeline_stop(vdev);
> +       video_device_pipeline_stop(&video->vdev);
>
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
> --
> 2.53.0
>
