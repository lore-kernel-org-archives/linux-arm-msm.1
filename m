Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7E380FFB
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339523; cv=none; b=g0DdbGxqABeYM4Zq6a2IxiOMEotQKz1lO5inCWwA8xin9AMGXVI/pGSXwetXG8NzHZ9TeIJSc27r5OMTwJuAqAHKtgZaeMZ/3ZLn2TqTqxr4ioAGOG6Jgi5tC6QLgNv7eNX1+fWd3BTnnFbOaotXDl2XR9w4CCcqL0NOZVvwoDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339523; c=relaxed/simple;
	bh=ZLiHa/O3s0e2tzS5Np/2fB/q1gAHbIuVT9ahwkti77c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWP/UZYuLaznxe1mdXt7+82qm8aFSnarX/gQLkujbksbNbKqwZ4/25Jb08k7cRyVnX1SBFRUySQloogSsQfuR13tpF4ZxGa9ctXGG0AkVVFTBWQwEC90sl1On3fbNa758rdc0Iq0dNGsC87oGT78ovWp0T9ZteP4PcijlUy1/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ0A262F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMwmzCEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ0A262F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMwmzCEw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxhYx1425011
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=daD/zPVERLcknSPfWxaXIlNx
	QG5d4LXKc3bwm1ECFEE=; b=AQ0A262Fw++6GHCgROTUj6tMhxoioAq5mvuZGUnn
	8XI1tNaD9wyTFy2wqAXPGRlb6hZz7tvOGrHWkuiDtuopWML5oxDIZOfhR7Ddl4gT
	OYH2nMryeKw/F/IMg80NcrLGSSVjCJnBMVRf/RtrqykEoaQxVGPlnnOpiVoQt3AC
	wSlv6A+ds0w6Z8CtnRHnmGIy1Ahf4FremIh7LJbpeJekRRBnh8iUd63KtnLJY3B4
	JA/yGjRCa4JAUDHlpkpKglzOjDkVaHR8MuKq5ivHhb8XYSCX0RBAg9XpieR2ED9k
	KVLIK40OaLR0MPPOAw9MBqI5ZAMSYPFVvMdVnljj2Dm+4Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh44ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:45:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so771728e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339520; x=1789944320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daD/zPVERLcknSPfWxaXIlNxQG5d4LXKc3bwm1ECFEE=;
        b=jMwmzCEwkNCPLkjXac++y+IYjeWfPWaqlALnI5omJPbHeNxlX/7Eh/gNcHu7yDxOJV
         yJdQWN87aE1NiMpe5dYy/XA0ZZosUe/CgsFeFVioLGLnI2F9YIBUrajIwxDnvo2IxMZB
         5oEKB5kAfo1Z/kzeD9cefjSZILGzz5p8gPyNFmRHcXJMd5vHdtspf8z7jv3jKPsE8LS4
         kdrWSdD7S11XU1INXz1griwpIOvYSRywZYxFmYLxJXE0rdW1ir6Jt1ps6oc7jRzDEqDN
         C/s8anJa6t14DWuup7do1sQVc6gUACCgdiuOedXGBAoibWFKdNlESsZlLtRCvcq0O1Kv
         lIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339520; x=1789944320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daD/zPVERLcknSPfWxaXIlNxQG5d4LXKc3bwm1ECFEE=;
        b=UTK1Y6+133HGyAJ0PzgJ1x6ZutNz9e1rKplU3cv+2ssOpPHTyzSGNu9lWE+mExHlB2
         QqnqD5MlAXVaJahslkg8+Gbd2acHH0JNw1g4oRawoIL0DNxYCF72BoB8+YKTK5060TJp
         yU3cUS9Ji8JaOc2SGtrfwk7EQIBTAyJVWkcdbeXMeFy/mDfSZYkqd6Em6wa0q3bPZNJo
         RLjpvN6YhbwbQfdJRqci+kDHlObSlKE5JaNYb3lO83o7hVFpVATaeuJiUM8HjEC0FRLy
         gftQtBz8XLuodlEn1BxtaFNGl0e+sb2bkkroBZibVaVQMn8unYy4SrknVB3ERf7CS2rd
         dRnw==
X-Forwarded-Encrypted: i=1; AKwUvByIZ+qtgTDByr1yLD1hm1juztJrJ9rbDbYL0rCWAhwWi8JXH8vbnlB7fZr3sL+FRid+hcRqT7LefkZbH3c5@vger.kernel.org
X-Gm-Message-State: AFuF++knEfL+qdFZ0UkUoxNeOJB1Y9jWctdVGr5J+Wm/UyIBeqpzpg0B
	qfnRJuETcqibQIOXN5X0VJ8uP/QBpNxjYajjCL9VY5uFbPD+R/1ZQvfJGdhIPREZWgSEIyxYWdQ
	3nxv5EWuU2zsb/7fPQjV8pLiFYeKsc6qD4C/Um2PFQ8nm0UpkTlj+06oFuF++KqzlniqSRo7RL+
	rM
