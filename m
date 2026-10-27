Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089948;
	b=I9QaHbDSM90RWNEx5Ny52mUDo2qKByucRhm1C8JUnAqtaQAbYvakRois4hGWBcTpzE3p
	 Kxw5ZhRl4vQryRfkSjT5eEjGG9CCY/LK9l6FdqV8d1EZlzgNrGS5TgnS3I6X3ZqXb7+hB
	 AFCagjGKgTNuhhv3kjTc+J0i0S/MBIWRyb3kKrHHDtfYljBWznimPOMwUMnIyHBBbn8Fj
	 xSiBWHUYKKji659mT3Bsz9I3FDPI6nvEdIjSYAzXAeBOnv3NxBBbSlW6LIU4DKUtMzdtL
	 fmB8KWHoPR32+aI4BectzawiQQ7Bf/4vIyYrAQkP3SJsEvB/xCBZL0aYKSQdMu2CaUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
	b=PciY4TxNyDUCStwMYTknV/iGAHhGue0Svgw/deE7vvFDwe5p8zs2SnjWbYW92jRy4sQ6
	 O5qaMWTnki49bwSsi99/UmYKLu+L0mHVz+STe0yhHji1tOPgMepmfDnF7Es5dg6QSLp+M
	 J3uTMFUZ2lslVJLjYvWz0OlIjXJGaacJsfusaQFegNZQx6ugk7VMaLIyHleo82dqqdhnl
	 HsOigRQddjxMgp3RUdQ3HvIRx6JYHv4tSs8O6l2HdeE2OqZc1HPLKv1hJXJdHHtc5PHB9
	 peXYgfAE0JYnkhBHQrjRBeSV+Zy3wZqtcYKmOJgreX60RFW3ksphzgT9BZmBMkPEVPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUHTusdd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2C606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUHTusdd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iHAr404126
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=; b=TQt2Um62gtkMeC33
	k22+7dsfMQTEI7Kgd83HTKTwp4H7RqL923gCm8XxzINjxyHejBhRbEmmmaC7Vfum
	PevcXHhi3S+pCtKRgZRshE+q5XdPhT7KIssVXYeJkO8QbghKB5k2RocHTIoXHMWj
	EgSdBXIKJXMGmlitoV+fo7wKULJQ7O/qPd8wDwDnPvBqWfKC9cT4/xkIe+W7X5Eb
	Jeh71G3cnVriK+q1nLXLxwZo4yyqYXNE74OhipIao6TGexJ9/yzKB3Rr9P4vijrr
	+M2hobyAxe5bgWJBnCFyAQtVykzuqmRSrTmCby97G5eDXt4T3/W417ZUqJ9sufJW
	Tz8p4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t8kf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e869e00005so63413825ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089946; x=1793694746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=CUHTusddBqkPRIDyGX/dtAiqf5eICKD5rtrey2erKUyemQu3l/2Ni46YspHQzh0cHM
         DWh5TutRBHLSOIPyjtKCChr2LW0mp53B4L4s3jusOoQMHwfkwflCdk0l7K8ILJgJfryq
         MyVgzKydLB7Mal+7UnIkfvkQO4cYliOpjHglHx3QDUqpdkPkGfr8Z5rHXCEGc5vYWne6
         arhL7z8dNvhoH7ZwokL3mi+i68WHtbTav+wnHNf0hsoVpBF0AdreXqWhml0HBakrOi1F
         cjrm3AaoV7eXghsNy0GiZFNlSXVbBJRds7df6yqB2vqdPA+IYt7d8W+adrdBgMo/6bKY
         G//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089946; x=1793694746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=cWTWm3vvXKK1aAvStmTz5KVH0F46lxh28MJcSp04QuNGxZ7Zq6BRL2Zc/JTol6nfl1
         cs7UYelgPfpyl7jDhwwl9xoktdYnMBe4yBkZB8W7ZY7k+33HV6aWhTghESCXZEE0b3qo
         EeRjnbYfHt1tDQH76Vb5RRYdO3nE9rDHudGjWwyqtNpydjvfglvTjlL1GCDFsB/6buNH
         Nh1nu0GjKJ7LcmhZlhviD4o7EJdJR0UWtLPh34VU3owhhh4nkd8/LhVQdV4TaOV7zHoa
         uMdM5fLuMEZG0zpvPsHgXHAF10Q7qghYSAHNjlMMYFn5RDGBPL52AHp3MAUfbqZqfIj2
         RPOg==
