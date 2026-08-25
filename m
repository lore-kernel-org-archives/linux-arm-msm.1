Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A693E6383
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648224; cv=none; b=KWhCFqmMaPYNZQM3aJ7ge4KjT+cZo00JLp/ZTAsUKLORpOAR8wxyR9LnVPSvvfCsAZTin97T0wHV9SlgtEYFUSpdvNYBiYBarATiumYw5LQ8DkCYpar2y3JcJ56vKwPsMDvZb7W/5vA0jis7srihEMO9k/cjrR0peqmr+tYKi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648224; c=relaxed/simple;
	bh=8GIUwsRZtgCfuK52kfkZeWWpsrkf4QzemAasx5i6aBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSRtcUGcxPGA7j81aqTIh5JfR5z4uO/rUeKVf4pE4jxr35f9DdhzKFVPJe2PsglPnFVzhZr172RNd5BHfAfn8HIxVnWUV5v8+eqdXHydILx8USyFCKkzhISSCWy+NAP3HB9LQ8mvguimnb7XoARor7YoZdcUgLUPqpTjJKKW/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSI182x9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTAtU2sK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSI182x9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTAtU2sK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88PJQ196240
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuNVclDcvxSe/4OyhV8OfbkBRNHpKfxrNBlk9ot5xGA=; b=gSI182x9Y39yYgVv
	KrcuchzC2H6leSIV9i7D9Y0OQQ3CrK0TelCNTeh6Y6KWUufbNfJKxz0elugj0/dR
	hWVnnT7j1kBwzwzaH5fRzSTAdHp2W+jOyBpcaesnYZV6o+ZT58BoTW0m+LSo5Cmk
	rwNPwwWMWT16QPFZfSq6rbCC2N/hSPv44eD7qb/ff09RFSUH4ZrBoI1Yr8HBv77X
	JO+8i1ASqOApt40I0qhzSVtlsUy8LZhIXkhNVpztjk1VP0oyPKjjBvK4DU9B5FTj
	W21QoSDcSfsgu7CulGYSgrEoZE8E0W3XVJHz8Kul581Km2JwaFqpEX9+YWaQGkfu
	QJUX5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvh1ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:57:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cbff00db2so589596d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787648221; x=1788253021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuNVclDcvxSe/4OyhV8OfbkBRNHpKfxrNBlk9ot5xGA=;
        b=cTAtU2sKkzPiQX8jD98K6IVlkcvRmenCRb9yMpsFeXG9NN20Ikq+OWMLW0E9EbH+vZ
         vqnQ5Yb3nYJP+V3NLFu9slz9S3fjQ9cKqg+onCNNl5a29u9Rj48Wetm/6mG3inF16wTj
         Y6I3CEIC3gJ4Mwh7jHFP38FFBAsCPA2E1bhFTeas6GS3QdiniOsD9n3H91Sn9kNL5V3E
         71UbyOI4qJjNmAsenhmzE6v4VqKJn68ii4Rux4xPkp5vbJ0i+00XIWbfVUcIwJWtaAH9
         U+OPJ5/0Q1Rh64E4YCqIxB1DJ+jpkDVGt8Uy4aH+3zL0k9TUHfoiXoaa+B3TPmPlzyNb
         Qn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648221; x=1788253021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuNVclDcvxSe/4OyhV8OfbkBRNHpKfxrNBlk9ot5xGA=;
        b=MGrKJ5Fd6BR451OHfTCjdTjwMPo3xTRbcjV4G9e+67gJh4QsS5N9O0dgIPHw99m9wB
         +QsMHpQE5FPS5h+OjWX3Hw0vN0qc2KLTkJLf69GaFttPQzwi0iKbwAjePMr6qLeivW0f
         zjmcNthZrVBfT3GViK0aMeFHeh1bbu7u4OHcU896iEV5NbfW88DL9lDx1ndvHKCiCCu3
         bA2AHjRgOMQuspwdfmbOa5L64WgZOhMeFKMXSgniXe7996zYWwNYKp8AqH4G0+TZNxMp
         WFZwaVPT3pjnVgTSNDcL8p3LQqkHEkOruzW5cvfaCrT+0fnAaelVaHIbz06MAMmOsdZ+
         du5g==
