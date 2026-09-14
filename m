Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537C3AD50D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427327; cv=none; b=Hn9LHR+tPrbwtDDtip+tShSxuZEQ57bgdrK5h0IDDAxgVALoIeyFgNpkRosBr6wIqRQgOGx3uy0EZOmOBNC8fSFgWtgOWZR+SPbLDG0AB/PsyX/08KEqfO1iU9evF7QNsEXmmALlqPTdcFPt6p0pVJNoGhM1ffpMLO609ZuNe28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427327; c=relaxed/simple;
	bh=MM4HmYEslwlFT8HkcEYriN+iKsGM8sUFm0m8up2LJO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZoiRPwHSQWBbVBJQcVv43pg+iGtG8BEsFLTPysTaVoIL/z4Z3G1qYQ6H5xu1madhqv5d+JXc1KYun39KTrgv1CLimdU2ujrWBKaByhzCpHckUskb52sOdSNFlUgYCMDn61ynihVjrhWb+3oV8fxmAtsAbXhy1dR6b5XH5RubMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWYERCwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qnfropyq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWYERCwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qnfropyq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN06GH3071352
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 23:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EOf9jLDathiKO1GdPmBUWCGG
	kUylbrTzUgoCUbTBCZE=; b=CWYERCwErA9YwhYo+x2NFwrUzqRRohzsoxsqdi1a
	95MeXnHD1MH/ik6G9oONeC1tThhdKaRMj1ngfDplCwnOWI226dqbLP4lFEeDg/fG
	6Cvz3pFB85SdkdccAYBTibDxN05WnUe/QbLbJf9MJWz0Nx20vIsi16L/n9mhwjL2
	s0ZQeRgNJHf2ahzIVZQjuU8sQsJ2Y3bD+6fH0Imm2kZQ6z2DXiiJr1oT7qjYE6Cv
	7u+1iP5g84Sg3fhmr7a76kJKDQNvqPv/ZOtiNXqVIAkwrc+PGn/4j6NtqFbczyvD
	UAZ0jCXrn62A285mppAxpCuoFQjQweEA4LxxXHMvTKgPQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeexb0dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 23:08:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-790de8f0cecso893621137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789427324; x=1790032124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOf9jLDathiKO1GdPmBUWCGGkUylbrTzUgoCUbTBCZE=;
        b=QnfropyqyoXkaay8wEOgR/YVLdbvU0SVMUX8eRmVJyNxpH2Ksk/l+EPzPCOcLhAOjU
         Ar3ffEDe1CckRQAZJ+1DA26EUNacRBPrBhLOyDOo0YLIiaUzprGzRBDLloxs5DKpfRpz
         jPu31kLiQ6QLs8Ro9TfjfU7cpqkcrLBtYzXdVfFXAjeo+9OSYbnqjgIAOY/IMCkBYB0q
         kkN4QNxvefkbZh48Upz3ZUpaVo2Tm513DYWtCyeIuqszINRKQN94EbpsNTCc2FA9J7oJ
         3wyAMyfN+h7VLj9LhTZ5B/hwM9sbWJjAGydVp7DHyee2DeDZKzl7X85cfAcWU4W+uIMj
         OkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427324; x=1790032124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOf9jLDathiKO1GdPmBUWCGGkUylbrTzUgoCUbTBCZE=;
        b=h3IucLBsJpeU3XsTq9KHd7zKe28MD0Yin9/BAiOjXhKsnyukZWa4dPbT0d9yEdBpah
         ILpeJCo9haZz4QKdN4d8BwUceFbXGK5k5ZYulMLnN5XcnLUsWQuTNNinZKl/SiptdAdx
         GonY5YimJ9rc8IjYmgR7eBgTK6tYGc8lFpPGAhtL3F1ZyJ1eilYW3VWM894hH7BiqVbM
         YEY5P6wibdP/Xo1eJ5jGh55fIaugtKceb8/dMs9Mab1pAHrZV7UfqwbxmRscMhvJ9rRB
         m5TuXW2NHKe9duYqRHzEmEk1HTOHGwq4QpTWDElFrWLAoy+WZQhfI9qnt2EzCEKt3dS8
         wSTA==
X-Forwarded-Encrypted: i=1; AKwUvBxI5btUfGZXqT0BIEBS3tZ9bDmzNziD/t5j5xJMnjXw/+Xx6A0xmNCL4rx+Fjku4sxb03AQff+BKBxuuoPa@vger.kernel.org
X-Gm-Message-State: AFuF++kou/zorofcckAxOrjLqJKwsncdeId1cFdNwwTqkNfLXiGiCLdQ
	D464n5Qex/BLBez4C5re65taSAgg3Js4FO7zLxQe5ac4Zr1RvpPFWN9YIPg9RpkT5CvD89Y2sLU
	ovLiHRRU40K76cTKTS8s/ujRKrU5XzldMWnZcsQ/3ALGaQBF+xGHi0Q3GPGgtffXgjd/C
