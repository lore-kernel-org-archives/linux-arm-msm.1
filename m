Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52D4CC29C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828803; cv=none; b=QtndgLv4o5ipgG5Va1weUgHiOpSj+1uIJE6En4fx5MThSiA42ij1neDUJeqW4J0y3F3V4PY7/o3gIgX46R52OPln+hPAubGh25OxsGpg9GG0dbY3eeIXQyxhLtyUmpccJt265vRBpVJYoBj8uu0VDI6Htp/dpUi6B1mpega9skI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828803; c=relaxed/simple;
	bh=cvutCsJ7P1pO0gUDzHxGIOHKI414VIJ9bd4O2RctmVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVeGH9QTdn667NufKTluzJYtlj/xezu7B5q/kHvXjgwg/8vV829NuEslP4wPXTXBGm+pufVny5F5qBCnP8jTO1Ke4SM/QH13ccxGMGa/Mjy24THg093C35zogtWN+SiX0SCuvaXrrRAOxiW2D2celaej/UupHsi9tW6GMNhA2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoUKmF5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLE6ZnHv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoUKmF5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLE6ZnHv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv2s23573463
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u7vtvJ1VscGBojbDlDxNg96L1K6AUN+XvvnqPqIY6Q=; b=HoUKmF5TNsCizT74
	MN6lBM/b1ykF01Z9zn/fMWiulyFoFLAi4UmrpjsNVa8Fb4FlsNT1Vcm2yRWsjJlZ
	eukT/RXErwjzbSVX9wh9ODVz9PKuT/NzEBxywGZn55tNeQY4Y6qIJu4BXm3dOhh4
	BbeS2RPiWS6+hjfdYmZ3Nvy2T7Wu+SciOqjBiARd07hf26cDd/bTgAYDwX8YoDEI
	BLZWE2vE5uFYX4Zkfmf9/DG2SItCk+OebZIv0Mf5tWQqbBn/HrZ89IzJx9l9WNHu
	7V3CxDMrIRvHh0495j1T3leSQFYKc2RmgaI8HyI+eTJdJCatC4nt29lAGht6GG60
	gIk5qg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffj56y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:13:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so407297c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791828800; x=1792433600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u7vtvJ1VscGBojbDlDxNg96L1K6AUN+XvvnqPqIY6Q=;
        b=MLE6ZnHvuzHdPqPeLWhY3lIVsxK43u+JlkR1s7kJI0E8KM1kRHytH/bhXWDU64a3l7
         C5PwmuWHKlFKI5sDLW5YBdC80yZ7n9NvLEDgBg4TigqlejwfaqJ0YQGXBq2gBrG/1C4J
         gio7LX2EHWVJZz1xFTejwqw/LK1hbcGVLNfBszCcS1j3XOUTIxbwgz4gC/R1cQLCc7O/
         TujA92ms9IASnUNSpnajGJCgzuRDF5j3bElLduY8TJxyggjMA2ssg+IkBLg98nalvlAp
         HHrgGNXEt4avSzYbbz88hMepP5cj2FigxY+WXLmJoa2mLVelrdofjpqQWfAnklZ9Guwq
         y6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828800; x=1792433600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u7vtvJ1VscGBojbDlDxNg96L1K6AUN+XvvnqPqIY6Q=;
        b=kYKwpQ8RUlprU79P1aFELmm83Q0qC2mmPkEbXbDTLZ+1qt7VDTi65ohbp/By7tqDEh
         S40Y/wIEG30qQ4P4eoiCUk3zjGq/1HTQCiVvv7nTGSwrIfQn7U01D+tYLd38q5zHeTnq
         mt2n+VgbkPmiiL8Qw5bzGuXSScW1bdsQqNizTLZkkSA8VyQ2P7gCbLrxXLprDQ5vKaKw
         hlfwysY+zODmtnS3qJ53WZd6SyQ14UGNwZ2FXWTNqdSjmBi0sRhDFSbgQx+YkYVTMfzQ
         xVXUcH0aFlc8+GIxfmUaEFMNAKjLZTbnv+X+DGlkOJzn26A26qu+yb64ZhjD+Ac1e1+2
         Wa1w==
X-Forwarded-Encrypted: i=1; AKwUvBzBBVRLzGl+XOoEPCh6ABXVf2hLnY5h5HvsXo4MlNcKF5ORaQet70kVPN/OeF2oUA9Glu2tnYw6Tqty7v93@vger.kernel.org
X-Gm-Message-State: AFq9FYKJO6h0i6Xts2qhkMXo+MlbJQIgXlyV9ZbSlKBWzlcMzDE5s6kv
	gfzg3hWWxJX0q1vgb9Aap6LoE7BwKVFT6aPCsgCasI6W3GHqdgAsLnpHPo/Z5ar1WYtxZPBVlRm
	1yB0d6imr9i+dRGLG9PY7+QOPl5JOlOezrzOKgfzAvs0/s+kMFBO3NW5g7WGqMpFiKoeV
