Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599070;
	b=o8cQe8mJzuNY6YrI5455VoPiImsNj4htqCMI/a26XyMngLE86mCZq2w/H6ODH5QT3DlX
	 v1eI2YeOuAA4pRJApkPxAnukIOQjZJpNWq80/9ezSF9wiVRmyYYRhzVMs6INoqyTHSctS
	 RIUgcDwG9laGyt/+M4PJcOFVNaOSbOL0IAoi4zF5k1kLct0PJ6YoqcFA9by6vYxHqUYYt
	 OEk7dy9JIqcGQYaFfyfx6836xby/GOXJV+VSk1zH5U3pfBjEhH8KtZok+WGbloZagzl+o
	 hybo5rnUR2mEBIy2S3yGFEJud+3Hp9cBl5ceTPNqsO/+wLBVqYO+1C59NkG7YhjIMYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
	b=LI45ak8ByTnlnSKJLXgGY9K++bIOyexgolIJn8OaOa1YTIkhJsjwQErmy8aDvDehreJ3
	 jasfOiZF6oriwQXXESG78z5EZe9pccevmzRwjDsw3R+tJKmkBcrE12gXcL3d8aBovATDD
	 AarrW89xHzUCJzy1c18W81Tnh+B7gcrpXJQ/FTtSpGxnDIZD8mzFdlNh5hpUrM+zpgiWB
	 fcFm5PoCj2szwzVFP1UVZUdoAa1xyeKs6KX1xGPCD9DZXaJy2GfwaJPJMje1yLKZmQlwu
	 3I8IrqrafkCL7mQrqTf9inpf5dGT4wYxd1FUkUdl7+kD06KI7G/t0QAOv+9WxvvaiLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F5606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTued2102004
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=; b=V0ihCasmkW/aMZhU
	sJcKm5nYfBNgtmimC6O7UbcbXBSTyusSedqc2yEm3bxa7yo4kC/bwTzn6LtAiUmu
	AeT1V8nos2qZSefaZ407+Xb57Cqu4fP1LhYtXy0jzYOOiDnTFYP64nFLSJJbZ30f
	gvGmQLRMS8Tu/KcL7unDk5qS76Xgpv4KRncYh6RxVaJLdZ7lmUqxvMp31bI1OCfS
	JZSEOprQ+ZWwAPZFP2PXPW8nvdtSxzSK76NM3OKetaWL4LvJimIjkmk0Z0uSTdfr
	FFAyJzzOm0e7Czj5+SBx9B1KD7CHqZI1VgsqiECI9iEK1vRTB9EWwnjk1gpHNyPt
	CtddPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhdjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso636976b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599069; x=1793203869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=F1l9lRz+st+JFp1wukMvXHgwN6aZd/ZBZdwdPeP9xFepSh7WUVfwWv0LH9N7FuiKqN
         zR0p51614FH6rkClZrCyaSSuZHfNQ0oOPrqAzaJq5ouZVRXA2Myoe83fTIe26jEmZzYU
         f5BBfWvzArScGXlfoduJEgUm4kKDK5Er8DjRs5XVBlePR3olBVrJbYMmS/Ak1+h/2K+m
         NzTeycTF6RE6jr6jmYa+Y2zHCIeIB25xpeGplHJfX/wT/UIQxytGG+RA3O36Ub/Fx6PI
         +c09xZZhtSOoWej9srmOmCeUrx+7zfYQJ3fcnvblJCDtmbPcDWNq7aNmWkhX+Pb2huY1
         b/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599069; x=1793203869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=U5kNVCWCyCeeP9scfKqV7WOK9+hnLoqlmkcRcFDnESv5Q3SfyO1ODQkHsyuZ5jlI5Z
         DCY/I22z9JTE+q5Of9hVjD46DGIfzpntwLwLWnk+wvkTTCOdH6uHmSUAqaqblXH5jfXH
         v/gx8GumKWIOyA50MYFU2FzRXqmuJux/oWFlKnKiS45urNXzGHU9qlgcs78B/j1wTsxO
         ykxGWzXIDIKaGgwrbplU08BAL2MFseIidUw8LoA9FIHFejCdM8cdK70YlJzab7s9rlMV
         8mWRfNKHmvgwz5xW+uCUzTGOt5cNlRAWpbVZv8PSLv1nwNijMzyQZjsMtb++71azLYHJ
         +6vw==
