Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169049D58A
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594519; cv=pass; b=t4fKSxBTbNdxzTXHNvnH2+JIJECazEeVUSw+KJI5z6KUFkAec0Tq8gXw8HsH9XicQOMm+uUS8BlfMNDIS8FC1CGPfz5CxswGNyYMrBrbEIF7yCo+DEwjwzznI2wvFz1Cmfb1dsBc0udNW4Nl+ESiE9q/jCgM4QejSRZxvMhvJJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594519; c=relaxed/simple;
	bh=Ocd9zXXDgFZ+AJQPS0jBNgJx6ox6aU5Dl7QmVCaZbwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFzJiCiDrHTGfMvsX6WgiFTW8fg0t2hhV5c0sJDJYFhGh6ZbGiv9v/5zk1reHDqjlHFMUNMrCvn+SNQ4XTmFB6YAURSeNZlzyEolsi4ACrtt03Er2OaO4lKvTejg1YRkRGTTPs/2knSA1NjOup/KV6jwBxHDm6QcbkEOZMGVUDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ce7c9O47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JToNP96K; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ce7c9O47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JToNP96K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA7Tp481580
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=; b=ce
	7c9O47R9GFrf2ufQeGLAslfvXpcTqCG+8Hf7/gz0tgFPwUvUitVHwn2oG2jcRdVX
	P1yBiO91/Co8apRbEwazCRUPcXwmK6ohEvpMijxp/dzEg3r2EXLB5MKVYyDiWb16
	0kszagorsBZDn/qVYBsknXcitxsksB2PK5Rj0WCz8n9oNTIM9aIxs/leeOCOnPcK
	clzHlmw0xoyYrXmCKkggJZsN1tBvBu2J6Ye08K5HJ68WzwVJUyjveY/9mOjV6hKb
	NZcxyUsBdrvhYK8fID8WeCx6wZB7I4TBCwZCt/e/mcf+4Ufb7NWS5Fxhyrx2kwBD
	AoRJBJnrPHzdXRETckZg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt1142r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:21:53 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6d953e6645bso725336eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 04:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594513; cv=none;
        d=google.com; s=arc-20260327;
        b=syYZrvw/GWvqVoLKZhZ3QTUJ6fGSwd74/kGhMaazs6Eex2bLgnEGPK/CxMRBqJhn+5
         LHbbN1AT8RRC7ZvTOYZWeuAanDdTG6DRSjCwTATRLIpMmp0feoF4c9bnPOXKJPcq1DcO
         k0nrvXnYORxfzWXLtaP2RZC+BRw6+lV/lbuhWIiJ5Qjk8JRVLWYqhvyqGpCVQTSLT/Ok
         l+synjEvQxXh5lZYVG4Nq+JC7dbTjbxNGr/jjR4MOJzFCHGOtJWCqDbezMLw5W3XskaJ
         yiY8cFW/h1tfbMNVmsbclhK2lXUEeMGPr/lcpUxhDzdipUvIqxMU5tGVJkcC1vcx9LyI
         fHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        fh=zKU1wZTpdeG55Vghhcxpu/s9C91Ac3Sp5mGP8cBBjiY=;
        b=qrnqeMUgV8yrRWoh7RsX/LG8/W/NR5gOh/TVZ8xBKqmmDO6Y+q9QnEctckNEkNfrgI
         40WozmUsP1ar9zWVFV8YJDCLxlILaO5YJM4hBM3zReJ9ryiVniKQSOCZ0/LCeDa4aAYD
         kidDmCnAarUhMwgXA2Vdo8AEM9aos44wykPxb4bfw2PZt9VT/psdBfbcz/TqZqcxDscQ
         TUpf8RJKQmVR4RVigTN0h6QrYrR4Oba7nUEpNy0OSI/rGFupVJ36cKi9ftg4nimZ2UiP
         XqMnBlzb9sNq1Cqa8/+6RY7eYYm20hiJIaY/3uCHFhX5LdwWzoJJXrzy5WfRGj/p7jfH
         YHEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790594513; x=1791199313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        b=JToNP96KhFdTw3mOwrNg52zSHijm2vE3xckBuk3H+toWAbyafZU0FnR/EQxDExVSPU
         kksozqz33ok7Hml+wLchCaKk9BiSlIYDnV3max5sAPc02oTXN7EQEjosfUhwwuXt5ggZ
         xXFG4Ewwif23hZao13+WkFK+lvm5sb0ZOzniBCFRe6XJOQ+b4LkXFPDYjjHhwxhUyw6O
         MJStz7vR15Fn8viDI9gKeMF0oeBggmvg3JH2vEToDkz/ClzWyrHwmozt2z6kxCGXGBwc
         IBkIkU0zuiT214pEdj01qHVfUolMZ88g2kEcz0UED33LuiyWLALaSBsziFSRGw0XbPLT
         PuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594513; x=1791199313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        b=zaEqtD3MsE2hdobFlx3Pqciy96RMQ+L33KVhcYTs7fAIHxDKgO0G9Qu5faBF6rWVxy
         Skk2CLAp/pR30aaADbqaUNCgWakzNwGdfOwmMvHzTXp1EIj58RdHqDXRRnCgY1IkH/NO
         a6X/tfhKg38TcjXNc/04my0PoAhMbHxzUg7rywQyhKgpAeUgbpZCcAzmCpu7lRz6K04n
         mniv/vrvzrqla4DMxARXb4vLbmTg/zO+TQo0mi9L7f3CxEkpbkerRZfVxfi6ucOzvpDD
         rmbPaBww6HWsgCDzoCp0ISkQbmoXpmSH6Mr8Dhw2IMhUlxf0Bx0Z19R7+loFff0dOgNh
         rNag==
