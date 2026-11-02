Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632749;
	b=tXJBqExyiRUVPs9BhkQGvVHPyV/gJjJ8T1vdue0EPlIQq52aXUO36Myy3yU9QBT2eoLX
	 GefjqKWQ/I/W42KrPYJD9rSgkOGOVeFaieDYWzF/kFlpmaAr9yn+XzpXIf99s4QO8V07z
	 NQIBqz5ArV6XxWc1UgiTmZLIlH46TjZSaLR9UZS1QaJzHqBPB/6ZY6cr8Jo+qvPDbufJC
	 3AyQUP7xaCPMkoO1KiWlIcmr6aa4Xev9NMpKdCgTjdUZi+HraR/rnxzyAca4l2VS2j5hp
	 kipzdleu61bqCKLOId57A55ykUvnaRZJbpVi2XRpSg1oJZe8GBcafWb0VCMMmvqI/0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
	b=Ae7QM1xGEblmYWP1YXTkYn1NtTWmNnXxfsa40wJlEW3thjBSKlRUPBAphP9dHzAJ3Zmp
	 VeGsgbBIPBtqEdjbN6/INVfOEH5rVl3CBAfpgOcAddcbGNoz2Ij9p8pMbzy6jmKxTTa9W
	 CFDpNc1vaAzqGxDn7cKNjjiSFHbKO8PqvonmsxnDD8ODWhROV1VZcI1WZ8vvewVqV6CLZ
	 dQxsQTNJ5D65D+2/uxxAbEzPC+sMZ58IgDsQUhFZfr2mqvVUNAryoasgEKC3Q/sbmYh+v
	 Q3i2SI9HfwR7jbA5lNEN+A5BKuuQyybo8g7FgEUvnFQkpvs4EXeRLJt8bsUPmaYNqdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuHoTSHU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHcqbIg0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87053606C3EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87053606C3EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuHoTSHU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHcqbIg0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpAXo4033872
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=; b=Qu
	HoTSHU79wtw3WxydbbwxFGBHTAmhokn4hj/ikHi7Hv3HQFNcTvWoFCfojIh38ymS
	zQ8U5z8sf64CySh/M3RJSfvI4clEO4bfDX7O7wL+RElTGYfrMtvZvR82HHx6f478
	gldXZu4hwzuEubkTr/mIWCQahbJNvu6cUbP8h86mQEHUS+nOL0OojO7QLfD6ZslL
	sdSfD8KLWrEwGxjRs/vg+J1dDCrgG6SRHxheP8Zk14JKTPRKpXKpr+Cf5fLPnh9L
	GZPZuOgytRJQg1D8+hWf7fHKkocPkZ6efMIKNAhW+VXdQdsPwThWspX0VSpNJpFl
	qEhr4xrbzxWfAOYmblow==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9sm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:19:07 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a2db303521so3185588fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632747; cv=none;
        d=google.com; s=arc-20260327;
        b=CWbnYlLNjOEav7DlFncnMjaKoJyhLZl2GqyEnloHff4t0F2brBTtcU/VXQ3OeaJ7Jg
         RMgRuOGLueN3TFHiAU7B5yksgJZzy4N8Pghr5hSwssNzGGcKwwG9d97Jz2GFoOJO7DjJ
         TXF4Iz5tkXAP7wgrKbB6CeNUQFgCl59MRekbHWyo7N0n2lTxnM8qnUc92xlrIhLPgrZH
         ZOt4sUo0tkKoTZtNY7p9yfn9mpE97ozeMpWirgMZdL36NnPPovJ2EnNjmx06Kq39/hjq
         MWSpSEyqe08zA9LT2zBiAvQs6mhioNH0npp49KOilumb9PVFJaEErRrPsUduv2or8A6X
         UEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
        fh=c04iVnHwyjAJ0qML6ofy6z9cdYYrt7dOgm+eG/4d/aY=;
        b=JHULR+55jeWM7J5+EllJrlL46ZVpwOAcQ/DM2Gt1fHzmGbmKKWiRP2e3sLbCNtFgan
         PAVq3XYcfNOpspkE5iUdG8ECgDLH37SvHi2eEthE9eTjEBKBHNYougBqfY7ZWDWWym8h
         VXpGdBmGbg7099aCicMgs1yTDO81+xmMWexHaXrSiSDMyZTGUIOy8zjcZjd5yyR7xJ6i
         dcfD305ce4pexXX+j3+UU49chjkVSuebR8WlZepQvnQoIvvXYcs31RXWAIo6h23a0TJX
         BLM1cqUOHQ5a9nvXqwHZLjkmc47ULy1TQoItK3jV/rHJDorY300+Cr1+BQAX+Oq1VLND
         RdWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632747; x=1794237547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
        b=IHcqbIg0OxgGiGJF3LKTaTCakU5iruF2vY6P/hGeIqLWoq2DqhpEH7GpBcvwAlCHh8
         r+mcRZu9g8XBXzXZxt8EnKBpCPhOF1sa3KBhcSY5HjnK9G+18xj1J9aZcZfoG9w45fGY
         IAOD3fhYqqJlQXmoovTKbuh1HGI9WlIzfmm9byZu8mPAvQmQrmNVrSzWhUlm/nGViCoF
         +sfoRMX1x9AxGFYv3X9bgx4UqAQdFBUPNONZkwpnGu04VuOhrq+dZGVCwx/XmXFeOhL7
         FHOb5xXHscBCYyilDP/2IQugLwWtvnD/3tDVne6WIyzjvbOyVJnGm39IqTW8jvPdttxP
         vndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632747; x=1794237547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
        b=jMNA1vccJ1iuz038ZNtaH1wKMxOzW7S2lzQi2b/Oh+WawfQi14Ms7ImCduHqAfoxEJ
         F09EpvJ2MiKOfPqK+JfSbC4NSWm2C62JEh/pfAKKBDLUOq1zJO2ucMw6UIzuk0cwXdz2
         hoUoZvQUlTEoWpVgsJxXIXHEmfcKo9RO/wMDDtNqXDWgxqSK/uYX1/mbj2xjcMhYBuub
         3GlbAoghtoXJIechl7KHXlrbJ0v3URxhKLSzjPrKFaIEVklD6tJg6tc4tVVLqRRHZk42
         s0SgUR0W/mqu9LVzTvoT5n7OO4HYCJzY/MFFAarPw2Ss8n6Ua2NkLt9zDJ34c3mM43GR
         +Ybg==
