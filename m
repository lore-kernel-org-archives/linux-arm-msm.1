Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D4B4908B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400904; cv=none; b=PrYAMC7i21cwx7vO8ktaYJdgjMQjS3tfKsFTRoL+/rVM4bJuOyA5nkgoOG3hCCLHg6DyePfjubKrHiPY1hHzkAmWC9mjxQkrtVkgKtK0S46NO0i4eS4VTzDio0jNu49HhSH/0LY40obLeUhtsGWApK8eENDa1JHT3cHQVrVWjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400904; c=relaxed/simple;
	bh=ANWtDHrUN8yaLtWHmbxn0S/UOd3W2HnelMg3mN8P9Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx19RngKM3TFtNu5IU1FFVA3b3fVoVNE4mRyIJRHWnfP+rOptvpzv/w+SHYz43pD++jvG/3ibz9UJT+0/ykSLW1cEiPIEoNdon+ngv9iF5XHuKcxePM8A6giTCbm/drtPF3LeyxTL9RinXM47YfpbHjS6OIL+UiDeU8q8xvKU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He0AHl1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpISH4L+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He0AHl1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpISH4L+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ourl723272
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDOJUKPZ+vd5FVmRMKIpfjJCtt51gYVRZlZPGq8hbR0=; b=He0AHl1xU03PyNTv
	xDsm+upddU4Xsx967MQJT4Wt34HjxqKkeRZI44q+7420ZbSnex0wMlSdCpI7KeRS
	CkovQFWNZYbFqwMK1I8pXSatwO89sH4ShObIo0auHRPtOBek18pZh4iiPhWcKcJG
	sPqmATo88qW7jjs43fw0bbAgcuR2ZcG8BQ5m//Qiom59mQ/zXYJ5FaSxHGNasN5H
	qg1pnEk9iBohfJJITAZrEiILn9wSbAzyOViIBnWc4/1Hq9sbrW+lxiEpMK1ywBkT
	+PgTeVlBqzSnySNuH1a29xXmH7uT5jgfbT50qWkSKq7Lt1nSAhazIAELbxuBK8I7
	+Z7KAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65g9fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:08:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso48598285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400901; x=1793005701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDOJUKPZ+vd5FVmRMKIpfjJCtt51gYVRZlZPGq8hbR0=;
        b=SpISH4L+31opgNM3JGDUOi3zMxXLD0wmm0NdEmcLbeyE0577We3FZGyDzr1ozT2jQ0
         kqA9deawQpXBSNR1BqBcVAr3a3DSmntlg0vn1IOYic9Pk8PIZidx+42hO3gLHnu/uUsa
         byWa/AdRkXGtKrO1f5atsbavMSE1OdLZMIZI/sUWWTQFxE/tuyW/HpyhB6fvJnR0Ap44
         xq8EhYn7h+G9Chfc2xyuaLQ+oibPUXf/arLBc38hVkSVplvWbTYZ/P3Luo8N855zFWUo
         i8+OMMY7f+gdUfhwrq9vn9BkFaWUS4QTNArzlnWoov+wH/+2HaZQ0gk34nfJU1hYm+7r
         sYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400901; x=1793005701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDOJUKPZ+vd5FVmRMKIpfjJCtt51gYVRZlZPGq8hbR0=;
        b=al89T4sbDil0axKLuxkH51w1VCGjvRaCuGA5tn8IRCqgOnPV4oSxeCbBks3DjlhHGh
         MPyIdSrDI/cCdtoL/7jwWVJGiI8NmhMBSOYYxD+VOM0ahbjOJo2lD43preJ9ami6iFWa
         zvo/nQeNjptsixbppoFgNLMtMqfWzBtkveO+Jn70nQFsyqo/OLvY3A0GLa4pSoedcRd9
         xgz1iHgx/MkIDntZqDTBB+aXdHYLrpvumLkgoR2v/DNOTG2yqX8hSMYz99NLW7erYAMw
         L0NikCDzVFKRMsL06bozZi9e7s5Bz9b8uKw9klBqO4j3kxG+B7uQfFhfqzuoBJrVTf0C
         dV8Q==
X-Gm-Message-State: AFq9FYIldKTuZXTxvqa4mJZHNx+Fz8Criyb7kQoTa35o9sGjCiUi6rtL
	8xeoah/7lzMYoq6lubUECLy0W7xhosvAwiHT0KCx7F5ZdPi9Jcm9jfqrM/QrdKHkKHk9SlI3q/e
	77k38pR7S6jKbLF6lr2z20U5jBBQfo19PbbSs8B9Zvyef/NPBUIPZqqQs1hSeZgvr27Cu