X-Forwarded-Encrypted: i=1; AKwUvBw2fdfKuaEzUr0IsnNeu4gmIwVqo/csvSCo2pt4noKJoR9VjEap+df97mEX6NrIUyZ8GyEYS6rByD5lpudp@vger.kernel.org
X-Gm-Message-State: AFuF++lpfwGqc2+NChcbz3H6SWMvjPaBbdsbt6XAZocpqmn7Aj25eMUq
	twOvZ0p84J/TM6/bO/DDshcTrYiYwTgDeuuSsoeTLHA0Npfl8r61wLPhyyD59Y62px+WO/R62UM
	CAjV1R+YOoMCRiGgSzM5+K3OxrG4AS4/+SXwomNty0V7Sw+IZ45fJmD7kLtiaEqIk4AHcvnDfoW
	wh6JcxO/bYC9GFTffbZgCcnja+jyatPFUP4IxAx9Kb6P4=
X-Gm-Gg: AYBFou2cZ/BUXm+S004iK7X3JfoYYOK1eK71rqG3TfZXAgQ2BhDcLvXnT962ULZmcO9
	imR5u226xPcT3BMWx4tuLM5r/L7aAtdCPVMl2+J/uTjcQorls34ijwvZp/KFn1/ol+u5cLb+8QX
	fk+nfa1N9hp56GpeDsQn4siHoj7XvckZk0JnxZghveApUqp9ToIwtAwdsS
X-Received: by 2002:a05:6820:859b:10b0:6d7:4142:8b78 with SMTP id 006d021491bc7-6d741428fe0mr3459528eaf.6.1790594512834;
        Mon, 28 Sep 2026 04:21:52 -0700 (PDT)
X-Received: by 2002:a05:6820:859b:10b0:6d7:4142:8b78 with SMTP id
 006d021491bc7-6d741428fe0mr3459516eaf.6.1790594512410; Mon, 28 Sep 2026
 04:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
 <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com> <CACSVV02WCQwQy9BpUUqziQTtKV7QyJruiM+iTiLE_SEVKtpVNQ@mail.gmail.com>
 <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
In-Reply-To: <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 04:21:41 -0700
X-Gm-Features: AclHuK_NwDQDsbrMuZGC8NlkccTPkeI6CyUHvdugPvoIb7ACoIyYXlrPqpyu7j4
Message-ID: <CACSVV02BPHGeGFo0vs8-Q2JvcvQ_gw_xe4kZj_nuzk8n6sW7kg@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfXyRcldYKhCffc
 crZrL/V1aqBpn28vJXWT2J0RF4KmZsOQFu/ellmTBlNB6Xwwr7mequ824fMcmPQ/5BPc8FjQ62B
 uOn4giWBouAzL+JMN7Wc53KOkX/BmYud+lbeiRgmkTSCsI1g4le6opVIF6roA38NoLukApGsbhD
 NXYbS9hORbobTbfPwNHtqcaG3TxD3rwO7rjaU9BPtUySNh3FtiCgcgurDHorHjNgFUJMPCfAI2X
 Z05/l+ogwi8Pe/d+6VAMHklVMNkFCultG4VqdWf9i+hkcgJV32JhYk3SHj2n8LsW1oeJV2NVTxP
 8Rhh/pKO2Sknkg9/vRigfUr6gmx5FYXXydyEjvPTESZZCIEnutyXu9uFOIdEM7BLZNi2qlTtdA8
 B8DVAtLHyD/6HPv7KXZoEJdABTK+qMLRBTiSW7JI6VTCTJC4tkfUsnmbDV66fbKHa694ageaR2+
 sVm5tnakltNd0NrSOiw==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba4dd1 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jDRU7hdYw16n41J9DU8A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: D-3L-ZoGkpOEeKTaTrZRK-zhm6YbZVOs
