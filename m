Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935A514764
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059666; cv=none; b=d+1Gf2Z3RKD+pwNgVbKK+d+ZBQOYMqW2yxrSz8BuxxY+1SOmlo8SwBKBrVq/+YUIE9u26y9eVq27+tKQtSi3zqRskxKG4tr4WVkG/4/I1IrS0PfeWFIqnb3qL+lR99kt3CM4DLJlqGDinx6AEZSU3LBawFm7TfEB8E+VppxMPcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059666; c=relaxed/simple;
	bh=u5tlsWRinm9tCneuBQHtmvAy2x7uMN4jqyTkfs7VmyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUFkFO2mgqeEtVecct6vJh2Bp5sWAep/xb4BmUxwSa9jU3JXroOQ0YsOX2/LIrig7xGI8nlv4ASBCYSq7elx4eGPb6sQaLB6moUG6YpmcE0ORKc491lc74ueuILDiU3jpVIy7Fr+USFxiP4tdMFJ3f/Ux7PPF0/ZNFZ6tN6JK/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXwPD6H9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLJtSuGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXwPD6H9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLJtSuGC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOXn2114165
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=; b=PXwPD6H9VVWAPlpm
	7e64/gahPRzF03ivU0ke3Tro/pwygWZG4HHz/Q1f02i2TNYa1FbWmc6YWhhs6zJA
	WBvr3r9A12RcT4cqpmuZl1XpCTUNyxL8nCdFyQ/KSm9cw6DOlI37Voz1g9oF0RRG
	Pww5TMpaykPDJlt6boMjRlO5IhQwo4WxHDPepaudsgyIutUptE8Xmn43EDbjzspp
	Th9BcXQ3PIWKEuLSBfHhF9uo0a4VVpGR4Ff9K+hW654DzNNd3ejPGOAqV62XoB4n
	nITbNg4KhiyjXVzT6ya9FePZLUAwjC+BLrfRvPiinIlka3bXhyEBxXqPq8RkvARB
	eKI/kA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyahgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:21:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso13484886d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059662; x=1792664462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=GLJtSuGCnp2kCwnyCQzxHvTH/k7snfa0wi5SVyWgJgdi4sxYim1fMsL+flIqokQ8/e
         xzX1n6SNbTjSEjz/LALdITIY7q9qEhojMIOSN5Y1kU+SjpBevFktwMZAoIAxVWgdk/Kb
         p3hRydXRLiPjbhliERQP3Smo14b0yMKPj/oI0ZoJg18SbtFZreCvsw0r/5OlnmQnJshg
         fww7xR9KSeJEoMM9wujQBAivpuNP2S1K7vAg2/U2OI713FNeajMwE8gVvnG+jlBN54SE
         QH5/l5GO11aKZoWLZnow2yQ4aGNRDFvgvXRtg0VF5M6lPtz+sTZnGIf+caYw6dIh64D2
         Dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059662; x=1792664462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=e6O7bCAuJu3piJv4KeTN2bMH/bSwSYenGPSVDwvd2EnhKoo8gdEP91vWcZEcTWUZtx
         b0f/8tOgP5eIdSCyBfiaZbXMIQzZ8y4Pxz9AQ3WySY0+W0CK/17XqTOMwAxJ4wlrgH2f
         cYmH7bUIhHQDQAXZuZ+/LWQWSENGumWEaXuuZA2w9mcBRuZH8sgDsX9ZWdJ0wwUm4hvu
         oBQHQYDTqxC+0XyUTOwhO1HRjmjnlDAtdO1r7rc2BWxcRxDJqKCm8JwFBILaYElpkso6
         r8e1urKhD7VSEsvf5MeT5lWD58q/zMNuzlm74+KaxNN0fqY0knoRg9QH8ygyZKyXFFV1
         Woxg==
X-Forwarded-Encrypted: i=1; AKwUvByMTiGxvO6sPZsPrE0CKFvUiqNKrAzDYwJ8xXG+qPIdP21KGRPLqUXQd8EFDgjzYlDJ9R4AMIKLNIBUGX1P@vger.kernel.org
X-Gm-Message-State: AFq9FYLjU1QFpe0BSW4rQV96J5F1KHzXlw0YSm4SPvZI8cIuZCwC/gR0
	Svm6bZS+inO7RI/6dnUKekx/XR9047Go+cx/5EGx9hE7ZWhnj250VvW/ZIdYg8/Khx1T10+ZvbJ
	ssqL3Y89D/Dzvqw2PfggKuBXPbuybOczUan9qzCVISZR2b7swdKkKQQ++FwseBH5G40kN
X-Gm-Gg: AYBFou0lHzhvR67a0WE2ynY4Im4JhtYxpkxHHDnKIMO16ZXwLTKSy4qf6MkxDiC6dAr
	oz0/EK9uIaLOoc0WqSZLjpif4qL1P+3wM3NOZQiCrFiM/7kIwc1UttWHA6K6f2i/WCeEJwGlL8t
	eue3A9QjucchI9RQxH0VDeHr464W1MjgrHfywSs8gvLTGtMGtrPaz8SuB+u+qxtrlr1gdL9t5dc
	+S8eVzKWeWkFjXzWd1cFkhnUfhJjuNTLPedOkpaBweUSphwtNkkyOeyFLM4zl1jFHvKysLz22wM
	gf3Rkq2B9VJ5ehENh/rNG/PMxwZaQB2rDnI9rqosZUDGuLIrma6kIQx9esynlcRYWZCetLaOsrC
	WETbUN/zXA7gii3BXXn2VGQ==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302250785a.4.1792059661883;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302246985a.4.1792059661402;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:00 -0700 (PDT)
Message-ID: <9d752fbf-8b8a-49ab-8e8f-5c11963cec71@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
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
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5ERXi6qBaXsalsHnpMelt-0itkVgqO9J
X-Proofpoint-ORIG-GUID: 5ERXi6qBaXsalsHnpMelt-0itkVgqO9J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXwLCDLH8xxJ81
 L/nsyTiAhZZgOumOnSx+6vqq2SiQfqrmaoPWL1SbppVlOXSrf586MYomw1cnXYTw1iZKvcLik8I
 AlCsioMEYeQJcCRcKgIJegzBqNpOtSc=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0a90e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX+zRseU/DXom3
 B84CoK2MHAoWYHI20duLs/hcKqS9pEUvGXRZG4qeekzNN+E6RS14+Qwskmdtgmi6mRtnmwDGdOc
 KrUuM6dNJ268k8lZxh82VHwgLn1Xuv6O0iDxUcvkXMD2EjPVz+24BH6Ppcr7OUHP7UjOR6hy98u
 yca27Z4ohK1xOdd8aM3RMzHOjuG21u3i0eQwz614eP0fYNX1DzHeEKq/bcOPZg6KRoksUHWVOVf
 U2931c7jnFDeQX7S7IIC2dGTXusWs4dus/bgCLZc1NDQkkFEUAsxHrjvIC3zqrHGHkAoIzki7C5
 RtGtWh6aVnTI2QXePFkrNanzm7f44uRNIakYnFlbER0Z13/690aWkUw30E6TlAYogCwW/43anmJ
 QkAMXxMAHypg+i+tVDV0GbIrGSv4QZRk7/j57qnqFFWJi6kKQ2jH+vtW8/A2E/OCTByRKaMMws+
 P/K9fzPF+xFCZADk1pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
