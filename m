Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794603462;
	b=yuITPLM+giS2O7JX05aIE3saEZz/97/B5qbL+hD5Lubmh0ykpqMbJl62jaCwF7/8CLNR
	 TuJOx7P1nQhun0btF5yUuEQmNszZxvFdQGRt9z3Vq/lSla7appRrmhJKGD4PJKad+K54H
	 rrazjYd1lNMQvMnb8io6eLEfyIy51wNDvMZ/Ik/dPKQ5hQyVyIcFvujPU36t3s5sWPTsl
	 xd0WP5w3OTh+kjrejmJ5nIJ+IAItOKBYcpk0gbTJjX7Bsc7tRMhS0ZL0M2m1gujCbb5Te
	 xsoVzjV1y+HyNxIfKsqlvEBi9WN0V7BYcS+AB3sr9w+IRfLPLRffg1azhBIsbZWCMMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
	b=LW+yVIvLTZlVFyXe2GTyl9NDcoOxcuLoAnZlx2c9fWXxMlaJNnw1TAxN1VfvkU81cMTD
	 pxij9PreGZrCyVXbirPUhRRpWk8PRwklfJpUkbH/0XuZ5Yign85HsrRfk3HZiBx10U1bR
	 bLTr8USc7BiyDsTqy/GNapQ0FF/xKjqekgqt5sOXijmI1n9lXiP3vncywsiFg0X7Gr37r
	 6tuuBk5gnXYEOI+SIFaw59oL6IGv+BGw7BiE3vva3hwr7gt3kqavO8VIygP3Es7SAayh9
	 gbhqDeOyBpAAqfYKHSLjdVtJPEQDu9Wvdyun9cOCSasQ6hXyor+H1J1frZPnGjsMg5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPxoMAm3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDwOiQjA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF533606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF533606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPxoMAm3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDwOiQjA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADKK8G52488262
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=; b=kP
	xoMAm3fRcab0Kbk51q7FFn55FiBzUAuq1i5LTeraB3kt5X7hl082HPDW2K/ysaQr
	0UQDcgmQNy0tZrXKp+GRNtOyXhxton+tKQr49RTofpYJlo6Hh261BFJJTbchT3uK
	3jORqMhpI2wrcwm3qBIfogD6LU9X/uZ7MjyBK6lXQwqKyqABXHo+9paBhRzjT8DT
	l5dwdbg5rW4+lK4laMPlcLjvv92jAqy36oW0JCQdt4BFiYXWpn+juKHEJpq04qid
	cAeIcZTriI9CN/ZvNrA5iflxqaCXhYCOjKaZHacS0bjv4XS8hpEV47Avcz+xWT3N
	IDQWlre0rJ68+dYmEtZw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpa6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:57:39 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e6091d8a1so927155fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794603459; cv=none;
        d=google.com; s=arc-20260327;
        b=B/JYti+8H6SwioMWiddy4jSSmB4qPEQZNnELdNTLCf9raIzIUD5VqQUWJ5wQ0m6fsW
         YB1/UmDVCWOtckxx+yplAjUxDSGNRwCusLLVXqVz61ta2nG+G4QRNKx5A6xIYtfAIsrQ
         rJJhLCpowFHgQg1pcm+2cSWJsr2G9Wqxd2k9GZvarflSJaKkmrFP/TAZoksiQMkSEpKE
         hs6EZp8P/8J+g/a7u048Ki6pLepoltwXKm0SG9d4iT2Ds0FgpGWoiNJzB0xgnX8218a8
         FJuCHnYZrD49pli5iAM76cmYcjIUH50ZunlsJOGfUJYe5Tg+6wPHhSAspajW7vkkdjQo
         C+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
        fh=HkC0XM2eh8zlJCHD51EIadvnObm3CEeozucAO3NJXGQ=;
        b=QDB7HB1VnY/dplBFe3b2cw/9xNeTh5/cAtzJlI5l52qlvY36V2Yla3+vU1bhc6QFlo
         HGQ66hGsLfwdk2fM7HYrPKJBTSAK7cJOfz2YcocrJGfqBLSmKjNF3mrMK+Eh3UUl/j/a
         65bYzZ71dMbk3QCX90aOCcfnns9AnF3m253JL+d2PwL1D+kFBZAnqHSqVQpXicZzLDNH
         0TzHFD9sIFHdwv6sZ8MugqN5HHc8A6Z1ngS9C1psSvsYU4Uu9iWnAmyoEXjdN/uAUwcp
         5oFRertnA7LtbW1udfksOKZ1xC5lOi5DOu0hTlzPmO/+3YoevKjwKvcdB6jObZb5qhcm
         SKbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794603459; x=1795208259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
        b=dDwOiQjAM3MumHTLrkCM6jJxrWxigXxBzUClX20Wnfnd8Oo9+7SBF8IaFJVjLW1V78
         W5WW+qdJshnHsGPS+voEMl854eTmMMqSqvIYdPjQCeGu+h3//GrsAOM6Vx107rXH47Ym
         Ys/kHGaCXfFngeWphAgyeXYbYiyPvH+lSDoPh5oq1UxKTTlHnxsKbqVmrz9A5WoZghEn
         QZq82nHy5Kbmslk8KF9DzYJTTog8cHNiJarhRXm+HzeHfB8x/a7LSHOsC0W2mLVHb+U2
         rn4IV3jKd95j85rMD8tMHM9uFWoorx8dRswKUJvD4pynma5akB6tzTaCtGXq5fRp+wiW
         W4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603459; x=1795208259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
        b=gjbUQebxwcnNH/0qy2pRPE17T1EEPsvgPtFgTH5Fi8QgcEWfIPXS/zA9ihvBGWeLC5
         eVgpTOll1p3lti96Yh7wEdrr2dGXYd7IsolMwjujAaUS4qy5KhF52b0vUYhR4Q/Q8zIl
         1hk1KJWYU83/f8RKfUAkkXS0WznsweE2M7c7dDNRPjeOViRioL9vS0DWBpBrXVw3bmLu
         Q65lqnP74+Ggqr7699oAsw1AbGtyi7JTxSMJ4E1UvtC9A+VakGfvW3s4bobv7PlcnSKX
         op+quZ6x2SEX37Sv0AU6TrmtH5sMXmcJmdeu45E/4trbjwmGCyj1MNF+oxkgdQnfdnPo
         QcFg==