X-Forwarded-Encrypted: i=1; AKwUvBxS2LnbZdB+nzCp33WSO2Y7m8NStylWuPUoIRhyWwwJUySUgIYBJv2bw4xunDSVN/3UnkLlTZsW3FIEJQZ0@vger.kernel.org
X-Gm-Message-State: AFq9FYK9BjKVmGpNNc3l4nGEYKbxn9KNkqrbSvnYoOIX8m43KJjWTrRK
	CCArr56SS0dtrWt4RhVZO8wOVD9FdW+sYI/piBM/2y5rGOLDw7tqw7WThKhADgl9joiEYzwz0sX
	d4mVfPUi4UgviFzS24sRF34UouCM9SDCzOpsYUcdUX9xNN2hH9NKDrEQnjCGlYfrPwXEb
X-Gm-Gg: AYBFou1Kas1yffVbOQfJL+9HnQLS/lJ59FcK8C/CS9lbpWoY+0mewsgZ/LGZsxb+cd0
	7GI3q8k9p+5r/cwjCW5L5iXU/psDCKxmJ1B+xrkM2PLHXWevfs1Z+I9ILTMJATOkc4PRyeut3Uj
	p/A7TSLGqViZ71xZsvGKMI8GbbdPWuv5bCHpLp2lC20hVMh1kpRETEFk/iz3/hts5dw6ZWRC5iM
	aXIib+u914+liN8xigbZh9T0ajFQ0KklFxB1s4tHet38s5oPWqazQfaPbI4h61rdcQkDT3PcESu
	ashnrFQ7NcmJt0+nkoiVjp3ZsPkwX6zHbNJG+7M25z9PsCVrdJzQjFgRQ3yoWSAsG5eI4cXItNP
	zwqXKkYWnvvf7nJUVU7WvQ1003OOu56SZFg==
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69648105ad.34.1793089945555;
        Tue, 27 Oct 2026 01:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69647855ad.34.1793089944998;
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce0f45sm5545525ad.70.2026.10.27.01.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Message-ID: <37a69bec-db13-4acf-82c9-854fdc441ece@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:02:18 +0530
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
Subject: Re: [PATCH v1 3/5] ASoC: qcom: q6apm-dai: Add 32-bit sample format
 support
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0619a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uxQCGOQySBFxhreOsTYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Lt-Sdsyu_PHD4g2bz9I2LGEojq5dL1AB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX+de5UkY5QEmD
 cy/Su39iIN8XEWcGIjbW+X7oDG8TLmHK4NdlXCcOR55gnQr21Gq7czHL2VGqeT7lgH1SUSc7/rx
 jFqvX97o5tPSuFsIVu0dYTybUKgFpy8=
X-Proofpoint-ORIG-GUID: Lt-Sdsyu_PHD4g2bz9I2LGEojq5dL1AB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX9EzGPpp4VOz0
 +tYLo7mmIBkL/RjmIAhl8TxH7wFi9WVruCBhhRFoR4n6QBeVIdDncLHI4FAAhLbxBtbT7oplBAc
 CZfv9eNx82Uwur8J745VPTof1g7jjMntMPZYytf30caE+NaedjIZNkal63iF8m7qtS0INNMSUKL
 vWHV9mWJY1ERjfGk/n6BHXP+otLHs+tvWkpDJZZf7hjZbpBDHkgFH4/GWWrA2mbCMJhr2elZsEr
 bdfPg3w038oofQA05KIF6UcavNmMdHkURaaAsQHDR67mP4R3KeiXQEUGnPwsDXf4bsUP6L/O9uu
 OJjLUwik+5rcgfAgOVAQ9zxE47W14VAABpNjaUnnNq1mT62P8h3U+Vqw8fVZ703vEmVDMgTv+NK
 +Up+n/hgax0c6K3NZugoP1yYRjKarvScYPhYnTeLEFA7mebC3uJylcPe/rWDJQG33AmLbyihBi4
 l4YrzSRAQQyXcCTUd2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033


On 10/22/2026 3:13 PM, Karthik S wrote:
> Add SNDRV_PCM_FMTBIT_S32_LE to the supported formats for both capture
> and playback hardware descriptors, and handle SNDRV_PCM_FORMAT_S32_LE
> in q6apm_dai_hw_params() to set bits_per_sample to 32.
>
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