X-Gm-Gg: AYBFou3WNTaot/oUA5Gzf2a1KHj9AwRswbClUPtvRaX9QiCEzyI6SS9/LmsJAXuA9oq
	ceT2U6XHVfFOsFrSseYIXJst6SsTO+8kQO2qLnRrcVo4KObWgD1rSVWqDx9xyOvMCCIlc3fL1lT
	bK+wP/A2OEcDmpZWnmIic451n8y9tSypbexbsKAoiWFhdnN6wBDM813bavnH9Ifz0OZoRZW8vuE
	iQmYu+FSTKCBuQH5sKZ6j/FbLgOTg/X2qabNtTZFucEalBA5ZKnnBuJeWW8D4/tn+rwwQ6/jJjR
	THNuJxEmUfqVZHVjwCQLeEVs2+kzL/w15kKuZRaJJmNKrCG8FRRKqGORzF6j1P0wuH9riGYpRLj
	4C+MVaEtg+QIF6xrrghq98g+TcwMGuFfQQIBSUO+IBkp8rJ3aqMFcJAFLn9PJfwoaFk+iLLCyUd
	48jMH1wF86jZEX
X-Received: by 2002:a05:6102:3c82:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-795aad39567mr3174403137.8.1789339520120;
        Sun, 13 Sep 2026 15:45:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3c82:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-795aad39567mr3174380137.8.1789339519561;
        Sun, 13 Sep 2026 15:45:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04709b3sm1975544e87.57.2026.09.13.15.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:45:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:45:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Kumar <vk092kumar@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: don't gate eDP on DP_SINK_COUNT
Message-ID: <eztwqufgpc3mxjeyfy2effil2my42rzl46meblopq23h2wrhwe@5jjgc7ruzlzf>
References: <20260908091708.3123735-1-vk092kumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908091708.3123735-1-vk092kumar@gmail.com>
X-Proofpoint-GUID: KbVbB8zY18VNUiWTvp0YqHGdYOpKZObL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX8KStykTqSxxn
 P0FC6B4iMavWMPZ5L9UOHCNGfEX/JBlpsVgohbIr8YUGpurFTGFMW7otQ5+fwXPzDECwctZSqvZ
 IC7ApLsROznjh+zD0yis2bT6qjrxbVSlBnn6NCkZH4kun2hG4Cibo0jucyf1xbDbdoguql05L6I
 Lb8BXQjVXaX61KjnCyCMJPpEMIhp1/aF8q8X+1i70oXTKlbqdkzmHOwhAsn5veAbCGOwUb2FMkr
 jTvqdD5lZTIdub9kGSQfpzdG9QBrI1ZAgLQnwump2tGXZ7jsl1ogVngw9uqPrsMDji0tliTntEu
 CB0x2SJEXcG1qxj3hPD4nGNuC9YSFRr3oIeKfCizYBEpMGVpxkXR9oCuWELVwLzOPlyxChIXkKF
 vCynFnk5E+jbxiHQ2tmZIRhty0Sf1TAAfvEssnRpl/ouUrMvnp+GoxWt6bTDi7lGuYtCwyuF5CT
 w1JqQYLq8I2wKgYVi5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX6jj02Hkz48Tn
 hl7ZWo5scEtTsvsp9a0HWy2I7+tU1jn95wMTSGje5BbNxtbJY5ozLf6LFIN0zOAqk1rSQq3dCcb
 URu6XW5w1aA/ll6Fj3Q/9U0ucQ8F69Q=
X-Proofpoint-ORIG-GUID: KbVbB8zY18VNUiWTvp0YqHGdYOpKZObL
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa72781 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=9Ukn3v4DKVw18m4NUkcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130326

On Tue, Sep 08, 2026 at 02:47:08PM +0530, Vivek Kumar wrote:
> msm_dp_display_prepare_link(), msm_dp_display_disable(), and
> msm_dp_hpd_unplug_handle() all treat dp->link->sink_count == 0 as
> "nothing is connected", and in msm_dp_display_prepare_link() this
> causes probe/enable to fail outright with -ENOTCONN.
> 
> This is correct for external DisplayPort, where a compliant sink is
> required to report a valid DP_SINK_COUNT over the AUX channel. It is
> not correct for eDP: some eDP sinks -- particularly fixed-format
> eDP-to-HDMI bridge chips with no downstream AUX-capable panel
> behind them -- never populate DP_SINK_COUNT with a nonzero value,
> even while otherwise participating normally in DPCD capability
> exchange and link training.
> 
> drm_dp_read_sink_count_cap() already accounts for this by excluding
> eDP connectors from the sink-count requirement for other DPCD-derived
> checks (msm_dp_bridge_detect() takes care). Apply the same exemption
> to the raw sink_count reads in this file via a small shared
> helper, so eDP outputs with a non-AUX-capable downstream sink are
> not treated as permanently disconnected.

I think the better way would be to fix the
msm_dp_link_parse_sink_status_field() to also use
drm_dp_read_sink_count_cap() and to set link->sink_count to 1 if the cap
is not available.

As a side note, we currently read sink count both in
dp_link and in dp_display. Could you please leave just one place? If
not, it's fine, just fix the link code reading the sink count.

> Tested on a Qualcomm QCS6490-based board driving a fixed-format
> eDP-to-HDMI bridge IC (chrontel,ch7218a) with no negotiable
> DPCD-capable panel behind it; without this fix,
> msm_dp_display_prepare_link() unconditionally returns -ENOTCONN
> and the display never comes up.
> 
> Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")

I don't think it's the commit which introduced the issue. We had code
checking for sink_count being not zero even beforehand.

> 
> Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>

No empty lines betwee tags, please.

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
