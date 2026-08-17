Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD73B961A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953292; cv=none; b=OSKVBRHUj0KV5JlASxlrBwI+rzsN2bCK3UKN9EWSssVkubDn8Y4vbwFiqleRajg94SYuW+XIp1etjRVH/YbYA56hU1RPbFqNdEtQULfz+PzSF7aJWxZJFH1DHIG9L4eetbw7oYlRyI3JDkedyYOHpzxc1rqftzQdItwYQeKIos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953292; c=relaxed/simple;
	bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgL/OieQkVn9WoKWoRpig5vMc7Xh/RxVLMcsyFXsqCAkKQBp4k3KUbeIOJsG6QhDmpJ/MRLNvg5zyo4RZUky0dHV2wbybk6MNCdAk1g9sH7jJTp21RIdJucHsow0OItq7HYr2sSyvrvbGDAOpi2xPTVYjtX+fP21eIFn7xYLoEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD4S54eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXRanUXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD4S54eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXRanUXp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7souq1297230
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=; b=TD4S54eFkBGd2wid
	FOhbw/dyQ+WhYtOZ8/hFDbJ0uOEwnH7m5o3hFLKrJAr5us5TcOEqvUahrck0gNU0
	DAb3G5dE8tJirtVLN+xM0RtJ0RyzsCRW2A0QWDvlQbr5Ah3hThiyy1lwKn/SvIdg
	ghXBqZrrvMx2vrugZ/nXK7We4spb8Zm597p1Yf3Wo3HybER4OaDmi48OGywvpWh8
	xz5kWjVAF2VyMsrRsqfwwC4Moz804224cbofNaBE6Oa/xko75xtr8ktAQhz/QewF
	j2JMf9LVuaanOkKRwUrUfPj8F8m2TwlAbWewEyIdcffr5h6HleRAa4wtvee9LJIJ
	iJx3pQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1g00f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:54:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so3428116b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953290; x=1787558090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=NXRanUXphNNKoD44uBnP/0OZHGY3XObOQSfY6tJh4RBvub9HVVJ/bSWtpmytRa8AtS
         WSKf4X0Qlh1qu35wehKntdv8hagr7yotRhnq2B1m2tdTrEIoBLlwGPpNZIDSQVMNpVHh
         gHpC4o43o6/xoFAcaqb1Xa7ZF19uJnPrcWC5Bhtn5pMvYrkldzHj1hmRIl8xIHdg1KGm
         KHGEPjfxvb46dJ9RCESEeAlanE2mVlWto6DgppmcGyfa0m11rLURHmkqjUoFpYsJMVrN
         q8H4L3lmHbQMK53gemzDWkehOlj2pWZP0hqEdnf2+2vvH22k9X2Pp+oErYPdMe+vVG3T
         0eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953290; x=1787558090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=B5AOb7PdEXf0SXhkujW1fJ80SUk9I3UJW9kXp/nBPZPAUetN71J8gMubY3KCPIn5eN
         thGTTjKJ2gf+nGz0SJa1Lcc6G0Rpko2u5spf10crjgO4CC6Id3oCixqLPT299VJ4H/VN
         Gfvi42ycKRq+G+EZr4JxpgSHZZ1xt72b834AozWi/dgpyO2N1BCRtxQlas0kVffcftwK
         4gbXv4dI3t7qsOnp8YR3QJEPfiZ6nbfjh4z4NkkpCVjWQHWtQcl3YFNZ9fKxouMpg9jF
         CoxR0xB9yXNztpg1ntGAyU7vgneIqqKfYTjkAdNEX4BGZDU/CJAtv7sY8lENuHsX2fEh
         ZT+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro4RA2ebnMx4ToBSpkI9muubil/wTxPAtLvUh+qVxoOfrr0qnzhgUXzBJaFWrgX8jJGRMvTAGUdBscwNRa5@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZyGlCrJAk6H0Uekd/AnyqepNacVwrWK/50Oay6NEyKIY+EOr
	YzLLsZdCoKHhjuxKH4IZTxOBODAAAqAqUo2EKQwfgGmHKtU5LVnyuxKZZoE+Y3B865MSrEjiCJQ
	OQCPK0LTEXZ2awVKmG+Avs2UuW8/PFtvcz/tq8ugUo2sML/HmK170WN5QBUgHEi+UfnHV
