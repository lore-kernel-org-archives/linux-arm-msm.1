Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284069;
	b=GuhyqzdLmngM9/jcWmS2LUOQ9Qs+GE/sqY+Sc/u6Ysa/cYYIPjM+j7bXmFOwAbOK9YuG
	 85BVZk5zNpNbBqkmxcyiz8NGNyC6GSxEytCDOULT94pkYqbBeqR+01Icz+MiVWWjWSkya
	 E8Kqp1nPfDjYcbCvv7FIOg4iEOP1RcMITrkKUaZxcown/bHp3D30tCcHd4NURPTKAhOg1
	 xLimxwclgeI3mfjqv7dgFuzVZ7E61oj97ktXQrD+T+QDKMf8GL8DCYj8wiN5WiJ6QWx6H
	 zmH0fI7zTW+T50UvWL3eJNsCiLr1pQxZ91NWWJvvuFRUaEWMsXxc9KFK3MZ3zHZjj9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=;
	b=jzBa8qKJhLTXfTt4FW0Ckj1Kdlo0BmICotaGHTmcAebwZtV6Iw+ivrIQ0xM0Fdgrf4vt
	 fX6FQhJoyql+aCUGuQ/6o1bmeJ01LDdrchf6gbeO9ZT4S0xV66DxbJ763kBxSQz2yDTL4
	 yuTmRix8aHteS9F+u7bqbp+3l1JaxNsK2ExKYdXG0ta0XmkGHCwergwI+dFEQjLwgPAhY
	 HlBcJlI9/vCeYgXSHnBQ6aJwMY+4pvrpcUS+MtIeGDCtJy4VUs0j1swhQjEScGJU4/K4C
	 GCodSqwGfcJeUrJO3py96+GH7AAvKiHYGeezsO8aThex7IjArTamRksr3Ol46D9vr+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I0O9t7D8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfscnI43;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFCF606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFCF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I0O9t7D8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfscnI43
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49wUL1206962
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=; b=I0O9t7D8jKbeREzo
	ogVy45Iay7aVJZznNjGFmNWwW8JAgZFxQAbZThtWYU3ji0d/tf+mAggZyhEffgiR
	ljFoEErCP6w4+hmyIezNVvPZqZBhs78n8bjN0uKsQHoqDt8VXN/6X6wfUF23dxcz
	f53LzLYB66830wEg18oIbUNId6eYPv0JXVNYxEVbPuxB1I3OgKjQh5EKE3aTJbxg
	xgGzJt9SgNCef4PZNZk48gHw2KIkun16+b5TRdDtB+dvXy4M3i46c94Pkfw47KLH
	+fxWBSELchTPlNO3An3AY/HBKNU1Aics//Hm1a7YLAdje6OEjfD1aLuLaJByahQq
	jqlxIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhbcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so1240093a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794284065; x=1794888865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=;
        b=kfscnI43R6TFq1QAbfzZZ8PqWIkifzjp/sMhA2OYEpDkgUukxArjlmEUVs8/CflbMJ
         YV3h3d8KStX3vYC4qMZbj739nPmc0if18dKlNulEYHRxUhN7NKWzBIwpoFzu0GkpTknn
         T14dBPGFYFl3dHDBHFbjttu+dK5ith4LQ4k1YtM3Zh/IfDGd1A1vWWMpAG1++6OwxOur
         E/TyUxtPUvHfM3Z1Xz9I6fHeAEWGZfh4ivRltf9MAP6nDtMYByCblos6qi1CQOc+b5PJ
         foQvEsxQcolKl+XtnshqSvkh/JTh588d2wBeLE2yPawUmZgGvox8WjDY2BRNkMI8TJ9v
         AZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284065; x=1794888865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vllnIhdcYddUgpKRqNaXWbED/1ru4P1SPL9KLTf0SHE=;
        b=IwEZsiNTmCkFVbjJWTywgmjlXpxuCsYtJNDRCn/OlzZciwU7IZyXk8g9TicvihfYmK
         MiqlfzxDZN8b32Rlejla+3fhrGRdqtNrni1U9cMPc+J6B1phV+M8BapoB9ydbATEj68a
         +n0YOj1m+34hwFAoyNLcVouE3hvijj43IQi4rJihPnwCAM46JxhM5VxbMhR/T+r+z0Z2
         gWgUdJyryT8V4F+qNyIMOHUzV+wc76c/eLWOxHcGxv9QsAXCoshdXSGWP/vfSEhJhDLw
         lZeySqFVIOGE7mQ5sXGQPIGbUhyvlGYQcez2Q3Te/j84WPBHQ38QYQh/DxKF+i4dDBFa
         T9Dg==
