Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027698;
	b=JmjHEiKeuLkq/B3WJbR2hO/b4B4bDyqG2EU8asZSfXFI2rkYTqX+Z8EVgjrTDKcTYK0W
	 1shfq023g2GJfug7x6MfxBt5Xbq55TN83tEggOVZR+F6XiL5OvwKP1Cu2zVb5eQsRD8nf
	 Boz6IuGA3uM/26bdqPMNd5o2k2MfXfrXTX10gMj6TqWmyap+l2l4rFWTDEr5z5TT9+Ydg
	 6BVe6gbC3GfoYVL2AA4ggz2l9mx8/rhkhcc9ylGzIs++UoQGh/GlNxi8jloNjqMrw/R5E
	 1inb45oInUhw9zMjNmmt0llnbWVay22/F1jnH8N8n2ysV3IuPLUo+jWArcg4W71VMeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=;
	b=syW9CMY2JsDLhEo8HKqiSgyypXg5VPfOGdqIvoajIf0Kud2niUUgacdAmygbBvMGnP53
	 Qs+fM+lA2DcryASZrSJbLHuNBDOk+ZK6f1tjxkUC0gGP9vYZtZNnfWLNWun5NE8yYBmrW
	 kJ+qQhFpJ65y+8YsB73op2cSA5C+dvaQ5AHi6loKH9A0ApWGwT9/ieixVu4tZ+NPBVBie
	 460rAXCk4bucRoPJIIgvNGeXDZZB8VunbPSMikZGz2zR2lesBruLRHEwANmILrQKT3dIj
	 161L70CdleN0p7PoZ+G8WeOMe4T1azf4Inyw3A44VPKxHauzjC3WI7qTzsmql4aO1KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghAf1fWq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ThftA4/I";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0A7606A33D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0A7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghAf1fWq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ThftA4/I
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHHB5o4086844
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=; b=ghAf1fWqlrIIZ/4c
	L5MqjIIqFYxZrDjkevbUzpzc4maUhdeNgniNyDVu3bnpFnIa2f9SVeZQOs8At975
	sOFp1Hz9K5Ca6OYe0sHTJoZP/cHYYdPZLg0D73Uue07kmT/MUuz6eB+pDe0g19Wp
	5DNQf+gA7E9wgv+KlAvphWd7h9UnmF0ONWnSCy0I4+9wx+F64L1e0lCG1myFKBhr
	o/vac1R880aCtHB+tl7rlR0wzIum19/3heW/IW5I8FcIQX8HgA9iUMxDmDlzK9Im
	ZNmFq8Bqrj9amDdIC+ZF6jfDw0z9sE5moptVroQ1u6yrQ63fFI8jEfiflQT6ZZpV
	J0SnZQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcscyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:48:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b63b9665so1060292c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027693; x=1795632493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=;
        b=ThftA4/IlUaK8oWMolCfboAen4m5Q5c2wugTaVmPGHUvz0UaG2ev06JQErLB6CfLuP
         iCtCVNgOsHCjy7pIcQun37KJOKSlGQacNx3PMAtndVQF4Rcr3egvyzPrHYZG4myfbCUi
         UdmBV5BvFZzetYTYdWXyhRrPQOTHPEsO85kyKgKFpIGhyXMIKmapixaqIcDPdc3NNk04
         HRxgBhC5ThT9Zacu+R0raMdXFpOUIE4Hue18tiFeIWs9jAx6oeHQctEFCKuCjTKbVXc4
         4AhSKBjObL42mQhcYwkE9iZYZqV919SlVWNTK67n1M8GJLkKw/u4S/vWCoeCVeC8wLu9
         fhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027693; x=1795632493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=;
        b=QrdbeDwspACOkGgnsgwY/rsesKqswZvAGak825DztdemGbYQ5p/0NY4X+YicQmVzOM
         ol/jrvPb0zXT1W+cX10/qaHXaotzuZus9yrgaXzkz1MY25Uev/O19bs0vEh6kcGutwdM
         e21RO4JXJ/RCwPVvW9RJn+tDWl1PrCE20QCoPtJMQCSnUieyCSLhkNPHmjV2OFvjLlJ6
         KeyM3MHgc+prHaFidVfryEpzxR8vOK+1MFgXRpziPkfS3c4/I6KPp8sAjQubWhWikB62
         JAk3V63Ze5bPvkhAylT9x1tDLcC8TCAxqwXcpLw/8CZpjYQk76K3TC9ebgxpzXl0iLmt
         I8og==
X-Gm-Message-State: APuU4Z/quky/vzlxi+ydld8xScYSvu2Uq5cHc26SMH/aaCkKVF/vVZ9X
	wqUYw7zr2ezm3c7WZCRtvEVq8mUKTsR2P0nRs5ndYIQS9TNRzpE+WPhZlCR/paIGvJT5x/XlIFl
	zYldJX35zBBTIAQyMlxvoINPfE3BRld6OI20bz/xgDhdCExYk5pjcUhijyfSHVGzsBOXl
