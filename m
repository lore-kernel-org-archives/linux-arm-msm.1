Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7573BB685
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321340; cv=none; b=J4bpm0XRxbCvkMLikSPhfpx38Bu4ezFCs54pXcA1yrBk/Tmq9FgRgDpq+21vgsI9xkc8oEfSoAbTMg0zR7bCZQl1RR+Q5RB3EeD+rxLBY5+SKWAuzM9uD8YfMGolivsraNf1xbL94kFkWLI0oqDtL/3z6IyZ/JqrzGoTU6MbNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321340; c=relaxed/simple;
	bh=pTYuj9moyXzzpSINZ70xa/CF5ZqCFNI/ZXLVHgGhOiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArW1lon7kNiSsLb02dKZfEQQYp1uvK8o8CKT1SeeOCmWM6iVC7n1lHdvnNTj3/ps2tLqf8WRgGPxtNeDRSFalx5f2bur/QmmLRiXhUIJ9pGelztOtOfmsc56f+J6w1ElkrAUZ9/byyHK85MS/5NNQOQp+RWWNbT0xACLJx0KCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AITGo/Mx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVndHyb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AITGo/Mx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVndHyb1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YdTC2911789
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY8IAKnNoIPBGGJOQU5upRmEF2O3hse7iKsbhMOZ9YQ=; b=AITGo/MxnV8KQLAn
	uAe0Pv5bdom0u2Sdn2dCop00QnvJf7w2f/fWaskTkZ4rCSN4AIbHfJrrn39sS3y6
	szS44tACyr3D4gycOwJv6KP8QQROWScEwVAiCHt3DTNYUyh9O7TF2N1vtiuD0MJD
	iU1xeg0xS/iioB9vEdMtvHb1Q5zzmdwxTEXmknA5qVxsqcYo3M3LcjGuTpnE4vDC
	KqrvIH72cJTTIpSu6cgcTYHGLA0tUxcbI3kbAcdPZopndJq9hNAObpcjhQXqovFk
	O1+10SCC6fal6nrqVEPOZi8uL8MxJcwsxj4a6S1eFft79gdtMFSeMnxVKTArYKuw
	U2NYsQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm50jr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:28:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106d577ac5so1231626d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790321337; x=1790926137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CY8IAKnNoIPBGGJOQU5upRmEF2O3hse7iKsbhMOZ9YQ=;
        b=dVndHyb1DY+00062LotQ56MlrWLBTGyY6S4i+R445G1T800ObbPoQL1owC2At9Xvs1
         ZXy9mdf9A8gLZ/E3nOKA4ThRIuMJ9FcOgxf0O7/CBg6edW+WuwOi+sLhs9wOjic7WWOW
         g1tpUt10uz0XCq3E4FeKeBuqh7RjG0uACQ0qQCbh703ZVa63KkZd7BG5vmjB3dumJt2U
         jVgmUpI3PfyTa3fi3+U9bGJawF83bLrAbY4IPcW/bou+MHiABXugtU+UkAW5wo6MUUG9
         crNyb0qSuW2vjmr+Vb5W2fbbpBdgHwn219XJJauMOpfA3bkaZ/7n+/CriQC3Csgqq63N
         s85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321337; x=1790926137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CY8IAKnNoIPBGGJOQU5upRmEF2O3hse7iKsbhMOZ9YQ=;
        b=ZXarAwOaYfwM5XZamL5+lKOulbo3d69oKKA2aLJu5DZrCJtzSls1ofTvCWGb2EqKjc
         W+ztDAbLmXYX3rJgTiXouo1q1lHGolbfB4jlXyln+8/KiG0q/Dq3hX8Z2Biwvv9Ubaj1
         QX7bEHi+Si2gB6ddYCz53gJuzplsu3Qnc4O9sDblVJoZsEMVf7GhZEP6qsDILIejI5QI
         Ju1BF6/kGM0Y2Ok2BG8vwFUUkuuJyeA4OSGJG2/EyuBBSLd4D2glW+tEBZgY8Ov82YKt
         4UOohP4IqoLhYMqIXzFXlyPrJ+VyATv/dRsDjj/smzq/4VZ5PUW8vQWn4eKZOp2FeFYI
         bEVA==
