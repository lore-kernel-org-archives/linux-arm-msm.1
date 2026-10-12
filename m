Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EC7475356
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807803; cv=none; b=lsE25uthl9mnNpOFSygMHyrKE/ipfhvjtkRj/XfsDHwluY6DyFKQ61k+Jy5AeWona6fLG8p4Ed6gD77IKgpeb3OY++AWvMKycW2dHUVJSrjS2bKvtHIF6AGXITEGvxGJWf8UGi6tczk9IxEp9oeJn1RlvE3R1GC15c6NASNyuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807803; c=relaxed/simple;
	bh=K/tySS7QYNRys93PcR8NTp1is92ZCxAeVbseXVxti5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu0QDkDqv0HSKhaO5zejmDt09J4HzziwmcaykquNS4YjdojN0pVyKNRbASnTsdfo5iKHimOtJqYHnZzlV7bQoL8bz3QFgYWulsE3ZGBnxO2Lbpz8mH/fWHPSR/7xoRPA4VSJfFeojUJRN4vGTezQ06ms+SHnyh7h9EMNfC3e2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfF2DObP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab/hI4Y0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfF2DObP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab/hI4Y0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsHx1404376
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Tl8k+BUtJHQINnzIvG/Hxt0
	atXp7wqqlJKLES8ZXeE=; b=bfF2DObP1GUQk3MjpGiaDuYbdQIZtU7V482r3uZf
	1rTwWpH862AfblPqofka9my1B311hvWsKg1IvCIwO0TBv6y+e7QMOqZxCnv8dJZX
	+MxS8v2qhBxszLRlKUw7m90iQXw88S9oOh9tfYFQHApFYfuxY0CHLWhkaqq5zYMr
	4Glea8rF6Nxkn38K9jl10RVrmlXHyU3J5kJGGunH7tJOY3Xf5SPYnvyfjBdGl+CL
	XI0V1E1TiiW6a4jsCA2WeKjubNAI7irfgSJYxLxjyisiNjDukiFVCjwm5Ee/USYH
	uM9A+q5x8EyBu0jAygtn4LcQeB1cvdjFc+inxAIsl4heuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ks1ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:23:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a510b22fso46056786d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807800; x=1792412600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Tl8k+BUtJHQINnzIvG/Hxt0atXp7wqqlJKLES8ZXeE=;
        b=Ab/hI4Y0dyzrx2JglVjpBroNvXUri3NL7mTRkHIhRPVZrFt3loV4v3xIDJnIKRy9wg
         UzqrnOFZ8CAg0grRtoarSuDXmV/yV6ZK22L3T+wxpMxAmkLKqDfU02tKlo7m5XAZ9BSM
         P0AKWZqRwDwQCTVjNxbw+IF4zKsDYgri68dP562h2WeHYOiL7kE9hzA4Io8fBQ4ZqEXS
         mpGqKBMIdFEdNAfBILLfJ8t0dCMfhpPOgSsvH1pT3xeltM8adGm613XfURyho8v36wP/
         w9W7LfmRFp/LgwChS/tp43LQciTSMeUfxjbcCXtkiZNXfwe5SYo7COIUd3joXd2TgudT
         LvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807800; x=1792412600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Tl8k+BUtJHQINnzIvG/Hxt0atXp7wqqlJKLES8ZXeE=;
        b=ha0xTtNzq0IlsTAukoiBmO7ue+Xn1dTmP7gq6ziL63fYHh/JExH3E+527hu0nh2Sfq
         x5XPE/VZMQHPQSS+Oq2RVQJLs0VX6csONQi3HPNqadVAR2te81AWyX99melZfo2nzKI+
         UmFHQAYLS+wHcgAfG4kVFVEPTPMrM7EBDCu7TJrI266KqNguIUbGOO1wFXz+RTIcR2Bu
         Sbu/PoDUNh2PsRZ+QkjU665w6aa+PlgilBldxQ1huX8m9acvyeGBwVS0HRuaPg0oONi4
         D1zW5B0jKeCv/Cbzpp1oJM21iT29S51m4YNJd4ne1CZtT4T5UWLZPJK/CRJdBDvYZb2c
         +N6w==
X-Forwarded-Encrypted: i=1; AKwUvBwyRAhntVrs/9CUrKCKP5Ht0bpou7cH/AX9l4qld86NlyakiurhmWkPXVT5WkrwoziRYf3XSJDkhBOATrtG@vger.kernel.org
X-Gm-Message-State: AFq9FYKF43hmq7su0J0kTicU8CUNVQusrjf3njoaiojmsysvI2tpe+ca
	GeiOhD8I1dUEfM9QhJqsI4n0lv2tPKwnn2vPp1vRgRlh6NQ2QKBAO+KSBlDRmtjzP37Q13zocQ0
	dJ0Kd377yt4GUbFb7FRV6lsvcgS/e9pq0bgjPv6qL8kP0rt43hN58C7TDZsc+EhBShGd2
