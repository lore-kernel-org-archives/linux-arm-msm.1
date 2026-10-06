Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1979B39794A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269708; cv=none; b=gOIoLFTgQ88s5PZ0s+14ycqJb5rMqwDcBULFEbe6p4K4g+X+aD+4Nk2s1IHKmP6TrGGJgz9tcRJrjltdosGUcxs41KWUfSinsIm+pj7/FsS0omIVKR+5SMS3Lg5u/i1Ui5DVIne4x4qg4MdW+UVqAv8lhSqCsL8nqyRCDrigcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269708; c=relaxed/simple;
	bh=Y92L98xIukpKEG/rmRg5pGerJ4lGFNQ8M1Fvuz/xVnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eh65OVYTs00cLW1LfmBSLMDOmwir9tNYbK20ze+M4GMfGRndY2ZZz9y7jb/PtcZa0kfBkf0NcrZh+bj0Lm0HKTGmbY68pAF94gyvhDZhELxHr7hAlco1oZpwarkXiDlS0g7nhIV3wI4aZWN9utKWpmpy4BeUPyRuPyMme+O3wnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fS1kbC7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2qjtSdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fS1kbC7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2qjtSdw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eL1O418977
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 06:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmidZS1P/7FLoMQ0OZhRCGR3Pz3LVuqOUkRF13HzzhU=; b=fS1kbC7dRzXWNave
	r0ZWbaKGtoGe2tVK0v7ljOcXNrRno/Sf5ZbBrnOm03LkUz9GBHjyZoT416th79GV
	2lF323f08PVkTKBULVQ8RJw1lVbpePXgVNyzaLko3JLKf7dY7KDxNZtA2dSfP75n
	21cNlzuy1q27FZ0q9vfXrFHEO6pvsBLLMXGJk3+yuVEsEEqbfFj6NtTbvszSxLGK
	Wq3MNLdAOzUTG/vCd8F3KUqt3Lhk9UJ1QWNtLd1+UTPbQOKaFpZzpQRJXFUa7nkG
	xsa1SM+zk58IHLxu0kf728LcFEgUggYxx+V4LnDkuemNgnFIYRwzJ3fdV13HT+na
	HRylPA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg3vt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:55:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c02e1df088so380012137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269705; x=1791874505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OmidZS1P/7FLoMQ0OZhRCGR3Pz3LVuqOUkRF13HzzhU=;
        b=c2qjtSdwiKpspAiVrucRjd99MIWpl70nexmm2ryYnKICR8K8C8bE3aGs3qL3eByW0v
         ibYGc9zuVnIIKuOIbdSXWemN6w1RXKwXgrZbUsrAQsWWKZ/yGD3XoW3YAwE0IH65sg8d
         /+z24m8njPFndAE90+eJOOupRKTQRJzOoxkaV2DI2tLIlr1qTp3ixSVgYdM5pK/PbU0F
         zpMpMVvC95PvEV/ihqD5527zN6mCpNJ9q4vz162g8ubrEYdD6Gfwk8gzuuhpdNZRZkW4
         +KzQzT+EiLJmOHqUp9urWqmwuM/UEToXOd8lE2ouvi2apHV+oAxULEcFZrU9INZx4J5p
         ZfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269705; x=1791874505;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmidZS1P/7FLoMQ0OZhRCGR3Pz3LVuqOUkRF13HzzhU=;
        b=fXZ0CNEPzDrzqqMstNgxbkn8REBkoyE/soZAKar8w9VSdY0mtx2IcSOG00/CQw7hUw
         RV9QWhwh0OEiIYEkzB1zr9kEFkmEVUKrNpRZhr6rgSK1Lk0G3QV2VM3tZBFnT59xd+Ep
         Pz6LDHfBY2OqXj7hTVEx+fPDf/exq8B6l0uzF6zNoHNFlHvCeQGLMvF579Ol+CFpCMiE
         5aQb/48ZEzLF8FzDZ9pp5I31YHrcsefQ/0U8NeLRiosIUpYSciqjEg3bEQ57FDtX9IQ1
         6N/73wGT2bed3zRITCEzrOCIeWo40YHuFpT/ieK88krQntfRfDtfu1hCaGivaNojvDqg
         Pirg==
X-Forwarded-Encrypted: i=1; AKwUvBwmh13SVjXEyKBhbLqI9WDH2I8jDndiz64d8UkiYY+57Tc+xb9MtOaoZe+Tny3tWVZG02pIM7DSjMj9saLP@vger.kernel.org
X-Gm-Message-State: AFq9FYLH5ObyrGzL3f9ixqIhC/KoxIDdBTMWxD7eQGifTEgqmprpGHUN
	e2Y9wxGhD4bpmUykU+irolIT9MV1GCwES5GDzVhmKP4eJ23PGXz5ZjwbJIDNZZwhKQdTM3uq+Gi
	YMBX8JwVGlhJr1kBnqHKydhcUguazknQrZvt54370y31l3/n1CEX2NN5n9sWhrYWgcMNv
