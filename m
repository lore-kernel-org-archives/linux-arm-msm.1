Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782460;
	b=svDnEyuyDu71GzJ6bEYILs6Tbm0gCtAajXVvfVBsj+8rqyMbvx+hyN6mG/eChLltuKfk
	 xjDzwhprbPZFH0KvMDpt12vAXiRN+Tb2v7J7XuZ6LNiTXLmLgGXJEPRi8JlMeIMiwTVG1
	 axTGAXE1dxXMohoMsCSR5Wkp4r+oS6MiWkGgG4TMp6DMY1o8nrtfO3tL3Fd7SKURhOIFV
	 jJ9KNDgYOa6/b1m3iXIogUcxikJumcTyRLKOZh/Uk1bqx6lJhqKKhMEZxTXCOu6PFxXR2
	 Jkpp3WjWgXaKjq5MEmBtcr4zb0M5Mab8doxp5X9daSkxG+xGAYbK8Bbozw539MN55yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
	b=HZkoVAtiw+TXmLWms3alovcijftOHAXS3XnujwfsQs7sRjqeuXcZUqmmPT1uFLHa3ep1
	 c0FqyCKnnqVg//oJr9KyzPHgZb3LniaAypNDiPGgivwViRyr6kVFxSrj7RMnR1hpLGE7v
	 KqUfVxBKDrmt4gBo8imutnupViF1AOhu1EMuKXxnvbhDhfrl79y7Wip90gRAbRK8xc/UM
	 4BuHzrAK3Ylzrw7K3DimQuoDW6CxbeZGH4NgDLMzT8+elEcCgSH8exTRXkDtcukXqbgg2
	 6cGhxigW3QpX0thYOig3oql2gMa3VsDP7fsXauTYSuqLs/2d+PVS70e1HynyV4UnJyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEAD606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEAD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApdBJ2058280
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=; b=FjKDdGF7X+XkRq9/
	MXyrQkko/PPi4y8oYop6EuxujwZUSXM6+dGJa/2bPE+BBUlPn9xFIImt4pYelgrP
	UDqemhTPiX/2tiOnRI9gMsYib3VWGheswEuCpHEN1RSJ1T4LnCOPfAG9p9cSdoGh
	TgL597+3q0WmLfIt4N8C4Rby7zInxKJqxfROs9Smsmx272Yod/JtvvVgsFrZIpSC
	SX5RwWNxLIop4hbUW2kL1T7DHts1GZvtpyByMs1Mpb+Dv/FtpbH5Xw3dDFoWy+Xc
	DJ78loK5RgPiPvobQMvh0mKhT1wwKHSmh+FfNSP/T3ZtAIexCaOg2z/lfpJRKB/J
	rtdUTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasdvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso85770385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782458; x=1796387258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=brLOI2dlMBcvSa0oj4XrWcI49biEwBn/hxERcZUpXyz3eGr5mkBwTXAnG1XzG/gMCh
         9oJl+AM+vkwVdtglbC7efEaZwdLdh5C2C2Sf1LcFxFtd82WCiGKvWeTxJl461bH7Ayzd
         7Y3J0kU4c7GA89yE8DLPYc3RPOTQwy3PeMtoiIphfVF56F6KVPQPCydS0wkn47030BpM
         9mP39vjxQkz2HxnBIMtgnkfg0BHEk/AKH2SX8zmUSoE9iHOAK9W1j6sJccT5h2bLofzH
         5dGrZ2OAKmoHVmUSgZjmJNa9jNdCbAulFAYmZIwmjT/Ndv3c5ixyuWCqubcrUSYYZb6f
         EHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782458; x=1796387258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=lEQ2uRncJtXxRAT0HvUHIl0zHmaxLb8Jxp2Ntt5yb2ivbD8fF8QMev4tb0mox1nrwq
         w06JbyF29uUL6VnvPun9LITdX+xfuvQOcMb/qZpIX8YcWI47yNoAuRTw8bufRnQAYrII
         fHGPjg0xRgzqy66qGia/9QaK/YQ/ShBU/NToW4VBbE4bKSglAhjlAKQtVf3s+CJ8hv8j
         lWzE/XxF3lJFj+65mhWSZ0qEZAGUpdmvolAgf0VFR5gy1TxzF9tRplPpETkO76NZmjlC
         gd+62HY0a6RCNUsyFWJ9+NgUDe5OcKRrqU2dbb6FbSRgBOHxIV/F/jauffMfrJlyyDoB
         girA==
