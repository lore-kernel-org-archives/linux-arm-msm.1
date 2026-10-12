Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8634718D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806559; cv=none; b=l6m+BJBF7pyKBo58URlrYnEVBRaaZVIUL/IhO8zIAmkBXvirs98b3N+c1WXr+wUWJ3BnZ9Ntds815bFVWU+322UHQ0NyQ1zkj8Mfd9b7d/ZJPKyu2imn1Nb3k/AOo9xnaAsEtlDyIwie4DIGB4Qev/QgPYVyLg9pVcX4kiejrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806559; c=relaxed/simple;
	bh=+wKxsvgeADigiqUaqwzk6mlyDg1aQ0DfKdaYG7Ith9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riiCtN1Wukzfdwzj1f7atFKNmsiu8OHq+lMT5x380rWKBOm0KpiBhp1L/+8d1Aut/U1AsIHBcCG5pLxlZJHALnZ0S+bsVNIKMz32IuidiiOz5oMFldZrcwf6MO7t+UQvhT8xdEB9BnaNgsG34D8Wh5DyAGS6q/Nmrqm64vb9Ryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nxv7eiDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcWdW7/X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nxv7eiDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcWdW7/X"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BEC2275902
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+t/zZ008TD9OKrDMLJfk0QW
	3V+cIzRcKiLejTRb2f0=; b=Nxv7eiDqbMZMOD2SF5LE44VdxaTrKVnRLw2fadSb
	OeVuCZt8YBheye/XzHYxLPLlDwYQ8ZiMa9rXipF18H3v8SFG4NsYJwpfaQCm41Pf
	s+/he4Az+hB/1zfbwIHh5Yjv05w/vBUdjy9vnq/UOAHIgnbFGOJI71h8L86+HdiU
	RlfNNoTXHEW5vVmke5KCKoskwOXENMe+tAatKY3TlR3YqxAJb680qvRhAGAPY90Q
	fWNYRxwAaKxYXHK4ONNUIyRKUZlbNhcmVCkcu5YE+L01IfuvMW4NZvdbkkWKksIu
	UggHzC2LID4czxxjRULUvcq1PQoJ6cm9m09EoUENVQ0XZg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq16xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:02:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e15539a3e7so609266e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806556; x=1792411356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+t/zZ008TD9OKrDMLJfk0QW3V+cIzRcKiLejTRb2f0=;
        b=VcWdW7/Xt/ZV98nU+Zqg3a6ELw/E4ahigh05jrXXh+oLNEsr5vcYpj8asJSaKY6plq
         ckQsL2laOERJAEXUKMo9sukMAUI4QizX8ooewoxdwhZJ8nqcVTGjvaxTIEDLMiSk6HfU
         bltQchvXaRUH2hhSiNrVkDjD30tuqiMKcyNdD63bKitjaqCSYgIC58EB1ErkOGewCkqs
         Mci9vi2QomyK+4bbhabX2q4GLPmfhNYGbUhI2KPa1PmJNhd5ysPFNiW0i0xtZRt49SZL
         ztmf9Ggem52IxALHM4982GMXCXdVIu+WCBHR3G+5FTRhSSwbF95QBpon6gdLyMpw168J
         74bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806556; x=1792411356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+t/zZ008TD9OKrDMLJfk0QW3V+cIzRcKiLejTRb2f0=;
        b=U0z/+vnOZSiYpa/fQw8zf3eeKhjDN/lNYhG/U1lLV6GnVEEEIvJSq7vniyzQcRiCZh
         OBNVcJn6hbtomlfrMhDL8A2xTa8xDPhmYBrSCJ+ITSZFvw9rqNadH0iX+y0lXfni/bpO
         h3sK18ELsMO+GTYo/BQ+BAkIvGHWoZedcpsQLUwbUfHcoprBI+Jo8txH+fcIbPG4wUOd
         9wJC3BhvcO4hFYwtd0NU+eiKuaEdw7XaojWahxT3kt5pPXjTx1kIB7xzVbib/gjOwTya
         7U081ZywBAP5wMCXX13Thw1knhT1dfs/pc2QNHiHMSY7ohVBbfZgMBm06rK0KisIM6oy
         1KPw==
