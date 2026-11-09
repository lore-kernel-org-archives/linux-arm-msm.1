Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264332;
	b=5Ruqn4kaq/z3hCt2YvILzZuohWjZYe9AgL9cSUOFpPoi2avRCQBIHNVV2VOjQocZehhd
	 8jQQUT4g4e4HWG2mchadJliNsVSTOShZvBM37S+pDveS5SX/KDaOvhdD2Yg37XyOtW/cr
	 XnuAI8ih1O30dvHbgvkE0ZIRV4xQf2Jy8OC8FyDVddgnfs/ICvg+GZ+BkMCsdqiZgZRBV
	 m3nPiFoQ2asDMijUJKdoqzcBqwfKhGq6OMYHcRGDqtEEmvhmUXp83FSUEZHeYQ9otqr03
	 9mxhOQQAfSWZ0uRwlZxmIAAFuUMsa8+3ufhAlrEY0kEe/ZcLMHxibZOE6LTNgRCWDww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
	b=zNF2cHOQdHpbtuopVndurEmkPBloWvAbS1hntqI3FOEu10sCBIXPDyxca9petoFLsrEO
	 wOipKa7cWSaWtPkqFhsvyDayFzQkBr/igC08ovVcAHp/uMKXPFEQ1yr8EHUUil706dSYi
	 wRWc7+oERt8VTQoQFXChP7XEKaZmpbGlnYWwuMAZmWacu1M2sE5r/njEggQ+UWVC3iP0L
	 /RO+AvfeW9z6wXhDlZTEN4QqaErzN5HA4wn3HV1xY160NHUvSxSSBMw618bg2PMm+dH6E
	 dUmlZy+YeBTIzp3nbqNYc/u1OR4ROrXT7fu2aCxn0oSa0Md7t4QmE6O1Qqnxt4OPtBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NFgfbiwC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+FBRnEz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F9606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 22:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6F9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NFgfbiwC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+FBRnEz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAE0j1352146
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 22:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=; b=NF
	gfbiwCqucCQIhNyCQ0Baw1Pni2GDajRidGKROS2z7kjLLu8d4aBOA8atlRRxLxcD
	UrwOSA+aAlrA7Ya9ZCWjha9w7BqQUULyp6l3LylfC6qXRVNYmYW0Yqm4dAh4tGfC
	dRobK82aLzJSD99N+Fo6UekbzDH+aQpNoFR2A6YOptRK78JBI5aNG+NDg2YK9c6w
	YHyjhtnxXoPS3KioKaqX7m6l+xabQ3yUw87Sw3kqzCiFWm0zCkZ0ILspHlpDJNRx
	mlA0eQm+6f5pw36lfb2GIf+s7c3c6LRxZjtnCBwxMIdCyXvYqBsDRLBEhWQ6b3DK
	D9S76qqOgzEMobkxgv0w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapajgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 22:45:30 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-70b8894d6c1so1642221eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794264329; cv=none;
        d=google.com; s=arc-20260327;
        b=CA/G/94+X2FA1/scKGzt2Qg6ijH5/xb+u9P/5nT5SOow5BkbPFQCWTBkYu4ndVL13l
         F8gmfMUdeEfRdscKIuMGgMQQkLgzcmLpWrb6fWRNh2LF/nxdzi4rPY0V/3ll9zoHfIHl
         qzQwiCDEuw3Jb//m4TLMey3XxdCPWB+pXvEJ9wtyJFVjgBS8nEp5ec+FOOlatagK2xBG
         RLHkWKPhW9gydviMG9bYsjLIGZ8TX4PEu4UTtcWM43c/fm1MaeqYIKMsDBm5kbGaSD2Y
         1dn37qvbTGUABmPtNf2AdJ1uVoX6rd/TqPKxG3Urr/7Tvgkz1NlEybwsfgaayqpb8Fhz
         5YoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
        fh=wf+4nDyGH572xc/0+u0GCpZliArhecWynf3xOgrLzlw=;
        b=JEA5LkHzd65qlPGz2t0P4zWhDmmj5ECDyWKLOsNbDH/gWQa+4nju318gbHh4qx8YrK
         Qp+AJTPZ6zdY1jSIbdiZD8kOjD5x6AmzR8aw3LgVO2q5xDY+7PHYV4VShZxE94K+AQ9z
         Es0q7NOwmbaAmkqrePbh4DgpBsnYtvsnF6cbGSb+bPI9FonN6Mds1pJI6s+x0AkXCMMa
         RuV/yhir0rWOMg7BfPWUlkFBQs3sjm32hchAJEWWLO5nA0BSEsTRV9+c96tDaEgXfktV
         rKzkGdg/YZ6LuklJuP/yjJz5mSObJKVL+YCUgo0EGJCkGxnT0yrP/7Gpy3cVs150aKoc
         WwVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794264329; x=1794869129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
        b=A+FBRnEzgZAZQL/QPe1SMYPBpQb6t8mFAt0DUpVVTrio0yGrJxbYL1MJ+OTI3Chus0
         ZSkcB4bRB4Gsqu9JhRyUFnD0G4PBYilK+Gn/zH55mHcl5j7c9Q7kFLaKkYXpO+3QSZSY
         HqlTopoZEdPDTlor1esZrBdagpWKIcaYfBsBtrNgpRl6D3ioW9EiOdvcJn4F7Pg4mSXs
         +S7lMnMypw97xCAeP0wXMq91OWa7446em4rQt9B06N0dSmvYhSwH6+j2hTpK+92IzE+c
         ZpUI66rOIoPpP6KxHZc9I2uCgMn165gRy7oAq5C+6JB0x+7vK22agAdtSa6AkvB3TDTh
         9bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264329; x=1794869129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
        b=K3bRwFeFj9HErBgybJTPu+tCnvn1oUMQgrT/f8AIFF/wIyxfNg9MzvMTtTxFbKk64G
         CyZksIZMggCK3IoSdGvtrtk1WrrFaQlncIjPiO32zRPTINr3YHJmshtndAb3TidqhtUW
         Ie9hLY/aSmTtFAW0++b/cDPBeMsb+SabEbToo12rXLAyebteJA13AIXauZsm4nan/poY
         rQZi7exhjTDKnDcU2EyKkOWsof/U7u8A1TKjnHpuUnv/7H2TSy84qJEjOGreWQQc9euM
         M+nTVBRqn+khAgRGqWlljChjdR9HoAMbwfNKc5EN2xGD7DRCBhfnGWBZ1DomKKg6FO+E
         dh2w==
