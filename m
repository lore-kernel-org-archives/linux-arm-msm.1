Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A54A68B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820263; cv=none; b=GrAefhAH0TWjzrhb+6o3pHWzO6URAccyzeXXCR7I27Py4OlXGBXM3vVSQwbdhUnq1ce0FFwHe2tPFqQ9CM/YlMUuacX5I9ZKXOgQmiilT0FrvL29dhDnxY8iyGaQtdtumD5YwXEE5ddwn9jL5sQwnqFWE8h0GXsJG4sVyVzuusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820263; c=relaxed/simple;
	bh=b4y/kM9nQQeiicS4RTPuO/cyCI6SZtxImdln7AP0eZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k49gq5P2UGtJkI96yaQqmfiohAiwCdDiOt4+YHd8yrhCxt8U7VMtmHgD/67DGr4eY6NH42Pe5gtHOpYxJgPM2xvbakZ8w4EMen5EUP6o0yqNM30pItl1nD2nuBBkQ+wrgYwIOLFY+nQWiLc+pycngAqhHDHvvMghhrjVNyGXndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgnKMsfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDdIE5Bw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgnKMsfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDdIE5Bw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFex7J1290961
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=; b=LgnKMsfRmMGGmS8G
	ROI0RLnP4v8Z8mPlbD1mgqYJewbFWdzNTuPkCXc16FYH2HH7LBLrJ8ygTVE38SPS
	9wp+tfTiGrZAURct1c/AJmPl1j9LPova8wtloEdj71qJV7kGpD1Gc8XdA9IcVkl1
	/kvxltAGkD3oPMXmqP8RCVPaKtiexVrFvy+QqvC6cm1kMQm3B/LrG/lpgyjVMMV4
	2iOK6R3jDXW5iI3TUxcRhrOOlVqWw/fPDM42PS6azVoXCakAA9+1JA1Tt107ngR/
	8nLVsNqbMuHSXjlM28sZR6W6njyAGW+Y5yJCCn3UWtHNrxl41MzzGgLN7Qi2oiCI
	m9oc1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsgh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so30771985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820261; x=1792425061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=dDdIE5Bw5KCYNCII2fqcPoiD2m9yHgRgmMzLijVd3fWPDE5gCWwWy6L1VJwFJ9GnoT
         2lzosVxG0hRzK8SGFvl6uPRvncrE7wwSf676LEk+Op3utkmTYMtEMwMan/ndqDVk2J75
         2iBHIPsUpTGD45c020BabrH1J9lnQXOKguy/ijs8qv3DTBxSSD1V+uuR+T3p/z1F1Yi0
         nyiz+ggjy9SExQC3cnHxueMF5DP4vgs2jCd6T5RFT4ngfvbm4Xsi+LyTphzqSWWtEAXS
         4Ke9rogvn3DMUGEUBu6UwVG4QAzNPEHxHAB55a5ygEiqkuMG/cMGAg1ayH0xEXrAkqLw
         y3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820261; x=1792425061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=IXYIV7y5bN15brYoQKVzVAPcAy9RF0yaQwThhK7KNA9T00LDuCT2XfVsDmNEWJ1R4Y
         nHZVyG+b+ne54zbX27il6xghUgd0DPmpE9+ccblqBJYp/ceCqy5J+ExoeK9EuGMfWwzy
         pbv/75Xk5DBXbmcmDZnDvRdk+X5JKAUvhWEdOLy0QME06ISpza2W9X66sWiTCtDP7t7h
         tkWotitshGfFTrfWZFIaW7ili3zE8OYWtuTdIzLjkga1dfxkBHM1Q5Cb74jhX7tCYNO2
         tCozsmH6JgsxyoqU8HA7NUAR0iFqDyhuKmo6AbywlmFpvfLHFyrfa1IYdn6Ky/5rezsb
         i5yQ==
