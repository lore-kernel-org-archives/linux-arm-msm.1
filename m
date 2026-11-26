Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705473;
	b=cDqJ61tg8SsTBcHfmG2YrAMc1K8PgO29C2tMq71k8C0VNlViiNodQfl7zgwWW03T0tkq
	 5+l7WrQ9IbL5sNovmIsvTGPZdmwh+1/H+xiLNtxvDrKvEUA2QApjubDBy3P3BEWUJ6zDL
	 qJ/Wy3jOY9TBwsXfTO5AzKNmuF14s6mnT+e9yQt2KW8os1WGHq9pp8uYom1tBzooof2Zw
	 xyKIBofIn23/ufdPbAhPG8IshnmiNQW9d4QirwYdJB9ewMe3q10TrR+0I0ye8kbdJMOoc
	 gPUMv/G7LXmWZz5jgef1GjFTMWh0H9aT2mjQG/Bl+WSgWwkg1AMxSMjovNjFtf2nlbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=;
	b=5Uz3IYQa3UnCHkTQjyVcp6u6vL8JM0MskeE1KV3SZfWnIszT6v3AfKx3K3n+c44rFJ+r
	 46H017u7LUlWA0t2/q0QRgKAzGMWgbCg9YGXY3O9WQUNa4skL6d1nRhC+YTAaEwqGYvln
	 FLhV4rRYQxOmK0K7NpsxG/hDe5wzk6bP4kwnF1lGDImxVSpVOzF0Eb94fgKamKfZpShFm
	 ZVaKnkVH/WqeU1AD5ZAbC8fMmR0LoMlPxtwXoFUa45d97pMBt9JmtSNr5i6IPW2qhhAgc
	 L45slayDVGFSy42sliNzvbumn1rJRokpV/RVn7zpQjXMCvyetljfjg4OblvIva6biPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k8DNikOo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrHYCxXR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DDD606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k8DNikOo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrHYCxXR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUkGp2649276
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=; b=k8DNikOoSI2S3MBz
	fZuUPZfU+u07cuI7NOt3O0TJXN+eaDNhO1DLR7IIGRAajVtdFI3qsEu1vIDqXPYb
	dbsoauqdtbvh9fjbHXl8TDM9X8/csRFc6S7ra7eHYmSZcRIINOpLEGTiDd1orGbz
	dIbRk9xO7w+ed1ExPh6mrZyc22/3wNaSTSqNMqtX7+yQjzx7c5MsNQ0Fd0bJlc8l
	7l4lHhiytjpNIi23qILZxqCyYXL8I5G4CjHzCwUGORPtf9S7QCh/nQ9cEjlbGyB6
	BYf2cIfCOkszQ/FT6lHQCnne7/i/5a9ucZft/6zxUMt4BUnbX+EwOnFX2utqGljj
	VLrQgA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqg4cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:04:32 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c0f89cc767so626720b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795705472; x=1796310272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=;
        b=VrHYCxXRC+MX3DmeVHIXg6rg7GxkXBxzjo2X2IaJTLsWNt3DRKkRHtjWDTFXiQN1bJ
         iNyXtuyAV0sYqiM2coIAkTezJmSe1Wdx+KMiIVF+U6mo/t+AElT08NZYy3PwEMFlnJ5Z
         fW0F0U7xpvVkKbI+6N647iM2SmUx7KoYQbcW0iloed3jctuqRSt9xnhDr8NLi4l1GPCF
         PD0lENazUS1uLinSfIYzxVTZASDl3f/q+J1c3aR2aBygRGDDG11w9Q4CngrOkJwip9IT
         n4L/MwOEnLfl4+rgUGCRXnlGGF0xd4CCnwq/KBt+eAeSa2kwEae2jU4msJUOJ/sd3qdd
         r/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705472; x=1796310272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ay28i+UPkgdXHWpGHXowhq8PHfWQZrfJNRqr4alQBjM=;
        b=axMUt7gSmiCp0lASIiQ0f9I2qEwIK3TjiuJAoJDVAUDkA8NbB47XTBKGmGvuwinl/r
         wntZEavTukjnAw6IF/qQfJpej3slGwUxsV6gyQ7/JTbJBSXCfKJQDTcSxtpy4qR/j00F
         qxi7hDf5wslKNqxzpyKBvCxaVdgAABfOPZBzA/gYOou+C509/bKqnoV4khD4LzQiDx7O
         1J9Jep4Z8BfbwMTNfvuKuZnmP6eKDBEm8U5WtKEuXmx29piDv2ymu8/PUnCSPfYLfidk
         Zp3ofgn4r6c4Edt15ctJiUhAIRRzurQr0n4+hk5galR6J6wgtIJ+I1z+nZbWsktmk3Mc
         W5Ew==
