Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641149550A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850115; cv=none; b=JsMXYYea/R9XPHGIsDGGYgaf6xoOyblEO4CqpsLpCPDeYheN5ZP8tUPB2H202NgynPI9MCwVFt/0bJ5OLXuKAaqxYApZ/RCKCsfENimJiDKr4lxIlTeofg7Ymkkv9qHJPv3pf0sC4lDm/ebt69yTXG0w4UBWHWakXOWqfQBcCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850115; c=relaxed/simple;
	bh=VLth3SEu7qG3r5aWNeqIN5rjqfJQ3Q9Ak0EseKunHjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVaXNcEtbi/+xvVJhHAGKyuo2qtT2qh0tx9OHiej1EkwKp3xb/F3iWHkF2+0oh2uIV3loFPhhsBN5AmU3GgrS5UAp9bTV+H+9hGo7O5ScJusXJUO2CesIfGIKwJuMuXh+4UMOp+47k8DwMv7UKi6FSjV/T9htbg/j6ZCu/pRAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jecm9R01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Umlqj17J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jecm9R01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Umlqj17J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfJ2865929
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=; b=jecm9R016Au4SOfa
	9DHqvLJPactOk7aQdK/C4SVlQIDFnr46AJq3kT1lRpuuzEuEStjSDhuWZmBgFhwz
	+tgf26c9sVpNxGmxBxVJKgPo8eW8YRfojy/11FRy9/tXbIUvFT1TfgQ4KI2g3dio
	U/qubr+FLspGfIB0dJYsqmwmjLn+q2pPEB5ISe67RM2QzunWZDMDi+jnlzc7hGIH
	vBhKrjHxmmNe63U6F8+esRq4NhYizZhKei7/m+4Ujojc7EZ7NDs7M5w7jdR5CEPh
	yVwGzKt9J5X8o3P1gx6ZSVuO8ThEdUAk+MeKeJl9E8tazr0mt+TLc3A1As2Jakl0
	MWu9Bg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8ucm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:01:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso211707b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787850110; x=1788454910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=Umlqj17JRtiVoyDa42/OpuypxTSUCM5VnbGWWtbswpMLHiBHT5hTTbPanOvf0ZZNxA
         cjH1odyx6JVeqB9gbobnGy/ckw1ECn/E/sTWLIPiZYD7r2eLkBI3G3qwu8JMWHi+lKAp
         1S+30KAJcQSav1Orw2k65VMWmV5l48SId+D0jPoS+nMw5vEM4WByBWuzPWoSDXziZi/Z
         zJUD4OKDkfU/5pnQe43nbEsND+OTR5JFqCBvNCsp9de+8p4CMTNhzU6ABkpkoC63hrQV
         7xLJSqTmKe00JuOrD3k0M5TQCVXejmzcx1LMCnQonknkBsQO1OtLfF+myeyNMtxMCkj+
         bS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850110; x=1788454910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=cZ44J/3ljS5ZqHl81y4SbW/8n0E/T3Llr3tNX+aS7gK/4gjbC73XOx+tZGEg5TkeKD
         bJVBYcrr2U5tk7Kq5ShKkdZYZIBCgz7wFSvBiVN566pnKsWFBi3AulnzGYLtcnm/AC2V
         0BuOl5D4PTU4MioXi/CI9HHS4IxN7FwACSYVh7yAI0G000+jDeRuknR9mL0+YGD/VoAc
         OFW6ofstQzhhBKJTSJC5smfh8MoCoVb0OKbxrDAIccDudEjf3RcDkQ21Zduhmgz23Tb7
         WE/Ub4uTbrQcn9Vr76MVWpYy/IqTWA17V5yOswkGNicaXKcyYUgKocepLIq2cYfzkBlB
         94xg==