X-Gm-Message-State: AFuF++kaWdo/YLxb7ik9fiV7ZLnPvS2gBgZFSKf65yMc5VUQ9z6fltcm
	9vHyqQCGAXYcu4Su9Appfd5/tKg7MxfweTmJOJibZnK97UXSzimS+yczqYSx/y4Vx67DxFSM1Rq
	vDWx3tkoMfgyLLnQUTBdSb2YCDDBD+IgAoV7WY2qY59I4sFJHrqINDwhvmxL9GxmnBS7g
X-Gm-Gg: AYBFou0Ic4hXk5S/2rwogem30llOCcvGkknS4UaEHYful0y/7KAum3inQ69eTQewEJu
	GwAyz4O2Wevp55eU6HPCnEsetvFGe7tTRNGK98lmUmHPPHSJOeM1RF49svWcDC6a2xl161p4Drq
	BhGyQRWUvIr5F93PsuvD7bHvZx0d0gNmNCpBk5ch2YTuBfuk5llY5slqcTDxeFCPi1shiyGv6F3
	YPP+glljqhuFoSNkXb/aNyb6V6cRM3NrRDjS00dWPMkD0hxnCRo3gcg1Dj0+dPekTKfcAPVUDSe
	kNJ6x+S2ebl1BiWWNUl3lV0Q6ead1uAo/IlAKZB7bw6wcU2Mm3qBY4tR6NSF5IK/p+qnkeMMYtb
	MTM6ul6UCSkYMOgqkQWWp8g==
X-Received: by 2002:a05:6214:5199:b0:912:6000:e8da with SMTP id 6a1803df08f44-9142f6ac41fmr27106276d6.2.1790321337401;
        Fri, 25 Sep 2026 00:28:57 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:912:6000:e8da with SMTP id 6a1803df08f44-9142f6ac41fmr27106096d6.2.1790321336946;
        Fri, 25 Sep 2026 00:28:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7353f0asm72709866b.15.2026.09.25.00.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:28:56 -0700 (PDT)
Message-ID: <63498c28-1b1e-4cbd-afe0-9651f928a5fc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:28:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add chassis-type
 property
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FOWdp2OzJTSxC2pr4oeFCcvn08EDBgaX
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab622ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=96plJQVwC7y4dvEGRvsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyOSBTYWx0ZWRfX2vAjSgI5zhk/
 lklKzjvOE1bPHerqpTb0Za8+uYaA44BlqVHV2S+80F/2ebmis3DRMq7+SpwAJ32tUHUiGg4IX39
 nS/MHCls1GOHeovkGT7o1enWHvphOZrIDuSoaeLkN1XVXwNX6lxFbJ7A+MMifnU14ILNxneXAI3
 feYpm4zWDm0uaJXUeKYOjkQ8QBoZ1U1nzgImSNlGo77+aN4AGzdq3gXq5BAgJBCxAQgjI3DXFlP
 x+wFTQfLhHUjIsMkY3NIb9MZHR/iAzwDXgVVc7HDNCZLNTwl+7Wm9wgtKbuiS1yNXbu+QvNltRW
 dfO7QIMeF9j6tPLvfEPSD+IBM+TAaa7EcIwrebJwsdyCdRoJghMPvITPydSPastgAww7DbrdJm3
 +KXK691t4DiTcxnqCUxjjIKa8MMO8WRbbHvArAN0iBC3gdLK4x63Wee9t3fgfNsALP7oSarPcpr
 ea46DFbDwmBzoR7Vhsw==
X-Proofpoint-ORIG-GUID: FOWdp2OzJTSxC2pr4oeFCcvn08EDBgaX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyOSBTYWx0ZWRfX6Opm/CFqjlbX
 p6wlZvk4wq/hEE4fQifLQ8X6BkNLCPXpbVMUD7uHQTrYReuKqIL6BAkukmYdNp1sI+VGbNHkPXo
 HDx2IYFjz+7R4zcO51dt+Roha0f6Jpo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250029

On 9/24/26 5:54 PM, Neil Armstrong wrote:
> Set the chassis-type property to "headset" following acceptance in
> the Device Tree specification [1] and dt-schema meta-schema [2].
> 
> [1] https://github.com/devicetree-org/devicetree-specification/pull/87
> [2] https://github.com/devicetree-org/dt-schema/pull/211
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
