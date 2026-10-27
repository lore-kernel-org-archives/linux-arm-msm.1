Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098850;
	b=v+t7nqVq0ttJgtVBaW97/QAOZ9B6ZKZ9ukHjm2TF/9IGVandxg9IOCV/mPngTAIKWQ14
	 JZr3Xx8Hi9LEdry7wTSUk0cS/y1XEDfrRymSlCb1ZpD3MkmEV/gaISgAs/upBD5vL1KVv
	 gmiY8y3WDkqYX0pRMRZAfpUb9qkLVEfJrPy0fKPrFxGHJ95LCNK2vryC/m789lSkoVp2G
	 HpBkeSi64W4o2rg1xqsd+LBokjmOX+puXvwLpiHYsKsLNP4I2zenhQkc0vsFgNnP9AOFd
	 ju5uBjjwtvCTfWPelaNtV3xgu3FHXQinoJsdwkSQbH+pK/386TTV64TJgvmoGXulgzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
	b=rGo6rQL1CUR40GVV4Kgw3MgvW/OViJHGijmDam3auvx2DljQELEf6fLIHuV2JTXTfxYO
	 pevF2mRsm4U41pBv7nIPFj+xzWpHerayvAOhCrq7JP29m3hce7TSAyotIiVJdSTq+2iVw
	 XDsCfgaX7yGenJMZFKXXe9ay9tWRW2ea94jHi7Q8ehTpDnBuNy8pmfGBXqeeUjLJcotpT
	 NOkGa5tiEKfRZ6mo0pVv0KsPMutPriXChAkdCP2wd8EHWOIEhaXyxY4tc4PMZBdqAeIfY
	 tFFPifWzD/ZwHz6hg7lbVtyyRYQXPEQU7C9wRWMycWckb1vupQgAtU/UU6hfPr+o/MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35886606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35886606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1Cw1921843
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=; b=g6UyFwRAdDpub3xv
	KavARD8Bjry6BX3/Vaug90AWHbvNAlnHsYB1LfFUWk2cyxTjGgJyJlnby68w3tcl
	AEMJfA8s/vnOPVIzXo60vyff9UqAzW4u8C5RhZd39rAzYOJTWWkjYFjefKZ/iyaa
	PrYwlLX120qSTGY7KxSbJomU4sxqrZpmqBFOq+hx8fDpJXJR+FwnzRYKA8bqoVHd
	LWj+GBSb+tIZptX5zB6yxHcEhM9AcH3wrqAkX9T85VHvMPW7ROdczlPEGoIki20Z
	8VaDyPPnbnE0m+WFavUkq8UdLdYR084iZD5MrlSLFM0/zqTpb2odNX8CAW8AufSJ
	aogcxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68h17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:00:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso102761985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098847; x=1793703647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
        b=AN+at520miud7BqLNv+4TR2aq6hB5sjMyGIRyQqzUh9HUECX0ef4oWS+PIyW01cm79
         0E/TFGRhpo8hrq+Ld8MCULqiF9iqZkosK29u/XRzuEL95BYFU+yoT7anZgJWA5VNK18c
         apnbYxZqP3VQlpjE+FZCh/THMIai5qQ+xrkOxQzcLW6zd8ild+zCD67jxbfsYgYqzxwn
         J5ZbuxQFTlplWmsM42bZBTCU3aQNuRH+hAfDxcRj5MxSyb4sOezJ9a50t+ne7Snty+rV
         Pgdj3rJeWY/RVE2A9AaBvWevuLzgHwfwEek3wUY56qtOUSPJ69oanwPkg1FJ8sNjasPn
         NO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098847; x=1793703647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
        b=aWa58gBDDufkvM0Z7lI+PDyKDQyvabMlgqBx6G5Gp5cIYySWyDWTBmQrrWRUYm+NLU
         gdJqW95dyN1xlFZfj091HQYnuXn/5lag1RD/5orDEyLB4D9gaWsDrZfo/IJ47M6JPhtB
         Ylath2e1U/hsLUzFYMmaHIdNTrAoQFP6UVtX2xg8+HwzZdkfuJsTQjLgCQ5upFbPSDYn
         mntQv/aGGHtdBSIVSYKwQgerqh1Sy5w10EdgFVmE3y44uO1IjssLyA56mTwsOUJe/TyR
         LE61XTDb2JfZ+ZUn3plf0JbFhU/yxjR/AYJu9AJ7qpRrpnfXdatyJXnk4QJc3wQvzrGT
         X3cQ==
