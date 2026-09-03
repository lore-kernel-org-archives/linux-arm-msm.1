Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193064B26FC
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444623; cv=pass; b=K4ElNT9ocS0jMYhAssLUKNIBAawmGVjDkep2BktmlfUOKJAup5FVsNAplUOyc9sduXtuc+Eo9ZpqV0LhAdoKQ17nDYytaX6QBH+vAv+inBzxOS1SiOS629poYughmndIlks4uGGwa2+yrtpEfLwtk3TBb5K87piEPsvf21Dm3d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444623; c=relaxed/simple;
	bh=bg7JMW9HA7L4LnLHkktmzOdPuphb4WszlBGNru/ZMRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRAfxiypFkIyaCitabh0nHl7kW7P/8Xcc3HqD/Sb2kKguvlacjSVc3G7MGTDw1PkhbzwPdV1eLA+sDVV7ObYbstInzWFBIJsK/QbcCNJk/+AAO1rDaSqGlhJF8mno6QCiVjv2hUoNPVDJUOyaMfC9RWHRNshpNsyMfx01NLbMdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uv1jxx6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9SFgF7A; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uv1jxx6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9SFgF7A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAeE14158201
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 14:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=oMUypB84u0QT6Lb2H2QJi89zaKP6tFwAPWUH6jFYujQ=; b=Uv
	1jxx6Ulq1K5wRT1W7V1lDl2T/5u34FWexjqkKSclN0KIwZ2Y773s3uAm0SXfMilD
	pGpx1VOmHrhZs2coZEnKTIEL3F9yje8GTAVJqTfQbsgA9f7gTXST3hJ3UcnIvp6G
	LyUqk7ZsCz5QqferkIAO8/NnbTBprtUnuocu8bPxA9lB8/X3XzYOKB4juUpbYX+I
	0xCMBwLvABj4OIwWF0wtfO6/67Nkpien4Q/LKlfCuS7qdUFCG4IrDrjL+TLDwHpH
	OLVUkZg+jCgUoEHTEj19cigsiLPNPHGCFu90wLuhmb0QeEYrBdVbIyAXBZTxMXU7
	XRrfbF81rKigKCD0HjxA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds8x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 14:10:07 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46dade0d7cdso2073346fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788444607; cv=none;
        d=google.com; s=arc-20260327;
        b=GPL2zwFsfNPhs/jwwVqHc5duLlRsM2HkZGRWUDUuVa0gNWiQRcGQEeOEIpa6LoT5mZ
         Ky+bDjMug3SWn7lebeYlmiE3U8ojboCE61v9WQ92zKycFEibncK0VJmN30oa1HNwnscR
         8dTC6bTF6iGslbJne8NSS3PpABIGzhqjfScks4vn/4D39vAI8J22K3mF+/7fCxsdZnjf
         /gSXSsmcegOLeRa5U6h2s8kr2C/PaHM13m9Ba729i6VyH4+bC6jcMC4fUdMjVvL85b0R
         dl4JVcJ4SpjF8AV95vVZ8kqj9tSx0KUeT1/eAAYR6ofJ7uz8HwzrYY+xjXYvhrbcBGPE
         SU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=oMUypB84u0QT6Lb2H2QJi89zaKP6tFwAPWUH6jFYujQ=;
        fh=+Ffmx67fvaAmXm1EFoBHtdTfQ3oYXEhisOrpVu1mmyQ=;
        b=TOGdUV8x2rx8i+rPZ4/BiD//DNEkZ/OC2Vj9qnk63fKA/ftetpuy5aai/ZD+f/JVpn
         EOiif8ggJsPrtEhm5B1cT3JA/yZ7Fsyh/lXbcDXZ3nYStE1EFc8bW9c1ibQmpdf7HdyV
         avhdr3cd9iA+HK4mpox4jn5jVEfzJQJ+dIzaXwDKt3LnRbegc1efaos2o9Ei4rHvXkXb
         ptLY8Ryt6eAxeVryMeY3lzLQPb+2A2bqhqi3x22acus63GXb9PVfx4v19VR9CbvWoX/b
         dyW+cE++lqLHmc+1lz96hRME9xBeESSbj2GBs/qa8AFUcYB9uju3dpYLOiWwjD8xqEu8
         MkTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444607; x=1789049407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oMUypB84u0QT6Lb2H2QJi89zaKP6tFwAPWUH6jFYujQ=;
        b=M9SFgF7ArUJm9reJMC0KGZA4bGPLuYvXEa9Nwhq8ICRq5BMGKFCAlckaF+hD/0MI0y
         DiNjmIb13h0QIkM+4uPG2wF0/AuSO9wYApIUk+2wO9KXsyMtU4jRNF83JV07rNqxQeUy
         7MnkSEmzbalUIv2M2kI1gi/fPLblLt6d1QIBghEtTsiWBbRiGsjg0dihRZTUfYHCCqTQ
         C2UYjXwqSAp3tQcMwMXp8M2KsFbFe8x75XPlmvaOpdrLetj6A/a4o+fo0z0hd4eqZPoA
         RL/vn0acQj1TBZjbs7jQsvuG+w1lRHWo49tNdHnQmI+/bMT9WNTHfoyPomoMhgYGUD1P
         hFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444607; x=1789049407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMUypB84u0QT6Lb2H2QJi89zaKP6tFwAPWUH6jFYujQ=;
        b=cX13JIt3Qugcp4O87ht+Bo+dfm3w5mnqyi1uYv8ya47WFsFBuuk6ePjeT/sGArpROl
         LRRYV2EVM+esmE6F6OWDYJ++FDEmUOXPI1ij5zIPIIogAzb7wTQPk/3IzgEC3RrzuRuV
         HyKin+Hh0iBjwJ1Nln0e7YBocPh7mCMlkFQZXwUlHrQmLhgPiGsp9WoE7Ia3vVyRSQMB
         0QJwnub8yUOrTPv2Xo9lgQmDqpdKLKWzCcWIif3tk0MV0VQ5/Fy2qoxEAy/6nOaibvZ8
         fxXx2q7doD3WG28Ow4JvR2PqIY+tM2XcYCl7DHNVf5flFJnbh68V3Q74oL6tgR6LQt6j
         8stA==
