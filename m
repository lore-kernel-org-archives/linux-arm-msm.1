Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C837E5E9
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338926; cv=none; b=mYceBAdBw7+yChOYg4hdCXn2EqkRrDkYRvfJNe/3JscKFd4c1jsLwLZ7FT6nadNww2ZHv1SLD8vWaYakrjWPCYfJFhCq46L66G513BbGljouB9RI73yza/2En824B9iRk3RUXnfRB/nURFkEd9c2tKHzAxZaHgHM44wyhZtTAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338926; c=relaxed/simple;
	bh=lDGQkV52tNAwRDdyqjc2iyUZklDZzWF2FU4BJj9YeNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzQRQVyc01pE2fC4pWomLqtfVVj7OojHsxozRGW+ak873ODF/kVpDqtyVxXV9YOE52J1uxk/aHFQPOykEpCsP2brn3mXMv0HddpSf5YIlJSu2qbKt7o0hqMmX/7Vg19+aFqZpmtPfyZkE8zjXQTSqN0Srj3+8cDc9GDOZ8nAtog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obnVHUOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXU04xl1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obnVHUOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXU04xl1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DLCFdP2995830
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gGjBGJoSmsokLmdBE5jqddhDUHQavMfrQ56wMdXWYc=; b=obnVHUOWDNizpRcg
	30MDH1Ua9xMoqv2y+sPLzo3kfeLMjoSuNVBxaSxoCeUr7ux7I7WN9mkPDpzBd5+h
	A8CThln6KoJwSLsokbEHOUXmYY3eAHamM+kW3zzF0Z33L8v10Zw7DKmrUAbH9rl0
	RGrTIsAFbNhru6PwUjFuaNI30Uyq859BtyJT5DtXzdz7Bn39zkZTuRP4XJXh9M6M
	4jmtKpIJqueX8G1jsuVSbnGBT2yIaRt6iapo52DjsCvIniVKL1M5yG80Z0udAv/V
	PMEsPcSEyeiRoD8aC1GA+f/cZkUQASnBRPFe+xBTXv3Fcvb1Ryz1x3YtOHFuScpH
	pQr/cg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsr3w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:35:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so2121365241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789338922; x=1789943722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gGjBGJoSmsokLmdBE5jqddhDUHQavMfrQ56wMdXWYc=;
        b=iXU04xl133M38EQ138/9HKpqae/WTF6KDQWp1kOHA/84FXj8hqGA7sgjK4NB7dVT6c
         iwPcibViz81bWYYjfL42jCmBS4r544aG8Gl9gAkhJVVOLmzXalXlsZPTya02Bu36clIh
         EAvhQcaUcJANjjMPPjybGyTxRrEvcZCKoQcKZJJSnbP4/uWyk6ylgqDczTZoVqJkWfZZ
         Zyt8qbjHc8gjh00X/VriHPeMA84kzt6j6PHqjkCnvXabCmyy9zrK0plJ5wqfhv4/qWOh
         Z/Z/FDAfW8QzBUgou7tYD3TBkf07JuTBZ34eZTP+Nib702oEn3L2OtL3dTptYbHWi5NJ
         IjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338922; x=1789943722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gGjBGJoSmsokLmdBE5jqddhDUHQavMfrQ56wMdXWYc=;
        b=S5mL2Gidqt9ws8rxdfu3VpObN0GuYLQDhP19FIvieG9646OOZC0Fwtdy5uVL5sohIt
         ftuScC+RWwOsRJJDnsJxYjJ/ptGKFBcF0/NvGF/iEqIS9O8De/pLrEjP4nsaBfV587Sm
         gThuXJbIVRp0DPJFt3ZMXfbD2FPIXr9kT1PSmjgvRGND2OMzil5jdSi/FtrAa5L4Yu7N
         neFoOZuxf2ayNljxQD/ocxKWiCuHXL+eKEf/lcoCxV9K6947VEFL5GWCrlLZBFrtZ5V0
         cODPqZaKFEI7nLTqlngrI5lTx7sTW7vPkxOSmvcTSWcAKjM8v7UpYzqEPutzhp7ETTfv
         vmvg==
X-Forwarded-Encrypted: i=1; AKwUvBy7/wYnGQ3dBC1SMHCjFK23P2KYio2Xq3KQ3KE48eYeF8wXQlG7kjhuvL4RxNiiitBntylcIpSY2ygDnHVT@vger.kernel.org
X-Gm-Message-State: AFuF++k1w8o9gdBCco9BFQqcx0MoxF4ePlbq6AsHVXbOpyYT1MOlwist
	FTkM4SOC7f18kaLyRc2e36fVKfcXNZr0QzYRVgA/MpyMenHFjpmNHIjuBw2+6mZU/BKn0aC8/8C
	QM3TTAdaj6LHLK70GECTziGU5rTKSeSZ+r+l6wdbYHvcH0VsGMOVfbqek2fr27+XNYCf5