X-Forwarded-Encrypted: i=1; AKwUvBwf6hko74d0X5mmg80AzSPFEwqerjBH5z/F6KHKARM8povzIdsP/CAJY8AkbI3NLE4m79V+/rU9JJvawp2Q@vger.kernel.org
X-Gm-Message-State: AFq9FYK7H/saENMo1HoYoyPUHL8aUxLQ3VBueMOYMVT9169qr/guwDpr
	Pz2FTYJFKhJgTjUzY8uQpnYzi1pwHP6UuLmJqRAsanouSTDw9WHNarC4WCXFCjz7uS1Qez6cbZA
	M3c+eIKPFf+1FwxVjVHyQB3rfeapq29BDPX4FbtAUVlx93AA1goVhse5XbWc6R3q/W2/P9K/JU2
	7s2iHTCdX6g0CKy7z3fUNj+jXG/Fj6mWvKbvgtZ9uCH5hhSC2XlQXdoQ==
X-Gm-Gg: AYBFou2mLtTzwcIWtwezuWP12gScZFkv0EELl0jthxkGHTZJgd/8BFRnnr5dpzl0Q31
	FQDYE02exvm1nKmK87zXqOV52CtW2fw4oX5goG5K9JZhGxOY9LBC4Sz4oa9Tnc6RwCAEdvNdg4p
	d2UFKLW08RK3SPJ3+9KsBINgNSjQ+g/lh97LLhh4Qsd6msySd8ydoWwxX8sw==
X-Received: by 2002:a05:6870:31a2:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4a907691617mr6816484fac.24.1793632746903;
        Mon, 02 Nov 2026 07:19:06 -0800 (PST)
X-Received: by 2002:a05:6870:31a2:b0:4a7:4730:affa with SMTP id
 586e51a60fabf-4a907691617mr6816446fac.24.1793632746294; Mon, 02 Nov 2026
 07:19:06 -0800 (PST)
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
 <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
In-Reply-To: <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 07:18:55 -0800
X-Gm-Features: AclHuK8f43_19qDcy0p2s8OAyXrGV6vF3SunCYGHH5JIns_9PiJHYiC99rZWaqw
Message-ID: <CACSVV01=19OWZ4i1Bc-j8m8u0+5jtfOgqPU-VfkLUQUQ_oVdmg@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8a9eb cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=q-aMyWzK8yv6Tw-4Un0A:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX6LkGEMRROESK
 3Y9dDnAkZDbtTOqdVFfJwYn7nB6aEde7uC14vjtnRPHsZ3B/jIhifZWPtkmklZlCDG3weitKTZs
 9Vdkm0HFNVPKl6yqaHqGa3FcN0LUTbLR3lyzaYvneT7UuM5eppLxR3T5ASXBkXYIi2rpPeTMz40
 M0C26NKEU9Q3cSKFJ7y61dZd1TgV5NvjYqtf4XxK1ZuRjnZE22A2YlclSg0ElcykId2XjiRUMt5
 xu6qZnxQ9xnIQh5C50z6R/les8DQ83yjm9sz0qt3Jo5Yn0449jjsgEjhNAJePgJE5rxiH1yBmtZ
 N10mvffQYAyo2oUeROBjJ95MWVRdPCgZhglQ6qqj5IdofjNqQp0KiQmNOu5O0SI3xcQAtP9FhOt
 KgeNfPHKr2R/mg1PcAtQlqZnIMAAj2vnq7zlNvfi2NaAj1Rb9OtppnyDup6+ujX/USDzquA/pdC
 Hl90F+lyu0dRsFp/wDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX/HKvkD2fU9dX
 fGdl4GNxrkDxSOAnqzCFtViWmLV03Ehw+BUiJoLupb64U6gPcBk+VN582ingMNIorwODEParsBk
 CyCJqpDHpeZhunf+Fsnz7588qBxvCuk=
X-Proofpoint-ORIG-GUID: tq2z4nhbzq1oZK6PC1vHraOtOleCpR4T
X-Proofpoint-GUID: tq2z4nhbzq1oZK6PC1vHraOtOleCpR4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 5:59=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Mon, Nov 2, 2026 at 1:40=E2=80=AFAM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 11/1/26 6:49 PM, Rob Clark wrote:
> > > Use size_add() to guard against overflow.
> > >
> > > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range valid=
ation")
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/=
msm_gem_vma.c
> > > index f687a629629d..16b3870d5e90 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > > @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *=
job, struct drm_msm_vm_bind *args
> > >               op->obj =3D obj;
> > >               cnt++;
> > >
> > > -             if ((op->range + op->obj_offset) > obj->size) {
> > > +             if (size_add(op->range, op->obj_offset) > obj->size) {
> >
> > GPT and Sashiko are unhappy about what this does on 32b
>
> Considering that we can't have >4gb BOs on 32b, I think the concerns
> are probably unwarranted.  But yes, I do look at Sashiko's reports

Probably we should add checks that obj_offset/range are not more than SIZE_=
MAX?

BR,
-R
