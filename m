Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421642;
	b=EB/NO+xTk9EA4mRazfFVbR8MXLV5JUY7x72PG437yQvV/rn6OEbe8Nt/d1txCi1A0XOO
	 1nF67I0irYB9bXg7SdE9BfL92isuN8PfMWguQOG75HFNVjMJNnczEfQUksZROFbuAB8tK
	 MhTz3VyMP4f4u9RZMlh+pDSS75s5xrN3peiv7uCTtpGw4JDqNI9XQ1QBoPyUBVL6Z1wEl
	 sbkSHSGGX8zhl/2gsNRrgaHimZmX++EVW6XxUAn5ePY1iz7u750FOPtJxkORMZTq4YZ7x
	 bYs+8ZThm6HR2yYjnlNsZ/6YZfEf1N6yhm4J5FMBRQWwqSKexq0VSL3AUXgengOE1Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421642;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
	b=lXh9w/uRv6kSdpXSj0VaR5lYmDkwJpCiSrw213gDNb8SPU7Tclzk3lG6M+fCeZD/2kMp
	 6RsNw3303HACvUsU6mjz5LowQVCQSVt/apNjS1CuYN6O7TRurcRzOzB3ixFpUtM7ltKFQ
	 xDRbrUV4rSE/cXSuFRMJFkYn9Dd0xWcCvoh1zmh15wNSZOltrm4B5rVI28TIm38hCiYVW
	 0hsYz0ferynaJYymVRc+NqNkD/YGwTPsGgF0wWCl/ENym9xwejCyGdcw8VFnrYCNxx065
	 QLL1wm0KqggBJHzHpHVtSdS7idShRSN7Wp9nYcRYtdxoQtBiL6/WwmVfefsIkNEsQBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E14606C172
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009F3F8891
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421641; cv=none; b=WBJqNv6GK6xtc/i2ufoXKJCL7da6fHHE8u64qb0aX9e84psNogfT3EZC//aoStbv58yaCwtTqYvioiDHdGn1yR+JfHIWtWkmNroMdxIZ07WyloApl2pjsQuunJltDmMOgI5OCx589oleTLj4410jWkhruuVwOfLnUv12S9BGaBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421641; c=relaxed/simple;
	bh=iTgrOGbnyKTihKA/yOPRSWcSu2GJAEs2AInH7inLQ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnG2c5AOmY0TazzyP6qNgObfn9XbbfoacJW3A8h8jP+gNYbGDC36buW/AR7jLBZISlQGJagNRh0mS3t+PMroiWIlu6vobK2OLzdBAVRVef7el1JRFGGOcfGQ0QMx8KLGBnQczlReEIT+RQmKW3tqDxzXsNMz/uiWKqr02EDo6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDzs1drh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbjU3ILD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0J2s3487789
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=; b=JDzs1drhI+XmFFj7
	A4+OLzDU4EJ3oOZ9o/jS+ZurSZEMV8nm3p4AfKzDQwCSY9Ifcb307NYxWEV/ov8E
	F5cITVq1QE0dPN2paRQMgTBlOlAgYDG4OtcZ7J7wz29LDE6muDYl6QYKT2K2k5vz
	BfrrBy4xTwNvRWgmIpFmrSPRspLtq9eLPOsLEHZH6YjOzqqA9JA/O6WFssI4xJZ/
	aE66fi/08ND7CQ+y3z7ihVJw0ZNoNATb0D041Mydw0qX9ydRXxHUilr2rEgpKbTW
	18n7TedrdF4IbsulGl39gtRf9kA0TGUvLI+kgfFOJsmx4+3c6zrSf7l1DqpTQ9cA
	Ah7IhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hqay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso55349185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421639; x=1793026439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=NbjU3ILDHlf5KyCKvu+uEQ4Aq5ydAfBKqaufzI0ZRGqzOmlZaJ1CyNGI9rjlDYLGmH
         kNyp+hefIgBJaP2lTxucXLc9rB0Hb7H8YcsYkpfRJcg/AR/Zz/w6w97jAaIYA3OB28jy
         nuWa0bznfnxCAkukFe0yqkliSTGSyzeNkO/ekIAwz4VL56b5OCes0k8H6nPe7Q9dS+pr
         JOnUXG50aFNHaY+z+IHpZAycKunvQGH7Sg/i8nnQ+e2YTryl4DvDvsDYpqj4Is3RecOB
         uxrJabFMXY+bTE71aiUDcC2ijw6F+LOvfDhnRO5VPAmD/6ArMbB8pX+xEMssnR32Qxuv
         6WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421639; x=1793026439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=q9j4xnwWDMdmsI/528UrzKwcamFXWNJIKH5mwND7wasn5wMDv0NaMp0OKMp3Jo6gBF
         Hij6gYkdDR+jKQfmCUy2O74Bgak5RtMQ7MBSQAyUk3G9wdrkDD+CyOfbd3Q8LX4VfTvX
         q2313ntMDsrm804G/WqKLtYdaCAgU0mV3uVAkmZ0vjinGEIcUGy2+Fo31MH4kG60zmAo
         TcjiiDOALFqf5PkvsPYnk5FOE2dOu6XhNj9XfoXIUI5JBpVrW0qVgFCFLVPpGWIfX2/M
         VCcsic1m8+h0CI3x8EXueJl2VUI7o7co4qP1qRO7hPAzRguYvupMaSPxoHwJR92emosp
         nFQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQvfpMp4agysUib6xAhx6QyEHqUDboOA+obPMhI2pjQ2BD+IR4RE+48hWr7XOuIadntwbBBSpNLsFcfCMz@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3QJ6AbnjQsZWbgq9HlBZR9TBCbSzXLPPO1OMbsktUsSv6DBJt
	t/MKeYnmJpfA4Tw2cOUVzuMT/qQCC7eUjDvzvfEevFOQLwc4Ur7dHzO6Tn2a/Ce8Scsu2+84Oi7
	PBPeLu0+YGCBZ0lG79rs7vmEjoNLZ5jYORJx96M/LTzLAzzqpiiR0JeElJf6Qf+A/MFM8
