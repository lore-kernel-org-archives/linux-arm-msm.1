Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237AB380FFB
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791518809; cv=none; b=nGxXsXd1dKNWkbhNtksOGh4Fx4oD8dSQEZnr87CkyEQZ9b1IzHvwuMEGoaz9awupKByISVFd3zMAZm+D/3DIf0JFDqlYlvYvJAKgGNX5C1NF1P4up54Wolnw6Jgg3tDHgwU8AA8FqF48Py4FyWDjSNptqnpSbvnGvIk5JkZCI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791518809; c=relaxed/simple;
	bh=XYtARoZqnpRp6pWQ0mD1w7dfGhDCmU8MYzR08TpKVbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrsIY9Hxsl4ukCFX0QEiV7BuVgB2jYGDYQhrXNau42mSzjvDDAaOrfjbKG6HW8L1pZjQRnbY4knJDoyZoTYANsMRKsGVttMFXuyTcul3bqGAsMsciWkTq0xwujxnmT/dqnRDIBzSZDdL+0HB4GxTBqTDwL/rBAb/3Eg5AW1Y9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeyisCkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fawYiSfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeyisCkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fawYiSfO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HRHn1089587
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0LWV9Ad6BmiCjtUVa4F5rZTvC987knzXRnL2tmi8kc=; b=EeyisCkwjoTDBjeR
	Cy/Fv43vFxWHfYx/BO5fBnjabBJ8IYLWTqnhKJEfBJRZYV1+DHZz1U7ctUxJ2nNq
	aV8A0HhvqpQq9L7vijg8S7kKX32s72dG7Sgj0YitoFtD7Jik/gZDbymPU7bQtMK6
	1cPEuRCyY8KAIkB/td8vrtB3Z91Zq+v/bh+mpB9K71isE+uByJcPbxLfkA+0y0OA
	iCHPMvDPqtBvDTZ8E7F3l6je5N+pUp+j3Vjqm1/LPy3ISkziZ6PzN1Sky3Xah518
	OyGgQDWU6Xw/QecxjFLcv2LA6SyOcY0+iG9NxGQNLF19Y6PRuRdMa8zCPJWoxiqz
	9lNsig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekva44x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:06:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so6962101a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791518799; x=1792123599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0LWV9Ad6BmiCjtUVa4F5rZTvC987knzXRnL2tmi8kc=;
        b=fawYiSfO9UJRRoV/8Lttyt9jCPq1FJwy+I1LW5B4FUXDh4Fjty8xBBG9g3oWwfYLoW
         L+LTMJ6ixzYEsKrWupbeq82omo1HF2NNIdMhnWOoe9qthV1kUCZjeD2zwBtMtiKiTGDn
         M2iUtUYakxEU1FvGlSsYB/WuthMQRfeRAeiKf+NYJMKbe/2/Wx+TcAh4JCUpjPHCwuzS
         3ne8RQvNYEfq5j5T/ZHQaG8cc/R9lwRbFF3ukuT+ShM6pchPlUyaa/KvDadc/+zwd1lJ
         EOeEI+2YYQdcv/G+JVqa9+xRyiGF1vRUe1Qr4Oq6My+VVtVKVAogr+eBWvKcAyFagqLZ
         HKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791518799; x=1792123599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0LWV9Ad6BmiCjtUVa4F5rZTvC987knzXRnL2tmi8kc=;
        b=sri26UvOJOZPWrlwPfiMGx5tR+Y618J7Q0/BBXo/Dn6chNZEFPXWYv/ynfP4b/hnzq
         Do2kV1gfrO7a7sz1mtxX4Z02FokHeAWPMkfV80HtENTWntjJ1I5OiUk4Ft6oH3iYxqHa
         t0VfFPtMNnlsJ5X0I4pERNiRTUyixk8unubwFOSZ94cN7ydH699aS0OzmZUyNMNIDyln
         pv790WlA+aYo3QunGCHFmI3w8HjlqJRsrOD9AWj8FngrTNXbPwiRUbbegR47O/zFbNua
         6PcszANc4PoSnOx8LY6hriz2wBo3C2FWDGLJfoF2KDXhDnG7BsdrxV8HaljYldG/sR0R
         JkWg==
