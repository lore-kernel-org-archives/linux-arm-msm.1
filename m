Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632122;
	b=pDb9xD4nWqRMliGhcp0AS+U/vL6j4nXD0VRFW1RNTdkUq7dBTlbODbA8Dr7AFcBYdOrv
	 yvR5QrvqXmIYGlAQlrg7W/e/2t4PPOMYRRu2cvr2XaA1szvh2dwywd3Oj6KRV2vr4d+5T
	 +kg9KhrB0YZFpi/01xr24V/kAhwdlfwHoPuRuT2t5DGHcBgih/TwDIV3/b15b4Hz8ext0
	 JBlcnRYYMUDF62DHpqzjdyAbEX021KBn7RVhFJ8bM6AnBel4s7N//0NrySbuhtLb6fNIR
	 QkgHwrDiJtxX/qVz8EqIFa+z/mXP8xAF0D/kWOwuOEMU1lGkVUjsYQnbxKTjQFMfeAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
	b=BpacYuT4Hm31eq9jrXTgbAJIXNfwyF6oVDHz+iDtcvuLz0Wqvb2ZLe2t2n3uR/oiKDNr
	 Iun2AFhNgZ/gEGju0hW/no2kyfMN1y+nbHwWopVtd9cIv73eCAQjMoHIOhQNnAB1jkbwt
	 yxK7mgPoqOR7FRNLed9iYa2p+ihVrdz9LWdIFwa/Py4vceQxiNXb8xvXSKUzTovAvrrBK
	 HNQY49O5dqunAjEbPSghc0z2EZm+cSaCroX1IrmpryHvZE22EvdUgg/MWXN1EPpacavEq
	 ON+rvvV3wU+lLgEodvyJDmarrJaRD7G5qzQNdf5LDM2JsEcCd2S/4p955GrKICDdjkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070F608B7C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1070F608B7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpMwF845689
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=; b=edyVx3Rl/Gix/vp8
	fVxiwC8I5X3BwPxqEiE5qvO+NETSFY+0Ml2dTzswfYhKFjNYhxNmH1C/I8azYcy1
	ffEcu+eW6YjBGz1rC8vRPiXo1BHAcXRiS4I6dmjN52QwzAfpp4gnmGYQhY4f7RoQ
	2NEh6Oo7mzMD7aLUcT1gZr97osp7UsI7quWnE+frI62Z6cmG2Izv3/AMWWe6MgIN
	wnhZoykblMkEnP/rZKodILXFBezTdof0LkQ8JpMc9PGN9N78Cy/qBaNMOCGUaFkR
	5BxulQQmJL9p8OtiEbsirLW48LUyFc/vh02J0GJ98Kup6qkvlJfSvdbz9FMQLw9B
	tcYVag==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1t7cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:08:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so98117e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632119; x=1794236919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=X22ALmRmrQr/oD55jXdHNh0Az2uG+9BA4LWAkZe5KMi6g4ZK+ZE+KiMHDOAqsVuaIr
         8//EE69oar9gO0Zw4uZol777w7EwPXh+hhlwM+UPN09AvuKNtsEZ9Ddnj9b2Lz9kx6Zt
         JbeQYIB+8wS3I7IRyIl1EesbgdUKOxw5ApcbLFPkO7I0T0fIWVrapV4TIHExiaqD8a8L
         AU9r1UhUlEgK6eJAooHYk0zAOCVqX+aXreLaaTSqPFPnnOfTJZulgzbd4HTe4WmI866e
         PoKszrqRaIe9g9tekEFzlsk9JnXlmS30ou/qpDI54YE/dD59GaQKlcFxUEXOHFKjlCi6
         osbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632119; x=1794236919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=RS94Rfw2AlBhG4tmpetrf5C/W0nA4VGOCVXi102wiQN9FikwfC3X5MC6YHeemILAD0
         Klha6WtLTYBj1Z/T5dsmjpLDdbu6W+hhPaeFGuJn8vpX/SBwevpS5M8iZSv8xgbEFUwl
         IQ5xT1jUSSD0MhCqDh/gj5a9FhF+FKGUBuynjstafwBbhOzgPAXKgyCagCqvOUS7IJCb
         1aZ79J64dhT/1ZKDC2fiPx/WoP19tagI8yVz+tAd8YFdvfn6CRhi2Gf9veOCHan+64tC
         eSmwiz5AUy6qbxYSNL6Y4H7H+u6owftF7tAAZUqIVdUealls3ZeVEPCWNdc36iSaMzL8
         4EIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEDvHdXC8VRo7B46mIgLrnDLwwwx9U4kvpod9sBdWqdmoHz7WxglTAh2mwSL+e1NMYwKAFeYkCYD6DFO09@vger.kernel.org
