Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619452;
	b=sH4EEm/ab909goSB+X/NoJlUTlBtPRfCY7GiA8q1865Rl7bOQTphVrl1HfKcroWmA67i
	 DVbAOKa6K+h4pcMIFtCQpo7kvrE3K/8hPIxvmA6bpW62f34Eg/B2qgG38WO2a3jD1Sve6
	 hyGagayoBsGoeDbb3UZ+zYV9wgxBHnK5PFBmSVGWkFXwS5HQnu53OXp06QqVFAYuGiKqY
	 23r3wH5u8t92Y6UAb9PUPU+15Erq7lZlMGmnBavsWMxCCZd/0sAyucd3KUYhSZGlcg4XM
	 p2y3ujli/MaMevYngTnxsuz0kSpsG2QVTftX2g5QYDrS82Lkaaf2CSXyoeiuW6cBPJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=;
	b=IKacAjWvcwbFyOjIS96TNhozJNghZ9ksLEKEm1caHWW2eswf2WKXYzfd3ECG5pGmiGL7
	 qfNlM67nQ6POspgx7F7r9d70whh+gua9rGymcrk6nK5YnjjuYYZ1PPtkYGJyFSeZGzELu
	 13z8FRhguAFxGf6Ayd3GRCnMiO6eS7E9Viy1ISSRBcg4RpNhXZYRFns4zGjMm+bb9pdQA
	 IUKMDtM8CQ7woRbnYjc32e6nI5WcNbQ87jbsqEwTv5cDd0SyM+LQXzw1BlR30yZFNiiYc
	 fVSSmSi2N5b1A4AUHzekURPtebzwp0cXUkzSQruXa9lbCcXp0/JJDDM2SZt0WjEyKiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FOHN0Jo/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggj04WYg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5261606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5261606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOHN0Jo/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggj04WYg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4MIP2616191
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=; b=FOHN0Jo/PPK4bIMZ
	8ckz8jaPw64Bt/NYZ5hr6Vqm9EXJQX3hi49V98CCSiVnEzYlaNbn8uqQlBfL8wQG
	6NiI2Yq6NZDrECUimUKIRzfF+qB+WavE5yfEE533hKZZZ2uNT8tYmN3qFNmn/o/7
	qIXmokyr8r7n6iM+9Wo25RlFB9Tb+ZcWy5mAPwMmDrwCeijBqm567M+KSduQMwf7
	+QTurWTUrHxW1Tn4bmcm1qBSPRwc/Fheu3cZ4tDlrCkNMrlvsgLRtXzp7kuQb8Yi
	/jxmJGjjkgXL1XF3o0iczOMKPpntywZjNc2lGqQJep7KQVGZvTJghg3vYlGSzTf5
	9zntRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg3sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:37:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso48830885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619450; x=1794224250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=;
        b=ggj04WYgJzqmPAev88g0BRuCuvwKSPAxl1gJr/jASV07q3snaUSDCn22kwabFRPvKT
         lT78Q3Cm/kpt5d0SVAwhZCM7a3HZQM6DTPZKNxv8B5oWWKJNGmdrrRDhmXGpdN4aDECx
         NuHLYoj8MM6hRP5bgv2wVUoqWymC+ZDoBkxoCxcDqWtCID3kf2xOqoPPHzTqnri9K2z7
         6NNKEwORzwjgWwnExPPM/tWUtr97x93deCwqZFWzkTJLF3IfVuWCKzGzrr5KqamMHeJ0
         /RooypBSxZbhhIqHgqb9/Mu09JcL+dA/ZvZD1Nmb5/X7WGyZGGposYF4WXmVer8Y9+hu
         6Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619450; x=1794224250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c+cSECcs+et9sk6TFDNZhsmC/63A8z1age2GpVsHLs=;
        b=qq2BFjhDYApyckHafwPH0p9EE3uNAwHabbVbdutvdQCd4GaG0c591ZjLm2nsJRLRk2
         HTg1VEU4wEqsOJ6eHnV5njcswBUxyLU1viU1WJxBiA8EpGP3dqFPUktdTOWAelLF7vHQ
         4PBbVW/b0pi5rZH+HE62dTtYTN2Pm62uYC5HdCIuHRSvglfOD/PGJwD1fX/AE/LfJmu9
         P4yzJBSpI4mrwYQS7NtyJhdRmEroggcol+sEhzoZhrHBWTeg6nc/t99Q9u0KN/miCfQm
         V1qHsp8xr3N2vj4xSyWmPRWMJqZwRFGdephGahpFitPYgaoCYV3hzLOP13hTRmuOF2lJ
         nFmQ==
