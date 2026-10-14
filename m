Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97B4EBAEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970811; cv=none; b=C0hVz/dMuEhS9rBe71w2102QxtldUcOO5L9ZlB9xA6uXlAMlem/0mL6YnWec6KtTvU9RAnJ3F7zM7rG+nViDk+Pyai/BBXb5Ev382OBvX6FXi9kwbaDzmJ4jlHhxG1VnYWX8RmaBwc6cLtS73h4Fh7xYI+A0aa8PNbVMBuHKrVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970811; c=relaxed/simple;
	bh=51EDfJ3McB0CSbNJV9tRvd0LTlnNYRq8kN39WqIaSCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJbIzZ1RMg23MXUESOXPRCLdahoVCSSvlGaUdRjm+RnFaZkIKufaWsM53zoz/8qgACQnVpvia2tGSexMCWQCt5I7ExuEUuJ4wPI/GqwHiX8Iat6e2c7LQUfuOgTleHv+Iuwfvq/v2T603TIhrxI7hQcANoASo6gLm63SnFSv+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKlubNWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKLmW39m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKlubNWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKLmW39m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E96xWq3000871
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=; b=RKlubNWP560b5l04
	iznFlYW+WkYYdzxbkeYKdsCa1Rhz/DBh0sFxsW3W5XnRbidW3S5kEk3eHVKDHO7c
	ch/DJQNh7hqy1zgifyssTBjLKp2uCuMgUPk3kf5mJFdMGKs4XezSlSsy6nyylY0M
	rhOlAGqJuYW+bqkfMS6ddhvLY0AytY99XoFwDq0UvtK2yBmhNcrGtTScktYeFb+P
	U2OtDj5wb3OXFnRWHQDeaivQDYKUtgapAR7wDIKkbUMkg1koH3CKDNgYtaY7Qege
	IoMBGd44p0OePhIhwxMI5AAO5sfhBKauOkddknaiR4kAnRKkbRaCCQgRbJqCItQZ
	0vYkQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeu9w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:40:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917ad3b42eeso9798186d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970809; x=1792575609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=;
        b=DKLmW39mgLp4bwERFmhQs5ZjsQRCNnrJiq/fTEmipbd0ZNZC79jLZZY787KemcROGA
         vhqPgyDRv82bcyCp4O9Cfn2Y3K/fQftX73jTXL+ZiUPAtlypIkh6IXYubNL/0MawCrgt
         mJP9/t9r4iUHgINNVeIE8katx9N0mKsCbCHegZ6AO6Oe97p3fokFJwXs2r9QSDQR5Yu7
         TeaVel0scrDZcd5cC/Mm4TMHac2KafV/2hDBo+9lVhvENeWHdjtxSAU5/Ai+YAiOVaA3
         +GI9f9D89m/ozFO9QngigMARyJ3kClMjRsuU4R8x0eNLEAqZ9uHACGvug96a6O23lTnV
         xojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970809; x=1792575609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=;
        b=ayqp2zdN0hvr0pg32jbzi3PD/e+pmGajtRPXq8Q2RaQYG6e/+CJ+6dTS8VrExHgr6K
         SPhYi844ssS6Y4RjkP8lbNf8JoexNvGFfxVkUJ4ZxaiZO9ZS4l9opdDh/nSZP9baItWw
         ku3lDRqmzJHiCiafwRXRG5jnZfaT0SZRzN/MNEhtFqVAtak97D69Rag09JrcDjf7tiLj
         z3S4AsBlCoGBu0kpiAvyV0m+9+XypqdCTZRnbuh5u67GYCa8jupBt1BjcHVBKNvy54aH
         adeHngL5eXbcluGJfc7RiQaA28Doze9rEpmbKuTAi6Ng/uFDEKttQC6YZTtO7tZ80kaT
         igKQ==
X-Gm-Message-State: AFq9FYIwhwjUAegU0aCnwqjOHZy9uI1yYtJ32O23b93ykJsKAvJ26MoP
	kdVQhwfoqr+qpYvq1QUCVShxSrJyQ7WWnTElxNWdfKlmvd71Rc3cJRFh+k6dSaxw8ReNHsIDLrN
	yKTsQcW9YNetrotUW8LnU82h17vf44Pa2YUhru5B3VWYJNIUSkmHVJGUTar44XrUFTnsF
X-Gm-Gg: AYBFou3ICo96ieUrHZuadzPOpa5Y960Mb+Hb8hJGP9To3pyYtzNtP8F9EETOsMBu3j0
	udPQFzNkjblh8lHpIzZ7A2srB8zYZ9jRbN49qaJOVgPNgBFIDguLC+M+3xptaoYAxjXOuwaGRcr
	pov+7xfaOwfi9vq7S+yzKiyFJWtiUWeH3emxKbBBIq8DbF1K/BIrjGk0Ia2X4/AJNTvH+k5Qcta
	dnfFS5nugwOnGrPAMqGqOh/xidwZnx/31qGYRF2S+4dqbc1i6eb0Ahnh6//hcUyOMqh2Z7IM19p
	9je2EjBDcYqE5BdYpvGzWtLPhMc5bvvWxD9WbdmydvNuOxO6CsuNkuwHQEqSbYraQSglsI7oVHc
	llcZwXYe6xafckP4eeb6JjQ==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3020854785a.5.1791970808804;
        Wed, 14 Oct 2026 02:40:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3020850085a.5.1791970808095;
        Wed, 14 Oct 2026 02:40:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a68c08sm682278366b.31.2026.10.14.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:40:07 -0700 (PDT)
Message-ID: <6df78358-92f2-495b-bbd7-3557602dc677@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: km6xLM2WxoQ1IyvPzIWMEbg3GfvkzYNf
X-Proofpoint-GUID: km6xLM2WxoQ1IyvPzIWMEbg3GfvkzYNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX5BeOIHS3u/KR
 M107uWEKP3YYGxfuCCGpIraRWxg1Jt40B6yMhEXfn+REDyofEP8Kq1ChBSfsDsoOBQSoUL1IyVY
 CWs7E2TKNth5QQ+xdS6ZqsGnafxaBwKhe/S7LeEG6KRcz1KHtZGo3yUaPIQFOgMDlSO8cTx4s0j
 4zklcRZmL+FxfuPqrkLzp0n9vnFLyk1KBf/CZgKBpjj5MdWlVYZBtJ8KPDx/hw2JCAvArdSnJWL
 9AVGu1w6GV0vRciH9CZP9iraFc7fui/AuuOdYzs2JSM2k/2Y4ys1Vtf8S36S4uPR74h1QXoQaud
 611Qjkfqum9KNCwqCcprRLc7Z6Zb+v0iki96YzSQgW2MGaM1KqwmkHDgt2MROcHFcqbiEU/c09H
 oHnmGKN/nxONuko9Rc8USc3ik4PqlRXbBJE7GJOZ1dz6GkOiO1mCZEIxPEt/ztLEEB5jSBo4x3A
 dGRHHDGS5wZkPofScPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfXztqlUK6XzkAm
 K2Er7TQzSvZ3uggDXF+gGP9YV5i1974USZD9nnLdYnPl9RKSjnBXjgjazJSAisYb5Q91CjKScJG
 oNBFMouPTQa9+REFqGQlOIpufdkPpZY=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf4df9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=v9uaEyY1ARKJclbH3V8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140038

On 10/14/26 11:27 AM, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register context fault
> handlers on the wrong IRQs, leaving translation faults unhandled and
> potentially stalling the GPU and preventing recovery.
> 
> Replace the context interrupt list with SPIs 680 through 688 and 703 in
> context bank order to describe all ten hardware context interrupts.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
