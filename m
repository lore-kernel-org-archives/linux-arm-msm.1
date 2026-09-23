Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A44F55BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168522; cv=none; b=lOzkNC+0lX55tVpz+h5C76n8i4BjHkktgKemRuYpMxLFLh1IghuDivmXX0JItElPu4PRvzzuy9rjBXdDhnVDy6dMS/jWXIIro0ZhVmyt8875MKvyFMctKYtjTGld7pGC29sqwokue9sdQYC7CW2Yv8VZoheFavBhWT7V33l7QDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168522; c=relaxed/simple;
	bh=ryP4MM2q3ZaOLSb8YBJYkfHCciUpLA5qQC+kQ9G1bT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOjLef34VlaYInmLcxGgGBW+BVTRMY8L8oknH12EiX87+qMnxCRT/BpRsiJkNYV17/8sSHD+ogkpA9lB0VgwWoaU8ltczWp8gf2EDBno3euR+0Wk0RnSFbYJeOi52CFfM+jrb1pqnfa/oxIf2Qw7+T3Lu8SBPp0UyZ8FDHgR3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Umt/qPyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICmDucxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Umt/qPyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICmDucxi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbWK62466622
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09OEgRVsFzhh/5OAzejmGXnyO2HglXDVHYpTFACy2dA=; b=Umt/qPyuSfLVqleb
	NrCB8j3fD7DjWXJq1nvQl1e90I9VlC2QZ+UHPV8bpU7U3bv9hNLIevapbe+D84Lk
	2cXm/KtXrRoy49Qe4Zabwv/nusTV/MIW+R+ml3yj9f0LFEo6YrIEyf3Lt0Zka8kE
	Zpdwz96gF7/S5nN09Bk5UVhG2wqaqsuU9AIhSOHHZA2mlI0LsD8KLqFcMFh+R14s
	YgS4b8FPRBIOUrSfX/U/RX+xb8txaLPhoGOnTUo4GInQPceFL0R5Ngm1Sar0oXDs
	S8f3sBX8qL/pxreQYV1q6Y1Kz48crlQ3njzGFA0TfSbzvBcdao8fvzs/8LbAU6YI
	04NvRQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c441v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:01:59 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4bb359e69e8so86622b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168519; x=1790773319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09OEgRVsFzhh/5OAzejmGXnyO2HglXDVHYpTFACy2dA=;
        b=ICmDucxiZZKz5OHCritjkjofzNpiWLDf+zbBAUyRLrpVcBVOrOyh3Mp/BvXznd1x0/
         daOcBunLYCBUN+W8g4NSrDyjoIz49mtM1RU3UfRx53Yz1L4tSkO9IGrT8YBy4iSv/uNo
         IbZ/+woIRwx5SielthFcsHQ/S4k8j95Hzgv8AH2O/cCvu7vOnKOdfF+5QlcFR9UbnEiO
         zpafbE2yMe0UoX35qfz8nWtY8MBEtWUtQfXIQKkxyVKB1X88i+5pkg3/eV1ywEw7mwAT
         U+begRRVP5P/Xf7icu0p4FIgDF66lfKSNiYF1sG+Ih9J3quuTPsMTXow8H89dlSfiY66
         xtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168519; x=1790773319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09OEgRVsFzhh/5OAzejmGXnyO2HglXDVHYpTFACy2dA=;
        b=JcCinYL0ofML1S7RNBruo1uwSbP2G1kHo53fVhivI6DDff8Xs+/48JGyvmddVhOFtE
         alg6Uu61++povxit4dLinyoCtf2MjDWnupCacO5tmuH96gKak11ciryElmpx4DCo+nA1
         rDAQ0R64rxqudaoCEXMCqXPijKC0ahbxIY4xjmbLPY8rEreW5PDE9RFZmlgMXMvM52Nk
         y+Mhl41qUE8ZzjEDVpWjr1XrPS4kr+T5VlaWqhJouM1KChs1RocU8Q30O2rkvAgvaP6r
         IBj7s0gYpy8RNGhRiLS1t6fY2OFttHkd923cF0FgrXxM+ISKDYROwhMKUY009cKRKEjQ
         NFQg==
