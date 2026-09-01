Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160E35C1B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272254; cv=none; b=qqIN7/c86B3I9MWnOnDLPfr5GkeMPLv3PNdog/CfXg8Hbjr42MFE+t3v2b/TY3J7ydqJPZTGhltc/+ZA2rfvBojH3ww1B1M4WKyaUW5vj/+iG2S9xsFZBOS1Q4XywtQ0K7DCSpb51IwX8l0njwynkxAwpe6VX3lCQ0+L7LRPeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272254; c=relaxed/simple;
	bh=Ag+3Gxwth8scj4spb7kinR45PS61DL85tZPM3vUaGBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sicozFVV53ytmhDw2xS2lg57QbQzHcKAZw6IKn6/eAK3dAfZei6uWKLaFJyFyIJKW0Uk8cJkVSIhfBgz3GaIQpULlZe/DMT6//k/MWNQVRANENOuNOPaZWbsPnYJCYPbH931FGzGVfNLTd223i6WBxzJacmSZU5YMUZCxU8G7SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfREpZUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gARul/1y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfREpZUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gARul/1y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9Inm2747787
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2p4PVMRQyap4QtREvmTG+zHDqqjqe019cA/N4E/d+w=; b=DfREpZUE17EnVXWt
	FsfvZnSl8y0oz3seSNn36W8vVQlcx9BmPZ1tbeB4g8+miJh8a5XEIDe8nAk/reWc
	eqPzvUE/CBhpFp1fBaeOR/mpbFjTDAVXfV3HTz2k5qUU6bhsG7dODoAkntR+7MuI
	myXv/LFolnqeGAWOUyidi7usccMXvaCVDj5laKJolcA4g9mK0dV1d/51akXLuPsS
	iM0GwsNfLfEG8TMMKnsAmvAime+DqCvyn3RMte8Q982wI3w7sssHbgwf0Fu/HZsg
	u15usGLKjh7u4OD7X/Zh+dPaPXaW9yyjU5e+I/H1WT4wO7PvFDdz9Sh04NrSqI2O
	gqW3pw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0yjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:17:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso109683137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272251; x=1788877051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2p4PVMRQyap4QtREvmTG+zHDqqjqe019cA/N4E/d+w=;
        b=gARul/1yDzZJa1BeKFug9rwx4JLcOfsRwAIVCUtk3W4OJP7X+a4p1ECJ39YvtTO8bK
         V3vuK2bFKAh7KblI6impfuZCXcEGEJcc5HiOxOLt1qnufNdvC7y2VAuYM6f7Wk+AqYeU
         IkOKwFYvQZt9jIaFUG73JYZk2vBy+p+OU4IzhgeoS61dNpGMJTU3uobqac1AY0t4fZjz
         1Zzm7HZrHf3TpFXnIPgtoMQONhkygy1krDfXaduMBEshqoPaT9AUc8GGuXlNOeZ8sNIt
         p4HB9InLwjHFjwMCVdVZLDNEevk6XisxxInNWaozT+mwo97BKMbIWocEgvMvSWHgTy1F
         /hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272251; x=1788877051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2p4PVMRQyap4QtREvmTG+zHDqqjqe019cA/N4E/d+w=;
        b=Ix6gbniFhD4RODCkhm2/Gn2VWgmfVcD8lFIZuKSWurWNBIFP3/30y6nmzRlzEnlRqy
         kJMgaED0f/rfEC2f3RMRMhpHstNVXIxzcULH4iWMG8Otlv59PZLMGZrqOapDLF592NII
         WH3nUb09U3xPA22aeV338eGt7cMei/Q7q98qyXYDjAZ70TJtkyRxxIw/ZfwGu9btfdgr
         rTVM6NY0V4vo17tseM/ED9AUKrr5NoDkb/1ILxkYt6SGfoPJxNsHRNVMKKM/dSc1gCrM
         YPj6Cn+L91xSSw0WqHj6xeMeXLxzScLINwXTt9mfrCb9eQoAvN5bnHzy5KHrXYlHVKNz
         7+aA==
