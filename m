Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D53DCDBC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735932; cv=none; b=ayIkdE+dDLJzEcCEbSrazeG/3FujvEUb4pnXff9jBqtFYxu4iJpppdNdjOSfSaK9NVlWT4a1utSVSSlw+lh+/Aew8UsUL7v77Q/oLwQAJSh9XN7ASDb4IxeToOwz1/NexBMDECNG8KPFKaVjuGcFc+IpiNFo8S045cuxDlC0cEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735932; c=relaxed/simple;
	bh=BBmzcHRttvERxItwEBK80w5VIKJ6lVAYxb1TAHNxcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCWxVvAc/vRiEwfDPz/R9w6k3N02dc3F/IPERu3eDGq0tdDzisrsQAK+o6Mj3jdsLRziQ4qQT+eXQEP1ZuHHmfWATjLyt0Iau6qWPdUYS/rQ30NJXDaCtcEAtNG/mTJegPqfSJZYKWPjyUWue2zL0dMy0xaaStWM1g8w2ayHGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGqBgQBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTVv8DEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGqBgQBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTVv8DEo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CgSc500955
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=; b=NGqBgQByz78n3dAq
	Qd3HNPEXJ0RKszpJeYm4NgejTKfSKJzWMdKu/a8ZUg7kxepi0oCw8uLukiJESjCa
	ifUySoNQ3Y4CnPibkWTK0KBtbAgkZJnC6vJppddDLOV7PLTBkkkmFZQ55soRHayn
	YojJWGYTSwxDki5rf/LllyMlS+KR7dFBqXYhcyYQ8EeG/MuOagvJ/hpgxFUhFro5
	ymIRsK2E5haxBr8bQ01/QrPnRhZAAyEajCzaXb2WFB/YYXY+brZPmRcJvp9oG9ti
	Yg3Se2GUSx/GX9vav5S8ZUupXtkqIrW2fp/OEoBPBN54/phZlHYxYSj97p2T065L
	20TOYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mtx2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:18:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so16775985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735923; x=1788340723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=;
        b=VTVv8DEo6bFBjPqrLagtIOLoCZViT44hrG6/5z7d9PteWER9iPGYq+V52HduF5mWVX
         t/XadYzik60tRmsNYKT9tQ+prvP/63eYMg1W+N21N6W0kyXIPMJduwEvWsOsZCzEuCV1
         QW/QCNtTdkMHHGkZww2wORRIviL5hDSQvKVG5lnEp3q7rCRfmxod+hW033+x2CHFeTLo
         OPhXHRUvO+akuncn5eYFGEhYlmT3zV/Dn2l/ZpvD0x/gBoqcgglOGWNT9aSR7xGQW8Mb
         LylMNjZJ4NDgPbyZ5/yEwiry0SbB9OAS6H1158vuxm2tS/hpxxZPdobM8z833Nmo2mEO
         1OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735923; x=1788340723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=;
        b=W1kIN47Z1i4Vb8J4aSMHnkounhvwgqxq3h7NjUt2DJuU33Wt7LMaBSa3cFKXY3ZSKW
         LfcAd2ryCeKqG2hYkfCG4up1aawYOqXkmYfSR4i7Rec6s6SxxN2ysrLxzjWNzIe3B7Xo
         OhyLrvcOta97KupFHbswRGt5P5+ZC+a8E3mDGKkUx6I1SZfVyMWAhAr875cPgbINfhbu
         vHO7X04wGixtp6G/hhzacJ+4u0dCtBCtqxWW6X/m4QQF30tbesU/fRsfngBRsPEbDD5S
         9H0rPCNZHveBKcJUmLZQ7RiRHJcDki6zZUj/Wo4ifYW/PWmA2iysMWiNcim17vm184R4
         bIiA==
