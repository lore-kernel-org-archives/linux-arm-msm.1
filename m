Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF274AA00E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366387; cv=none; b=CWbO8DmeA1T06tyrEL59G212kyWbSEHoXtDs3AwTMLxa8Lbkvinnctq7byHga8OuNQ+vMErRJio6LXg+sUa1JHjahsRr+Du2c+jzSSBgYHlJDO8R1bwuI8VyYxeQNSNMcivJs67Oqe1M8mv7llhRux65LHEUPXX9I4+o74U2Sc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366387; c=relaxed/simple;
	bh=XoDcH9GORxw+oEU26TAT7hJCzBtymOFWgvnwiz8EQo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLHkfRIAllh070ifbsLqZSsEPzFN1Cn4/zDIBXF8sciLx+C0Rq1+NP5UFbMCz/SlR13MaOaur94r9Uh3z7TN7jCL0VjJ9lfvtrl9prZduCS9jyHfs7gbm9GRLYzjKIUpZhVoDGUzAm2IKREcbK5kiEozqrGZGYld2BkMecREyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIjQqgle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QljyopoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIjQqgle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QljyopoR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Fa0OO2424115
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=; b=TIjQqgle6O4guCDE
	auFxEP3DJckesT2YGbS3JONg42uoqIU8IUiRQcYNjxU6hjAJC+LTHphwXW60/PdM
	C7zrUWr72yuBeHxkoCv/uuotiyDtxyItQPDZadi4SlTDWj+h3vixa6RoU0krFbPj
	w6wsxZLEfqGO8oqG4ji+RlD3yURmyiFXc0gB0cmmEfTBQAAoxSnJNKGOfxpC9EAw
	ilxNG0uEtnl63HzFSf9NKtvNDwRTQ099s+PrljWcr3Ec3pXspvuYhOTKYrVY/h8k
	xxwhMwF/cOE27mJZZJnNrFv1FmIywqVp9qrs9H485Mbmtx5+4v8pf116nnsZJJtC
	3uqauA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1rsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:26:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso25027785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366384; x=1788971184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=;
        b=QljyopoRigdPF0Ta94Qyt5BiUIwuMLnIBLHK7TLuHz5+ai+2eXMENx4y8/o3COybHa
         gdB0kJ8Li/RYJS7VhEwSreV3aLoSFl7XEA2hL6grI1GmYV34xjSrgTZbms6wC2v/z19i
         8wsjI0g7irmAL71Ar8MfeWXnRoiSj0rbarMe5W86jXLAlIlcAGZWRLRjkENENQvcL5Lj
         hQMIRv0uXeI03u3jhozHj4rQ5lEBI2zw+huPrNNFMCSWwWHloYPfThXWKfwkRC47mDT3
         DVXSdQSNxopx7T+i8cpJWaao1NFX6V4sC3bITusyXbq8RQJRtnkx5ZeCiiDdHvHiCZMA
         Ox6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366384; x=1788971184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=;
        b=R/alfilKrPJOMGUy2tyrgUGYvNhfShz59bzR3tTJP89gUbo2pkweIFdx5hI7tmLuaE
         t5lbZYxp2iRJuhcZ2POseUoRnScKXQISwgmROkJC5lBN8nYsp8cSvq4FDlMVFwHNXri2
         m+A/xwsD1TpRCnoW6EV458nWkrFhfIh0CosUqtnkfg/lQo2ZURaB/4qT/NYvzBk2UDbe
         b3goEqbLtvhEoVqWmYgOF74BWEHNYXGrK+5m2gqMjl5qd9A3whQBowhj+SecDXwx1mPW
         Jl3cWcAUkn9NHA8So3oGR1sUv4+Xi99spyahPUew74/opSt1fY92lKCX3l7B+koWfaj9
         cgqg==