X-Forwarded-Encrypted: i=1; AKwUvBybnYYerWvZi//EVbkkcP6w9eAjwSU5X4nxcmGjH0X+yTCOrtTsk2TwrsDv7MCq8pEMaHylmm/IbZDi7Jr9@vger.kernel.org
X-Gm-Message-State: AFuF++k+UOiSVhJykaWUC4ppOIHQCmim2CUegJv4DHOazygxJdkEZzeS
	H2fUJkASlnUQDXgKInjjYY/0pZhw1lkjryUpWm8LgSCTBwTTf1zX4fjxgQZTfeQ+YrlpBiT8BK0
	04ne6iQ2/iZgvaaHX9kUkDDzaBDkkc51eOOvbRwCkXAr4fMgkNL/2sktOt81b3P8geXJtDygslf
	EZkJpdou1GP2pA4y0n3T4K7feOUnYoy4yqpL+GgJVBNtg=
X-Gm-Gg: AYBFou3utVuYC2oO0EwwY0LQ8xNlQ6PRTZcBea6c5ElMClBTdRk24tnPzD/P29OFbvb
	ndggt7oy0j5yZLw4ArEeEhYgpU6pnz3/7zbfxypGYS6c1QMNTbF8dis6WNpVnCwBZ2+u/LdKZfC
	vxxa01bej0MniUc1JH93YUIgCKHQVFO2wJao4rcFqbLAnatL8i19GVDyPg
X-Received: by 2002:a05:6870:1402:b0:465:8c3f:68e7 with SMTP id 586e51a60fabf-46f88934a51mr11070047fac.18.1788444606332;
        Thu, 03 Sep 2026 07:10:06 -0700 (PDT)
X-Received: by 2002:a05:6870:1402:b0:465:8c3f:68e7 with SMTP id
 586e51a60fabf-46f88934a51mr11069953fac.18.1788444605613; Thu, 03 Sep 2026
 07:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901164544.642985-1-robin.clark@oss.qualcomm.com> <69a37b53-82e1-40bb-8266-206c3bff6af2@suse.de>
In-Reply-To: <69a37b53-82e1-40bb-8266-206c3bff6af2@suse.de>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 07:09:53 -0700
X-Gm-Features: AcwNN1WDZnMCsjGX9OWYtrj50YqVbNqx9oHiZ-ljQXjvH1Ps5heYuZz5SI9_-Kg
Message-ID: <CACSVV03XSo8U+8XR3Z=mQtD_kvHU_G22ne+Mb9yL1VHLc9SLTw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Drop ticket arg to lru_scan()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Steven Price <steven.price@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfXyBF/mkU50cWq
 Kd383QBcSfjfrik2xEXD9gVFNV2341kqILpzbYyIghyi+uDg+pKHvvNmCNmC6+T5BrREKLgfUVz
 RDkWp/wfWo6GA7yVbKExtTo5RX7bxL4=
