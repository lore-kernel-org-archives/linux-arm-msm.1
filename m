Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703063E49E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146078; cv=none; b=j6cRWCsgMSZooKdEM/LeeGjO1Vlg7VbaK16G6+kvOtiGI/meDCXVmq8/oADr+cYpPoelWdI3F1cTysl7EANlCVh/8nsVzJ4MIPHVTiuZG5rouIPjMHnXi06ikwtrPcM5byb+t880816Ogdz8m+6lkM51i4roHc8bozd2bNyIVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146078; c=relaxed/simple;
	bh=/yOLqhnrBxL+q2VE978a9XQLFBicrFACElLsHEaWrwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FeW0F9Yu/SwsSAdGsgCaMbiAUMsB5/PJ6/3Mixeh9F8ZMuvnu+6Pb7Zr0AF4glKcuVazBUgkos904fBsVu9peDkUdZsTKQuiU7Q0y/tvHAlfSLke3qXTMCLtSDCuibWzh/Igu33Ygvib7xC0r10I7y2VNRh8pmsfjcn9srbJvj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUopq4+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi2Yfpup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUopq4+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi2Yfpup"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAIZC2998528
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=; b=bUopq4+RC8X6BfF9
	x8rfMyP/OOlUubaRa5EPc9niCSuT082/INTj8TW2+sjt4wBzj8l5vC0X4tom5EVC
	33Hmv1hMZ0rWctcqzoMddcCtSRctRmT8cvpM887rNserT3WS3yvhXO0p2ZmCTwvA
	GcAg72PhWOGDobUVdNMKvq4aS0xYzL1XRTwlM79MyIDPYvj/qp6adsSPKG8mobMZ
	CUr9B9kqk/BXxyXqHihFjDzU7ZmAfnL8DkSDvBW/7uUZml5PS8s57rvKc+Z8kt9c
	+eLIj0rGC9MggCaKCHd/aUlZvLHT5Nz4WgDqvy1Bow4ZxJEPjWClqODy6sRTo6/3
	b7g/8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r123rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so19815201cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146074; x=1792750874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=Oi2YfpupnbTMJCwrbAamCtqGRZxgBZ2JpxBmTaeRV75yO2xkZACqwD5hex0XCl/5CP
         A67IKCRn44RNpLzoTvgunYzb4csyM5yfC2OU+AdvEaWFl4bEca1icodEUf8PANirAwHK
         XeHCmwm/K5rTFti6xigZApZ5HVLnHersiDURUu4wKdOnU/ifm49Aw0ZxgDBMrDQgCvZ5
         PxpQTCLviO9SrAgw9yf5fsO+7v0xxhI35n0AES2CKui5j9ANHDkksfXWp+y6mm85V8mw
         93hH2IBOhYceelaD8XTOU5Wc4woKFwscGQPLHMO9QtIeHwPbju3Lw2Wm95nfui1NYtg9
         e0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146074; x=1792750874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=tsa1XWcgBiODI4DoQCWCaxB6qTUMa8foeRWC6BZfXxWqf+mBY8l3SExqpDKPGnUZdD
         ts35vP46X2lijJEBdX8Ms6Jk/PP0rqlOYLLTaxNg7snBmCvQLnHZhRqlM8lKJD+/IBkZ
         3g1KwkV7sx8HS0lrN6ZrKNHnQIKDPsqj5165/2RWD9H63Ocb/bSnwRC3SYY3Bp8b6aK1
         vae2oxBRfQghws8JYDwio/mn/I85RAmejVn0SAVc6BHejFxZHx6TdgPjXP7YD7UXrCi9
         TvDULBgsvRqz/CN7jRhgW9VBhd3hwaeeUn2/ujqiAL5jDkaRReC2tKuhY0WeJaoQS8PT
         LjtA==
