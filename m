Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB454BD360
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388497; cv=pass; b=Gl/83lAErS46yIi4DdC4EqGBCio8A0rWXuba4boAIhqrxLYgreOvKy6gDvSDWc1q9JLaS/NWxzDHfhS9NCYped7GkjGQ0rjqx87kx9ddyEgMVVDOYGszm+8SFUGA0VJ/zXgVYsB9/2/UuZ17eEO2DBwrLArE4VlpZk00y4p73Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388497; c=relaxed/simple;
	bh=pwJa8BaFaUlr/o3p+oE/Sl8mnLDMJHG38kHTjzu4gVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhIwWJXI1lE9dlAJM2oUNNBUwyyqPzukyK0qrm7WiLWo0uoDrnG1/uHyQp4K2YKJKm5U+nW96FFsFxmH+2A9Ig7A5YzWbngOPikE3F3DYPgddCY7+C2nTj4ejesdguAu9lpz2c+21vAgtDYlop2Npp6iZd/4f5ysybw9Trx+Ap4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pklZAV+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbgri3oO; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pklZAV+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbgri3oO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtNwG1059955
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 15:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=; b=pk
	lZAV+eC/gcSTolOMNnBZPjxvRmtcGRUSGVmNasznAiJhX6oInpKlXD1fMtOlvzDm
	pbjnlVgWTH/8MVvpk2Awu8dUejQFLHhHl3T1KbylyysniMO9IMnrq1dYrlkOzeaA
	Aaq4cip4T7hjTIYqyOMUA2tBkNX/nbR7VtM9P4Ejb6ADG5Gp+ljLK1r2qfHB96g/
	VBWp6MFqGHUuf63KJkxeiGryQWkok7o0XZgPo8EEdla3laHofYP2HC/rEUUZsKc1
	PE1TBsPCAqzVdzkrTE0rYZUvcCa6WDezLY8zIcekxyeAZGiqpSEK/UvbsnDgubZ6
	N4jcJXtvoRZKq4a7at3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc5a8wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 15:54:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so6117985eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791388489; cv=none;
        d=google.com; s=arc-20260327;
        b=MtT/3LzwPTRD+WI4wZhw4xkQrWEHgCREboy770eXDHkLsUllK9ZqbvK85TDTKzKnBt
         7zKLcqGrVIBsbNdBPgE7Q41D0GXOPos1z6+KcwsUNTHFpTZd0msa7AImfPefL7I3oYqF
         90VC6BWZjioOKrPVVix+TEkL/bNtHowl2cZAgouay00zRO+zyh3GK/S0NOwD0mZgvU/L
         wN9YMyqcQg5gFxX/25hLf1zRd2eWe5EsOjaaY6sa7Y/zZORtbDPQDKbQIV2JRD9ob9w5
         ENKSA+njCTCrUB0KuPIiiNG3ASdz+jdCys370wBHhYFn2lTCYZMDp5EDJO59Az9bxrlK
         Tkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        fh=/OG42caDZDZvgsKnQ444DkvhG7j5wiyzFRhsRilGF1s=;
        b=dNR2dwzs3pYo9ZhYsBlqznemK5XgS72CtpgfMl5wORtmBcWBcSNqUkrZacB7UEL25X
         q4v3kiv3tvtQLRrdg1LCzB3u5kikcSE5eAUq6Z9iervGEEKHJ+Vrb7jQ0OpyS7ZcAMas
         UOs4MJVQNqIZCX3vsmhoKS9V3IvwK3w5iFRPxr0h0N5dUTiqVBL/vPp7XOJZrAjOnQtT
         6kGAKmQfTlIWcrJ+dm0JKSHJr0YEjQVdXf16igkCvZ9XUE8o66Dh0CAI6zIFat66xwH+
         ZjxjA2DUF2e0rVfLTGwQ8rX6v0ZGKSXf+SpjB4H19gheYWtYHSx9+nJ76yTvwuowztDG
         ookg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388489; x=1791993289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        b=jbgri3oO/4UaExQgXcbVabk8bnsLeA0GT7TvTWBLPOtxsQjglp/GYRw41hdcWr4z0F
         RuUQbewkOcm+TmXVZt5+7D+2eTDOwzyVbf4x6VAqNz0GWNA1taB1jwin0tJCDGx2JT8G
         nveV1K8FF96wrmgTXNevZzYENNaVrHGdxKHKlTYSVJtEzP9S8kCX8bolXi/DCjPz+Yf8
         RqQl1bBxhfETb1hBxeXKDyJzZ6GzL9OeX0RT7/C/jcOIqS/wEjycFMoQab9Gg2UhFSTA
         oiwJIz51E+fRzGRJpXQrFYmTYQ/WbyEiPWFUrajmLUSFBYjCwxhAYQ/vwwqNVxf1GFN6
         mdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388489; x=1791993289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        b=AZLxhwRRWx8PlNafTy/CJ0cQc1SCIM6qTQU81+iyfjdqZC6jb+CaHSGLuWOa1Ez8CW
         wuhFVHFjxs/CCBjHY6X3sZLqzlDgNPq56DJf1LaBLAMr46AA+Oy8Fdu8a453ffo86DNh
         aOtNCqwEw4zxixqPkw/pVe/6pJDLvNvn+il3Buw0PNNvnIW/TjiRv/NDMWFLF/IB2pjh
         zeyjfVEfnvlT+Ml4PREZFKY6WrvENw3a8kVihRFx0dLUZKWmXCgRIk99WfrLoH4FnG/a
         RcSqnJ+jX2mT8FdblY0KN8Z+xgB2GSvoRbtAv+BYnlp1f4EL5VGVgc/nnUPPR1v62xey
         eRbw==