X-Proofpoint-ORIG-GUID: MtzWK8m5HJDSOxHoe69eb_4ASKvpd7Sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX8q/DI9e3JM7Q
 omsU9RImnHdvSiPSks5wc9/LAWe0I+CWU8nwQy/eyv3mLrCO3FWqE0yzfGvfR2dIg65LSK/oPJ1
 +RhkRejKslQ0hgjb3fZdCAkfcWPB25az0g/GHh5w8IZzM8hDsqQSvwG571FvSp5br6b7SVoPCTZ
 +vBoFDWnjnKGUcge1MZ12pcqAhEj2MujSPSrwgocTjMnYKLBkzJiTt2HFmEaHhCrD3aprB6Z/1M
 EzdtY7kKiyaZvGSEO+DcuaQPg+nhvXjGlfJYCAazgaGpaB29RN8O5zNUvS1+OC6kyC0eDoAHuA0
 HUf2p10qkevtQ5aqfI6MQx02P3lxh5B1Ua+uWb6h4/vZpT1NjUUWz4Yeneh/GPzcokOowNcB8g/
 KA4/8hcsoHqoN2MKIG4zorn4bUPWVS1HgQhwB0UQ6Gsyb5Jgo4IRhJdPGy3TC285KaLgf/wQ15+
 wUq8+MWc1it1FDz1BVQ==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a997fbf cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=7CQSdrXTAAAA:8
 a=iox4zFpeAAAA:8 a=ovrPBvbf4G9EXlHTudsA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: MtzWK8m5HJDSOxHoe69eb_4ASKvpd7Sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030123

On Tue, Sep 1, 2026 at 11:57=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
>
>
> Am 01.09.26 um 18:45 schrieb Rob Clark:
> > Commit 3392291fc509 ("drm/msm: Fix shrinker deadlock") dropped the only
> > use of the ticket arg, but at the time left drm_gem_lru_scan() unchange=
d
> > to avoid conflicts with in-flight panthor shrinker support.  This commi=
t
> > is the followup to remove the unused arg.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Could someone take this via drm-misc?

BR,
-R

