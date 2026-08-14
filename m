Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435BC423E9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693743; cv=none; b=Rvj8ZzhxIbHJuM6GpjeNL+t+mP96A717oncD5H86HK95UR1KOBes8Yuwo5G1hnYxTmtu95sEO7eWpP6hmxB7ZcPT/xSCZHq+ZHm816gKSOIwEkCqLT5SAOzss7arTXFreG7QuZE2Oa+zTImlGSe3gFIOkFhI3oxuJu1w05yrSkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693743; c=relaxed/simple;
	bh=v2/1rGY1jbTV6mnksaNbt64aVjPeYee2pckvADnDVtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eaj9MAmz2m8CupU8uNvbCXTfN7PzMSra89xc/YCM1TM2U14Kr9SfwUdC02CaFJYuwscBgkcCk8YAIHzF3fv5LDlyVQ6ZYla8iq9VOODr0f69Du0ZdmYmfN7+YVVoqgqZhNzNd/esG7eNeCl4vVbRIgjVwlmqzhIy2iRfSemVnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIYdhht5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN/SbgKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIYdhht5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN/SbgKS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fbb4273959
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EEdADYVf7PZDDxkAC3RN/57VZYCx8imRtEtjUOGyeU=; b=cIYdhht5ffjkWy8X
	HY56cQq9eoqMPrqXHrlYQ32Jr01S2EKEnWadPVUbsnx4eUmU1ktUyTcOBpumUy+K
	U3yg/ti81tgu2QAcbR7Cap1dG+8jlyBs4ox0LF38pRt9P0hQ02osvPFKE7lE1djx
	Ty7VsRW9iCy32lkVyfuQhK+F9oyJgxYV7PR2zqeBNkWTNMjqomyZdpO+fCVp53Pd
	9AC4rthqt5DMmOEK77zFHoWRit8nY76Mujatu4Q23j+DKbWqXELiwRLymGT6ti3v
	0gkgjUHbrZE66sd3B49h3HnyMwEsFFZe/UzdIE0TD1lHQsr1Hc8eym92IYO4uIUd
	PA76Nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42j9xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:48:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso736891a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693735; x=1787298535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EEdADYVf7PZDDxkAC3RN/57VZYCx8imRtEtjUOGyeU=;
        b=XN/SbgKSICRL01iXY6vgpmk89zC+7ZIN+jy/iXsVSH+s2R9RlfuJuskoNrG0FXeYD3
         kyE1sJT/AZg9/786SNZ0X8g1xAxwVr0f3fqNsAbG563cE6lbYD0SKo0HkR9iezJvHGkp
         jjgQKUOS0rsq9s6VTJPm3SNQE4e18P27cONz10CURQwptrFDCFNk8whyx0Uv0I2wMtTk
         tdmUdkypKkL1l64EK3fjPMTrDJG3cJSwOUmZwUYAiBY2I3ufHyS87kLAj2s8N4vDASd2
         N5OUsfHiF8kU/vBfVgMGwO2ywC8qw2EPXToBDH0S5pfRg6dIleATxfNXMZuYV6KxRIN/
         kPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693735; x=1787298535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EEdADYVf7PZDDxkAC3RN/57VZYCx8imRtEtjUOGyeU=;
        b=IDlFj55345hnH0OBFpjE7GFKBoWoW4ZnVYpgby10jmuY15KUl4Spnk0/zpZqC7fHpC
         VR7vx2BlPU40T67fFxrUDa0+GHoYWSiOiBsOssI2RV23SykyQm2VKUqDgR+jpUAnpBZs
         CNGBUqeJlTQIlFJ7mNCq0Ve3Pj1Y8csWv1v+2gdShnxWvwoJBiI/j2ePAWYxlr9Z+SLf
         2O9XwZ7e/H70xIJTH8m5WrbE7Eo+nMjXUBkyj6PhA5o2HmI6IXPijTXEUZXUexmIEa27
         WrNkdCnGK8hSBkLT70ljPupF14TW4DxKWZaPdTMi19QA28hNxzEnQuS+rZxbW9VTAwJr
         5RVQ==