X-Gm-Message-State: AFuF++lT9FI3y0sQ9rYBpkaKNx4nHvozOjxl2vhwhdT9FEcdMwJfoZO5
	0PDTJE2XCQmLjFsmrY3riNYt3cV3Hgk227cxLMO9396ysMp1CLMdVDG/Yoxutrws01VT07vnZao
	5JxRLV6eBJo7yuo7ESDBABTWLrbd2GzGlRlBgmtMh99Kdupn0CJ2tD3/Y2xgpXPAQk1+y
X-Gm-Gg: AYBFou09UJ2B23aSvIHmDSPF/2iYYiE1CCdO42BlWSEm5ULnz8zAQzbSJ5FAqifhKim
	gB/PUOCs4DmQAKalvmjGZRf8HAh9aukDr68l8qfHPBC1tjXBpjn/GhzBbSJdv7rcT7B0SXN5kNO
	e/chfDhzvRR4VfQrUTr6MEPjseX193hbMXbvR4qHyXE/OKSUF3FYQmLSaGseCU68ID3Q3gjpFxr
	uUEHEe9OxSZNUGqvap3eVjHwGz2u0YjZ5xxiONc5db1S0AUHFuarCrmWbtHnDQCHHK3cDFu/EUD
	JUS/5s+RMeuQIsXXu3tcwBg4sCCfYm9hcf94p9R/HR9julgSzHr6MVmLdG7rlGBX8VweyBLPOHH
	drcsYBlvYnuQqbbkhzDsyng==
X-Received: by 2002:a05:6808:2214:b0:4a3:f036:f3bf with SMTP id 5614622812f47-4d5b6397023mr2926993b6e.1.1790168519112;
        Wed, 23 Sep 2026 06:01:59 -0700 (PDT)
X-Received: by 2002:a05:6808:2214:b0:4a3:f036:f3bf with SMTP id 5614622812f47-4d5b6397023mr2926926b6e.1.1790168518613;
        Wed, 23 Sep 2026 06:01:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33d7e0sm115494966b.2.2026.09.23.06.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:01:57 -0700 (PDT)
Message-ID: <77e0b643-1e7c-4dba-bdd1-8cb945205b5d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 5/5] arm64: dts: qcom: shikra-iqs-evk: enable
 both Ethernet ports
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a32CreJgkSHX4L1SXXSiBZ1d4q0je-Un
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX5DOeZJzWgksN
 olHU8AVPX8gBjkxANtOoIlTBsB3t0IW0vqzzxTNjFl0/Fp1tVyGax3uobXIAO2cmyfzlGwMxWUM
 Ii/A8p2uRDWQVzVt+VnUhR2TeyT5naA=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3cdc7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U_cLpEdEjkfHclHzYWgA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: a32CreJgkSHX4L1SXXSiBZ1d4q0je-Un
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXy6/EewzULfHH
 AnGn9LlcURawDiAvg7/utf7vDnf9NzkPeOrvjp+oTcXeC9ryhHXAMXbKHsoTkD1gS5KsY1Ljqby
 0uf4jg6Kul6eEt5d7V5LANNKWodgt3FY+T/oUw4CZFRwldztRF8g4aEqK97LdTqXEKQRZLyrKj0
 4OMPjnZwOwNXsSRc9GLB5oA86NCkeVpoyexvSdWYBEY/JC25w7srXR0yB/3ozOdLjYeItD8KEnG
 SdPFl5FzUeyox7vnm4xMcnS4kELHG+8lGKFONFiCrVUy6svMcheIDJL+Oe4HZOOXGbZNJiVKD4Z
 F6VWrm/VTHRiKjv4Lo2bwF7Rek4bvVmOUDPXFyArCaoc59i2NSXQ3OaID6L6feSgt3v9sSxdL6v
 TWe0gGOfp0ub5MM37ZLbFscsrCj5jr5F4VzXzs7mHbYqae3U9rvYRHPv0k11d4Ywf6vJQqkUd5i
 dqB7bpMNmf0rGT+nHwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Enable ethernet0 and ethernet1 on the IQS EVK with their respective
> TI DP83867 RGMII PHYs. Both PHYs are powered by GPIO-controlled 2.5V
> regulators.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

[...]

> +&tlmm {
> +	rgmii_phy0_pwr_default: rgmii-phy0-pwr-default-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	rgmii_phy1_pwr_default: rgmii-phy1-pwr-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};

and in both places here

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
