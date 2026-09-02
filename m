Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF03F12E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338817; cv=none; b=q8a+kLM4P9ccaX7RvtCiwAGLYtSFQtIMXoSf2gRkOLxzgV7feUnJ1gTiCxX9Cxcj7/vOmnCv4Uvd7Blz1eIoFQLNyDpLmCy3x2MoVZpuOy3l2S2YO0QdEfsO0tP2ILpeB2P+fFIMzz1CD2rbmpzDfZvcWLUAfjwl46j7mnjh6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338817; c=relaxed/simple;
	bh=pjKHKY/7dk+MEWJF4cjV5fozlLxg++kp+foLwZ0lEFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZRirqHJQVsalQvi6OPt+W2ZOTbKNtjCoe+w+3jTaI6H3e8WuIc22D1yxosTwVobEjXhSZe0Fc+4XRIPXqJ2g8MGd59BJ38YkUhc9otV7tN+BGuThhIdZUYnFJ4ceHewIjWWfUVgkx+EKS5SJsFAtZSR4eHZJu3KT1Un2Ru1iwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te7QxGIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLBLzeqV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te7QxGIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLBLzeqV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VicM204988
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=; b=Te7QxGIqeNWN0nZg
	ujfTMcuJSwyxPGFhWkUXvtcudiwoeVuA1XrXm9X6EloA9hx819tM1mw6Wxr2O2LG
	RdM5e5soQZTKO9DVl4+zY1u8JV2sU3S/c1SEEbm+E/GeyAkus6haAep0i2ZLXocj
	prTkwKqEjGo01Q8kfdsW+kP9R+jmFOS07MUdpqrMuXy97+7CDWVdvR3nnrv+uML9
	qkR96BXCf8/+IPXjhK2roUI4AtRj+GbihDDkqgwoAOFhKSuXuCpPV3wMQjGVykmj
	X/J53yQkvdxyzpz4IAt7VIj2S298BWyafnFxs1E/kFAWnrrjlY9TpNMbrf8H+KL1
	p6N1UA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbh93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:46:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so26404685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338814; x=1788943614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=;
        b=HLBLzeqVUYpIoaSo642F+wzFmhrSA+illtm8zqwWm9dCI1fFvPPytWja0SSwG5Dnmk
         3FBdQLeNMa2NUbBfr//PJoPsfovjBVjypoyAtl5ODi733GMjs/lfTEopjXiwKzkIybIP
         1nCQmt9WxoXcbFR5hXOHpyEzGIS5urCX/AhQSqcan+cZrx5+GusgRGsFBjI54EyVdaCz
         H48Y2DwcnUfmRsAc939kHjgZLMek8k6q3g2l35W/FFORhlkcqt7RwOTFt2csXjHZGJZc
         Mwrg266hd7jiitA6SjfQP7FRqnLb87SV8hSdB3C6pstwkIzOh12/iz5kMMY3MGw8g3WD
         LF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338814; x=1788943614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=;
        b=YCWJ4a3MhbKjsbRkqT5jEFsO5bvRkIP6R/PyBQS0CEDM0PYnejMClG+5X8im7vBzRa
         U8QE4pR3Sexv9PJZ4ge9Q9NBgUcHpLhIYLzqnNv+u1vHnfYh/jyWb0S4VqESMifsw0wP
         jfsC8kxPPA3G6c6rhX1xkRMgO1VCujSvxw0hqeaBTQouqlDq2l6lK+L7A2UlvO6zX2ro
         BOSGtMr9vwuyo7RgDAWTD4cko2pgno+dESCLLE7q45fOjjkuXrYueQiKVYyadA2KZInR
         sYLPduZJJDrGG8Grfyxr2oM7uVI/DjIeRkcOMrqkfSKFqrL8qMYFbpLBXDaC+vl+uOGX
         lEOg==
X-Gm-Message-State: AFuF++mEo0xXseJSeu4nH34ckUK6GnLv6OYarwy7OKy6n5KaywSHKQMC
	0ia0InVjBq9nQw48A9uDN/t2+etiHtS5M1T8nREpAsU8zF0cB/25UzssRaoWjdqk1mELDtMVuVz
	SryuLkZphEUpNDgMTnoilZzQNpve7sunKXfHgLYBLQK4O1HG7EZmJUBzGg2LrKuZsrKia