X-Gm-Gg: AYBFou1RdK5BuNyl8Qi0eOrbMaXEBh9qEsBVQsTBxpjn2tb/7dItfpOrEY2N//fTeb5
	JcLK8dGibZxo0rzfAkQnc6Z5owd1JzsaE7tpajQCfBMGLAQQkaHNSn9B6q+RI2zIWVfX7CLgD6K
	Ujp63ohXpUXINLpT80cNNnX+hm9OXe7KlD01UYUpCwkydy/6nUOZmItlqZZBJK2eSe1Qrc92T7K
	TdRkaotXvH67/X67ekrAxYY7S1EwQmbSmdD2ejuZH3uZAoTv3HQevds9oHz8CqhP7RRr26gF1OC
	OvfiOFl0qyqhKwiOWsXPlpSjRBKNkGR5mrEh8uZZ2dx9rmE3JHMxeWtnw+D582FmlySMOPY2IN6
	AdEnEaCezsgbb5WjNSP6l2EExjsIsjfhv+Lm9tgVJlxzpL+QSMnwA41dmXptRYqqwPKzBSaVpK/
	J9NJAPj052i6rm
X-Received: by 2002:a05:6102:3e85:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-792aced9446mr13843913137.12.1789338921842;
        Sun, 13 Sep 2026 15:35:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3e85:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-792aced9446mr13843905137.12.1789338921470;
        Sun, 13 Sep 2026 15:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461ee3sm1974410e87.40.2026.09.13.15.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:35:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>, Teguh Sobirin <teguh@sobir.in>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: delete timeout timer when encoder is not
 busy
Message-ID: <cijlihrrros443ff3pivdlzxwpu2hhhsfpieb3f3vy675zi2vd@qnol7ixz2oee>
References: <20260903143004.1026181-1-jun.nie@linaro.org>
 <CABymUCPzN89G6pSH7hG44hRupeMoyA+54BRW+mW6tT_Y21mXCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPzN89G6pSH7hG44hRupeMoyA+54BRW+mW6tT_Y21mXCw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyMyBTYWx0ZWRfXwd52HWjFdGqs
 D1LbQLtWocjUP2pfzKRmnz68dEcD/QGT3GmZyiH4BJnVDYyDUEG0g8nk9gnoRpbqDiKeJYkmJbH
 +DjiZiCNgS/ZZYSdk+zeT0iWFL5xeQj8LB607izGp6ygAPPdhKHIzBlshM+zpr0KFpRc9rYgIWW
 09lEA/stJr2FNjtI6dHX3lT5SkVs4j6ncQ06/ro+z4eZowFt4osjGEITwg0z3At6JQ4Aw9wVFFu
 TfJ7L53BRyixisALdWI7TuaiI1zLDc9xqUFNSxV+btZut9OkMa9LUjKgCzgOXUoNR4YtZ5ISL13
 4TZCrOOZOf3nYX7Zv3yTMmFFYZeUExHBccJg7UmaQioSas+vcobId1NMZKKR3czWmkyuIWAKDr2
 weHQ47F2/lostjd+FPPQr5tYLYbZ8tQ+qdcP/flnnHY5U4hT5ZexZl9ig44w8v+tYtalzoVvhFf
 8HIdwScFBSeiM1d2AQg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7252a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=Er_q02hE0Yr3fhQkg_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: x0Z-MUyIiooqqCJrxffMl2lYrO2hKxq3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyMyBTYWx0ZWRfXxfI/lXP3oHsF
 S6lkqku2+iaYAQGxxM1tpm5DE5C9NB7qypwz2gRu9j2vSy6ULK+uGFzxzYAz4NrMZzf7Gf85lxB
 A/RBJtQeYa/SwIrrlQEx+MgyMogkxrs=
X-Proofpoint-ORIG-GUID: x0Z-MUyIiooqqCJrxffMl2lYrO2hKxq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130323

On Thu, Sep 03, 2026 at 10:39:22PM +0800, Jun Nie wrote:
> Jun Nie <jun.nie@linaro.org> 于2026年9月3日周四 22:30写道：
> >
> > There is a spurious timeout error message under the following reproduction
> > steps:
> > 1. Run "modetest -M msm -r" and press CTRL+Z to pause it.
> > 2. Run "while true; do rtcwake -m mem -s 3 -v; sleep 2; done"
> >
> > Resulting error message:
> > [  124.018206] [drm:dpu_encoder_virt_atomic_disable:1425] [dpu error]enc35 timeout pending
> >
> > dpu_crtc_commit_kickoff() calls dpu_encoder_kickoff() to set frame busy
> > bits, and then arms the frame done timer. If the frame done IRQ fires
> > between these two steps, the IRQ handler clears the busy bits before the
> > timer is armed. As a result, the timer runs with busy bits already cleared
> > and is never cancelled by subsequent IRQ handlers, leading to a false
> > timeout warning.
> >
> > Delete the pending timer when all busy bits are cleared in the frame done
> > callback to prevent false timeouts.
> >
> 
> Another option is to wrap the enc_spinlock lock/unlock pair in dpu_encoder.c
> and expose it to dpu_crtc.c to make the sequence of dpu_encoder_kickoff()
> and dpu_encoder_start_frame_done_timer() atomic against the IRQ handler.
> However, this breaks encoder self-containment to some extent. Furthermore,
> initial testing revealed a deadlock involving additional locks beyond
> dpu_enc->enc_spinlock.

The patch you posted has an issue of the atomic value being updated in a
non-atomic way. However I think it's not a correct solution. I'd just
delete the if from dpu_encoder_virt_atomic_disable() and always delete
the timer. This also would allow us to delete frame_done_timeout_ms,
simplifying the code.

> 
> - Jun

-- 
With best wishes
Dmitry