X-Gm-Message-State: AFuF++nZoyu6HjbWzX4lCyimQ0g8jk8Ri+ljJ/dO3lEUy8f8RHzg2o5+
	ewZekw/zjez9zDSt+79f8T8N6+NFq4fHlHWrl3J70UbzAOirsvkUY34QHeN+wVHfhlCO23bzOsF
	fvJKrShOCqL35v8hwGnnNDUHLyI+GmKWE1zKS/KtayV/D1GT9BoLglohTh36F/wpQdArM
X-Gm-Gg: AR+sD10ja5NKZZ6n8UJ+pv88p5Ork5xo90L+S8KbOSc2KzCexNN3kK443MzQA59j1Qs
	gO84m8/S+kXHLd8B94KI0ZkKzLwPTYDgVJZ7N6DTMOqli+s83IjBsG2eLWQ/KtuiJWVWjcr7UrR
	DQpSDOPO+wJiSdhjyIyxQlms+pWTFtldjSx7PKiw58gigCkqPazWQ+qyFAKJnrhxH7Zw0QKt5t0
	RfD7GsDXnCy+1v9HudVenG3Jt/Iaa2v1onr/ivx9FKnr68SGBgP73yLI5ppX/n1gBimCmFwLpKa
	P1vD7srLFa2kHMJ6raIWGTPp7ivGl451fj2nzmRjUEV6A0km2ZXkMSa6dnXl6urZLrKfVyLq9bM
	ECIex3sodRS7qd7BdUItzAH8H
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10789331cf.1.1787735923554;
        Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10789141cf.1.1787735923070;
        Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b235csm300936566b.44.2026.08.26.02.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:18:42 -0700 (PDT)
Message-ID: <28002a60-9a40-42d8-9583-947194da23fb@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfXxMBFBOql6Bcn
 a+2vM6VIj0cQxPlIoR6/ajVt1DS8JHD3hYSio21Dp88GDEskXMMR8Li8Yz/iG0OzqkqCO6D3Cv+
 9/O2TjLOSZ8cP0Ig9hm1EHMW5ar4Vb4=
X-Proofpoint-ORIG-GUID: 2SWVFxd4rKrAbBVzcanegae85b-utgL9
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8eaf74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=qOnNiLhTMCbsneYrw6IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfXwZNdy2aEVuXx
 EonLMw9BC8KW+5T3MFIV4Gjl+OuiU5m+mWhwE/kYyA87x1knngNKySBAjL4cHLXew0oMOezS+Hr
 VFnM0zx8nUs7OMO2bT+5I25Gsb4jaauW95IsB8PkYiNH4KdQBQaTzVvRLAaNSuObQRFZanWrNkw
 SeV0RJwvB3I2cioiEcHH36f2lLAd6BsNpMJOzsnS2UjNnJsblgwBlPrdZka2oxVyVkBI6QpNO7F
 wpc/B1l7s7ngD8n3Vq0fjSkg/EtDhRrPyiDc24MIw5eXsjf9P0jO/3Onh85cTeFiy/dsVGJAcvW
 wvgAcdyxvwGkhfkRMWdf+0SZaY2XRC3SIcZYI1fL+LjyDwKK4VUuj7C/ZmYh/2EdvgJOrFam0cK
 U7PigfnTPh1WB39ENA/iBC6u7p0K+xVl87Xa47S4DwTpY4k2GyZxUnbSzjq3P/KgY6WCtZ5kXPa
 yOtos4mgP7I8YRU+DfA==
X-Proofpoint-GUID: 2SWVFxd4rKrAbBVzcanegae85b-utgL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260076

On 8/25/26 12:42 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
> 
> The clock rate is used by dwc3 core to derive the reference clock period
> and frame length adjusment. This is needed when the reference clock
> deviates from the hardware default (typically 19.2MHz). Above mentioned
> SoCs use different rates and, as such, the core initializes with the
> wrong values which leads to non-functional USB operation.
> 
> Read the "qcom,select-utmi-as-ref-clk" property to determine if the UTMI
> clock should be used as the reference clock. If so, set it as the
> reference clock in the dwc3_probe_data structure.
> The dwc3 core driver will then use this clock to derive the clock rate.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

There's a shorter patch in flight:

https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Konrad
