Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23734D382
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422088; cv=none; b=T68YBZW+who70Pa5PJbwZU4yrefcFSBe9YW8XOBiyrviNdxk8FNvCYpp7/m2BcvRhq/ZF9q17YQWfHwlqiAgivh3EExLCFJsEboU5HjJGvbBPccCGHkCrYtLvYDJ/MnMkALzpzT7Lke6fKb7w5rrRyTymzqSFE1ajL9Jt76xrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422088; c=relaxed/simple;
	bh=iB18IptzooZUR/n3KqRc65pMlvfNH60ITGcEGbAT4So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldfOupQTT++M8RR/iuozkAxznUGMGxVIWr6eSGvn73ivwMqG5lyc2PCPNbE6C7QXTzU/FxgSbnvF0EIWcfSl3xSGc7ZkWUJnroxYFM3tkGBt0nwagX4fgfNHIXerNXRubyZeuG/wdnnawqQ4s/DsCGChzk1EIVDAU7RabqyqCes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAskscrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWvylMp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAskscrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWvylMp5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lfOa4023726
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=; b=RAskscrQsCQcVvY4
	dm9EQJRTocP2QJ1QuFuAVLvf35m2BJoNnRJJ4ntBNCxWxMMrfbJ2pLxeZnKO1pk3
	v8BIH8PoUh6QyAnHlusBCCSRxQhNoSoSkdtxcRSv+Q+uQf2ZmRRhqms15LYn19eO
	B8lH+jpaAnXSEjsy1EO2aSI1MJ1x0YdzMC/n70OFjiEj+Yi+PVNZilQU+PhA/9UZ
	EkKxXIfsqtVZTLTbrpMa+FgzgElM05Q7S17GBKMapUPm79fZ3uMhh6QQ+eT3B3Sr
	H9b3LHmj1nZT37fADALhLB2Gx6QgfNIDtGkZaIVIXYUtsYLdg3xlQW5Y9V0BlUfX
	0O3zlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc31a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:54:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so50940685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422085; x=1789026885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=cWvylMp5dyUMxON74wNzbuKjwqbE6ROf+8C/ef3RtxZB7B8nZn4KxcvkR7PuvrTqmo
         o07dbb/ccVB+xrgQB/HF/KKSKrB4F27Q/uDdakUpQWFpBb5+aP/yretML5pcvMcSq9dE
         D3PtVK6Rd/1/F4WwUagyBgYde4TzMBhj2KIiGE9QfumWHwTUx19jS+wahuxQwyP2qgQU
         /+cpxhKHy0z3fzBEyO/ZLbC0wsQJDeD0VHgpHl+vJNqZUfsToOVpQ5idzhtsMPsJr7Wb
         y3dTFtIg3XWLpQGpx3PMiqmE3AHrpynb/ahm4VfCq8H0cPPLZTp2fsP7a4YxEOM57K5l
         fiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422085; x=1789026885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=cj057YvXddZiNMZcIEKTJm7CVFZ+vtQTa0n3+SNMnOb2qlojn3APj6f2b4gvLtFS4v
         jUtSaTciMmGBtqqMHDXU7Grj5zg811sTRSK3PiD8sLDjpowlwgQDIMSv0aMzmTU4OwSp
         3VDgVT94u3hHI7+hlbAbM2xVaO4XRJ9cShLRRXrqSUUWo6c/nOqDMJsTDJ8Jv5SBEob+
         GcmaZbKFC+UhsTT9ReVjYkTc/LmdTfXi6othEUfx5KYjztNcIqbOrUneW3KTy8p6CBM/
         isLRAYAo9qkKI0725EsYW37rPdCy6JK/CU/h1bmoCbwtXUoSVu9AdOdLDTG2QpEva6s4
         ECCg==
