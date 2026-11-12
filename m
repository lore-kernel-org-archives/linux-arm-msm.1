Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491285;
	b=GcJ4N5yTpoF+tklpJ5jAm+EHTn6IszkddUaAp98zurxZmeTZCCGHL4QPZBWmJDPHFWEw
	 1kQfNhqKEes7RF2kG+k/MHWlJtnxBQJl/FuR9HAg4KgubvYh5MKK9O0LbtV5j838+WDxy
	 mi4DX5s2TQDlxr1XOEtzMpezUq1KEj805uyMVv3E8/odprvSsomio9dv1NVHWJoamnZho
	 q+rMD48BHVB7E32mL8gO/6/ByoVMtH9ohyvk7rB6mhSnJooeH/KDQcEphzxGeO3Vm1JAS
	 0PkkMBM/uvNJUi7bRqpDBzly2JqHfP+O9PzxCx3CnnFfQ73KKs5ECXx7sWkFqsPQp0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
	b=2OzRfaSI0NAOM/kg3XBTKuDzxDVUqjSluX8qA0fezLbCR/0+zdJHI1FsME3o/sQaRmCE
	 PD2Dy+Subs47jJBVjd2tE7M5WdPmU8GqHMvn5hp6dv4U2WJi+MzOmNFeqDNepFENLJab6
	 YmbIVqrh8zytXK5FV74vML2SCoLebE7zyWwP8PP/caUW0VBp3Nvsd57q3BURx/ELREifa
	 69IKYMmrQC/DOAyJTLSYI8YaOSYacu9EVZRQdylFedeRzTH4l3BPT2au/d6ytVm/KVXaL
	 28tGEkljXXv2fTyE/jzbYieuZG27XeF3KqoQTj1ocG5HGN7svAVCnv51K6vQe3GBXiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB7606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBDtLR3893693
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=; b=hq5ed0vUkzkNuUs5
	mXglYr6PA/HYKeuC7/0cQzccV4zjo16sbgqlY0VQr/p4uTGzmXQdsEwYrpzn+b29
	rfs7sSQ85pKLLtRqrz0CJMMbwNPKz2UyHLJDT7dJlM289/k5AJTzDmTiXkaRSFVb
	Yb9UANoH7spvuqsMktXYVVGUaZAxSIGUdU71683lmatlu5MwA4MlYWsC2IDG3+hW
	jAPq/lRftHqp+nGO83WwxRognk073p3HuVJoxPVA+PkI3aUsVs0OtGYRMzKg9FYJ
	goECocsSKnSekf4xYWc5aqavga5TAqBN/I4WpOWq0fWd8ffby2UC44wNZOnjq8p1
	43J/cw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1u26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso133621985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491283; x=1795096083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=be2W0OH36Sr+oIDxYJx9kEhbnPGhKxIqWsB5jS4QhwS0lAoiYWw2XSrh2t7gNR0sz5
         ETd36Vw80LM5r5AzM9Gf+HMzho12nbd/qXEaFN0bBP2FMwzCD8t8wga9vqWHGhQV/Vm0
         INAch9nBPIjJ54YDdn6XXIzLxvZMBodMca4OmWB8Ua34YE6ZlCqZn8M8nftisYGHlFEi
         5kWu3uXZzNJp8rOhjzuD790Bua5X3pSmLQfv6kYspUiWXdx2E9dsF1tMB/pUN3/R34yk
         bxk0Xq63VaR7KHcXe7Ro0mFW28crTtCJQQ6VMNkZUzxxwWEYLz6oZQPCiv3YdA7z9vOE
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491283; x=1795096083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=gH0FxWl6dK7evv579H3iTBw7qro8Oxte49BCpYmAyasSRcVBXOGIFZnfvos/UJKDpz
         aK4S1HYCs08jb55KB+Txx6omaSy2uIIIS8ddj+0BJvFvd0WKD8egn+ar/f5VW2PbCw0V
         oLW8lZWkEzCQTbEdUh+SCo9qo9osruaBYYyxjVDViPDpXQmXVnRHT+IuvbqS/E01jP9r
         kgxLnUtY92CFEOnjI798vG8ak6vqqaGM4NwLR0bjT7LceQvDwxPa89UtHlmWybpTskDS
         +0H7pq+d3KiBYpPqdIp/qLHZOypy/Bw7KWMCdWpcaikr+YUZHHJXD7otoZzuvpsKJZKp
         QWCw==
