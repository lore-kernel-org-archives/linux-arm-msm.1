Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD63B7750
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537047; cv=none; b=Lvf8N6ErSIfaz/mVgkf41RUv+bsAfhzzxubCjAV82LAbHWWBDxFjA8o7lxMCZFpF/1BgNil0cRMzbeoClKpCPKVjxdeSkjHia7swaj5I/zYagdA+AY/lBhHDncWuVu/DufeHObiPqn8JA5cL2XGKm4DLD4xyRF2f95/Uv/ASiRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537047; c=relaxed/simple;
	bh=X9c4GzGT8qhRHB9Hodv1J7Q7GA2MHFDjaY9D2UXMQn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwIYD9m07Bv5yOPmpaPZhk4YSCOeHZvbptbf83I4GXPOEjMX1ND2DSxfn92s6RV3z3xuDsZkDER3uH/pVs7Q8x4lekmyz04AaWNUZkK5AttHurVwXEbn7N4IRSQRjWCwZia4JTC54U6Ps2qP+r6FRQB/Pv+ZsyX03cgj0xl4YAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AknK9Qwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a698s6qH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AknK9Qwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a698s6qH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rsei1263361
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPXnHQbZ/zB5wkjjc+qQcK1xn5/hbaCj20uwYbxkeO0=; b=AknK9Qwc0u9l1cA+
	5SHWeYukgusWa4oyebLcXZl5hz+eu0BWWIy/JLB7qsTVAII4IHRbl+GxZ6UBQQnZ
	ZozdXveBw42P6XksShRhA8WhObyXXs78ptlJsC51IKhR28tMg6r5+9ni7TFNFXC1
	DwHJGgdWWwq+9PQOUJhVSasL9gI/CT8m3NP3e4ZIQzwyqJDQrbKgoD61bMKTMmOY
	oIn+4bn2jelDC7c1Clu+RWYjCmt5EoPN/63Nfg5CNmKZVZoIa6uZ8GLhGl0TfLpz
	Gxo04riTju8A9GyvoDpZUzzjbanRYnr+cjl2hEs7qEIWBLT4WOHcj53OEWU8tPpQ
	5xIHhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhn7wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so21456485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537045; x=1785141845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPXnHQbZ/zB5wkjjc+qQcK1xn5/hbaCj20uwYbxkeO0=;
        b=a698s6qHG3bDsvU23Z+5IJ2wsZRNlmm5bS7k2FTnqcAwkdkwD1PJzqM1PWI3mcZZV2
         4RPUFv48sEtO0HAcaJb4w5xq+apEke6R5XsX8DRSZjmRdtwMXFumQ7cpMLnWAeXWm8LW
         HNUPhtXnyPTDMDmlP3Nn6CT/BbLk17b629jSLx8HlBvuiWn1I+3CCN0QXcjxw3zLUIoI
         c7SCZsR1dBRP3sqEW/Z2O3pxIi7p5IZlDqZOT7/NAgqhuVGxSssVX5HdMFRmlZXLNKMp
         kRjHRHSQtlQenRcXG+uSM/uy940GPDfpYBHNszTNkZGmQ/2Y0BvApiWhyrF+6kX1oquT
         Pn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537045; x=1785141845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPXnHQbZ/zB5wkjjc+qQcK1xn5/hbaCj20uwYbxkeO0=;
        b=QE4n5wx1EzAdnjWuSUFwEof0oVVRz6gyAZYArF3KoZkL/5txhTQas6FXqpsRDdBCDY
         KF2ynvwAJR6/Xdn1f8vUHsOA/9cg9EShVhI1yCWaFa0GMIvAoy5K0AR2N89wI6m8HnfX
         va2vluQxUGpSCJ2bShCF9v/ztJvr9V9mi6TnqwlH1wevXHuOX2N4cOWd66SB87hZvNON
         hAQiJRWHqJPdJDJQYipa3BvgUeIVKO19TJlYNZsYCrK6oww9RgyeKZQ83h3avKTg+YoT
         qmciG3SeJpfFtZpSpHpPmMTfqmTf5rhwbSCZbbbM6w7BU9HUhEuhfZqmaWIIWqUuljks
         k84g==