X-Gm-Gg: AR+sD12XOi0OpNN2xE9kc9hdmjitJsoLmAAW+bvlssXP8v49Cv7sQB1CIPPNi8ibAwI
	QDiiGjS2V++Sy5grskjRWa80f+MhvUa4OHk3jQP9IJbh2KuXdWQTNH8We3Dvmm03PaZuBzKAXPz
	3iG/YPfKJeZED5nBH0jDnwqWpQbATBMyxjqAGKSkyJB7H7TeCDN3YNHB5dqbACl2x/yEu5pznAO
	5Pch34qX8HduEPlgX8tafbaGvN1Me8IMswvscRZKHoLcLxBcMCZjrEbrP8/QYzu0widxZxyY88Y
	NQuoTcymvQ78KMCjxv1hMpFaYElZ3WoCesUqCskVCQFKbTH6nah5IbUK787cc/4ae8g2i9777en
	xLwS8drQaPCUpuQr3gRv7XA==
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr217676385a.6.1788338814416;
        Wed, 02 Sep 2026 01:46:54 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr217651485a.6.1788338809155;
        Wed, 02 Sep 2026 01:46:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc68a2sm92433266b.11.2026.09.02.01.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:46:48 -0700 (PDT)
Message-ID: <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:46:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97e27f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x6ikuqDAs4aUxygX8wUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 77HAOL3Be7-ja_2H_w0abQmX0ewnwpjN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX+JJ9NnOBUvYw
 fbcffDbcERjOpPvFu6+XUjqARyAYdd26Fi5OPu4h5xWhRpl5VBoYe1MMiR1/1ZZvID0TS0ypfGc
 YB/Qeh6IiGrz8whpVYtt+lxyV2q3AFo=
X-Proofpoint-ORIG-GUID: 77HAOL3Be7-ja_2H_w0abQmX0ewnwpjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfXzxdTIg6XdnVS
 ssVjpp/DPrqnNTVxdHQKd0a0k/006Gr+55Tl6Cmm+Gw6iEnnN5Ad2vNCcVGfliJ8Czt4UQ1WASH
 gl7wRhzmBCXL0KhcHknChpIESsIge6Gqi22PKXGFf4TghYkQhy20K9sjoZk5dl+sUZRmifEuZv5
 CIqMS+SCXZYSZHUnHeMKoKogxpA+cC7T9OB1ap7Bai+0JSNtN0Ox7cJRQizu0UUsLVtJZdf5ZUy
 GqFYAQSd4K4UwxLwFY6RYgbrqPKmvoghn4h//6RRs0I7ITfwzkzxzr+C/T2Fb+46CZt0mg+wlgN
 cBDuOJo3iw74Mb+ZwWtK3PLjlBF3+FX/sOC7F2tfOCIh2Be2UQ2/16jkyz2wLFKFTcC6bt5Z2XW
 JbQarfLI7BIh4oTGHsg6O52gWLR3/xQwrQy5F8hgs6qZc2zXAOIq8P1VGxKpxdBRZiz0OmkYibC
 cR7+CGG5t5H+rVR+UMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020076

On 8/31/26 9:26 AM, Sushrut Shree Trivedi wrote:
> Add PCIe support for Shikra target, by adding dt-bindings for phy,
> controller and corresponding phy & controller drivers/device-tree
> changes.
> 
> Shikra RC is connected to TC9563 PCIe switch on all three
> EVK variants: CQS, CQM and IQS. The individual downstream ports
> of TC9563 connect like below:
> 
> DSP1: M.2 B-Key for 5G Modem
> DSP2: M.2 M-Key for NVMe
> DSP3: Embedded ethernet device
> 
> Power and reset to M.2 B and M.2 M slot are controlled via
> TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
> under active review, current series only contains basic PCIe
> enablement for the controller / PHY. TC9563 enablement changes
> would be posted as a separate series once the GPIO driver is
> ready.
> 
> [1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove TC9563 specific changes [Mani]
> - Fix commit descriptions/subjects [Bjorn Helgaas]
> - Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
> - Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
> - Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
>   node.

You also silently adjusted the OPP levels in the DT patch:

< +                                     required-opps = <&rpmpd_opp_nom>;
---
> +                                     required-opps = <&rpmpd_opp_low_svs>;


is the lower one suitable?

Konrad
