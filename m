Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70568486639
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158111; cv=none; b=fBNPYGtNf5/aNxYRnqLPpNq6rvrQIL9bhGMyo5qv6sDJ1Lm+LfECBTgYw1eJMiqRYgv5GMYCLR2dITmM1pzFfZN9GiU2gIbNyR+ph4ydy16V1AQrOUwHfTOKLu2IUDpVp2K19szHgWFF3Bc81M1xLLLNfPInmz1qZwlHjrvd60A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158111; c=relaxed/simple;
	bh=QlH75jraYA/wHmkNHrnrgxH66NC84yTqhMid+3Ga8So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSvnVxrdIygHOjzYUvWTNvBmZWVWUO+VkjqdSlE/AAGli2j85v5UHistRz9kxC5A9v9R3LFNsBt56wop+/GT/PiQpQ4twsY4fs4UrShe0P+f2gDY7a+UKSeVkdBiPBsY1ov2xleMNA5CFY77pelWyFZlhM0tJ6puWT96QLOWgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/tqZR3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB0JCbLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/tqZR3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LB0JCbLG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2YkU1173971
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=; b=Q/tqZR3zPGNbvJBo
	DeyKqFT1b520bcDqrgyk2O+KHjX9Q+iULEMpilKH9rHdex1m8Dzn/ngU10Y4+twJ
	6hcbomygNFJJQM7b/jEZE2o6RfVFH3F1h6Bv9t0A5I17iPY5BStqbQwbq9kzBBpo
	FuI1vNRdOJRvMafXRFRhB37A/zWSQm4PbBs0in8OgcXXZxMDHKcjfhh3nfL1TdxX
	92sTVNQZC2Q5eMq/hWYCOUH+9ZEMKkdkthxd0jSuUIWlC3AGjJFihbgm27REBTZA
	82O29mElEyy741WWTuOsI57etO1BEwHb9dvPZPoMw3HZtX6NNyhovE8nnmIyzWfW
	VIv2HA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj0jw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso3355081cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158109; x=1787762909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=;
        b=LB0JCbLGaO94gW07ofmX952puI5fBmfbG/pvjxUDF1vVVizcp+zaobHE/M2h8qU3SV
         Zie/UZJmzn37uZUTKpbFeDOjycYzOejaNEGbc0W8czwFw9PZLcaW3fuq9sXaUD/w9WUT
         khF9AYiagTW2HCE8nL9P38ktV+GtsRNSvMOvBQFokbodz2jz+q74FIa8i5N7xNtiMVRL
         JjGCo244i2ISr5ilbiK8pxjGRUK4N0jGuVZgkh7Gz1jA+AaOUILm4nygZCTOAG/Iqz1n
         LK16xmpk1qPGXsEht4J9lfW2hvuK2rTl8z7b+W22rI9vWcOrL9oXQVa1zZcLObnTbgH9
         r47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158109; x=1787762909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=;
        b=qPwNbWeDN6403MPDJ8pUIlit2uHuVrVlQbkxGw9iCm9ekCUmxPFyEUM6hoH0gokmi0
         11wmTfPLVwSHfpvxmHbjs7eHU5IOksxZHQPEvMyBDjPCv3fHzM3fkDXRv0qeC33q8XDf
         vAp+5krengHVulZFzCgFNYUUCSfO09xGX7sGv41MnmvGwmtAveBNqu0W1tvgb9a566ME
         CahMP7Bm1tTDq611mt/VRrpQrjCHji1ETQRTdKw6cu7q7zVH8Mt5O8xF2rwZMmeEVoF4
         GXKj+CFtiFal4eyu2cyzGdMAOpQFbc4mYXLWxPNlH8aVfLjMpTjZ/TsO2+8O/N7aO9Z/
         J6kw==
X-Gm-Message-State: AOJu0YzdBYZxiyx/FYIUR7wqTBcPNgDiLW2sdvf13Gb9ldgxzEa63Sa/
	ceKVk1LcC6RQbS6A9FQII4+IgwmyjgiihD4O3kiJ1GJnzq6qKC0BrD6sxqVz6dScPj859MZcTW2
	mtAQzsGq4ypyN4STrhq+9OC+10EItKE4Q8SeZOOgEsoLvIne7FTkQU1XqBBnEN+J30yVn
X-Gm-Gg: AR+sD11n48EnSeDqltlhpGeOPgt/Kk2tAUhVc7L1xh8I2/ml3yfseDgaflW7au3WT4s
	b+JEO/Yb6GG76O9G0zrLjWsZJqDR7MNn8c94E5gwL4zMTRnxyn1TYGj5wQ+z2sc9QGbwVJKqsxA
	oZUIKRXE4sWIXIyZYu6GXGd8kY1AawUa/9Lv8Z062UB0ob4qKtrUGseR2oFzi8yPmZGBoXki+92
	dt25+8vHyB4Pg5nRItKw9WiMVlQLTiCNSr0+SOgS5hosCc1Wet7OXV8cqp3fe2B02ag9XTthyWL
	SWbgA+feqPVvpQt4ifE3vCe//HsarJcLiTIk/9I7TUS0P8TsY0dFCHBwkiBCF9g6laYHLzi9sSW
	PKc1dL8Kem4t2a2r9WWvCQPqI
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr42220271cf.2.1787158108963;
        Wed, 19 Aug 2026 09:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr42219791cf.2.1787158108473;
        Wed, 19 Aug 2026 09:48:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:26 -0700 (PDT)
Message-ID: <6eb07d01-c28a-4da3-8d1d-d950369dfdac@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9Xa_ZpaL8bmc7ZsLIRanRTjInyimDGnl
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a85de5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX+LhddxlS8j6N
 DT1dtNFr6NTM2WSqcnF5N72VjQqRDLrffeKixHVWp5xJjsxKgkQRsSIgoxrHY27OidgOutdSalr
 uzvEAy1ouqLiEpix0A0lLCPzZESohYRX+oAeBYYG3KScuRJ9zdbPagw5EvJbZw0ufHKGGsh78Jy
 m/uiLsHudiod6I5D03JWBZT6fIboUDHOAtKqcwFXMATd1j+ZAyzg0MPkDGoHPw4Fi4QuelLpPVZ
 awMiUl8XH/3NRk7LB8g6g3eHv7upl3Cdr01WPAm75t8opqE3vnLIFjo17YQsB3MsMlf4BjqwtZS
 v0hXBGHl6NDHF6drrCxeVqz7luJODZjsHEMvcwyhyirUZBCjr6Z81Nt5BlInZ4lU/qG8TkMP37R
 RGkuj1k+NAaVbAo00Lz83GDYyzAKMCOtw99etlG5bHrIICyUTicbBgRhPhe1jl7MHnRg8MZy+Hf
 DqCRH7JeghCtCkn6C5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX2pzEUzzoIH4T
 WlP0TATPRQjvOZxsV/tHwZi+DmVj46WCw///ibZQjnaGKPSdCb+3D5DwJdTPoo+WOgqc55VyQqy
 +nY5mG+wrLlZ2QrtwK1p09XB2OIgcvU=
X-Proofpoint-ORIG-GUID: 9Xa_ZpaL8bmc7ZsLIRanRTjInyimDGnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