X-Gm-Gg: AYBFou2vIfQYs229g5FUezlxgRvbcuGFdoXG29yO2h3pof2qM/wyvsP6UAFsupkY2nL
	t+S8AftoWFsZFqqKNwDs2sSHuxny9zdNVfLDF1DUPOygACMQv9lGQzx63kH7c7JFsTuf3Nnj7Gb
	YvGZEpd7sEoU723Xxl6lXT9lQDgLsZhmnf+hw9JkP1r3RTWV17mHmOcYmDvka3PjsveRhAqZcO0
	QRu8mMyGlcAaocOhrj74Ou6lKvyZHGEsxqVOkYFkujupgVvR6EvAmvyHiRWplfMclyS4Yn8XCtv
	iIAeqE3pZUC2a4BDZskVYlUWeYYPpjv+8Yi8pD55L7M5qWVzd0kXk8U8/dWpkIYzhfPDj0qbik2
	w+FRHL1PLRcZbEWA2EhtVoxdHs3Wv+qk5T3FPaGuUM+N8Crrpq7K1HZ5Qb35dQMzwbbNwG0g6eK
	r12BhSCk8+CmAq
X-Received: by 2002:a05:6102:4493:b0:7c1:c1fa:f3e9 with SMTP id ada2fe7eead31-7c87c7eaa99mr64206137.22.1791269705441;
        Mon, 05 Oct 2026 23:55:05 -0700 (PDT)
X-Received: by 2002:a05:6102:4493:b0:7c1:c1fa:f3e9 with SMTP id ada2fe7eead31-7c87c7eaa99mr64195137.22.1791269704876;
        Mon, 05 Oct 2026 23:55:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org,
        Joonhoe Kim <26rote@gmail.com>
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
Date: Tue,  6 Oct 2026 09:55:01 +0300
Message-ID: <179126968608.1110179.13039168143439761723.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002130656.50577-1-26rote@gmail.com>
References: <20261002130656.50577-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RsC7TdtzeUxw9aOUDTv2P4fnebxwjFVJ
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac49b4a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=Vzt_8YN6H3F5x3tZ7K8A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX+AuxEmn/sEVq
 3opz/pfkAVoi5wcP0mMotI0+KMYTT9OIoImIBWaPO+3m8UxM2xuJsY8Kpr9AQh17PwgZyHZq5of
 CPadQPObEzPE+4Ej+wj8mP02A+hmGCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXxrzvHGK6zdjs
 ZL3dNcqiG1zI7b/5SVUOsGly3GtU99watfzfzyvWpTK1f+7e8tOQIfFbkqvxATrLvdhQNT0cAbZ
 xb7s4mYlDLAvkEWmhsKD6sv16H5sZF1M6ixSRQQ2+01A2LFaxsNjoRDs01JH3ojGBwooGcFnLx9
 P6BLCqXlrADbWCWp5Zmme0pyPBlzFIQqfaJJN4HS4ehWB9fTXGNKC9EsHZClcu2njYC3kZd1hcK
 MP8/Hxm0Uj2v5a4j6bTDiA+Huah4v+yLsH0cTMh9VlAGg4Vl46oySN5C6rghDHPZHUCDfni/xbW
 Sdk0s5J/Jy6CKfIMGYR/zrURXHacazkO3blZsB5YeCjyXICtNTf/bHc/0AmjO/0e19GiiEsetZz
 G4XSY49GTq3C5IVVCxPCOpkXs0wMsZIvTiJc6Upfj9mNYK9TnDTRpjVNXCeyEPPk7jf/jHVzOxo
 cw3eW1TodkWvoCVnyLQ==
X-Proofpoint-GUID: RsC7TdtzeUxw9aOUDTv2P4fnebxwjFVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060027

On Fri, 02 Oct 2026 22:06:56 +0900, Joonhoe Kim wrote:
> _dpu_core_perf_calc_bw() is called with the new CRTC state but sums
> plane_fetch_bw over drm_atomic_crtc_for_each_plane(), i.e. the planes
> of the committed state. When the CRTC is re-enabled (DPMS on, system
> resume) the committed state has no planes attached, so the check
> computes bw_ctl = 0 and the display runs without an average bandwidth
> vote on the MDP path until some later commit changes a plane -- which
> may not happen for a long time on a static screen such as a lock
> screen.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
      https://gitlab.freedesktop.org/lumag/msm/-/commit/480ba24aa340

Best regards,
-- 
With best wishes
Dmitry