X-Forwarded-Encrypted: i=1; AKwUvByoC7rIdyNx7uMp2BPOZCYqbfVycVHu+CJvJK2cK2QRRVZMueWWR8mOwjHt6jQOV/MiAqQ0yECYxlwnJNcA@vger.kernel.org
X-Gm-Message-State: AFq9FYI3FS+pFpwLn3m051aKOwP50iFdVcVKz69T6z81g3AxtBAYfIlO
	KR9rHCDk6tHIzFfzbkl3C6Gjt1J7dqlYA62meKARYrm1yXe5w55j6RO2s16b5ybDkCq5TsiTmVC
	ODguWUNFJhusG3+k/jpOZi0MFF8Evd5R7X5EJCG3ngAdUA1A/J6IgqIVXeZJSUtJ9jez1
X-Gm-Gg: AYBFou37bVr1ryi0ceUN9olYDNoesRCLR5bFSh26wbXvcLedG4shtqJNjDNsEhYCYqT
	oxB9vIPUrH5F17Gzwdasb+vEtLKfeWuT9vkJCerW5k4oAd/1njpYdrGoXwMyeFIRX+5UPln7/Aw
	BkdEa+e0Cv+EQ4sUWn/Rby2L38UJ0yR0BGYcz623RsMn3tTxoSdJyboEjrNpf1LZjiT1nZOIkTr
	mYQQK429MRHmFJcjL9a6SszCCW4za1bmin8jCKUOXiFCoRlePF8zeKNkbz848PeBolMtaegNdf7
	Hq32sus2P4PwlIS/L94BpIAct4O6vua6ojUawA/4I/QEBGroQEVaVqYCPZp1vGWraIOMaRRW3yC
	7L6iLHfjwdsPzzvS6AFi+JA==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1783960585a.6.1791820260741;
        Mon, 12 Oct 2026 08:51:00 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1783956085a.6.1791820260306;
        Mon, 12 Oct 2026 08:51:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:50:59 -0700 (PDT)
Message-ID: <92707388-73e5-4843-bf7d-b43fa5a59bba@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm: dts: qcom: msm8660: Align closing array
 bracket
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6iwZEvnCo3TIQ1Jb3dq0Xj1XMknzXaeP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX1jmjwjopHC+f
 Lp6j3YyJpWj7qCgg5E0VK/xcWUt32eltlwGPu1m3V3YHSchY+aIbYxBdt3WTnkjz30RlEomfNZU
 PXNKiIwSGT/JazvO0vfeeQwDm+JvlDo=
X-Proofpoint-ORIG-GUID: 6iwZEvnCo3TIQ1Jb3dq0Xj1XMknzXaeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX6y44Owdm3fEi
 Y6WXCVQKBPV/ej0djJrXMgUKO+4itgZqOjQNb8F2XIXytkQoIlloFAKHjcHxJNkGV7LtynQ90Gj
 XLpvFBX1q0RCv6a+7hIKKhthARgYigMPvC1hMLymqyxA+JqkIScn9YyeEL8TI5eJ5QDentolf7L
 eHUws2XP5wBO8BS0KbSs+yjmuuOKsUUtYxXhF46MZYuDh0b+V26ffqnq4++5KSf/UkmO4MEwM/K
 x5KT7WJAFZ0UYzXpdSAi22FnbBrQlNuFGlpyCCUhWDI9InibhCm/n4blxJ4djRdhg93VZPFWD7q
 pbNIaUqJsccD5Ikp1mI9H9VWlHvcpyC/aqaqmyImwIMXvmVu7YqRk09+Ju+95wElluiXJAGehZH
 8kYT2LPaLY7KCpJCnJ1pzzrUX8w9J9UiREBN0FJ98VKWL6bohk6/C5QE6vwaRGf/vmC2w+SBrVL
 s6HGbm8RqO79Ko/yCZw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd01e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=C61bhbeWJC_1YFl37gcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing angle bracket of an array should be indented like property name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