X-Forwarded-Encrypted: i=1; AL+hErHk8Uc3/y78ZQT4p2GTIxaBzO0+B4+CybxllWDIc9NeqUpq0G2a3DBlyK2jPcKMXQIYud+RUtSG0CqqB+yO@vger.kernel.org
X-Gm-Message-State: APuU4Z+xFDCSESX80fcIwmqKdR8fa1EO15RHEygcz2Z8OIuTJbzhTFDm
	CylB91hC9fholAKJwbOF8sHc3icfE+EcnNNoD3HFpDh6Auf2PXuP8qyPRA2xPEZTB5mHwfjZ6QK
	5onW5s+xBICc5gRMZHYzMWX/ijEydV04z77eeq4vIbcW1gFbcNwV4luDIK7ikbLYlWbMSm6hdM6
	OMzzuYWjrQLJDu73jZ8RuwGfvIuosHUdVZrGVyFDtimL0=
X-Gm-Gg: AYBFou3eK/QVlr8IPg4xxWoHktIS1502pnqrykfvTwodfBPtZzz34AXPpUmCL2cy8sI
	kQCJqPLqhiQMY4V3BlrmJ4D+uo4veOCsw8VL3pNvke9WQbF0cAwDQUzoetgpqSdl7f7CbrCfZo1
	0BQpdj8O0qcEZMmRYdVpSfVmwc13UiGPLte13JELdPCtA7lOrMk01za8EqktondGE4muP6ZvXSQ
	QzfDgx/ZdalxpFrvQyGbg==
X-Received: by 2002:a05:6820:807:b0:70b:8cd5:8925 with SMTP id 006d021491bc7-7189943f411mr493676eaf.12.1794264329455;
        Mon, 09 Nov 2026 14:45:29 -0800 (PST)
X-Received: by 2002:a05:6820:807:b0:70b:8cd5:8925 with SMTP id
 006d021491bc7-7189943f411mr493668eaf.12.1794264328974; Mon, 09 Nov 2026
 14:45:28 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-msm-va-align-v1-1-2e9b576d2e4e@gmail.com>
In-Reply-To: <20261109-msm-va-align-v1-1-2e9b576d2e4e@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:45:18 -0800
X-Gm-Features: AclHuK_svB21z8Zydd-btaDPqYjJTLzzkRcg1ZIp2xV-hHnPyAoFyw35lJK_YnE
Message-ID: <CACSVV00paci9M7mkvNoqTjTupBCE6=Sw5VxrDca0n1NdSXLfNA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: align kernel-managed GPU VAs to 64 KiB
To: gauravsuman007@gmail.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5MCBTYWx0ZWRfXwzFMc7uvoIEv
 UHzoZiMGnN+BltvWokYoouIprFjFIyvm/djj0eTQlFi8nzZ5t1wB/sTRbGmHMETNoUOizQZ2fMw
 jytERQ2hWcgXJuppFN1fCndvn1vXZk5SoJAo99MQGsSDSLroIiNhdSRfMUJcNzS9lRitE72kogr
 PEiUmnKHWjPYqOPNxhmzoet22dhpo1fsMNGj/RwS4kmMjQqXsCao2v9S9fZ/FOdh9mVcNMsWmJi
 M8HUf990je0JjXGdBQOs1lfWunjRNcVg2w8jRYP7F8tT+gvZNE+JTaEDAPKulaGCZp/fOvgAj0P
 3Ki2h3HUrJxv1U9ovVb2/zqXsLvnPLHsL8KiNpZk5EraIyoECnba6bWLw0vdFHJUtRtHp0wWzT1
 00ymY683FtLcQAOTyWTw8ZJ7AUN8uNMEh+nPPet1Nl+2y+kYQQDlKXDh4zUH6ytU0qLVTc9qw6I
 4iIG8tGATXbEl+6yyWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5MCBTYWx0ZWRfX8/JNk9GvADlB
 0ADPVw/V/X0kozNA+Gj1gwys94fDHvxOglcnlzF1T5wc2e34VdUvYuc5TIFILnrln6N6DsljeFz
 S+ay8J8CGLN+XMQO8Z+kkdA1LY6EgsE=
