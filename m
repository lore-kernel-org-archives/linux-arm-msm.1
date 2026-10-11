Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C022FF22
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684278; cv=none; b=Jipo3OhfA+q9C5Vjn+T5fUBIW/fP+pXadVJv6Ei49K4qpWFdcRyx4brbvSBKiTYlShtpS5aY3i2K5qTKHWzOEicGf7b+11aRS/3VGWc0mYcxtdeK1afyjxb4veQICGHGwmjqQmULpJRnFu6IXsCdYJjXajFH2QDT6Pt2p5tNQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684278; c=relaxed/simple;
	bh=sKn/nrmLPM5n+vpbEyLe8dLcl1zlOtOCc1FbfDDrLqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcewTwyUQcfFhpiFbBLwUJ1VD7rdQO5E1kZ1J2CGhGTkk941JO+DOZQ382YDaWJBznyhBHRfCjfdeFulg6r1zr5gVkHLUwiBj7NE0q6IGYEb14csM4kFBg+9gLE0Pwsl/108Cqhf4jVm4xAt37FE+//eEdF5lH3oaO/GchAgF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTHvhlF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqXo7TpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTHvhlF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqXo7TpG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1qDQt3329846
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fuBDltk+gj/ojNJZ0u0bn5L8
	8uJRD6e8V97djMMcdt8=; b=WTHvhlF37MzGu5NZhQwSb2wncZYhhZYB+HaAZfgl
	cL34Ly859iO+3Buqd4Wz0mHUxgEwl4ffAVU7G0hnGhIGJFenlP3pxhykSvoWwX4I
	WhCC/+xCG80agvMO5fZHX5kLolGPpQvbuuVqvGKNaFKCw5ntxNzGahjFGnko8Jhc
	U1VVCW6pT2dnZsS4hxXNfdmzRkSSln1EXtqZV9X3UZ57CoScqd1qwmM0gFHa+UQy
	Q9m/1LqrHBfrj9AAx93nbFDkjqg666oiTJlX+Sa7XL/HurDoQDGuIwKOb+gT0WN6
	icsktvEt8rTfua6qCEhHKvWsg3/f7zNSJo3UQdArfzxTFg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fagut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:04:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso693700c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 19:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791684276; x=1792289076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuBDltk+gj/ojNJZ0u0bn5L88uJRD6e8V97djMMcdt8=;
        b=MqXo7TpG/ESjQWKt8yGvHLh0uHDm12lYuQo6UtXsAtiV4VjzqV2v1lH1Afdke/u/Vz
         lblOTPiYAbWaMaVUwylj80RWP4TV/RPpPAy6Kiha22ADwJb9TSe1wWE669Oaqx3hKNdw
         7JbMq50wLRqEDzr+XAYdz1bdBtTfyU6AApuGQx/IXsQq5UqPQSDlfswNFczA9TbFiFQK
         b54Ud+zbVCgMYyewWd9N9yCD73qkOZEl0/HuR4Bi3ccjvrckQvzqOgPfnZHrDQ0+WzrT
         zLIvzgrtlZlmVODQfaFeCCrM877VXTFf6VGrvV0BMyRHjg8+VLDl1CgcNAt1m54kNgcg
         lRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791684276; x=1792289076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuBDltk+gj/ojNJZ0u0bn5L88uJRD6e8V97djMMcdt8=;
        b=0UW4Z94zG7LHJi+dvDD/Gt1D6IuZElNQIZQpq33n1p2WQhebuYAz6S4hhlFXSnBxAj
         MBsPHKqvBM9oGC2jVfI/Z08YrDQDsdhlymhgUf/YLO8RzAZIfY3cIml2oRpZ+x/nfG1F
         /RtubNwo8pHruOZVS5BBnhcoNfJ22xTm1VDs3Liv/RRnWXE/YLn92t3w9lQOVNgXMJGb
         PcDAhvG375TjzeAD0WaXu4xfInQaMsoyMLg2iWgVrdlMEjENKQpduuUsPdhFwZHUZWqt
         ZR44r7xishMAkYcUcbphzAi60kBOtVNQR0lwf8fyY0NOCr/KPtUR5TNgdwurZw7OwM3J
         nHzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4IcvhqwaI2gngk8dx2kTZvs5Zal1HlI+K8SqBAOsvp79I5H064LghJmT2sdqrwzKzVneJgpK2D7gqaTVp@vger.kernel.org
X-Gm-Message-State: AFq9FYKQOF7wAzYH48Vm6nVGc46OQISKFtchIlWR9M786po4siSPLOlO
	3paFMCwl9xLqPAahJy00jmKwJrXL2jGXJwS2ZGkezWp6qiGmp10Jmrta3L2sD8/KuLIoXgbSStF
	gaF1wuYw0E0M5WFJ4cTRBdnhqo2kmeve2hm2PznyKjeJ7UVxHlXGKmYE+a38uDR+d0gMW