X-Gm-Gg: AYBFou01C/oRoZF3O/dlrmKXs8IQJtjcn0lXW6GAdqP8YT5IiODFV7DhEjm+s6LH3PI
	vN4494T3az7CoBTgIMGfTn6PrjQs2F5BgHsMv26AOzEK5mhyoilltr5Ju1kvvbSLDZ0Rvq0fdYF
	+4KGTdHNpcnPe2WAvkRXgQaW/caHgIhYrTjH1i6mPMlndy3g1Pcohs5neoLWHPm6jfWwCbYyhE1
	l4mZTww+o2Wpz5ck/OYi2wFZcWNYwssR300BHoes5ZeVYVgYzLkHULA+hOxE4AbB9ZC97FspeMQ
	VrbWQXSbzXXq0LI8FIiDiVK7Lcyq4P8QyJ+c2LWA7urul6A6UO0vUBtx70WIk2CQPRXs+U0JlSr
	betNWpvlxFDyUU+g9JWO5bpCrGCFIWkCq5MlzNgna2WTg8bdQSs8EYC2FxcCRthLP5MOD4UULpw
	==
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr3070445c88.32.1795027692666;
        Wed, 18 Nov 2026 10:48:12 -0800 (PST)
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr3070416c88.32.1795027692068;
        Wed, 18 Nov 2026 10:48:12 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11777335c88.13.2026.11.18.10.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:48:11 -0800 (PST)
Message-ID: <d42b3653-e4b3-4a0c-814c-02ad511fdb85@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:18:03 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/adreno: Program the SMMU aperture when the
 secure world can't
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-4-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-4-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sDVvWqn6LMgpb8Ig80hgZLdeBVjCq798
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXzlGKKJfccepI
 +1y+Tk4+3fMK4/oeQGzVPWYpzJoLNpGf5g6PPJJFceaaLHQDLOZJq3a/Q1sLhq6rqPpI8w6F+Mf
 eihs2f+OFsOrMMkxqyv+wNOAW3V0Z60=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdf2ee cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tbUVMzGWZ8bGTt1F5tgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: sDVvWqn6LMgpb8Ig80hgZLdeBVjCq798
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX99NI2x8dXToX
 +yZ+mRvdA50bwCKvf9I13kZmjVKhq5uvtP57dShdQttChRnWP6h4tTOgxNMJnLgiA/pilZHYsTc
 H1HoHZT/WMjPi64s/JLMW9d3PrwjVaZES0EdfGsCmjDThz4VL0H+FkB8BnnSkdJhLwtNQ9ZmjzH
 X65GgvAuC4bT/F0jYOlD8imoH6KQE5R11pwqld622ElQ1U8+z/aGey+OzrYdVoavSmFmidsqebN
 l7Lmv0qa2dNy6AiJM0mi5EbDiyriAArbA31hg/WPg1/Yt1uhvLBGG4vxofaiXmUz2mw6Pm+RlvA
 VsDTVBO3d2UHUZOVsUoMtYdn5wmTTT2+10YP4UaUlCZOvnh0LyljJ5TVRaVVQ47nHdzp5grzfuv
 JUK7kh1jIuO6KgGCkWQ5Jdv4T0QlpMKvc7Ru5T2IsIWvbAE7u/pMbu4rxwbYvxxSW0qJBPHik9u
 ROqBtr3x/F8cwaEmFXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The CP switches pagetables by writing the GPU SMMU context bank
