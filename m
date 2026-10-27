Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113549;
	b=3DNYjXiet9U9xvDCwSfnlY/PqMIlr6qjCIBnpmIyh0kSaUrVxvQVigrJXAp7CvyIlQ6E
	 NaLa6CWSszxDpQM5ftzDBQssrVRMft1cx80PDzsijri2Rwzq768oRBb+pKeJwP5nbvRXv
	 l5YhSGBo4JSUhdN9lIaVuVZ26YZiwFLajwq1DePjbWEy+oVu5fovHR3aYeIAophYHdZCl
	 kBjJECOXoZB8ElyzbELZKZUuUHB5du4JBhHNyUK+qhJSO6MT65jevSKiprSXFLK3NVxO1
	 vG2gXXoSiSFwex3hFBzH3ant7pD4doxb3WHEeNt07zYpxR3uPvmpaNVcYLzHpKoYYrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
	b=H+IrfCc0Gw7Na5rpEXM8HtevtgmVpv13uf4l1ta1MaGTmElLirFWfbF7B0q6Smeq8RoV
	 AkODyh+LCD1rreO3aeoEJegNyRgIRm2wCw1tk/Tfh5qF/5I7HyMuvNxRPtoGrVM4X0nVC
	 D5yCt3ygmnNwqboJutBl+CcZlsb6adNEfhNmQCzdW56/Nix1cKyNfxOvCAIMFzIaKTbvn
	 Z2dnxO+TP6aa1V+9qtPSiLtlGYwtiYkpfzM69PUeS9kPXoHoPz7uwhSbH91tvfgLTJa0l
	 KLR5MpslWcKpWUlbt0WnEsEAYtWYQJqmMJVIL1FGD5+T5XuBaDHitDegMepQ124oa2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBLzQzOB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwEMMlMk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C88606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBLzQzOB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwEMMlMk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo20g2344348
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=; b=IB
	LzQzOBvSr6BEXk9yS9uMGnDZRQPwqxR2DPOfoP6G7c23HwmoH0DfgD4EfGnniGGZ
	WpGX6AC3dkpJdnc1aOZucGgeUVCnpI+JjPgGnPR3Jpipvj9JdRKOGDNnEMcPE1jD
	nVvRwRBnyMQcqfHS5OJe+Nr7nim7g9Wc80XiCGzeqD0hHlGPd/G3+aUFOGhenAUa
	RQA6oEe/hDUM1NsnOawqpgatrA5WOEJxqMoMMsTu2ueXl30VDSucSZ/CkbTGYU7T
	LzllvnaPLz0o8ySJjvdcTlfVcTkTF+ss6WYZzRFq5bsktaLoO99TGikwasm7CZZc
	1yR4n5ftJdmTr5yfgNhQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69hdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:05:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so7239089eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113546; cv=none;
        d=google.com; s=arc-20260327;
        b=bsRlIMJgt4JfcJpceoTsPrQu0JxNM56UoJwPZ7KUrHgE2ShY54VAO3MfNO3aMtvLTh
         ZRdhaIhE9eKrOPkfHL9O2rImFSUd7t3jo+UTBX9hBRPstTy1i4fmPVlBYuuM3ZhXG4Pd
         OpjVH75lJW0QImm6GfmcxGCgiA65Dy8CSc+SnEU3oIK2Sj9Sz3S+s4peluPjVlkgmiM7
         TelHaNoTxiFjL4T37wMB1hFAmiyqaWDLS5EMzC6ME5CnUHfGJtEX8TqXHxzjtlq5QGH6
         awTwxU06s68xhb7kscGndWR5oBPN7bYU9W55/+YT7ZntaPQG9hQx1roPRXaZpTp5wwEH
         Ef3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
        fh=Y6xNyoeipidnEr7oF4jUppy8XNrM68nHVkWz1kdoN7U=;
        b=DRnTB5o2PAZENYdACW5Q3zmWR7S81er5KIxD8+2YxDjwfBZATRlfjBcbvT0VSPCGCr
         HX6goL/NkyhR89LnQJXkjKpSH3OkkgOf/dHZJIAQdOP9Ebjoms7lIqGxIhSvSiO/eaDs
         zXIQ2pasOLTscahuD9baOl5t6Z3rFA9ggY1aulP+oDCE9YSXahMoUfQDNUzlbWL9HK6k
         BMeYgOFPANKYtT9jKNmpy0MHl1wdB9jH2Y6qDLBl4SfOBAHrKs7ksYvljPoZfCzcn/fy
         0WV6OJgciHfH89PFfVVgLt7VmT69+Cg3XvquTpWQFP2eFkqPimmXqyQkEepd3tsUznEB
         HOjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793113546; x=1793718346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
        b=BwEMMlMk2MIKw8ilFy3F1YAkGKIeiJwhpTnnnsGfpJKY+HafPncuSCkunikEh8sgD3
         HFsI2yZXnMwg9g9qFmkJWeKl9YyrowAb+mKz5mAr5du3JBxgA8dZyJ0p57AeLVn5wlXm
         ZGU+JAEykIzI2kNhmZroSvHsWr/v9yNipulbjxPcOF9lvVv6Lzu53Mhvf+18MFwQaYDb
         exBtsK1qwqHaEutS6vXWHf/nunMW74KLkDmf48tGQej3nYqIwJWHYRiDKoqBgXfX7QP1
         +Avcah5Ebe3ai8DmoaItziVYsCKdeFEGvSvy2YTJIW9N3l7RcADTKcjJrvsiusZ0B+PA
         70ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113546; x=1793718346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
        b=DyFgfyyz0fz9SZjjVgFKGqfkpIgFq5zYGRWbEZsjIB9tw2CHeXBnIJ3bI+XAG8/j38
         6+rUmU4WE/P/wKAGLTDnso8md08bQXdE895AQ+d7Lsx7CQzaX1/7amB9YkRR4pjQTEun
         cQBUtr1Oh3bWmHbcv/HzZqCW2EJz07bBfurSsIjp7em2kBhNqtC6jcnngMt+mve6KuRV
         FjPPV0mtNaeSN/vTBjEcbEMLfrOmKmz09DSpXrCDVoZ89yW5F3BIEkGV7QCgUCCTn97k
         trKYm0q3IMYyPyyB9HXPGzL2/uGelHx1i92kPS97AfbTw0B7x0uOhsBIaiMy724wW19p
         on0w==
