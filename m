Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483174;
	b=oFypi/T2Oep7nnvmNL/9KzdO5Ee3Ka4LTdCDNUMbJRA2hoXxGXFmr03S6m2DPy/dQB5s
	 LCuY6qZwJlR1jnfc8lWtGjl+LGxnuxzoQO/oLNLr7B+n+t8g2kh1M5I4/rHUbGqPyUtlj
	 1Nxg4pDxQhdQOSJXX1E4huVLS/13LnSoLOKju+CrdNySGcS1NQXt8PwN8b/CYduLYFead
	 pf+RVvUNy/ZRrtE/J3GeaSlzbQfs2KM3olSA+x/Fy7XU6OrtjEsZt2ZypZ8vigzvhdczh
	 FvkFhD9JFE4+tn6kS09xXAcMhdyHz88/bYTvSaeHc0TXfjehs6/hgydxme4G6xv3dfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=;
	b=22vfSe/7ExaQP/BX/m52ljhvl4hiay7j7T6ynCrsteYMUO6wT49sa+RmbrUihz0IW0mZ
	 Ms4OcvMVatculWjp973AuOs7tdhQ3TBszIfKhSCtK9gf5gTPzuuJEArdwpQyuaMQPDSbl
	 d2yyeQzn15QrzbQRmVjQwptq2lVFt3wosXewk7ReXLckayQzeYKLhfBzsHFTSGbjd9+f9
	 1o9kHX7tT9zD/cJxN90uzdujP48E3VjxpjSzRHM1U67aoGkaJH9xmYOLXOuHs2VBTMzdL
	 N//rTzZcc5vI4sZkP9Pc9VUNLbNwMDIR+OYu96bsgkh2xmCDMNMZFRXJoSK0/j1Ax0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATwqUrpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNSdhDwl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79F606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E79F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATwqUrpT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNSdhDwl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tDPb620133
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=; b=ATwqUrpTa3/ynK22
	sKuyEDO+O4eBnz2lI0YKUUEuQ35h61YLFHBrLxNMgquQCp8iLgAPXUdPOmqXNTZO
	60sfiNliEuYZWkqOAE5vgqK6EYx1T+Lbp/Obbc0gW0GspcUhlHiGXI8/dDyJ81jw
	w/kFyx7e6B16k5vFFusehoDp2VFjKeyivUKf4A+KWolO+tduNREiuVSaMnZxQ5C0
	h2yqZTamzWKPP0/7cM/mqjqDZW4JacVDyS8rUSmb6fXVHTIL+Z+QAxqK06gu1VhJ
	NSYxKissE0mO5SKqenqcAi7pOH+D2o9CpY8aA0xoCBTSNd5AzEZb750EwKEAcOD5
	fIhF9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nserh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:59:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so60965385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483172; x=1793087972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=;
        b=RNSdhDwlU2DRG7b8kaTa+vAs4R2n1qduXpZpnTlZtqKIs+ZfpO3Jv+mxN9p4RZrPq/
         Rq7toT5z2LdWxASa/QT2Wn8k6FR5Rz5jGBHMC7hmCH1F2jmTFEBgNBifrh1Y1TthjIIj
         g9tydnzntlhrhTUEJgzpE00L805XEVnmOgletm8yiY1dw/HlRvD5/EtIwKaqg6bzGQs2
         /brVtpFZS4fvMHayu2COK6mYxsyMHAX2bLqhp37GdpqjFVxzHyJL/HQVrxoaEmpd5BRZ
         bOmdO4FvfI98xP3ypLka4EX3kElWrIB2q5WFY2/ydytMVU7bIxphdBPamYlREL9lq/Cx
         mGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483172; x=1793087972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=;
        b=hjwMGLcoc5NJ0dJomVfkTfYv259s7/94j7Ahex49IDadN7bd9TbnVYcB+al9V4nkE7
         BUnvQAnC+lfaH11liHnvFi2CYQT14DT5ourav6nuG1dDZC0XWBtSeQ23UbdQuT6tsbKv
         EFVgLne8opMveadGkxULa9HNOXmVT++AMYOD3SduHfHAuk/0GdHRgRUmlplF39yiARQV
         gDjRJ5Stuq5nWU5hRgRe5PFGkJ0cLWNngwbrAztsL2YcoqPXhv0KR8QqYkFMr+fwRqKn
         ntRPyloeY0LDdSH+83LCSBC+oqFFRrG6gcyRXo+IM3w3PJE0NuLFBY0aEVguabhq4PL9
         kkUA==
X-Gm-Message-State: AFq9FYK7tUi2aI/3P8IR/1GCcI5/VhQVSy70IyKlEfk1KGqzTPLoja1A
	86915ZEhQ3xQrAXWGBHO24U/sHhXzFGu9jLmKp8Yl1TpHjqFufdcVQ+bJoHuBaPMniz4gv1fryJ
	8zXAh6d7rZY+qYHrCrQL+KExtZcaQqf8ZPq2CJSm9jl4zLWw24HWAgFitlDJXXB9YWoWQ
