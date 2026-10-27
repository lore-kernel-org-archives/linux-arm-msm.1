Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099170;
	b=kmeWRI/wVyydPLLir9CC9c6zmuhNrGaVEwRydbG1YVYKtW0LNCxxuRnSG/qACpQHimxG
	 BHKIzXUWnDfFeThcF8Er6uE/kEthAthByYxTooC/giQzUZU4OkiiVRD/zRDfjkqVlUHzt
	 CxZGO6j2Dr2UUKfDyZ3QMG1IICkWc2ACfzKBm7ZeGX2I8FHUnVadwwpGhJkkJeBiqRDpM
	 fyu+BkfPL37yYMQM9wgHMcc6ozi+VKa5azO97CW0sPSEKAdcrKUCVxyBvze+re+S6OxaV
	 aBXzPDp3VUQpgANDKW2yP/K0m4ODEtEZvcnOXtdwZoQ/yWcN8wMMNh8QKVVlPB1rVJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=;
	b=bV76+5h3Gjd1Er1YvXZtHPiUDrLnEXDB+gblUKp0gfIWwng2NJrgyKadFgz3/Ymbc/Kd
	 P6d3HxOtWfq33dBq64ACtMSRmB+ZxKImU6KgwxtfbeqXkRCLa7z/CQPPb0Lj4mB8457O+
	 Lx4vCjMc28daxv+ZkFjQ6KJPya43B6feNLspVdD2DsZUXoUIeQ+xcj3rUYXcgq1IMp0LE
	 5zx9RRvEveJd8OAMyegX8tFTLkOfSkUxW02rBBnQbQIbsNLoS1yVWQjR76qlfySe71TjJ
	 PPE1irSb0OPkUiedAMx3Fc3VUGj2rjPzS7SBw1Ye2H9SIJfc2d+i0N711p6pl3GL3Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGeU6VH+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UniBw6lV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED2606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBED2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGeU6VH+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UniBw6lV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeD601615077
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=; b=WGeU6VH+oHYBNPf7
	0Ij+Cxgo2XNvYPf+VLXcpOpPN2fUSuGYLGKC7jjXf9ujHoTB0J7pTH1b2l9AK+h2
	ymZTBqCAy60wzTmwLuzyaKLKMBu0rEJfAnJV4igTynzjEFS+iHcrrcYq2xiJS2im
	AukZyKxr6fiszdE28FPrBCqOtWOEWogV1vvRNA+GL23aHgJEgkTiwwnKkM9tjUvS
	Ei8Ev0bhF+dpQ89uxH5yNw+ZC5TKGx9xdeUhObayvni3oFD8EeIUKU3B5l9FS5hC
	IsEJCKh1AtDF49KEoKKv86QJceB5ZnKumMn1n60KyNeoRh2w6zCAdx0NoE34l/Wz
	nVcs1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5ru9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:06:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bfa915da7cso779929137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099167; x=1793703967; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=;
        b=UniBw6lVpQFU+I8Xsa9rgKS0Tui2RvKLJfjY3/VnmLXwp3lJ/J/PHl1LBNlZsZAKAB
         ixhr6GOw1z1eNatMqh9Y/q0DxP2YHTto3mHh9cSFEG67WKFThjC1UHd29RAJULmgWHuj
         VUK8vvxMHNyWdz8+enBM7lPzsev0MAzoVbRQnczlcZ4nisHd13f5hTMB3ijAH4+pi1cS
         CjPH4fUQrXJwZ/chOCcM7eK8wCYkHiI5qgdc5PEoXjV5DDOOdcVwq/Ig9D0wZ8ucUQoJ
         BP91A9LKvYLBBel86BMnYbq2UEp/sb2Yy6Rk1pxTg7qpuFBGY+8L8wQGwgkBOa/9ZF6w
         X76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099167; x=1793703967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=;
        b=OdSCSGrCwpo/7Efun1f4C4tWRCCXeTZ0o9zy90CkqT6ThMzL62oGJnfmuTPs2eWzMi
         Used4++yc+HQ3qnRdLXZfj9nfR87FYSl+QAz5vFJ6YkrtrfmBuGj4ahlgNtlAXudSGKX
         XPC4842mvya336o0vMvMQo3BwFxYBml4/RpUJLHokO+3h6oHtwIH0g43vgz4YMbVgGPo
         aMdEMUbpWew2WSBFzCD563eYrYUaec7YAM318a08qLeJjNl/tRGlu7a1QiRwE6kNQ2UJ
         +lAcRsrye4dbgn8LY/i5L3hPo1Ym1X4o0k8UEe6wOf5BHdJEtUPubSUbUhP8sjwPr/Ev
         l3zA==
X-Forwarded-Encrypted: i=1; AKwUvBz4htArL7Q1jc39JkdbbG/RLeuUnxJkHS+couVOwBfpojPKyY4d+S99a09R5sQBb51sPXeNLfbVGvVvp5ws@vger.kernel.org
X-Gm-Message-State: AFq9FYJVFdJuKoPPY0Q3pVp4Ds1L2/bVfibKqJ29y0hKq1fb1nO2e5vO
	QGFPkhbSLSjOf5ukvkjagQ0h6rtXwNAd8knajJacVIHtKJ5wQIKQFUrllTsK7ZwytB59Ul7+JxJ
	2b+8JCDhxoCaU+Szv8ppvzE4y/JdQNHz7d84SdbhxvZWSXbC4iYvFWzuPP+sq0VlsKnoc