X-Gm-Message-State: AFuF++mxHlyOpYkFyZrVe9EFX9vxSJv4ZXNtDDNCYIZha+pinN9R3ggl
	+kJPL9TnoEKGkLydsTN0EqgT5UtrJXLNTV/YMH/Si3r6X0mdKdRw0MlC82I6ymLziOPa3IzPWVH
	yAa/FmY2zTAU71V8UDCofsNnQHeStQDYexuMJqDS1Iw06X2Azlo2/RDT/I5XqizXWbFnY
X-Gm-Gg: AYBFou1JzzPU0UJft7T5qJqeqL9klPfPtBwo/6Gr04ZeuJUsWekrjc86aHYgvCkbq/c
	a4FwWTHUacfFt9dTQQWkEEybeTNh96Xms1hk72Rf43boYgPDsRwhjnQulAHMn3y3tQoaYgTgRtL
	uuZZ8cqOKBaLnnqgDIq9uFBkTd2fON6q+omEf0FlQO4iHXvePoVkkoiey2C5VfCtY0ihBgegakI
	vEQ21Dm/OqYPXGwuzv1acS7yUWdlrLBKBP2Kc5CMBCfllJEHEy4eSckTr+HERZJxED96dulEx8O
	km9b2vHRh4F/hu5rwtaYcwllJrHVgSzE8UahbCt9BXAo7rppgqTH69JspmNCnZ+th6bkeIx17BZ
	1D4rcj4dpDQA5/T2skz1NoQ==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723278585a.6.1788422085407;
        Thu, 03 Sep 2026 00:54:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723257285a.6.1788422080144;
        Thu, 03 Sep 2026 00:54:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm60942866b.17.2026.09.03.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:54:39 -0700 (PDT)
Message-ID: <fe6dfaf1-521b-4818-890c-1bb1c413ee44@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] Enable USB3 for Qualcomm IPQ5018
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: faCxjX2nznWRqqIBGvYO2lxpu1xjtu0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX+Hqjm7Z3YjCB
 5ptlKk+IohFC+hpV/IGUHpWCyWbyvekMK1IWoz95/bQ76QUv7ochbfTRqC5AH8Gab+ADGM8p/QC
 JisvNebPS58EUHrLjW66rcsXQ6Ue3ZgyoZk96RJq5vha/Q37NQJvJ24KmcUG1G//POFg7A+j7R6
 JSsr44POYwXwckTA8lqG6Wo6hrLzWO60E1mswFJ/MNoxJ1DpOHPc62bkvWVdyrre5/jtx+g1w1j
 IxKvqBm+BISJ5irmY6PcyxhkffUicPpDUTW0ILaZ8xT9q4v7mFEwbKQ1Pl3N1HrZ2UnrF9E319j
 vVaOKsBBr0VwjExA0N2KSly9G49glup6H0aLkf/T2XIOapXqbJupLUyJwLXnCBU3JTusc92+Wel
 RgkQ9xSUK5Gh2bYQdi95tmaWkYuEEoo6PcFaV6RgHszqChvBLDN1idYmmM/ypsN3umoue67ON06
 zXENqiNQgeoz+dGm/SQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXx4sxSB+RZa1A
 3rQbZ+hEuswuEUj3kaC80oDe+DlmkEhStn0LLavSIFT4f3XKWeD1wYYz2Y0LH5XepCGMUAIRTcP
 ujNANP+gAg183HXwCSziYGQ+HpyKXyc=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9927c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cwIZyh-EchK-Zb-g6cYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: faCxjX2nznWRqqIBGvYO2lxpu1xjtu0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> Either one of the interface can use it via the mux selection present in
> the TCSR register. Current patch series adds the support for UNIPHY with
> DWC3 USB.

I tried to get to the bottom of it:

0x5d_000 -> usb3+pcie (muxable?)
0x7e_000 -> usb3+pcie (not muxable?) / for PCIe1
0x86_000 -> pciex2 / for PCIe0

_however_ there are only 2 PCIe hosts and 1 USB host.. 

Unfortunately the router SoC docs are very limited for me.. maybe
+Kathiravan can help.. 

Konrad
