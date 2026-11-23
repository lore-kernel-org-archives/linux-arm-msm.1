Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446965;
	b=Do1a82E7oASQn6xKEOkMtueaBSKaIDNYx+QvzAg3J+ZX3Dd0/ynkfKpowT6itbWUDlpg
	 LnaVFHk1D2NCCyVTGfdygy2C8YDv6TGbyAO/R0w3EgY/gBoTx6xkN99YuHdCR916TL4YA
	 xRA0k7zSCKAP4KjMlTIo767dDMhzfiE7FeBbRh6ScIX5Pod9nlDyg12HYr6giMbFCpMkL
	 uJ2jcBC07oPCAf6h8XVSOh0frv04Y04E0joeMsuJH2pnctFBRzCsSZaIubH/1a9Uffh8f
	 WSDzPM8husutckA8T82JVJEZr4dzaUEexfbY4OATmBn6W6nT4OQa1g703HxoYci5u0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=;
	b=dUfDBVRz3EKsRcc4h930Nh0xq160uQAA4SnD3kPbu65I++ddcQMjhho3V+95VWePpXaV
	 337Ie/FKVIOBRncNY2mbaMnfE4HHxCm2AuvKYW37LHPF5bSYOpfEK0gIDosGsB61cYcei
	 1AzyYuhCatAUf2qWIS+AujoBinTlCUIFFxPKjR8U3NQX7q9CECFjd41bpxTtebG83NZNG
	 LoC2mv4LbVRYOSO3HaD6BghxEnwy3JqGgGHqJZbsSfZ14wUMWKZ54+e/6Q1sasRF21cyu
	 8flP3UMw9Xk3IOb3JDYPHShM3WvnSvmWlrKVNp1W6LaZU5yMujBXsorO1g/rklvRrAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZz4sETh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OEkEMKmb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC01606A338
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC01606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZz4sETh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OEkEMKmb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKsnU1974152
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=; b=fZz4sEThVrx2yL5r
	jJxpMNh549ETHiBkXF2nz0dcr9/iyDz7Xex+hxwMosYrvT66zcN9C74OL2rg90A6
	osCa/SORwl1n+VXduNDaSn54E22JNIG46AJmoANxXwOdAv5MA68N7VxoD5a7LvIZ
	s5XZqqr31fH9TxF7qKy6ggMC+Yzun5hgtonfcADlS95xgZ3N2JNxyGff4rMMoTUz
	uX1+481ukNvlRM3ETB8jneyOLI+Slu5ah2lgdGzpfwahezDwH+XNSvnJuX2lYuk8
	FSXbxs82hlr1/Wn8XE54rrccnKr/4OE8X9IdBnsz5DIqYI/wMw9IIK+uD+Ho9/qa
	ynlwKg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urxud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:16:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecf0967947so90943e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446963; x=1796051763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=;
        b=OEkEMKmbDrv3GOx5vlFDmaujDpB8NxeyG6l2ZDaon7nGwbG4yV/LTl6cOl1dRDPVrm
         VkVBhyVaHlPQN0O7S3tfIpzRGrvrz2KlZMHSjf+/s3ZGtH/jbPp2HzbLsZvH/fv7e3qZ
         yno6ns3kYqkCdIoWZWUUChu4JlSJ9syN28mH+MDvCJOjGPZS+lUqqvymvQlmTNcGENpY
         Jp9xCs5Zdx+N8A5qOB9KN8zaZTI8oqpONttCMgOsiif7hPQrujeuwdbWWTeGogHNdekF
         JqmmBvQFe4ICs58Gs3DbPdiu4BF9pZBJdlpeIEB1tYkoGi7a85xO95jEAN2FEKsIWCjY
         9HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446963; x=1796051763;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=;
        b=cxwje7GxPKy3Jg54hCQMDjBOBpY90Pw8gIo0kw977AoZC0QjkrNSa8/4MUdHDaQbnR
         vAhT+syBq+1ZI+M/bmuTDSLrZvTfqce8f9NxGQFBis7Ru87EO4SKhmaJvGJ87bbgr0CN
         zn4ip4vhsbdkdb9mfGPaoWx6l2OYZ3ty5v+uIl7XqHBHFr+EiTBhHwOWem6v4F8esci6
         XKtgJkU0oxxsDfQncvfl33Xzd24H8eIeFyV3stWgpUs0cCph1C8jzpao5hQfQha+KWs9
         hBs5akyB/ksZ4xasb0wQRvpMivrLNXe4+Lgw/TzrlbnvNjdLQqWKi1/fG7uMREd5Nqd3
         Er/w==