X-Gm-Message-State: AFq9FYKfyWNecXtK6Rfijd5KwAnl8gypGMEzopk7+gHpLiTu+UuHe1Vn
	B8Wvsne++NjUpZmO9yQ/xOwKiGgHW+hYnC/xMlniUJm7HfW7zaA6b0tlPQYCA31lCEcxhM2jba0
	ii6lvbV8Gx4T4GV0vpxPxaPfMxp2eXVbYatjHOofQVNfXeyzVdzFiUqnCJWFCzUBtkAnu
X-Gm-Gg: AYBFou0Ofnc9a16z0l6ngnQeY6xRuFyWPhhK7e2aT7e/wtucqshBAvRr80YqGnJixwy
	Jv+hJhZnG+9+OKtraUmdXI0dMLc13DTEH7Wpm9y012umid7AH7eXQKFS3JOPNytynOqQo+xsUHb
	+ZvkowQZNI/OkM7aZ1rBwL1kCvu0B7wIBS/buHohJG6SiEdvmxtPnh/HZerdfBsF9pdRzpj5INC
	tIceBcxBXabKZidofq7j/A1g5cdpyPPc46c9KSDDv3QPtRrFWIwiv+V3KKFHRL5Qtt3qwWtxjGO
	ewoROFcKLHOdERvtf0JfLd9pVqBQdm2xQdSfV+uwmM25YIboIFSmWRVroNAqM3JBbN1rabkRb37
	UcLIbxcSata9X6McmtQXRdA==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1494956385a.1.1793098846310;
        Tue, 27 Oct 2026 04:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1494942185a.1.1793098844938;
        Tue, 27 Oct 2026 04:00:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4706281a12.3.2026.10.27.04.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:00:43 -0700 (PDT)
Message-ID: <0032f652-4ba1-4a52-9241-635207f0caa1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:00:40 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
To: Hiren Gohel <hiren.gohel@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
 <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0845f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3LHc-E_swVJ6H1yvdaMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aLm8ddepQJp8VgNruJ-FmnunRtdmgTEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX5tASxkvNNtsR
 r8FmNpwqXdQd1x8xneosIC7D1duaNI5MqZHCnIdM1+GlgrEfPwe7S7BqsGEYWU8IWK/IrZdkRtC
 ohvBlvMuXkw3/iQ2W1OkNF7QbJqMvcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX4PpcXAac6QMm
 ad7wne3Mb/jJVStTI0+L7k9MZyKPfDFxrOwRAepuf3kYhrKVfycQZSYncxyKjAi7X7ME8L+bCTq
 2HRjobwLB1GboMdUuuKTQBe97+WjnvxKH2QeyUKEt2tu6XbZ2G+ArPln9gM1REHHt+n1a2PJOCM
 CmH9/RyLDe4HwQXQhWir6YFdEBPQkpk4Gk8NqqfWXg4M58AEU/bft03mmcSIjYD2QOap56T0eFz
 GaUvYlAkkyY5f0Ya6HTLTzrbbmZlwJsYrniC10f5A8CIj2XV52K1Ou9xW7oCKxEiXR2NajisPqj
 cLnd+H9189DJttWaRhILaLnlSUg8VWzAhZtHEOTIfuZYiLUZjJLMpz67gO81vk+gVPrKgMNzE2Z
 Jpfb/HX8SF0H0HTI+wmhvAh0csn4NaolNxbBbty+IMXejUY79wk7dJ4oriBq72X0Y/umBkyIcSB
 fGm/4BlLtlULv6QfimQ==
X-Proofpoint-ORIG-GUID: aLm8ddepQJp8VgNruJ-FmnunRtdmgTEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 10:41 AM, Hiren Gohel wrote:
> SA8797p platform abstracts resources such as resets, clocks and
> regulators in firmware. The SCMI firmware exposes multiple protocols to
> control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.
> 
> Add a new binding for the Synopsys eusb2 High-Speed USB PHY
> found in SA8797P.
> 
> Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information.

How come we don't have any information for what the firmware
that ""we"" wrote does?

Konrad
