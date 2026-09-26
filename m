Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC091624DF
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790448041; cv=pass; b=u9bfnDDwnxf+zpzaqTJ871u4VuJDhjPsZN4UHd5C65wZdrsh56jXopLHprjYZra80CYlkrcTcOD8jsOkX1Sb6d59u09SJSbOSThPluV28iApO38mL01ceY9VPseQmE71D+ppuIBXF11K+HUme9RoKl6JnSl28GAUGEiP1ONy92M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790448041; c=relaxed/simple;
	bh=M3nlaT3i7/r69WEHgeWcSxub1p1lj3ONSOirpahJcBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7I8ZwCYHEbbAbKMsXbEVVQcuQdYFdEyODH9HYQZe2asaACw9Csrx3VnSfy4VwQsDvxUXgHKbhEStaTYejGOCCRfSqYwyPlbdKHcpAOUBJsr65TZfQnP/Z0qqbIGiYIH4bS3RsMaQbjz3y7f1DM4W8YNvpBLqGXlYAZN9hT3qXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTVklCbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0P8pxQj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTVklCbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0P8pxQj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQnA3793104
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=; b=gT
	VklCbLGlsR8PPgLyl9EewSUX+gASolwObCNZrmi2lje0j7Wsezgk9/3vYoPbR2tr
	WYTvbP4Pvl6AOrTnmwSWuIyEvUAIqGUHC2uBzwAssVg1Tczc21eLWUrhTQEj/LvJ
	ijNtU+D+Q4u2SmHcaAXm7Bpjj6aoM/gf/9fYmqN1X+nRYoPn5NI3JE9tGM7i1dFS
	uv/AcW7t1WXQS5tk5ts0XB/YLBRjGpCaE1+4E1B5bGPSykVyxIiI56FsX6PK4r8O
	zmrOwgFb4vW+A1w60cX8fU5awfqi+S6kKtUuHvEBlWhjfrtCsbZdgtdjYJXgmnwj
	rw4PO3AUGXOg8tTY3X1w==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9sbq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:40:39 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-48296f34f1dso2127338fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 11:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790448039; cv=none;
        d=google.com; s=arc-20260327;
        b=CqNGtkOnYGmP/nBwSQLo2ONzpcT+yR/W9UMynR+LfpGAX8Ft0N5r4sAqyQuq175FR/
         z82E1H1CL61OEN8RbUozvoumkhO5ya30ZcI8hxDE6pXo5j5je1mz1HQImLMYawtv8/hJ
         QGJB1N41EUhzfiTv6gCCQ5zLB15+QkhK7itoSUQz/vifdto24lMA6Haz3f8+g+BlIEXN
         jdaijbus12c7a3lEzQ+idNn0dbCt4joQylaCa5SP/ioaUb/0xlTAE4m+CngsN2HVz1Ms
         eqpKriX410Jf2Eh2j4k+Y1ujeC57q2H6ssQw2HoOcbqR/CCAzRL9GkWl+NQg0/eF051P
         5yVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        fh=4TGGwoed8uXAOtSqFJoq7cJBDOC+ZiHWubFTplLKbRE=;
        b=MNgddbyS7Pk6nxfr5wUnyhJYc8JlDRmcL/1I+aWtwgk6AFdEYpPtD1a2NinC+46uSS
         Lz6IPTRvG14FTGLn5oz1Ox3Q5oNJbzhGOUOUdRd5T1UhQMiYhEHA0UkKtRGuMW2Ju+6Q
         Q7DYXVI/KGCY7nvkKcKUZCTOmWwG5UyW5N+G9HNQibFZa10a7g7RHKEha7cblZA3zyuP
         iakyiQNKvlfdvoW1ItlNHzUoQ4JNI1p0i29RWaOb+B8LTUOK0I1aR31eTS+S4M/nB3p0
         /tupFOg1hvdk3ly+xDudQXhT+kqlcu2wQXZRFvAS+WFizdVtwwJejZmwALL6Jc63YYGq
         jlLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790448039; x=1791052839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        b=Z0P8pxQj07Q0eU89tIDWxmP/hhURy89ZLXGMJluie4qRG925jxODHTDizYhGaX/y5d
         pREXhH4v9+8vYCsz0ME/WosaHjTr9uqljQf1gQrki3nPwNggugfDTz0F6rGUumvX5jl2
         bLLX1efv4uaKNVIFzcuWdyZcBB2uJkuFYuxJyoy6z+22DL6inTnDP9ag3usj7wzOh7Jg
         doi64JY1A+eDcoJ0bCQxgn3TSxvrX/DjV2eb7AxzRq2n/q0xF1iM5kNnzpIV1wLXtfX7
         gRcygto1ptDBiN6zscVFnVNx9QMUqvxfprAwY2CTwoZT5y/IXa3fstQfkbt03KeK8s3K
         JIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790448039; x=1791052839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        b=mAVQNtYlLmB/iDPC8y3rt3iKdQNaa1qNHBTeuKjxxsNhUG2BMbZzUf/YxKPSmvjguU
         Ifv7ebw/IBn37s2yw87nrWtAQdPTPCy1U2pJZ7jFcxTkXBTFfyrO11qz07bB6WYqpn70
         +iNzyQdpyQu2aHpGsRkhoM3bL7vsBCRiUB6uwcH/snnz/L0p06UzPV/F6TI36N7qeN+n
         qVYblHQcNycuw5M/OxVDtCwMaS/8rYE3MxoaNCalB7glL4tRo3p0YN6+WhGNbY2JmF2C
         lWadW1f3b0etV+ld1wDfb5Vj+6NMeH5Z9it6/DtBCIQyOx9gNEKJiL3jf9prf2Wf05Ze
         ScSg==