X-Forwarded-Encrypted: i=1; AKwUvBx/MwywQntd+bfniF1pn75rLD7BZxOYmznCQS4uShAWE4BQEqzR1GOpFg4tQYyR1qzwwLzUTM4G9URPy8Wb@vger.kernel.org
X-Gm-Message-State: AFq9FYIa/EkSujYEpf2reIMikZNASJzILCEOzH9oG6msMWaMrtgIGcmN
	zSF8MSWsLDDfc0rau/gZ5Fm05OwQDyzb8AFLk93k40Pht4mU60y0VqJFTN6c+ObeIwpRKv1giyw
	d7GeCM7G1Th/+7/8jm3/zN1/4TNtxSRg8GifG9RqnGsCiAU9OLpoyk4KroBHJsFGCL0AbttU3P2
	GKng2AE5vo5KrLRj5dbQpCdsoxm8NvjTfPL7i45SFixMc=
X-Gm-Gg: AYBFou088rjv3uw7UhoS6v+ChxTS+a1qFmBOYTCunc6/Ea7xHchxWIeBzEboZA9S+Ly
	znLnjWxUmrlXcY4x7Vs6BA1V6aOgLwpeaHz/tnNjhDlPLVTOg8cKd+3nY/Rbps9QbSmvtZMvcRE
	P4QNhtggQ75s78ijLW/1lfgpTi4Gm+CtWCwTA/3tYBkwlCu2XHY6xKtlehrg==
X-Received: by 2002:a05:7022:7f06:b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-19935be807amr14865953c88.19.1793113545475;
        Tue, 27 Oct 2026 08:05:45 -0700 (PDT)
