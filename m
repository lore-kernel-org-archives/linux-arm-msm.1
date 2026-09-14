Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFC456DE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388508; cv=none; b=Mt2GKPm7xZnF8SuWt/gxNkRQPCir8/UPVxuAt68T6JQvG9zFU8Pid1AueoTz2TbQV8YXxjaMqYEhQAxkGJSP8p++Wss8Hu6JFLNelKiOz8q6PoBSHUdCEF+NIO867awdQxmX1cDmjXwv6uX5NhG74VIn96bKcrW5/TxXietVYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388508; c=relaxed/simple;
	bh=qyvVZPMmf6cjGNsZBWyEB+VQPzOPL16F00os4ISp9tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxE+aYMRoCeiqaoAWN8FioVgkUcIAta3MBbxVHlnjhs0i9WuT7oBQPanL9ICt2J+jHw0NEXSl33w7f4PAsOuzpZbI/82yNUzjChVqGe447xVfk3wE2XLobyTAUM4PgEa76UG7QKwQge+uTbK4zwhCCHy3Q+N4rLCJNfMHLVnilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9l8oCM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ektk8BMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9l8oCM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ektk8BMH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxPA1460629
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=; b=g9l8oCM86cP5zO5M
	/PKudbbPBSLcsu4HAY6yBpVvolo4T8D2h0qjdL3lYpOnU+f4n+m8gGu0gbuIt30b
	Q1u1Wzd6q1bhjVVUh1xyaeXxYPVxqUr5JUQGjooHOr1RWoJ8R0iJNQO3JNz2CaqM
	R/+NTyJYV7uBPaFC6Uc131I1jFUIlu3I1BuO1Yy4L4ArFTuqJRhfE4aWU3Ajll9t
	1DbHiVtE4iN8vm5/ib3W3F8GPWJiVsQAyJPu8cLU+fUTKs+jVdH3hRqSsBPqs6lR
	lJy0Hfc3oS5myUosu7F9TifdxNjOCB8GZ9zFWe7tnsjzLdXKuB2Q2RJkp04dkkV0
	lpS7KA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8mcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:21:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e9b747ad1so29933241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388505; x=1789993305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=;
        b=Ektk8BMHKKA7kYd4d9rVe90O7ydhvlTfQ/KaNrY9/M0XXTFdyg57sCsk9yR1xXzcxv
         X9DMSz/3a/fRnWu1OLXxgC84mSbQbv/m0upPG3FAyjUGhM6SZaa1wPSodqXzRsCILPNl
         yL6w4ZQ70hkHjj7YVbeOsJ1abY/Z2nhAIu8ec0NSHxb0pYNC1KXgneWol1Rh3zLj6jlq
         OEyDJx8RoXH9wYT1Sc19c5wMTrs9/RR7I5HQhkgOe7XWtaJDd0VfZ4sUY76VVRTKJ3dm
         /aNmVZUUY3AAF//CHNpIy6UAMvwhUydFucta/qXynOBhx1i+7lSPp2fbGQgK1Z0WA60E
         9Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388505; x=1789993305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=;
        b=M9YNsmMCK6SyEbirPGps62Tun3FwU5tMn2XPxIxvWgsCKTSOaCf6MfqsguwCnq/CiS
         mZ5YpLIKF/Rp/0VHZ1XiWcvbG5rl01LG68IeW+1vHATghAuul9GhEQfdGRSmdrc8/org
         so+pWj0uVD2sl1ZazcXmoPNjMKrXdvpn/neWwirnE4acds7AmBrnR+QXf5B2X22BXJLc
         MTUHb8VhdnCcUvCLUUv3KBO03cyEuEMHDp6JO2aXa7t4AtG1hj2g/gqkbuHuOGw6Mpqd
         M3xeUZ5YMnm6GEz98qB6LHyAIOjTe7TExzCNKFfa5zX2ico8pW9+klER4eQDXWHpcCrq
         e9dQ==