X-Forwarded-Encrypted: i=1; AKwUvByBKAGbHN4BnlNHwE++5ddGaObS2VxbKyvHg10bOzxTB1c20QVN6+1RfLPu7cfJqGFMfIoymqlXfYrB3PO3@vger.kernel.org
X-Gm-Message-State: AFq9FYJEiVEm4YV+ekvvzYS1AheMW/RCViix1hB0JXbc7/Lw+MXv1ghz
	gLf/Xb5EQOLYwFcO+j2qEX4O+V/UZf10FfVCE0ubNkviqd03a2ANuw2NrpwXVMpjXZDW/r/pnZN
	82MS6mF8PSLoHidv99sVaym483wr+O+J1Kxtvomx2Z4+/ghXr5B4azUMIzOX7MH+MO6W92vmvi0
	MX
X-Gm-Gg: AYBFou1zrIZxAjHatr8C8gRm8EoweWjI9Hi146MAFhoG3TPzJHitCJKN216Q9FeF8pk
	nP9JjGzZ7DyctsKSxrupWHs98ItPKElJZZibU4xAgvNSYB0bsAik2Hvfh9mVsv3SZRc4ZSR0CMM
	GJeaQluoGHNt2SkBX9Ln2+vYeTw6t5UdUzqEBJ/YzgzBP4FAQITByEIIQhChHXpl9FoAsFjQlfv
	R/frb6akP7YJEftuwyNbP+IvUiAMkp1jbqWSLOxQKaKzTwpCRUo9Es89TmEg/1bP4JxpkeVtDmR
	NAK1o+xGVNGK+xRAoyJRSO0vTqQfMUoxLkiCn5ySMPX2eGFZeE2j6aXxRqQO4oHSjKUcaZUKJcy
	RPHRExQ4/ZvliVo0UwWv/4eAPs2VDuz5v+WXhnLkuB5hJwS8r3JURumFGmS+ENdjollIm8qY5Kf
	eKRNFqnhvJ9tht
X-Received: by 2002:a05:6122:3906:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5e91f568fe2mr2394619e0c.22.1791806556274;
        Mon, 12 Oct 2026 05:02:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3906:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5e91f568fe2mr2394580e0c.22.1791806555793;
        Mon, 12 Oct 2026 05:02:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2843699e87.3.2026.10.12.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:02:34 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:02:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Message-ID: <k4aaqs75ks4hlnyzh2jo6tj4ada3ayuwgztxtyj2d7otu6gnqw@jnbo7xqc5o3c>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acccc5d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Of6yoZ__H_Ug1Y5B8SEA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX9ofxiMO+yHVT
 xyVH/UAmto7pW1yHYGB386oj/qSXLCpI8IxZHr3gNYrSHfdexHsKa2In2XYSayj/t/xlenSHcx6
 Wc/VrvDjs9WOAN9GnanPqh790/+VCQI=
X-Proofpoint-GUID: 3KZshJho7hQ7N2CwhjM42214LkwesMPo
X-Proofpoint-ORIG-GUID: 3KZshJho7hQ7N2CwhjM42214LkwesMPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX+1HMNYvWDmQ0
 hzMv5BXcnSvXT/PFcHHEKWOsk3Mh1Tlr+/wmcj8xQOlU/AGUT7A9sIEQRCghpMDJ/s9RjBAlte6
 GvTxeDGHzwy4DRr5qunqCxM+njKUYNj9H+lC7R9knZY7U6cWJCig104QsozMP6fnGJb6iUJd8pl
 wVkoAoceaeSFEcMHsLXtl+Vg4Eb8gqfZGApTsHt6k+nykDD07WEt4dujHMH2Es1yIq2koEpjgjk
 Lm6h/pODmnm4iAVqLoEFySSU1TcdcFcW14j74+mAWFdR+Psp3jZFtRXI262+tCV+a5qLLxjxRBz
 PamYKdKrS5yf+0+H0/ERTLi1y++MVCv14wIUw24Rj1ziKhCRHXigHQ6nsPlZUT/tCfQo204TqJ9
 hqb2Bmfzh7FA5SReY1YZRDP/tmCJIXKoKikr/+QuajWKoDqOnMD8F8FMBlnzOhwyOFw8oP0SOFJ
 mB97I9HcA6c+cQaT4kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:28AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
> 
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;

Also, forgot to ask in the first review. Are all the USB supplies routed
on the SoM or on the carrier board?

> +
> +	status = "okay";
> +};
> +

[...]

> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
