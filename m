Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866088;
	b=uxdg7HyotqbEMLyeHWjc9BxlqaVflO17L0utnWHT7fFehD7RiVl3BL9+ySZ34r5x/SMO
	 V6VJFdrwS+IJuIqrTrm0G5Rt4aEAtSfA+kR/TikXgFXbgVKrWtoYOplAwcUn+E8SHfmMD
	 gdljsS5Ct86JvJvq7iBu5gpbBoUnSzNhdQh8GKgl2wXQIjO0d8NesK0mxBdFSlbJIiWKY
	 8XrgBlohfeUylcsJLorxC6zGZoZ9xoDzLQJO2RFbgLx93OXG+PrA8O0cOi3qZciNCBqKw
	 q4paCWeDap7AZqs661RZAcsVssZFBICAlbSFUZ82HwqSPfD+EXfkuN3UN9T2iceoRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
	b=kNFO0jIn579YDmT6n6/0Y3iCmJr8UP9KOUz6rkWEuLNVrqhgEjqiTK73wnNPclwgrAqK
	 zRtPJ4vZyobJo025ICyeooAHt/WPyVMo7nUMwrIb6zv6l9XbYVUKmxgqdf/Fy/Z1JA8p+
	 FVfhYaKW0BlJI31u6kjw3ms8DLZOcIJAyMHiYplurloJuF3FbF8IAyjeeT8VeMGffQ5df
	 uNW6bB82dhu7anZq7fjlW3LjQ1QpcZ09W6uquf+r4cFskJs51MEVt/2X+4FtPCE0d57gy
	 4DLxL922mAJyP9I8Y94v6SDCLrQlAXoP3QVYiVel4ePxmFpfSGxABmah8CDnAb+Upng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O0uzeIW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8hgm+mi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEF606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0uzeIW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8hgm+mi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCmf3819755
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=; b=O0uzeIW/H/Hxv8pl
	hk3/YzfC8zsjqijXerhctPmjKCMNw+D2c67SMri2K9ANgekiJ054ZfM+ag9JW1zY
	r5Ny2pB1QUqKquZqkSpGotwg4XMwmOLNr5rT7MNXwPGBZLlilLr8EUp2jh+pKI3J
	8fpojhcixy3+LmAvf/zhMFoWghdx3go7oUnHTrZYFhrBDoZEsOrG1F7hIfYdRTdd
	SWp4GVrfUxHhCYH0oEtpMk5pnTBiOSafW591fdWnIeJLSg2DiHrUJm4UUSP2g+Jw
	kQKNQkdw1lVTbdd3yF1Elc0IU+2H8kq9H/U7y1mE//rZ85GY+FwtHWV6OPepHNNw
	g4pEFw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tjux9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:08:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990758837bdso79994241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866086; x=1794470886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
        b=a8hgm+mi9u9vdcrUinc15eD3LWeD9Qott1RVvZuzrXjel5JBtUq1drjApVdRFyJxIv
         AFW3CpBzPbWIzGoI1CfEWu+jun8Q9QGP5wQ94IsdUlqwcau4F318S/A/jO66gQsdLH8k
         IBkW0RcdXLippN4VaR5W0FBsbF1APA/AQIqDud1qljiI1TuiNHTBguhai2Roto2WTQuR
         ld8cTYOy1NcNQ9kWb9ZkyBPi+zp4hi78Cilv1Fz7wrrldqHnoT7fFY4vXUsqQENIMUSy
         mhSXCx/WKUSEZsp2jT3fcEqY8OAFG1+23d/1Wf9KGhQ2hcKGDgdBDEz1+4kXQwtRAErs
         rt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866086; x=1794470886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
        b=KH0AfctnrupN6/VWn+k17Fu9pKrkvwksimJAdGLzfW6CuZHlUR9dJFNLZRsG1+5z3s
         5rSi4GxpKoOV4977OqxWyspVufGSFEVuzM5z+XjpSbwqBInxDojM4hwR8yydtgyY3wRr
         4A7wxVqCU3r5VHDUhgveegZoz+3foHoBfauQEHPJRkrTICCm2Fz01McbhvWl7QcGw9gc
         MtZ65xvHTup0fm1jj77UK6GCP+ZGm1/y2py62+MbJChksZz1SkLDWJx/YTpX5dliV3rz
         LVi2Er99u3xlkCK2rdw8Y7CIVcFb+IgZ/PaStHzDDwgxiLDLXsyL/XWcF6p7PSy2vWn+
         E8Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzMlfyllwgpYdz17kMwgPLydFzIDlDRMv92Sh72tYaAyw0gRRVGdIIzGUCH/D4j55IgcMUfiJ8u7HjYoOwx@vger.kernel.org
