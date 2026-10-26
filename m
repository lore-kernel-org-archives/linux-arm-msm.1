Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006140;
	b=Atf58uKy/BqPF4jTcfvuOhdCqs8dsvqP7u6deYM6c2KV7AFvh/j/Y5hDQ6AYo31z4mEo
	 IjOQIHbDPDGhfg4MH8Orx4abuDSYzXscuZtgi+VZdfNy/ibaMVWPK4H3iUFYW3qBlvPXT
	 2AqxcQvy2f+2BOrRqav6bn3anQZs4xs52aIHnZovGzMnbIzHkyi272z5+vJVkHUSsF2tb
	 u/GIep62UoEAd2rX89tTjSYGoI04G5SlJJbxFVmxQnBDgzPsPegMgE7Mwr3PO8RMEd9dX
	 1pBYEjwal81q3d3C7zU6Oens6b49Pi4WeVMgc9AwfpwBRMsEkZddaplkpjNkWjRDnUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=;
	b=tWaBDABuhDe/0VoSbtVkfRckAI9kyqetHHpdvU3nA8KmZvMEaKCoEfo5fvz8GKWqKtSw
	 44xmLCJXiU9FWAjXGSa92UK70LrmUiCCxLWaVqFGxpIAKcQVELPUBDsq5VxS92603SvvM
	 dPObzUcxDvQ4+OSeQjGqx9shMdg66Kprs2eanDtFHJ0gZApLiHsJae63t9wWhyIt5YzDP
	 mBlVfA/BA0GD6xktAHIOQNt165l23HxGgw5/EErkXWBUif51pqgHkiq/r6VSQj6sGFv4w
	 GLZigYI91NDN03NrDSiAzHl4WCdKgLRkjClMbfqJ1loqNH28gDnL5tt75TvWriDsYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WUgYFR4s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TzXRPRSy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE5A606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WUgYFR4s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TzXRPRSy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aum92727065
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=; b=WUgYFR4sTGtWjFKY
	66jXQhx0WuLCHICfw5AYC6k356oboZqmTcAx8JputT4MnDGKLVG6kxeogx5gJaFx
	QEFnthrgms2Bq1Tapxc7NEU9pQcxs0EBOyj9PD4D87KKLPvBfOdZr/EpPNx3bnyz
	/TNHhQvZj0F12A6F+7WcAizuC6DrUpIrJmrx0eV0t2PEVHfFiEDlQxpxDk39kwN2
	xlj0D02XC+eZzkOgyH23hJU1E4M4/Rfv0TDaDXTxy7qYaa6tTO1iD6J0BhkkJtOd
	tFfBxkeVD5oI6aDlsK7j6YJkSV2lo7/xBulgzCyJ7IhEoz2uPnGYLXRyQSIw1ub3
	zj6gOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nsh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:15:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so35595485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006138; x=1793610938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=;
        b=TzXRPRSy78Y7KUyAI8JsvG8qh2sfXgU3jTWLGdEjLfSkTL8C9t1AWtXCOBlKXHZTmY
         0EXmfoToscLg05w/zN2Om5pwyCM6Vm8Xy2s/Ry5qX+jTo4HZNgry+ZgdCGgC+lB5kdri
         JuldAJEQTWDGodEYI8bmpAIBcT3LA3WMNPOAh8zd13RHZaiQ3SUpr4cLN9IDTlhvWXV0
         7nZe447BL5fjDwFPkKQEUedF8WU7fDlKswrPs8NYxsRJvk4ODET19hIPbYSzPVmSmeDF
         poxQNhNVcjco4DG2QIWQeed16Id1c/oqd6STFv8hTMK+Zs2xBDFdFIskScCPLSj1F/yg
         dpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006138; x=1793610938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=;
        b=eKz8X0y0r/8OUa+HHjyJYvi4pDR+yS02Me1WtpWL8dUoKytbCTrs2PdgVePMuL4FV1
         mH6CLyNisbHc5utBqVD6V1M9wjZYHZRMNv+CrrZO/DePqe6MGFGKqMn5s0V4P2btExWj
         IzykIrz10MEHf18r8dptpqOJNn79OfrEuKjuNvp6uFhmisDY4yibF2yoLvH4/IMju9hW
         euwXkTKaF5bvhjgCM0vLeN78Sj7tm2tvHj57t3odb78RsUa/4w9L8ImZm4ySNF83Fd6L
         /aJRq6XLzH6nSWZwm8+NiXKAoEHtu/egiBGQpYcYDz9VqXX4DqwB9sFquqgtV5MWvmGI
         SP4Q==