X-Gm-Gg: AYBFou3W1/jZpIJ7r5vG+TSvF3y57ffTcLcVAtNIzdGzQkFGn9wLfPm64iAnmWftqmV
	gV1oJH8+sxgOhDxNaUlr49w1PjL1dxn11ZxEjgtgG7m1YYXfLFf8Vw7SmxaO/D/UjR1CnFj0mca
	jIOwa4B8iG98FDhQMp1YwtdMzv4Dnsr8xPwcR22ZujSmB6ixyuhOPqNV8/eRASqFT0MtO2wyW0g
	/1s5nBrnVYhGR5kodKyos47pgPK0TZuYJ0Qji6RaLd2tHOeCP5PUl3nPpiKzAQXdfH2aPA9eV2u
	DN5FEs1+iqEkujtm3+Z0FDmYZs9JhmaW3ug8p57htMelXB4dhCyt9G0OxNPjfhUsUrS5RmKzb/B
	j3sEXwzyWrfoSupOL+jLMdW7IeKkjkNNILe1GhyGHc0k4YNb7rQZEm3snhwrirVl/pwoS4mqK4+
	1sZe9KNMXtL9nd
X-Received: by 2002:a05:620a:44c3:b0:93b:d79e:18fb with SMTP id af79cd13be357-93ebd4a86b8mr1671170085a.62.1791807800323;
        Mon, 12 Oct 2026 05:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:44c3:b0:93b:d79e:18fb with SMTP id af79cd13be357-93ebd4a86b8mr1671165285a.62.1791807799753;
        Mon, 12 Oct 2026 05:23:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeccd5esm2790210e87.82.2026.10.12.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:23:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:23:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <fx5njelx53gciz6rguzjybxgbyxbfqweelsuy4j3aab2n5awrf@n27xvmre7ztu>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
 <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
 <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXxfAjZ1DW8av/
 8wlZ8MM0CGYNK3zKvRzO4iH0IrP8s+15Px7S3ojffT0uWBedeVB/Yu+zXizFHd6vmpQLai6BYRT
 vIARjsVsD8IKkTZ7f0u+qIQKzzXf1YUGXiyavDkjwqFa/nuDS3bSyXxRE5E6lI4vBBOexUIb8Dc
 4lUajmD0e3VjuTKmtxPVuzfSOeHJqgtgMpBpV77Oqj89ZhXWfq3UCflDZe7SX5aqbv45N7rNkPm
 pYFHCeg4iJH1EkU6U66TdXnTfJmCIRwK91S0ZqQgWoV56CklhroTymfjJ1Oe5862AXWqXpL6PN2
 Wq5br1yhGqWHHFBwmPLNXF6lAwi+vBdX81cDoSYM14/XxmRj7VRxSiGN8M6exGfGaKAQ7+4OWRC
 5JvttNN7TeZr+njp1LXBI7FarYFliqgyX1zKL0YMzNRLTFyzJbsp0VLTCv6XGqO7dE/dBLaMjYh
 uhLHWhNIplsxtJOVUwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX1t9QdbRfhOz6
 8fM1Qu75BpoG1ZzD+Zr7r2KiinkWvCV1f5KV3rZGRWOGNdYLOahRSeXsIzxZOTMmnfj2KoU1dH7
 w+3NJFfG5AR2p47KBQ+YsEwi6tNYKbQ=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accd139 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ecUC0MPj5Ne1r6wDHHIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6r3c4hBu4zTbrHgcSw2Vv0q0RpTAWvnm
X-Proofpoint-ORIG-GUID: 6r3c4hBu4zTbrHgcSw2Vv0q0RpTAWvnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Mon, Oct 12, 2026 at 04:44:06PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/1/2026 6:32 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Whenever virtual channel slot allocation changes, the DP
> > > source must send the action control trigger sequence to notify
> > > the sink about the same. This would be applicable during the
> > > start and stop of the pixel stream. Add the infrastructure
> > > to be able to send ACT packets for the DP controller when
> > > operating in MST mode.
> > > 
> > > Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
> > >   5 files changed, 51 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index e1614bc49a7c..65d22505c2b6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
> > >   	bool core_clks_on;
> > >   	bool link_clks_on;
> > >   	bool stream_clks_on[DP_STREAM_MAX];
> > > +	bool mst_active;
> > 
> > I really don't like the idea of having this flag in two locations. Here
> > and in the msm_dp_display_private. Can we have it in one place only?
> > 
> These two fields are intended to represent different states with different
> lifetimes.
> 
> msm_dp::mst_active tracks whether the DP connection has an active MST
> session. The controller field records whether the current controller/link is
> operating in MST mode and remains valid until the link is shut down.
> 
> I agree that using mst_active for both fields makes them look like
> duplicated state. I propose renaming the controller field to mst_mode while
> keeping the display-side field as mst_active.
> 
> Would you agree with this change?

What is the difference between these two? I.e. what os the difference
between those two?

> > >   };
> > 
> > [...]
> > 
> > >   static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index 83117e7619f3..472429d09200 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -19,6 +19,7 @@ struct msm_dp {
> > >   	struct drm_bridge *bridge;
> > >   	bool audio_enabled;
> > >   	bool power_on;
> > > +	bool mst_active;
> > >   	unsigned int connector_type;
> > >   	bool is_edp;
> > 
> 

-- 
With best wishes
Dmitry