X-Gm-Message-State: APuU4Z++T8VNc4Qpy6hdWpt2Ds25IoP1mYFVB3O/xuAx0PHbVhL5cd3h
	VLPVdGmzS6iE5kPGk33GeGSELvH9fcbZAenfkPQo7fc3B4PLPChES9T7a7iNqI+jtR0EtW0bApO
	HOY+mvzM4ebnBEuqT0RYXT22nJIJJ9/h7x8AytUiUOZg6By66G5NzVUFgIKEKoC01DNwP
X-Gm-Gg: AZFdTZcMYJMZboCcOMb/7QDC1bk9WLmYsqoGlC1DF595p1zgpR/nnThXGeNvZHWuPqP
	LGahsWyFum45KucHALM05vMa82AQW3tDv0MWzsp0R8IQw2sh2xEe/5q0k5CYvEfIwaGLDasfSPi
	k6/N9QtmtGj0Y2EfHUALF0mu+7v7t7B2UfTmPcWBCt22eGfM3M6IgMVjAFFayWDYrp3Fey1jV4Z
	G2d8E7ogXCSgzwDKg1KkXQQxXf/yq68YsbUtjH5xThtdRzGenj8EbbzIdzqFIdeRweJ2qd8oxls
	3wMp2PLv3gb5OBVU5Mlf/dLS3j8shjfPsEu2p8PkzkD5v1y4Jp1jamtO8aR+zx2KrF0+zselEkP
	+mcig5s3X4aYbX8YLUgziToCraFizuAEER/IL3r9XbyyiBX1SGEVztWSjg0hoTNPhH0doNvQ=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7240780e0c.4.1795446963504;
        Mon, 23 Nov 2026 07:16:03 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7240736e0c.4.1795446962973;
        Mon, 23 Nov 2026 07:16:02 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm5502638a12.8.2026.11.23.07.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:16:02 -0800 (PST)
Message-ID: <96cb304e-0489-4f65-8dae-fac36e5d2be4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:16:01 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Use
 QCOM_ID_SM7225 from qcom,ids,h
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jDSLdhxzg6VpVN3OOX5ecIvYfSl2KthL
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0458b4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=8ixNkqbS5ZmMUdSob9AA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=tNoRWFLymzeba-QzToBc:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: jDSLdhxzg6VpVN3OOX5ecIvYfSl2KthL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX34h+Dr8r8wnK
 sbtMLZ+sWhd5PwK9zH0gLkWpn06LYoTA3b2q3At1krbar7QlA5oTD7kDFhH6YrQQ52GHJ8HLS6O
 DZnvY3Zz5QYFL1MyCstj6UKPMI2JJdA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX5RYCforJrJfW
 VjtaeQYwK3cSrQwwYK9VdRFdyrMQVfPPktw59ieHemk5Pbolxsq6tNgwquqi5+Lq2zVzFysmyP1
 kicY5kUVy54+f17pfQK6NbY0ZUVJEImfXumxwKd6eRoAOcNhgURyjUry2DRRMsgRFsYhldW7IwV
 tdRvTe6FylGJRPCVjTiZRidCo0Dwkibx+cJReLEl8ioiI5TDWv4gMdMo8V9BZ66gndoV/dAzH/f
 g/VCAD+FTlYA70z1OMZ0+FfH+NriNsZBVTs71gNyLSZGfnFLiSLLnQNCq1if68OS06RFb9RWNbp
 z6OdC1eUrkrEbsDAKx4cebZ1SoFAvec0psVlb1VpOlPjvkwJL2AWDGYv59m51NLSv0ovwoJWP1z
 A5cBMCK1y0y2b1bhlIVE2Fj2imdW7xymeFF0YukBaP7v1KKAQXL0eaI2zvkg8YRmgynC3vU9YSP
 mNirSHdKfvjYhp7a89Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/23/26 3:46 PM, Luca Weiss wrote:
> 459 is just the value behind QCOM_ID_SM7225, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
