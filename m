Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006022;
	b=V8HTRGvvXCDulvgl5RADOu5t0MwD69SGiVp6ugJ+sDDuyzbhN25xD3yr7Tnn6HLIP3gn
	 HlxRNtO8/mL9n2HQJBZkOytvazK+qiAhouInj3ojdKDQ5WQR2XKEQ8NFIidtZBTJj+Ltb
	 kDyjSYHc2/TKYeEL/005pfaZrUi7vBaY7Az2nOaphUODNtyNyO6d2C3DN8drt9QA1+8Sw
	 bDMM/YZF4ZOcZmGXRJrf2J3nKJJe5KR76rjpBtLNm2FdfmNgECcWCtAxovsdPMuqNvN6A
	 v2JJJXLk8mcaJr3YM/mNVqwIk66VYOQsFogEZ5l/RigM+CCLcm1SaSMv7zRvH7mC7fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=;
	b=nVz7i+DoJQkaJu2F69pdoDtfxFaI5LzMy0DZXyGgOzt6bmELR+MElQ5iSscQ/ECnXwW4
	 NtbUubkc/6op/aKh4vosbKe+dxzAmtMpAHhvqN5CWVlUGSyIU+h+nnvWqXUhES0A/2iHl
	 Nv9F2QIGkcroB1LEuXoyfYxAMIRvGS0JFD7qVHk6sLqP/0Zsoq4SKZTi8ESj4hiv3wwZx
	 eulFaiwYiBg1lsY0hi0t/5umhXRA9uf5MZWyZZ82MvK6qLiAb67KpmW4edbvAdOTZ87Og
	 7IEmm+cKQZQ5heEkWYiCNWL6OuR7PlyMGBLXAPJRdwDFbQ2AQqB7wHiIaXw3c26tynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HE5Ej9OG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRL5AfXv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD2F606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD2F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HE5Ej9OG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRL5AfXv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4asDK3303633
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=; b=HE5Ej9OGUxYGrI8N
	YKB+QS0Q8izHhB4qTjUsd1Mnr7E66NzQri9a3l5R8+cYFJHrRhgK77FsrOZvlbUw
	R32p9NpTqyhwXI1diVf635IA1Qk6+XUNiQU1p36fqcRqRRSJ7z73DtJ+wCcr2kTc
	GhaIMdBfug8bY7wCPqXmmkgTIWc/y1RwRikL2ObtwQEzrSwtFPlfVsTNqmnbrQxR
	HWsVRR5/nUjwJ+VgWEZ8bOe2fIhEb0MMkJi4cQOf2Ub1I4z4JTMWr1oGaTGKqw2k
	jR1UBzyEDgvhql3KRKQ/ovLU6aUGihyLLXO+3q119Zy/rKcrYYPNHEEHVFghPWcR
	97/0Ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsdqjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:13:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso10501181cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006020; x=1793610820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=;
        b=fRL5AfXv401PMVZXmRPES44s51Yz2fTdod5d8DlAjB4NSog9MNBGFyiH110YSaoZpq
         axgkjFMBLbZY7m7Mk42Vw/ZkiBpxdsUyXwfEMEQgioaAazcjR5OSU9utaIheg+Eq60nT
         0qeS3Dl2YR+SGRlesJuJjchYdGs7DZXfBHwUDEnL8xqzkiCqQatYrYfPd8SYes/G0d55
         g8hnGQHYPX1o4CIA6D4bdEOD7R6T1h0YAquwed+aUV/KJI8WrtcftyMrWp/lt6KXqwBn
         J2BMiEhlKobszm8CEiG7kLpKHwqrsCZ6omSSwcSW35/dhKi5VrZlabHOgB/XuuuIajdN
         VqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006020; x=1793610820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=504GS7G2c5HvF1fzY/p3b+yghdp3at25Pz8Gt9PufVE=;
        b=JNElijizV/bINcLeTAMGx4r+/uaIDraacqsBwDkNZVa2iU1e2I30qttLkHsUtBtsrS
         PGnfsyLri2lQae37qt57jzWprOkCS6kodrP3Uc/+qxu7BGhn09m6UijtFscG3jzXux06
         80hiOZHlP+97niqMLwpZ929xTkvlkdjr7bxV8TdL89OkfowmDRWRnjmf7PYFmpz5yND8
         hP2JHrTwOco2PMnSqp4J8ZO05hEVYRs8yrbEIROAHmXzyVCkoz3ORIg6feD8PcYqydSx
         PXX3XXAVWc5PxOUEactdVBkXk/FAsFpqYdFMFUY3ZziboEqCUXc+lRzi8XfAuyzl0mji
         mauQ==