X-Gm-Gg: AR+sD10r+S/cIKszZ9vSWmm8ohiWyn0OTpVnD2MesvSS3denhFEaaS/UtCw/QWVhC1t
	qhQ9tiFyqwyh2v4zkwioPucaR8HwBGU7geW0g4+xopWTflgyq4d4kYYARIEt6aR5lkCkK/0njm0
	nQL8hreHYGNqlJ1is5u3ljE75LDXGtuM0MHHUHLKNNmuTY43MtMHhJoK6deDtsi8EmNn9YHl/li
	Lx9t+TYxTWcGsvj70WPXBOnlFq4UfTYoo05k3wcDMypPYkVEurgsqkEV4TgtHZIoFXgrHfCDGcm
	FYYJDdph+REMhzrcisgg0bKOORapmOV9HvISulphvzWexuq9oXAvqXu4SBRcNCAsKuji80LPRiL
	bwsNiHrS78aDxamPw+WWV14HxMobxVZ22fyzUPSO68UUXQ0kM8j2SitWfbomuzv3IpzOHaPmuIJ
	52i2GX2tnV7SOi6EvUEks=
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22977011b3a.33.1786953289828;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22976947b3a.33.1786953289376;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401e10bsm186190b3a.12.2026.08.17.00.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:54:48 -0700 (PDT)
Message-ID: <05c743a3-0111-4b80-be98-b65b3a09ce34@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:24:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
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
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
 <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82be4a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XtOoD4hAqv4hDt3uobMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: av7QRHjcyRwNiF5FCaG65OcusJ4uT6M6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX6qNeiTOnkFiB
 o8me6RA7pYXaJjLhM6oeTpecHScukXwcoYaihMqASIslKng0IVSO5ZHvrWC5+3xxcJfrHblydLP
 iO2XNBUsD9npivq3vnnvv3dVYmyjprXcYIjqpKrZbw5W7k2wBvwfTj4/UYCLhtJhYxvtunXMtvb
 Uvg7hufRdeT1VOuOr1OQPMCtH/5YxbQ0wVaeqIlvvxMnn1EwLy7yxXlAhhY83RtEmzVMt/a0W/S
 GasTP3onC75F9ZwBh23Qu6XsLPtE3OaqFgHijj6S1ABzyhFJn4t5wVqx+K0rN/acyJcmq9u1r0x
 yXyMxrdVB7y2TT/hatLxc+/kPzPhQM8bvVZ6+52mCL3kFdO3z7jIJ4yTx+mWLLqwbrXCQrXibRf
 BQUFsOCma2fuPDY9NEqSlmAWOV4yZrcrQv7LVO5EA2EXTcKlrfBO/IUA38NigQA868TN6U9QCJE
 YlUQ7XN21bTtARIc8LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX6eWxcGjtDdOH
 2FoCsZTny/ppe9YLEvYSFD9V0xr5+V5ixTXcRja4TgSpNnEzuDuHNtpnvFE9q5B7Aw0zAN8sKbt
 2Uzp87coxDxmX7FGYr35Ve9seObar38=
X-Proofpoint-ORIG-GUID: av7QRHjcyRwNiF5FCaG65OcusJ4uT6M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057


On 8/17/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:41PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> I do not see how you addressed my comments. I should not be needing to
> verify if each one is implemented and then say again the same.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

   Apologies — my v1 reply just said "done in v2" without detailing each
   point. Both your comments are addressed in v2 patch 10:

   1) Commit-message / binding style consistency:
      Reworded to the same form used across the series:
      "Document the Global Clock Controller (GCC) binding and associated
       clock/reset IDs for the Qualcomm Kuno SoC."

   2) "Not a power domain provider?":
      Correct — Kuno GCC has no GDSCs and takes no corner votes. I removed
      the power-domains block from the schema entirely, and dropped the
      matching power-domains = <&rpmhpd RPMHPD_CX> and
      #include <dt-bindings/power/qcom,rpmhpd.h> from the example.
      (binding 56 -> 50 lines)

Best Wishes,
Hardeep Sharma

