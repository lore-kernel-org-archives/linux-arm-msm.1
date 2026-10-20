Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498378;
	b=e78ohtOhjdv3/9l0rzojYFuMkrwKVAZajP5e0AaDmw/ybGBcS2yQvl3fNsLGKYS60zCx
	 L2hLdwSZC+K03/ixDT+E0gl6bEnFxmzUo3Kr0CnvvXjT/WBo99VZvhVpJ2l6WdAlrINWY
	 R2kD+iWkeYgsDqnvtzwMpjszO/juM7N8u9vvrOrVrZX6qIxtI6mR2QleUbehDXylohe4F
	 G+PO94KCisRMBPkN5cp1Fu+QH5A0yiJGWhsCSjXbhz5ny8Wmv1f4N4xn75QTNB04dSuVF
	 cBpE5lhvOkt/1xqtUZ1YBmftxe3LELuoygvZoToLXA+leNeuaShJobBjwYTkWOHSUTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
	b=xNl//BMERBZJn46MKzXSwArSZjmxhbBZYclytifaigfBEGxzOT+vONQmusmwvsNhUE6U
	 SrM2Nej4LBUXmYHjNNg28GySD6aOi7l/bazcYS6hWEmKBDwb3M8U4K8JDNVw9KcKaZlEW
	 aqbxMtDrRJfFLv6MgyrQUvqAe2Zerriq58y8iGnJjkc5WDaundjoa+qqlLIXYWQ4RbNh1
	 sQKDYqouxV1ssge+VrwRwZxSAgFILO6Td2h7enERx+BlPuIeS26F6BaZ4XpQ1+PvcgBKh
	 uu1OeB5HjRr9q3PYrZEzPZqeAvsXSlw8YeAOeDfzQm5VoQDCMZsMLMtr/DZa9W9ykWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C33PJyFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8yEIXMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4192606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4192606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C33PJyFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8yEIXMe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwtKY1929037
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=; b=C33PJyFXKdK1FMZt
	cvgY4I0KNuM3qVkNNxWXg/gEEHdDO4Yr13qMn7p4LfYEQKfLQ03XqvjFnlc1htNR
	zjEbmYlK6kwlx/5nOtquzjvPtp6YR+O8ulYAB+V+UaTK0NLrQ2U3rI0wgDuls8aS
	UyFxcm8RO+hxwDy4Q4gELwfjzS6BknjAsJ+wq3KZqGwMHz1f7rpALSjoUMzbtf38
	hSO3IfWGWpqQE8rGmCev3ZeV++j5U1Ca50+wS+J5AR55FnxbAOLaw1A+29LYsNbf
	sG8wRUHs2CUe0Aj51KLhINdt+LST1sVL4gdwWeEA7Jc1VUkRg2QICEgIVuGhO55+
	yetTig==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntag4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:12:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c100f6f8ffso98419137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498376; x=1793103176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
        b=J8yEIXMeUleKzjnM5hqbQRlXENC43WTKbwDqArQ8gs5Oya0gXcm/pXx3IpfWPuYzUX
         ULFfdTvY1b3Wa0w6H8l7jDEZJg8alrCMJCajW93sgUYjXDOcvhw+VVtJWpLdgBWPVzWT
         4jv+q8gLMuw5imjeF+7MxJpu7oTeUhQLQTBps0TPbq6UeUuQ1f/pLpAv2SL2k8XbjRuF
         zbtocQTKKCjj4WEhobd/+m74Cg6KQlhm1nuQgT/bd2xhVd1/pq0PYW6RXyB1RgYh5rG5
         l52++vFXD+rC0JUI+6ftabZahJS3wT+ybnyIJ+iOxwzEZqIjtg8kh4f6L6FsiX2I5eMX
         Tthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498376; x=1793103176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
        b=kY/OlTd56ANEWSDWPPrqIXzafgimL95NoJ0YaaRF1VjiPiKY88iMPYRoVhs75m5GUz
         0J68ahjmAUzzswLsLpcNCqg9rKJkBmiUtjznHMpVpIX35csJKJiLtBazEM1DHUgWO14e
         6i2bbZIRorjrFu9/QEpJilOE7+ViIb7SRla/dOMNXeNMTLZGPTdiomatYEcuuRp0ZrDf
         uSwWHKQWK2pFB1k/UZNiC+OTUuXTPIjG+nydMmLk1Fue4TxZsZv0YAgTKQr6dyqq3qDs
         1xJpwxU6+afImos2kOunoOheXF2FLs43wbZTPBwCJTYKUuFOmyfwpZFvUWrMv2rO9NYD
         b43Q==