X-Forwarded-Encrypted: i=1; AHgh+RqJ3GpYUWFo/RuLV5/trCuZjz1iwR7OHeRKvCSRu3XSA33RcXrWdCLjNp1Xki9RDUQTuwFR4oqQt61+LQWP@vger.kernel.org
X-Gm-Message-State: AFuF++kTMcpufbsVWLie1z6lZ1+pNqBzaUAddn/nG8JbPwlGwbyftbKb
	7LuXrGPcB2KPgsXVZhm+gSdXUmnoOOLe/NEh3xBcwEV6fYtdDPbR/70MTU1FWgw0AfERn5vpnrf
	blrYmPNxuT6i7Vd+LD0ou1Mo63D4K4b5TGEkH7HX29G7LhOPtewPOo54egql66DLxx5OQoBbvpG
	6B
X-Gm-Gg: AR+sD10U7BN3eQQnp3tZx3evsnpmwKAEZimW7e09td8r8bSDhFdbj0ucrAEG/dGnaxr
	HqLqUYNMENxgDXCOdUUmI4GNM0g2oPlrp9LziycyRQnRhm89uaBuHWI2yptzFUjVuRta4nK12ce
	IigfnzoLB8wosZXUI97/CnY9ESIiFlg7lJSEcFZMP10b//wn6Sr2XOM6YHxFJMu3/zqLdgyUf6c
	dUjulbct+dKCnZGXqiFJT59pxjPMJITD9xHuCcfavPltTOq7UN8uN8Bbp3nfsEtjWb+gFG+K+0L
	eOzZYOgUiVYCauBfYyMimPPbNF+e/KLnRv+aS6LYcxkleK9+eH3qdblAYIbN/2wwcD4pk7Q2EvO
	M+nF4IsIckHGaLPfAaIO6bslv8B9svqo=
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115449b3a.12.1787850109632;
        Thu, 27 Aug 2026 10:01:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115017b3a.12.1787850107481;
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd81d22sm2404824b3a.35.2026.08.27.10.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Message-ID: <4466c3eb-4de1-4240-8fec-765a4910b217@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:31:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
 <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mIK-BR_8shkgOuBhCdVpZ3O3dHq4d2rk
X-Proofpoint-GUID: mIK-BR_8shkgOuBhCdVpZ3O3dHq4d2rk
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a906d7e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XeEooGCi7Zy1lAdgIjAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX+53lb+JGXrfj
 a4pnTzWAR1pkeLCkwwWiAG2xhkcw4bIl4r4OJSWF1ax/dVCI9Z5QYyUkZT9xM9zsQRb0mEgr2sR
 KSLM3yNKwjndZVyTr9Rin3DaqyaSobbPoToFcEVQgMwpiWOzqN+LC9AwYEu9l1Zf6FUTAiov/Wm
 k5qmA/E4jm9aJZc4HrfJCMkj8qw45i/FPuXOGx2NUw9h7I12H75Pckf0qLrhU4UfjhjlLxOpSly
 RaESNf1D5TJr/FMVqq5abSO1F0FVxxD/r8dfysXDKBmLJgrbtakdyn8S52HWnl3bMINeo+us7aB
 Kv37a/cpIgl4QYAA/uQcVfeVKg7jnb6Go8SpJr2UJ9L+m6SNJZU1YvPQ7v/xSwb2Zg0nON6xq5x
 37LwODCo/bQ08prHetQbIOAIQD+fLj8zOXD3Vtt9qzlaRwlF32+G+QpdhONMSzwo7k6h2YAwG4G
 ezj2rd4F3Cv99K64COw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX07duf1VBM3jx
 /rCqXUbBKHHm7C60OGmhuj6njuIc2dKHtkGMFkz/7GQCs5dLal38Bnhrshin4dBaowa4u/JUcB5
 PVe49gLIrFT8fkWfS8Im3nTm4e4CkVk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270144


On 8/27/2026 5:50 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:38:59PM +0530, Hardeep Sharma wrote:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
> Missing minItems. I asked to open other bindings to see how this is
> done. So for example you took qcom,maili-rpmh.yaml. What do you see
> there but you do not see here?
>
> Best regards,
> Krzysztof
Apologies!!

You're right, minItems was missing. Fixed in v4 by adding it to the 
clocks property.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma


