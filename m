Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584223E51D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709150; cv=none; b=NYOL0nof7cAo6ComNZ9tOQEv9XCjkhx9BflfI3K9CrnICLWWH6N/CElmSlFOb9L4EFFGUEeKjxsLAUX0DrilYnrFqj63bX/IjmjJv+kQuXCzGU+RnsLzRb0OA41kx1zgKtLNSbdUywWkR52QHzEhzrsG7kAQ4oE2+n5Ms0J5l1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709150; c=relaxed/simple;
	bh=MZmp7vUxrjOsUBaR1+c2ZjLz6Q6u/vJumUfWXsRV/2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spFzEgTh1YoXey2bw9X1qY/M7owUuyBk8y0KsCf/w7llhWN+JRJItwmw86DEMYhTDTsvGff2286EracSqIGGZ4Gvdu6v8yWksfreH1o4e3J0b9yeEyafYSajnnBNFheodCV4AY6yqEnES1TAWpLo6XGpgLxoIiNHHi+P8663VTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKmG7HaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc4DVJjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKmG7HaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc4DVJjx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lR63473764
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=; b=lKmG7HaYKlg5DjF0
	a42BSbAn/JCfGeSlRVH7w/dtbmsE7uSmqeRl5LIJ+b9vfqNQyrJw/9r1FQWAQlX8
	0XPlqAM8z4rSbAn0QynOBMckjIZo217G44vJW9AaW9cGtquL02v/VehCQzKn5RP3
	Vc47jclOGQLQuYBshmVFIkW4Mz0AibsRT75SWHe61xVvBRdvji1knDjZsem3G+pr
	RFC0hMJhbj1ciYlSgmtUEC9Gv6292YjPVhXhJgwpfwUuxd1RRBXN+A9hKTSmkXw0
	cX/A4ugKxxl+X0ku0le62r3kistTc1fSH0C7bMGBXVx6FXB6aWV4Uy2m8dNVxy4Q
	a9y1Ow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fu3u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:32:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so213756271cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784709146; x=1785313946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=;
        b=Zc4DVJjx5pskbKCbAgOfY72LGTbcAScVmvMIGpBdhjx7aLMB8dKH1ADldFE2PI26MO
         2r355H9gpB/LodiBVHerrJVJk4Q/g8qZsJG/Ff6SvLRM7cr1iqIgA4xRkB6IXGBm5QTA
         zsoP8+rUh9IxHfP4JFnQHMbZOQwHmrhorwm6Nl3W5MKAiHXnKM+2sW5pbbrVS2XSluYm
         gRv5wIMqIcazYQSLw2ocdgvm7gGT1lHnwRcOXvnF3KjksKcn4zM3OR2hmltgCVhOFrqW
         oNZ0NG20HKnG7tPqkALYMNi/HzABmrA3WDw4GFhrZtaaPdUfBYfn0GyKbQ6J9COZC2Aw
         cF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709146; x=1785313946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=;
        b=pxVeOIAPVe9iwtOFDcu7lYorxIHNRv+XT2NLoZDR+ZUTrWtjh27ep/svgO5DCJGSpy
         rgHsVfeFZWxEm6LH1lzOzlTtgUpWEF5nEQIoJ+lPtgkM2f/JEWrpBVq1QMjLmcJe5XYa
         FhF00/+85UkKJa/cwFxdsBcJcw2cKYmQiXldC1iX8XM9tY+4jb5hoN0BEWk4VsRWSJA3
         5KZwTnZre+Xx5lbRKy4vqG+sZxMwaottC9Aq+v5gFcp7WCi5s/CYxq63tAUffLFC4q7e
         eFzhaZutGCPyvcQhiRNIQSF1J1gdudPZpFJvOXUJhgD11LddjCl3dso36yZRcoVdOswV
         gmCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9fQMRU+dwD3aqKaxN00Fpg9IxOufFJ8XvnrNRH8uuxHoUwGaEFGU0z9MSDh3QTxRQ0jE6gf0PWQXd1w+B@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGLViPFzmAOWMW4Hw798LmvRDYuUZRf4LXq3tXNysg1SsOX2j
	mevWd0PMGKLWyEXOU2QAkgxm7oA+AVxeqxIqOcxsWoM/ZKxPhSo0dwWs6Ozv0tqaZZEdgik1OKB
	xwSqh7srsC+STOGxqJm0H7e4uDarVinIo3SiqJkcl6mQuUqVvUTyH/onEgczETcJ2Q9jw
