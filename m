Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B13F12E3
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517356; cv=none; b=su/UidBtHdbzb5SpCxIKYb8t5h6B9BQ3nfXJnEaIEQrfrWSgl3Q23v2DaQcHv/cwRoqmw37XVsOAucn8mQlrnqWDd40gira3rxoSxrfX8ku8QBnaxPdwP/DzcjwaOHVM5b5Cbo2DFoPj+Y+OsSUAadm9hxucUJ2F11xn5Y9Tck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517356; c=relaxed/simple;
	bh=qFzj3e1IJEg5N2m1tp5b4FG7iZDcpj8PhjY4cN+Ntq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz3vfu69CKWCA5YOAA4Wpaob3GZzG5t8HXvho9XhSlK7sOA3fbCP7/xjtNzIneFKnQkeTIg/cICIbj78H9dZT/QxuNKWKT9gMwNjaFzLsCW1BE4Dlu5Y4WXAKDWBgKLI1Rn4G87yLaqA11FuBsV0GpKyppMr3N3cfxPLLSR+mC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMSz/7V8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvOoAv+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMSz/7V8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvOoAv+h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIQ8h3565598
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 10:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B0FOpfvbCJVV80luCOgEs+44
	HXQFGx6sTBdAdN/+wOs=; b=MMSz/7V8MUl+HbVOcwKAVYa5rgFnUAdeZKBQlfsB
	YIvSX4T2vv3PlhSX8DNsPiLHNIq4MV3Y/KzyUuBcpEZnh8jZQsUT4ExzM0R/+boH
	+dTmIRTNQ/obwGufhAVXQrPRvKpnoLi+5pfOPRojJoKMLdU5TfZC6BAdTBkdvJgs
	V7l8JUFo73HM2V5RSeO9J4ithQWvm8CO+KpKjQxfqrR4t4CI06HVyR9GEmVPmAwj
	7Ti8bt6+uT8lzMYy47t2XEu0JANI4l7gzbDSNTZMdnhP0Q6uZOXqZ/Kj8YqtOHWy
	ggQCjuQo8bBtOSPjpev6ykytMpY1AYPoXHmPUygH+CoVTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r17wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 10:22:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so142702885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788517343; x=1789122143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B0FOpfvbCJVV80luCOgEs+44HXQFGx6sTBdAdN/+wOs=;
        b=TvOoAv+h7srB078rqXtSqCGaxAtGy++8kdRbaVE6CA5vo921CSDQjDiyG+72cMvSIJ
         9kZvpEjg1wlTdHULXcqPjCop3rAWoI/HkH6haepyy0Wmk/GQMkl7s9GNWZOtR6S2pnYd
         QD/WqjF8hdTTK8QJS2VdMpmSKtie2poYurg6gnuRYDuwHlDuQlcin2K6KlAS+ihNuGuy
         1JMBV+7x/M+CDTCFFlnmJFdhzrjWCJfe4h76PmYSQ31EFxj34KHT2g29wt6rXAXu6WRc
         LWbO6QL2OJbcJTmphGvazSquYc0c9bXb54pdy1tkuMEJavmOVFc9TBXoC9GamD/9cnz5
         TjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517343; x=1789122143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0FOpfvbCJVV80luCOgEs+44HXQFGx6sTBdAdN/+wOs=;
        b=Mkd2oDDqRJ73OVmKwu/NO2V8c1DzGM/LPBcc20PHGOrZI8Qv7fVEvuJGwZ7WUL4BqG
         LsUSx/8kE4w6emHlGZgMXDkxQC35Dagsl3qjuDEelR15PG2TMm7HWydMOWvX1drnc91u
         x5aW2eOBRN/7Jh4bxMz6wl4wXiE7oYZTnAJznlspoSVPxDUC6g1l7BpgRrC1ozDVSBJM
         ql13hSA1a0QadThGHX/8yhlB+jjRoJ8sKtWWSymqyk3Tpw6Q7tWWHoWNbeqyUj4hiLA2
         FGwF1+pK5WHmDo46JgFXTLSpoFeJLopNOpHyahGyV3rI84dTHv1jYCr+6vVqNe/L+9MK
         QEeg==
X-Forwarded-Encrypted: i=1; AKwUvByDhH8rjAEp9fIAKHUC2sEWJWcvUikcmvLGVMcz3UkeXxAvWLBai0n9EMrg/RcJJ+vtn65yF61NNUSrDWjJ@vger.kernel.org
X-Gm-Message-State: AFuF++lNgHbrl+qv1TftbW9mbHuTx7wcvx9kjNY7uthLmVhu7jW/fDep
	ThXVw5sloYmKIG0rpbiYHN/mYl0pxWWMvMSOC++V6OTjWT4UbRMefkAv1ms/XHhi4ArdZPfqFvM
	fSY+L4Jl2+5NocorPJnZ81uSsB0yCh5Dg5k3xjvTpO3POk6sLjPCiWGr1ryuvAcaK2EBc