X-Gm-Message-State: AFq9FYIx4ZzGHM3Na9p+ghTnT8qEVU3Rxm4/84sdYHp0NO+BTkMCcWd3
	iK90qDRVxKcOq0XlRLX5tFWQln+MA300ufRWlbY1u7C9KkcLBhv24qDOsvHB0ezhUIsDmAMdCEZ
	EZCqLskaZecDmhK3i/mppqrchzc04lXFg5hNwQIeR/Px+VeiYlxftu9+D79kYKlMSzLdB
X-Gm-Gg: AYBFou37iYjrXLrhjeis++Bq5iOBwqrL/cm0wHVfB4nd2/TLRLccZfQQdHLWD+37QKb
	w4VhVy+G36H8uOBPLD77IUFmU3NhIYp+rKhfUbMUlXhCIDXT4mK2DqEsEHRxxDcOPk9BF4hEYUq
	hcFzL/N53GVWhBxMF044ztSr8MHaqcZ2tUTeimBAn6qlpr2BzTBlBQCgUcyX+5TDqozI5JSHxuk
	6MZqcd2vcBhneZ+GviT3X9nTVykNUYFUzCumsr7e8ik+93kR1rZhboiCaayEWLJx6ey+2OJ6Hak
	femggLNGySmt2MNo4oedvKTxvKYK+bb6MoyBGFfWIcNYr6zzYWK31hEPpswRtwHQLjOBoUEVcm6
	Telp9ErOtcHDebPqpggw1wY8JDYaKs5LOgC34we9AbuGefsgMDUJFlTnuIzP+812/baN/KH4=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1571834785a.2.1793619449802;
        Mon, 02 Nov 2026 03:37:29 -0800 (PST)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1571829085a.2.1793619449327;
        Mon, 02 Nov 2026 03:37:29 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd22bsm372126866b.28.2026.11.02.03.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:37:28 -0800 (PST)
Message-ID: <b967b192-b34c-4def-b7d7-35c0a21cddd2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:37:25 +0100
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
Subject: Re: [PATCH v2 3/8] drm/msm: Keep DRM private data separate from GPU
 drvdata
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-3-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-3-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX5pZ6rK01Tbpn
 /ruWH2Tclao2CEy9jSl1zJQX9nxM2sBdtQR+gkVR6puHZjqgkK9B5Ja5i/kNT65+3hz4W5xnctF
 Kbx/fuNqSFSa9YJ04aHmPynH6afoG60/QejozHD0F5a0/m2waNyWOWSg40A06Rz1KpWzr9Tj71K
 laiDu3injsElvfWComkSP9Zq2R10GT4FilufDZ2VfYBJXvcHSBVekYg2NmuNj3RchMRxSMsU72i
 VSC126Rk9jMaqaAstlKfqjVoUM+t8CQDwLkqPCkEjKBu/asL+wt2iFAJVQ/HeyTmCsSxc2yWrOJ
 bu+XpxTOVA4cBPAYB8SQcauNDVEm7iKZ2JHgJUq0sNXZf48EPwqW1b4zRmm/pbQexvuzfgnHqcG
 AGWpfITrb6uo9bHRVuB91YZx+zJGy2B2GDsD8kKbBs3kPfBW/SWbMZ+Byd4OetCtJsfaSK1IRfV
 MCgGc44y2OPDoMxxOcA==
X-Proofpoint-GUID: vQgrUIkfvOdDvzyfI_mCSWXJGq4baZe8
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae875fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ifS9znPv-Fj3RtktaGwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX8om7C+H3cVDg
 7Grg9rQwx2YQ7jI/dgLiPh2gusmwjA75Ey5PxTGY28q5oDjx4kebaVqvuRNlBCsyE4a2Eo2NlC0
 Oanz+7fYVcqaosvQcf5k61JrZAX/eWc=
X-Proofpoint-ORIG-GUID: vQgrUIkfvOdDvzyfI_mCSWXJGq4baZe8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> In separate GPU/KMS mode, the GPU device is also the DRM component
> master. msm_drv_probe() stores priv in its drvdata, but msm_gpu_init()
> overwrites it with &gpu->adreno_smmu. So, it is better to avoid using
> drm priv data in the master's dev->drvdata.
> 
> As an alternative, store priv in a devres entry of the drm master and
> retrieve it from there during component bind. Update all component
> drivers to use the new helpers.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