X-Gm-Message-State: AOJu0YwzM17mTeyFeunRP2XcAAkiRJbfCxd1cKZD3Vl4+cS/i95hhQGe
	qpYvNSEEQzgabK/ycLx6FeW5YtAcQnF8S7kwc3OunDbWMmpEj3JywJY4wDTyg6fp7RolzrXhefk
	QQPwBMDucA6DjVJYlPdBvysMShZ66PpXaNOFSRnhRCQJA/0j1pbMw857bYgTuQUm34K+l
X-Gm-Gg: AR+sD10KbO+F21UUGELpPMaeesKs18GnpVFofZ7DMhpzzzD4QEnRrRa/gnupUoJOttd
	7Fm3dsthRyxGg1UeedOLcfi4i+B6ypQl+StQPs5KopIlgGN0TnYPE+bwxpOaH8gA9pU+G4OFQ5R
	NOEgjiFAppE4K/upxN5AJ1V4IkHAz6mrMHIL1DvjiMoUWA/8CyNSa3JdiYrZPJA1S4V23g7hhx1
	uS6mhHwUJMAYXMBoQbjCGSYn/HmshevCM/+409aiK1jbq107IkOimOFayJgjsT5DdYxYhgHHldJ
	HMoLTuHfbtHFkwap+4IAUQH4tTOFBVbeaVNmgjrXGblbOGf2Lvfkgyg5qYfxLQ8Y6iQHbMmtyez
	OHPScmhP/amBLrRPPPewiKPMd7fN5YG5ciEtUbnyglafezkzzCbGITRxf98yIBhKjjWOoYsa7b0
	I28+jd4cBC12ZaKupXOng=
X-Received: by 2002:a17:90b:4cc1:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3933bd0dd0fmr4662253a91.2.1786693735384;
        Fri, 14 Aug 2026 00:48:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc1:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3933bd0dd0fmr4662206a91.2.1786693734924;
        Fri, 14 Aug 2026 00:48:54 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebbcbb78sm1556274a91.13.2026.08.14.00.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:48:54 -0700 (PDT)
Message-ID: <c25cf793-477a-4294-8027-e1f4690dc0b9@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:18:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-9-5e0ede4a0c72@oss.qualcomm.com>
 <CAMRc=MeRNMug6hZ8Jcv7drVfKbLRxG=FG8r9--PkwEpcj5JuCA@mail.gmail.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeRNMug6hZ8Jcv7drVfKbLRxG=FG8r9--PkwEpcj5JuCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ec868 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S7Hclr-U69tWnHOGgbMA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: AajrCN0pct3Rlcf85vhCPG9O187abUTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX2lEF1cWmyPLv
 rWEY+B7lOUg0GOJ1ATGDpr26KFCxxCssjStzMLpl3cmSpT975rLvbTfW6zfG1lRR+9e6qcCDjZM
 s5lTrzpM/2rILYLgXrbv9ENkyDwjmoKeGCL9gio6mRPdwG+AnhkBzGYymXizEIflFlxpnvcyiuX
 7QBWRTn96leYdaOpuyynllU+DhdIwEIYRFh4CKwKSH8DWYj8kJYcxyzB5BuF50wV7o2+QaXlE9i
 TcqS2HXP5mh5qXiMTpijh3XRMGzbdI3L84s0jMUQKgjQqjYKnsGIaU0OK1oh2vMPTDpTIikOwIM
 Xdrhpi9KQ3Q+v0ty1Vc/OSO5BRwKralnAhKjEZKQ6ulC1ucvJjDltRkYg29gXKkBR8Qbf4hOEyS
 g6vATZPtDZSUKziJefJPPmxH0EMzdC3Si2kNr24TAnfqTKH9UlDNSgTLashAg2CGBe9h5yj/YdP
 GVy+4vOY76myhu/MDWw==
