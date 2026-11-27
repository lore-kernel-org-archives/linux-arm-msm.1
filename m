Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779165;
	b=F8rpn/ZwjHohdZrAiRmhcDLkUqWRhgba2JRfaW5iGsm7zWSvP6nVbr34q82GCyvynoxo
	 9ndQJ5U6cGoYwkwTDzAI/Iyu5I4eNj17MEUNqmXYTr9T2MMt9SZXGhYn2WfKnP9nYf1Nl
	 3TptDVKLntMwwRGq6Qn3yNKMDFk40r1e4t4HztnPASw4UeCvzgQMSIWuUdPvme+q6ZJZA
	 jUGe8MedN2BJmZjHcGdI9QejzDgXEZoWyzrm06X0p5oggoyHEfh5zPLtL8X7AAPjx1hwM
	 KBws3qNYBnjxR71hYeVD7Gyh9iQwEeOW7Pmqi+MGBHk0bOQm7Yf8JO6ywSqWn/OAJ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
	b=c7Ylx3gqy3XjpnHFDIlDIFlr/tb+8A6ZI4Mah/7r5mtx5fwsRySOo477yUBxPi7JAq9i
	 RASMEmQQW1vsiCH/0UJOibEtxJt0mkuTsRvsej6c/ZMfKRe8707zcMwQHz2/QlGwUbnJg
	 +HNMjYw9wISdGswkbNXti0QbJYQUPeWV1lAtZhz1WUwox3rxUmMCazZ2tYVFnyfv6CCy3
	 ZAzwx3GdK4McJMm4apLk/W2J0jlfYPBwEKJK7YQ/ngUCR83RfPCxS3f+nAn3peRvPrRGC
	 MX1XJ4SxTAnSeobh4iFVs7xdgrSnQCYj4//THw890L98t2XlxHJif6oDPm9Y/BF6wpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365A606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F365A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYuw1685705
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=; b=dxIfQMlm2Yh8EP9/
	VQScG+IoCxTduN6xSeNmkE8g3kg7nHoxkCiPT+9hVCVux5oJ/Oa0rZVbIDOZeCt4
	BP4LU/wHTnxji77Qx3X2723GjOIJAKvLWGGg3Qq/U4G6yNFciK7D6uciyISptdF2
	hRfxBJizb9qAuUp2WP8FvOrg7ZeeJAXjQpe6q7E+rmg4h2Jz1rCN+v7XusoS+P7b
	YZX98M/wscRHSinV1vUFTfcbx1fwfQvw1T7O1EfNc0R1to89+r1/CEwQPc3STK8T
	ll4D0zdiLXfXOiREJiZnlDJ7poiV7Urq6jyo5sKgEmRS1vv+6dqKwiw5qIgOq5yS
	H2xDiw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k91eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso366205e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779163; x=1796383963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=K1S7Dw0WiX/sqsAUf29x65I1lbFYJ5zTMQP3R73ZVp9KdTt7+ycdnNJv2/VZNl66PZ
         65psBtSkjQt4D37plip1pQOGCbkzbcKiGAQWGfCkl+bNhSpVWqJwk2JvCraCNYAyfdmX
         NHE1kWMrt3BApxEp3WmOlbEsLYK18OtFtxkOYSu6wy0ZE2eRDvRc/v4JLJF0HU3Su4nf
         7lutw2ZcU0DLL70YpBCDwk272L4WtdjblYBkVQoPdxpT0IjHkx2FztF4p5jMtM6OSW+N
         QldjJe/RgWlizQG59/RT8K1CT1CR6RceDvjZ/e7ibrNyTe4u+iIWyzUkwSv6vnSfhQtG
         1a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779163; x=1796383963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=AETsqQvXLeXRyvkq+hCr/rG6tc8qWkgNWkjp3M8wRdV3MmwJ4sfGmOvUC5CsGbDhiE
         coyLi2EQq01wYB8ZvquA4YSK6+anA4U43LRpYIM1tXjAoZbuUtLce1nTU5dqMqv680TB
         N3sTRyzh4SbgvN9bLUayxpkL7jWENH4zJOlWTz6PbjxIvgQlMt1nhzAq0iP//f66kotZ
         sw+UtyeOiU/F+5J1NjtvEhxKNQ0iMNjaXiZgkRgWz1B76Io1JPVWdK4B2EUtA072OUGD
         Dl/bQlwEB3+q/6njF82MDCC6sHelKFCooSxBxWhBF3QqLupwLf1lEXkTwAl5uZl4mK37
         RUVw==
