Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399B3FE36A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535549; cv=none; b=qiovvqFPvutfxFEF1JqF2gJf8mV2JbmAkzIbNQAQUKrPrbvgU/9da3g6HAzgvIK6DC2UJjdAZ/7leSiPU1P0hUIChICSsKO7LkFQolQuycfOQg7AOBk792NIU8gjTK6E3wLI2xyJZsfkme75IUHeT2E9SPCm5mn5vBxtlVHX4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535549; c=relaxed/simple;
	bh=BFt+HHVErsZcnh/Y/wIax4idNUB4yL3NbnaeoV7ZDOU=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=aZ0Yri0x2eEunZ2H37LXHp0sA6YK8LLXchrC0knASxHH4vqK1uayw3qN1VMoEPX5cGyp8uLzoJqi81d7w4BY2QmmjuzFWDeXsNDaKVRY7SOZo1X4IX2Trw/2r1XUEakxSddx1+39oQrER6EULmZ//xI2tBCRyQ2VuPlWvGlCts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bpcetjdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeG8K/Qh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bpcetjdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeG8K/Qh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KFJH642362
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=; b=BpcetjdysSKzyQ1Q
	N65NXKdsDRcU3J346n7NV392I1xmA+ZfUF/Bq5zKnyV6Y3UGWlOXAHO4oTcWexNm
	JjMzfrUU4WJzr3FXdYahPYsfLQIc6FCqXlL+ihLUQgffGqo14Q9XGQgfdjZaCslr
	fIs6KUZoTmSQTDDCOPpjLBmrfxX+a58fkgctvzChxLzAMmiLj7zVVo7hZo7alrrJ
	EzWsAxDM8mVeHsERCTIqXJE3NtQo/Q16H/HIBFGfIu7t4epHU532QApzht/njoY7
	RuIoy5MWZwRKVKwXnW3YTFZgLolF/Zh8XkJi8TlDtuQS8j5GfM16cM5MIQSD7lA6
	EGw3HA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrtrje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:45:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so4197764a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535546; x=1792140346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=MeG8K/Qhisn1kh9+jzT+bjgqfddz4SwTksc4j6Mh8SWny7UaP8eRop8FdJitOpcLbp
         fpO9yLzXsdPmrFiIMF3+SlyIqyRemRbnTfqJ2Did/FqjUTADTOO30/K4ufIQLSGmXgZh
         VD3LkgKMN2lGMI4MJYBEnZEIQ9cL31kuDtXI7TO41oUlxGPT7puwXP8l92AV/7tGqHkj
         QaoHqAdPWvruAC8Cj7ScCeMAREnLqLTh+1px7iewSxf0KAzQ0RidIILFcO3Zenfhn4tx
         2ZhiVnXVw+WFhBlDhzu/JHZ0wdai0HcSzCAc6GtIYgK2ndwgGLgg+Iifut+MPOq+Ss6m
         jKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535546; x=1792140346;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=nw2nh2QauuO5hlgHkPxMzg52+uvQu+xy8eUL/dHhFBvHCeuhm5FMRNUjQrMJ5rSsbp
         DuBZ8eIacmHlfm2KMVkPs3Csv2wgKITsynktpxUhvfCCq2D0Qrrjrt8tRRIfvBHDfsKn
         2fSk9v/IFMqCU2GroLK4HyROJJwqr8U8iJeaIPaMhVa/XYCvS6CRHMp2+vwN118QEC5/
         prg3GC99e1JKNOaopF4Biru70YdLr1hsxtwMolP5X0WwrhNkOk+6U0IrZjno8bpimh9K
         sFvfWGuSCdFMa2bPARCTXaJIMFPNXd4vALWpg5s2WmPZGaZneVwb2UyqJTnTv2SY3tCF
         706Q==
X-Forwarded-Encrypted: i=1; AKwUvByNzTFQVVWWr42Txz14/Ph23wGyWJeCOXI+70NDp88hk2A8jNufBig53viuyQ9C5BjC6Vm4c3cKIao9QizW@vger.kernel.org
X-Gm-Message-State: AFuF++lXAgeFcDPCmqzt1SMoB0PoqgoxJ2oSE/ZB+vkxbtzOJZlKeQFc
	vYL4jcsaFhcNHfrtIEg7lugKQidx/Pz0SFCTPxsiX+6XzyCck42h2LZ7uqRqlb6TVmzP87UzbsG
	jVLQ0ZAsgWx9evJkaXsQHS4qyAmLnXzxzyqk7bKnEmDIHfelSy5Xe2Un4bS8HwdmCmtKq
