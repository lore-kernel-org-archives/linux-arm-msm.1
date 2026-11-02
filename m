Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633221;
	b=Cmhk7KDNSCrT+r8gftLskPOwUylSXM9ukIcdpiQLEeyC0q2IF7cmY1+h1SV2pJOaqTii
	 0nxOwpi0+/XSJQokWMynMFzx5TmPwI8NHDeHUpGO1L7N9Lag3a5reGwkD9L0vA0DbiHmJ
	 DQpHBX/V4y4dIa04vATxt4Jsu4q0mz6crcw2fbCyXMoHV77KJkPcXNoMO0Llv7Q6T945r
	 aOXX70f9asqdXx2evXIkq1dK9zJi+74amqw8ray2VIGctSL9apIO/PlSQYEHdIYKHi1KZ
	 U+RZ+aAUDL9/Fc6sofdm1Yyi7OobcxTVHhWDqFauc/h/pLoUlyyNUeBiZ6lK/WrN94Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
	b=ufc/1Bjhj9TNaurWpC2k2cr0n+isvBZ33Zbo4vZTQfTpQEgchpS2mR3NB9QYLGHVX42L
	 5T6DPL9QiXcniH7Srnid0bYPcARUpMTyJht8VhsynHUnVZKFKKB3e4QdGG6qa+Fwz4CN0
	 KLn2w+1MIUhkCiKnuvXOIY8eCX9UdwxDyW3llPsPRoOcSsaUkpd99n1jC/THFyprwEMPD
	 g7zaqdE/m+r3TbRC8T0p8FsdmPhRxz5Ct0Ua14LDmqZbwIPkd5IJY4hlzc9Zm+h6gswzP
	 ajyng5YedJoNaCbEFdFW7RgJsjbnFr6Vapmp4rmovyCaGMltMnXlnXk5/V9pEJmIzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq0fWTxD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6rZ7cjB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58FC6083EA4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58FC6083EA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq0fWTxD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6rZ7cjB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpUOW3715895
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=; b=dq0fWTxDt2mNCh32
	wPDhaCla5iyxWbTdVBCLLVaoKZeU8xSrTislPzaUh2u97sOypaNvlq0ds7H8lpwZ
	n5PzAqmF20Jmh7Cv76+BS7AKto5ttjOvzfCBdVGqGY5mWJSRzypUQhYxZNa08EeE
	iKalu0g/sLkFYoQWJSdE3VC44HDTb+HQN3gE+2AvC9x6FV8IlQMTgYQwHxXq6u1v
	vkW3tavWX3rnR+NN4ZoB5Lwfzktwm8L2pqDsyiaJajsyAp4D6YtSAzE21UVJKjHu
	idEdCVZ7ptFv6PVm2RsrDBvyzorCL0rI6QX1SbbeLRFBgRTNj+t5YoUg/MMZHzqZ
	7t06ow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62g70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:26:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso112317137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633219; x=1794238019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
        b=Z6rZ7cjBgFzIa3sYI1pptZxzJCSFZXzmOmZcRFzlp7Qw8pEdPCXbIS/vniz3ev6XWo
         4yFtTFOkWBY/bfeL0s2zQ1NzvZazlrg2bJG2G0Drd7TW/oByhkSpXCpMI7ZnLZ4nLLHh
         o/zye5RZzawYFTZxYni8w0rtYiq9NjIo1yo2CdEzc0CEtgJ8/7kBENg2FZ6c4ZkWxs97
         Rcfz26jhgDxOPOWW7U8vZ+fcyBZkOYOPavGol/GFmpS1OVuBnXtXrRNTNim681m276EX
         E6DcubC4NonjfujZf4FGw5BPBFezdXwu33jo91TJKEasFkMK1aOCdIvTUoLWMxPn4mYW
         9fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633219; x=1794238019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
        b=pUGDfypmWehDoM6BmdxzlfHBGqq76zjGMQrNcLGcnMouq2aV/J2bJsi4RERlCrpaeH
         ncm0V309chZ1GqVD80DpTHbXfcgYaiXtc/oo3+cg4zrUcZmc2ZwynpwEBNwD02Gg7cV5
         EnqcKzH8yel+Kx5yJZE2DlPxiNry1oeDpfYE0glZ1S/4l6deDfu5zn/+kZt/WUSMya0i
         5sb0EmSZu5ZxztiHyJ3ENP7COFiWSg49BJMmoF6pE10nsuHnOmaO73KYcY8W9ngVtGtv
         p7/aCnRDHkJu0RI8TPGH9YmY7p2cGND4fz5ZJFUoeb4B2gR9zVEVhE0wvvkQst9W4j+g
         7xnA==