X-Forwarded-Encrypted: i=1; AL+hErEwhgY8NJXhefINtSpZDDkNIAaUhM4NfkY7+PMVRAyobYJGKW3bpqwivZcJNqnYt908J5LCdiAEA/1n5NjT@vger.kernel.org
X-Gm-Message-State: APuU4Z/pRZSDtlnr3H8h/svmq9OFqv8Uhat3SRNqV23tcmk8Be71m/N5
	ppJf6cEHIKIM2PDaGjGyE9CdkxHxgboUZc2ZZ8TnqvWk7ertwjf/5EZG1xk1CP1ymQkMgDZWoMf
	X1b2UQya8ICshD3MMPJrgS/mRNflZHZMipKXMYMcicHnjoRRsvaAIORUzwtY4C+9AL/Ucb4qECN
	jINZAoXvm6j1h+DQTp6lZuSHnY21Yl7KAJytdVofLWrAc=
X-Gm-Gg: AYBFou20Z5U4WvGdKtgfEDbKaMNFVOfCGrR8vFT0qzuEZO2ubDN8Iv/cGOY7uTr6BAy
	P+ZO8VHVRGUUNLZE8EoJCdiHbo60ae3jXGhxAVU0wTd3KqkCZtFOhLrzBhBrsxvXI6SoFwNfOoa
	COj5ACrhbidJL0BtwRw8CEtoLWKKv9xtkfwKrqKk27jU90xYI/gAKfzWWTL+W9P2hbwjuNomTK0
	eGhJU5N7v6duyTqIri/7w==
X-Received: by 2002:a05:6871:c914:b0:48f:e0e5:a1e0 with SMTP id 586e51a60fabf-4afdf794eb8mr3593196fac.53.1794603458855;
        Fri, 13 Nov 2026 12:57:38 -0800 (PST)
X-Received: by 2002:a05:6871:c914:b0:48f:e0e5:a1e0 with SMTP id
 586e51a60fabf-4afdf794eb8mr3593161fac.53.1794603458363; Fri, 13 Nov 2026
 12:57:38 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111080619.244138-1-julius@bairaktaris.de>
