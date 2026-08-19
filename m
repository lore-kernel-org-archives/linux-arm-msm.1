Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A291147A88C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158118; cv=none; b=XDQ6E4/Ae8g9jER6WIv9cR7DPEB1swnNIFxEeF3zNJs4XoItwi09QmiByyNAv6pb0o1MX3856YzFzIceqCuEZDN4swvsLvN3It5GSeNYN2iW3b6CoNW/9WMZ1wOZUSNv4tfl0XWJC6IwlVgDeYMCS7cgBInypyaIS2t7oRyuUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158118; c=relaxed/simple;
	bh=K75iUPw1fuEkFxQ39hGr1Au+Fh5fQCRjYMdXKscWq7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHh5E+ahtnnDolQWWO7mWU8HCziJ9sycTPDOuxhmBkcaFTThKnB0+2dWv+JwrY+D1fVe+TQVTvuMMwwiZH1BrsSrB9CmW519BlJVPBvZ0CWesPbE4683Vov8OVMyEufbK0raIAHOP8Xer+SRY9c0zqWPuzFGBDyvR3oIur3wyRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNaO6Vdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRD19fTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNaO6Vdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRD19fTt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1CKq3869733
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=; b=FNaO6VdxXOO2aEJJ
	/NP805PMBlB3e9ETJcQP4u5suwVt75jsd1eOE3IQAfy0AW5uBCKJnY8J78JpznHx
	tQCXhjCCfXnXBzPrru6bpbhCbLpLVU5VNKsXsPjqaJ5Q5sjd++IOlDasxifxXUyB
	N86G8/CYOwsWjO29CFjuonW9SAKvKRaDiMr4w0Gy2t8t3AVx5tq5CCQEhs7oDj4P
	+xu7eE5fEpvHhlJ4pppg+4Oe0byiZ3MDq+x3b7PHQOPxneDxWh3W2ihQg0F3Peff
	CZRg2Y0l1qS6Q1WlhUxlKcVGRXD51W5Z25hB0X9yJ2r0F1fN6i3JxBKcxSg41oq2
	87YJuA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervgkym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738be9df36fso49879137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158116; x=1787762916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=;
        b=gRD19fTt4PR7lwcVBFhyVNnQWyIV5rGDe3y/dQkMJLMn9vSVw74Z15Z8PlwhN7IHxi
         tK4GGXRrAwiKUg+ju8TIjMgav0Hzkkzsrl/zYnXKX5OrBXjl2UVGj7doyZbuVn5H/qcP
         P7C3bI+BThSRXZx00vfUayCl2bpDhuc1h6R4MPQbNcBbd5uFTIgGyQpkmbnzwHF1Ga1F
         FsLjSaA+qPKYcRdcWb+y90O6m0aLglJNDEnuM3OUzWv6G1wJdOVoa1vet8r3P7DqkYGI
         zGQEoxlkS3z/c4RL29QcdcIRj6CgKbEBUAEc1h/qNGgQfH5d7zA9xagwmritHxc2hLMI
         eb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158116; x=1787762916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=;
        b=dXsu9yR4UsiAZkzXZNcbGCf2NPIlGYpZVepgeLjNBzVrIOLoLUcLDGlQ0rQcKWGYa7
         aaiDEQyryZsbeA2sA7JJK/Z8G/mROYOxKa0T+KobJuS/rR4CInBGNvUAsdghtTow0gCG
         eypFMtd51E2ehiZbDYKrQeU5Bf2XmRugFklh2lQyb75NLwiO4vPkCk85qXaWdsbDRciy
         0Zlus4Osrfipt/tFdF4ZkgFunqNSqDdbMN+yyrdhiQNlAD+8myi3ezX5EQbwsXGVSuA8
         hpfREW2fdAyFWsJi+dmDvYdUzT2kNPyEZGZJsapfYtFd306M4hWQUWrEdCQGF1chjARR
         +9PQ==
X-Gm-Message-State: AOJu0YwRVB9miwpj8bUUKUyD9htBNkwLWkLq1GtijNJ1Gsxbzw3ErKGd
	0zTzp+ND2HXsxta6ORrJmtG7QDc4YnTQ+cEVSFugPwywO6kUdXJz98V+k6a2Am53vwhZ0hhn7ue
	zXcO6WUE26eoCYc0lHbNCieLQtCrSokswxGquLo6iUooItZ3Pc0zAyd/oAC8yLFzuTLZw
X-Gm-Gg: AR+sD11LRWeC7fueWQqbWqyhrAIOHkTU5tESY29Zz9IEqQpcsc9YeeKmJen2tkSoBC8
	YdeAUgASrbFAKe8ge2Q1eHW6Zch4nicLY2/IrWBfMGF61ezG5PbS0bpnxDwxNCC88z37YuLVMQu
	k/pyIoAhM+ivrJ9czC4HnJtZ5+1uynZebXTBXfZ5Ye0Np2Eq2AFBesYd6jqWFjlkRwgrsiC8Jfg
	HWumRQDZ+PD2hMfiGSYkbYi9zCHFHZ5Y/3txHbkaAo8ZeG16280nP81Wyw5Cro2U/L/i0w8WI6X
	eDXJI6DweoB1Eg5TTFXODVzSOE9JEaWBXEpMQVgRZ2cBnnw7mXM/jJU8b21Md3WtkrOup58T3E0
	Eue6pxYdfZgwQJxj2m1CLLPH/
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591245137.0.1787158115578;
        Wed, 19 Aug 2026 09:48:35 -0700 (PDT)
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591229137.0.1787158115180;
        Wed, 19 Aug 2026 09:48:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:33 -0700 (PDT)
Message-ID: <66b60bc1-6fe1-45fc-a659-8bb68d70fc46@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yuo7uae_lIUrv5A41Ni3nPIUSlMmAIfd
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a85de64 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXybIqJYxMIWCs
 TfvAQPyQstW2WEdexqP3CqWkpseROc1SqSL0EWN2d/b1+/l0JGeyhiMpP5ZCvSP50XqwVyMWHHH
 nO8fD3uJCwtdKQw3MLrdL3cQprq/RT8ssyG9HW1bbpKX2eGozbQ9B9W5JKP9s09UHQS8Y83eO6r
 ZOnWWWuYoLC0krGxukiK38A1ijUtjOMU5aWtURu60usST15yNvBV9ChIZzZnLgMddY7xd4kq0dd
 3e8ZNdBqm24vU2AAdL5RISUwch5mx7sRrzHdvaoPSTJ9AJE2hXesemkcrisFGJxb9laYgX7vSL+
 1KJwzsdPOE8ftSeeG1mbXouBeUxiMwWV87H5v0xdBgjFE7oXwixL6bpyYnVaUlwAr4/dfHGExb0
 9IWWpaMfRp89sKYz5YvMgzy8gQkGiJuANIhAmZro7BDX2UgVRAoc9XeSTb8O20trRoQkTjajDIl
 a2Hc6hQlCdS3Pf4DW1A==
X-Proofpoint-ORIG-GUID: Yuo7uae_lIUrv5A41Ni3nPIUSlMmAIfd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX/mNkA2fDGBcI
 gS7KkBZx3V3Rib4+wb4TV7nL3kmUoKHXwUZUgYfEDGF/PPIO7AcuHLEHBIDegSeb6PGIo6H2qz6
 XcpwnJCRtRt22S5rCfAyG0MPOZ2k5OE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