X-Forwarded-Encrypted: i=1; AKwUvByBWakfnPOFN1wqpw4XnRff2rWkj3nL6PiN3/KTNUjG7hTk2WuBwIz0RbMFgUtQMMfpWAFZnO96eTQ48Xyt@vger.kernel.org
X-Gm-Message-State: APuU4Z8X+QMDo6FZ3d03r40tZCKVHKO2iacUQ/hgAh6BMDJr5qa3TW32
	AAszU/cHbsQDb2J0PoZ5vaffWIKprv1ztzVNFcDDO3SUv6jeej5E3+ZJxer2Iot6w4wDJvKIkZX
	fsQmEcTrui46Aw8t5eAwhdP2iU5QZ8Ts0wO0eK0QiljHNh8DDHNgzqezkNhZ8URqgEMly
X-Gm-Gg: AYBFou08UG1ohDpWXuu00PTnYKsOWdG0JiPrTXgNqa0XX9nvi2fsESS3b9jBTvWh8wd
	XMiKUUtib+zbzfUCXp6i+4SmaRvFII9H+WtINK3sw7WOwh6Qout9Qol2NnmdPePrjqmS8VQD4SF
	vVdsLtbAuSnULRCjocQUvkFB4/cqZdiT4UyQqUBO1qWMqP6EstyuG30AyZp1ye9XRajdzTAuICe
	OMm5D14S1YY8kzUoCGqHnREo72TXsqYBilY1HJZds2xiRKbLhzIbX0O2MdByOcmkwOAwETxrdFt
	JGRgPfO2rROJopPH1vNzjFw4hnzS+7iUgzu4LxbrvxW8kservNWLaIIkZu/cHjwPMPHRQYia0Y3
	V+b3KWdYkPopzxZ906vaHnu9gfN2nlUarc1HxINuPzcoSdatWpXufONjLffeDXPYxJ9/shA==
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5291949e0c.2.1793633219094;
        Mon, 02 Nov 2026 07:26:59 -0800 (PST)
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5291928e0c.2.1793633218512;
        Mon, 02 Nov 2026 07:26:58 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefabf6sm1619366b.32.2026.11.02.07.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:26:57 -0800 (PST)
Message-ID: <ac07328f-63c0-42e6-b8d5-d3be4dc877f1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:55 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans: Add Vicharak Axon Pro
To: Ajit Singh <blfizzyy@gmail.com>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030074404.33517-1-blfizzyy@gmail.com>
 <20261030074404.33517-3-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030074404.33517-3-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HN-ELppsmt1pfOoOuTSkWkUkZo9K__XA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX11VF5s7JUSiy
 cxjF2022yEeO98BiC+VCgfjca2BoBaDXVa+vWx+9MJlT65n8DzL21RO9DoheZx0jbpxlB0NzI9P
 l3yPJMGD8H59W+aktq2XDf57QhGUnR4=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8abc3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ugbcvswmd5WlYt78kqIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX9SRivQ8knNv0
 kDlZz09cZ3qpVwvy4YIA1TRVdYdwVk9fWf4kTzB2To5oUf5u1WsSszDPmg5IFtTbHGMUdpsSqZw
 EieLd66zrtmskXojWolwz6QBXFCcXYtrBEfiGwS47shwD0pAbV03uUne5PZlEtx0Xl/nheqgesW
 EsA24/ghdOkvEwWJC+EtRLyvXr01jOvG/IdCZl8VBcyto3Lm/Snoh70USgvNbDSEdwK2EtKak++
 O4icY9ZTgDyYKo0IdNvAtlKd45nD/SAvdYJVRF/baUrIyBUnq/HoHOWOBhJVe3uTTZhFT80CxMI
 XjQ5gKqyFvGa8mdiumD6gCyKXRuj62ylbgN5EbpOEBiNUXC41e4nN9dQKeATT5yga2zLLXaln4e
 DYCdZuyrCHzjFg0UQrFmYxDPzaUtgJZby4cBPq0r3CzhVrMLJ88oIu+Xfgb18Pb3TmJTPBOlcjQ
 q33mcKotE/viLAfH/9Q==
X-Proofpoint-GUID: HN-ELppsmt1pfOoOuTSkWkUkZo9K__XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020061

On 10/30/26 8:44 AM, Ajit Singh wrote:
> Add initial device tree support for the Vicharak Axon Pro SBC based on
> the Qualcomm QCS9075 SoC.
> 
> Enable the debug UART, UFS, USB 2.0 host, PCIe1 (NVMe), GPIO LEDs, GPU
> and DSPs.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
