Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F34376BE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243308; cv=none; b=mSLO8kHmQjIzf6dfHo+UPNo4jg/V+/R5dLFNHGPQf4MAYMzanjtJr2GaMtmzD55ZYvfgzaWZick6FY3/qDuW/WBBuGHU7dffbTwmuPCn/HDX9AD+u/XKT5BrAffhzX8FZycLIPsedKfBW8RoBU72zD6FbgaCBDeJBNUOvCHzHCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243308; c=relaxed/simple;
	bh=NTnarSf7tMp3CKYU091Dm5ZqWd1tV6igF2erovmUMp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSCMgogLkzGrNjv+aYT4qGGue8vGtObNBgIaBMj5mvFvFMFzaZbuHUZPLuetWvgp4y1Is3muzxnCsAf54STBBiwDoccNYL7/Ux2je/Q/w6mV6GEeHVIFjzE2QnZk8RmPoelLeRHoOlRpUCW3zb/EnjM8jAjvtK1jr182Q1whY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0VhgzoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrgW1GUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0VhgzoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrgW1GUU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oB5E2138346
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 06:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=; b=n0VhgzoM43hfDWcI
	THxETxudQj7Vq8uUpPn7mYOTgTrIwkOIc8kq4AnGJkVhta5YVylH3S5emYaByRU7
	yvqq6tAGw7ftFu/0VwP2TTI1xm6F/o0RZquHrkRs0qzsEV7bXh3TYIfyFUUA34TE
	rIPYDlzNAHDprfdAM8HLA+WhRZGQY3KA2lB+fkU9LgEM1t3ouIAHc0tG+YomlNh0
	9qIV5SZnbM/m74ISv70r+ZOeD0Nsp2mzaFwvUXWm7f659ZpXzWKqAxfrzbm3j40A
	yS+Hmcd5qWp9hKn2vBa1+r3TqEFNNoZi26RJjuQA1BPKICRxw2vTFstTd3xx7/xU
	opT9xw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvvnd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:15:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so5605295ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788243305; x=1788848105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=;
        b=XrgW1GUUIouDPIKiwOv5uQEIIuWIzBB1+RDwmp3b1obAB0OSVP9kplzleKBxMrYbMG
         go8C+0PFRvlPFzJfktTGjAgY7pWAj80A09SS9S1iexD+N9Zm6Co0r0VGLJx43NmGhu54
         OVfv8DNDVdeS1HM8TG2keJDDLoxpfOKAC6mNStADw6C0BK9/cCLz08T4Bm1cpIEKuShW
         +BIfDn0BlpOpWTby3x4mDeJThEj5byZ14SE7lwVKOgnnm026TLTWTU6TnyDvLO+/SmvY
         76dNkRR8vGTil9wHy706CPu/OTw9E0W952v9yo2HpTlqMtj+YQo5+v84M7NV/FIQ/FjI
         yq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243305; x=1788848105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=;
        b=ad31nfS/j5NA8THMwsfuyBD6Y2H3JT+bq87gDJlAFPtaZk9qXH3zbibwNEh7UTGuZ8
         8Gy9dUfRgL9gyw8Z8aR+3ihxY3b6pHV7fGtddjz5jHByXHXjsZig7EL3XRb7thO3r/Pn
         uulep7hsznrJA2rfzWMS3L8aLx9l1hygPlmUTnj3RhkMVWlG/Nh/lufWLGg9fKGMZFVQ
         Qhwo1nGdhxsycS1HGbVRCleQhphdzGNKGXEw+hN6Lh+SqS4Z9zoQw9YIIQ2WgfPLMZAR
         H1VpjaBRD4zr4L7DnsE9S4pe9DzM88sfpe4tEALf91bA2J0lz/AKMRuOusLxkwYxYNph
         CaQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrtm+NoX+ndSoTEQzCOHUEgJX4FCr/lSCx9VHR/613VY2WZLfqp4f5VHBLdWO+k5VUCxIouV2hQd+AFpUey@vger.kernel.org
X-Gm-Message-State: AFuF++nQa+PqLj9xfcdmC7VYK/etY6qaooI3vUvVF7lTOig5y8O3nnN3
	Ba5BKkOf7Bxl9KYWjKNj7E3ALACQINvEglWbSd7Ly/beOhTYOcvzDsLe9SO/93t6b/GcxZ1nlgR
	F2eWxzjWVeBPWbhnxT11EE9KDz1slRoWDkX5ZEnBBbytfwBBGH5V/r+sEDxxao5ghJiEi