X-Forwarded-Encrypted: i=1; AL+hErFjxcqOV5jaJT+NKBqk46NoJna8sbcTzr3FMj/9M38vSc3D74xVZi0vBfrATBrbX4IKBf/60FsPN+dRxclt@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tp15+KQYaTP9SXo0CCCifkaDc/lbxOdqJWy52AB+02ig9ah2t
	MlMGNeDzCG/l+/FVeahgd+M3nJX8szvQvi3LPhoIVDB5OL/70l4uA+HWKPLATVszS0qM6OBUudW
	l6hL8HBqEasMNid1mO1GsKrbWmxh5+3d1JGZiSqbEgSH3HpRC3QlCQAqF9Pb7z6o2cGl1
X-Gm-Gg: AYBFou3oJT2g0QkPbR1JtU3Vxpt3Fe1xbi2UfYqlGtULJNNbwn4w/9lIvIBlglrWc08
	7IRFRdjQJmCJao3RQrYKQDGAlHS0188FMpn4v0UuD0OD3a6CuELlQdvr04ZrKVtVlhU6j4uC5Gq
	0I/OgKlmfLLmTZzmRxmqZnDTsf3Yj4NFo7aRgZt2hUxMTRo9C7F8uaz94lr5QQCK48+49gkFgi/
	rd6zI5myo+4oLe3mll/U7IWYCifBwdR9Y4WIpYyASTDIdi9X/yWUxZeVHeTDF20iuNnXevHyWsv
	YIHLUuliWrR4DnDHhUs8NoRKMlHCBFzvq2LDoCsB09Erf2rWlafbdNSoqag+AYHkL1nWscKjdte
	MKRxH/T9VR5jE+1Rn7bhWh/LQonUMaDokPb0Qa4c5sQ3toD9nUOEsBxYsezLXYiRRmfmqvdsNlA
	kNPGU=
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930695685a.59.1794491283068;
        Thu, 12 Nov 2026 05:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930691485a.59.1794491282604;
        Thu, 12 Nov 2026 05:48:02 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c16be05ba1sm325697e87.50.2026.11.12.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:48:01 -0800 (PST)
Message-ID: <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:17:50 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wa-wVoPiHBzwWc_VtstSSrGfyNTcjjNv
X-Proofpoint-GUID: wa-wVoPiHBzwWc_VtstSSrGfyNTcjjNv
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c394 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dNOB8qFnOFInGeeiHp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX0Jw60W9B/kJ5
 9N6MYMPBmmJwWS9g5+YOTdBMDWXblHv6PC3b2hSLYPu/DkAQAMqUn7pIprG6neURRh4D5D2csu6
 FCW9V6ck6aRUf58znDJTUELC+FXCc3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX1h9YWDqjCwVa
 VtEEg0XkQqNseUf6Zbd11I9mgJ5vCaetHG+boRhxU9XcOf89DVfXvrGTm91ptcQDeEvWOa/JqNZ
 A/3tKqeRD9TmHxASw5M5+ckwZ4WAa4bMMePxr7oNnLbn8MoC/zbm9TBeHmAW96Z/UL/WHbMQEeR
 isSS7NG2+yzsVT4oGOjcRju6iagCfJKDIQ0yucdU5BcJMKBLk/u9Tr4jjvFIlbclJH1RIE5ojji
 E7/12xH2+JjW+ge84qoXWqVVgIFbQgK1Fksfb81KRUv1lXDZEMiBNkKJn6VvR0U2bPDit89dXs5
 NgLSyFy2jtcJf3tqRiCEWPn70259Z09ONFirG2g3dY5+UGvESDmyQj18Cdr+q2GL+0lGLI6BMQ3
 LZxfg1/Ew0OEq720efMoQE2ejSqTANtM0Uw9oir6Pj1Wn+Jje3PDlyeacJ3JNAuGlKQPwlzWL+o
 UTv/wn1UZD0lPinyOsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054



On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>> protocol ID for QSPI.
>>>
>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>> we add bindings for it?
>>
>> Hi Krzysztof,
>> GENI firmware runs on the serial engine’s programmable sequencers and
>> implements protocols such as SPI and QSPI. Linux configures the engine and
>> submits transfers to it.
>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>> this ID into the DMA channel and selects the corresponding descriptor
>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>> I will clarify this in the commit description in V2.
> 
> Does not really answer. I see no reason why GENI firmware needs ABI for
> Linux.
> 
This extends the existing GPI DMA binding, not a GENI firmware ABI.

The third argument of the DMA specifier in the dmas property selects
the peripheral protocol. The GPI driver programs this value into the
channel's SCRATCH_0 PROTO field and selects the corresponding transfer
descriptor format. QCOM_GPI_QSPI adds the QSPI selector to this interface.

My reference to the GENI firmware ID was misleading. I will clarify
the GPI channel requirement in v2.

> Best regards,
> Krzysztof