X-Gm-Gg: AYBFou3DclfF+3DRRaHHoTJ6xfY34Fhrkm7Xc4HXd5SmQzlmTb+XSNyCt0ev1Sf/7Y3
	kSVnSkqlT1LRzJOGnyjyukafBJZ6r2iREf9ruXeVJdS3x60Th5L0Hj4pFjKgI2/Phk19Crg8qY/
	ptlvH1Qdwi4JvBK+emHO6o4lgnTqbj3nu+kAB1bP5LeeFwAtZWbpC11lPcQMpy7j2iAvLgUpLFK
	BW+3TUiq3lz2ymYOKEAMZ5Gi0a1gGX5FQ/2stdA2RG5w7MXfhGshCm6sYEYhwS+V7PrJRQbTgKL
	UqPXR3OQUxx4p4fpkdIR5/PtwmA3Z2/uGOC+RM9PMfZEZGoou+7Lip8oYLD6wINp/SueBPiiqzS
	Lhu5xnEWCQ5iOoNJxR9ZDCuehhZ7PhZ1kY9d5SXdJW0F2HmvElXFrQUpWAmyLv7s=
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023351637.46.1791535545452;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023320637.46.1791535545012;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d492d7sm599567a12.4.2026.10.09.01.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:45:44 -0700 (PDT)
Message-ID: <78ef7040-0284-4199-8468-8d7cca7eb4c2@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:45:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v19 10/12] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
 <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
In-Reply-To: <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8a9ba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=N5TnpenYHa_lGfR9nhQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: C0CDG1Da4i1jGdFTPkDaI0vAskJRjfJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX10SzoNHp5aT0
 uXRotLyKvN3edznr1DdoX8ERbZgzqCwbq9/eKAidjZmv68JP7I+7uPEc8abSWZPtQrXuUMkhks1
 zhE++JqBsGBCl4TJ5jXLbcRSID89ySAEYfwaotT87ltCuHnRYkvSxb/Mjv+gSuZCsVDnYEafExx
 /m7AWmPl7ZyZBlZdVUn0k95zfnIre1Xe85e6Se8vt5DU3TPerZVTVkt8N5QbQU28tmq1rG3oOzt
 Jv9dPZWBo7Uzd9G9Ktjgn3Gj0mPe4fV1sKvRMpyGbjnrqnocJpdo6ALiuaDQ77WSYSvPa/0fXkK
 qtzwmqXL5TXV+8qRXIIp6LLpaCsMgJ2APF/drScu8MCywjlKIRtbAR4X3Kx/EO5sodEVSXX74aI
 U5c91FuXjJcOTIyXJFz6spciuvIUpP/EQCv8bFBs8n4Jrn60uY0z0APhpX9NIFPgSwC+yvMJR+I
 V3p+SNXGYEvMk30eFhw==
X-Proofpoint-ORIG-GUID: C0CDG1Da4i1jGdFTPkDaI0vAskJRjfJH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX79SGNFqdA4Xu
 EshthzADADepwZNo5WWg4Yo6hIfEc8Fto2/oVaTBhLn+A0DklqbkZ/q9ORRiS55CZjtR+UyOfxF
 7ETyCgDdTdcvzZZaAohZgAgEh3GeYSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090034

On 10/9/26 4:40 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 08/10/2026 08:14, Hangxiang Ma wrote:
> > +        csiphy0: phy@9523000 {
> > +            compatible = "qcom,kaanapali-csi2-phy";
> > +            reg = <0x0 0x09523000 0x0 0x2000>;
> > +
> > +            clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> > +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> > +            clock-names = "core",
> > +                      "timer",
> > +                      "ahb";
> > +
> > +            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            operating-points-v2 = <&csiphy_mxc_opp_table>;
> > +
> > +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +                    <&rpmhpd RPMHPD_MMCX>,
> > +                    <&rpmhpd RPMHPD_MXC>;
> > +            power-domain-names = "top",
> > +                         "mmcx",
> > +                         "mx";
> > +
> > +            status = "disabled";
> > +        };
> 
> These PHYs should have their ports defined.
> 
> ---
> bod
> 

Ack. Will follow the Hawi/Maili tempalte in next revision.
<https://lore.kernel.org/all/20260923-hawi-maili-camss-v1-7-cbbb42e534ef@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