X-Proofpoint-GUID: AajrCN0pct3Rlcf85vhCPG9O187abUTG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXyJt3A4wWJ1k9
 51bU4LODdLK0QngauxydTJqf5i0ItYsOOdxFwvr0xJCeJ8Er+XLZjw/WV2GCyss0j9VIY49YeRF
 TspSB1Py8Xso2c8TRD3CRwuZCKbbTZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140059


On 8/10/2026 4:33 PM, Bartosz Golaszewski wrote:
> On Sun, 9 Aug 2026 09:27:08 +0200, Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> said:
>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>> interface through the common pinctrl-msm driver.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>> +
> ...
>
>> +static const struct pinfunction kuno_functions[] = {
>> +	MSM_PIN_FUNCTION(gpio),
> MSM_GPIO_PIN_FUNCTION() ?

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

>
>> +	MSM_PIN_FUNCTION(audio_ref_clk),
>> +	MSM_PIN_FUNCTION(coex_uart),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
>> +	MSM_PIN_FUNCTION(emac_mdc),
>> +	MSM_PIN_FUNCTION(emac_mdio),
>> +	MSM_PIN_FUNCTION(emac_pps_in),
>> +	MSM_PIN_FUNCTION(emac_ptp_aux),
>> +	MSM_PIN_FUNCTION(emac_ptp_pps),
>> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
>> +	MSM_PIN_FUNCTION(mi2s0_data0),
>> +	MSM_PIN_FUNCTION(mi2s0_data1),
>> +	MSM_PIN_FUNCTION(mi2s0_sck),
>> +	MSM_PIN_FUNCTION(mi2s0_ws),
>> +	MSM_PIN_FUNCTION(mi2s1_data0),
>> +	MSM_PIN_FUNCTION(mi2s1_data1),
>> +	MSM_PIN_FUNCTION(mi2s1_sck),
>> +	MSM_PIN_FUNCTION(mi2s1_ws),
>> +	MSM_PIN_FUNCTION(mi2s_mclk),
>> +	MSM_PIN_FUNCTION(nav_gpio),
> Possibly here too?

This one not required.

Grepped the tree for peer TLMM drivers that expose a `nav_gpio`
function: all 10 use MSM_PIN_FUNCTION(nav_gpio, ...), none use
MSM_GPIO_PIN_FUNCTION. Kuno matches that convention.

Best Wishes

Hardeep Sharma

>
>> +	MSM_PIN_FUNCTION(pci_e_rst),
>> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
>> +	MSM_PIN_FUNCTION(pll_bist_sync),
>> +	MSM_PIN_FUNCTION(pll_clk_aux),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
>> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
>> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
>> +	MSM_PIN_FUNCTION(qup0_se0),
>> +	MSM_PIN_FUNCTION(qup0_se1),
>> +	MSM_PIN_FUNCTION(qup0_se2),
>> +	MSM_PIN_FUNCTION(qup0_se3_mira),
>> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
>> +	MSM_PIN_FUNCTION(qup0_se4),
>> +	MSM_PIN_FUNCTION(sdc4_clk),
>> +	MSM_PIN_FUNCTION(sdc4_cmd),
>> +	MSM_PIN_FUNCTION(sdc4_data),
>> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
>> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
>> +	MSM_PIN_FUNCTION(spmi_coex_clk),
>> +	MSM_PIN_FUNCTION(spmi_coex_data),
>> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
>> +	MSM_PIN_FUNCTION(uim1_clk),
>> +	MSM_PIN_FUNCTION(uim1_data),
>> +	MSM_PIN_FUNCTION(uim1_present),
>> +	MSM_PIN_FUNCTION(uim1_reset),
>> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
>> +};
>> +
> Bart