X-Gm-Gg: AR+sD12Qa6JVrY18MxNIukCZ3ApOXayn2P4pCzDsLDHREEBlxZif9BelCgObIRy+zoJ
	xmTw38CpG3JfavU5PTfefdlS8Hvr/5P0hQwoi+65yWiuQHXObTCGiiCQ2RgRZVW9zLaDis9WhAZ
	4CTiNu46ZRjXDJpfsYWSkFo5NRx+AmP1mOeAiRBuhseBzsHjKx5YFXB1ouyNQF0VzSKeGh/GhxL
	CRX2ZpwXvD96aALHE53+6i5o5kYXpTOm+VJuYWUUkvoMjc24nxTbpjd5AgArg66zztBQ1HDLzHB
	R6xvMlwcj+NLuPP/lUa9Z37ObBK4j+QXW9MiOvFp1o/pDIUPFO1JjeWb+4KY+8aoGVDEV/bp27A
	cQ+WHfGBiKd1X96DozcSgyWWJYnE=
X-Received: by 2002:a05:622a:2512:b0:51c:7b11:419f with SMTP id d75a77b69052e-5213f46e75bmr210124861cf.76.1784709146517;
        Wed, 22 Jul 2026 01:32:26 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51c:7b11:419f with SMTP id d75a77b69052e-5213f46e75bmr210124621cf.76.1784709146044;
        Wed, 22 Jul 2026 01:32:26 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm4310415f8f.7.2026.07.22.01.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:32:24 -0700 (PDT)
Message-ID: <92187e4c-3a54-44bf-8d3e-ef7e23e7c71c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:32:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: qcom: remove the ipq806x Storm audio machine
 driver and binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a36JvaXqsH3D9RnuRqEbZbcl6U43vkKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX/BBVejDMyJPG
 ntlr0ph066+fFjFkSOEEA6uBOtDuaZ3fkxgDDGcAS8M6sr+gaeCa8O8TlO1nCnISuRq7v6q0An1
 7Z/gc9khGRmcrUVDN1BoeCBzvcrT6xFKf81cHzoP59I9XquaItDb6tD+J4CzQvQYa7qWiGF8Cco
 Wg3ZOriHYNR9jpqcVMvB2GLiTJ3KcsoLMgiJh3cLLNfaRCYYvFf8kWwlVrfvdDKf0qxoIY5GGS9
 6HZ1rTYZOcxypeSKk3mHB8WtWf3AmUcvAgusKhq2t4lO67cihNO0OOGxCTLhqZGekQJoWqL9FP4
 OLPogZvYuj7KZvdRZBbvrGTPO4F4KiOEOxEil8A7qA+IUVzJYQ7aRGg2ej5bZKhCkN2ycu5gBhv
 uxfVw1yWR50KHPMGdWsO1vis7hY91HCeaYd4b2NFFsTGk7H1QmxI0jXHC1zC6klu0wmyjhUMsGU
 sc7YX6B3K+yceqoNV6w==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a60801b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jkUNJ2-YqXqEMmPuORgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a36JvaXqsH3D9RnuRqEbZbcl6U43vkKu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX33BbklGzkEQx
 Xc7b2SGdFr9V7P5stLU1EjzRK129RZZYXXQBzj+3cax4lXKGMWIZvrVeDcRPy5KfiQ3zWGYL/1Z
 xgUYELsIwGI+vcp8RBtMrIKTZXEW6NU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220078



On 7/21/26 7:12 PM, Dmitry Baryshkov wrote:
> The Storm machine driver targets Google's IPQ806x-based Storm reference
> board, wiring a MAX98357A DAC to the LPASS I2S bus. The board has never
> had an upstream device tree, has no active users and has seen no
> functional changes in years. Keeping the driver and its binding around
> only adds maintenance burden for code that nobody exercises.
> 
> Drop the machine driver along with its Kconfig and Makefile entries, and
> remove the now-orphaned google,storm-audio device tree binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       ASoC: qcom: remove ipq806x Storm machine driver
>       dt-bindings: sound: remove google,storm-audio binding


thanks for the cleanup Dmitry.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini

> 
>  Documentation/devicetree/bindings/sound/storm.txt |  23 ----
>  sound/soc/qcom/Kconfig                            |   9 --
>  sound/soc/qcom/Makefile                           |   2 -
>  sound/soc/qcom/storm.c                            | 142 ----------------------
>  4 files changed, 176 deletions(-)
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260721-drop-sound-storm-7226df1bc850
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 