X-Proofpoint-GUID: D-3L-ZoGkpOEeKTaTrZRK-zhm6YbZVOs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfXxUVZodX1HUk9
 VXhMSLN2x8cb52uv9xohpo9G18ij42teGPlKJ5jZE3XWj0AIkMR5bzKY0fom7o6Z56sCgqxO/rv
 mejWMhjV3JC5p3A6qgfCF91sUCCmW3A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280045

On Mon, Sep 28, 2026 at 3:48=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/28/26 12:36, Rob Clark wrote:
> > On Mon, Sep 28, 2026 at 1:19=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 9/26/26 04:20, Jianfeng Liu wrote:
> >>> That commit fixed a dangling reference in the DMABUF_DEBUG default
> >>> and thereby enabled the option - and with it the page-stripping
> >>> sg_table wrapper that dma_buf_map_attachment() hands to importers -
> >>> on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> >>> kernel.
> >>>
> >>> drm/msm is broken by the wrapper.  Both of msm's map paths consume
> >>> sg->length and sg_phys() of the attachment sg_table:
> >>> msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> >>> iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> >>> zeroes sg->length and strips the page pointers, so mappings of
> >>> imported dma-bufs silently map nothing, and userspace observes
> >>> arm-smmu translation faults from UCHE, e.g. during hardware video
> >>> decode (clapper, chromium) on Adreno systems:
> >>>
> >>>   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DR=
EAD
> >>>   type=3DTRANSLATION source=3DUCHE
> >>>
> >>> Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> >>> v7.3-rc4 bad, culprit 143755bdabaa9.
> >>>
> >>> Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> >>> either: those fields are only valid for sg_tables that msm has
> >>> dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> >>> are not, so the conversion needs more work.  The msm maintainer has
> >>> therefore requested restoring the previous default for v7.3, to be
> >>> revisited once msm no longer consumes struct page and sg->length of
> >>> imported sg_tables.
> >>
> >> Yeah as I said before the problematic part is MSM here. We have enforc=
ed correct driver behavior for over 5 years now when that option is enabled=
.
> >
> > The problem is bigger than MSM here
>
> Well, so far I have only heard about MSM.
>
> But yes I mean the config option is doing exactly what it is supposed to =
do, pointing out when driver need some work to get this fixed.

It served its purpose, to expose some bigger issues.. but sadly those
are beyond just msm and not something that can be fixed quickly

> I also agree that we shouldn't have allowed driver to touch that stuff in=
 the first place and better document how to do things but yeah I can't chan=
ge the past I can only try to fix it now.
>
> >> What we can do is to mark MSM as broken and/or give a warning in MSM w=
hen DMABUF_DEBUG is enabled and you try to import a DMA-buf.
> >
> > sorry, no, we can't mark MSM as broken.. we can mark DMABUF_DEBUG as BR=
OKEN
>
> As I wrote the debug functionality to enforce not using struct pages has =
been around for over 5 years now, it was just not enabled by default.
>
> What I can offer is to set it to default N for another few month to give =
you more time to fix things.

If it is disabled by default in distro kernels, that sounds fine.
I've cleaned up the remaining use of pages in msm (which were not load
bearing, but I should have done before to remove use of
drm_prime_sg_to_page_array()), but the problems extend further and is
a bit complicated because the hw uses SSMU in a way that dma-mapping
doesn't consider very well.

BR,
-R


> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> But making the check not default to enable on debug kernels is not an =
option. This check here is exactly to point out broken drivers and you can =
manually disable it.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liu=
jianfeng1994@gmail.com/
> >>> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: Karl Mehltretter <kmehltretter@gmail.com>
> >>>
> >>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>> ---
> >>>
> >>>  drivers/dma-buf/Kconfig | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> >>> index e4f078a326a41..7efc0f0d07126 100644
> >>> --- a/drivers/dma-buf/Kconfig
> >>> +++ b/drivers/dma-buf/Kconfig
> >>> @@ -43,7 +43,7 @@ config UDMABUF
> >>>  config DMABUF_DEBUG
> >>>       bool "DMA-BUF debug checks"
> >>>       depends on DMA_SHARED_BUFFER
> >>> -     default y if DEBUG_KERNEL
> >>> +     default y if DEBUG
> >>>       help
> >>>         This option enables additional checks for DMA-BUF importers a=
nd
> >>>         exporters. Specifically it validates that importers do not pe=
ek at the
> >>> ---
> >>> base-commit: 93f51579e7df248780214094418f205253383cc5
> >>> branch: revert-dmabuf-debug-for-7.3
> >>>
> >>
>
