Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500D478E47
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328302; cv=none; b=nO51Hq9sMmqK+mc/HUT1KyD1rM5Goa18mgeWWxffABLsvg5pvSPG1W2kFiX+igvtEsPY51ZgxVZGBtvO78TcFuLHrBtj4jcq1TrabIphVVUApqZviIaORtWS2vnA6fhZIZBKv4gmoEnSW29hnCGKIbqKMx4sOT6RitR6RjuA8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328302; c=relaxed/simple;
	bh=K7JENK6sa1LbpG3FYRwucrEeQvC/xIG5ldJRqbSaYOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFgPaE89Q4dkTWA59BSteTa1nj/vAFMo5ucGOt/DOWPKUaoyCouHL/rC+9HSqpCgWvt04rAAGS9idpfEW0xw/y0R9KBx6mGB9xL3T6a6a+VOnKJaZo3HL4aZz+ZYQw+W1nflSKTGque0IKkY9qf0WhO4G/8gIc9okaX4S3x442w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oimkaaSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8pzdW9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oimkaaSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8pzdW9V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXLgf1847303
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxiDiTYlOyIpoH+2VCVs4iz6grC8x089+hk593hC4o0=; b=oimkaaSGYveBTVoV
	NF53THaowvNxWrC4+ahInrr7lPlHlaj2dt7cdHXh7yQsp1anuipsBiiZWGgZX1nE
	OzbVZWbolbrK9WZkD8MNuOBZO2Npe+0CFnB9aHJcI5np66pCARahSPetP6v1qmKy
	rG5YMf3XA+vKy9BD8ld89TYf2fuQ/tknyCnhWum5lbwhaYTmy9hl8JbCX26RPQLe
	jXCIPhHupJLakuDls2Oel/5ZvE63fRaO2S2bV+SiCnXTpcnM+y8zNtRYszmCX/3n
	8sgpZ1Vj96aQLGfc4dmc+1tWcjmIU2zLWP4UEImOefuNI86dSxG1WGs8/09K+Wgt
	cjEmBg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcg7bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:31:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73997bfbbdcso10039137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328292; x=1785933092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxiDiTYlOyIpoH+2VCVs4iz6grC8x089+hk593hC4o0=;
        b=f8pzdW9V2f1amQtrgm362KNmOSxSGhPbcOynvBNqehkSQguSJXiSB3RJqNmjjG9Tsj
         kAT/5bdDOzFKpZ6RN+SA9CUPOEcSnOrjR1EiuoAO/UnIrkOY6+EWpt7lRfw16zrrTYWy
         g+Urrc6pg1MRe3UJY5IF71wfRheFuAad/RGUuVr3gCdi4I66eMFoPpVd4dvZBy15hc33
         A1nzQDN2V4+I6aO27L+zWpQwoPltBW0kf2HnpRpZQM8jXPcc1os+RxkZkZUnYchKY8c0
         81y8ldYTWKUSrp3u+XdamC4h7ClN/nPKRiuC6kxH36QU/Nv8nNOLCnqq6BlyrWu1/bIz
         XW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328292; x=1785933092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxiDiTYlOyIpoH+2VCVs4iz6grC8x089+hk593hC4o0=;
        b=IsLg2OLNM3d3lc9BvD+/Luiuhm7Mvzio1leg2CRn7pMdEj4hZJHZFiG8qbcOlbwZMS
         3SnJD2muwUiAGFc1txBuW26N8Cmb7UiQzpiyzlAp79M9ZAiuICLl3zwnlxEX8lT5UN2Q
         Yp/S3zskYzMazI31dMDzZsKW9vRctmwo0FRSJTn4+4UY0voOQs2htR5H4Qcw2YvSHUu4
         64e2B28gegMBv30YLNj5rWOTmApgYpkPaSpzK5JCxM1Cm08i3/jV+s2ICnriw1XGQexf
         Fxghjn5Rc0dkZPSw1gXRnvmuOiJCTwrlJ+jWpfrD8+74FQzjs8gB0DVoXkRGwnM9klRs
         K4bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbKMQE7WN8TCd2vabNsdcqHsbzntm0iNHViWTZIBhQdFghxOI6eWZjCnj7x6gjKV0S7SyVyEOnLAYA9Ntg@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnwxygeG2PsZtJqv7OsyHA2sYa9aKvyKPZA54DT4Vw8YNGn+a
	Ajm+/hpM4JnIpCgs4HtJ4W+X5pWsHCvH63IbJfOJCBW1bulFW3nrhjny4ttAQ9bbz52HW3UkXG9
	tRx+sPnp2Nbx9Kise+FJ2zGLAQ4zG64xVyd1SiMMHhGhDRCDSoYR1XBN+wM7JYWNOKSD+
