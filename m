Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972666;
	b=NrmYqG6/PepDiv4RtMTasgztr9oA+lukFZuekCe9TUjc5L1zmLDx1XnSC2S9aE+wpxEg
	 ILHHtQ65lRP2A+H2wse+n7C4kwkl/ZVe889N6sI07vKoCkq6/B51QcNliz0liZyCjIOU/
	 eufY1ba7W8xCFRB9fm40LwaIX9pjJP41xJd4ltxF3wQkKuOGk+NXFqDwdvtTe8jY6TzLO
	 4e+egeLcuFxGgH9fyuYdBAeVrMMgLY+LhzV5SAGvi52c6YokBl9uqL6MYYLOFwShw4bJT
	 XLbxNMw45DEjW1hU/N0zZvfBgAtjGGwjny6DIn2Cu6qjOONpcry3wVnQcvH7SyFEvgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
	b=EoH/E5sKkI/zPSZ6ycC8oCGIhGmMPpVpFlrT9vYpjcUbcQ6SHaUfQUdS1gZpoDPMbtrT
	 iK3r/mLLOGjzUhHLHJF5ZygoRXpnRDwzaKk5nsjLUye3R6XElfFWP7PYN9rbfRl7ftt8b
	 C+HYPejgyxCYkvMakel/3BDHbly2ZcpSJcEG50k03XAmF6E/kss+JMMKV5uY9b1eH6TPd
	 GQwP7YLWk11EbYecP96ZF2C82uKcWJohJ1jWgguZa6B0EBFyFjt8zeuV4Ys2RUaHboyQR
	 q/WQMqcD1MRNRDp9nGfP5MHI8u26BAKyspWcPod/Xt9OSfQChoYet4n/P9ED6RROpig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvsUyW2m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpV9QlD8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638E606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7638E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvsUyW2m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpV9QlD8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxHw2453598
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=; b=VvsUyW2mxCoem6Qz
	k52PYDF93mU2kFdVyPVt1c46WNx3vkyQPzJXLm6a+sOGs0D/nCe5RghCLYt4FoOP
	+iq29gOgHgSa7zsVGaLbmUEUCOLJfwL63S51QuTpO078sL+0L27+EliRUVhGXG51
	7zJHalL2eUH9FTib/3fEFpZmrM+LHG2cTOjxd5I/iKXIvtX73gy8rfRSougUgbc9
	BgoW8+coGFHqvj6HIw/lPh4eTL+ihAAPd7ervl3trCRFRd/n1H/qb2lhjqX3uRX9
	MjOVbCgoUY/vKZEdvjkyXlGFluNj84eYJ0uJYa5gNeE/NxUcfRQr2umUHfjfi9PS
	s79t7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv98yh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:31:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf8ea208bso4606155ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 19:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972663; x=1795577463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
        b=KpV9QlD8kNJTkzacr6vCHk7+67iQ0xgsW0dXYWJwpL51reCUcI68/MZVhItl3s3EQo
         CrOSud/Dnxxt2gGgalQUStFZu8YK/5vpNBJ22ohAnJoTyi6X8/mvAzthrmgHqLm/3urm
         TZyhjxoe3dn5piQsUtSESDCezaNmlgvfUdEeowUlmaLSY15FKl4ia4vkt2wh+1gP4O3X
         E+yrVx3w1XMi3yxEkz9Lr1w6f7KI5UZFyYmT00PZDQG6beZqoR2kJzgUVkbxvNAyoZ3y
         r7kCqJ4n6ENkoXE7Lxe1k1isoCRGWO+G0kFkp1PVr7VyYuak22fUzUEo7M7MS0gfDNXj
         A6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972663; x=1795577463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
        b=TRnXws4dtXRHo01ga0/ePVCn/hLwO2dODdIVI9MeaPppKfOi/+AxkgAXGEaihcAShZ
         eRI3zIPpTcPYXWdrW9Ci88rBp1inCWUzzmRK0wzJyGU/cpyFhDeS3elIG5eLlaxGkKNH
         HHnhrGJ76rXEGNwPI+YPGnJs/c0sbokaJ5iPFca7E6JM7iw96lu5D7LQBgrapX6YfYYU
         NTdIprPYfYULaqDapP24YsdPnRdbamlsOLqKZnI8coJQQYBJxe5GeG1OleaAPvjoGQMX
         ffqSp8iJmrndsbgBK3y/3Ay2Ia6MRhf26hK2fGKI4Q+qZDqqZx+UkcygT2Xb7E77dU/W
         RiTQ==
