Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784391;
	b=oLU1IkihyV7Q7UWLop9YE6K3latT8SPtfYyIPXOw9o5lN1cNCjEqAUk5ZfiJCruxi02y
	 OB7L63N7LyQtv5iWy5veiceUjdpWW9zfB1bnHCaCMOAbQEiyWsTlMGDSjz+TGKLOjGwP4
	 xJHhElumi4HK8+u9L3ixgKZb0TZiMc0bKsY4+kVqdEcPxEAnhrfeltng+AOeLh9yfEfYI
	 1geiLieqjy/vuK8KWTcVzBPn+ji1JDu9tectjqam7vx/D4vkiv/g0cbSFDcVFxlibZS8g
	 UkFnzld7Z2yt3EwlejCRfZajF1t0PkMylIq1Dy4/sEWKXCA/Wa2MEOpeN9L4dSQ4pxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
	b=kNrYdBPXA/6pPUKHVrwVV/A4Clgctv6MC9ueE/Q8suCA6c5GF+VFg12y98BZ29IXp8pl
	 ixFx4W1n06KlakFdmPMCP5ysUD/X+kBaEt2mJJCWB33mVBZXWbxi61OnAt56sbek12dF6
	 valb+lVyOoVOT/GrgOeT9djZzV2pYVDXl0E5z56I4GuQbsigH6hlPEVS4ti9ZY6Ac+9og
	 PUZfDmEntdHPkzn2HqJWhKIgwwNIQ5H064n+xGHn+PS8RdSnRKVWLAVZ24W2Kjc1OXssN
	 Sa1kgLq7VzRGJQudzrAH1X9IJPSr8E5pGbzYxSaB/whKTYt4hSCnT7ZsrnbTeA0+4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K37b8/KY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYHHRRhw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA219606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA219606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K37b8/KY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYHHRRhw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh9vw3150509
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=; b=K37b8/KYM3/9P0lE
	T7rJfRvafX5SWfow3CeunNBrcy5sKIQ7Ch3b3UkT05+EftZblwKlisndkhJkuFsl
	6cvfLRmlN88CKklEaqcf1noPuqHB6JgclSK6dvs78vUj4oXC0J55siAzRfliSEkp
	U7KUk1ZzsrtJQFwXRMlSk4JUATfSyEro8FHL0vomdX78eGP0jnyWvRAlXh2QxLGN
	ItGb62cQDeBppz6FsqpA81OD8PIQq3ZYT724ebg/OFp4Dyj2iBdLAoo4g06MjUii
	OatYS9ZgineytS2cMOBp88g7GAlqDNCsmZE2XwHgdIApwryqnk47z9HIpk31TCFL
	d5sP3Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93kc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:59:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so422901e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795784389; x=1796389189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
        b=IYHHRRhwnFfzZw+pCqpvgYYdNC/+Fa1cz2yZnRU9O1I8o57h4IV9a4N8PJXmLKQWx3
         iNbUaY6CIZ1Fm6bXctXvL2N6fNZOsFnVii7pvaeMVHJQs/JAXQ9ZkcAK5vzfqSrqXxAZ
         JmN4QehEhP2bjktQaJMF1dlpbTM9t0Xl7yryNpA7S245YQrC0WK71s9UHuWVdPRwAzuC
         iFTillYDv7XjSmobigSZG3R/p42CBRmPSgZzWXNYUiy7uTMo/dEsfWd6cDgasRFBXvvJ
         RACBly79CamAJW63pJ9uUlaoERRfqCTyjKHq2pzM6P3a1kdWkCX9CBAjoXq8uOrcRaRG
         nF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784389; x=1796389189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
        b=Tos0FT7Usy6sKCmte+Mf7vB4//IHcwoDK8nudgUj9JhPqbDlK8hZEnh61r+76znt6C
         Zg50I7cJqoiZniegxPJAgDgcP6gmsgnJTIe5jClyPiwdeQQeg5ObpdHCxqgy/DMsKDWj
         V+ghpUnMH4+1/+yTHFbpKJ05hWgKJ1h6ooJGQxOQKtY8uurYbnCimmkXHVHEEsqyH8lK
         Sz0rSwMfaVBhZv8jkbimnZ55e/hTrKfz6vLinRhquSdw/0cZWSBxEFeO8W6Tz/9sIhQK
         AFwepmbVY9+Byu9dYYUnpcpMy0mtD31Ktexrws2ckhyK/ErCuWj0Fo/3Zavwj+z+U83x
         2jVQ==