X-Gm-Message-State: APuU4Z/QUl1cQ4zbcTEjbhSolZyYCjka/YegP722M7Js3LVmwG6BgAH3
	4ZEkUxS/T1/aNzbXRijbQYgi8Zlb1MS2GKNhtRJ0dC7L9Gfjl2F+fxN0Ax4CFeie4Y2/aMDbDAa
	bacF0fV7i03oIDLJmaoLA5AHfGfWwGbFiO8vapQgqY9U4WB3uEuvOTYsNsKIYdmlp/QHp
X-Gm-Gg: AYBFou2B7sYcY99XPpLqO/1UEjeA3W6dIex2MBLGVtUTQ6069SjbCu5LFzg9ua4xPdF
	zo/x3jP6bhtGGVoGPjiRnabRp8zcX+1N38k+D0DaEk+EUq/0uOlpRa5RrvQuxmbmwkXHEPXmXEc
	fba02wvHZQmNvZ93PfBeXm1Bw9qCpbUU0B5CwC2EWFNhgYWlTTG2Pk4anR1TGF3kq38scazemoi
	T5E1aY8sXxfOZc7NV6yuj10f1Twx2TfRXvvUKlamrivtd8kFhPw/7FvdRFYTmb6CK/8jAZWpbma
	sRW2eGHxlPIyccKJsX8sh1AG71ymc534K+niTmMgAgolzi+prwr8wcIIoPjNO/+28wRAwtao+Va
	apCQvIYBf3w6QT52dyRlEZilc8jy1umZgXtz1znNnGAjQ/epNtWuoFK1ocgcAAd4DzLfHHg==
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127809137.3.1793632119201;
        Mon, 02 Nov 2026 07:08:39 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127770137.3.1793632118576;
        Mon, 02 Nov 2026 07:08:38 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm444634a12.33.2026.11.02.07.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:08:37 -0800 (PST)
Message-ID: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:08:33 +0100
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2ZamU44lC1I2-I2bc1jYo1hEseZMHbF_
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8a778 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fjKjonZ3CYBpfGIA-1YA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX5gxMZTKtdMso
 kpuvThXHb52R1FUHX3Gvf9PKWacVvk/uoI2i1ryY1cn5ypezi/Jr1DGfTpa8Bw3cKGpkxbrNw0q
 2GRZ9c3xmuk4cNdmc/UMaJYn+o7KYHRKKNoPwEnmxJ94cBLRQu+oAuEev4bxXFyjK2OmZZtt0Pu
 Brs5EQ4iGwC75ekBk8Jbd1SZ7tX1a7A65ifde0HDbUiRk1nPjJem/SAHDzWr4Ed/tA5DEe1hUUH
 ReZMkU9COnnbhRXc9M/T6zb4K3078JuZhiO9UOIIcivITyaoVS0IWOjKbDapaQjVoZcHiSncUfA
 wopnTgDAcYB/w/72O3SpxDaU4/j170hK2NC8uD37nLsznjRaCUnC8sMK1BiSdQxByaGZBXWDYDG
 vfLpkOQ7D2xXJlL2wf0dXf7NWgiOTeZ7iZnYghL30qdFSeYT2HnaibfvpvX/hOKfP/pl3LCNGuq
 uomkqGBOm4mt2TCdkCA==
X-Proofpoint-GUID: 2ZamU44lC1I2-I2bc1jYo1hEseZMHbF_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX8P2chvtdpQA9
 riADOQEVDXy+dISa2oUevdI42rXZh0GYpfGGugRRsmKdacnOS9DqfqQAa4Ld4YM5LwLGIcqfgMX
 12FfBDwdT84y7P+NOplGfuffwpbO20A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On 10/29/26 11:57 AM, Taniya Das wrote:
> 
> 
> On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
>> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---

[...]

>>> +  assigned-clocks:
>>> +    maxItems: 1
>>> +    description: Parent clock phandle used to set the input frequency.
>>> +
>>> +  assigned-clock-rates:
>>> +    maxItems: 1
>>> +    description: |
>>> +      Rate for the parent clock in Hz.
>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>
>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>> Parent clock is outside of scope of this binding.
>>
> 
> Sure I will remove, but the parent clock input is a requirement of the
> Hardware and the output of this module entirely depends on the above
> ranges of frequencies mentioned and that is the reason to keep the rates
> specifically. I will capture it in the description and hope that should
> be fine.

So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
you added is defined as a 4-wide divider - do we need to limit that
divider's range, or would div=0b1111=xo/15 also work?

Konrad