X-Forwarded-Encrypted: i=1; AKwUvBx2fjW1zcLfQIpxsVK11RhypNBFFYCfHMHVPGM+yOYAE5rWqJYVBSDbZ3LKkp03Tg7A8Qd6gN+qdzEhNjlO@vger.kernel.org
X-Gm-Message-State: AFq9FYKlM4lNkyeMlydax50YUhp2O0jzlkVg9BGOdhUMDcqF4Nnplzdf
	uU+J4tG9NJkawmA1vt5R1BX7CrRn9BxaIME1wszBxQVyLO/8e3yaG3Z3PdcVcRLk88X7omEdnMq
	4sucduG4CBTY89P2FbDAR6mOOEJn53wWT9fz3fJffBsuQ0NKAQmGh+oI7OkeunrnAwGJ6
X-Gm-Gg: AYBFou02QeG0Uly1RE1B499F4rZwXtLGRFc3Apo4FRNHAIT0wA6fMfqLNqKNtqqShpr
	E1C5ufCqGQznUOCxZkNxeCoFh+Mal977oq9eYmolKiCQbELu2m7MzoNs1YmPjlKiHnX/QihnLTn
	Dc81hIR1k56zfGj+M5ClbAHxtjIbmp34WXzBZLx0Kypy2uGY8DAm9jNVcHz58kcycZVCCfZd69K
	JQmH/RLh3A9wi7E+Y4+yvXd8dmo7PSzT2CJ7vuDT/EubazY5+0zkmHaXfefJb44N7gvAMsRhaiB
	1aylREDNcGzQQqvwBEd2ZSL14bcsVXHK/X2TjJOJe77lgg9HE68KuFqUJpe8WBQ/sNAxz6prnoq
	+huqVjkpvuP7YWd0+MfLh8TYhswjtNXq+OyEhZqclEvLdlXMoNMPf1qcsHNVtbD8=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr662407a91.6.1791518798839;
        Thu, 08 Oct 2026 21:06:38 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr662396a91.6.1791518798366;
        Thu, 08 Oct 2026 21:06:38 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm1611384a91.13.2026.10.08.21.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 21:06:37 -0700 (PDT)
Message-ID: <d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:06:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/12] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-11-b2c583ef50e0@oss.qualcomm.com>
 <CAFEp6-1Voqn3yFse5t82UOX7MVafkhL466BkEDSLVRH8OK132g@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1Voqn3yFse5t82UOX7MVafkhL466BkEDSLVRH8OK132g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EXN514bw1aCGf7MgL4LeOb_x2vgsgcRw
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8684f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GUC6nXMZ9ruFzsaAOnwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX44ruReL9h9/a
 GdIz/uY0zzylE3vRDKCE1i37yP15vlgagxCNWq2sYdB7bWCze0mMjRCpm69X90GdhwDVPFlBFZt
 8mS/xmiXt4+3qGtxuqoyiLYEjhLbBx78RAB6ZK9wtF1avgcf1azQJjj3saRBLeqy6ytkNRoidPz
 3dBCvqPlTBhkZMPUBFjZrO47G2hFixVUgKxDgGIESr1tdgzdCOtOdMKb7+iVixrXWLgjT94SBJq
 F97lu2GiZqKS/yLYoulQHrTOjCmyEdWy/Dx8++wWWQXUamPtrvm9EF4GHhvYvL6oFethBx+Vke6
 ahMbkHxjgihp4Pzrlnky2txM6WP+Qx/VY0ZuD3ynRXSfOT3mw4M6fpjD+wvWmDL1M0lz1FuFTHS
 aWOsLDxvayxoykwq0PzkZRC3oGleOqURiBj0nTjwwC9CDLDXtakJ62bnXxwSPLKFEplw1zKWr19
 48bFAYVWTXf+fsaT+Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX2MBapdLVpTdr
 EnIunW9jtykAg6oqfwROH81PZRLNOwIIUtLjzaH092C9krU7MMVEZkRmjbAv/FnL2qkGeq9GarX
 eWVSxvVf+b6CmTm5MR6DYhGZHg5lNKY=
X-Proofpoint-GUID: EXN514bw1aCGf7MgL4LeOb_x2vgsgcRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090016

