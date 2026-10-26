Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006353;
	b=K5PUfdq+xZqas8/VQmd8XNRyxjnKIhoAPKlCZ8cgjF6J5UNjKd9/k7dYBmw/iupSF1fA
	 n91cISoOjupucQyxDbUPjSe/TxL1Jl+8OqVVydFPWrFhQ8XdEZ+mWGXd25CuSmMNO2LCI
	 PHW235T4dgZJ3i0UfOMD7qVU0iFLQ032wJnfDQlKrUpFVWuu9b1PDMsKqJsh7hqfH4ceA
	 OiONceE5lWYsRCiRf0wZ8zk7eNF2xfnYo+iN12ijOs+S09MaGyqSCwedvWeeIlEIlu11l
	 grhPYK4vuxWMZLlZ5RRfvjxcAYXyuF9rEgczgppDbFZg5aRdcSrg/m1fgpqLMlWYzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=;
	b=46qmsTD8tiyUr465Ztp54BMP35EebhreC1QdKsSI5hYja8KGqIkLfCw+XPpaiWEHlimz
	 FalraCw4MOG/xTsucxdzMZJQ7IHtIVTA/qZJclULgUGVTALTmWH1XF6cGq52c3pYexoDR
	 Zwk8Es0tjVYCxAzaqUVY+bbFLnbZC6Q2CZN+wGwBfkG/ZDVNOv5GdasT0twn3Hx2wppL2
	 46XfgQPxDoTkjrHmKU60tyfXEb6p7fS7p2cL+e3BYvfIGqVCk645qpDRk2qSHWcCrOm7R
	 5Tp4gIefRcjJ30yD16X5R9/8UKPTk903SGNg2IQBchCK/4r76V7mXvNVwD7kATBQRiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iy78WORG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQNwtmJt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A236606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A236606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iy78WORG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQNwtmJt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSr71708641
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=; b=iy78WORGwPeWAGI9
	z7s+NJqkRJDPjiGphkUqRD4G/WxwyZxs84YzVslcs70p10trDhQAt3MgJ7HOnv/I
	vYwbrT/UhU1HTX6nDrt8Zt5abLEPdhNfva29hqAxtc1aBS2cuTU6/PzLycmm++3I
	DupcSUEmiOz877jWhKZC7APZUkTN4lV5DfEfoerl6yOiOFTcQ3W9KjhHjIJltvP8
	1g6FHyFAaMg8ZiVK3beJXbAMeq+yWBvJbf+m732RbbYUIRmvwcbAcqTEAFmLSPgX
	X8HJ0SF6kLUFY9rqLxjKscr2GZTgJ9nNTAYad3zM9yglbq9WLjxuABgcl7nHapKz
	aayNrw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9qqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:19:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4d46037eso8381216d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006351; x=1793611151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=;
        b=fQNwtmJtKsg0yKvzmNCvEiV06xdnaaj/pnIHelIvQSTM5bSK+9xXrV6DFYXenn3Aog
         4HXpVOMxBBqa/+KqEJ6xHbRpZKIN4XlwNUCZsYYTQD6XazHo+6FT8r1O3ErHm6DPm6o6
         ySidyPAUovoxtDPcTSysaH8hxcL9g4pUnv66SD9G0xjs8LWTzq5h8N3+SqXJeU85GIkh
         cMHumaL1arLM5K+Xjtjxb4lsb3H1amVm2Jhk3bdIM1+Ac2HlZdWwqCzfhenfe31hr80s
         ybkuUjxGQKtSWiKZiflfOGEaRb0PhaFvksjWGqH53uu8J47xoOlvJ6b1U5wL/YFjiLtj
         F1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006351; x=1793611151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=;
        b=Y0Qge0W1ny/DXpz6B4FNspVkr//hM966wj7+t8DzMLdI+crP/jILX7IghNZHVaFvn9
         rp0eV0iHW+5SdExnjnTHx6NIc1Omu8MHWzeusFulnlcd4yIaJJSB4iN/PqB00utJY4uD
         IUAbvUTXxvbE3xHeDiY4HnEtR17LANFpTVd9zKgvEOZnpzu0aKjwN8rAXRWbxBWYh3ST
         JXG/DVQfTcWNPJC/vYqeivl5YKxQZRxOywHVJplWiV0LIP65wpbRev8J8PFWMGi6lETb
         fFkV3uUi3ZJSCX0fUVuX/BEWRSAyZyhlw/27M4G3gmHjkAJ2yF1tOAh3rpI8vBUjE6/A
         tZgQ==
X-Gm-Message-State: AFq9FYJi1uEsvbwjN2yh9y3RAbPuS02Ldr3d4I/gAfFlUCldAObNdfSO
	+ct7GiqDtq+kmuc0kVj51uGlq8Kttu33hMN5vu2DcxlKez7o9YURFGf89hTUvGmY9/OtykzNFT0
	v5kn+/PpqEmgQUVaFdOW9+j1YJkcfWFTSIEJdX/FOKaZDL8uOHmgcQOtZnGxWmku56byk
X-Gm-Gg: AYBFou1BK42GM3TRoSgdhR8QaCJPI3hjoV8KbNQQdsmQn5a47FNYgrHKx8tzL997Tz5
	oPYU/jptJXqeevJcxscqTr8JWJ4t6Q8DDLoLRnuSCf4o9o1a4pMltN3HXOaOgx6riDSXs56wZwR
	GsNs0xp0XYA2gZ2Q0sdYhoyWrvMkWar9sE25whtbUgfqAI89OPQopQ5p60iOPtcspp9kxqSvRJH
	1qB+9jL5XVcS6IVMnfk7t5mK1cB8/cZfq7nQHzgvqGLU6hGFuMD57kQ+TO8qplgkkLwqD6lqIxP
	Omoi7kERUVwtJUEKwX0hc34t0An01xNILKnoovWMOOjJUCwp/Su8PwXTtuu6VBlI0fOIH1sMQ+E
	fd86pVGkJsmV1VGHdAG6hpw==
X-Received: by 2002:a05:620a:4bc9:b0:93e:54fc:2c79 with SMTP id af79cd13be357-940ef942706mr813955085a.5.1793006351375;
        Mon, 26 Oct 2026 02:19:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4bc9:b0:93e:54fc:2c79 with SMTP id af79cd13be357-940ef942706mr813951485a.5.1793006350822;
        Mon, 26 Oct 2026 02:19:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f95csm299862866b.5.2026.10.26.02.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:19:09 -0700 (PDT)
Message-ID: <86bf919b-5528-42bb-aa89-b518452ed7a0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:19:06 +0100
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
Subject: Re: [PATCH v5 09/10] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z3uytAwFUjY_kX1EV9g89_Htb69zjemr
X-Proofpoint-GUID: Z3uytAwFUjY_kX1EV9g89_Htb69zjemr
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf1b10 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4sCBZ3MT6_yhT8qeVe4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXy6w4WsRq7Gco
 K4/zZ+olyAEJkI02/XXNcjI9yL/9Vmvwmqko2jGXps44ThvPAJY9li5ogGE6jzRL/DZvz1knnUX
 t1rg2ciVsxrMjA7oj3wMyZ3XhaUzs9s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXzTjNoMTqNUfp
 WNEzAkUeVqLU3vVfijjH8xlxazppQgSX5bqa5CZeBJSLRTF5fgk+o0usJgQEBgYP9vDsHOmjtCB
 TiS2JCqQGZHpfzH2Q7E5rSlrPGLZ01EtyOvQCLF3gxtkoF6IpgdSs+E2e7S6INqJHUJhfKAkqFA
 71MMg/10BVp2JbkoUa1PyGQJNdLd9GK01BkUjAKhnumTp/0S/C/sdIksydQp11enbPBKFYyyZk8
 0UiBenfeg0ekOw8cLQ1j0IePFebOLEur6o4SExGt4+ONjAVUB53ymh01nmU4GobXosm98ogcz0j
 8Plptqs2ChnMMVPAxxtcxvNZ4mBetG9zUL0MeizO66Sy0XkLd9mZowb+ZaxU6JcSovaOZnjlnuZ
 TbnZjGpft2ujG2t/sbzU8/qZ9nJ5GFNIAWd0i6zp06TpsjlblVmvkW99ASZqHujC09jcE603Ki4
 rItnMVduSnOhu8aoUKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> Running kms_plane@pixel-format-source-clamping causes SMMU faults
> (fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
> updating, so the test times out waiting for a CRC and the pipe is still
> fetching the framebuffers released when the runner kills it.
> 
> dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
> set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
> connectors_changed.  A colour management update therefore re-reserves and
> can get a different CTL: cstate->mixers[].lm_ctl points at the new one
> while phys->hw_ctl still points at the old, so the flush mask is
> accumulated on one and triggered on the other.  CTL_FLUSH is written with
> zero, so the pipe is not reprogrammed again until the next modeset.
> 
> Reassign only when the encoder is reprogrammed too.  Enabling colour
> management still needs a modeset, as that is when DSPPs join the topology,
> so ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
> msm_atomic_check() hack, which forced a modeset both ways, ignored
> GAMMA_LUT and overrode allow_modeset behind userspace's back.
> 
> Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM is curious whether turning off CTM/GAMMA should trigger a modeset too.
My hunch is "yes"

Konrad
