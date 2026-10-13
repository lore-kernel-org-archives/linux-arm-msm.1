Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950033D8903
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882531; cv=none; b=sAbQVC9lq4z8+57ONO+sasPT0+mrE+J5lvZD/r/WXhXTTRbSxQoGltlogv2gD2wInKsRkbvIefOGO6KzoPBY96dgt1UY84qo0BgUyz+pn5KVdMLrySDJrB6ntiyTi7YFgCJo8fwd/V3rHErnDMy+gbmCHC2tDoqKwvced9o51uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882531; c=relaxed/simple;
	bh=ZAyWoPFfctddUuPphDNAJoMEw4Bt+RcOIxpY2twczyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbIII7LkHSIJ+jBsBY90hLeDLvhRqg/HdFh2X9VlqWhXrvqiE5UMTh5W3C1+hv3EXSEjXKVAWUL1tUI6QRxy5yxqtbBpjsBCj1sIYvzAImnH9vuW7K6EPdTXFt/ypfSgpWnRBNAWs8niJeHQaFtHzA4/alacJVKrXf9W3bR5yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHg/k9FQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4HYEM1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHg/k9FQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4HYEM1U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45sUs173325
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=; b=JHg/k9FQQIxL6Zme
	V+B7tpU/dSampviXP3Opg6zIBx36OSrx+MAg/0p1StyQn/W/fspLPpxPxmwsc48p
	fwlqjaaRm2atIsx47QAvuty+lZur1dnYOczN6JY4qAu6RoVFzchuKjMWRkjy7JmD
	gdArz3Qh4zBpdN05SYsmhUUPTABl7z0Ju6VnFej9ugCwm7wHG9JbO3FML/vGvqjr
	D+CcrdHKkgLgw4NDWaG9tSl1P5Q6+b9iNnFFfmrwxvfxeXJjtkyyRtgBdk9cN1LQ
	ecRiAxDH3eYAgvWcqlZXDTcLJXk9V0tb1TX6APpTMraygQUxQuv9MYg9eO6aZ5e8
	Rvb4bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs5d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:08:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so37597785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882529; x=1792487329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=;
        b=d4HYEM1UrWdfPcAqNGS9KdlTQ0rXo+uwgP01kurB9LCaqP6HpwiE8dg7Np4k/WwWbK
         GwlM22zpnpmJLh29MgHeHz1axCFV1MZbe7elUQU9y8AkqnoNRFTQHxCxrFwOIdJyzoXH
         w4RyOfpQy0Dv7kEoXhmOwPxlljoatBoWKzs6MHGBCc17lXUQLhc4eAEA3wIDI1rV0qcf
         4P5ALBlzR0MdHOphY7/Epmel6u/qkJjRiub2D7mXmf8uc/NbW3vdRVd+MMC0JoJNSb9/
         AD1+a4VJGc8VU+RQeYWENInbuX3IThgYdWSY9Ymyjhcassk9jbmRHz363B0xN81RmwS1
         715A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882529; x=1792487329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=;
        b=cxBBDbIRy2s2+WtAx88TvW1E4LyecNnoaNnX7j4Dv31xmE2cf4C3L077kmblCmtmlJ
         a8gfx4Ggzgw9azeVx3pZlNmiNbZ337gWCyqnyoCcOzK7fXl66UZMBSstSOFgFGJDCgHn
         Yw0Yy5a2J4uNFzgqsgqKzaoc5/rhEOWD8E3zD2Qy9m1UG7ZcEXHLzhRQszbCNLZE7HgJ
         o1nFHDTeFcuplU6fMP1bmM36a7Exf511Mp+7Wg5dj1g373xXj00onKchUCc91W0bX0bQ
         p8jCW+nTZ+QViERQRTmT4EtN8gkcd90NlADpRSKnUA01nUiMMv0XO+PZ/0NTpFx2thE4
         oDyg==
X-Forwarded-Encrypted: i=1; AKwUvBxstJogwpuXxCdz3nqIhKpS1X9bIfgdawHybhY/EDdYLi/pLvZ7V2dMa0U2ZAyj9/KPke96mIoSNWwwpuyn@vger.kernel.org
X-Gm-Message-State: AFq9FYJXog84I77dP8kzwDfr7rCnp88O1LGHiwgAc6Wc4HfHJTuTv7JG
	ekMA/GNG992BnSXkLiFznIP7yh8e73sPJF7zaeLH9em5rceNsmIcbpuH6vp7iFKg4nKVM0TsYDQ
	C+OKvRY3SeTVMIwjT9NOT8cuU2zblf5jkqOIet4+CCMyDmo9AxLuRNBTtX9IdmXlvsLay