X-Forwarded-Encrypted: i=1; AKwUvBz49TkoZONY5reFNxfokodyZ6fxOLVF45Z+PJIJNhrxWGlh05Dmlty4yajIMFi7CB31dOLJrwkpgauh63QA@vger.kernel.org
X-Gm-Message-State: AFq9FYJhOGZ92rcgdJA/AaAlMSh+obBIv0z6e2mFoNyft2xT8CGpE+Wk
	Zz8f78WmJQcDwf4+i3OMEXzKo0sVAFsi5HnRmWBvAXcD4E6lsQpy8xZ86VjAEkab0dQOdvb1JNI
	qYmPORa7hxDJ2gggKvjkDKwKPQeOefK03PeORcWeQhqhCTjl++g1E53Fjvk3RXUdZrnxv
X-Gm-Gg: AYBFou1lCfOlR938u1j0vPcILiRk+KqX+pa1Hm57y4iCsJhF3WXVhq8wUMt3R7T58MM
	mITXq8AksgaiAL1jS463bwVYRhnW+P9Jz7LdwHY/InyGTxIQ9VNDzHgx4FACP1ghvgdHpRIgdN6
	vYPjsYCxckuvr+3Zmmugd2pDTVLKcr46fd810kM/nGU9w7zNfTJpoQRIsRMGTLThcHUFqwQ+s0W
	SGrpyUPj6WbfYSA0xCEKwJPFlhoAXWFuApy2wAuK7292Ji9rEwCRHfDft2xvlUWB+uzmOvz1Aa1
	s9OEtIVEMRsBNq0iPfH16DSjkP0E5+MwbB1M5hu1Ff6p/GXnzoZB7iVxdIrY3FOKO7Zm4/YWN/J
	6XK6CJKIJsQl4Kk79YFowpA==
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr2105932137.3.1792498376200;
        Tue, 20 Oct 2026 05:12:56 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr2105918137.3.1792498375619;
        Tue, 20 Oct 2026 05:12:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm5256665a12.33.2026.10.20.05.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:12:54 -0700 (PDT)
Message-ID: <c600cc5c-40cc-4640-b032-a87dcec284f1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:12:51 +0200
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
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: lemans: Move platform resources
 into lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX5Mbk1K1IAazn
 Mw2wzMiaeaw8CVLT+6wKDTKV4f5HSD71Ti8hy1vBlnwzGKfRfoKMGvAEOmn5FOtKHPe0t3SUxsE
 +PTiT7a0wc5nGEHSAKfjw/KwcSvBUoU=
X-Proofpoint-GUID: j-Buv2OBrZrkJeGmauUQL3jxVEhdZidw
X-Proofpoint-ORIG-GUID: j-Buv2OBrZrkJeGmauUQL3jxVEhdZidw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX8yT/LsaXwSKl
 O5HdXBdlkGTamMAnHesabhaG5LI7Sne0ADueiNiva+Gk77fuR9caUqa/gNaQUCUDs/ILpMYb6M9
 NQnHnFDn9XktmM9Ks+mwCtO/oD+BFvUzTTMziHyy3buuFEcxNRH6AVB9djqw0FDBJXnqyCGMuo2
 WsZBvanZ9F+mvcPd/dMcwvw/AYBEnvraK9IGh2OAtIGm2L/N98TiHfrjQVe/vuaV+p0fh8wipXx
 2PIaSMNTqzGlt+SbZlZmvlpJa6AUb8UnVk2XKiNjULxngvFqGIuO7zTou/agckZZWlycNjbQ70o
 0BsLjUA7HqiWWnjK0OVe/tYg5GIePwDd/7lMK9Lhychw7SmHumlsG1ikYkCgrETXmD3nGRJRrCl
 TGOPRP7Do7pkBlftxCriSEIDDvQKrr4A1QnOM9IZ1IHbtuyKRm7ZwwchKyxWxaEjvO0ji+ndcOL
 neGfg9FITLLEU5YOZVw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad75ac8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bWZ10KAKr9BnBMAnnq0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Devicetree lemans-embedded.dtsi was created for Lemans Embedded variant
> where platform resource like clocks, regulator, interconnects, pinctrls
> and PHYs are managed by Linux. Move them from lemans.dtsi to
> lemans-embedded.dtsi, so that lemans.dtsi could be used by GearVM
> variant.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
