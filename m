Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F53B38A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056419; cv=none; b=Gptk/YwKDFqtOZxbpGD5BR9K8Z0SFT0GTFieyDBamHqy0Z0c4Rk+zWPzYbOUZz4bJRYakGqdWe0vLFIiJTdoJrdyK+JGu1Q2MNqJskOV35zpq+2Q5pogbxnuxfmd73DM8LuXx6Ba3ywRGzV/PgaKU6mT0pyx0q1TCenZVjl2iAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056419; c=relaxed/simple;
	bh=3vnlquusfDO3OCQI3ew07Qh+TFcndKHNQ6h/6Nu+yNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+J5IdWfObriqLMKzOxh2igW6XrH619m8YA0d8deMsoFMQSBCDnL2yFQRS424XMIjaCyuV4WDkRWTH/BuejAOrRSUrGFTRfF/DQuHK1R6b/tmxt7sjmqYaAC5A+X0MPNAMy0p/NjaVVaslh2V+xRWaD5DUSxlOnyAQFMNl2zrv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYzKq5jz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYWDwttw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYzKq5jz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYWDwttw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfHQ820111
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14IBaCEa49pzmaKpgnV8Y/NwAMvT4ZjHjKK8MDfV4F0=; b=oYzKq5jz5u6QBv0i
	x+jcqaN6NaAJkS91y9mzw3XCZAvCe5wTQcD2nTZpRQigJe/6gJqV2MvLo35YuGyj
	DEBKQrX+Dpj1tx8OxpZNHSg7vnVKP6e0AlWWYvFzGb4Fmj71YN+cAo9NeuZcCNYM
	BPyQW1F5zMP96xJ9IfJ5kRkMIsPaJ68JOlxOq3LVZ9KyXWY3b8WICVNKrZfVA9hb
	HLfzwEV61SgoIiZbQQDqalKXwHN+rE6I9vp22mTM+aKbWCUxK/daQ5Tfc8MhU9Vs
	+DMyuAAFA9FYHREvB3kEVrSBeICVjVVi/6CaehgF6qAXhCKT8FISdwr2YWcA+yS4
	dl3bDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p20fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:33:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so5798881cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056415; x=1787661215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14IBaCEa49pzmaKpgnV8Y/NwAMvT4ZjHjKK8MDfV4F0=;
        b=kYWDwttwqBiTG6wAWTNOjx9dOchcLyxGjJePlyA+cZyBODk/cCjMMjToaDNavMdv4w
         2plJg8Hfr2ufllDLBtM2MzLfTJPmOf+MuGf4iagRB7kZYt8Rh0FgFkWc1VMjDIhrZXo2
         BieA8JrnhmWC46R5TT43/WoMZ5g52EBJkNZoeK8RmS9XcexW8c72Y9vYfolRnLfyqZT5
         AjoiyPqmdYdKCtewx5syay7Ksn4rpu4vM4KaA40SNpXtT12mo32dDcLwJxBwIUvzi94Y
         NbiWx7L/GP7bADdzAlaUswCCVuV1A5PkGZiAw/i/kuR1uFUBhgWaZX9h8HMWGNXN1loC
         rtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056415; x=1787661215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14IBaCEa49pzmaKpgnV8Y/NwAMvT4ZjHjKK8MDfV4F0=;
        b=av+vZwTlbirx1cp/3u53ihLqZblv23g8NcxrwXvysAMv00g6SkQQXSHY4Pp7cE0FFw
         MgipfAl5mdnWRCWAJgo5u4El7OmmmK3p6EeT/wFO9eMlZED04AX6Nywgd0UC6eA8S4lh
         iDBG4nWjNXW06zw2lR6WRmqgvtJ10rYwg+7iYJR+4VFK5HWOjYve3wxu8lY3AmwN+vmW
         NN8niCkLuBK0oSRiEq4+ukK+TpQF6TbyuKTwuRxBQkvjT0Sl/oGFSKmrU39WDFmd/HSO
         rJuW6rSHWPGFRTaTrFPH7VGGJplWwW8UNNWn5na4XAb8VUNHXsyh9YB6fbBFh2YqJbUW
         ZFBg==