X-Gm-Gg: AYBFou0GO6X7nUj6RR8zggRLJ9J42ZF3ILk4OZ5ujWi97DrenTedNeagHNGlNIkucDY
	ME6jtdBmPenpSS2y58y2RlmjFCykrHRa/z5B/vDQeNmEXeQ7d8Y3dZoUjq54QkgBJssPg3ZKjGc
	eY/UfNdJN2nA1SDlKvVopgLM16RLTmfHDF0FWp2ohtRhuKQT0PxQMiYtGIlu4jRO4rm4kdJQOos
	anF/HNzXa9iD7juVvTO/y1MqtFYWW5n00fj3/+rLByQJbZkpI047DubeTqOGoDlbQKxna66GsZ8
	mgZwQ3DF+rgb3PqgHPshlNwG8Ss8OYWP1jkGNRfjY554NrAg25ChDFL4k6qyfpNwgms1aYpE4hV
	C90Q8fAH+2J8tW8uPvQUulA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2264363885a.5.1791882528706;
        Tue, 13 Oct 2026 02:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2264359285a.5.1791882527992;
        Tue, 13 Oct 2026 02:08:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1451esm268591366b.32.2026.10.13.02.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:08:47 -0700 (PDT)
Message-ID: <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6gWXL9HrvlIwEeD9TDz16bjeVVQngfh-
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdf521 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qJe4qTQoNDkUl2DoRwIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX61jI925o8bB2
 rkHnEMP2BfJUZ45WF+O4UnK0yAXSK3kyUlFl5JZTbxt3Fbs8MSLgymXwoT9DkyRVY/6HZjyUpeW
 +Euuh5auYke4eEu9X8h0N8CAWF2nOHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX84w5gD3e7KcU
 XsNFmccGVkZlYyIZywwY6JvKBX3GEeQpDk5XiYKITSV5Fxqup7jMdvempHJWJCW3sDuGsqU2xCb
 MZZ+ZEbKDf6lARzDnI9KTMdP9YtTVAzcF0SQs4L8pvLIBJhfc9fp2ZLxCkVlSmVQ5kllYJyYbxe
 q6T4xDvkLAyQ1x4JJabHtw1syQpm49HCJf7wUVIt7DNmW1DoDxmWNHvPGXZlq5nidR3KHzUS2Vq
 pGebtRXEssqRiMB6YNs8frN3v8FoUaeGiz/UmJr3G4wERaSB7bfU7h9IVRaFbMB56HlBrGZGuCg
 kWwGT1uvJzn/8p2q4RPtBfspRZ7oXOJOiSURV2+WMlvpeQVTqOSXKiDEcIDgY0QD0QxEEZrphYy
 wc6HyKmYQ4c0X+5fTjasoawxuMHYT42f/gowhhTpQPD7uFhdoXwHW0wQIf8JvuE/LZjxyOT19bz
 v+lisd5OZ6irce+qV8w==
X-Proofpoint-ORIG-GUID: 6gWXL9HrvlIwEeD9TDz16bjeVVQngfh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130036

On 10/5/26 5:29 PM, Maulik Shah wrote:
> To achieve SoC low power mode like chip rail power collapse (CxPC),
> the Monaco EVK board with four PMICs requires coordinated power-down of
> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
> collapse state is reserved for system-wide suspend (s2idle).
> 
> Add the system_suspend domain idle state, mark it with system-state,
> and reference it from the system power domain.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 539c9c80a808..b2978be6823d 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts

Why is this board-specific?

> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>  		};
>  	};
>  
> +	cpus {
> +		domain-idle-states {
> +			system_suspend: domain-suspend {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x4200C344>;

Please keep the hex numbers lowercase

Konrad

> +				entry-latency-us = <706562>;
> +				exit-latency-us = <706562>;
> +				min-residency-us = <709987>;
> +				system-state;
> +			};
> +		};
> +	};
> +
>  	dmic: audio-codec-0 {
>  		compatible = "dmic-codec";
>  		#sound-dai-cells = <0>;
> @@ -772,6 +785,10 @@ tpm@0 {
>  	};
>  };
>  
> +&system_pd {
> +	domain-idle-states = <&system_sleep>, <&system_suspend>;
> +};
> +
>  &tlmm {
>  	pcie0_default_state: pcie0-default-state {
>  		wake-pins {
> 
