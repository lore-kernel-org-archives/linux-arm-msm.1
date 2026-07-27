Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E629E117
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161004; cv=none; b=W8TnHwKM9F2JIOfcHxGyZsDyo0HRx5sfTqyG1+2+ose2iGGKKXAPjofBg9vbx7XrkteqyT06MxZhw4Za3bYG45qq+9I/ramKpATdWehM/xeCNo4tZOQe1xSdPxjcYUVheYWkMI7hFgcrUdgmluMvfwDE+ybHL+vlc19yz2/72Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161004; c=relaxed/simple;
	bh=adrwAsfhAIkGUS3z3Afs6AsxowVpaLDbkFhCskgManY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7X0fnxyz46N1zw72foRn8PkrX/c3+Prj+GKdO84hQ04xOiGC/XyteGW5sLdQUBDUS9Mjw5pH0qpLmjXhBBri4f3S6kHHKzzru0qYmEDHkw88M/OQ8UhyBLr7m5DyaHVJHKCf33j90oW3PWlWT5vHavOUQkxghpynXmje6eA24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqXKs65t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvwCL1HU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqXKs65t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvwCL1HU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlvhs3787534
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3R/LOwcFbmCVfeXnS28YoPT5GraPotTYYR1n8ulF+s=; b=RqXKs65tKoedSsuO
	qRLKyLIUh5stufSeT5VKC1Eukq2TrjB7dIj10lTWSLWT/xKXJ+zGzeJajrbD4lvK
	r8/sWGiERpdyUF8kLuIpb6G4PDNbBAh2x7RoM5/9hzwVNkQUOARXmTDjJQ9DnUEV
	iF5HxGfcBuvz7p9Jt22DOvhwwuilHvhXsT/C+InRETTHaMaPn0EPAZqZ6uqLBsoc
	CXKSw9+rRqKjyNqrNXHTBwKn4OZhFjW2o4LQvVhIe5vNiG4UtwWzxMsM6yZUkitT
	NGg1SsWuaA3OwFo+d/o3AaegX5qJUJ71hurH8Ot5qBX6sQkzeA5HaiXusjfEbXat
	x2pw5A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2h8my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:03:22 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9f583f0abso1118902a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161002; x=1785765802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3R/LOwcFbmCVfeXnS28YoPT5GraPotTYYR1n8ulF+s=;
        b=HvwCL1HUqeRnJvxX0NUvSXsL/HEX+DxOAUp6v56G6H6BdErIE5uG/FIX2DiCfId3E4
         iBp1B6WNGtLSWE7qb3htbJh8pcYDd8ew+0GIxMzr4yzf0Okq+1oOI6dOYsHjsez++mLk
         7YQa8ouo/niaqEoabBM6NTLWGS2B1TlnQ2CljeD6kMIWOak6oO+QBgu99TFGmLAr71aE
         2CKDfN8wcpDiEc8rPMJUtAS3PedwtkHW5lv70HdBFQWwpTVTME/8hI17Uodrcy5FxXAp
         gjd11X4Wtp/oXPh3mRnaGyOb4Z2Td8+4aFCvmG2NdCDnlXKwkkgDq9ItyGmgQIb311nn
         kTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161002; x=1785765802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3R/LOwcFbmCVfeXnS28YoPT5GraPotTYYR1n8ulF+s=;
        b=NxbWo4WhxQmtGyUpcOPq+1qgpRZ20egKtCU9EGR+TwoFY7cHDvpI+9bJxmM+LALBUS
         pCAISTaPdpYkIPXDqEJjUdHdD2LOOVS3MzcjG+FYlRR0vS9GYzQQ4p/Rc0WhI534u1w0
         ZDPtwphnkrSFWC0RPz2I8/xya8dowA23rC6vsVaBHMQD26rJp0S2W/NIgRziXeUXdfw8
         jUOTGGzPFzoHJ62YrRhleSwtox5oCuxWiJ7qLj9/DwRtywYeygDcZRVbfE/LvDn/ciKu
         TTigXrAcKClia7fe4r8Fs35+wWV5UcTU5gfgcE6CBF9Jgm9vzg+EjGMjLC+aUJ5EZ6ls
         hyig==
