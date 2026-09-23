Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3549F127
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161696; cv=none; b=VrjbWxlcFxxaEC5f/HPu4IK9nsuey8apBPEjQrFWsbR7THrlEpF7bLnDRTp26YfmqMTXnzy2G6UkB3Lfp0YbUuZiWCOrp3BcYA0zsHQ5Oykkp/+XJtZbjrQfjsrcTmCKx+2in5LEuXY04TnOB5moNRoByAW+U7s+UEFnEefcJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161696; c=relaxed/simple;
	bh=aNpgniYnxQlNL672usor40GA1ROVwhv/hX+i7Cjh61Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y45gJlRung6WvTmuRTgtMzDIxPiCwQCfcbxOmOgA42f3DgrE5MpG+7poLS025YPskXMOaMIOwjj+Q+srBsHKujxUM4eAz5adz+Jq7oqsCprteapCl9igf38q5oLLUavGv+deWlhUHiqFRDODHdSA1XQhA4kFYCxQ2DTV6WBWFyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSHw/GHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpl4omVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSHw/GHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpl4omVR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3B0o2262077
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=; b=jSHw/GHX+7qiVa5u
	iVT40o5K3QNgEYlwEdP3+cc8K+sASk68b7YPP/o4e6MPUaPDN5IGzEYEyGeBDiG2
	NsOPCamSnD4Cr4AaCfZ9ryXB4JD8zmhdJOeN5BuuU1phCLlwJUogyiCcD/AdHPeH
	Ova2kwYXGTQabBBjGIdtVUMpH6SozKunsEYslOdO8l8Ul0FVEu1giD6KMd6MOPFI
	ZhpRSU8zWEnqzcbFca3gz9/p6s4N1wf1w181DjtTCXr1k+jJPjNnVLk8YMNDz3y0
	T2caOHu2IwlCwV8WUX3ivV6PspWV9Hi2G1pgeK5Sxgvf4MpdF8YDK1sCMZtE7FLx
	o8F0bQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3pfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:08:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-333543ac378so930293eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161693; x=1790766493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=;
        b=dpl4omVRX/Qhl2i0bmQ9owUUSVdzVJEm2RQR/aDI6nI75cjP146qSLIJ4W+v718m9a
         uSbuFS6dTG/1ek+ClAK8+Ie3wEdRf3RCfKFFZbwhhnSllmkfjTdnyVGnVFrWpcuwg/Zz
         hDyXkSD9HWl77Khbq+UH/Si9xHpNbTNrnbNVjTd0l8cZ+aaKH2ANE2QQsfHieOGj9ydU
         +ePpqrEbQp+VzuL3dmqCY4n1iyenFks2SW5U3MRruFsuiJvGVo0xQyYh3oDTmT6MtxT4
         /+BsPFTTWFsGymrLGmLUwKyAMokEy+oWL1OrboQsCQSO4zVfBuG1zHJwEU4Rhaw38K7u
         lgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161693; x=1790766493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=;
        b=Ngyn+yatwf0G2NH98obP4KfeUizqOUNyugHGPyT7Bsd+YE0hwJiDhlS/g6YW0wb3ug
         r1JTnoTRPwyWyewAUZpI22cfXybU7zUL986Ed5bd7ASHr6H+St/WBTpSbKmMWg1oF/z4
         xy02UmQUNHVL+hR1aEgVTGxX585REKrzOsE2JNYR2C9dZ9LmLQFKTGgLNhBA6KsXMM6x
         +bwyIdkdcF98QecCpqTc5v+jEOL4yFw4JFz8HPg3PI5mfj68/gfboTuqeLq06aCtwFGl
         n3Ro9YWCA8408uNLxXGb6WMD6Vv0pt3DU2ivnh5lCFSn6JDFtm1+IYFghxUsdNBKTNXr
         AI3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/mBS8QIdfK6AnZ6wchsFea5H5NXNdqxShy1QZX0V9PD9csceL/6RN4YK+9w9ZCb4F10UkM1lWQECAfDy5@vger.kernel.org