> > ---
> >
> > v2: Drop left over kerneldoc param description, fix panthor spelling
> >
> >   drivers/gpu/drm/drm_gem.c              | 14 +++-----------
> >   drivers/gpu/drm/msm/msm_gem_shrinker.c | 22 ++++++++++------------
> >   drivers/gpu/drm/panthor/panthor_gem.c  | 14 ++++++--------
> >   drivers/gpu/drm/panthor/panthor_mmu.c  |  5 ++---
> >   drivers/gpu/drm/panthor/panthor_mmu.h  |  3 +--
> >   include/drm/drm_gem.h                  |  3 +--
> >   6 files changed, 23 insertions(+), 38 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index e3ed684ddcf2..3113b4a53b99 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1649,15 +1649,13 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
> >    * @nr_to_scan: The number of pages to try to reclaim
> >    * @remaining: The number of pages left to reclaim, should be initial=
ized by caller
> >    * @shrink: Callback to try to shrink/reclaim the object.
> > - * @ticket: Optional ww_acquire_ctx context to use for locking
> >    */
> >   unsigned long
> >   drm_gem_lru_scan(struct drm_device *dev,
> >                struct drm_gem_lru *lru,
> >                unsigned int nr_to_scan,
> >                unsigned long *remaining,
> > -              bool (*shrink)(struct drm_gem_object *obj, struct ww_acq=
uire_ctx *ticket),
> > -              struct ww_acquire_ctx *ticket)
> > +              bool (*shrink)(struct drm_gem_object *obj))
> >   {
> >       struct drm_gem_lru still_in_lru;
> >       struct drm_gem_object *obj;
> > @@ -1690,20 +1688,17 @@ drm_gem_lru_scan(struct drm_device *dev,
> >                */
> >               mutex_unlock(&dev->gem_lru_mutex);
> >
> > -             if (ticket)
> > -                     ww_acquire_init(ticket, &reservation_ww_class);
> > -
> >               /*
> >                * Note that this still needs to be trylock, since we can
> >                * hit shrinker in response to trying to get backing page=
s
> >                * for this obj (ie. while it's lock is already held)
> >                */
> > -             if (!ww_mutex_trylock(&obj->resv->lock, ticket)) {
> > +             if (!ww_mutex_trylock(&obj->resv->lock, NULL)) {
> >                       *remaining +=3D obj->size >> PAGE_SHIFT;
> >                       goto tail;
> >               }
> >
> > -             if (shrink(obj, ticket)) {
> > +             if (shrink(obj)) {
> >                       freed +=3D obj->size >> PAGE_SHIFT;
> >
> >                       /*
> > @@ -1727,9 +1722,6 @@ drm_gem_lru_scan(struct drm_device *dev,
> >
> >               dma_resv_unlock(obj->resv);
> >
> > -             if (ticket)
> > -                     ww_acquire_fini(ticket);
> > -
> >   tail:
> >               drm_gem_object_put(obj);
> >               mutex_lock(&dev->gem_lru_mutex);
> > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/m=
sm/msm_gem_shrinker.c
> > index 9d2788f79ace..3514d5c84989 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > @@ -102,7 +102,7 @@ with_vm_locks(void (*fn)(struct drm_gem_object *obj=
),
> >   }
> >
> >   static bool
> > -purge(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
> > +purge(struct drm_gem_object *obj)
> >   {
> >       if (!is_purgeable(to_msm_bo(obj)))
> >               return false;
> > @@ -114,7 +114,7 @@ purge(struct drm_gem_object *obj, struct ww_acquire=
_ctx *unused)
> >   }
> >
> >   static bool
> > -evict(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
> > +evict(struct drm_gem_object *obj)
> >   {
> >       if (is_unevictable(to_msm_bo(obj)))
> >               return false;
> > @@ -133,21 +133,21 @@ wait_for_idle(struct drm_gem_object *obj)
> >   }
> >
> >   static bool
> > -active_purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket=
)
> > +active_purge(struct drm_gem_object *obj)
> >   {
> >       if (!wait_for_idle(obj))
> >               return false;
> >
> > -     return purge(obj, ticket);
> > +     return purge(obj);
> >   }
> >
> >   static bool
> > -active_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket=
)
> > +active_evict(struct drm_gem_object *obj)
> >   {
> >       if (!wait_for_idle(obj))
> >               return false;
> >
> > -     return evict(obj, ticket);
> > +     return evict(obj);
> >   }
> >
> >   static unsigned long
> > @@ -156,7 +156,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, st=
ruct shrink_control *sc)
> >       struct msm_drm_private *priv =3D shrinker->private_data;
> >       struct {
> >               struct drm_gem_lru *lru;
> > -             bool (*shrink)(struct drm_gem_object *obj, struct ww_acqu=
ire_ctx *ticket);
> > +             bool (*shrink)(struct drm_gem_object *obj);
> >               bool cond;
> >               unsigned long freed;
> >               unsigned long remaining;
> > @@ -180,8 +180,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, st=
ruct shrink_control *sc)
> >               stages[i].freed =3D
> >                       drm_gem_lru_scan(priv->dev, stages[i].lru, nr,
> >                                        &stages[i].remaining,
> > -                                      stages[i].shrink,
> > -                                      NULL);
> > +                                      stages[i].shrink);
> >               nr -=3D stages[i].freed;
> >               freed +=3D stages[i].freed;
> >               remaining +=3D stages[i].remaining;
> > @@ -222,7 +221,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, uns=
igned long nr_to_scan)
> >   static const int vmap_shrink_limit =3D 15;
> >
> >   static bool
> > -vmap_shrink(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
> > +vmap_shrink(struct drm_gem_object *obj)
> >   {
> >       if (!is_vunmapable(to_msm_bo(obj)))
> >               return false;
> > @@ -250,8 +249,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, un=
signed long event, void *ptr)
> >               unmapped +=3D drm_gem_lru_scan(priv->dev, lrus[idx],
> >                                            vmap_shrink_limit - unmapped=
,
> >                                            &remaining,
> > -                                          vmap_shrink,
> > -                                          NULL);
> > +                                          vmap_shrink);
> >       }
> >
> >       *(unsigned long *)ptr +=3D unmapped;
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pa=
nthor/panthor_gem.c
> > index 54535bae2b0c..17408f832af3 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -1392,8 +1392,7 @@ panthor_gem_shrinker_count(struct shrinker *shrin=
ker, struct shrink_control *sc)
> >       return count ? count : SHRINK_EMPTY;
> >   }
> >
> > -static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *=
obj,
> > -                                            struct ww_acquire_ctx *tic=
ket)
> > +static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *=
obj)
> >   {
> >       /*
> >        * Track last locked entry for unwinding locks in error and
> > @@ -1479,8 +1478,7 @@ static bool panthor_gem_try_evict_no_resv_wait(st=
ruct drm_gem_object *obj,
> >       return ret =3D=3D 0;
> >   }
> >
> > -static bool panthor_gem_try_evict(struct drm_gem_object *obj,
> > -                               struct ww_acquire_ctx *ticket)
> > +static bool panthor_gem_try_evict(struct drm_gem_object *obj)
> >   {
> >       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> >
> > @@ -1488,7 +1486,7 @@ static bool panthor_gem_try_evict(struct drm_gem_=
object *obj,
> >       if (dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, fal=
se, 10) <=3D 0)
> >               return false;
> >
> > -     return panthor_gem_try_evict_no_resv_wait(&bo->base, ticket);
> > +     return panthor_gem_try_evict_no_resv_wait(&bo->base);
> >   }
> >
> >   static unsigned long
> > @@ -1503,13 +1501,13 @@ panthor_gem_shrinker_scan(struct shrinker *shri=
nker, struct shrink_control *sc)
> >
> >       freed +=3D drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.unused,
> >                                 sc->nr_to_scan - freed, &remaining,
> > -                               panthor_gem_try_evict_no_resv_wait, NUL=
L);
> > +                               panthor_gem_try_evict_no_resv_wait);
> >       if (freed >=3D sc->nr_to_scan)
> >               goto out;
> >
> >       freed +=3D drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.mmapped=
,
> >                                 sc->nr_to_scan - freed, &remaining,
> > -                               panthor_gem_try_evict_no_resv_wait, NUL=
L);
> > +                               panthor_gem_try_evict_no_resv_wait);
> >       if (freed >=3D sc->nr_to_scan)
> >               goto out;
> >
> > @@ -1523,7 +1521,7 @@ panthor_gem_shrinker_scan(struct shrinker *shrink=
er, struct shrink_control *sc)
> >
> >       freed +=3D drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.gpu_map=
ped_shared,
> >                                 sc->nr_to_scan - freed, &remaining,
> > -                               panthor_gem_try_evict, NULL);
> > +                               panthor_gem_try_evict);
> >
> >   out:
> >   #ifdef CONFIG_DEBUG_FS
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> > index e10dbd18d8cf..ab070bc74857 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -3133,8 +3133,7 @@ int panthor_vm_prepare_mapped_bos_resvs(struct dr=
m_exec *exec, struct panthor_vm
> >   unsigned long
> >   panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> >                            unsigned int nr_to_scan, unsigned long *rema=
ining,
> > -                          bool (*shrink)(struct drm_gem_object *,
> > -                                         struct ww_acquire_ctx *))
> > +                          bool (*shrink)(struct drm_gem_object *))
> >   {
> >       unsigned long freed =3D 0;
> >       LIST_HEAD(remaining_vms);
> > @@ -3160,7 +3159,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_devic=
e *ptdev,
> >
> >               freed +=3D drm_gem_lru_scan(&ptdev->base, &vm->reclaim.lr=
u,
> >                                         nr_to_scan - freed,
> > -                                       remaining, shrink, NULL);
> > +                                       remaining, shrink);
> >
> >               mutex_lock(&ptdev->base.gem_lru_mutex);
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/pa=
nthor/panthor_mmu.h
> > index 3522fbbce369..abc36e7204be 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> > @@ -52,8 +52,7 @@ int panthor_vm_evict_bo_mappings_locked(struct pantho=
r_gem_object *bo);
> >   unsigned long
> >   panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> >                            unsigned int nr_to_scan, unsigned long *rema=
ining,
> > -                          bool (*shrink)(struct drm_gem_object *,
> > -                                         struct ww_acquire_ctx *));
> > +                          bool (*shrink)(struct drm_gem_object *));
> >   int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
> >                                       struct panthor_vm *vm,
> >                                       u32 slot_count);
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 8a704f6a65c1..ffa607c91aa2 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -616,8 +616,7 @@ drm_gem_lru_scan(struct drm_device *dev,
> >                struct drm_gem_lru *lru,
> >                unsigned int nr_to_scan,
> >                unsigned long *remaining,
> > -              bool (*shrink)(struct drm_gem_object *obj, struct ww_acq=
uire_ctx *ticket),
> > -              struct ww_acquire_ctx *ticket);
> > +              bool (*shrink)(struct drm_gem_object *obj));
> >
> >   int drm_gem_evict_locked(struct drm_gem_object *obj);
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
>
>
