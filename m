Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16546472521
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056790; cv=none; b=VlkuQh1e2u/lvJyTD9CMYi+OttE3VL/4q7dsUBC9ZMsvVV4J4wDXupnw64DeuFsifAWZ5XD50kBIGPo1Q8Ethyd6aG8QMAAhdt8zjc5l2ETRWhIFfTGWiZEslEIeq3YMIxX4WnxmsXRN5s4wtIbY50Kd6KAY2+BiWJFq5CmHU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056790; c=relaxed/simple;
	bh=gTPEsPP9hoDdy7fCm2AIUCjf4BTdWuef1OndcSvQcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afIG3mdobgTcL6skVTERmrzyd1TkwqmkUYv8R6crmUOafh9rgTF7Z1X5s3NOQMeMjbo5htUEy77veJdWPSYcMc/6Xj1XcoKE4VzBM6zf2k/LbrhjRPVpbYnowQG5Al41Mm2aCMtCMjqplQIu1QIXKcShyocGJq1mnILGaXmcF14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKBb45U2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlvwLmWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKBb45U2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlvwLmWq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABHhD2057000
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=; b=pKBb45U2+vnbALE9
	T9REZMDBdt+HZXDwcf9E7+VxNpU742Dw18fHiDUUwG/3JchFbQ3htS/1AikzeoW5
	dIe/7TPcQUOP0GoZXw2ChP73kt/2ELTfCvLGgf/NBRoNd3kejD1Wyix/hi0j10IW
	P98CwsFJ6EgJYUfT4ouAohgAmQWVCeKXeVwXVx1nXUNGgAStVis0dzBgfdpiKcLe
	LS6nfgtcjqD6PDo1j/H8ZcIVvYtCJZlQvoguDX1HgPmAwtNSuCYI8NUCnIFbuqGV
	CmW0ZcNWGDwQ4zR0WJGBw4Ee2oi2g0oW0/WoAmwn3nBPMMxhm2cf1m/X56PIxFcI
	YhuYYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmt3vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:39:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso102364785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056783; x=1787661583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=HlvwLmWqSCgHm4Z1GTFwoMNwZOVN8paTEosBivEKvYg7+TbIIwHJ8p9mNMwefKxw4u
         UBaLi7ZPiBAcAgPejO+Lb2NxX/RqD+3nDS4zExLsw6FqoXUMuVU+vIgR4nk2wrwiRvu2
         thihN403SIERdsEglu7glExjlggRcdZVKjYuFS0M9I91i31tuqdHkKYIGrGpfnJn8tZ/
         o40Q1OUjdgg147DqrIoob2BvnCj8WcFrdIPXWGyQLoRcrZolfuE1ntHIrag7341L6mol
         M6alQPN2meNCTx5SU0Lo+fyIGiwQYgTngPwd30+kkTuVpsJu9OYMKObjZCKMy7qmtG4W
         uICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056783; x=1787661583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=CGAknJClcg0O18tbVgR+xyKVKSSzJk9PoSiIZFz+0xyAFDQ4KiPU0jlbkdHvJhiW+p
         dzhn0B/NVyt0Pr+PhIgsm2vb4Xf/Fp+RPiXp5qb8k9s+ntL5rubIKxo5aPz4XYXVLTNl
         1eivd4hWItqdmh33i8FabpWnyABZlj2kZpj9dAGbOqai/j2F91c7hS66tiv//5iKWyar
         Dewq2mYsNFe6mwmDMgakvK7PNw4ZJaCMEIEt/TJHjlvUT8NTTrI2R7BkVqGB5TZnY+bp
         qbPQ+60uA/DASSwQpdQ9i8IgfG9osYC8qt+KGVE+/aSD11n2czomqxBO/abyDMm2fosT
         mCvg==
X-Forwarded-Encrypted: i=1; AHgh+RrxwOHN6Q6kKoq+gXnGRB6e9Fs163/zV/6Baq4UewUmo9mQAElcSthUKo5bj1zISRm4XEJ13f/ZawYn5EyV@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJFr+Z7hyZ6iaQOCopvUCoSo2Pt4r3pNMcAyWOELmBx6nnug4
	UXN1SINV8i5wsbKhEz2q4R2+NF5xApQxaI1/dCofL1B8s1j+OHvpihst7YZy9VrwRWhzNvLls3t
	U7l8swXITWrYYBdLDiYOg8eUu6WLc4/RDofuuaHuS4ie+PgyKUf0Ysop5bWb/kZpEE8v/
X-Gm-Gg: AR+sD11IP0sM62kdF0NVZ5cGcUEkzN51jhM5f3AGVbg5tW7c/73+e0BRFTheL8AIDSV
	byZ9QfO79Is064oiRZxNtgkbrer+qiAoUFeAPspFTVDzZ2ndWm3ztYVHknfguH+Z1bmgopQZ3SB
	KmqVmZBhPiPfx8mr0vbIFV8SvI/Clodx5O2jEbbYl1OKtPHV8kDJn1nAhVeWtK53hMNwFxricUQ
	XjXJ0qoOeXl+ftVkTKHsjOR3J17b3HFqb2mEtWr/OmwaNHMNobaNs0RdbUIoIk8Z1KgKICuTqpU
	sb5k4MSOiUYPYIxBWXY4m2yxk1sW+WVEVhnxmvfJhX5fJEv4EYvooxoRbTd+sWXUmzkZuy41/b5
	s3yNYHsKAh9OhhTi22imMR6G4
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353626485a.4.1787056783610;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353623485a.4.1787056783103;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm123750166b.41.2026.08.18.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:42 -0700 (PDT)
Message-ID: <950bb08f-201e-45d5-9695-5c55e1e61c16@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXw38OPfqLHPpj
 HgrHF/JgyzySxXtacs0YNOWVlLBVZxIdRyHB7ilgutInsuWeTVJ+A2MimZL2y75hBnGqo5uiLiv
 r9CpWG6VRL+Ent3MngOSyXe1dx5TgFsAxhnSDH4qrfnPnqh+tkvy2q76kv05ueNlB12AhK8idHy
 Rxe6k4194BZrSZkLrHvmGRj1aPxagyGcb7+SHffXEeWamuywno1K6P1O562DGDeRxsFWqOfaHBf
 +7CIJc7SeFQ5pqOIhLIeCWFJRxe1niWv1MjMfVqvS7BObvQQYXxe4zPikymdlo3jWUY0W1jrO42
 kkGwunDv+tWBEe+46zaddjwh8kxjBD6O9eEXZZm8fy6NJhWn+nzEAiOHK73KePsgx3KMa1YmqZ4
 jXZBu+qtVGsLTHRApDNFvQiL7eRe2AlWYZBQEHViLB7RsAa4/Z6NY7RLMiG2N7XxTQMZmonM3A0
 C74HVDBEFSQumvM8PtA==
X-Proofpoint-GUID: P_fJoC1fVMeeD8woACKkHnairqmaj66l
X-Proofpoint-ORIG-GUID: P_fJoC1fVMeeD8woACKkHnairqmaj66l
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a845290 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=XGAgDj9QmdH_QUsWaD0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXw53VsfSPZqlB
 ofkz8JhJrjUxR8W5jpLS93sG+7RqYUbGle1TyPbDOP/8xpOkIpfheJ4pbFVzS8VbTc12NFPPnHa
 RKuNdl0FMUjDlvrkvcPHHIHaihA08V4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Keep the rail enabled because expansion-header consumers are not
> represented in the Device Tree.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
