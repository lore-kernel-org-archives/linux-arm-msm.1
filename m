Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C3D29346F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965469; cv=none; b=MsUG+u8+LFK6QN4CaaemBghPPzBdtlbvokv0smEWUspmUvIIPXJ/BLc39anAWIbLjTZfxWV1jrMzxTYuNkfJCynPcKukvfrM/Vs/kPKTWEVdPxkWdw9/3JZUor2Zqvc1z0uA7R7ks4ZhxMKCDtcPtxE0/HboANcAVPuRp3vwYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965469; c=relaxed/simple;
	bh=A3aGdYOvmr1JhLTN/6uBZKFzci+zAci/MMqkgkoBZYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uT7WjVGpEx133b/lEhKOD9gsyDh/uroW5EXzCpOBeN5ba2CooXO7is3now0NNZCz+b1c4iQLF+dlPZQ0BskNtWiDphBpBzBdJ80YBPgUKJguq59KvYfYt+NYOLeoHhq/GP6f7aW3GUU12PoofTfV2SkgOPih0K7No/Q8hndFEok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB6w3mjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3bNjIcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB6w3mjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3bNjIcu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CATVo1233132
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=; b=VB6w3mjUHata70mq
	zzqgp30JtxapAP7Ax3glTlIsVT4xa4wNLV3UvA2ZDJEzihZE0jJP9smVBj2Wxs+A
	tYHIFt1uhA41APAsazF5Hmp5iZzPq9c93P8B+A8b32xp10w1RpfMh7c2HAbVyD5i
	ukPgGbABheRyLnett8Gm6Ph5xOFXMB3kEKTrwxLkmuH7DnSqD1XVU2qtL3Eq73Az
	yjxfhF2iAr42vs2Eh+UCO3QnOQpNvCG4rYRiSuBsNI005WTCoj/LW9puav1fhuU3
	ayfgbFPOyvSaeRJ8yAWbb3bZ1vmF5qGOnJCJGwlrC+54/cg92QaSCy/eYjPPF7BX
	hvIe5Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vgq4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:51:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cd9fe6336so15093956d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965467; x=1789570267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=a3bNjIcueAJnNNwIQxlLZvdsBV56yx/qbF1gSjBitkb5V6fDeGxAecvqB/O+q/Nr81
         VprZU0TefwTrmH6YzGLHMt+MRgUND31jDdGy1YR9FP+j0Os0TyYV9MbbrH1YCKmjhWcF
         6ce046H8Iu7HaIQzZUozZ56Og7ZmlByAha0iui6ZX5fa0aPdQ0e+mtyiAXynfhV1QgsA
         lRjjJ1ymLE2cQJHOi45cb5VSziq5ARcnHQ2z5dzc6aKf5GHu0F9C67K167RNd5SRv4AE
         miQWbxqn8bT/ZutL19/VAK1KDLH/HI/4AitrsgBR3bUD8vXOPh5G32YdarMxlcQnUaXY
         f3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965467; x=1789570267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=IxARtnFOHdSgzRINOfZkjWlrSNLqFaiVF/ECQdCR2ZhdOzaeQKnOFROJ/xJI/BX33T
         pNhaPfpeNlpPK58Asz1BEvHUpM/jeycY+7yyhmPKFqtm7rkEOPwfsE5Iefnq+GrNm1Jg
         GBRwqoD7YnvSP6e9nOdTYPKzsdtxn2OaNvYplrPh178Y3AboPD5lUNPlw6+KtEcwcQul
         KSFVD7UAqkdgHXY4iaLNosYFdwnEhOqMOrbByf7eN9YkI7yoB1CGX8Fitp/EUF7syp7S
         vofv2NqqBnCciyhhGiPOPWQMC80UufkCXuOuHRdR+dUJMQYMQ9vf3zBJBN1I4Pap6tVh
         Ss1A==
X-Gm-Message-State: AFuF++nBIaLgioE7IcaxtNAEqOtrH6hYlEVE9j+8BEjop55tAkZKej43
	Mrvbc6I18cGMopYaEdFmGm8iR8g2bye0+LPzDZmu2e3IBwSbOFV5WfNZ0leEo4Gy5mQr9UFttdV
	/7Sv7sTS+JGBc2HHVBL4FyEPse4gnDf4m+fnnuJ6YpneTCurVKFlu+5DSsUrOVnIVFfje
X-Gm-Gg: AYBFou22X5RL+HPhcGmaqPpvxKbTv6Kcer5E2WEEe9WUr3YocytrrwRFoeKLudmoZ9w
	5wKwFyvUIK6mY9t6vNCmI8bm5HfYyIM58pmhINUPcFO4WPq6P+F3YLwnw4l8e7PsMI1tIkQJ0Tq
	7FwN0QuYj8J7CzXMn4lE34DFBeCyuxsn4aYCii3YWTlaZqgx3RUwTpZA7nDQf7vrxd/1KFyCGEP
	cdNgJNOMnlicApONarXBFAiJ/cuSPsD0PYBnY7WRgEBZcrdaxe9/2HQhEG+vJ0S5BNi+gCWYXOm
	4UGG/NEY8d34yfrLeyujHZC9oiRCl7dGj5uTIDxoDSbbkVlB6HmwAty2hFLdjDuRArVQzhFjbo7
	ruITGzOXZz0o/zW8zP29LRg==
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74579506d6.3.1788965466405;
        Wed, 09 Sep 2026 07:51:06 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74579016d6.3.1788965465810;
        Wed, 09 Sep 2026 07:51:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm630980566b.18.2026.09.09.07.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:51:04 -0700 (PDT)
Message-ID: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:51:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa1725b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hExI_PBlCTJWeLBofxcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7AAy6YWSNGE-UjfmjDLKME7RJzgnJndX
X-Proofpoint-GUID: 7AAy6YWSNGE-UjfmjDLKME7RJzgnJndX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX/j3C2e/V8qbY
 ZZghDhzDXL08CfnkL9sou7QzYEYlHvbVTXy8AQckbjJL7eo44gV2UiojwCLKe9Nk0OSHFObTHgQ
 vYZrOjsFlSwS0BJUdkVCxXsX8ymdxnk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX1Zkl6QhsVjEz
 ZQDxvi/aHG00u0WfioqKYuPutdG0dZQUUQNmWmZbvBvS7qYPCM8meU8EWwvYvwvTMRIauwZVP7E
 JwNm0g7McuCG4wmI2P5/7AZTmg9R7+2aUaA9mwqGfBzcMyUza89uVjT6dam24Qntxq0aTLBazYk
 hwOoxbspP6+KL7mP8eaiSPnFlTJAnSHzPz+agfDmjk/4iyuD2uyHbAS4h4RVORW+0+o2Jbf2VWx
 mrnNraj7vVmLOZGLhwgzQShhLYDu7OluNWjHWH5MNw9xCqp/cOlBLWQJbUcvE3RJUNhcJrnU681
 um/ot/H0aA2LPwGZV5f0OlEunlyX9TeHCm9Jeu4w5xixJQeqkLT1V7OC+YorSqpl4v93tghq3hm
 d64yx//pJSlr2jHvLsN8TlFq/p8z8QYUqIWfVduJIIZtV5YPX5Lz/0mnySWeyNm5B6hB6Bmq8EU
 haCo+cJM1pLBHJaSTYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +	reg_dsi_touch: regulator-touch {
> +		compatible = "regulator-fixed";
> +		regulator-name = "rpi-touch";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;
> +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Does this need to be always-on? There's clearly a consumer for it

Konrad
