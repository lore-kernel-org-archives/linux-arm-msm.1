Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1704C511203
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059738; cv=none; b=Loul+EWCT82IbG22vsL5OcbHE3hoou3XaUjF4E7OPJXunoymt2bAXtq807AH+JgTXseOGNg/nX4sG6oFRr5sWCpyF5rl1q2cMi4Jv9LUE7wW6MLecHckTQGQYcrg96mDshOac6DTQQSTrx4geFu1YSJN8vkCwJkoyn1uq8HRCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059738; c=relaxed/simple;
	bh=6MSznKxRApuG2ixvbDRUNzwOtA4rFjejFEE9H6ua5No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ti9qmzI4YZOndPHwxmvu7PDipfIwsKDH5x/B4VZyliG6RN+RYpnuouO7ZTaInJktVKdbdQpZ98vgwM2R+BZ4VCg4geaW09QysyWPxRTHwTFpeRLYPsgHUXf8ajoToJ4sv4g88iQHhFyqNHDFmJJc/JA0O8H95Zrn9p6hUU42Lrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzKH2kfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0O4lhRc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzKH2kfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0O4lhRc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jaad2966458
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=; b=fzKH2kfbD4D2ODkP
	v+Gv9KSXLkrg7BU5fht1etcbhzl3sZ1RahV7tNY5ayu7toHL2/QSwcNUytXKE4Us
	gXjdmEuXoYZwgbNCfRPBKrQNm9D7ISlvum8n3m2NkGKPYe5oPiLAHMVbTjset6lK
	+PyiRhD2YtsYpbbbNdDUx1PaoDVoQFKrJZAwEK5hrQA36im9EbynPxxES/GHI85H
	vN7bOWtgrz/yoUswbYtMxBKR53hfAGI5qc3Aq1E+Xe7gMNAkRXOxqt4QjePKy0k4
	7Ykr41PMd73atPCook9wCIJhHN+2FG7RjheRYFVUTyORV0FBCXY3Hy2XtWN44i26
	cCUWuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuhvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:22:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338d5d0509so11153681cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059733; x=1792664533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=;
        b=O0O4lhRcFRZ/1vZ4E3lcTUolgQx5t3Q0QMVy9BDC7DeYuByEFHae5snzYmN5eZGWbT
         /Rms08L3wEdglPq1T7cB0n98a7bzYDjntH4mHavijyIpLvvHDXH576A9p4l/zPFA4hym
         CDWq/8e2smb37VBhJQxuM4bbbvpi1N1TbMvBUBy5dcKFExCTwsxLuwfbhXQ+PmtniQPS
         lMFojTWJO0S8ZYeTgjSttZfa27nINOL06CoRcl49BVpQQ3D9sblUficEa6ldStZZdIip
         EvjgM8YkK+qDC5rEjtoJW0dPUlIkuHYzBqHGrL1qhvKtytfVixz5QHZ/TzWFYOtkgTV3
         jWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059733; x=1792664533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=;
        b=IQ592o4h9Op2KMfJHE76/PkL+yXMdUg1yGZ9vL8zJiE0TWgZjoFnpd0CDXKzAJE5xk
         7w5tovMyt2q0VH99txmWgjf+bZENg6bsRnd2h1mgq7tEM3DBXXQ6lPh752U0L9U1aKhP
         MQLkNKwCsGmmwrz4vZ3ch1Fq5osE1KXT5edlCg13BaXwWghJaFjAAmZbRs6Q2+gVceWe
         cwNlI+DW3YmNsOCQtUZ3YF6u4YNKU0FdjFe3RAEbZsHKLMl2x/Yzc3HmEwg2ixBjjCC8
         N6DnfpEexpm+s9yC7Q8OvhLSrgsw3DS1AbL8U3LxXsg+F/S6Iu6Eq2dom0rGxJ+fp4nB
         YX5A==
X-Forwarded-Encrypted: i=1; AKwUvByLqrnEv21NdV4pt+Ec2lqQqSrVq/+yOYeLj9TqqMqSiGu6/83Dwosj3VtiZn/UtaHSmyppJ08OUcAomdxJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJsrerwB5Xbp0q3KpqGR+J6PjVcTXwVVLoYOiA3CoFgNRL9Y/nx
	ddTSHDbqQnwwfGnA9aV95Q12Ypub/7ZBUiJKbrJkulQkXF3am2FPtUkx7taWinceDtbNW6jKP5W
	r6wkVGbACpwJhq9W/vGH29hdVVHs3OAOAogQE4d9eEHHmmKMv0Bogct+83mpmvPZmgrPR
X-Gm-Gg: AYBFou2b+WKJCVBhbHkjvAAn0yaTrLfK/14NBad3+rIvGchO7fmRZCzXqh/WKkvVJs0
	+XI3N8XGFJr7UOavafZlUgzxNC1ILUBBCjYcIpbadjlsbpznxAyRTl9dSilH8jnyF0wB1yWJ7lS
	PXkVNjw2VDErD0/yLo4K5GqbBoUQGMU0O5OHo7LU5OZnJz78zp4vWkL86l05N6tUlGTjGV/RIl+
	+QwcC8/vgcni923OASf1qTTSDmaaJbNo20z741iqcy3KkB1umUQI1Zn3MxLpm42Tywi7EOTPx/G
	LlDHtbS3gSOdjGSSum1hp9zQ7K0/vsKx9p2wLhdsd7fDbNQJyVgF26IfPzVAxg69QGQ3w4eLZ+a
	FCK4WDXlXN9QFO58KSEwQTw==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3110396085a.2.1792059733310;
        Thu, 15 Oct 2026 03:22:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3110391385a.2.1792059732804;
        Thu, 15 Oct 2026 03:22:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm107592266b.10.2026.10.15.03.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:22:11 -0700 (PDT)
Message-ID: <456820f5-a5d5-4d7d-9cd2-5ebd67129b62@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX7KQrr2M6LfQi
 eFW2KlopgW/65zodydY8t2RLeF9e9O+9tk2HZ8snMpWdCz4a5w9xYJM9UwYY+artHSVbiuH4qUN
 4rtV/kUi8VqXsk7eU80J7l4WgN6hacE=
X-Proofpoint-ORIG-GUID: 7LfBUeMe38J9vWY-m1pOZ6pvq3S_aKsW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3JgJL+BpF6pu
 QoAkDu1n6uMwb6I3PdtSvVPFlXAVJe8hNJptped59MsN0Y7bDPxkx45gfAEQYtGZAUzK/H4nhYP
 XVkhnrDz1ktEof/V0fbtaZMyviSbzLbaJf592/RYaLpPGBc3jYq0w4bODUqDDQrsUNBNaXJo6lo
 ts5ou0ydCIJHweHZH1URA8+5CVFbPOtU+MQLrqf0FJ0YCQY+HrM9dTi1tF5qgj9Jn+gUIb2AxyH
 MkuFyuXz2CX8FTbFkSdemmoa4k3nzTDfvTLSXiYdpJplXFLn3Yx9SnM4Q9t1ODvG3YZtF3JGD4u
 0Aj74Nk5uGsEkUEU7venpOxaadDG02scde9+qsVEMuotR8g+LSbWUMH9+ae2IBxtX5to+UAqB/R
 drh3UkRuO7hZx2Trt9cIIK66ehsLZfnN1CQliPx/+zS3jmARZozsr+Mpm0ayFCgIdWO6xtK04Z6
 NTf8yMpL2NH1OgIQIwg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a955 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7LfBUeMe38J9vWY-m1pOZ6pvq3S_aKsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
> the NW GCC driver.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

again, with the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
