Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104FF41CB39
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163445; cv=none; b=fwYsIYWFfpmCjNFMbzvCmc9cRGzYTm+nemzIhSHy7JykQoQ7ojVtpOINzM/KwEH5mkEjnTz1f8W/L8plIhHR0M6gwqNYrEMtEqWQGUmYjggPMUj0CKY+N2+oTiNd58R0SXShdAt5W3OAVxG3Zhbaw4v5SP2DLDruNnxfZHsYY8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163445; c=relaxed/simple;
	bh=aysaIBfhsfH/53/b3b5L2k7CtH6Ze/FgJC2p7U7a0O0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEKn5CW+unT//GZzbcRu3YeWBM803CTMeE/E+BThvUyE9bo+Opo04DR39Utd5Vwz1q2BHFo8rsxNOaVt+7iDEKkS6iv6Nuzw0sNRTb1hIgAWz0lGLy0YFxMTU5pU9g19x68/PIISEKuyAhyPnfHJoEdgsnvi6K4XQst4srcTnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fauat5ty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1m1y+Me; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fauat5ty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1m1y+Me"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlSCd4065482
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXI1s8fy/K0Uud6u565tgUvsO9ZUQxqQPBr68g+t1Q8=; b=fauat5tyOcAR0brF
	kMCC4GO0f4t5e4lChXbKo/YKSt155kdALNb2z8VU8XFyJX/xj53KPyyLimyPuOMC
	e6v/EtZT10V1s/xhReZ2iGZ5BiWO4ms5Fj1erbY3sAnkp0ul/T5uYEFjPnRYVL00
	ov3aDh1O0geb7pulSesPcntV3AiSBSklmwzdbpjp79P48oRPPpn7+zh7TW2NrfEh
	7BuCzsc9mAmOVDrw1aNOQ6wnMX913CWbJEfk66XLX2ZJshA2muOnuDEkyfIh2aBg
	Iu/mnwKs1U6a0I8AdaRReSxiw8uTxd925Di5g9jYeFzkF4dd9DHcX2I53ksNfCl0
	HnFClw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysuy17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:43:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so6664471cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163434; x=1785768234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXI1s8fy/K0Uud6u565tgUvsO9ZUQxqQPBr68g+t1Q8=;
        b=G1m1y+MeLEZ0bO026yAmmxjIEDLh7MMK1wKknNb/7+jDZChhKJv1H2/f4M1Z0s+DhQ
         zeL3p2FJ/RTOJ0pXRfa3mH2rNm27CzDqewHv3fKgnCS0AQVDdos85N3SnXe2ut6W4rvX
         sRy65aMzvX1olyARJhk4DPZol+BkpnD5iS1lM+wbw5gr1FA183JJooOjW3mesO2g1ZF0
         YVCk2DpRmIw5lvMYLvgXrfSNKgb2ecGjbFkpyWebCEPARpGzwbvEJAR9D0WtW0seB5s2
         fwkL1cKx2RTrPgIM/eTFnjTuGX5cI/7zfN9Rgod701fHXE+cb4p7JCIhIi9IzcLXnxbs
         +o1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163434; x=1785768234;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXI1s8fy/K0Uud6u565tgUvsO9ZUQxqQPBr68g+t1Q8=;
        b=CgBLvnXYshtnisSWFf8WhJm3hCCqU0ua1OsaiXNeJZpRhcbCIsXTDXUrMOgdmELxdi
         Ezf05aM5LdRFpsXoKa6ICdfKV1mOscDFVAl+KiMDtatATeprg8so3DnANdIiFkRdBN/x
         Ew6yH6XSOrCbG6OypmvTv4+P10JsiytFZ4S2EqYYzCgsBz6PIZje7xS8LzUoH5NjWhmb
         rcUFxXZ7eJi2Moj56mSdTKi8KbkG+uhXAtxFrWnOqbCY55wuUL97rb5wRYG1rswBgqJs
         /DyaA9lT5zTFfvx7ZBBz0FVxDs0N3uYnrIlV7jB0bPMHECikPxDZetSph8OJoSi3RspB
         lXVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHE+yMlY1Ybl2fXfUvdCF7ku41eflIazO0z6S4y6McTDf173mi27GiEN1VNl82kEjzUL/sY1WxUWC2E7oh@vger.kernel.org