X-Forwarded-Encrypted: i=1; AKwUvBwltGyPKZBahbvCsvfERan904gzauojPCEEiSEAgOLihDkEMoJ1IhG8NCF8d3In+aS1rzBRbh30kKJDa+kc@vger.kernel.org
X-Gm-Message-State: AFq9FYIpJ1me9UOpOIDsARgB99/vUR/qZsrc2KHh+NwKrPB0B+NwOGIn
	qiH0CeWaCraNIveLxmBVGKD0/lFZbWw27+4vfk66xMLz2Vajbw8I3SCqyjCJ19cHHrCEQ7lNxcB
	5YwT/MlhOs+TpnmDh2oK04IX93VqbWx8THQK3xEFcjzZtvAYmdqm45ajdGFWuZ3Hk0DQT+0UWcM
	TuNjZE7DxFGU+V0J5BbbmFI8UDCDhqWPN0RXIwsO4dVPLxN0bfBRGk9A==
X-Gm-Gg: AYBFou1Vau0tBgKxJnTNdDIJ2EWQkfdTmm4gFqVR1m+z8eL7f9l63ECAPw4IMEkbuIQ
	PW+oCNOIKNhZzilsfBgOpby+i/pzX5+ByvUaTjYmAuYHwnu/wBrIuVXj5arQACkwTIM7g3bA41u
	oEm3PY0D/kvzUbDEn31HXTaWoUCwAQTnKyDuUkKinI+V8UJ2mp6DNVt4Ne
X-Received: by 2002:a05:6870:658f:b0:490:ccdf:1931 with SMTP id 586e51a60fabf-491e79675e6mr7629110fac.55.1790448038814;
        Sat, 26 Sep 2026 11:40:38 -0700 (PDT)
X-Received: by 2002:a05:6870:658f:b0:490:ccdf:1931 with SMTP id
 586e51a60fabf-491e79675e6mr7629097fac.55.1790448038374; Sat, 26 Sep 2026
 11:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
