Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0872E7378
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787061046; cv=none; b=uMAl2LwxtUGgcO30eZvpbS5e+C+ifnKqUUJHT0/eVAStaRzbOUqG0K5UuqYA8X1ao215fI2p73wdeFNjI2Jt5/va02NktKnhCahoe6OOrquxiwLynw6vXhefkf/T9HLfzO6gqnTIrcDww+mv1+2Sr7xBJhG3HWPuAEU/tUXKMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787061046; c=relaxed/simple;
	bh=bv1cQPvE1usaFuMV4D7AavM2f1Pk7YP7oR6rPVX74m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/yk+JZD0FOmb1/T+G2dLJOrvc8EgxY9d/RSp0GFENKYEpxEA41m3M714jgS9PdDp24lnmVoY/OeDX1lBGWJ7f/X5svGHA+/VgvRZEdw1U6i+ESn7h2+YpyRIar09sptEnuONtc9GHML9imsRVaHARgyq4pg1SKvwyXy4Mcnqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4xDDa7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghigkh6t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4xDDa7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghigkh6t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQQa8941897
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hs28qDnlng8Yw5nmsuLf9RrGXLMnYQV961lVUHepMEM=; b=N4xDDa7jyOG6JjGy
	u6YPp7QzuXu+YEL94zxhSG/Vikwl0JkqRlBDBzPwHhVR4Ibujzyz/X0jVKQZlE25
	+QgxdaVfJA3kGP7cV8bqnMHVvuD4Qm6zTBiJjs4hETm2Fj4+TWsY1dGg8S/IpTvM
	lr025jCcV2FEEmTkCieSQFO/SIkrwnT4BFMNXSIWg+2ZEawkKEvDKDdto9K66elK
	WTqdFQJIN8iB4CPoN3tACsVfa1GncpHIsNPGRviz0qhDW6kSobJk2+1HZZV1/9Dz
	Qcd2gQwNidEcerq6XJsGxUuyLgC//JUNCYRbCfMffhsLBxC2nFh0KrAppStBkkAJ
	UVxiLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4qxj068b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:50:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so119996585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787061043; x=1787665843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs28qDnlng8Yw5nmsuLf9RrGXLMnYQV961lVUHepMEM=;
        b=ghigkh6t8tyYdORAuKXfPguKRw4sqJn8GFPmRM/sB+j79G5DwTzyNTH6jA4y6fbKdW
         u+V+Vby1Mg9KCcCaCLzTgIm+og5+SKisXSK9SmYb5xsN3Tcxf1KfjauISHNEhb1PGuaK
         ybKkkrg54e+SsHf8MYCUsTaK0BTBk8AVvrwRyzQ7tndWtVCD1iVFHqyUMet3DBjuL8k1
         a3tLA38WxLgr91mqexxlKXf/HCpUn0lEEimR6l+nGjUsVCQIU+x9NQQjIlxcIGLHrwMC
         JuVOAxLcXsQdN8bmhZMJ+HEfhJ+cdQtdLX+hZ1hoMNF0QZq488gS8zB9ukyR1kgGoaGh
         dYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061043; x=1787665843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hs28qDnlng8Yw5nmsuLf9RrGXLMnYQV961lVUHepMEM=;
        b=T3n3uotJ0Oe1gxQb3Mwv7XxZ3TP3R05fpYorx5RgYGzKPUUdMFMrfSVyiMqaiPSsSd
         qIcKJ7m8AHhNSqaY249FU3eyrDkSKDMFvyYyLhqbd3ZgQSnNBPkQRYrF+Z25S2sfEl1E
         39xXtW5zTV2rnqxVtfrM9xjsuPMgKThHE2ONka37aJbGWgzoWT0vPgTKwcY8+/dVD5Yx
         jfLfbaQc4ISkuaXb282s7ZIfGNiLM3FMCtSKFjVWOX9ontQgfUsCfKbNJuFbsZSx/fM+
         yQoIVjcnc8862aVbmtLbw5sIyHlPoXeIPyW9tqNGOvroJg+J+argdWWs5RysCE4WMF46
         VKaA==
X-Gm-Message-State: AOJu0Yxr6r+xOsfEXqWjYTAZxySRoWFT6rGlJyLrgb21DXfs+PLKvfeT
	fOMr89O14cd9gn2KDqxKGCG9o/7lrkyDgD/ioSAxhlLAhLxXCCU/hTkeYjC4MrteqRZ1INUhv15
	w3G5tvDIIDkiCD9LBg1Z6z02LXOAuGK5E0iZwAY7HnaiHiAXsy11cR9HsZVi8qVfLWZYS