X-Gm-Message-State: APuU4Z9zdWlml71qG8RnzWIeiJCvB+CLGQ20AjX2Ugx4n6r3CVRiD5Kt
	q8K2d2uKssF8jCow4GHXK9/xq3349n9eGLkdITOyrO18qC1CrwXJlhscxMVHrXeKa5pumLr3VRX
	pF7E3lWoY0Kq5ezaRsjFHRdEZqZS2Dgc6bGxIx/7cO0d5Q3ljxMTI1rRaR4fW3tql59y0
X-Gm-Gg: AZFdTZdCMitKsMiAyg5/NdHvi45aC588eIjVRFYd+vNS1vVIhLbZQ+8AR6+GtGMF1o8
	gFP8JiKddxFL0f9CH2l5L75dIU9HqXvG3w9BwvQkIv5zYSCPiEqatUtxWjE3CimGZonbZUJ/r0R
	sBsvfXbOwltbPNGbMnPLONaKscebS7Risr88r8IxFvszdpEaq0m+qXSQ/FyD8vAt/JzhMhEweXg
	24XQRXUbGhwBiWwL6rgawXBwICf+f7DiSdL6Q+m46lFRlw1YEJHOQeOtotdIItbNVfARZQ4KJwP
	KUiG7ODX7Zd7Y/Y6lqKIlFD6hdFJoFM4Bha/IGeToVlCZM3zXGIa+xHi0RjId0ulJbKZmkzUFJb
	90xNhdBeRkeqcIeo4ivHzbmSDBJxbM1KwAQgL5MOxb8x2HAbgTnXbxXsova8XGumdSd3ecn4=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr21002907eaf.0.1795705471789;
        Thu, 26 Nov 2026 07:04:31 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr21002869eaf.0.1795705471359;
        Thu, 26 Nov 2026 07:04:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9f705sm766108066b.42.2026.11.26.07.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:04:30 -0800 (PST)
Message-ID: <c06e7955-e72e-47a1-9cfc-1d519cf3a33e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:04:28 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix
 touchscreen power on
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118162343.16197-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118162343.16197-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XqxYWpsHd-DHcGlsw_OhwHFFszwD_ZON
X-Proofpoint-ORIG-GUID: XqxYWpsHd-DHcGlsw_OhwHFFszwD_ZON
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b084a80 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oWukJj1da76sGXFo3RcA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX4icXHdcuhGO6
 uQOLA7vnnqC2q28U2iNfht9EuyZ7vj6N4V9n3hDarECgH/pAK4xvfmdHNdFv8Mc1imxMCfMPJsN
 ypm7ky8YGGDGyaz7oPrL/bARt5yEAxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXyO9KkhENjqb5
 ApgVRj8cBKjtfbXLcOWXFCQbogVLryxeFJ2S1uWexxFwRUlvG6GLoxAMFEJEM4u8Mp8Ere3m2zM
 SX/VeebHmBI/OGx6rSYIBp/DsDrdInEa4VHNxTXl3z5SdxhP8TyQNKR7IvOze0HRPlqYRkLRapN
 4YhJjBKsuCfH3x0Mxq6pzfZuCMIvjNASXlMn0P8T2y7NcDmECMgPlf8OB2BrbYzUOM2uy+0hFeD
 /w4yB0ARm3l8Dw9GtIi/kVrhDn+6b9bFacz3ElCNLuVJAF2+sGKwUGvX1yGUHofjiJRPLCkDGQC
 UpOdmDXnZxdVcuJYihZj4a+iO7Ss+nkHp2vRtr3aLCQgz+jIu0SB1lZ11idAMigv1Sm/5hzOrpI
 8bCj8/qNkskEOkI61c8Px3VNSk6mFvV/TbTPXsN6jRKrSmGt+rCu4lkHc/1YJ+ewjh+NIwz9N6p
 G7MUXSCadZRn6xJZfrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/18/26 5:23 PM, Hans de Goede wrote:
> When the i2c-hid driver is builtin the touchscreen on the ThinkPad T14s
> fails to probe at boot. When the driver is builtin the touchscreen gets
> probed immediately after being taken out of reset. At this point
> the touchscreen is not ready to talk on the I2C bus yet, causing
> the probe to fail.
> 
> The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
> power-sequences) before it will accept I2C transfers.
> 
> Add a post-power-on-delay-ms = 200 property to the touchscreen DT node
> to fix this.
> 
> Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes v2:
> - s/touchpad/touchscreen/ in commit msg
> - Add fixes tag
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