X-Gm-Gg: AYBFou1ZNU4N/gWtk0JphEHVSJQMcdIRXnh2FeNFiixmjNreuQuoxCj8WeAuTLsX4ts
	UkcdkvmLyOfnMK3BUybxEzkGEencTofhNVeWyxor7ebQ8RBjxxFqgoX2vStveDukak5HlmKmh0z
	AJuilwqmrlJXISyHvZvYd3suRS19tfCE5yv6qp9j1aFdttJqJmB5WpeDEbzq/KcSt/zrxqgdB1x
	0fr0FQkR4OJlfNCYyC1/9byLpFfckwndRSoQxNaoD+Ytc45/DjIOHz7ZQWeWvI7KPumTCefDtHO
	MBGR/lq9Rj0TTq3/pnF3A4al1TDVZ1gBrG0gRz7y9SBIykLALqfRdNTOYwOoGUsqAwutr4VvOcO
	OVJ31B0KKgADSkstDrUxq/k9+LlzQchU5RgBPUmJ4guInpT+H+CDM7Bp9NvZEroyXjuInOfR3Zr
	lJxhguZXwJ6hhO
X-Received: by 2002:a05:6102:2910:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7cea1474628mr693715137.15.1793099167059;
        Tue, 27 Oct 2026 04:06:07 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7cea1474628mr693707137.15.1793099166585;
        Tue, 27 Oct 2026 04:06:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm2034967e87.81.2026.10.27.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:06:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:06:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on
 handle close
Message-ID: <xa6erwmfju7xmrsmg3vsafwhdhwvyqqwjsgq35hb4ecoiwffau@r2fb6ft223vl>
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
 <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
 <CACSVV00sJmmRqpTJUD4AfB5-LJRCtzdWDTKVCQwH+y-uYYYMbg@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00sJmmRqpTJUD4AfB5-LJRCtzdWDTKVCQwH+y-uYYYMbg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX2gc/fhuKsLEm
 UwtBYhLDBjpfVOO+KK0uU2fn4hkzbDIGfOYGwwh+naD5wknmqRVduM33xDo+OZIC2rFIUtT2Md5
 +YyD33wXJ9NlwYS+Mr1niJy2bKqOXAw=
X-Proofpoint-ORIG-GUID: 21k3Mb1Ry_7a8AqblB9CRvH9lFQM38Kf
X-Proofpoint-GUID: 21k3Mb1Ry_7a8AqblB9CRvH9lFQM38Kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX6zSDkPlgTTtg
 kL3IixmM0S2pJi4kJd+RP+9k+N/zHvWwgr3qqBEYVnnz2qMJFQXekw2qllb0Yg8GGwhBQMddBEN
 PDVrjIHvR0KQTjHUyoexhaWYSvUpKIzVkWn7yLjmzE9Dxr4BR2hIlyngx7Vt65JDvXwPMG1X/dq
 8GGkVrjQ/VB9gQWBIp2H+rKYdbjmmJO2PGZR7s+8HYCJIWEzPptKaeMkRFMRKDhFvJuBszQQSh1
 nTHFFRbTiyCXu6bckVC3TiRi74/ca11yKare0R2hVyltXG/h/7tw3Jr3bDKgEMHxd0JnrXN6TYR
 6QYm6JQL+vBBYUF4GENwG6SspLf8rJBdd+P2TLU0LylBV9zO4FY3Bav111yiZ6Jvn5amJo7NC0z
 QMWll1KGj97UW7ykmy4y1fUdJyX4PAmQ1hbB4npqupUMrdFL+YrsgxALO9q8ryRgpxWN3cUd11E
 eGxS91ZCORYtHTN2Q1A==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0859f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=g5l33MZIfMJ3XeZK2UMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On Mon, Oct 05, 2026 at 07:54:32AM -0700, Rob Clark wrote:
> On Sat, Aug 22, 2026 at 1:49 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On targets (like A530 / MSM8996) without per-process pgtables
> > msm_gpu_create_private_vm() uses the global VM, so all DRM files share
> > one GPU address space.  msm_gem_close() unmaps the object from ctx->vm,
> > which on those targets pulls the buffer out from under every other file
> > that still has it open, and frees the iova for immediate reuse.
> >
> > A dma-buf imported into a second file hits this as soon as the exporter
> > closes its handle: the importer's texture keeps sampling the old
> > address, which the next allocation has taken over.  On a530 this is
> > every ext_image_dma_buf_import sampling test, reading back all zeros.
> >
> > The VMA teardown a shared VM needs is the one already used for kms->vm
> > -- defer it to the @vma_ref drop, when the last handle and dma_buf
> > reference are gone.  That restores the pre-drm_gpuvm lifetime without
> > reintroducing the reference loop, since a BO with a live vma_ref is held
> > by userspace anyway.
> >
> > Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 13 ++++++++++++-
> >  drivers/gpu/drm/msm/msm_gpu.c |  4 +++-
> >  drivers/gpu/drm/msm/msm_gpu.h |  3 +++
> >  3 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index d27d54bdb7a7..7722776e9129 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -223,6 +223,9 @@ struct msm_gpu {
> >
> >         struct drm_gpuvm *vm;
> >
> > +       /** @vm_shared: Has @vm been handed out as a context VM? */
> > +       bool vm_shared;
> 
> nit, this seems unnecessary, just check if vm == gpu->vm

msm_gem_close() already checks if ctx->vm == priv->gpu->vm, but most
msm_gem_vma_put() callers have no ctx: the last put often comes from
msm_gem_dmabuf_release() or the fb cleanup. The teardown can't be
skipped there either, as the VMA would keep the BO alive. The extra bool
looks like the easist way to determine if the driver used a per-context
VM or if there was a fallback to gpu->vm.


-- 
With best wishes
Dmitry