X-Gm-Message-State: AOJu0YxtFWELyZUiR+RcOFV78DRU7YCZV7xrPdfHMavzjd/lPbfhxOov
	e/K2u/nW5V4oBVJrzsfrEwIEymnb4JeyUOXYHmE+yXK6Kmrws3lvg13tucKch/nYngENAqxQIb3
	JB40p5H3ZNdpVTQycMFUvcEMXbjGYBb7ESwhgJH41XsvMLuJU5buKL0Tsb2GOiXMfAfaS
X-Gm-Gg: AR+sD12F5RYzLYiu5eH2trtQoNHIu/G1CFZbVtkiRmASEUwQPRaGM3nfaufnLttzsFv
	tLc/i3aaXTPeN85NW9ApfH5kG8xSMzr+INAfFE6sDJN7GJcO5ycrmlCWaAnum+0II3AOQUCBmwC
	Jmi1Kxx+q/ABEV2ITXMAUNOLs4fSkVPFjH7djRJqrNosbMkz+9YizeLqNbhvkS+NlExxsnCQl/N
	c98fA1k7m9EbWQgTUvvjM/I2ZOmmL2wl0OpXthN4OHiECyV8SExVg8m667PGuKpGnSRp38kOXtl
	6mAOPzK7YoOZbUXxTDq8f1OKEVroYFuqeXiX90ti6kp1iCpRSASfPl2MMg/zVKloWccCBxllnJi
	P+GKdfCDpvKCc+0XILsdChUl/
X-Received: by 2002:a05:6808:124d:b0:497:e695:3423 with SMTP id 5614622812f47-4ad528d7697mr142149b6e.0.1785161001688;
        Mon, 27 Jul 2026 07:03:21 -0700 (PDT)
X-Received: by 2002:a05:6808:124d:b0:497:e695:3423 with SMTP id 5614622812f47-4ad528d7697mr142119b6e.0.1785161001130;
        Mon, 27 Jul 2026 07:03:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f1127fsm651110766b.55.2026.07.27.07.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:03:20 -0700 (PDT)
Message-ID: <cbbb007a-fe6b-41ef-9930-fec17f40c946@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:03:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a
 controller nodes
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-3-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-3-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfXwOtc6Ro/tMcY
 yag/hRQh+WjWnC7jaBm94gBAZ9nbRAZrHL827K8fff6s0mweyk6zaXVdE49n+2kQziGXFLcbZKR
 lJhKJvTZFUvM++JhDNL+hhFJPm0YMHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX8vcpcpaU0CJa
 fYBP5FN+4TER5XUUWMdT2tXBRp0wddIF+paOAWxf3W86KDnGPOTz03p/jmajL3jWpNgZ17NSuQC
 Eq5Otw3mXbcVvJJ5Az9KprDoXgT9aIGwEgrtrx2Ouc4pmSmMCI356mzKAMmO7RRkoE7Q8ANHStJ
 vMNIaslnai5DkBsTyrdUjbmV7PxjackmhXU+VGcew6nHJPoUeHC8OwWn4nwZt8vpUVap/c/UQmK
 R9bLzCTR93NARELrnEXH9tjHfZTkyAChRIRU9zq0bj7jDJ2LC5Q36Mm2UMbI+YZmPpQxQ+vT4cs
 DhFhtIpa+B6xEE1JbUqFg3KIonFt06mCKC/pE+D5n9c03Su/MFtTGagsBqZHOTGJPr92LYjwmRC
 WMpU4x4A3r+24YjdCb4kMRdWr57mzDAh1nXbfD3ibvfyhgG5sRoCIrHpR+1xcTLzsSOKFgvlUrw
 afIkpXmBniG83TtejPQ==
X-Proofpoint-GUID: UBHnSb2qkh4_IUuN4AJWJxSyTt8EVA3T
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a67652a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kF0Kh6n4e_L3U_yLb1EA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: UBHnSb2qkh4_IUuN4AJWJxSyTt8EVA3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270134

On 7/24/26 12:01 PM, Qiang Yu wrote:
> Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
> a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
> two independent x4 links (bifurcated).
> 
> The shared PHY is modelled as a single pcie3_phy provider; each controller
> selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
> PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
> clock outputs instead of the placeholders.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
