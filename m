Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198259;
	b=gKqsrR8TeoFWrWz9qp+FlOLC4zOmB7BqorLgOIvwq5wu8ZM7P/jXtGv0h0iBSWsFWlIX
	 fWlyZOm3uoOUWBw0lJuVEaKMPnsHlMvZ1fOKeLJYhiQMeeaXBssKXV6FQkXf/Ibugwe4l
	 +KCSNz+X93PEDJah9Coyw8A+oxa3Au5L2kacOou0YGPOHdRRI6sKU3gSlqFM3AFhwIhgk
	 X1doi1FNmINz/7in7bKs/zM0W5xwXhcGcT4TT901cGEuAdzdsZHdOotd45pRu1rk7Glfs
	 J4CUTWHdu4BBq+VQKIZAtT2jY6HxxZ8AUwifguNVNhKuaAZg8AZhcfu8rZND4Rpif+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
	b=oGrz62eheDir1SsPQniS4y+gynai2UxGyNEwNKFPGbmusa2cJpwbuVZkK7JPi0lfWGR0
	 C978lINbKywRxa+7KPX9q8DFbcCwyYVt32tWiCj8sddQXxspWfdh9z8daM7KXHaBGy3n4
	 cq2Pg3l8IOD3Zy5J+eX4auA2zXfhVEMPc5YJbxQzYk/OGQ9ISUXDQdYyrOikY8DgcOQfC
	 b9wbYMzolDCbAjB3ssz79wW2dzEosIfhjVpk4J8UGfgNf/z5C+wfU5ZMiIW7+nlJznedm
	 cRh57THtA+4myTx6KK6Nczt23vw5dceIv97iPo4YQyTfCJCu+9/vN6JgwKeh/RWCB+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mo8QKtvX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfFdk14c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353E606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5353E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mo8QKtvX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfFdk14c
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdrxG1011753
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=; b=Mo8QKtvXUgWtezBo
	IWgLCX97eCdpRf5KvhLLQgXyUGqqhu4USHlsr9os0vzPZT4yazTxQkpCPbBXc3PL
	+IeVjF6rfpTjbph9MvQS6o2bFOp7JI9lmzmxuX2iCSdvFwKWpGSe02i7zpekDkUb
	Mr5/FkhfryENrc3GUBVX6Z0Zg3O5olNzQNB0YotlvbJSIoln9HY+icD+C6wMSrwn
	tuRz5oDtr8JqFoAM47eQPOycMCBHYVyhjYUfu5JEYV1uNAW/5nRGn1IcuUT2KgLD
	Zu1E3Jkty88q23e7qqqh+3tCyRtBNZcMASHztOD1vPT5lgJI69/wwZh16cA+VnrU
	xyVMMQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgwuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:37:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c723394dso82778241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198257; x=1793803057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
        b=YfFdk14cvsQz12ZdreeQO8tDpXUS7UcaJT1ZJEK0LugExSDG7tkg27AAOdorJi4xLe
         u3Hj6TWHwzzpPYmwa7C/Cc8h09DqoVjyAEnYfTQ/Hj+lHPCTNQf71C9dxQlVU/jFXQYp
         oS5YJ1JVBPsyvNjBSG8+ncmFEEPPSmocj5YQP+7UrngU5mOiwSfN/yvPVEvdSAaaKDgT
         5/oVf8ia0Od2ssk6MRiu+3K4HZdedaR6CwEt9I7xbOt/DpMNoq8goyU1J1k4iSVpsAYe
         1Mdju8YQQekajMR5h68VGDHY71r6uIgm58NuZ83mBItZtxOkxXqGCPMlpMbnj1CyF1HV
         TTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198257; x=1793803057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
        b=qdwEZv4DSIOQ5E6xVjKUfAoMf43mol6wakeRgZK4yJiJ8WD209Z25d4NhN0k/6C5Zk
         oAqUuASr7awDLHx0+2muxGCnxfji/PsOVQc6GhJXa+Qy06eo3q3qx/zL2E06i66FZkWG
         +Sb6OJ9ZPWXa6nDjliUcsMyK83mCPoGghxa7zDfW5yRbpLZ1tEdYKXvPakf3wvBq9zsw
         ZurbuatvKtCTn8oENbu3hQrsMxUZjb5+L52HMDqTvS/bpXOUHk0sTxizoWwBw972mGF/
         nS9tHYiJBq3LVQQ5UHPxnHucpG11H3C/o+tsSRGh5EtNqL424eY2EmrELhYCH3HbsHGi
         Sy4A==