X-Forwarded-Encrypted: i=1; AKwUvBxI3A7151uO6z1mGAecVPv/7Vu4nCZ4Pybn0fV+WbmdoKSeU7BtLDgmfZZRisNWLNRarWlEljUQh7v+RoaZ@vger.kernel.org
X-Gm-Message-State: AFq9FYICHpL1DNVLFDhnT4Hegpv/JCHCe165C6ITB1gB1Od/6cFok+hK
	xXxnbQBmpcNCVxlbgWPVZ0kDttTVFxyfVx061VlNdez+gLZhFLiIsL/Tqc9Hoa18oVQ3z8RAfBG
	XwcNB4BvB09IPQBTW33o++hfB90wYz3mG5pJ+HqN7ZtVyJzj1ROawltQVwuXGJ7B3a4Tv
X-Gm-Gg: AYBFou09YdqCVUi1cLepvyPFjvf5JI9HYC8KNUIbLw3n0SIDM6xlalsXwwkznvnK/ao
	fMfJnZB7V70SZVzJ9EEKebuAFy5ol9Xhk7WOP7ENex4toVO7L1caGmj9zQBAfZ/OWHmT+GCS9Gr
	4oXuPI5q5UPtl+IgRBTiiBjL3Dqga47iZeftu94xqkPkNPMQzqEPNng7Vape/E9uQuksIiOsmez
	6fuzWgIboDs7av4FTAGeKQHutVhF+hEhSAi41rG05Nzb27riJqBfhBmVgDc0bEoB/p8Wis+6Q+T
	qKt+BXiIxu05S4pfM8zPwpm/RqQndhNXQ5iU1iK9N3uYukiYNMWIeqxXoud6+avyLzi+iLlXrAU
	bqmagcu8b5FAJYQOsAhC7Tw==
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433651cf.0.1792146074570;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433381cf.0.1792146074105;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm57787066b.54.2026.10.16.03.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:21:13 -0700 (PDT)
Message-ID: <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZbWh7Kerjse-rFJncGwHyPe5LTfS-WEO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX+KPoRSWoRZI+
 tIN/w+68yzSj3z+czkHaP4z+UcFVYUJybrf6u7+tXwr5jdfoTs7j220IXhcRSVV8aJ/G4AXQxJE
 uxGvyKOa6FEvqHfGE1+spa9Vvkw/4e8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX+6zE1KPUr86O
 a7g+Lm3DQrsx14oDUQrSmgTy5Tq+iP6xPe2XA4SQnhgpqK/SUobOo/Jo5srlP22hLRV5iTmLY8t
 sTQTndZRRTez0H01M1Y7VtQSRzY5VQ/pNlyrnaDa5NlbOsKnf8+T4Q6KP34ZYosQFT1+K63uWUX
 AmXcUGi/2H4K9JXA9i3jcb7vLUP3z1XuYsWqdvYV6GCU4Zq7UTvbUEDRgddZDVAyi2Tw4RrvNUO
 AXp2M6jbaCqE88eFd+qab2/yT4bQKKldfWzTz/0fE4d7uf9VjLSIrn4exa7w3P2luICLlfyiGde
 LRmNSbzHJggQmWmt5cpKa1nOEI3Ea+zIAHeBw8VLdwp/Aq95qz4kwlpfOJqBU33AU9qeYk2wltT
 MoR02omevGw/PZojMMu27/PVJI35vHTDVT6j/uOZjqW5h2fOIoA0mfgcDETDqpz2ZH5CgAme5gy
 I/iC5NORXFklFBobLjA==
X-Proofpoint-GUID: ZbWh7Kerjse-rFJncGwHyPe5LTfS-WEO
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1fa9b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=kdm4YS7hd6rvY0lC6QsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Add the digital WCD audio codec to the SDM670 device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 038ef0f73ea9..91188acd16b1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -21,6 +21,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -2541,5 +2542,19 @@ data2-pins {
>  				};
>  			};
>  		};
> +
> +		lpass_codec: audio-codec@62ec0000 {
> +			compatible = "qcom,sdm670-wcd-digital-codec",
> +				     "qcom,msm8916-wcd-digital-codec";
> +			reg = <0 0x62ec0000 0 0x400>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "mclk";

This clock configuration is forbidden according to bindings

I'm not expert in audio, but an LLM points me towards
LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE

Konrad