X-Gm-Message-State: AFuF++nYMEfRMEN234UUyAPxzKvmOlmY0FCMfsinOBVUmHIJ/GT9pRIx
	BYhCRQUQu8v9uTdcQRdj3S6AdWhIQVnohvtu7wDWb1q/gKMvcUeiDuWio2oGaSvY3nwyM/YpApd
	PCeQJRR6CS4xeVyTD79Rzqv8m1USZcd6fIMX2qllstzvD3estckoEaBvnSRFwASjJncrP
X-Gm-Gg: AYBFou2iTs1ZyxkngWGncKwC9WwvoEmfIoLbZS+bo5W2znJcg3JOpioiUDSffHEluUt
	J5782PndcKEHIlqJLT0cHtxcFZopexrpNqzSgFlDfB6W7EnPKMTQAauD5lZAJB8YTNpStF5CRu4
	zHWKebFIe0dfyxEc8Sl6S5nhhc/SmkvenPFdSzGHsOlump0yuScsX5OBs9VoK1a4NS4IfWfgZWp
	bObew6GbmGdKrSzZUdT8WU1VuloDkZjBpJtAZEWoM2XZW6WFIbGD45xJA0vogI5erYWZ7VDepPl
	PbyZYOM/5Z92eTaMPiu3FtiGRd7T8GoZmG6Ow4KXukuIDCtR/brS2oiKEWGHcvOELM5EGdlzEii
	cx1szuLUqDJOgrj8id+tzYCMigJY=
X-Received: by 2002:a05:7022:282:20b0:143:707a:8958 with SMTP id a92af1059eb24-144f9176299mr2850202c88.33.1790161692635;
        Wed, 23 Sep 2026 04:08:12 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:143:707a:8958 with SMTP id a92af1059eb24-144f9176299mr2849904c88.33.1790161687339;
        Wed, 23 Sep 2026 04:08:07 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm13917357eec.18.2026.09.23.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:08:06 -0700 (PDT)
Message-ID: <18917c5b-a6a6-4b4d-9a1d-452b53add385@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:38:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
 <arJytCJZZnIX835Q@sirena.co.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <arJytCJZZnIX835Q@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lUHpTt3iFznIS_A3dQRb3Up-8q3TxJH5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX2CWHfbuaLuYB
 799KldGn4tAhz+obxvlTRWkNcewrb16qAzAtHzIE0lHdUxkO3tHPN9syXDjBZg7hXmSkpDjTutl
 zj+eWbtuTixtph3rtUV9k05TYJdEyCI=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3b31d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7yqfin2zcifDTxxPRisA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: lUHpTt3iFznIS_A3dQRb3Up-8q3TxJH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXw6nmGr3cWQ3l
 HKV7TaAe45cR3pwb1Z8fzQtGLpK2e0Fxu9mtWe7c7E4iS/Uy/25qcMEjfORzpz769OiXZVAPqjL
 /IEbctdVZki7Ql0mIR5o69n61DtM+zlB5+7bVK4HO9WAJr4JgRUCYFzyQGhTbY12huR4fV+Y2uA
 ucTyAIMGsrLUTQYpx3dhsF+AMGNf/Oq+rOLdF7jdDn++V626rQfS1dUReqD1Cn02xMKHJsC4+/p
 5ec5Pfm5V4zTqnpti7evgK8ziCFtdeDBCmo04Z7nWoF/SJLZNL1+lYs1R1eJKkQbM6/V0ONx2Bc
 ItDJkgDC9OEMUaYN8JvJpxhNMN6O2DV7h0KyVo5Q5BBj52oMK0ASle/NyEjCCsTfTt3Ool5veiH
 V6SlJWS1SqSywwTSw78bHA7KJjB5PVOD8y50lXLT5SP2y/1UHAHGqdmQhvG867Z96P8GpQeVaDw
 2MB54a8Qd1k4SR2NxjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044



On 9/22/2026 5:51 PM, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 12:38:11AM +0530, Ajay Kumar Nandam wrote:
>> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
>> context and cannot use the SMMU. PCM buffers must live in reserved-memory
>> carveouts that are SCM-assigned to the appropriate VMIDs.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

  Thanks Mark, I will fix the binding patch subject in v6 to match the
  ASoC subsystem style

Thanks
Ajay kumar Nandam