X-Forwarded-Encrypted: i=1; AKwUvBwfn9TQo1rJVOBUdLNqLDwHMsc/OnzsH+I1mFQLGQNOoIt8vGE52JA9cgwOTvYkiriBW3G2zAZvZg2TpEtN@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3SfoNGeKrMtbDoU7D+fFdXz/pp7Lo2vcbWYmflf2OkWEFVYTR
	gHqjjV7srAvLZN4CtFbdghHBPKFBppJowMAQJdBhUzBIBQVE5lwf1FmCUsEQd8ohw2KaKIWefRC
	KP7ckamCdtbdwrKiU8GI1B/P1hu6A1kkxZwyWSsQ+oBLLZFatWYD/rOyTFL+7F8UvIkG7
X-Gm-Gg: AYBFou0aRGjJll7AkodNbHQGrGNwO6M0EqAuXHCdPFYhk5zkwFMoiO9X/1g14PruEjq
	E8/R94BPd0qFbo0R993wnuOzey6agsxpyGnXqN6MpB1puhXcYaE4uD/itCVPhHPDllFq9K7WV5k
	XlsRRaacei1kBWcwIDEDnrGzGFidG1c7L0kStkMg8xWeKw1XmS62wzYiMo5IIUWgXam8OHu0f4c
	tDXwIW5JHtqSylLqBQtEUlG4PMYVLmPQzwj58NwNlvf6a6DMsWVl9vljEnZrI1QZncV04viJkNX
	/bn3nOZRRu5UvwPA9go0pDsxZIBDWyE8vj+RlovfKe+5lYSfanZ5PZ6voctRe1fuKsnloRfonUX
	ZnWCCZflKZQAH5V3B9jgHOhYITjnhVYg+49B6vrIcxsZGPPTSfs8i+86NttFtpqTkClGYols=
X-Received: by 2002:a05:6122:3b06:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec4cca1106mr1415595e0c.4.1793198257503;
        Wed, 28 Oct 2026 07:37:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b06:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec4cca1106mr1415554e0c.4.1793198257053;
        Wed, 28 Oct 2026 07:37:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm601408766b.19.2026.10.28.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:37:36 -0700 (PDT)
Message-ID: <5b27776f-cef4-4963-85d4-6d2f970c8484@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:33 +0100
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
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX5MMD+NGClr6j
 hllsvBMZQUo9svw1z4OO+8gbc4lh9SV0Neumkf2U4wpK8mLGYlS8g6rxiScvF/n4eQMYVn/aSN+
 k1SOsHdg1RdM6XWeaFp9eGWL0TemVIXADAZB+AKiCnE8/LrycsoGHoqUrlwl4T5mU6OfH7FfKUp
 1gwqYu3db+k3yPp6035KvCZp73+N/IAg1+wCVHJyWO474MJrZDKsV2xiBudz1CwzBMfIBLSixJD
 wE1RhG0GqsS3xRt3tlrOWQAaKm6M22vo0gbh8DMO2z2GucU6iRoLvhfnjHv2kIgGMfWct/c08ov
 SyIMickv421dxVtBKipoKW+GWvOnamaH8FJ1nFnAbDZydv9hTi/XGFyzTLjpI9eK0VOQLZYaJss
 XqNifzp1Ero9UiS15Jii05myWEYKuXq9P7jFB1llLRS9Eqk6aZMCnUKTku1nnc3pxQvpw0n2X/1
 vk2ThukcE0OIBnxvKCw==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae208b2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PuOz1RSaosiZ807nmPEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: c0ewcwUuD638kTr9nodL_fwvXsBgPvgn
X-Proofpoint-GUID: c0ewcwUuD638kTr9nodL_fwvXsBgPvgn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2q6pozGWewZR
 p2rn0X8vwIeQ1ohYeYpeQpJxb9NDfhn7k7pg8bTW//1cmwT5E3RkauYjBvCv9PwYGc3lcSTleQ4
 BEt4SfgXfLCs/nqhpnXl1OSfYrTB/CU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
> LDO supplies for QREF to provide a stable reference clock. Without these
> supplies, the PCIe PHYs cannot work properly. Mark them as required for
> the affected compatibles even though it breaks ABI.
> 
> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
> compatibles. refgen-supply is required for QCS8300 only, as a workaround
> for a hardware issue where QREF actually depends on refgen3 rather than
> refgen2 as documented, so the PHY driver votes for refgen3 directly via
> this supply.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index b353b7bfb839..bd4c98784142 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -94,6 +94,11 @@ properties:
>  
>    vdda-qref-supply: true
>  
> +  vdda-refgen-supply: true

There's 2 REFGEN supplies (0p9, 1p2) and the sister Glymur patchset
defines both.

Konrad