X-Gm-Message-State: AFq9FYLC+b3VSL3rYK1JwHnzPIs4bW3Egd0yH9QyMMcjgvftT6e8cQHY
	UZlVdTbdTXYT9iAWce3y5R4v18MK407eQwKVAfXUAR78v/5XjtvvU9Ri33U5Umwfz26zBFF4yre
	mvqUMXuFz6Lmr5cn0i2i4vc7jbGcgybmIKNmTXcvE09Juu/otgrwhfexNGPYGsBCRIdEH
X-Gm-Gg: AYBFou1/l4m2f4fu1Gr4ocJfUg3q2xSLw+C2Q73FTxWjqEau3QKrARjGnvGOvabW78Z
	zaDrGsN0TWfF/kl6zwRqiIDdH+KGL5qMP00FUzDJMyrAjqkLkgKkKOur3IlMdm1P5ol+sRw5be0
	R1VGvb5ONI/KZe95H/BuEVfRW+8TO11JiFxjUFQH640cAlL0bsxia9YtSkFzGD6+I/f0l/F27Zt
	rMsUGgx6LcWYqNdO/aetpSq0dLrzdeMut8ZOC/AWGnpY2gJ4RdEQVB4oxaUPCp6qA8pCBWugGlL
	kNP2fdGfdC0cq27bJNgBJ5GpR8OpTDEy2H0sc8Q7uJXznIt9v1zxYCSWr/QNsYguCG7M/ztxO/E
	CHpMvY2TLeUu5Kl6+JddrtA==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr970010285a.2.1793006019665;
        Mon, 26 Oct 2026 02:13:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr970007185a.2.1793006019169;
        Mon, 26 Oct 2026 02:13:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm295841466b.56.2026.10.26.02.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:13:38 -0700 (PDT)
Message-ID: <d9d6a2c2-545f-4b48-ae19-dc30234540e0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:13:34 +0100
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
Subject: Re: [PATCH v5 05/10] drm/msm/dpu: clear the CWB blocks left by a
 previous reservation
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
 <20261024-fd-kms-fix-smmu-v5-5-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-5-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JwClvneFtVEtABebHpnAQSe0SioZi7Xy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXy+P6OReevGWM
 977uWM4z+qz5lKRO0l9xzg7x1f6N2Yky1i3gOQk92pgI0nVtkDUPRZBt9IKL9SBpQPnOly/oOdc
 Rqjh5zKG2MgbbzS16naQnB6GaH8LI92kGjhqRJVPNM7NOC5zJ1bBV3utgg9mvpm0CIQ52j1xyN7
 KkrBjDByvq/A1LQUY/xN6/KcRqU20lT8G4rzAjTyitv6OY2gkgUdYG0OjD22ISCAaLU5BaYHaOi
 rdp8/SnB9Xrog/+iAc8zXXB7Bm0+jQ7KKd95VkQpMFPqbwBEpqLfgrSBaiWiNaIN0ez8Eesxruf
 l3vkOvqCBQDVnXVD7BKyim4dKtvYlM/JhJ91BKrJdptJvdT0oHZ4n9fjZ7omGW7wL+kdl8n17SD
 JMPFi02dWjP4uyxk8HdKJZD5ZIMcgeE/HbEcSSdN5B04ceeCF8c9eKIs2K59DRTgkdscb9rnhft
 zMgkEp2J00tnVmrSy6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX2Ii61JMJK4C/
 IjGi3cXJkb9Mwg5/AOLMyn7kvIH2WXdCbGD3LUgafikW0iRkNwHQ/b6H4tPX1JHfRTQC6TnYrtd
 37WS8EN/sH/l7Ka9eATGlFTvgS0M+ng=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adf19c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xIhFS8ZktLuDZ2I-VrQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JwClvneFtVEtABebHpnAQSe0SioZi7Xy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_encoder_virt_atomic_mode_set() only writes the first num_cwb entries
> of dpu_enc->hw_cwb[], and not at all when the encoder is not the
> writeback of a clone, so a modeset which drops the clone, or reserves
> fewer CWB blocks, keeps the pointers from the previous reservation.
> dpu_encoder_helper_phys_setup_cwb() then walks every non-NULL entry: it
> programs a CWB mux the crtc no longer owns, and looks its pingpong up past
> the pingpongs actually assigned, in the uninitialised part of rt_pp_list[].
> 
> Store NULL for the entries which have no CWB block, as is done for the
> pingpongs.
> 
> Fixes: 5008375443ed ("drm/msm/dpu: Reserve resources for CWB")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