X-Gm-Gg: AYBFou2zuQDyuCsnXoSmSiZgT7rtdina9aAK+xTDDxl5c7t/T0XaTOlPnd4Iz0Vfdhp
	+gvRHd+9+ykcGCJv2oNufv+7g/bn8sTtr2ormE8/T2mYaEmdau1rkRLiXt+UZbcteZMqeJaYBP1
	wwrbdoz5fj6x5W/oRnqaGWGzDJtTQmV9iodMniTnkLuhD6MhMXINgv/dp39TBNM8rPwSUX2qkqR
	wmZ6eSRCPim9drR3QTaZYUHvuxE1rm9ofVLI9mK0DnoVBYZQkt7qhYUx7muW/3oVZT3OCjaw/W/
	B4KhTv68JpyNQ9bwaP/D7w/xQUCAivTlSqQmls2oyHxHoW/+AfAwGzqIZdUh65k4u2flmIB5DpG
	ECe9ijXRKQdrcsAsOgIDo9g==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529444885a.3.1792421638710;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529439185a.3.1792421638223;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c7ff2sm4047490a12.19.2026.10.19.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:57 -0700 (PDT)
Message-ID: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:54 +0200
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
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX60XJkBTKpNqF
 gpMolHyESQKMO0zSjOKsd9utnggT7vzI8dUs5lugluTFdfVNcE34nS06/H4m4Wr3uvp3l+xbuME
 1FaM+dNlSgqTpXivXgWzyfrUSo82o9LNg7FyDLhUARSG1ZsH/cOzZCscJ9ON1dl1IInrlyOBzqu
 u7O+0URE4nOsXrDaBAHC+ELjOEewtBlxC723q1pka+cT1d7qrB4tfbQpobN8SBEVMBk+jO6RTm9
 9BehwY+PIuuF16uxShed+miiQbDPSw/8Ch0Rqx28Ej9TDrCkcQPE9Hc5OocAsLwGmYw/ZL+Rmyf
 QAKXXQhTJyA/lh0lGexz2EqcWBvuOSHBBEwJCn4ilH+oYL3rm2bCna1sbnVAkd0U8b1qTgclSbf
 lbIa76V8Ki/cw83TFH7DSZXBrXl0SlgFDrEcF8x+XvZN2ujLB/q2F9/y6Dvz2M4lG9bOLWHrJ87
 l1cONLLVMpD/fnwAkDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8bygkdv/xfDe
 T6rfv3bA64arvyMpqW9TZBhAVl5fwf8Fnu8S2wt50WpRNjIdTGrp6pSI1R9Q9tvY4OTq9b3M841
 hlADrQafa2xrAzOsMOugZnZ9cQFb3Wk=
X-Proofpoint-ORIG-GUID: bMcgeqNcLW0qZpYhWtD22UfgFGlw7qdP
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad62f07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=55-3qADWK09jOtsAc_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bMcgeqNcLW0qZpYhWtD22UfgFGlw7qdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 1e02578e4ee3..4809b3d8cfe2 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		sensor@4700 {
> +			compatible = "qcom,smb2370-bcl";

Like on Hamoa, why just one instance?

Konrad

> +			reg = <0x4700>;
> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2370-eusb2-repeater";
>  			reg = <0xfd00>;
> 