X-Gm-Message-State: AOJu0YwWwadeyT5um1fzv4Uj6a6ElQnliquH7gUBNMpfTLqOs23lMxO1
	4WWNtsORtz5COEFb/crFj0GFQaGz9xKKbVWiyN/lumGg1z1zYd9XOP3j1Ro+sSsHJJi7tvZbGXQ
	ruW8rkgS5oZUJbIDj8rZvq9Fz5yTaeh77SmaZgyCFm/MBay0gB3fLT83Ny1nAWJ9HzxHh
X-Gm-Gg: AR+sD10J4Z2+KdNUG+U0TReJ5jGnWRNxzye7fC52bovyKaXxucrXwxxkaTmNLghgVUr
	wn1wUUUgqaF9zXAX6/XPOSWdjt6C6pnQpfw1YVku6GaPKPn7u5E/FADrMFRw5O4zBdcoOEizfk/
	rCx8ITTmyUkFfEC9sRXcDl65HHoMu8sgLPIKSP/VkGgNk1Dj7rN1SmYjqRfETNVuIUQU0nBXn8t
	KtDH8h7/z9rKpX4SaNvH9mThep0IvZYW61ZJouVg7GxgJ8Hysk9O0bt4GyqnlE+5+MGBciDDW6M
	VM+Qh8z7U3lm8dG3RCBOSZd3snVdJHmze7+wN+TIAHOe9ybDNLZaJyU18GKGufS1EwHxb4NTW4z
	emsp1+DDrP1xI0xvzUgzkyatY
X-Received: by 2002:ac8:5d91:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-529cfcfc48bmr4054751cf.1.1785163433655;
        Mon, 27 Jul 2026 07:43:53 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-529cfcfc48bmr4054431cf.1.1785163433108;
        Mon, 27 Jul 2026 07:43:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f85a1sm1505560e87.71.2026.07.27.07.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:43:52 -0700 (PDT)
Message-ID: <274b0878-3b12-459a-8b0f-350d51347ac0@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
 <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX4hLly0+6Tg/l
 q/0HFsdZqHzYadmISjC9q+s2yohwiFffHFWqyTjqqpab/CHHki8y09RV+zSa4eEz5/j8aCZkfgf
 3xZcoO6foaTLjm2vxkyxSDT2giHHt8tv8RoNTWcJ30po4ast2v4FXY0Fyv2ZQQsLmq/XBSfr7fK
 jt00qMSI1Iv+ivdnQFlgmU39D3r+6oYvB0SDp1MglesN3Se/vPQc3QBOAW818+u/XdlYPWQ5jie
 1SEZPlJSb14ywEc50H8MI1yBh5WX7Up5feYeRdv1VUE1cAHzTCme64NVGMofdoTO6/793ru9k4N
 +BZPHwlfysd3vCEwDhxxyPkiF8ukFEsqAECnWeCdnJdzaVzsSn38iPFla80SxOpbf6c44CU65CE
 teXfi/GkAIL/8P4vS+ojG6JmyNvQ7CAbGSTM3h9IRNPFQ3lYFCECl1BbZ/1EJTFm2nvA8d6DMTa
 MGZaDr/QPsWd3N8jsnw==
X-Proofpoint-GUID: V9qBRItze78lFZNrFbvnaovKhm98pQ0B
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a676eaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PEHb05Std4Rk9fo0wakA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX9Rkw9OBjPd0j
 e5Uy7EerVWnYDY6Kmi/CzLVfa5KHoQo7lkpeKuKZnMNxwK4PFcThl15uXkehqoByTVAeMnXa7vn
 c2cLljsf9i0mGg69PbdHAUqmZHkZWis=
X-Proofpoint-ORIG-GUID: V9qBRItze78lFZNrFbvnaovKhm98pQ0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/27/26 4:16 PM, Wei Deng wrote:
> The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

[...]

> @@ -644,6 +701,12 @@ &pcie1_phy {
>  &pcieport0 {
>  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	port {
> +		pcieport0_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};

This should be defined in the SoC DTSI.

>  };
>  
>  &pcieport1 {
> @@ -923,3 +986,13 @@ &usb_2_hsphy {
>  
>  	status = "okay";
>  };
> +
> +&uart2 {
> +	status = "okay";
> +
> +	port {
> +		uart2_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};

On a second thought, it would be logical to move this over there
as well

Konrad