X-Gm-Message-State: APuU4Z/gCvOF3d5wQ7FdTndz5/Y3Su9vPwRkI7C2PkWsoEdG9H5F6Cm7
	i7mYPGovYs1/8j8oZOekIxrCAHcuAltx0l3nTN5DSciH+8OYCq94cSsNigI4yYqWTuVU4DPFc9d
	rNEoLxBQykUhQ8TWdNEr4g3Rf+4hS1sX4Ua0LyiuiEeLAkLbsZG7/3ENit87JVc9bOB9y
X-Gm-Gg: AYBFou2jsjNjzcEe0OlKEFgJz+8cQByKFvW76I6e+bJ8TjE5ggu3c75ocrWHY9NN5je
	3dXCpgb3S0pJwj8wfxpqPIGjRMbWnK+ZbHhmJ80IJbwK3stpxW1rXi/aT/FoFDNr69i7mqbJ4gm
	h+18TjblfqhqEYcDmEmVMpug3LQgS3l2GDCZuay4IgAg/sI9ailKO86Yj8Ytndn/8wwS9aapf91
	436DfEkKCoYb2Oat+B0Mzrk6cK983DSKAc8FXhiLXVDGJ2YhL79/fgGTzQwwRlni/VBICcPoEbR
	/8NdpTGb7oq5QcV0NpX9mPPcLiV5/9jpQgFaSeKXZbrXagSVxjy+49VIkaUOa3V9PpWGz+XrAiZ
	1jTWO8GkMOh+5KCrDduZ6DWgyUWIqF1wrS+wq1LG9rZ5Ba/Ez5x9nu+W3I2hasLoKLGif
X-Received: by 2002:a05:6122:1aaf:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec68514ea7mr8490419e0c.1.1793866085951;
        Thu, 05 Nov 2026 00:08:05 -0800 (PST)
X-Received: by 2002:a05:6122:1aaf:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec68514ea7mr8490391e0c.1.1793866085487;
        Thu, 05 Nov 2026 00:08:05 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140f93sm145620766b.6.2026.11.05.00.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:08:04 -0800 (PST)
Message-ID: <22d8f5c7-8226-4e8d-b67d-f6b4b1cbb487@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:08:01 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins
 in gpio-ranges
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXxeofg+9AjMR9
 1wSALOZ5xs8+Dm1iI+qjf6Eu+iozqPd5Pb89eh1dfwrYkk5yMR3eUeTO8I72LEBNbe3GtGV3B66
 YVhyDDNHc04GZrs+HMpTwcwhjZCA3qQ=
X-Proofpoint-ORIG-GUID: P0vHcR6pRCYsMH3ji0ghdxRltGtQJ3_B
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec3966 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGeSfPnbYMIGY1KhdJMA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: P0vHcR6pRCYsMH3ji0ghdxRltGtQJ3_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX3PUoU8O5z7nv
 f0RmZNlEY5yx3H609lgrKFoJiEjGgniBu2DB2gTkxX4G9MZrvMWOlG3E3ZkRyOppS12aHloa/1R
 jJFjLJU8ddF4uHMYfCQkHOY2GjORKCH2PVClu+iu1oU5Y1QXZJASCIZg+H6hfSFsNdLzWzNWPn6
 05WiWGp2h0/yPdD4BKzQLMS0Lc0jJuwD039VJXby528mUgSc/8hQPIv4cmww/AjSGW/lc8TqK8n
 hSplUkY7XVI9cFXrVrsPUl4EffktrSXw+z2fmRDvkjsqOt15KMeeYqndzB6Lds0PnbDKV4e2Gfv
 LxmIwzUjxNq7wd+CBG96LSC5wdTQNtawMD3FGxqR0YcZJzOaC9n/iKiwMT0C0yBwHyKZh25Ylul
 1y9xjvypdZURSJi9A537SaTWaL/S2r2gBrnM0Q/JtFXJwa12gJ8OQzeJ5IRfbwcpM2rCfQsrbZ2
 pRz3wmg6b5kl8KlMg+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
> TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
> in gpio-ranges, representing the number of pins in pinctrl, should be
> 186 so the last pins can be configured in pinctrl.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