X-Gm-Message-State: AFq9FYI2ic79MUC7BxXfFKxmS77WOuuyPrQwoqoRotWhD8V5Hna7Bnws
	2Rl0d3fvGe4jLo1Hq9Vxi2Mgzv+XVVStSL/bWMI7ARimR1Oj+4fVp4tBs/UBOLKt1rmQzlRf3s3
	2O2fmyg2KFKL/A+Gy/WNu7BCREL+Njx54xa5G4xZcU3smYu9NCX+vohSuyNCM9nY4SCC6
X-Gm-Gg: AYBFou0PeMwPOaDa4GDNoB1N9ZWIZAJk448Fm0rI6F0iLF9N+XZGHysw3IPNu9XNQAT
	eUc4JYtGpI7GMqZ9JKa8+kqAwNj+PWU6QjvAg7ap7SQVlV5r5nJdbc6D6TDiSvUSSRCkr3/t8As
	5WRe+WPLRP6M7QHwu3nuTToPsSRteGagmkbn3JITSVSBwgrDTGsxoqsalHU8S8RN8ZW2/G2aMGP
	/VNtZsw77YK4a3Xp/caYqf3OOGt6rAxF55E6qlm02xrD66M3hGOC27ekB9DGmxwZW1Zrrjrigp8
	lJTXo+Y545Y0sKuCm6wVYZBzFiYqT4bFE72PCoOpipVwLabKjT5T54FFRm4+I1t6dXnkCXcGV4B
	Csq543CFEy7c2Bsx7GUUP2g==
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890467485a.2.1793006138121;
        Mon, 26 Oct 2026 02:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890464085a.2.1793006137625;
        Mon, 26 Oct 2026 02:15:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3496891a12.9.2026.10.26.02.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:15:36 -0700 (PDT)
Message-ID: <ad790e59-9de2-4f9d-b2cf-1be9e7ebe292@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:15:33 +0100
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
Subject: Re: [PATCH v5 06/10] drm/msm/dpu: clear the CDM block left by a
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
 <20261024-fd-kms-fix-smmu-v5-6-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-6-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sCsM30MwuxrTEQwUWLFC2A20hdzi9Kn_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXxt52JHyMAoZ5
 i+Svv7rWQTgc/Ged1U/i+l3dg/YCFMfwJQmbZ0xeEfVxf5nbtvlIR3MWa325x/ol8KjagyuMwBz
 ZwD4pATdNXT84hFX7y1XX4edardKGNs=
X-Proofpoint-GUID: sCsM30MwuxrTEQwUWLFC2A20hdzi9Kn_
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf1a3a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h7YTzkf8KlyT4Ruvd0EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX56ZS+pclrBoL
 v/XKSpEU2kafwcVgeJQjJVkzRELUG0RoS9Se4UYsOSSYuLMw8VKov8V3XUNE2qgaBF2dygUC6R2
 Wsbo+KOiqKE0hkrLia8B9Bar1ahPH2VW0InsZ98m6ONBhwrz7zy23yCV2tkMMzSf9KKL1030qAl
 OjvlWk7K8+RuJV9QuiGTnxiY5F0jAoXX6wivJjyL5563EecV9itooS1AjiSrql0cBsJBOz88m/1
 rcMI383NxDxC3pqUkk5h8W+cryAeKaJXFIcnPk5qYP1FzEuVnriOqt02ZmrFfYnQtxxDNHMMTu+
 /LMj6+fRlAkdjLcIdygNMAr6rv62xP7oaxj2RSEl7Uoua2UUq7/cEtTiZyF11TTe3A0lrkLSJcI
 rBZzOoTYLCB23WkTo0Zj+MhCQdNb2Vc01YEIlRkBvGjMEqI1zEZSumuCCQ9l46WrmlFTx2UsFFa
 rQRribfKHHRvxpyUdHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_encoder_virt_atomic_mode_set() only updates cur_master->hw_cdm for a
> writeback with a job or for DP, so a modeset of a writeback without a job
> keeps the CDM of the previous reservation, which the crtc may no longer
> own.  dpu_encoder_helper_phys_cleanup() later unbinds that CDM from its
> pingpong and flushes it, changing a block which may by then belong to
> another display.
> 
> Store NULL when no CDM is assigned.
> 
> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
