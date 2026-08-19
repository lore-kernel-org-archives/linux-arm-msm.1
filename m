Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12512DEA98
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143373; cv=none; b=YDcLuaEjEZ0QWniQMVNZU7GORE8Px3HCIy85Q56VwinWzHQ6eh+59oIYaWEjea36lrFWYREVfN81vLohIQQx7HZP15JgF1I11Sz51/VUN7mSS8KixJAc1npnhf7RElMygJ1FjE8iCObE+ZdZw375ZvNPPV1Se4VTomw3PcOw75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143373; c=relaxed/simple;
	bh=X2PpSaRXlaE29+KXi6u4ZM+bH6zXSM4DRiQS/6Qia0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nq87sRyLbLBQ+rn5XB4sxTSpgdpBwUx+wOPbf6cv8IF8aCmIkzu+nHnSznF21I/urQUMq10zJieRAO746ye8+4h7KqyoKvv+QCFdZc5Lr7HnjDy6WgP3BlalD7MEPyCBddOBc/D7zf6wSbzJJpsXhNlAj6xL8lHNiuLtANVm88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoXhZkte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5KLm9gt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoXhZkte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5KLm9gt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7npX2947157
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wb1aqGA6H166eXI5vYkBIGxwFUHLiMbIF8k8+XA1tQ=; b=HoXhZkteYA2szGCs
	k1YcP0ZJ6i4xdu8jnKk+nEMzV0vOaG6Xh8RL2lLhXZ5DydYaq1UnnW6Y16OYkxRu
	nFzFbobPdDt+JuFVN26GX6oiow28immWOstiXWkm36nKzrN2ZyXVAeAO+A6j7XZc
	nqvgKpOBudqMaPrKGda/DFRStYt1G1FRVq68W3fWxEG6kTbnTYnix9Iq1DsHLQub
	p0zDBnUCW4ezVFlgMGbqICfZXl41Sh8tiUUQMXVQEkLwYN1WYC6YWbr63mK1fXyy
	oEXTDEqchx3G4XuKpXnBkZuuXFq3lBudj+ME6Nw5Cq6XhyjslrV5zVsdtRfvErKM
	oy2uwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb8ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:42:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so1938641cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143370; x=1787748170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Wb1aqGA6H166eXI5vYkBIGxwFUHLiMbIF8k8+XA1tQ=;
        b=O5KLm9gt+AiHWFhSV4Uszy5uKE+g2cBsiUk8zaH76jgkZSIFEX8RkhEXY3asD8E+K5
         S0zj8TNGuE8zTMMvPu6s7Qjp+6brjm97uRoDwclEznnsILDT9lJQ7OJuYLMe222eqebC
         tnfXO+mn6FGCdaTTAEXhsTmRBF0HuL7NbiBsRcr7XprRRJmKGGLdEqgrMB6iKGbxSgeg
         wMuecbHnOkXflHOs2qwm4y8mOaTIPUzcrM7Jr7gbC0z0i/YC3eebzvRtteAriNnjWywO
         v8tjnULJMp7Y8DtSKIHRyaf01j/oQak8gCHG1lBwtPTR3kXBr72aPMQnWS98aPqw80j4
         Frmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143370; x=1787748170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wb1aqGA6H166eXI5vYkBIGxwFUHLiMbIF8k8+XA1tQ=;
        b=Ez5Jt5F9z3vD31jJcLsoLECllobieaBBgpqN0ZPwZSC85UYgZyM9RomM02/YrTQ/0n
         1FDst3HvsMN2BgxAzWNjdH979ujOr1/dOjQN1AnTqP7gHWZigcNlbshx4LGMQuWsym7R
         gPI/n4j3fgCLRjZpVaEHzCouC0g8CXpzd9lRZ+AOhUVVOSqWx+ttz8uxZk6Opct5M1gb
         lvfYZxZxqle60fycVnq+tHPPLXc/BryLz9mp7B8M7VZ2rC7qTtvoo7n60oIFhN+B/yNd
         NLEOUv/i6ERcI5hCD1SIzalA6ni+cAJxxfSMrZwk/GnDiUQj6TD47zdnXpWKRG39tOZh
         WyJQ==
X-Gm-Message-State: AOJu0Yx7uZxiRgOvg3GlF8eXe5A8OJOV36v2ALrChLLqb/E2ZcQ0/RYQ
	yM5fY42SEGfo0O/qA+q+ftKwd+8vnAslF1hnQyyIn1xslnxmt6kF4pmqiN9kjgr+7WvcTsJs7SX
	5XMIqGVQUD46e/0jVpm0+ll5QfdsUSDCQAWem0TUni/qGlqrvIS2dzC23SB/ZyadSxUw3
