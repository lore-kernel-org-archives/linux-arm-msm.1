Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793627977;
	b=pxcsEd47ai6FNKHTV8OWiIKAAlvX3ljGnUgEyCHYM6xi0V5Je69bNVBDgn9adXrKfTBC
	 xEtKdrKqWnSur35wrphFVID05HAAL5AqRAS8DSCqOt/8+lM/PbbFNAeY0FVkhIjPt/OcF
	 IdzWU2r0LkQQd4xqFFn3nmCkI5LYcjf5HOSg2VELzE1v4mhgIRyb4fexJ6rhcpYXthVXe
	 aPBnZZBL0LCH0U+dAyugHq8mbuHTIE06HNMeUGebUgbR6OtX3dHGQ5CYdRaLWdHfcynoG
	 HiaNzoh/nHRJn2c5cYPYzL+rtXBqAdaXq+0CB9uSELQGFSCdB86tdpHxHbzkpYLh8Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
	b=kT8iUAgiWm5MQqB+RRH9Q2WFD1yNfpLq/UGBH4b7YBg9qVb8paUzNp2Loza/rEN10Cz9
	 oG398xI7GLtv8m7ItZnk1ctFqNIYrsE2fZ61rhTJ7VN4o79LVXQYLFlA35KInVCpqb7j3
	 v+CsRFCuqwHH2vaJc35ek8oWZz7rZSShuxRUWE9XidVfMgBJSuVHRf1h+EwCSzx9CRvyc
	 kGM+vNxbBjr2j7woOhuyHC2HYLgXPu7hH0E1jEDKzLKMwt2+zpA4Huy4S/mkKqLy7d6lr
	 5P+NuuU7Rf8ODW0aTOo0wwvoIiT9vX/xyqJCZAd8+2lDKkbry7E93erNWUc+xDsdTGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIxp1Er0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmqXbTnj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320860A3835
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4320860A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIxp1Er0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmqXbTnj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpHNd4069976
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=; b=lI
	xp1Er064GspN1zRmtcdK4p2Qi4sukyRxlwgpRBqOgFRzKduF6DGyMMK8+iXG11Rx
	fVXUmc/TgtHcTEpfCaSulV6sGd5kG2Yzq7roDqP5GTWGTGGfDae69TQ0JJ39qEou
	FP3P8+CyxSKQcrxKD9idZjUMViF1MeAvu/P1H0Q7vrvpk4xBSuTuw8gKIPBEaT8j
	NOvockeNnuEGkA/PivqHw063vsouEWMqtch0Uz+JywTj3DuCS/KIAE8UVbEf5fcw
	Uti627fooofEiyh0Q5P0GqPTII41Q40bPrPW1t0GTjBdaPDMBPdgxzqxrVbHCM83
	pWGOExnQ2xfuDdGmibsQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5ggnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:59:35 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46a5954cdfcso3055915fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793627975; cv=none;
        d=google.com; s=arc-20260327;
        b=PPRpGyYToaisAVzMPOb7kTUir8bB6b19R0nSkFcC19s09q0hPOFIUgWWvWEVzvLvJd
         fUckGbLFo9yZyfLHZvf98d8dGWm3DxUnNvtM34/vZhdjXJmumzVuWEa5EQ4ASONb1q+2
         X61xApSDakX4GCHGl46a27ygjwTGQtq7ZL6CcrWNMcfHr4ohrgHQCed38BoPkw5F0KHQ
         3hnrD3yPg2RjKBq3Uxy8pZYDH/VvO8rH5NbvlWoNa2/CYL7AVr9e1cD+kpkukHoJFbuB
         haF4vSuWKkQC7gGmMldD5lQZhpYhUBCEQ0qrL3QjQZlOAUyBjuPyfD5ex8AWaq8YqsiH
         g4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
        fh=SBTTwzvlRRaI1KkraKiFtDlMz0Ht3O3LUSXrGn2f/so=;
        b=p9zaRbGRwg6eDvMueJn4zEsOonCblW5ME7EU5u38jNB2wxaM2TSwbGvhLcd/jhwHHF
         7ANg6n1upFTzXH58xlZiCJDXL5lqkatSftgd7yX88C9vP4csTg6m1onQqvQ3Ppr1vJ1x
         GP3pLMr4VvxodbR7Hj1NFh/aR5Y6tc39//mHACy6hG9LGZnMUyd/udDVaQ9XtxWa1Fxg
         Utky1iL2DmSqFyyYeoixT6K3tvdnjsJu47VnQQtZP+nNbd+zTAgZAQWpLifJAh8jdKit
         6uF0tKmeMpNipT3ydhF/1KTDCPF8ONwHP52mHy8u19mG26D150VfaKKXmWjvCfHsh4ZT
         UbMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627975; x=1794232775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
        b=hmqXbTnjwykKq+bvQ/YgHENijMr5r0p2fK6Kjr6SSe0+UtSJkIZaPwbVV5ltONI2Fk
         I1aRkAVdUlD1EcSAKRx3U9eHfGof+YQZtK9fb+ltpf+z0InUeSwcnvYkiR3koe6Yx2IU
         WuwSnaRyECM/OeX52Mja/XTQuBeeRfC6MgNcLl5Hdzq6X3pTKtTIIoBsirWQVPBSu6vY
         1NkKzwIISb4FBD0RAKFlo6WvMjmdwXF86wF2J5USwWj6LUYqfsQgWXJa+cuHeu0Piose
         MpINZ11cdantYLAFK+1puGMWZXO+hTqNyCFBqGEUsklWqTN6/OlEijou1Wz8ZBFdJKIE
         eubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627975; x=1794232775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
        b=JmWHqCCAYkxmbtliMXwi+eolemYXP1qooEksu5+iuT+5C7Q0f9W1cZXKNjpAcrkxPD
         whT6vwJfG8zJQcP09f/j2VOkOSne2nzKbRNnEkS3TL6uHQTOsObh4sEbZyAR+l+iwkqs
         PqYmkgtGBU0bmC60AecU/51quTIyq+Wb/aE0xcXAQed+6/0R1CxZxf6c/kBX/Sgdo6fp
         GLZWvCJtI17lcDJehDhtrg7AkO4xEyb5sqvvWjcSUsPsfbELOfo5HD2gd5eNjiuVtyL7
         HeKHoPnOEe+4/fuPWL8FTZFJqjZAz5creFojACDSx/+n+AeGy7fweUcIIRJKGkMzwoA5
         pkLw==
