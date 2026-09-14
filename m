Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F543DEA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382744; cv=none; b=aBKwCOBGj/2pM5WqZNaImNNdZVEJh6RraouCFEt0yLHVcpY6hI37xM3oMXjFv14UNX9fAptpnQexmOuh329SaHTm7dMSuU5VhMqAkzSkS8opmtzm9SrUe9eZaDRjaaxUldc4QL/Fath7MZQxw2WV9NLjeu0bbsK+aPawiJkYoZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382744; c=relaxed/simple;
	bh=09bElBSp9ky30rD5p6g5MgNvAR3/QKYinJ5MW8haZE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JS1dXSfVJUsyBbdxAbpZM2k/aRT4JSE7Dy9D3gnJVI11rsjkprZkVrVClW9BwBn6iHS3OZMPWtGgTlxVKyJoZMX2vyN6yaohub+DT5zUJZENwbpdAF+N/DrEK90L0lUhq/coMBxdsi7bAUIxDBiayRFANsfp+CkgTrkffdgWzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGG/q5/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahJl3482; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGG/q5/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahJl3482"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nQdI599715
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=; b=fGG/q5/lJHIsPKP6
	8Sh0gK8NfrffriC3Y8WFqBMwkq1F2xstIxpSmQNWIrIAG32UPUlNWypW5Q20kMYJ
	jpQ4RGR8MHrkZt52OSBQxYvPU2erWqaWOXRxK5nhg+Gjmrm64sJxJ0u5YrREZZXw
	CBwgQS250yx5jb1msqfvtYZ6mE/cN5J738MPuaCI50XKu+PqndspAfdxVIgB76Az
	EFEc7Wwh7KqVw7buLC0Ot2Patwkk3KBN39FjirpcatKAKEt3tTl8xVNH6N9rsL5d
	W33Ukd5HGq3PKDOwH3s/M4t5ia+fMhBa65NbXap6KcELKkbUFV2YG7Xjs63wtan0
	zO1jig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rfch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so51652385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382728; x=1789987528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=;
        b=ahJl3482gjBbGtlKgPZo1J3+9vfgt9jBvn0RZa2QciBU/tmUGbg4/+8l6zPNB5sy/a
         rAYtPPnt5SgwGASTfYM3tc8BU1eD1FSVexS55VX6pO2c9B3HYUg3CU0GEvAOgyt1kr0i
         xGm8wyj5OfMuK4QAVxbnntYowBwITxm6am4RPBTuaYTZ/tAauDduyINAHuMFCg1oS6Da
         kkXa2gDWWSQij1MH7jT4y5Pul/hh01PqhSGBqSluBNAYv2AuHoobT0LnY8V/FrkyWSUQ
         f9NAQG854UFcOGcSQsO8AL+Ad8D0cOMuxs6OVEf/TBiziVcUaTkZMdMD7XO7W9dtVd/T
         2Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382728; x=1789987528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=;
        b=eowfaQkKH7MVAaxzoYTvqCPNOco1X+Ds4y1EFYlNjLqlDje9cSgfgByFwN7DLRO48Y
         IblXausLsqkLQ7sPes/TxWvdarfD1SCwgCdvRf7JOQf2EhiS2ySFzJg19NjMFuqPwp0c
         O1rYmhOyRqkbmUhCoN4tjAGU98oGDBfSPo8cgOQpQhYf9egc3Ine43P6mLcfjIat4oO3
         uvaKsQirVYmDD/+OQ+mpkJ9mKR0yVy5WU2TRsKxp8I1aqVzHsrAD53zl/Kg57KnOxU4R
         Y+rzIymv8Ucli8ttPeoiAJNCMompOcCJRMfL0qkL47T/4b76ICTxOklObfzb1VIeHpcj
         IHbw==