X-Gm-Gg: AYBFou3H/WFeI9xzKHNwNI0eA/s7mK6ixpE/RK0Q69GBvRi70ge/z58zQPed/AjyRyV
	gD0DXFlr9A+tg/Tkd5wKYLA5W3HoP5QQHiBB8H6WxZTYsEX3lfgr6Of4QOe3tzKftSGlgGoLUT8
	uHnF7eoJ/qOZsQlShMWl51AO4NhC08prmRBv/WjXP/icuhDv2v20hDyarZ8mGDdl8OFLxg9Udb7
	hoIvCH/P1a/SNbNRoskXomFbAZo/+Bso5yJAgIogbbsQCydT9V9tn+8bsi3HDYbaaLlxYnYDdcX
	Q5KpR3h6zwH8v9UZp1lEWpSRUT5XGJneBEkSvPn7ht8mQWv39Xby7hJGc0wH8AD9FpOzKwb0p9k
	id6GBY+NHBl55
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr510424485a.14.1788517342657;
        Fri, 04 Sep 2026 03:22:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr510416985a.14.1788517341941;
        Fri, 04 Sep 2026 03:22:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7710aa5sm59464915e9.7.2026.09.04.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:22:20 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:22:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dsi: round the byte clock rate after reparenting
 to the PHY PLL
Message-ID: <2gqk2imrel3bwt3ezkccimixvfiioxp5eeiaznzlyejgkhmave@7eh5o6ms3rns>
References: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NCBTYWx0ZWRfX4k/nrDc53Qc0
 sQ+/1xGA3kBmRH8ntZu5OWpfVSBpQatsR1dVxNrUVDfeU8WaXG1UbwG88O6bpVRVthBqddsvEru
 X54ZmA0Z2vz8oDyXp4AyQQX3Vs1PA5U=
X-Proofpoint-ORIG-GUID: MY3XFndGJhWM8zG2rg6nZtr3DijC4kJj
X-Proofpoint-GUID: MY3XFndGJhWM8zG2rg6nZtr3DijC4kJj
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a9be0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=df3BZnECoes8ZJFSp-YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NCBTYWx0ZWRfX8Dufw2V5g7p/
 6xT/UuO5gHv+NocHuzTxxixbVzc448+KvMoZTOfHJGh7YSc+bb47rhrJBkZV0KngGEuijshT7rp
 CP/fvkGcWwdkb1FAYAJX45TCcO8tXuKRKjmWs96MS8MRTq7ck2MMxY/YBVvWXr5LN6zOmP+0Ov0
 h3P/jAWaHkB7Z4mSpB5Xh3rrwDQKtbb56/nSJqFhb4c3bMRdGj4HhPZpI/HXNTJHflAeY1XBO6t
 ul597KFAUJIdCVUiCnXJ0mtqH9zEo1AZwLP2Xf0bZ18MeOw8DRQx3morgJvRLsiFF6zT+ezY/Lm
 0LQE/Emc+BeuTcaNR3R5+HwaU7Ck3TYmEJJHZXw3kwDxGz6wdxwjlmjD+EY9bGQFnWAUng1akhe
 xPfVW/0hYRqpQsU0oDAUBYBfcSRgOdJTcqFFBVR09KZCJDKADdzz4RfNPvcOHham+xtqhO505BU
 vj3hYVl96gFKaCnWAQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040094

On 26-09-03 15:19:10, Dmitry Baryshkov wrote:
> DSI 6G v2.9 hosts (SM8650, SM8750, Kaanapali, etc.) reparent the byte and
> pixel RCGs to the DSI PHY PLL at runtime from
> dsi_link_clk_set_rate_6g_v2_9(), after the PHY has been enabled. However
> dsi_calc_clk_rate_6g() runs earlier, in order to compute the bit clock
> request for the PHY. At that point the byte RCG still has its reset
> parent (XO), so clk_round_rate() returns a bogus rate, which then ends up
> in the PHY bit clock request and the PLL gets programmed to a wrong
> frequency, breaking the panel.
> 
> Move the rounding to dsi_link_clk_set_rate_6g(), which is called after
> the RCGs have been reparented to the PLL. Storing the rounded rate at
> this point still makes later link_clk_set_rate() calls no-ops in the
> CCF. Derive the byte interface clock rate from the rounded byte clock
> rate, otherwise it would keep requesting the idealized rate and
> retrigger the PLL on every transfer.
> 
> Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested on Eliza MTP.

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