> registers itself. It reaches them through the CX SMMU aperture, a
> register block in the GPU, which has to point at context bank 0. The
> secure world normally owns this block and programs it when
> adreno_hw_init() calls qcom_scm_set_gpu_smmu_aperture().
> 
> Some platforms have a secure world that does not implement this. Nothing
> programs the aperture on these platforms, so the CP cannot switch
> pagetables.
> 
> If the SCM call is not supported, program the aperture from
> adreno_hw_init() instead. Point the GC aperture at context bank 0 and,
> on GPUs with LPAC, the LPAC aperture at context bank 1, the same way
> the secure world does. Disable the other apertures. The SCM call is
> still used whenever it is supported.
> 
> The values depend on where context bank 0 sits in the GPU register
> space, which differs between GPUs, so they come from a register list in
> the GPU catalog. The aperture region comes from DT. If DT describes the
> region but it cannot be mapped, fail probe. Add the lists for A702,
> whose entry Shikra's GPU also uses, and for A753.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++++++++
>  drivers/gpu/drm/msm/adreno/a7xx_catalog.c | 10 +++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 37 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 21 ++++++++++++++++++
>  4 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 4ef2bd6e7ad2..fe1902b8de16 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -736,6 +736,14 @@ static const struct adreno_reglist a702_hwcg[] = {
>  	{}
>  };
>  
> +/* GPU aperture: GC to CB0, other apertures disabled */
> +static const struct adreno_reglist a702_aperture_reglist_regs[] = {
> +	{ 0x00, 0x000a8000 }, /* GC: CB0 */
> +	{ 0x08, 0x00000000 }, /* CTRL: GC only */

These offsets should be documented in the xml file instead of hardcoded values.
Otherwise LGTM.

-Akhil.
> +};
> +
> +DECLARE_ADRENO_REGPAIR_LIST(a702_aperture_reglist);
> +
>  static const struct adreno_info a6xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
> @@ -1198,6 +1206,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.funcs = &a6xx_gmuwrapper_funcs,
>  		.zapfw = "a702_zap.mbn",
> +		.aperture_reglist = &a702_aperture_reglist,
>  		.a6xx = &(const struct a6xx_info) {
>  			.hwcg = a702_hwcg,
>  			.protect = &a650_protect,
> diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> index 9465ffa3dd12..43d681aa3c2e 100644
> --- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> @@ -279,6 +279,15 @@ static const struct adreno_reglist_pipe a7xx_dyn_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
>  
> +/* GPU aperture: GC to CB0, LPAC to CB1, other apertures disabled */
> +static const struct adreno_reglist a753_aperture_reglist_regs[] = {
> +	{ 0x00, 0x000c0000 }, /* GC: CB0 */
> +	{ 0x04, 0x000c1000 }, /* LPAC: CB1 */
> +	{ 0x08, 0x00000002 }, /* CTRL: GC and LPAC */
> +};
> +
> +DECLARE_ADRENO_REGPAIR_LIST(a753_aperture_reglist);
> +
>  static const struct adreno_info a7xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
> @@ -465,6 +474,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			  ADRENO_QUIRK_PREEMPTION |
>  			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a7xx_gpu_funcs,
> +		.aperture_reglist = &a753_aperture_reglist,
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 54f337475231..c3c84629c5f4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -675,6 +675,13 @@ int adreno_hw_init(struct msm_gpu *gpu)
>  		ret = qcom_scm_set_gpu_smmu_aperture(0);
>  		if (ret)
>  			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
> +	} else if (adreno_gpu->aperture) {
> +		const struct adreno_regpair_list *list =
> +			adreno_gpu->info->aperture_reglist;
> +
> +		for (int i = 0; i < list->count; i++)
> +			writel(list->regs[i].value,
> +			       adreno_gpu->aperture + list->regs[i].offset);
>  	}
>  
>  	for (int i = 0; i < gpu->nr_rings; i++) {
> @@ -1193,6 +1200,32 @@ int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>  	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>  }
>  
> +/*
> + * Map the GPU aperture, so that adreno_hw_init() can program it when
> + * the secure world does not.
> + */
> +static int adreno_gpu_aperture_init(struct platform_device *pdev,
> +				    struct adreno_gpu *adreno_gpu)
> +{
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	if (!adreno_gpu->info->aperture_reglist)
> +		return 0;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aperture");
> +	if (!res)
> +		return 0;
> +
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	adreno_gpu->aperture = base;
> +
> +	return 0;
> +}
> +
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *adreno_gpu,
>  		const struct adreno_gpu_funcs *funcs, int nr_rings)
> @@ -1238,6 +1271,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>  
> +	ret = adreno_gpu_aperture_init(pdev, adreno_gpu);
> +	if (ret)
> +		return ret;
> +
>  	adreno_gpu_config.nr_rings = nr_rings;
>  
>  	ret = adreno_get_pwrlevels(dev, gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 2911d440ab17..021802c6830c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -88,6 +88,19 @@ struct adreno_reglist {
>  	u32 value;
>  };
>  
> +struct adreno_regpair_list {
> +	/** @regs: List of register offset and value pairs **/
> +	const struct adreno_reglist *regs;
> +	/** @count: Number of registers in the list **/
> +	u32 count;
> +};
> +
> +#define DECLARE_ADRENO_REGPAIR_LIST(name)	\
> +static const struct adreno_regpair_list name = {		\
> +	.regs = name ## _regs,				\
> +	.count = ARRAY_SIZE(name ## _regs),		\
> +}
> +
>  /* Reglist with pipe information */
>  struct adreno_reglist_pipe {
>  	u32 offset;
> @@ -129,6 +142,11 @@ struct adreno_info {
>  	 */
>  	struct adreno_speedbin *speedbins;
>  	u64 preempt_record_size;
> +	/**
> +	 * @aperture_reglist: Optional GPU aperture register values. Used if
> +	 * the secure world does not program the aperture.
> +	 */
> +	const struct adreno_regpair_list *aperture_reglist;
>  };
>  
>  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> @@ -250,6 +268,9 @@ struct adreno_gpu {
>  
>  	bool has_ray_tracing;
>  
> +	/* GPU aperture, if the driver may need to program it */
> +	void __iomem *aperture;
> +
>  	u64 uche_trap_base;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> 