X-Gm-Message-State: AFuF++kENoDKIzVwMGgQjOELI/vQI9uGaSUPL8bigqI8BYi6EIW26kKH
	guxI4JdVyDeiLLQWIjnjay5gDy4ANVraG9EViNDl1ZLrgeu1Xr+JFXUcVoBetB7hybm7XKzL6N7
	akxG4z/I84aPT5DB8e2UvXZ/mdn1MaHO4yCw2wFPBxpbbMGy2ebsqqrKZ3PxFvR/VuoKI
X-Gm-Gg: AR+sD10iZB1zzxzYVgkru7O9tTm7dPFC0u0cwatJOGDgzcegfmxav0OBLY5nxzNm0tt
	pM9VUz09DaBZMxdwe/8HxvLycDOPXWa+Ha6sEicEuCv9Bg36njW4Om4OnBw1OITAQYsi1qhutmh
	OdhJfAVlDL4yiGSQXa2UfNNssJIqQi2s/Dbf6leBZ2AjRkyjTQdYUYCJwQ85v9ctk7eaAI58c5f
	zjcZluW/3K7NMF5jSypqEyiaGrlTJEtyaYi2/k70uGqax40oqipTANTLbfbzZNlc/WtSd5bdyji
	3s4Bhbn5lNEyD0NjNbtdqFyPPo0U8K9UaVKHXcKhiknHBQVN6/fC8+MnCoLhsIF7O5b0UL0IdTF
	Ttb39pnYElvC+Jlwlc6vmR2Ix
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr243449501cf.4.1787648220891;
        Tue, 25 Aug 2026 01:57:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr243449191cf.4.1787648220517;
        Tue, 25 Aug 2026 01:57:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm1603574566b.48.2026.08.25.01.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:56:59 -0700 (PDT)
Message-ID: <892c2f5e-c3dc-47e5-9f57-338315332879@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:56:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3NSBTYWx0ZWRfXwrw3VSrp6hOE
 ANUXk5VkCrd09INfnSmX9GcPQua1GYfJWLfy4kQ87Jno5V3ZVrRZxi3+bAMKf7S4Z2vdr9ZVy5l
 d7K0SQfl7I96uu/DFFmbWcxgsrJXWd0=
X-Proofpoint-GUID: NEXCdAqL3NUq23BcInTJDZyiL8P3fM3g
X-Proofpoint-ORIG-GUID: NEXCdAqL3NUq23BcInTJDZyiL8P3fM3g
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d58dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=t8z0oAJ6WeIUDCOA0PEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3NSBTYWx0ZWRfX9+JoKYNHpBxH
 r7LVGS4YpW7vlt1KVBC3gUmijn1snr0cK7Yu+hbfzrEWED2PMeNF7VGItoT8S0ZIrwYQCAxWGrL
 i970hgxsUmX3k4btZ8WkWQCFGlBioZeByBa604bnBvKmnhtbQYC/bTEkPKowen9xxNghWbHFXHl
 WBnE16AOnp7dODBbytntmy8dDQAoK2wsQH8Qnwz0cRKgiCcQXjJvznStCBSvzXqUVIY8kZT9584
 HhiiD4BpBB0gVgUnI2j7MRfittd24fBmrG4VoxjguyKlxWhdeZSOtLsLnaqw6lJsopWD5GngLHu
 Y+dCZaFHFpkwbyBL00qJdHHv48j4SbSBKy7vFJ2IkDZj4VM/EtMOJXsQM4BruCCHuOjF3w3zlvz
 TD/zjHRj4iujdyyjcsAilQn0qM72SM1BB2rAggWTTkuOPXQcsxEd+jgZ0NAYn13pNtAHO1OZsMi
 ldJ/SzLFju3riVj88zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250075

On 8/24/26 8:37 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.

[...]

> +	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK },

This seems to be a pre-existing bug (swapped mask/val)

Konrad