X-Received: by 2002:a05:7022:7f06:b0:18a:d0b5:fa42 with SMTP id
 a92af1059eb24-19935be807amr14865912c88.19.1793113544807; Tue, 27 Oct 2026
 08:05:44 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027141430.20258-1-robin.clark@oss.qualcomm.com> <2dc67d8c-f406-44e9-bf54-12704a8792de@oss.qualcomm.com>
In-Reply-To: <2dc67d8c-f406-44e9-bf54-12704a8792de@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 08:05:33 -0700
X-Gm-Features: AclHuK8pDkPsUbP5zSTLlPCMG5M5jT8vFmaBsciIzHEhLjQPlBsATNz3gAReJ9Y
Message-ID: <CACSVV00VNNWaQ7Y7PrzHeQ+n=E_mh430+OFGmQN5+F_B66Jz8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/gem: Add some cleanup.h
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Bart Van Assche <bvanassche@acm.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0bdca cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=xJAUt8zhRqVQzByVXjkA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ND6DknUqUNAIzv38D6gI-DARLK6HBhIm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MCBTYWx0ZWRfX5uQuDZ6HFKTP
 ueMxExQeNp/y9CkJ1wvtzfNS2NvRVoWdh26RE0pzt7ekWQqdKMtG0f5F/O97kbkfz0KfwR5sxCQ
 2xkM0lDtIwAbWlM7vy0UsZbp9pNwx88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MCBTYWx0ZWRfX058rZDvsOkGg
 kQ4fSSRl/J5VHBzXcRvR4EhpqEVs/BGPw2WMgA1wqnfMBnT3IirmBfdfv2EvkKzfacBpXz1Irak
 Dcn7pX8XeFW7aj1L7xDAX+jnbT7/jG2Sf8qCuwaTa96W6/+Q1xuYs47rRMs6afi17ayF34CoVJ2
 rfQ1bT3uMQ2zgwrY7mbygyVz479wxe9JUHputyjG33lXytTXIgtTwkHW9I1nidUirj8R9FnWze1
 8M8yrf7IIWb4pN1+snxeqUgiscCBbjEOfBJbrK03zQvvzg9rCyJUSvICvsZsG7VoRqUKCuBcBmC
 jY440y6/Sfapi3wLSorJ3b0h49QYvZRwfW8MP+cjeDkb0jlSqzz6BAD14deVRY7rlIs50kiWj8n
 BxRUc9cGrX5MVOAti9B9jxU0904yUwMKUxvd2OxBTvtWXdawiYAw8hH2bAfg8E1iDvSjHCpYMut
 W4d9O+3THYxcS8MfGHQ==
X-Proofpoint-ORIG-GUID: ND6DknUqUNAIzv38D6gI-DARLK6HBhIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270060

+ peterz for scoped_cond_guard() question at the bottom

On Tue, Oct 27, 2026 at 7:24=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/27/26 3:14 PM, Rob Clark wrote:
> > Convert (most of) the msm_gem_lock() and friends over to scope based
> > cleanup.
> >
> > Other than fixing a lock leak in msm_ioctl_gem_info_set_metadata() ther=
e
> > should be no functional change.

oh, I meant to drop the 2nd para, since it is no longer true after
rebasing on Bart's fix

> [...]
>
>
> > @@ -608,26 +600,20 @@ static int msm_ioctl_gem_info_get_metadata(struct=
 drm_gem_object *obj,
> >               return 0;
> >       }
> >
> > -     ret =3D msm_gem_lock_interruptible(obj);
> > -     if (ret)
> > -             return ret;
>
> LLM is a bit grumpy since this no longer returns all of the return
> codes that it can but I think it doesn't matter

It is a bit odd that scoped_cond_guard() doesn't seem to have "proper"
access to the original return code.. I think I could do:

    scoped_cond_guard (gem_lock_intr, return PTR_ERR(scope.lock), obj)

not sure if that is an evil hack or not?

I've added peterz, if he has an opinion

BR,
-R

> There's a couple of single-line-scopes we could shave off but any
> which way
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