X-Gm-Gg: AYBFou0dg74iVxO0+wQHNDCFm2+/EAknKFJmMnJojH0v6ifaajzoP9Yl5zPcO+R/EC5
	QxRGXLoQesdB5KvgbLfd0DWZXqUBpYBeUDVKHjNMqEgmTRHPVjhdGTXmdhXCSpuawaB6Xgbm53o
	vfgrMxNGeTj/SBEp0fyykgIcYXrCaayUA5eeLrRxyeqCNagWTDGZefKq2vOdDpFr5F5GGCUfzDB
	13Vnvre3PtBuZzozhwvVbY1EuRJphKxhy7jMtTbN8/LeEMPpf6VihoAmTMrnmctNue11MnIfaAe
	qH6DGcdTahMOD5EDb1QQMjKAyA1woyxve81dkjcwWD9zWvYHXTY+JlpKpI+SduVe4M8b9hG4AGH
	Hpkb77nr642Pu3i4gNUMTMg==
X-Received: by 2002:a05:622a:8d09:b0:536:662:3776 with SMTP id d75a77b69052e-536460146d1mr137837521cf.3.1792483172205;
        Tue, 20 Oct 2026 00:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:536:662:3776 with SMTP id d75a77b69052e-536460146d1mr137837281cf.3.1792483171696;
        Tue, 20 Oct 2026 00:59:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32897fsm456214766b.2.2026.10.20.00.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:59:30 -0700 (PDT)
Message-ID: <4f586fa8-e7c1-42fd-b853-a2093e8a243b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:59:27 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Enable USB3 for Qualcomm IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Stanislaw Pal <kuncy7@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX2Nz+oNycKok9
 hZcAeaD8UAdafdYkKyJdQ/9vfrCZlIpNTNmImD86vpBj0R23bwrcbukSQIAipdzlKs9i/HkYcc9
 RpX6ZjlKkZ0Zzhb4yBUzD/TaWt37uK4=
X-Proofpoint-GUID: SnpxLuejVG71hK3B1gnGJnZgM-ox3-M0
X-Proofpoint-ORIG-GUID: SnpxLuejVG71hK3B1gnGJnZgM-ox3-M0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX5l40gFn6eu9H
 voG0koO9eiJEheLPPZQWxv9C9+ju3bPxbSDipcaCWjv9xbQ2wKJTnJ/Z87M0/rp97/u326mUmyP
 EpKPycWt+133Aj5/HbXczO5PFWRcW0oRpmxTlvLYQzAPU1VTyOWkG4ZEWEPHwxXTxleI8MMuqaY
 ib+WaT7XxMUy3EVJT5aJFYVixZ2i/LoWifVdjobFMJni7CsbzJiqdJajmovzZbmAfX7FH9oZpJW
 2IgeiBtLccgjh88AuLrkzIYfabBAp0Rns821czqanPCpiEk8j1LX61hIlVGgzH7pi+ktGjPaivM
 wOgQGp1D9S9ZhDlgZYLVrlNTAHCWYcI4nuRPx4ZhGEnPQTkHVk62bfPRgTWeEUHY71JCMVNbvZM
 a9mePL0Fc1V53HgQNe8Q/1ppEX63vl54LbYdEB06zQCjBRr3DjCokRIpBelyuElMyQ20vJ99em1
 eKyciCFR1Jwb0tiql5g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad71f64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=C43bMXcMikSIT81_BHoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 9/8/26 11:40 AM, George Moussalem via B4 Relay wrote:
> Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> Either one of the interface can use it via the mux selection present in
> the TCSR register. Current patch series adds the support for UNIPHY with
> DWC3 USB.
> 
> The series is now split into 3 parts:
> 1. Flatten USB Controller Nodes on IPQ SoCs
>    link: https://lore.kernel.org/r/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com
> 2. Enable USB3 for Qualcomm IPQ5018 (this patch series)
> 3. Enable USB3 for Qualcomm IPQ5332 (to be submitted)
> 
> ---
> Changes in v4:

[...]

> - It's worth noting that I left the logic to register 1 phy in this
>   patch unchanged despite Konard's suggestion to register both
>   (PCIe and USB3) to avoid changing the existing binding for the
>   existing PCIe phy instances in ipq5018/ipq5332. Although the silicon
>   is capable of supporting both PCIe and USB3, the instances in scope
>   are wired for single mode only. The next patch set will register both
>   PCIe and USB3 PHYs for the combo PHY instance in IPQ5332 and use
>   #phy-cells to select the right PHY in the respective PCIe and USB3
>   controller nodes.

We need a bindings change either way, so might as well do it
"right"!

Konrad