X-Gm-Gg: AYBFou1il5pVq3yJBZW9tQuk8DIb6GvHS99/Qpbg2PvaaTQ0ST39QPEbzWYJ50rM2pt
	n1XTYgh5D5iAn87KB6G1j7mVqmkDd0q5UZ8qlywEOuMJvEUd95YV/lD7t6AAsEYbcrZp/i7Aq/G
	Xob2XAEZHgtYKyOuUbcutBYZQTsduU68YOndi4dwJhmaXOp7uNsEE4b/xZOJMaVuD2kARdMRGCw
	5sjjEE98mtjdaHV6L6VL7XTbQSLbMbf4IUAoaVfHDhmsXlUpzS+KGbvw8PDRpqOwjFxY54y+5Q+
	5LS7S2zWcqPZ11eh8bKYNGZwGY0w1uh3dBO4w1rr0VxOI3Fm/YAXnyXq+afodP9/n1hLzjJKVS7
	mdbQUMxnGrZYGU5KBIJKrhhpcnfyKDYDfM5wKFNnKEA==
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr9179277c88.10.1791684275936;
        Sat, 10 Oct 2026 19:04:35 -0700 (PDT)
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr9179254c88.10.1791684275265;
        Sat, 10 Oct 2026 19:04:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm20491794eec.10.2026.10.10.19.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:04:34 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:04:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asrurrjg3TbOHnWf@QCOM-aGQu4IUr3Y>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
 <asj8VnSmKBF3nA79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asj8VnSmKBF3nA79@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfXy9FRwSxthzXN
 RvRGoKYazSaBwtQ845sAj72E5ZLZSJadVPD3PMU0V/NStMTUzeeQr/EDcafheBrHkdM5ZBxsB2T
 V91dH3aR8dj+bF1wSBIDtQ5VqlWTPgc=
X-Proofpoint-GUID: -aLmQNm1oe-4E9ydZdwe8VS_to8DDqVn
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acaeeb4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ReihM4LL204W2qN9rysA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfX45RdQjTGaBXZ
 U9Wzj8h1nIc5G8T3SEi6dy99E2FE+eIy5Yzwf0ieFeVlZjV4/OXBi45nkWpCl24xr4aHmSBgitq
 k13MZxunBHkbXhh5j5T8W9Jx3Gh8L9NaWpTfu7JjnE3Pjaz+jw8hwSy6fdy45r/y6IS6Yii2EwI
 csaHqDvckE/Wt2Qvw9B6b2aZZ9Krs5tF9FilrtI4wPR3OyoBpwoPkm7C3WyAoYm09E+8/OneciE
 9ZQOA2vmhTsnK3CvZ7IJ8kbcACLTHvtyYisWi26BhDXYDBu8Cu4+jcCilX7JUDZk2QUlg8M1noZ
 0RdiKd15G3cIeFzkKHSPPkkpvzzBXGq/nX7sBNyfkm+Xi5aJapLDg5jKSyRxhs7GgB0ukmWdnY2
 scDDta4QwOfGYaGKRjMKnzwPKNZ5TT7XT0aa6H2zReOn/XWQOUYETd9i9kvxQbfxEpDsj5SXzla
 o5YM+VAlYATuJP4lnww==
X-Proofpoint-ORIG-GUID: -aLmQNm1oe-4E9ydZdwe8VS_to8DDqVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110007

On Fri, Oct 09, 2026 at 04:38:14PM +0200, Stephan Gerhold wrote:
> On Tue, Oct 06, 2026 at 11:35:50AM +0800, Shawn Guo wrote:
> > When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> > a crash and then fails the attach. The core unwinds the attach while the
> > crash work is queued: rproc_boot() drops the power refcount back to 0,
> > and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> > the resource table and disable the IOMMU. Once rproc_boot() releases
> > rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> > marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> > torn-down state:
> > 
> >  - the subdevices are unprepared a second time by rproc_stop(), so SSR
> >    and sysmon notifiers see a duplicate shutdown;
> >  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
> >    that rproc_attach() already released, e.g. iommu_unmap() on a
> >    disabled domain for rproc->has_iommu;
> >  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
> >    "stop" via sysfs takes power to -1 and returns success without
> >    stopping anything, so the remote stays running. A following "start"
> >    then boots the firmware again on the running remote and fails to
> >    re-add the still registered subdevices:
> > 
> >   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
> >   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
> >   remoteproc remoteproc0: Boot failed: -17
> > 
> > A crash found at attach time is no different from one reported by the
> > fatal interrupt right after attaching. Treat it the same way as
> > q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
> > let the attach succeed. The core completes the attach with balanced
> > bookkeeping, and the crash handler then recovers the subsystem through
> > the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
> > qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
> > cannot send, and handover_issued already prevents a spurious handover
> > on stop.
> > 
> 
> Hmmmm okay, I have never thought of this option, but reusing the
> existing crash path as-is by making the attach succeed feels actually
> quite clever! I suppose starting all the subdevs is really redundant in
> this case, but the crash case is also nothing worth optimizing for.
> 
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 8f3d45c604c9..0ecd7688a54d 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
> >  		goto disable_running;
> >  
> >  	if (crash_state) {
> > +		/*
> > +		 * Complete the attach and let the crash handler recover the
> > +		 * subsystem from the attached state, as for a crash reported
> > +		 * by the fatal interrupt.
> > +		 */
> >  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > +		pas->q6v5.running = false;
> >  		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> > -		ret = -EINVAL;
> > -		goto disable_running;
> >  	}
> 
> My only nitpick is that it would be nice to fully reuse the normal crash
> handling in this case, in particular the crash_reason logging inside
> q6v5_fatal_interrupt(). Can you extract that part into a common function
> and call it from here?

That's a sensible suggestion. Will update.

> (I guess you could also call the existing q6v5_fatal_interrupt()
> function since it should work as-is, but externally calling an interrupt
> handler might be a bit weird...)

I share the same view.

Shawn