X-Forwarded-Encrypted: i=1; AL+hErHSoVAaPsrGk6mmCTtoRsC7DIXEpBwiue0aCBf87RZ6rH/CX4S+gZAAZwPXHrW7Qg4pIa35pMhjpP6mpDvU@vger.kernel.org
X-Gm-Message-State: APuU4Z9CF49BwX1OwogmvoOj4GAgbaG7k8KIdEeKRSo2OvWwYgSNpEqK
	azfOha08+WPq9ynJgrXYYnvsKg2+v2r4R1nBBBCcv40pqHOMAL3zhIoV9w85tTrTaZqKxs070mU
	NRuXYfu9FI0T2gTgsaoE1zPzCAsoLtc6YFg07IxI8WYsVyzmQgnz2yBqBdYNcS9rcheNV
X-Gm-Gg: AYBFou3+wLcMIZZCyZv+mLT0Bz8nrSaEkLvn8mETgst97wlXHVRgKcPJdknKB0goIJw
	1ucQW3snpuwMH66+ydA+iOSFlmDJWitzQ2rEI/YSiLOYWApID4ELeBrfT3Wl0gvd3Dz2H3JmVir
	kA1gJTudcZaYqZqX+gLpbbTZnJnD3k4lS883ujEQHmqEC8i+cpL861uOUxhVGDKh84vbE6N5qdW
	AluCDZcX1SheGueo6EHqgT1A0HhK0ptFoHZDDtGU6NgNv0Y2u1QsGk69KXaWCfPr7knh2OCmwAE
	nd154V8RkEigQIeLW0KfIPLb4XxDO1fA6HeBrfMnMg5z2/Fp5YXMrzw+8hiTucxSYrSDoeG+UKw
	G0C0y1sXxYc84XIH4gG0iWYZ4VLhlauOxigJswHnjoQRWJO7QTT+IYwMUTiensfjOWVRtrHwND3
	UI
X-Received: by 2002:a17:90b:1c90:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1679e96cbmr1115506a91.30.1794284064639;
        Mon, 09 Nov 2026 20:14:24 -0800 (PST)
X-Received: by 2002:a17:90b:1c90:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1679e96cbmr1115485a91.30.1794284064054;
        Mon, 09 Nov 2026 20:14:24 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168a8de09sm995443a91.0.2026.11.09.20.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:14:23 -0800 (PST)
Message-ID: <91e543e8-3e4a-464f-86cf-a9ac95ac84c8@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:14:17 +0800
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
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20261108011450.4428-1-26rote@gmail.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261108011450.4428-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bzGvP59oSnbEWnam9fYRey56RbXpylo4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfXwRVCHPZpTQ0C
 zEUM04aNHj26UhUwvWR7V+XzJGwdjcfL82cD5krCV313rWoCpTEadBneSnTJ5qisaWS6Fyl1KUi
 mAPC5WjtJUs6YwTFRYlRbNZT443tkNI=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af29a21 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xnScQCINOySfzLI4sGMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: bzGvP59oSnbEWnam9fYRey56RbXpylo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfXwbKBnITYE3kc
 kAz4M4xTwUMdXh2exmQew6/fmc7AvQeNcFe6ESgBhUjrMDReQv5BLQR5YkuNEbOG+AHtrc85SMm
 bu5qrf5B2hGyv2MJl/1JJTYDUMtK23BUntgJagC6dkLuimLvsw0IMAGnRdyO84XguIrFkplbAyZ
 RW4ntdEaMuKGCOku8ZC5HJo7h1NjooDjLMrZ6+nfOqjibvnJnTjeEz7W1KZyZkz8aCejPk/FrAz
 T9xdjwG8I0VivGqzbXwzwO2E2BUOjVh14GgamXHWxmrklPkz1HrzRwX1ZGGts6v7O8q7+rJ6NfX
 TMMpeUl1f3Q5spnwC39qqOlNqwLh2OCM8g+mzf47uVfJizKQWeVeAAswz7Ps0sTI++YAfW8/UxA
 yD1DRv2faQQEEDkKSBbJ16rv1NN3eXXNWW5uEoEpaL2abzqiPYd6vj9abLi7AlpYdAdSMpM6cTG
 OmDfwOKiSKonyy80kpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100016