X-Gm-Gg: AYBFou0KMI2/59RhUM503CzFgrl64lwCBSoSC5autGvA3kIZu4JH5v1U1Y034Asmy/Z
	G96BOTmEARuC+zgYXkgmB45Jo6JKUhMbA/V+hk7MEqZJ39KbMS/CiNHu4OMyp0Woyp0Taq5r5R8
	nlD1r54/GIoXAVUNNQdfzUBCdF2aaxWk9Cv4gIOnBhqVV1jKqFXguTsUgmw6jUOu5PZMOyvEu3J
	Mg4MT/9OmvobgN3+UB2ioPxut779TkpHWEvsyzvHrPcRmw3ObOF6IcAOEcNKYPdIysO12pthlEz
	kANW3lY1xeZwpYCDlJTXa6osSbwEmZMOFxMZXT2yKIa1S+TXcraMZAliKoHo1H/E9sgbuRIL6k2
	sot5eaWSLMREYhVE0Lhs41Q==
X-Received: by 2002:a05:620a:4452:b0:93a:14c:329c with SMTP id af79cd13be357-93f29b38f59mr1324500385a.1.1792400900944;
        Mon, 19 Oct 2026 02:08:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4452:b0:93a:14c:329c with SMTP id af79cd13be357-93f29b38f59mr1324497185a.1.1792400900469;
        Mon, 19 Oct 2026 02:08:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10ebsm339452466b.22.2026.10.19.02.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:08:19 -0700 (PDT)
Message-ID: <20553686-c073-4b13-a23b-a4936da33dad@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:08:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Don't set GPU freq before the GMU freq
 table is built
To: eng.m7mdhashim.1@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261018-msm-gmu-freq-guard-v1-1-dd92dcccee86@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-msm-gmu-freq-guard-v1-1-dd92dcccee86@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX6BDJEr/hmY4c
 dNyi3RjXPPOdJUtaNWyE4WwpOMpMftBJPN47jUEU/Wed434zHvIPBJY3h7YbX+okxV5+EZJzROI
 pWkh21J5PVyD7LhCzOXHf52ofXMaSmg=
X-Proofpoint-ORIG-GUID: DIPdTO1XA0bTfBb0LN9Sj8ARnrE8fiXE
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5de06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=TId0fF7HYP2RL42ZpU8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX/uQFHohwrzf5
 g+m9tyhUxWnbaXgKOwn7PVlHHCEOLCeY8QHhTbWMmS4wCVsvgdKOdWe848XZkkm3e22n6RphOlv
 eKFiIQtxDnoOGxddkacR36c02LInNVH0ExJTK6iZa1Bxf/ibMZK9P2d/JE2IatgfMxkhIXXm4cO
 HgDFZfzC+zAuUBZ0M4etw6GSvHCRZCH76/lp89T6yO7sWXVH460esREDGfievA/fOqeV1NZcIjI
 KW/3mv57Q06OahUBxQ+rIO+v8QaYKvkEVH1oocQl3cTLUWEaJjZIKC5SVNeEzsc06OwLWII6zDN
 mpLJYtVH/9CnLJ+gOIVO/9eWfkg63VIuMgtFedtlDqiV6/3ISmmXitDcGeR67dasLNng0zgqha1
 NZTSlcG5IaUMbrBnWtdeF+uFcMnxAg1U6HqulcGNAUE/YVkaXkD2zCcwpfxuj7wSoMJZk6LjRKu
 4yY+MdUI65fmCpXy9iA==
X-Proofpoint-GUID: DIPdTO1XA0bTfBb0LN9Sj8ARnrE8fiXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/18/26 8:29 PM, Mohammed AlHashim via B4 Relay wrote:
> From: Mohammed AlHashim <eng.m7mdhashim.1@gmail.com>
> 
> a6xx_gpu_init() registers devfreq through adreno_gpu_init() ->
> msm_gpu_init() -> msm_devfreq_init(), and only afterwards calls
> a6xx_gmu_init(), which fills gmu->gpu_freqs[] and sets
> gmu->nr_gpu_freqs. The devfreq sysfs node is visible in that window,
> so a write to min_freq or max_freq can reach a6xx_gmu_set_freq() while
> nr_gpu_freqs is still 0.

[...]

> If you'd rather fix the ordering, so devfreq is registered after
> a6xx_gmu_init(), I'm happy to rework it that way.

I think that's the cleaner fix.

Konrad