In-Reply-To: <20261111080619.244138-1-julius@bairaktaris.de>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:57:27 -0800
X-Gm-Features: AclHuK_jF12LGFMbl51Qw0skLNEfDBLsQfwj20MZJcl3WZZN4mMk_QEMp0swbqM
Message-ID: <CACSVV01-U9jEOfKsO8fgGtG_xQqjOF4TAKycJnqp4E-eDqsC2g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Keep objects of queued VM_BIND unmaps busy
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af779c3 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=SXJYvs3pGg1A0ozdNicA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: Vh4Sr9Bc3NE1KPBWEVQBH1OqLuvSuMpw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4MyBTYWx0ZWRfX5EruKsUCpgem
 go9C/2BnNd9G6JXLqfMf4IQyyM/C+T+WimiwoJvEf7q8ytMr7m2i5wFKtOGAPB6gIFBxjidUgj1
 ye3ZZI6HdZ96Iov4jpBohxF6ogdd8ko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MyBTYWx0ZWRfX6J5tWVlDpH35
 1oUdbqVLV36U457pTyHGCUy8bpo3oLAS6zLBWKZHtfxeoA4NL+N0dF1HY0ehreOXYW3h9bQWjcr
 EX3eGsSJNTo0wkfEowB/imp7g2lLYCRfls4CEMW3dzd7+4p6xIDGYJbHYJN03eOXQYaJGAA5r1X
 mYIXRT1O2NNYsngmXZ2vrXw6m/6wOYieoO5P2OjYwN2vJUGldUjSD6nbh3Q6fvpRlJxpOCLyADI
 LM/wmsdmvk7DYJtSBiSnsb5ggw1ow3id43ORkvKscOunJlMwwYsAlHa4OgVFMgY/rbnHtBAslbX
 ZoWwgPU0dvOaLioJqEd68xbrRhQ6gZpkjPL7zHEVrrcZmkI3K8XMS179VNG0thA60wzaZZmbB0X
 cVkqIIJll0m9PL5dJWuD+jGqTFkaccPyw4J35kGoVSo6t1HOLD7IT0R+ln0UWMgMEObC+wkgCq+
 5MkOtQcIZNZ1Mrtlshw==
X-Proofpoint-ORIG-GUID: Vh4Sr9Bc3NE1KPBWEVQBH1OqLuvSuMpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130083

On Wed, Nov 11, 2026 at 12:06=E2=80=AFAM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> A VM_BIND UNMAP closes the VMA when the ioctl runs, but the pgtable
> entries stay until the bind job runs vm_unmap_op(), and the job can wait
> on a caller-supplied in-fence for as long as the caller likes. In that
> window the unmapped object holds neither a pin nor the job fence:
> vm_bind_job_pin_objects() and vm_bind_job_attach_fences() only cover the
> objects named in the userspace ops, and an UNMAP op names none. The
> shrinker then sees an idle object and purges or evicts it, and
> put_iova_spaces() no longer finds the closed VMA, so the GPU keeps a
> mapping of pages that are freed and reused. The unmap half of a remap
> and a MAP that replaces a mapping take the same path.
>
> Reserve a fence slot on the object when an UNMAP op is queued, and add
> the job fence to it along with the fences of the mapped objects, so the
> shrinker treats the object as busy until the job has run.

Nice catch.. I don't really love that it means we can evict mapped
buffers but not ones pending unmap.  But so far I don't really see any
better option.

(Small note, a dma_fence should fire in a finite amount of time, or
TDR should kick in on the signaling side.  That ofc doesn't change the
issue here.)

BR,
-R

> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> I used Claude (Anthropic) to help write this patch.
>
>  drivers/gpu/drm/msm/msm_gem_vma.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 8b702422030af..d12df7e42fce8 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -473,7 +473,17 @@ struct op_arg {
>  static int
>  vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
>  {
> -       struct msm_vm_op *op =3D kmalloc_obj(*op);
> +       struct msm_vm_op *op;
> +
> +       /* Slot for the job fence, see vm_bind_job_attach_fences(): */
> +       if (_op.op =3D=3D MSM_VM_OP_UNMAP && _op.obj) {
> +               int ret =3D dma_resv_reserve_fences(_op.obj->resv, 1);
> +
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       op =3D kmalloc_obj(*op);
>         if (!op)
>                 return -ENOMEM;
>
> @@ -1419,6 +1429,8 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>  static void
>  vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
>  {
> +       struct msm_vm_op *op;
> +
>         for (unsigned i =3D 0; i < job->nr_ops; i++) {
>                 struct drm_gem_object *obj =3D job->ops[i].obj;
>
> @@ -1428,6 +1440,17 @@ vm_bind_job_attach_fences(struct msm_vm_bind_job *=
job)
>                 dma_resv_add_fence(obj->resv, job->fence,
>                                    DMA_RESV_USAGE_KERNEL);
>         }
> +
> +       /*
> +        * The VMAs of unmapped objects are already closed, so the shrink=
er
> +        * no longer sees the mapping.  Keep the objects busy until the j=
ob
> +        * has removed it from the pgtables.
> +        */
> +       list_for_each_entry(op, &job->vm_ops, node) {
> +               if (op->op =3D=3D MSM_VM_OP_UNMAP && op->obj)
> +                       dma_resv_add_fence(op->obj->resv, job->fence,
> +                                          DMA_RESV_USAGE_KERNEL);
> +       }
>  }
>
>  int
>
> base-commit: 1e59855738454b14021b64115f0090eafc7526ae
> --
> 2.53.0
>