X-Gm-Gg: AYBFou2PJSr+TsySW7lDLK25Jhqgby0n6LHJnzutNCzDGwThQRe8xz/hWDiTFdEpdpl
	A+hQ2sOxOzZWWECuoGihvZAibo36/VVR95xdHYaNI5EfxshpVP7srtLUvIZyKWvn/UuKiKzi6fw
	Yx/Tjkfzbt+iVeUSWSxcFubg8BknEelJBf7lODQZ8dNXCqsBMJTw3hZElIHyJ148ShQg3fZ/RGm
	nYdK3jkJg/m6jc2ynhs3cWFTEPocDNDI0rlQcocogJ+tzNKJIxrwGtZYWl0ROLGR4J3oJb530KL
	qXh+6iTgCnFGkaYSkQhdeTtLHsk7U6kIgC3K42+agQfldDWco8qF0lSK1eeP0J/yhwd93/T8pIC
	UYlm54n3gKHKWA1sUkadkUo6O3eeT2Rg=
X-Received: by 2002:a05:701b:2509:b0:16e:7155:98cb with SMTP id a92af1059eb24-16e71559b6fmr10328689c88.15.1791828800085;
        Mon, 12 Oct 2026 11:13:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2509:b0:16e:7155:98cb with SMTP id a92af1059eb24-16e71559b6fmr10328643c88.15.1791828799374;
        Mon, 12 Oct 2026 11:13:19 -0700 (PDT)
Received: from [192.168.29.225] ([49.37.144.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm32160285c88.15.2026.10.12.11.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:13:18 -0700 (PDT)
Message-ID: <b876df89-6be1-4b06-bc62-df9b7153e77a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:43:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] drm/msm/dpu: do not assume a merged datapath when
 validating mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-2-fa986071c3c1@oss.qualcomm.com>
 <iqkzz4wnfeeul4nkkemhcvjluucot5ia7pfin5ghu3tkwkjfso@raqzz43t7lxz>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <iqkzz4wnfeeul4nkkemhcvjluucot5ia7pfin5ghu3tkwkjfso@raqzz43t7lxz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXzCPyWVvE52QI
 3WbecAZ4MN04UHIxIKqny8TWesRlg52Fi3TR50ZoQ75W/mgYrkggAbZmKSFgurFKhBKaTKzCodf
 6whzU7whDYg5M5MlM6H1oiT+OtvfBYkP9rC/C0ph2EhyOKvSoCIVqfzfAYCx39yTYAjyIq3nZfc
 oIFHhQOweTBiO6Rzw0hMDKS/3jXgpWxVPGFRtJzjYpXTOWtMC+UPMIEuRVDv94z/h+Eh527mhEI
 7J43IXdxU3JUh9U1Iayzrfs8c6sf+1IKQB0x2775onw9Smk/wdUuuXC79eSylyx+vVNjTdYeT4Q
 ihwSkHg4/TqcRWrJGkdB0r9QLbKpTiF5uu/QdPDLHUSq8ewmbs4O/PtWcUcKHt3nIXqCDK1nSFA
 u1CMKWnSD8AbMRJpbbhaEQTeh6J/p//5jHacdgHBe8OOIYT8xMjGQljyTLuH9ippoRqQ/u8YcCV
 5RRp1Or/NNCkE+IyfSQ==
X-Proofpoint-GUID: QVQgjrRaZ7BVV_lLOol5gODjjHJpDABZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX7cyjuUcSlLc7
 ZFzPNZ4UnAjmFu6a+YNXq5vhXFOLvVO2Kul8srVe/b97PNr2qzNKBnwGWB9QDo3F3cdaRj0Y8gV
 zGwMZetBSbheKvi8ihZn7GhnhaZUOGk=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acd2341 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=20alU+YIu2uqf8Hyrg49Cw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mpA_8Fus6RAmO9hGp9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: QVQgjrRaZ7BVV_lLOol5gODjjHJpDABZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072


On 10/12/2026 5:39 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 08, 2026 at 10:53:48PM +0530, Mahadevan P wrote:
>> dpu_crtc_mode_valid() halves the adjusted mode clock whenever the
>> hardware has a 3d_mux block, assuming the mode will be driven by two
>> layer mixers. Modes no wider than MAX_HDISPLAY_SPLIT are driven by a
>> single mixer, so for those the check permits twice the pixel rate the
>> datapath can sustain.
>>
>> Divide by the mixer count the mode will really be driven by, as reported
>> by dpu_crtc_num_lm_for_mode(). Split modes still get the halved rate,
>> single mixer modes are held to what one mixer sustains, and parts
>> without a 3d_mux divide by one.
>>
>> Assisted-by: LLM
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 0b51a4c5db57..209b25dbeb6c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1631,8 +1631,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
>>   							    dpu_kms->perf.perf_cfg);
>>   
>> -	if (dpu_kms->catalog->caps->has_3d_merge)
>> -		adjusted_mode_clk /= 2;
>> +	adjusted_mode_clk /= dpu_crtc_num_lm_for_mode(dpu_kms, mode);
> With the 64-bit division fixed, LGTM. When submitting patches to these
> drivers please make sure to build for armhf as well as for the arm64.
Thanks for reviewing. I’ll replace the division with div_u64() and 
build-test both armhf and arm64 before sending the next revision.

Thanks,
Mahadevan
>
>>   
>>   	/*
>>   	 * The given mode, adjusted for the perf clock factor, should not exceed
>>
>> -- 
>> 2.34.1
>>