X-Gm-Gg: AR+sD108KQm+XpHPFWin2U/BSmoc/ouqJr4OAKRC3aGTQzb8vU5RjomzlHfh1h7DA4+
	lF+ucJpEo4Rk3G8F2GuwqCk7vpWuQ/ZlJEBH7/3Fj1phogD46nM3NgjozvxgvRcIg0Pb/TYP668
	zTdVWZsPSDMS46iCe/UiPBylCXPCBQkE0Yo/5amzmuNbxBwBGsurzpF86lAWcpFly2jathdzHkU
	0Q3TZ2zB8Hvcc+EXKj/eyJSF3ef1gcXtM5Q4CGeYumbtaEa9ADc3+TvPXJrWUtdCSyTp3HLBzm4
	fTXw1rp778AKaYd82H8/QEoWt7DgA1fJ2e6Qkp443yD3791Li4XV/vY2WWXD6jrcWEXIT796Jbi
	GOmhDWled2oBFCI/SsxJ1VsXIpAeNrHtYFbhD
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr506961785ad.9.1788243304816;
        Mon, 31 Aug 2026 23:15:04 -0700 (PDT)
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr506960095ad.9.1788243303969;
        Mon, 31 Aug 2026 23:15:03 -0700 (PDT)
Received: from [192.168.0.104] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm31355147eec.17.2026.08.31.23.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:15:03 -0700 (PDT)
Message-ID: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:44:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX43Hwl1ndr6zG
 2z++lG5D9LBUpYD/OdX5L0SaHtsGs1+0or+P4tmSzy32YAtwzgpOhRbmnROOMMBspwsM8laDcUi
 tQacGRgH9N4PIt9FvgoBr3ilX1npWEo=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a966d69 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pu1xhwu27SFHiLAfgE8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfXw4Xp++7ZzIhs
 snf77I9l0UdRcWSm2nRgLHNavocDGIVJ0o272Letx5aDFTiObBh9UVKI8N57AiLlI+RtrxLMaKw
 AyAcG0JlCpza6JxFB3gwH33wCNvbNsJ+sldE67aMWSIY+HqnVOrVc7ZxmliUEfXXCylVeDb2av+
 tEYwEghdgE24Ez0N1Jl1QE2jt4wvj31sydKGAjvXDrq9EGPi+pvFk5oa1omcFiHVEkXRvZaHD6L
 E6Ydqcn2OujGlIVNMhG+2rg/CmIp9YKMtbcEIKwY1GyGuwnXJhktBq3Vik1SFEjbo7q5Xm2HLKR
 gwUISc0C8EWItwVO/i1lAFxH6eHDY3NJGMhxQ5uEFhit0Z0hrFjbWY5Z6F/b9YLKRc19Wd8jUJM
 xUznaaTOSHs7UGIcjVPHp6xEat9y1w1hzmcxVcZgczduasv00reT4mS++xUNeTsd8YJIESeLHnr
 bdfE1nxhP9rRjBnGJdg==
X-Proofpoint-GUID: RjYWBO83Nk2QANsNeuKqVpQ7oHjXcJGO
X-Proofpoint-ORIG-GUID: RjYWBO83Nk2QANsNeuKqVpQ7oHjXcJGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010053


On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
>
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
>   include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
>   2 files changed, 404 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
>   create mode 100644 include/dt-bindings/sound/qcom,qaif.h
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> new file mode 100644
> index 000000000000..134356114733
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> @@ -0,0 +1,307 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - clocks
> +  - clock-names
> +  - '#sound-dai-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        qaif_cpu: audio-controller@a000000 {
> +            compatible = "qcom,shikra-qaif-cpu";

The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
Usually DT binding filenames are aligned with the compatible string for clarity.
Is there a reason for the naming mismatch?

> +            reg = <0x0 0x0a000000 0x0 0x20000>;
> +            interrupts = <0 331 4>;

Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;

Thanks,
Prasad

> +            iommus = <&apps_smmu 0x1c0 0x0>;
> +            clocks = <&gcc 213>,
> +                     <&gcc 214>,
> +                     <&audiocorecc 15>,
> +                     <&audiocorecc 17>,
> +                     <&audiocorecc 18>,
>
>