X-Gm-Gg: AR+sD13Xcw3Ly8XOzFaL3YtTmNk3SIhMTuHmIlNdrSjT98zwp1F1Db8qBuJpyq90cy/
	+QAPyuICWJ1+7+nDR6j2AGmj2EbJmpNBzBLhGPREDUy2u63M3IAQ+pb86WEnmvkfPnMpw0j1yVO
	h1VJWE7FzUsHHexnOZ+NGJmfGVodqfnhegDpCEqPiLO6yo1UYzsUKPIEJ2f55rnTYgaBWnSWXaq
	S4sS/0/bjDY6zE/rS+1GNJV/DTqYe5vwUARNoythFjrg5+r3WEr3QhuovAC1nHahwLEsFn6Wvi+
	m9cFBQlGkeOD3h9qd64nxVaturHrCLWlMNgPzRqtkW9Nj2p3JfkhjoHMKxAngOXtBvkej5Hx95a
	hSdHvMNh5Bl6gn7LuNki0xZl7
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1357764137.3.1785328291634;
        Wed, 29 Jul 2026 05:31:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1357686137.3.1785328290927;
        Wed, 29 Jul 2026 05:31:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cde9cbsm109495366b.16.2026.07.29.05.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:31:30 -0700 (PDT)
Message-ID: <794424df-4714-43a4-b4b8-e960998ad1f1@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
To: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-6-2d100f30e202@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-6-2d100f30e202@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2ed9I1uxpJZ22D6KM9SzQ3wuJPJXqIyG
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a69f2a4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iMgkBSKgpprIcW5G8oEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 2ed9I1uxpJZ22D6KM9SzQ3wuJPJXqIyG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfXwdgXiKz9lBxp
 E14L2FFvSpEfcD2TYgRPKQYh0CyJvMeie/mqBugHNssGwK5r2Ov7GDBCYjF67kApVBZ2PwJGFk6
 L1FQTuWQwsJqU0oVYxuFDQgJkwyP/nE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX19SLRIXMemSm
 2NrUoDcfaXgcapc5jzQHORohb6804E3fm6btzUcvZUISOjKnOyghW5lMWEI7ahx8jv7JTBcweAT
 dofSksc3gfvE/D7hgw3Zp57FE8vBH4Qbmnrax6xr5e7ZBNbzg06u3Hlx5tpinxKHSqOvtAEAZvZ
 /IDIXedbE4PeHXhUruwfg2bld1Ahh16Uof+7qhkxzpER/6AF4Fi3ae8RCcalPjppxOEbp5l6Bpv
 Q67Z9RQ6/F0Pkq9T35C9OcujjuInM2RvPt9TxpWdwhU4cepUpw9IxFvdxSn+m6t+vrj3u3Uz1Uv
 0u1Z/Iel2eHju7ev/j2KsicSz8QxILvncTakhFWsSNlTM+8xnBpT5k+tGjFzmvo35ftBWygO+WI
 ILM0qWh+pI/Sti1CqQuHfBAFkM4THLic8nUhtE9jjr1xvDm0/X1UMDR3Iayaz6lEyn5lZmosSIf
 sGGrxq+M3A59E1upGcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290104

On 7/27/26 5:45 PM, Rahul Samana wrote:
> The reworked RB3 Gen 2 Industrial mezzanine keeps the common Industrial
> mezzanine hardware description but routes QCC2072 Bluetooth over UART4
> instead of the default Bluetooth-over-USB path.
> 
> Build this variant by applying the common Industrial mezzanine overlay
> first, followed by the BT UART overlay. The overlay models the M.2 E-key
> connector graph endpoints for PCIe and UART, and disables the on-board
> WCN6750 PMU and UART7 path so the M.2 QCC2072 Bluetooth controller can be
> used instead.

So is the onboard module disabled? Can we not just use two in parallel?

[...]

> +&pcie0_m2_e {
> +	port {
> +		pcie0_m2_e_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};
> +};
> +
> +&uart4 {
> +	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
> +		    <&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
> +
> +	status = "okay";
> +
> +	port {
> +		uart4_m2_e_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};

Let's define both PCIe and UART endpoint sin the SoC DTSI. And don't
mention "m2" in their labels.

Just pcie0_port0_ep and uart4_ep respectively.

Konrad