X-Gm-Message-State: AFuF++lHRq96ahNaB0kS+t6n92jmZLC4jriQfbAHa/44xvnnfxVO9B76
	3kuTSQKeBnxzxb4MS4rGlFuM9xOQYOdyoVs3U7cmkooWeW0jZEwn9aCpxfvGW0yMEkmE7tO8Hji
	Jq8RCrIJwRZ8n+45b6ojNrTlBHpBii9MkUNUylOnqqEbjXlG6tyqVarMVdjyWxi6rPfzP
X-Gm-Gg: AYBFou151ZGS7Ols7+R9OZxfF1hWrF3jNr0AkoqOo23hSQH2KRemwh/pYDGQfYLUzRJ
	zswGhvelx233HhhHR+7t0GqkM2YV4NVJ+khJXIIkVxmpkD3mFxldQ1URJRGfQjy0Xag/RBgjsAl
	WWTMEizYV3+Zm7QL1DGWSKV2djYBagsgv+TSfGsAyJ5/c/OSo2kTb+cudBKAzTMpMXMYINc/9Hz
	KkjqbxC7jgxfZCp9F31jptSzq9KtZ9xinGamWytOGIXJ6aaUtUTslTEU5Sg0iTZIYqapvsSwsm/
	WGkHxbbkCY2MUrYSeH18qIQ5I+mThrZXJdybGHCFxHmjB24VJOyn0pnsdz96KDU49UidSHr0fs5
	Gy3vSTy2C4gRONgBeJ4culw==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr354667137.0.1789388504755;
        Mon, 14 Sep 2026 05:21:44 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr354659137.0.1789388504296;
        Mon, 14 Sep 2026 05:21:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04568f2sm2472223e87.19.2026.09.14.05.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:21:43 -0700 (PDT)
Message-ID: <1be88118-4ecb-4d60-a79d-8675b9399a4f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/31] arm64: dts: qcom: milos: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX1G8r7L5WmN93
 lhVDWs9E4bR69lZIZKINaVNPXelW0Jo7ViNPYyxhw8B//0MIRRQMUzgyu4Dh419CV1KmdORBMWi
 IgVQDhrr4/wLyrBAtdoV0oHDzRLSMJRuAKrr1UXCIbyZcnsrFLILaIehzTgqe7bS+4MuJKy+gIv
 i7M4j01TPiGhh7Tl78lVDh+8WysNDUA7qxu/FCXUvh3ZR9QwmSgjV/ROb9vs41b9MHxXAaCypps
 FHzYNkDpIj4XCa91nHqSqVxifROzCUTTnOtjvIXCwR7W/y6QINep+GZsE+hm2GUYyz8PWioMsQa
 /h+IG4nHf+Xz6lgIiIQmzx5fOnZVosoBGiiSzOsZeiy1bjodtIuj71GKJYRfW03iHcPjuf4lgI7
 /V+kEcyoz1bRgtgb+NJaUl0OavnxZdSWpsMYK/fqNElwB+8WF9oLL/Mj00oTjzM4CVq9zSNZgFT
 pgK3f4+PxukHzqCvC2A==
X-Proofpoint-GUID: Jg-AtnJ_ZPwLMsbAt6NyeAXSFZhxpflK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX+Tj7LZRxo5U8
 3KwzSTO/92jifFFOrAWtGjx9PDptf1eGd4t+4jM72K1IUF0jc5ubKw5TwEN+hpKv1NYTvo5aJ12
 DyXi6Yy+fwsYBKR+x3vcWt7NSwGejq4=
X-Proofpoint-ORIG-GUID: Jg-AtnJ_ZPwLMsbAt6NyeAXSFZhxpflK
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e6d9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YiyR5B_2n7VWvMOyD40A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, fix the big CPU idle state name, which was described as
> silver-power-collapse, and update CPU idle state names to match the CPU
> type and low power mode they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