X-Gm-Gg: AR+sD11kMYJubEr4srL8b6cNzUc8SJoD1u7fJ9dH531hSaHy6dl27cj86NWLo2Qd7f0
	2LFUlfXrnui+dR1adJBGmHVnBlBQJLODvWmEaB+UAxSuTRIKD/pnsGjuiQgU6DeEttnxHIGym72
	I5JOz4hCCwmUMa902weqOdld4KPSyR4vHOkWfka0Z6m8m4fUhkO64/7CCgta2sGDbKTYbbvp9Jj
	LA3YWLoAGcPvqVShuXapgruRDvlqYIj/YPaYYq70xVkSFeSwmMOH6bKfoDMw3Z2bPTBPRSgJh/x
	oxwJeNtEnsYar6qfQrRXdQNol2y80aGY6gnm1ySky0+NKpEV1ZeJadJde/1hy7cEfdrgHfC/V90
	xxu9LBc7R6SSIsRjWYlurLN7R
X-Received: by 2002:ac8:5d08:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52dd5cf7f84mr29311751cf.4.1787143369691;
        Wed, 19 Aug 2026 05:42:49 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52dd5cf7f84mr29311281cf.4.1787143369148;
        Wed, 19 Aug 2026 05:42:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38c2fdsm67072866b.45.2026.08.19.05.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:42:48 -0700 (PDT)
Message-ID: <ba2cd714-3da5-41ab-ae17-522d84f9d1c4@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5018: Enable MDIO buses and
 add ethernet PHY
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
 <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85a4ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yv-Pc3QK0v4PSjaF5QAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX3VGqjHhBpnRa
 uLBdP55VNp941ZPoo5Bt4cp4B4dMjEb258cnh831wAVZ/8HIMzC7D/8fUiwp5wyJuaGdDh38V15
 FvnLJwh7ivW8hYBBjVwpQvj5s/xKwMdcyDsmX0pVSxSRojoNEjc6A9RCpLeDaD6oyIokz6dlFmm
 JiRKt82t4ITHcTZMJnuV13kJDYqc6HLX7U5qFw7FDWDH6TI8fjZeJAun5+BsQLUjTcbXg/Vuhnj
 rKpOgsTsw82lPDcphz3tJCt4PXYOhMTjhxExLwkb7moA0UUbKxrcw+0S4O8lk6C9Bkn7I6fFPwk
 Y2NqUenVjO3Y0F/srjo3ckXbRU0VJxIEYDa5xDzRDIjMMXzUkvWMtdKGbf+DufwusCFxK9rMlFR
 O8r7Td8e3Sg92AIzscWixulb9OCRAEtenGyAKfbcUbb7c+WPeF4z4i+4DXZECuc26rQaUeVlDC/
 2WyLHVk0xiXmLWUMh8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OCBTYWx0ZWRfX0n/9xe/x2ocs
 NIJkA3JzpQ3OrOiv4Fm6CHywfOr3eHp5tCOf9OuT887u7EhSfxHDNHVGjqTKk49S/SmDcSnAnut
 0QvjP8LmY3Xc0D3e9DbuEbdIQYmLHAM=
X-Proofpoint-GUID: Du7UNBW3lte858HGM6CQgz15o1E-RAPF
X-Proofpoint-ORIG-GUID: Du7UNBW3lte858HGM6CQgz15o1E-RAPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190098

On 8/14/26 4:22 PM, Luo Jie wrote:
> Both the internal (mdio0) and external (mdio1) MDIO buses are present
> in the SoC dtsi but left disabled at the board level, so the board
> currently has no way to talk to PHYs on either bus.
> 
> The RDP432-c2 board uses the SoC-integrated EPHY on mdio0 and an
> external QCA8081 PHY on mdio1 for its Ethernet connections. Enable
> mdio0 and mdio1 with a 6.25MHz MDIO clock, and describe the QCA8081
> PHY at address 0x1c on mdio1.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 33eef92b19b1..aed8359b1931 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -30,6 +30,20 @@ &blsp1_uart1 {
>  	status = "okay";
>  };
>  
> +&mdio0 {
> +	clock-frequency = <6250000>;
> +	status = "okay";

If the phy is integrated as part of the SoC, is there a reason to
not enable this bus by default for all boards?

> +};
> +
> +&mdio1 {
> +	clock-frequency = <6250000>;
> +	status = "okay";

Nit: a newline before status would be neat

> +
> +	ethernet-phy@1c {

No compatible string and other properties?

Konrad