X-Forwarded-Encrypted: i=1; AKwUvBxyjnqemZ+Hl/1EMBY4tjskXFRCg/nFaoqEIC44DCrJUrjgy+hJbPhmKKxSPq+xPzizRZ7AL/jB2C2d4h0N@vger.kernel.org
X-Gm-Message-State: AFq9FYL8b0xFPRh137t/6hKf3v1ZpQojvir3zslU0FJvlnNRAC4/fM5M
	Yne51VTBWMNbD7mJ0q7rlBn1luiPDdIZKj2y66vFBVJPp93oZA2mQuta5JKOekcQFHcOmht+GK/
	VJbgziHQGPRZVJAQY5hwO7Gh61UUeLvBdXLAHvcA2DAoJa8jEITbxlEJcsRjTtgaSl78B
X-Gm-Gg: AYBFou3MlDQz8yCfDC9hD9Zb0ClH0E2ODg96oL3RObNEV31vbmjvga79+F0ffsB3+88
	HtPKgqsyAvznP9dLwMvN5Niu7d5/6Uixa5LZIEs5eR+u0dw8oeJQ2s+mkErtKWcsfhA5cnPMo/L
	TFZ4f0fV+aMtu5BnstzGaDsZg69mKCqIvnqfI57ldeBPitW62QCYeiap+HLx3aeGf3h81VGHFNf
	no/LiaX7+Fpyaftk13p3/vkTjIqUJ7GEATo1XnSSq08Q3yk4omKe0NLtFisSZ/QiA+mG2yhuEaU
	XkJxs1+ejT5ZuAoGfncNiqKPW2xMUzUrughCThtJHiuqq8HEoMx+xtIxxEqgsNQS6FUCDui29h5
	eDQXf54srLgrXW3Q2tGiiqkzvdMitKUcv7oX6XPo4lY0M
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918090b3a.20.1792599068628;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918081b3a.20.1792599068148;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm1095569b3a.13.2026.10.21.09.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:11:06 -0700 (PDT)
Message-ID: <a9900595-eed5-4e5b-ae8b-212597601aeb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:41:00 +0530
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
Subject: Re: [PATCH 4/4] clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock
 controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-4-fd4c2b3cbdea@oss.qualcomm.com>
 <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8e41d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OgLFbhcrQp8kNKIItaQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX4QH97TnNTrzw
 /yQ8vni7tL7Nz9HMnJobwkd7ItJqV3nb92vovPO1rHcgECwz6wI+bFfWTW324IgmJpCY3gVeS5d
 w8cyiApc15WHVrTKRbbuuOYH3LTyUpo=
X-Proofpoint-GUID: RyfNWnt9Mq9ApcR8AC2cGxVcdU_8YHFV
X-Proofpoint-ORIG-GUID: RyfNWnt9Mq9ApcR8AC2cGxVcdU_8YHFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX+KMMG0cgZXXX
 8icDoOOXnvflEs9bVwHd47c36b09heelpzJZ56t8aoMAHFtSvDXUoz9CHTyXVGiBLHTXZzhSyP1
 RLzrp7wOYk2Crl/CvLRjMl2+fJbkRMt5H9jbjwSWMbrAd757rmrQvI3fcNvrKEDb3yWTv9GpVYH
 XQxIobBBAwG3UmSlWOM2tHlRm/rfNFXFJYuTkNUb43YQKamLcGSe1+77eG7sr60lZB516qYSk8H
 jAzg4Mx/Cu/A9LowA0m7h2lArabmjlzoW7lJyyVTMvVa8uYrl+CLyp1xOVcktjCB0tTY0hvoJid
 YqnD/snw90NMmnZ1iM9dngq3Cu/q8AHGDp6zcH2E4JVyyE9k0GBVNDoRhsbRCk/uilLqEDZdEpZ
 fsQA/Tbyx2YBn8ZI6rRQ5EDxHC4O8RTBLxGGVT2h7zAnJQ5rZCyVQ40UO37Qgh6cC62BOWGgMHt
 ViwIL7gtblSnKAGGqcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064


On 10/16/2026 7:22 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks.
>> The four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the
>> L3 are each clocked by their own Zonda PLL. Each clock is selected
>> through a glitch-free mux (GFM) whose parents are XO, GPLL0 and the
>> corresponding PLL. The gold mux can also select the PLL's post-divider
> [...]
>
>> +static struct clk_branch apss_silver_core_clk = {
>> +	.halt_reg = 0x8c,
>> +	.clkr = {
>> +		.enable_reg = 0x8c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data) {
>> +			.name = "apss_silver_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&silver_apss_pll_gfmux.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> Do the clocks have to be enabled even if the CPUs are offline?

Yes. The bootloader leaves these clocks enabled. Marking them with 
CLK_IS_CRITICAL prevents clk_disable_unused() from gating the CPU and L3 
clocks and hanging the system during boot.

>
> Konrad