X-Gm-Message-State: AFuF++nPkVwsMYu9MXf4vxs+TUFqd154F0QSbo8iph0cpvCKGyQKm46n
	26qqbGcWuY9ehfcGv/4Vyi5au+na4SGq33Vtjo/r7DXKzgoihP8qS8lZGlHAHyxEdlnoSsirrzq
	F+zVHiy5V2wQvRHJXjHXT3WTUsOlXIQH4XgQNzIO+ybT09xR0G4x5VEo8C58cDiXpz1SX
X-Gm-Gg: AR+sD12O4lK2dekrjHpAe1QieWK4PsALfglQYsZVpEcIEVdkrqs3YJ9X851dIjsLvUh
	lL691hxv4iLXomL0dWawNvaHt9xNli9lzmWWx0bGBvaWAYCdvHFQgsTCqSMy0DxiM7SeZF+fMOu
	DQGLrWzf5OugokKdwDutKsQSvWZKaWAOqBV1uOGo7qB4sZw4EnngAANX0P8yimi0TzjpGulY0fV
	KxzHYARmxbHOq3mg2+bftLGNePsobSjCrUxtvinJsreKvgFXxXyTxqtOqOqCxRo3uoh79O0Ds6c
	oM/8DzSVgkK95g0RKLl7Q5Hjd7Loz1/lYeR4G8lScEvffL31XQ1Dj0HDogGrgoDaF5AMb2XqHYx
	/1lXYI+htg/QkzyuPp3uV2w==
X-Received: by 2002:a05:620a:459e:b0:934:95d9:85fe with SMTP id af79cd13be357-93960faa235mr438364285a.3.1788366383720;
        Wed, 02 Sep 2026 09:26:23 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:934:95d9:85fe with SMTP id af79cd13be357-93960faa235mr438358085a.3.1788366383062;
        Wed, 02 Sep 2026 09:26:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041ab9esm160010866b.53.2026.09.02.09.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:26:22 -0700 (PDT)
Message-ID: <d705aa10-0729-459a-aaee-574bd40168dd@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:26:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a984e30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=foJT35fSmds2pDCHF_0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ter-ayJXagmeMlvKtI3cXKzp801J4V_e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX7T6bvsowWhkJ
 /OaLAT5Hb4L2xAgqXt1kL7Yq3SYeiyO2XWSSRuz30Q6Rw46uIYXy7ukPvHxXLZY7cmWw0XFlhlu
 /jCF4zy1Cabqx6b6fHv3/uYyMIPAgUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXznR0x6noC+bD
 JUH3Zp3omJVO5HXxSXNWgHPBFZiCEf184qsQQ9fTzlAdQeXn9Hwk08+yksnLHnpm1MdispycxEg
 AxxS0ykn63CoSU9tkKX+B3JxG1Izw8ffoS1W1+qzgs9/uaG+xoO5UcPVhxY49cHUhwQwKyOy8ru
 mpa31zf5nA55/MruV6OXVwM2PFE2pGlATjF/imnO8cW6v+FQIVqaiTsxjv1Y23coeFGHp8f4qYf
 ouZuRNLEYpVA/CmeUmZ36zlAUOw46PrH1dmgYLpRpJXRyq974nXH01X8CI5q3GIyWSzXgPhwgou
 vjGTpDb4KgG1oyy+s3kCRQGJx9YAB26PWA5v/ytkYXFOLgefZNeG6JtalafEoldkGeyyXdDAsZJ
 VHk8duGO+L3mP3UpN1tCBq6P7Uc691oQauksuxBGfeH/wMxwrrBan/J4lK/l2pBd+ASSxd+cmjn
 VyhNP9IqXs7QbF1Fo8Q==
X-Proofpoint-ORIG-GUID: ter-ayJXagmeMlvKtI3cXKzp801J4V_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> and conflicts with SD card operation.
> 
> Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> with SD cards. Simultaneously, add the property explicitly to the
> qcs8300-ride and monaco-monza-som board device tree, as this board uses
> the controller in eMMC mode.
> 
> This ensures the SoC definition remains generic while enabling features
> correctly at the board level.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