X-Forwarded-Encrypted: i=1; AL+hErGMGXzlhDMqMETcKFWopCrhrnhI107626AMP09SdZD4nG/8dJrteDNJr2i/ztxudQlmLIUn6ZQ8Pds+Dcu6@vger.kernel.org
X-Gm-Message-State: APuU4Z9RgYue0Ufx3x8+BZHmGzga8oKBgRfqE3dI/fngRV8zxxRrmgYT
	/LgT6ZZDSTgwlR0iqFxGHyKy2uwvHEs2HSJpRme4ruVjr4n6szjZJ02siwcPSETeftzu4/M1Dpb
	qFp8X0uYSP6wQlqjRqKmHqDdHpqnqxCV5ThM1++WldW0aILMYmMu2M+hSyq8mUnJzDvVO
X-Gm-Gg: AZFdTZfy8OlytIbBp9a4eeZqpKhit9Vtd2Q8iYyzTok9E9xoU1ky/9FcdL7XLCsn50P
	u/kOvy7AZXe0fYYqSTxhjsxGWIEpONuoOjakTnQit3D2KzzBgfkltgc+5/5EkOWbRZ78cQRFuOZ
	O/2pmhDQwlRKGIbiVeSMboB2HQ2VQ7x/QBSvwaSoVLSNo1UC1PvNEr1EY6j2RpNGANcg96gdVG+
	mSwV0b40QuG9UcKDhqlMXvGH6G+deRDxRbW/a1AYDg3szLX+/xwdWrfMVcq4JJzCFJB/HVEI4jV
	9H0+2WMadKSnd1nRBO69RqgS1XVICdQuOriE/+apSCw85q+a7ENiLoM4CKZ/0r8Ymmq4mop1HMe
	mAFKXY9VCn93iCJRMtvlkSHQa5bR6imH/ToxLrSqUBjAqfF04ozU/yCA+k5SY+EA6lAIo1Di0Bc
	T0uB5NmBo=
X-Received: by 2002:a17:903:1aab:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2eff751f06amr11721375ad.41.1794972663127;
        Tue, 17 Nov 2026 19:31:03 -0800 (PST)
X-Received: by 2002:a17:903:1aab:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2eff751f06amr11721145ad.41.1794972662720;
        Tue, 17 Nov 2026 19:31:02 -0800 (PST)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162d0sm5287935ad.20.2026.11.17.19.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:31:02 -0800 (PST)
Message-ID: <1844d833-caa5-4a35-a601-2da1700c0d9e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:00:56 +0530
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
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
 <20261019-monaco_ep-v2-1-852cb9f5d012@oss.qualcomm.com>
 <avWZJr2eIE9KrV77@parshuram>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <avWZJr2eIE9KrV77@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX+GUkuqN6ccLW
 Nk8Wlxh5bsbMOcUd6gNMsXgekY9+6CsowYzBnAkh04qD4PydI/vZW9zRrRz3vrS4iolhrt+N0Lq
 D47i5AK7NQHaikZHU8pWiEXeCM5kiDM=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd1bf8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UoCkNwF0umAWgb14yFsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX/H7AFLNSQvUl
 1gERE1Oj6UTNCGRdfMqRTXu+EOud9LsntMbNl6oSI3RmUN6PZ6QhOkfQ/OJK0TtEH9Nkr2unBdI
 5sgI+jl4ew1a1zhqBlaMAsNf/39d/Fcu14qcmz6Hz5v/eC7FIrazjRMov6FAzVbXGztndGZgip+
 lrlt8KLoLbuxqHyN7gMm/TAgODTeO4Keex02xw/KRXX10chMml8ZebdxJAWv23bciGTsAoTgpab
 4G2kascfHivE1Xo+RBArT7EX2AgwrMB2KB7AlG59SYUtPv6ZId35fmddfpL3XtS5oATaQmmRsNT
 Rk1nPPHhCLzlhki354Qkcpa/YEb88cGzUr3z6lSsYefOqAsmb3HthxiT6b7If4k2ilIeXd8Rd9H
 knzh/10hOOMq6o4OxjhFlJFOyp1JolhSCzxAhd89/39IYfy545e2F2UGisBP0Vrz3YJYvqXRMjz
 Ul9KDU3GHhQk47aWQww==
X-Proofpoint-ORIG-GUID: QSCctuiMBXsWOMoKQf7jxS0u1CaLmrQS
X-Proofpoint-GUID: QSCctuiMBXsWOMoKQf7jxS0u1CaLmrQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013



On 11/12/2026 4:17 PM, Vinod Koul wrote:
> On 19-10-26, 14:55, Krishna Chaitanya Chundru wrote:
>> The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
>> the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
>> compatible existed for this PHY. This was a mistake, as it left the PHY
>> undocumented as QCS8300 hardware and indistinguishable from SA8775P in
>> the binding.
>>
>> Correct this by documenting a dedicated
>> "qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
>> "qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.
> This fails to apply for me on phy/next. Please rebase
Sent V3 after rebasing it[1].

[1] [PATCH v3 0/6] PCI: qcom-ep: Add PCIe Endpoint support for Monaco -
Krishna Chaitanya Chundru
<https://lore.kernel.org/all/20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com/>

- Krishna Chaitanya.
>