X-Forwarded-Encrypted: i=1; AKwUvBwkE11cxH/bUWrI9THm2NbWreTUCSDiIE2qGeAvX3YGPvXnN2FeyHN1m0pJFD4lGCluDm0h8Ltq7+VIkySB@vger.kernel.org
X-Gm-Message-State: AFuF++nZifAInJu229sp69231RqnIiLoj7LrZWaqTiPkN8dHiUxwsRvW
	wolvEgVxa0UUhSPDHrVfxGr4nxAtIhY6lzZw1dB7HXlNFFj03peytx4D9O10rUJbAiLNfeWJpuL
	4aw1CVVCVIhcFppcXxdoEN97uujhY5BLidXCGMkrXgIc5ozI3jqr9tFD8nzeX8hmLhvL+ve7Rkl
	+h7oBWOKxiE+LISfaOS77suA9va/MclaQZ/kjtMFTY+Tw=
X-Gm-Gg: AYBFou0Jap7vhyKIIZ8tepSUg03b0wO409iAqtzt3COfOhHBsoR57HsV0fUZuPVfuWS
	rqQ42To+0Q+3FObxiOZsZmaPBxtl0q3Byajrq2IQHyTOWWnbeXgqSs4XfdE6+JdlHbxEeP/QWvI
	4Goh4r61i346Iz0ANzgF0wV4TGARf8EHqy9qNNOrO6aG4x7LYl78mRmh/K
X-Received: by 2002:a05:701b:2806:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-162044bf3f0mr2885602c88.7.1791388488620;
        Wed, 07 Oct 2026 08:54:48 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:14d:c7ae:85dd with SMTP id
 a92af1059eb24-162044bf3f0mr2885557c88.7.1791388488032; Wed, 07 Oct 2026
 08:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261007131543.7634-1-liujianfeng1994@gmail.com>