X-Gm-Gg: AR+sD12mWl+Jvkd3i7jJrAS8adA2Faa41TqM2sjV3odGY6S7VUOD/eXyvgtq5dFa2go
	kP3+I2Zld9OKdJuLc2nOyR0tcEUVf/x0ry3n+6aiAYJv2e2rCBupEc+GUuopuBo6v6XpvfTErxE
	spYautSHLDtJUJOI6T30N98UunFhJ9Fr3TyQGTVuIGRqDQM3l0wfgYttLji6093UC8Mj015FdF8
	HLSUAP57iKXb8SpeGIh6e3t1PqksGySoMjVRX8YC+v0jAOsHU1ePJcrQpSM7K0WtqZJjD28qlyE
	Hn+BuRtfR9UIO1LoIvv8zugvnSqfrLPSf0ksioUfHBh8aD1aMZQLYwJik7RLS85dbdfAQLFVGsE
	rv+vSLwJJLS4QrAdDBraXHrjH
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr246438571cf.1.1787061043440;
        Tue, 18 Aug 2026 06:50:43 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr246438191cf.1.1787061043009;
        Tue, 18 Aug 2026 06:50:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bab858sm160067766b.53.2026.08.18.06.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:50:42 -0700 (PDT)
Message-ID: <dec3c7f6-b76b-4f44-9bba-f168b859efa7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:50:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: purwa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
 <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMiBTYWx0ZWRfX2rascAWvF+Xi
 5fE6D77sfREhQ0AYu0KGGDkP9KrZDV/Z09LMH+V42bgxr11/PrKbwAE5qxa/SQ4l7fJ/FJU9wbY
 JkN1SH9+am5PWc9U3CTfbMFNOy1H2Gk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMiBTYWx0ZWRfX+i9GKeGivcUS
 nE5C1iPl8ATJtBWelLCBk+sCBIMaldZwqmANCaXuGLr2pD7N0tdynFlQt2w4E4kwwciNBy0D2xU
 u1N6R11EvE5c4TmHI/UvW/7IV/7bcSbRaG3wtTE87J4+Kym5YEKMfnnnk2FGvljdQ8fuVRCDm2k
 O2hJods3HmnRpK/12rB5xHyFkoIgkavHl1p2xbOXnuWuPtonkwHTKi1heu2kIPIbgHboYJueDoo
 KRYqMzQJcio4Nl2ADyYa2MgUaC+4O/Q/OgXOVmwW0H1ybVA4KOqVkQF2dIxBcd4CfL+r+bN38iY
 QtfRzlFxCR9RXNEkRoMdU4eUIKeqIFBdAVjZvNyF6LH5X7NCahklXKEzFSgZ5FdacmL/EapEdIi
 1Eapg5yPt7Aycdu7JcDKr+WM9aJR2P51VOVK6TF5Pypr86cYavVL4Qq73MPxguHr4Bv7KMvDDL5
 9Tf3bqEN9AAApJXscmw==
X-Proofpoint-ORIG-GUID: N7Usaaq6PcJ9Aae5XI9amSaEGLKhIp0V
X-Proofpoint-GUID: N7Usaaq6PcJ9Aae5XI9amSaEGLKhIp0V
X-Authority-Analysis: v=2.4 cv=bvB8wkai c=1 sm=1 tr=0 ts=6a846334 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=k_qKMVA7-xR1wUiAkAcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180102

On 8/4/26 2:32 PM, Wei Deng wrote:
> The Purwa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
> connectivity cards exposing Wi-Fi over PCIe and Bluetooth over UART.
> Purwa inherits hamoa.dtsi via purwa.dtsi and therefore reuses the PCIe
> root port compatible and the uart14_ep / pcie4_port0_ep endpoint stub
> labels added there.
> 
> Describe the connector node with:
> - port@0: PCIe for Wi-Fi, linked to pcie4_port0
> - port@3: UART for Bluetooth, linked to uart14
> 
> This allows the pwrseq-pcie-m2 driver to manage card power and
> dynamically create the UART serdev for UART BT variants of the M.2
> card.
> 
> Remove the chip-specific wcn7850-pmu node, the static bluetooth
> serdev under uart14, and the wifi@0 PCI child node, as the M.2
> connector approach replaces WCN7850-specific power sequencing with
> a chip-agnostic model.
> 
> Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
> fixed regulators whose only consumers were the wcn7850-pmu node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