X-Gm-Gg: AYBFou2799hb2bFsfmobotmM/FjgGOJOEOt8vmJKBtYDMz2oiSAhyZVbXjTpZw3C+1S
	Ox+uNqi1Ffs1G0KYRjppsjJh3QB4u3b1zXsjKsYss9Zq7Sgvo7VcECdn0wFnTRK9HyLFePJd430
	60uCfYm4o7xQZluL/SwjQSor/f9+6gf3MmMTNU3+k5Zs03KucAi8zAzh50SsZF5zeOtMKXOXcx7
	cfynnXYIJb5lewQ7XdYkiA1OHo1maj2FK5HKansOEr9HkN63BVrWZZsGzDMmxnXz4HeH+N7bSDY
	EnJZckweAwiC+0o/Lq4PU/mD6zek701XCDzaqqqldUjFWXk82Fe5ZH8oxzCt6naDR8Nq+N3HQWm
	UNk2K8+KzfrQK0B2DhQ8GN3iCbeu1EOzAoGOmRV9kj4qNItfjPmBErolCPYEEc9AHVHkxEyI4hf
	HJqBAbank4jEMb
X-Received: by 2002:a05:6102:160b:b0:785:e069:6c5 with SMTP id ada2fe7eead31-79b5adb091dmr5457427137.8.1789427324389;
        Mon, 14 Sep 2026 16:08:44 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:785:e069:6c5 with SMTP id ada2fe7eead31-79b5adb091dmr5457408137.8.1789427323825;
        Mon, 14 Sep 2026 16:08:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5b433b5a6sm22229601fa.4.2026.09.14.16.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:08:41 -0700 (PDT)
Date: Tue, 15 Sep 2026 02:08:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saim Shujah <saimzst@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: clear pending flush state before physical
 cleanup
Message-ID: <3mhqndcw4defdpdo7t5wgb4ysh5cai6b7rq4sargypesxr67bj@6ibdnfmgyrol>
References: <20260826182459.1506522-1-saimzst@gmail.com>
 <wyoltftfpoxowxs4g4uwa2vi2pnspubn4vw4l2y52bwrhcjvew@xh3og5yp7uaq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wyoltftfpoxowxs4g4uwa2vi2pnspubn4vw4l2y52bwrhcjvew@xh3og5yp7uaq>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMzMSBTYWx0ZWRfX3zfQHjTDQVGC
 x8DI2tID/UC95k6aA1TMK0RfGHIBMo6iPqCIriIRnVz3T+KFQ6A54M243HRVArP+FDKMY4v/iNV
 pDtyVJP+lGVPiyzWzSaPZW95LgAb62tk0It2PJR7ProZUUhduiKXFp8EDRN15LeG0kbiTykD7ld
 IrP8+qgBqy0rmdppH3QB/7j9R+scSpSVChFpfPXq1/7TwdUQOD5IWF2Q2CB+rDBXuX629eeITb2
 th5Sd/bELdCRRezUS1U02781bejnuEn599fv8vHLOxaB4u/WTrLTurMWJXmyNmivpBPjfpW4r9t
 dYNAPQX2/A8SQURrQE+Ch9aoiPMv/UyJxPGoZqrISheaXzhlF6btMmbKmCiydc4JelSgTohfy2P
 cknhx1zT+FY/v0u6T6zi4VLsriI7bhsx5sBnB4+Fnj4TAwCUAvV3xHlHRRfrfe/3Ce/yRo8G6YE
 4EAIIw9FoaPkPJjLLuw==
X-Proofpoint-GUID: z1loDj6_QuEwUwVnJiB8VDwJ8Of9kUHf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMzMSBTYWx0ZWRfXx299WzWvQagm
 20xIGClur+L0yIMulLCHoEhEVglibtNTL0m85eVeTA1cI/Llgcnyh0cPwyix6Axal4oFQ8Z6X0t
 DNmH8OWmfzHdfgrB7xrrrGrV2hBMqPM=
X-Proofpoint-ORIG-GUID: z1loDj6_QuEwUwVnJiB8VDwJ8Of9kUHf
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa87e7d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pG1nA-xtObB0exEfb0QA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140331

On Mon, Sep 14, 2026 at 12:59:30AM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 26, 2026 at 11:24:59PM +0500, Saim Shujah wrote:
> > Hardware can consume an active-frame CTL flush while the cached software
> > pending-flush mask retains the submitted bits. Video-mode disable stops the
> > timing engine before physical cleanup, which then adds teardown bits to the
> > stale cached mask.
> > 
> > The teardown trigger can replay source-pipe bits after timing
> > stops, leaving one pending and preventing the first commit after re-enable.
> > 
> > Clear the cached pending-flush bookkeeping before constructing the teardown
> > state. clear_pending_flush() updates software bookkeeping only; it does not
> > write the hardware CTL_FLUSH register.
> > 
> > Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Saim Shujah <saimzst@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Unfortunately this patch breaks several IGT tests on sc7180:

kms_plane_alpha_blend@constant-alpha-max
kms_plane_alpha_blend@constant-alpha-mid
kms_rotation_crc@cursor-rotation-180
kms_rotation_crc@primary-rotation-180

-- 
With best wishes
Dmitry