On 10/9/2026 12:16 AM, Loic Poulain wrote:
> On Thu, Oct 8, 2026 at 9:14 AM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
>>
>> The first bus has two CCI bus master pinouts:
>> cci_i2c_sda0 = gpio109
>> cci_i2c_scl0 = gpio110
>>
>> cci_i2c_sda1 = gpio111
>> cci_i2c_scl1 = gpio112
>>
>> The second bus has two CCI bus master pinouts:
>> cci_i2c_sda3 = gpio113
>> cci_i2c_scl3 = gpio114
>>
>> cci_i2c_sda4 = gpio107
>> cci_i2c_scl4 = gpio160
>>
>> The third bus has two CCI bus master pinouts:
>> cci_i2c_sda5 = gpio108
>> cci_i2c_scl5 = gpio149
>>
>> cci_i2c_sda6 = gpio115
>> cci_i2c_scl6 = gpio116
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
>>   1 file changed, 303 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 7e5106865e7e..710af0597aaa 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -3749,6 +3749,117 @@ port@5 {
>>                          };
>>                  };
>>
>> +               cci0: cci@941b000 {
>> +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
>> +                       reg = <0x0 0x0941b000 0x0 0x1000>;
>> +
>> +                       interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                                <&camcc CAM_CC_CCI_0_CLK>;
>> +                       clock-names = "ahb",
>> +                                     "cci";
>> +
>> +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +                       pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
>> +                       pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
>> +                       pinctrl-names = "default", "sleep";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       cci0_i2c0: i2c-bus@0 {
>> +                               reg = <0>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +
>> +                       cci0_i2c1: i2c-bus@1 {
>> +                               reg = <1>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +               };
>> +
>> +               cci1: cci@941c000 {
>> +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
>> +                       reg = <0x0 0x0941c000 0x0 0x1000>;
>> +
>> +                       interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                                <&camcc CAM_CC_CCI_1_CLK>;
>> +                       clock-names = "ahb",
>> +                                     "cci";
>> +
>> +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +                       pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
>> +                       pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
>> +                       pinctrl-names = "default", "sleep";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       cci1_i2c0: i2c-bus@0 {
>> +                               reg = <0>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +
>> +                       cci1_i2c1: i2c-bus@1 {
>> +                               reg = <1>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +               };
>> +
>> +               cci2: cci@941d000 {
>> +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
>> +                       reg = <0x0 0x0941d000 0x0 0x1000>;
>> +
>> +                       interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                                <&camcc CAM_CC_CCI_2_CLK>;
>> +                       clock-names = "ahb",
>> +                                     "cci";
>> +
>> +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +                       pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
>> +                       pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
>> +                       pinctrl-names = "default", "sleep";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       cci2_i2c0: i2c-bus@0 {
>> +                               reg = <0>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +
>> +                       cci2_i2c1: i2c-bus@1 {
>> +                               reg = <1>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +               };
>> +
>>                  csiphy0: phy@9523000 {
>>                          compatible = "qcom,kaanapali-csi2-phy";
>>                          reg = <0x0 0x09523000 0x0 0x2000>;
>> @@ -4459,6 +4570,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells = <2>;
>>                          wakeup-parent = <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins = "gpio110";
>> +                                       function = "cci_i2c_scl";
>> +                                       drive-strength = <2>;
>> +                                       bias-pull-up;
> 
> A general comment on the CCI DTS patches: why are the pull-ups enabled
> here (for SCL/SDA)? Do we expect boards to lack the external pull-ups
> required by I²C? If not, enabling the internal pull-ups seems
> unnecessary. Also, what is their effective resistance on these
> platforms? Aren't they typically too weak to meet the rise-time
> requirements of most I²C modes anyway?
> 

Thanks for pointing this out. The CCI buses are expected to have the
required external pull-up resistors on the board. In fact, the above 
properties follow the established Qualcomm CCI pinctrl configuration 
used by other chipsets and platforms, as well as the downstream 
Kaanapali DTS.

I checked the Kaanapali pinctrl driver. Its CCI GPIO groups do not 
define an i2c_pull_bit, so bias-pull-up would silently fall back to the
normal weak pull-up.

I will therefore change the CCI default states to bias-disable instead 
of relying on the internal pull-up. The required I2C pull-ups should be 
provided at board level; the existing sleep-state pull-down 
configuration will remain unchanged.

---
Best Regards,
Hangxiang