In-Reply-To: <20260926022026.10539-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:40:27 -0700
X-Gm-Features: AclHuK8ym8-acg312rqWr-pMv-9ORiLGe39RqXxyk_EMaZQOc4Be3_B5fffQ3PQ
Message-ID: <CACSVV00iE210xVONVT+XpuqmCn6E_RBrtBW2KkAB5YRP5DuZiA@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX8xXWKza+8BbW
 i5ViTmwUthPLQN2Y/SQdHOsiQERgTLdpNSPoTheqg9NNIPWWhc7tZmUeBLeEvJWITYV4V9L1QlH
 C1TQ9T2s0SQViXtnaopvOwssMRzg9GM=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab811a7 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=KKAkSRfTAAAA:8 a=tFjpUJO89rSOa1QXy2UA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Rp8FT9u8KEPtJuaOCvIdnvYHHLwGCCdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX2JzDTwA3d8Fu
 yyUAJ+IrivKUHCkHrhw/iq1FoA7QjSjQ9dvM/taDK+gCR/apnuKHNnCfEpkMJxi+k/tjBYMEZwy
 Jx/ceFd5/6eOAy5BxyRzIlcd6rkcViSxnRl5JvildOwxCCWi8AUIyP63Vb6Oa3rCdqByM+FQ68z
 zJdhzfiKnKQtMT95o419VkAKqdqnCua7ti+DgQL+AwuqAvFgZMbPZCnunRzzoouStowgJUB2zvp
 CR7zr7gTjSIlpdLEm6QcIwk1SroESD2A6OsRxTY5LoRXzgLdXYFYrAbc3n+cmgwzBuADzyUrdSd
 E4k/0aMWDfe6441VSTxBN/ticz3oELBt4qeftSevH3eSmqJ4mjglrCEPZqyJnTvZx2cjgURZElC
 49C6MTe8Ii2nQ+GesrzwVZhAft15SgJpeZ52SLE9XtGdWGKq/5MaNsv9KFrclx00CBsy0wVO6bL
 y+Eou/A6Sg35sP9KXNQ==
X-Proofpoint-ORIG-GUID: Rp8FT9u8KEPtJuaOCvIdnvYHHLwGCCdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260074

On Fri, Sep 25, 2026 at 7:20=E2=80=AFPM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> This reverts commit 143755bdabaa96776c24f878014608e9cb44f930.
>
> That commit fixed a dangling reference in the DMABUF_DEBUG default
> and thereby enabled the option - and with it the page-stripping
> sg_table wrapper that dma_buf_map_attachment() hands to importers -
> on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> kernel.
>
> drm/msm is broken by the wrapper.  Both of msm's map paths consume
> sg->length and sg_phys() of the attachment sg_table:
> msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> zeroes sg->length and strips the page pointers, so mappings of
> imported dma-bufs silently map nothing, and userspace observes
> arm-smmu translation faults from UCHE, e.g. during hardware video
> decode (clapper, chromium) on Adreno systems:
>
>   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DREAD
>   type=3DTRANSLATION source=3DUCHE
>
> Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> v7.3-rc4 bad, culprit 143755bdabaa9.
>
> Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> either: those fields are only valid for sg_tables that msm has
> dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> are not, so the conversion needs more work.  The msm maintainer has
> therefore requested restoring the previous default for v7.3, to be
> revisited once msm no longer consumes struct page and sg->length of
> imported sg_tables.

I sent a series[1] to remove the remaining (direct) use of pages for
imported dma-bufs, and remove use of drm_prime_sg_to_page_array() (so
one less caller of the deprecated function).

This on its own won't solve the problems with CONFIG_DMABUF_DEBUG.
There is still the indirect dependency on pages when mapping sgt's.  I
won't have time to work on that until after XDC, so it won't be a v7.3
thing, and _probably_ won't be a v7.4 thing at this point.  But
hopefully I can come up with something for v7.5.  Until then, please
apply this revert.

BR,
-R

[1] https://patchwork.freedesktop.org/series/175045/

> Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liujian=
feng1994@gmail.com/
> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Karl Mehltretter <kmehltretter@gmail.com>
>
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4f078a326a41..7efc0f0d07126 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,7 +43,7 @@ config UDMABUF
>  config DMABUF_DEBUG
>         bool "DMA-BUF debug checks"
>         depends on DMA_SHARED_BUFFER
> -       default y if DEBUG_KERNEL
> +       default y if DEBUG
>         help
>           This option enables additional checks for DMA-BUF importers and
>           exporters. Specifically it validates that importers do not peek=
 at the
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> branch: revert-dmabuf-debug-for-7.3
>
> --
> 2.47.3
>