X-Forwarded-Encrypted: i=1; AHgh+RrOSWkF53wI8aevlm0Ga+j/925MQlqTSGeEvUSHywDp6O8+xwzv3vITF0a9SFndPh25bDdtM38fOWTbU3x7@vger.kernel.org
X-Gm-Message-State: AFuF++kiekoWOOvBFyK/fQz+vm8nIsdQ5HWSm4F5OGtZCAgBDGZmg8E/
	fI+Z21wsCkfHe7CbLgd0M4POXxBk2Bk0QBAszg+8wxsOHEMN/vxbktKzy5DleZqVjAVhCQHpzXE
	rADfEZdcfwqxqA9bZm+INq2PsSjH6eoYC6/dfSl/kULHQB8G1LkaixeWyaPBehjYDtPuk
X-Gm-Gg: AR+sD12RYdEf6UIDiDtprpGWK/BviCFTvaeIoGpiVclVj+pFgd7i6ErqX9gGm5nis/3
	3/veZRkEXTK4k9hrEdDOYeb3bAJsuCq7lb7B1brNCZ25ap+H0Ghk86Jb8d99jR6lf21VHEyXUL+
	jRMAJ8avsRFtfCO8flNcfaWOPr9Q9cWp+H41CK3Nxix2U4crZXx7/fO5YvRPGFxD+fG+cmFaewz
	l614z0L9+DUzMetYbeVJSxGfaZLHmJ8vc6iA2e65jGXCzrAFwsgJyygHOuRPhpZAywdpMP0musJ
	okRoD7ZFh5PLoong8oA4G5YaDX4bzJ4kiXnByKj7b5YKicD7U92eLx+JlGLrmGSoaVIfUw2aNBU
	QYfdJv8tMw666JyApje733Q==
X-Received: by 2002:a05:6122:c2d1:10b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c6814304b4mr4067428e0c.2.1788272251188;
        Tue, 01 Sep 2026 07:17:31 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d1:10b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c6814304b4mr4067408e0c.2.1788272250419;
        Tue, 01 Sep 2026 07:17:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm597611966b.22.2026.09.01.07.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:17:29 -0700 (PDT)
Message-ID: <a5702e89-d083-4dd6-859a-9a52faeebfd2@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow
 gpio-line-names
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-5-7de0b6a73d08@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-q8b-dts-v1-5-7de0b6a73d08@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WylZtrpQH2WfN5byySTAotOZ4ahvKpDM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfX7aBJogLzOHj0
 bTcsqY8FexfNCXYy8ACLMB8VQ7aGAYI1s8vbSt10TrYmGiCvW5whhyHrUMfECxhJiKSN5rDEEzy
 kmI9V6+2oDkmyHTu/+TGIE2r8AI2bqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfXwlAAyXUUugQ+
 uWseDEf7hWr49bt5s+tBJass3EVEHRIMPMH7T3BtGLvQrtndP3yi1I0QZUDUhiTDjqbS1O8yQvw
 TgvYIi27pK4OLOFnFT+5G5eFSn0cirqONEIyl3dLsRqwSXhbwP0M0lxNn6LA5Cni4JygLTGLfeN
 ck/DaVlCx57+Pp2sEwjAsGTtcnnwVeELP9O6PwfkXyhL9t9ySLGu+BYl6rmyXnnLOvsxHUr9OSZ
 YvQZOCCadP6k/p/aZOtSlxVDXDyXLix+kNnz/430FaK2dQluOc97yQ5/N00biqi3P5vuyuZ90Lx
 uXiTfC9cGPeaLzAy623P1O54OTqqtkV49BsiIId8m/6aAn1eUI5o8uTr5ZKjdikC//usWIi30nC
 RSsabMcGFaCIkaAuGUcT6QLSwEpa/+uw6iwTky6Vgo6WM+o2zQvGz6NgAHBluGNYm0e26m75E1m
 Vm+M0AciLHfl8Bi2oBQ==
X-Proofpoint-GUID: WylZtrpQH2WfN5byySTAotOZ4ahvKpDM
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96de7b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=hDogp9jCFjaJvwT77eQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010127

On 9/1/26 10:47 AM, Xilin Wu wrote:
> The SC8280XP TLMM GPIO controller exposes 230 GPIO lines. Allow boards to
> provide descriptive names for these lines and constrain the list to the
> number of GPIOs exposed by the controller.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