X-Forwarded-Encrypted: i=1; AL+hErF6q9dVvPyPaavzbYHikL0K72k2HYeMPi9I1q+XH1rdRAu67UQlYz1mRwOssBrx7xqUe4BrTUyeOJoaqGrB@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZGBd761ntx0nOgSoSe/MCeecz8V+1J8uVBNNp/2eooMIMzGzV
	J6PbucpephzBclD/RYLSIc0JucuOeAPwfZclMS38Qe6ZRZnFSKhVTCoRa6HZ5xLfaf9vJi6G+s1
	RMWpBeWXLCr/ijQFXIOSjsxDEtg3ikQpaZp9e4MtDylKgYatDbaenmb+1PmxO0G2cxHc8
X-Gm-Gg: AZFdTZchoYLrlS9PXunYxMLjuCp5xOFdxXi1oi0yAo9xZL1+AdtStUg/3gfHns69aiQ
	+pzKmT5qQT0O69pHd47lmYlfoaSmfB63BHdEloTlHckSsp45xpy5OZpcAgFbsKT7PjVmm/1uguM
	xS8MIFlw92KScVcj7v/7eL+gKN6x+xQvdxJWosxv8/hxI8nmUuvlPudxoN0JKaT92KXWFTqCFqM
	+rc+yws0Pm+bbdBpmIDIdgKyr6I2LRO0dP5O1zqZkBjsZkc9tQPhJl4C5n1o3c8iS2yOr7Q87fy
	fKycv4iMspIRASxPA3iT3TUVZdnaVfoEfuvKSAUEu20afO2wgFpL4O+WRtS/k/Aj7IbAUWvOpwQ
	gwAv/8ZIPnxvd/MWt/bOq2MOdC4A8utGEJGhmJDbojHNqWtIdpR6V3Mvj3M2RR61HX9DEHkM=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985059285a.3.1795782457742;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985054085a.3.1795782457281;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm10501705a12.3.2026.11.27.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:27:36 -0800 (PST)
Message-ID: <765f3451-0f2e-4783-9a7e-893c06b2a735@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:27:34 +0100
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
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
 <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NOz1pFFf3oexDx0vSJdjJ_5wIxarjp0y
X-Proofpoint-GUID: NOz1pFFf3oexDx0vSJdjJ_5wIxarjp0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX4K+VX9y2k2P3
 w4kW74bphqugxdMvxrDTL82PftjWhjNvUZ6Q7A5HAe2AAhFqVlr5v/2UPmPRYVl1c8UTy2qr6Yx
 Zu3Abk3fejl2VRl14M+fWywsr0VZNDTtXCqc1GYkBoBAxaPe4jHBNztDfkxANk6EEU9ZAeoItLP
 kaRTdb7cE4vDmYrY0nClnCoWoiMitpJfT2BUg7srJJdcVh+gg1qmdrItoyz5+TDt4SFIdnl1VPv
 flguwTZBM4DOb7ccxtxAEzVJV96n0CI7+6LSVVDlCmfLpsvZs2YaP3GdPSVKnMvHkZze3tLUnAr
 o2EnQhD2+Q1Os0qulbXGkEVniwUQ7yyiTIYSrJg81DmumZG1HZMwHqo+oTvQ+Qxm1kfoNH2Du4J
 HUtljPUZdfBoDTbsKfQv9SytoSINin2Rne7SjMtDeMEaD0aJBa2j1NqgZ/2qjCqMNJ9ZkknHf4e
 QymqOJwUceKPwviVDcA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09773a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DuBmnH7L3UKxGZjpEfMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX37rKaFlRN8bY
 EmjlE4eKnqgDEI2At6aDueKlg5zPxPEs9zCKRPSuk8xw+K76FSjdlM62ABCK0aHwXGDT7zfAih6
 MdxZP1Ba6B7ZKclWxwkyhk1NHMJLnQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 6:41 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

Could you try the patch in 

https://lore.kernel.org/linux-arm-msm/655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com/

?

Konrad