In-Reply-To: <20261007131543.7634-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:54:36 -0700
X-Gm-Features: AclHuK9GXc0-XXuEkvshyXJ-4VCucnnUec19JgkYED6meMWxaPoMrc6_lJWUEQc
Message-ID: <CACSVV03imsi930GwjSHwAAb0D7wAAmUpbkPRzQwYThfb+A58kw@mail.gmail.com>
Subject: Re: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: abelvesa@kernel.org, abhinav.kumar@linux.dev, acelan.kao@canonical.com,
        airlied@gmail.com, akuchynski@chromium.org, bleung@chromium.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, jesszhan0024@gmail.com,
        johan@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        pooja.katiyar@intel.com, sean@poorly.run, simona@ffwll.ch,
        yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX5Bj4MUtnlxUr
 4wrstQqBW3bqjeM59IOurj2M5wl2AVQMb1rsmAFIzgcIdVXXH2XItAJ/wqmAqz2mI/cUoeOKQLf
 QCH7Sos0gpKiNSY/s+Jz5S16mqDjq80=
X-Proofpoint-GUID: 4BeZytmmMlGV6B1RNMu_noEL1dr6YK02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX0jkcxuf3ZFN2
 ZcgcCrjzZhkEdDA8qIVVvKkIlkQV7XszVV3Yc0k8OO5aM9I9ugVVMgXOm6lmyx9uXDEQFJ2npRx
 YUVFgs0jAZmJ8TZ7WY9clthdWWmPB+wRKjKihSmeXVh9vzGAqfTTTLIF3yKbLIeUAWaaM0fJslD
 30BcXjZfOoRtcQ7AHfFOpKYXV3J6GclX8Fagp5iBQiSoB0yO8GNR9yVEC9tDDj3byLLcT+x2SNN
 ZB2bbBCC+OU9NR84cNM/lUog6x5IjDxlv79B59r++4avQlE3I5Zg2Il+yDJo/6w32gVZFw2QJPX
 MszN/jC2nuIukNb2P7le5rhC6zRjRSjiBafQG5zLu3yQivR0v4xJWMPEy1TpYsyqJkXNyXlr9qS
 Slll24dA01nygggnOnXe408QTw7gikV7VoA+pXpn4fb61Y1c13T4OyLySKIVIGV6/5ngMX74U+T
 9x+4EzuWWYDwmBoSLIQ==
X-Proofpoint-ORIG-GUID: 4BeZytmmMlGV6B1RNMu_noEL1dr6YK02
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac66b4e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=dfe0JtAcDOuVnXIYvJMA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070063

On Wed, Oct 7, 2026 at 6:16=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail.=
com> wrote:
>
> Hi Rob,
>
> On Tue, Oct 6, 2026 at 6:09 AM Rob Clark wrote:
> > With DMABUF_DEBUG=3Dy, the page information is stripped from the sgt th=
at
> > we get for an externally allocated buffer that is dma-buf imported (as
> > opposed to an exported GEM buffer that is re-imported). [...]
>
> Tested on the machine that originally reported the breakage - this
> exercises exactly the externally-allocated-buffer case from your cover
> letter:
>
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer
>   SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=3Dy
>
> Hardware video decode in chromium (V4L2 decoder capture buffers from
> videobuf2-dma-contig imported into msm and rendered by the GPU)
> displays correctly, with zero arm-smmu faults and zero io-pgtable
> WARNs.  For comparison, on plain v7.3-rc5 with DMABUF_DEBUG=3Dy the
> same workload logs UCHE translation faults and a __arm_lpae_unmap()
> WARN storm (~470 traces per minute of playback).
>
> This is also much cleaner than the translation-based approach in the
> follow-up series I withdrew - mapping from the DMA addresses is where
> I should have ended up in the first place.
>
> One small suggestion for __do_map(): panthor treats "map_pages()
> mapped nothing" as an error (panthor_mmu.c):
>
>         /* If nothing was mapped, consider it an ENOMEM. */
>         if (!ret && !mapped)
>                 ret =3D -ENOMEM;

Yeah, that is probably a good idea.

Thanks for testing

BR,
-R

>
> With the DMA fields now populated on both paths this should not
> trigger in practice, but it would turn any future regression back
> into a loud failure instead of a silent empty mapping - which is
> the failure mode this whole series fixes.
>
> Happy to run more (heap-exported dmabuf import test, kmssink scanout
> of V4L2 frames) on any revision.
>
> BR,
> Jianfeng