X-Gm-Message-State: APuU4Z+CqIXeX/fVZo2ujUNj/zaMCGLIw3L6LM7rWbMaE4mj7Wm8he0F
	j3bXwVHesltBf2D6yXbwISKrUbyh5cc7A5la99yeySQOBfZwHWz9SMNsn6ndKjlyzLrt7NeiRe2
	F23zWfuTbYRYLy89UNj+rAfsgFZhzawrltuQKabqiD4bLSZaMWgzW2Z8yPYnq/7y145k7
X-Gm-Gg: AZFdTZfzAx9pLsxkSSFktFAR8r7SHFB9E4wgWaYH/URWYlA0ZsMBD246fS+ZUZhj/zE
	oX4bkONYBwuNcq/mXSh6eyHDLylpJp4DSvAFlgbFC5iOSds+fraqQjiCNfMADEMRcEhfnVO8I3f
	qJym7kWDtvPYzLx9jlyDAYf7YM8wsSMQMSJiMVF+Pvlm2xt0mFTWHQJYscFdMmOVOzUYwGWs9Vo
	E2bCyX31pPmu21vQET6Anab1UoUMiaek4js+XsglcicAypZANtRZ/Az8QN5Xeg5+rHXaY8wuJei
	U/9xVJXJ9xYhpSsr53KF8Bu4okmzOYPd2yzjMAhdxGBSqXDBslHjvXZzULAW2T1fepi9FeEdgws
	Hz5/mwcBTQ989eRv1oureGpEgz4tDDQvBwT0qnqZ5mmdKzU2l/KoThRZXP2/PCrJBMbrog9M=
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr17023541e0c.3.1795784388915;
        Fri, 27 Nov 2026 04:59:48 -0800 (PST)
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr17023510e0c.3.1795784388390;
        Fri, 27 Nov 2026 04:59:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm859734566b.35.2026.11.27.04.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:59:47 -0800 (PST)
Message-ID: <7c1d9d6e-91f1-465d-832b-d521caaca734@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:59:45 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix GPU peak bandwidth votes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 83p_ncT6Uq-m4lfnQkeZywQxIVeIKnfU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX2/M+/9l6Yenj
 CL9/Ehq345HD3O7QZ8H1Ilz8yFHUIHZgGyzOhvozXOjWUYXiFKLeF4kw3pZ61K9Bc1JHSqF4dl9
 qGfvOyYeKX42TVcfcG/iVYhlcQbIJgdQDVMAUWn4UredWn6FYf/ZE5gNZWz28w0jKMy427kFUhb
 WCqBK+jYOmxUPXm1O4Z19kzvcAfOP4sjnKq+cQfOiZZYNsJLkF7b08xjRrLCdqxy4fYoff13WXU
 QaCGCgYo6J/XD5Wq58hUw0ncdZuA+ElsSsqfTYvb/1n7oFydpL4vSGlk90hnCPlGmP2mTJOxtnI
 VS1DjWGfbOrFo2HJbm8EIfeustf98GTqBt7rqPVcAJqnCGhuBLjS6aY97f8BESmPbUOvkkbz9lz
 S9pRxK/+xPa3WkECU4OWrBuFwdWOV5cbeMYjoaPZAGItAl3J7aCs9M6aROpFeSqMO2SocNJOJzH
 06iI1F66aIkjeqek4yQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b097ec5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=67GPwzqqGCJse-r6Am8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX7FJvWSe3TsJO
 cebH1fAB5L85tIx35ScsJ2NvEAhownseEA6HUfoo6moup8uqsYAAFAxujd3Orf2uwyXCKzmeuud
 iEPWSojfOQChQFr7dCg/y3XYUnkIwjw=
X-Proofpoint-GUID: 83p_ncT6Uq-m4lfnQkeZywQxIVeIKnfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270051

On 11/16/26 3:43 PM, Xilin Wu wrote:
> The GPU OPP peak bandwidths omit the four-byte DDR interface width.
> As a result, the interconnect receives a quarter of the intended peak
> bandwidth, which can limit performance under memory-intensive loads.
> 
> Include the interface width when converting the existing DDR frequency
> levels to decimal kB/s.
> 
> With this change, clpeak --opencl --bandwidth reports an increase in
> bandwidth from 23.3 GB/s to 60.5 GB/s.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