X-Forwarded-Encrypted: i=1; AKwUvByqh7kHN7lCQX21UNkyU3KhuoV2/alAo30zBEZaGl4dsXKqosoFB99yhpHmArW4I+eYy30UkuH/t4uUeSoV@vger.kernel.org
X-Gm-Message-State: AFq9FYKMgK30rpEj+Dm8bOi6wO2qDBGgVkszaJOWEdjX/yESeDEibRLR
	VploGtN9B8yOkTKUg+Ti8Gm1IzwXZJ4i2FTprbEiRQBZvK7L3GPJez/6k2LOWLi47V5dUquABOE
	EmAX/R//27OrSJcuTdRVINun/mbXc6hd9r3O59CSbe7fGvLHCDt3BhSibxKz7mhtxwnvN5QWr+e
	BwbzpG9q8RK+9EYc/I7LMyyueAFdDNDaopbArVTLClvGg=
X-Gm-Gg: AYBFou0/qarA/SJphYOSnjVvRRbiN6mJcIU0ssvuK1qco9upfxeqHJiWnCkd2Oage6Z
	i/eqP0cZhBdSWK1Ltp31SPLLZX+2up37DRxHYZ3jXdtrbgVH6V1tWbS6fZOWtoV8GD+IDlvYHX4
	bdnc+xRWZKhWCUlw/FtLooAHvMGXjd8AYiRCN+MvlYR+YUX/yVjJNME2C75w==
X-Received: by 2002:a05:6870:5ba2:b0:4a2:4c6c:c9d5 with SMTP id 586e51a60fabf-4a90729ac7amr5634887fac.7.1793627975100;
        Mon, 02 Nov 2026 05:59:35 -0800 (PST)
X-Received: by 2002:a05:6870:5ba2:b0:4a2:4c6c:c9d5 with SMTP id
 586e51a60fabf-4a90729ac7amr5634852fac.7.1793627974121; Mon, 02 Nov 2026
 05:59:34 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com> <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
In-Reply-To: <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 05:59:21 -0800
X-Gm-Features: AclHuK9ZhLwCfrUX-9m8aRznRVSHUF8x1JBC9wm-I47eYmvAKPX_Cth1Jx0xGxw
Message-ID: <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae89748 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=NaZcOW_h6FOph8AvsZMA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: 6PlsIQTIZ2WoAiHAEw1SOSSMroKIaszj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX+SkYHDrBUGfP
 TTPcJKLdkH95fPzwZIoRJXp9noTy6b8T3JBmOIA5Vbw1QWTaPMZxf86E9SoGAHIEAPqrT8U8ep3
 y690iI7EE+Yqk4n2HOFmkAH/Aj0a27j467hfuc/bKos8jsAzq5NFJg+kuWz37hs/eMLGRAdvZj+
 xzljMqAffkawWNIz6HoQQSDBz4QhpVOtJv/HkWk9s+vYp3nzFEEElq4ydJtdPwYOp1cdRVHPpJ/
 p901W4PX0DgR/VtI8YdXNVLEgtJCQxbSbE8xOZ35nHwIZrjgfzCgOr4n4XKM3jh2ixiZ2GcOXbN
 w+HEezt5TyvN5UffkhZbdGdiim4Y8A2nPHKJNegTFRo4qn9HTiREq38E3/5fTZeDGZG366L5dod
 KpzAGRD1RjJ28kAfbp1MpuJnVY3yrFbLD71mUQwDaEWQYRfa6Frj4wwOqLvHa42Jo/4FjBxB8AY
 wf06aZxVMuzfREc02Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX5N6ucfpFo0Vh
 XZAeorWB7lRpyJd5I0/qluiGCVtKTAYbPtM+QS6nGyU1QXa2kOVhqY0XaCjSxvNYLVWiEPQw8E3
 pCgy7ljnMpsKabvfAQSkipHH5KyzCFQ=
X-Proofpoint-GUID: 6PlsIQTIZ2WoAiHAEw1SOSSMroKIaszj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020055

On Mon, Nov 2, 2026 at 1:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/1/26 6:49 PM, Rob Clark wrote:
> > Use size_add() to guard against overflow.
> >
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validat=
ion")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> > index f687a629629d..16b3870d5e90 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *jo=
b, struct drm_msm_vm_bind *args
> >               op->obj =3D obj;
> >               cnt++;
> >
> > -             if ((op->range + op->obj_offset) > obj->size) {
> > +             if (size_add(op->range, op->obj_offset) > obj->size) {
>
> GPT and Sashiko are unhappy about what this does on 32b

Considering that we can't have >4gb BOs on 32b, I think the concerns
are probably unwarranted.  But yes, I do look at Sashiko's reports

BR,
-R