X-Gm-Message-State: APuU4Z/PiCAwiorC6suz1XT0UVvOqx0q7H+o5jHoWZuVgIpqwyHwctME
	LbqresJyoZxIx2O/IUIyZItaoUsFQifdDEpOin+R4hgqqF1oiOy2+kytfF4azP+SsHujp5HOwwn
	wHh4e+jtvmQ0xPRH0BO0PsMAStcUcYlLSnE3apokC4AwkSy6etzHzF4FeEoaJ6ADSaIFX
X-Gm-Gg: AZFdTZezIa/OtBZONyDQtShH7hXAtqbkaXaI4YGKHP7JKJFCSveJwVS/Aqt22e/KXEo
	JN1gYyz1ea4cn75uUV3rdpfPdWJhZdsIVR8+L/r5WjpqmIqPGg1cOce9gz4kZYLcJ6RxdLvnYaU
	Seqgy5HFzU8y3fGBfs6MPlfryO0ZYu1KHle+DoU5u8qvNAGSc/5S3IgHqi7bKxack//+FwQsY9S
	7GiexNS9zU+np8ZVtY/MjX69446eyvhcm66nOUcPu1uvHyXeE4hGLrk6Iyk0qiTkMybeS2c6fh8
	MPp+j4mqdYwS0fP8AIw+5yD8uvOZkEIIVvGnae5L65BxhCDF+LMW2F38CeEA9yeTCboSOHpd4oV
	nXcqe5KQUm7WADDJdAZeamBK7iWShyAsqX/AXxtm3GdcysEeKg6XY/CdFW9L6aLaYko7iNVU=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544174e0c.0.1795779162765;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544142e0c.0.1795779162302;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm901356166b.6.2026.11.27.03.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:32:41 -0800 (PST)
Message-ID: <541df6c2-2b98-415d-a57a-2650f03cc495@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:32:39 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Power the ADSP from the SSC
 CX rail
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka1@gmail.com>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
 <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX/El3d+A0QHDP
 LYmXUWg3eGRIeI313kGfVwVnGwjYbeHm0cZw5YR31l2D5MYUC/bJ3UAvEtxsgUlU9rLA8+v41fH
 xYQD4sT4reCTof6i2cq5CJmMZ+HJQehL5cCpSVoBTyZHBRJwCVpuaDl/EzNgdrK7ZrFzjOcPZzT
 gUyX9l5V8W5PjPoqrFu+UU95do5A3vcHW0QqBLvBOYMHuW4rTz1iTCjmQWi+P6YOe0bBy9Yznq2
 b1eYu3dCgNeLBgy90AlgCGQP3mBltuOJ+THSJldYwEfRnveNwhQaJJjeHBmdeBGeQWUzCo8JYM7
 1B8VWg3OJ2nk0G/sIerm10fbz4id4S8BvTMgA3y6MBuoNj+IN/guu5bWj45OYVWoqDP1eBHprXD
 WybXVvRu0SvVKwXRYJP/hzxqyfdlYDPp/WABj+1K126VF09thCgWM57otbtABtEi4T8bHIkeT43
 6fre7ZZzHAmTkKcb+TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX0iJpUiA5ehi0
 ipGs9y1U+Z5j3R3cMTNLE0mKAEESTSkdNDsTNrXtFbk+J0ZPnGjc2VIKNE6CeuRgMVV6jaMA1ro
 ARBynFvnYrNqji16Z7t2DYncanrxaQs=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b096a5b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JrArOcoNHQKtsS5ItqMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: yV5XmyzG6W-3UO0tMGyxRFY7GC8ZqGGc
X-Proofpoint-ORIG-GUID: yV5XmyzG6W-3UO0tMGyxRFY7GC8ZqGGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 3:20 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The ADSP node names RPMPD_VDDCX as its power domain. The rail the ADSP
> needs to boot is the RPM's "rwlc" resource, PM660L LDO9, which is
> RPMPD_SSCCX: with it voted the DSP starts again after a stop, and with
> VDDCX voted it does not.
> 
> Fixes: 7ca2ebc90a46 ("arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