X-Forwarded-Encrypted: i=1; AKwUvBzqVYB83e1q+25mCZFGeB5d7iPob3rVUwNE4ExPnyLu3d21FP4HdkFWa6E+9h47xT+4ipBPL2P29fiwD5iP@vger.kernel.org
X-Gm-Message-State: AFuF++nWdUwhsMDisjCt+Wn31kszSjaqPBNyD4YB9XkPfICUh4g7rkRH
	l/5hnhHFwKNnRXS5ASS/1YYXynwUARfCCE1CqOnHREobnfl4SfrWPQAslMqn4kkMnm/QtcKx8ik
	fKBxQZZvoNRzCG03s8yQ0fYQyNJkiiqEjcICBGB06lydFEbKKl+0G1BfUJMdWAOIbYPqd
X-Gm-Gg: AYBFou3sD4EQ49d1Ma1mEqR7bYILjNGeVImGv1Hn3Q/VAv81SfTa4pM8vI6uDCp+tGx
	EeSkzb8dy3UYdSjCtTgQM8awFkCQ83vdy4kgASC70sLrPcDic0ypIXXfsL133VBnb3N8XJit23G
	Qxq4w/fPvF+y7fYMfsH5kOhPgWd5N8HQ8t3ie+jOeiLw2mYTZXJ50ndDo/pqejJJd4jNtb46oFF
	RElMeEOgm3I9uez4TIs8qMZ5LzQO5HM1eIRG7gzyUZyYGDngWdyyDLK2XCjbAH806+3yOoF4AuH
	tUmTDcCJbNfrzuR2fxoNxXDf+Z4CAwtP2D6VdTEpOY/UG0JSzlorDWx6Jisda8ye6teklgt9Lf2
	tiy6e9ZpCRJva5qZNmKgfJw==
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr182315985a.5.1789382728084;
        Mon, 14 Sep 2026 03:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr182312685a.5.1789382727735;
        Mon, 14 Sep 2026 03:45:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59149dcsm4125481a12.13.2026.09.14.03.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:45:26 -0700 (PDT)
Message-ID: <38874e77-df57-4254-9d2e-d4109a0412f5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:45:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXxlof73doRxwy
 X4HI4We+JNUxXR+iIAEH8f8vG0I8p7EBAkNN5hsa9AwAt/h7sHHHtWKd6gwzj7I2eV/BLJW3tyr
 drxLeS/3Qp6OipP28OuvFBLoG3pjXbk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX40xvEhq22k8H
 2jG3b2sl3vMzJ0JnqobAumXyQDJV1xcPxcjyAuT7PqDBMTMHI0gMXQDQBuwd2TXkAdMl68r4N+M
 jdXXpd3xdIQwjJZP5ToHqAWkE9JaQOkKvkv4eSWkEuivylKp9N2ZHeJMejMtxLZ2bL2ExOOQ0V7
 BwVG6C6Nt6pzo13SKRFYC8M8FMLDKAFWzEy90qY7UaIy1JZ/0EbuawEQwtpc1blX+/u3Jm4q1O/
 ZzAm2+OrXGrNpfzN/K8Ak+cmUktzX72fv3uWi+skwsA5vZP12hj24WcQYx+j1qzSTzJI28gNJO6
 oLAEX29mejYVHhr8617QJELPpYYBUFgy8zmIlkkz9x4h9jwE/W4QK5h2/+2ivhjJgBPkFYH8tSn
 KtVcRaSRadfsi022kJMR/gCzyeWB26dVez0UbZL2tKm6/N/xOXRkT3y6JZZjuOSURA3M4qBZqCQ
 AcieZcyKNZ60bl3UUmw==
X-Proofpoint-GUID: AdvQXqN6-c4Gz6MoEpbu9NE6q3mJMF54
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7d048 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FkmPcKp2FLNqR73q6TwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: AdvQXqN6-c4Gz6MoEpbu9NE6q3mJMF54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
> a board-to-board connector hanging off PCIe2, using two lanes.
> 
> Unlike the Ride Embedded board, the RRD generates the module supplies
> itself rather than relying on the module DBUs: three discrete buck
> converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
> 1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
> while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
> peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
> itself.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