On 11/8/2026 9:14 AM, Joonhoe Kim wrote:
> I tested this series on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali):
> DP0 over USB-C (pmic_glink altmode) to a dual-screen monitor with a
> built-in Realtek MST hub (two 1920x1200@60 sinks), with the built-in
> dual-DSI 1904x3040 panel also on. The base is Linux v7.3, not
> linux-next, with Dmitry's "drm: handle IRQ_HPD events correctly" v8
> [1] (the cover letter lists v5) and this series. A few hunks were
> adapted to other patches I carry. On hpd v8 the second hunk of 34/35 is
> not needed, because msm_dp_bridge_hpd_notify() already handles the
> plug before IRQ_HPD.
> 
> With three local changes, both screens show separate desktops next to
> the built-in panel and come back after s2idle.
> 
> 1. The plugged_lock / mode_config.mutex deadlock that Sashiko reported
>     on 32/35 happens at boot with the monitor attached. The stacks are
>     in my reply there [2]. I dropped 32/35.
> 
>  From the cover letter:
> 
>> With 4x4K monitors, due to lack of layer mixers that combination will not
>> work but this can be supported as well after some rework on the DPU side.
> 
Thanks , will  dropped in the next version, same as you did locally. It 
not needed
> 2. With all three displays on, the commit for the second MST screen
>     fails:
> 
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_4, invalid DSPP_-1
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_5, invalid DSPP_-1
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_6, invalid DSPP_-1
>     [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_7, invalid DSPP_-1
>     [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
>     [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
> 
>     The compositor sets a CTM on every CRTC, identity when unused
>     (adding or removing a CTM later forces a modeset that reassigns
>     resources), so each CRTC asks for one DSPP per LM. Kaanapali has
>     DSPPs only on LM 0-3. The built-in panel takes LM 0-1, and the
>     first MST screen takes LM 2-3 because 1920 > MAX_HDISPLAY_SPLIT
>     (1080), which leaves no DSPP for the second MST screen.
> 
>     This is a DPU topology issue rather than an MST one; MST just makes
>     three active CRTCs easy to reach. Locally, a CRTC that needs DSPPs
>     uses one LM up to max_mixer_width (2560) instead of
>     MAX_HDISPLAY_SPLIT, and the two MST screens then get LM 2 and LM 3.
>     This touches the same decision as Mahadevan's LM rework [3], which
>     drops max_mixer_width, so I have not sent it as a patch.
> 
>     Mahadevan, should a CRTC that needs DSPPs prefer a single LM
>     whenever the mode fits in one, on top of your rework?
> 
Yes, this issue will be solved in another series.
> 3. s2idle with both MST screens active hangs in resume. The console is
>     suspended; the printk ring in the RAM dump shows devices resuming,
>     nothing from DRM, and then "watchdog0: pretimeout event". The
>     rtcwake task is stuck in an AUX transfer in resume, while the MST
>     stream is re-enabled:
> 
>      wait_for_completion_timeout
>      msm_dp_aux_cmd_fifo_tx
>      msm_dp_aux_transfer
>      drm_dp_dpcd_access
>      drm_dp_dpcd_write
>      drm_dp_dpcd_write_data
>      drm_dp_dpcd_write_payload
>      drm_dp_create_payload_at_dfp
>      drm_dp_add_payload_part1
>      msm_dp_mst_stream_enable
>      dpu_encoder_mst_atomic_enable
>      drm_atomic_helper_commit_encoder_bridge_enable
>      drm_atomic_helper_commit_modeset_enables
>      ...
>      drm_atomic_helper_resume
>      drm_mode_config_helper_resume
>      msm_kms_pm_complete
>      dpm_complete
> 
>     Several kworkers wait for a modeset lock in
>     drm_self_refresh_helper_entry_work().
> 
>     At the hang active_stream_cnt is 0 but link_ready is 1, so
>     msm_dp_display_prepare_link() returns early and the payload write
>     goes over a link that system suspend has powered down
>     (aux->retry_cnt, the count of consecutive AUX failures, was 107).
>     While mst_active is set,
>     msm_dp_mst_stream_post_disable() does not unprepare the link after
>     the last stream, so nothing tears it down for system suspend.
> 
>     The series also does not call drm_dp_mst_topology_mgr_suspend() or
>     drm_dp_mst_topology_mgr_resume(); i915, nouveau and amdgpu call
>     them around their atomic suspend and resume.
> 
>     Locally, the DP system-suspend callback calls
>     drm_dp_mst_topology_mgr_suspend() and, when MST is active, tears
>     the link down through the unprepare path (clearing link_ready)
>     before pm_runtime_force_suspend(). On resume, after
>     pm_runtime_force_resume(), it re-inits the PHY and AUX and calls
>     drm_dp_mst_topology_mgr_resume(mgr, true); if that fails, it turns
>     MST off and sends a hotplug event. With that, 3 of 3 RTC-woken
>     s2idle cycles resumed with both screens on. After the third the
>     topology was rebuilt (the MST connectors came back under new
>     names). I can send this as a patch on top of the next version of
>     this series if you want it.
> 
Please feel free to send it. I tried to add these functions, but I 
didn't have enough time to fully test the code, so I removed them before 
sending the new version.
> Unplug and replug mostly works. When it failed (3 of 6 sequences),
> the hub had dropped HPD or stopped answering AUX right after the
> plug, and one or both screens stayed dark; the stock Android kernel
> shows similar failures with this monitor.
> 
Actually, link training is not always stable. It may be related to the 
dongle, and we need to improve it further.
> Not tested: daisy chain, 4K, audio over MST (no audio sink here).
> If it helps, I can test the next version of this series on this
> device.
> 
Thank you for all the testing and feedback. These are all real issues. 
Although we may not be able to fix all of them in the next release, your 
feedback is really helpful.
> [1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20261108010724.4061-1-26rote@gmail.com/
> [3] https://lore.kernel.org/all/20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com/
> 
> Thanks,
> Joonhoe Kim