X-Forwarded-Encrypted: i=1; AHgh+Rqg5NzNOuCcYa4BL8or8vgkxLVRxnRR1ySlYfRV1zrPRVDRAh/6q7cMDroPbah6BiAHtGGnWBcqTbQtRpMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wi6etnxmPijZZHkEPxbUSWQy1lERdHTR/s4/CxR0eW5dsjfE
	gc//pcx+sl4wsUUUrGxhTT4aleeNn4Sff8QNJjKkjBoRTmujjFUdcKg/zH4jPNFnl/m7wzqmTOk
	DhuLBUEYvC070oGc6uLUK80aurhIRZTwm3Xa90dcAK9vP3JpookY4JoIkX7NZuvxqveKD
X-Gm-Gg: AfdE7ckhOyUVi68XanwDtPsPXRxzAM9eUGTTKNs6/aAeHdjEhqC2BoZN5VtiRVLlhlb
	k2cMoS+Kv4XSmpFfmQiODvDP/yRvNnMsGxXDPQwPfNxNz+CZD/jNbO9/KfJZcWwViFdTOyxlLkN
	/RARqh182i0y874tLx9DGxTp1gOKrTpi0WvQbzgzooyQFHoHhQ36Iv6gTuvH28iZsS8dlWzNwsQ
	eYCs3G6516zrHU9iSWwtGA3zrSFVomAfBtgugT45oYuaCeje7QVMNBcHFOD0IxvkzhGR3mK0sH1
	4ExwMmZfXxLJDGa7CTB3JbDxS9Fkp/zUKRAH+DmcEZeR1fTuLHhK89iZga0dWEGhVb9ydMcqGLK
	FzS15GHe9gSq/MHB/HdPevAR+
X-Received: by 2002:a05:620a:a01c:b0:92e:5ba4:b841 with SMTP id af79cd13be357-930b435ce40mr906618585a.6.1784537045069;
        Mon, 20 Jul 2026 01:44:05 -0700 (PDT)
X-Received: by 2002:a05:620a:a01c:b0:92e:5ba4:b841 with SMTP id af79cd13be357-930b435ce40mr906617285a.6.1784537044675;
        Mon, 20 Jul 2026 01:44:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm431659866b.14.2026.07.20.01.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:44:03 -0700 (PDT)
Message-ID: <f175d941-9912-42b0-90e7-ce86cbaff82f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group
 pins
To: Taceddin Sancak <ts.solidarity@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5ddfd6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fW5ZgvKe1gcteIz5WIgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Fi4NzpXiQ0FPkhZBx4zNZJtchogIYi_K
X-Proofpoint-ORIG-GUID: Fi4NzpXiQ0FPkhZBx4zNZJtchogIYi_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX6s1kB26Mps0A
 9d/NPDJydzlCqAqKZ9Ok5fEBeyyl6RtvGw311QfAxU+QgrdirD6amNf4EBPAPcEqbvvVbql/OS5
 04tmpJ47J9V3xMw6Fj9V/pAIxwPezfOVMboqi8TT8l2iwkhw6wc43iBKvOrQNfH47dDxcOIPWsH
 mI0UQT5YuDyqUWXttqvkTUWqxxMNTdRKxPxSYaxL1gw6+kOE7d+qwF78ZNSxxs2+9eXws8ayv+O
 lgtXSa1DCJaQz6oKOdrcfoJ7CDeGpSz0OQhngISmxvjQYL6fEiNPWSFbOF8CDK7Aizy2w01Vdb2
 HqnUF0RW7Smf8Zdgx5WSuQaX3NJhper0dbrlE2Y4igjbPEO3aAkfRM6pgJyliai/JfL/u1VbWCo
 bXdjpXkYgk5nsNY7rDqDElaIheAPrtzMbmcuLdnUFgRfNc9So0LiuBgu9tEN8DXnCUaycPaIvPM
 HCrZ1jNl9eSSkawHTAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXw808JM4F53P4
 09inzp4+ShqwEA2z2XY2I5XfavsOH6XgZgCLuAH4Qf6CNSob63H70/MJtfgbtOKA1wPdX31Q/HB
 iw8/fg+kNm0MmsL8+4k4x8ENqXVxo8c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200096

On 7/18/26 2:21 AM, Taceddin Sancak wrote:
> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
> 
> Point both groups at gpio39, matching the pingroup table. This also
> mirrors the primary audio MCLK pair, where the mclk0 and mclk1
> variants live on separate pins (gpio53 and gpio51 respectively).
> 
> Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