X-Gm-Message-State: AOJu0YyQ9PJPvjUp139azMynguGvSecA0u6zFoxpkG0kCAjJfXAVjZfG
	HftOetlGtAgQtBo6nynnpRvQfGdQ6ZDByiiolRDzuapQlnFZuMuWkIVABTMMpCkgZKXbfAe0Bgn
	2CL3LKY+DZ5rq1uuQS2e/O0nnGjFYyO8vdwyDfpurXYHwNlNr4H6+G+/s+nnHoz2GUNk/
X-Gm-Gg: AR+sD13ZhK1/lP56212Wb0VV/vosGZOkwz281yVyrBfRtK3244Qh9TzvfHvatohpoAq
	VWJJGk4DYjzveVL9To9H8Necmv7hlUf8llso0m06P1Mt0CshmlRiMG6ZE1YnEaWWVkc5OkHsLoD
	XZgUBZrxvOI5rZpQox3nvVN/zOcYJM1OZfJXbdZN0PUsnKnFx/AwKd3/JM8hF1wxqObALAx7sDx
	PZTQ5FBmYOdZsfKNUT5nQ3spiP0ATNaa9EfaegCjSeVq7fMkDw9MTxQnAO8g1G+kUySRxOclBtU
	vf6CApCuO9iA7JoesmA/3KL3keocGITUwDdpyiXdDYDg4SYNx38c7SDo3vWsansaZAxFxlZ+nju
	XG2oUxOZZIX7zYjdtFQ0kglDy
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr159453181cf.1.1787056414826;
        Tue, 18 Aug 2026 05:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr159452511cf.1.1787056414300;
        Tue, 18 Aug 2026 05:33:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc793bsm146675366b.57.2026.08.18.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:33:33 -0700 (PDT)
Message-ID: <7f4995f3-585d-4789-a30e-c1dbd0a05ff3@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
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
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
 <20260807-glymur_linkmode_0807-v9-6-dd1c7e236e29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-6-dd1c7e236e29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MLJSyLSnXRz_y575iUrcxotomNevZhdD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfXx2aceBYhn1lo
 DDFcArgCJxrESJrOnDbTIVVI7p+jWu+aVuVqMtrYaz3+6fOQ/2nMSpPcTsvrf2Ksx3k7T+XDzGW
 BInOK6jDXTl8f+JnexyXiYEZx7E6VtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX3JtwoiETLv6y
 x9KxmJmrwBWdMnTfwgdQ+QpCamxkn3vWAa1teL8JcrW5M4+D9+nTpLGZNZ8LucdaWaqbxRnb1Vf
 AJbcUWSS6JIoh5j4YCTwcMdBYxili8IptivHTIf3kDrwV+i8Ud8aLhDxoQljezL7O6yngKN1/iL
 TQDLQn/Nv43hao9yy+TUszuea3+a8ZMAbXicGJkVLAZBbp1dDrrZPwCuQkYV9oEqr5W8E0I8vkx
 ECwpqhWaN1kQpyQ4MZQN6EmwkoyHmgvAGCfhGIdqcOOTxz5pX7hdeRngK2+47bA30/mWQMU3vA8
 a8znpz2p9+oBeq9gF/MUetiwfLVClWYaEpSNWjZBbIE+T6LksMgjmYtedJkVlK0p5pHRZXsNKOp
 ALnwqtI7QFw6O39EnWSXT3usneSuNH1cvOMjBsGd8Hn7gta6x5OjXPyyk3+VHHsBaYm8h0iquLp
 mIG2EzSJB2lNt4ue3/Q==
X-Proofpoint-ORIG-GUID: MLJSyLSnXRz_y575iUrcxotomNevZhdD
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a84511f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=B6dnFezVkazQL_yb00wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180092

On 8/7/26 11:51 AM, Qiang Yu wrote:
> Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
> &pcie3b_phy.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