X-Proofpoint-ORIG-GUID: Uw8Mfn5f3ohphczGUfa_IdisSCKhuo2v
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af24d0a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=5wWQRGSUZCY4pMmLUQ0A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: Uw8Mfn5f3ohphczGUfa_IdisSCKhuo2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090090

On Mon, Nov 9, 2026 at 2:34=E2=80=AFPM Gaurav Suman via B4 Relay
<devnull+gauravsuman007.gmail.com@kernel.org> wrote:
>
> From: Gaurav Suman <gauravsuman007@gmail.com>
>
> On an Adreno 640 (SM8150, LG G8x) GNOME Shell triggers SMMU
> translation faults with source=3DCCU, about ten per login, when
> freedreno uses GMEM (binning) rendering. FD_MESA_DEBUG=3Dnogmem or
> =3Dinorder hides them.
>
> A stall-on-fault capture decoded with crashdec shows the faulting
> address at an exact 64 KiB boundary (FAR 0x110690000) while the pass
> drew to MRT0 at 0x110695000 and depth at 0x11069f000, all in that
> 64 KiB block. The block start belonged to the unmapped tail of
> another buffer that was not part of the running submit. A ring
> buffer of pagetable operations confirmed this for every fault: the
> CCU reads the 64 KiB-aligned start of the block holding a bound
> render target, and msm packs kernel-managed VAs at 4 KiB, so that
> address often belongs to a different, unmapped buffer. Batch
> reordering makes this common, which is why inorder hides it.
>
> Align kernel-managed VAs to 64 KiB, falling back to page alignment
> when the range is too tight (a6xx_gmu_init() fails with -ENOSPC
> otherwise).
>
> Tested on the LG G8x with Mesa unchanged and GMEM enabled: in an A/B
> run in one boot, 4 KiB alignment gave 10 and 10 faults per login, 64
> KiB alignment 0, 0, 0 and 0. No faults in three further logins, a
> GMEM stress test or the full device test suite; glmark2 is unchanged
> within noise. Userspace-managed VMs (VM_BIND) are not changed; Mesa
> may want the same alignment there.

This seems like it is papering over a userspace bug..

Could you file a bug on mesa gitlab[1] and attach a GPU devcoredump[2]
after an SMMU fault?

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/work_items
[2] https://docs.mesa3d.org/drivers/freedreno.html#gpu-devcoredump

> This was investigated, written and tested with the help of an AI
> coding assistant (Claude Opus 5.5, Anthropic); I reviewed the change
> and the test results.
>
> Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
> ---
> Tested on LG G8x ThinQ (SM8150).
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index f687a629629d348b54ebb379d3a2fa956b8e472e..2af43291289945d54326287af=
feffa7e72645880 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -388,9 +388,20 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_=
gem_object *obj,
>         if (vm->managed) {
>                 BUG_ON(offset !=3D 0);
>                 BUG_ON(!obj);  /* NULL mappings not valid for kernel mana=
ged VM */
> +               /*
> +                * On a6xx (seen on A640) the CCU can read the 64 KiB-ali=
gned
> +                * start of the block that holds a bound render target. A=
lign
> +                * kernel-managed VAs to 64 KiB so that block start lies =
inside
> +                * the buffer itself; callers with a tight fixed window, =
such as
> +                * the GMU, fall back to page alignment.
> +                */
>                 ret =3D drm_mm_insert_node_in_range(&vm->mm, &vma->node,
> -                                               obj->size, PAGE_SIZE, 0,
> +                                               obj->size, SZ_64K, 0,
>                                                 range_start, range_end, 0=
);
> +               if (ret =3D=3D -ENOSPC)
> +                       ret =3D drm_mm_insert_node_in_range(&vm->mm, &vma=
->node,
> +                                                         obj->size, PAGE=
_SIZE, 0,
> +                                                         range_start, ra=
nge_end, 0);
>
>                 if (ret)
>                         goto err_free_vma;
>
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261109-msm-va-align-072b585038aa
>
> Best regards,
> --
> Gaurav Suman <gauravsuman007@gmail.com>
>
>
