Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190472;
	b=rrAFrMLFnpeos+VAjdmLt+34tOKezNMTiyb2xPXLsv10r5fYiSgBtrOuvYfZ9U+mRMP5
	 e5w5UM54W89a/ooxyQiowrqJeLJ2DQcR329fymNEEFRZnlVrgzap2KebvLwy4coXNAtWr
	 5r+7HB99mwAFZIZI/l8p5NvTf4t//wNlCUH7TAOM0mLfNBQIH+hrPKd8YsdzyI7MHtnRR
	 K1WLC+syRnpg4w7dLqV15h6ZD7G2EnudRFnec0zCNpQpg2LQyxA2OnEa7Ao8THxBP+2TE
	 VRLIis18fteAgou9oUcpUhR3d1usF9QZWrVOOK77PH4f1gZ/chrCKCCwF9OFzZsMOyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
	b=OqXQfLR0Mlasj7FJ0zo0pNpS17JuSQoexQXvOMUmREicYCLl74CDPBPzbVVvUXpinYCq
	 QWp9xxRxaKJHSviN5c1wpBlyo8hIXufpCUtEJq7IbV/WKwMBRiRq46Uc09t2XzBVAgpzQ
	 z7XA0Jtx2NCmbYnAPeGeAtfZA1GTKJI1yu+//aGL8IO9A75PW9yAJK2qgT8CpBixlBWe7
	 nAxnZsawvBZtrWVScOgDfyL1f7UCqOfW0VwwDFzXlFPA767DGCsZC1550CO8BlN1FbVow
	 5uc7apellUONBghC5pnggSvTIRUyTUZUbOeJ0mJWu73CxfYskUxeDeRsmN7MNlTIrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTzg8f1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xni/YqZW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90840606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90840606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTzg8f1k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xni/YqZW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAiT2082695
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=; b=nTzg8f1k4cwxhaKx
	5fu60NUzGPhHwKZW1SnkcNjFlFcn5JydUt+hiRDcvRhDGu7StCF+gzSjUBLfP2nT
	O1w8Tfb4ueSXu9PIPwHj6TuSymEjfmMZwR3acfNEiQL44XYiRTAYXMQdKC8yz++X
	ORtxSuVofP6Gp3Tda8nP/hRxrQ2HhfSkjkajIuC5SwxD9LTLaz/l30Y8+irpTGAF
	3pllMWGSTWMBXwr1cgfbu1Y+SyHq+3mp+VQS6q5zpZVP/u+Kofo8ovBMaI5I0yU8
	Z9QgZZzaifv8pUUZmS+unC49ntSZu1qins2SF21iJ5+dm2dWrK/p/xJEaC+l4S2s
	qV7E+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuy20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:27:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso12085685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190470; x=1793795270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
        b=Xni/YqZWlbkz34hpOf74UkWLJ0sry1b2YV+t0hCJsBVVasakAfKlXIfVeGb5r8509k
         P15D8QYwQAPCFW2ZSWAknXXFE+vXJq7Rh+RQ4xyZFjEkWaOCKZ1xV5uklUwIh6BFU+IZ
         iySB1GwMl6+Ri8XwPtHJnd/Vi2o+1zu8X3pjlFWT9GAjmHqHBTPQkt5x8qixmCq91c2N
         q92hQLH81D3KnfU458ntQxde7+cLekoM0lHCZ/Hxm6yGho97f06AXUbMyyY7G6mgvRCk
         tizEzf4DbrXwWlaxlY1fhEQFt8CFH+vct21u/KmJu01fs2b43r4wkTfVuaGKyDDLeiGS
         xSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190470; x=1793795270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
        b=FLm7VbESJg8k7EfmijbBHUSPtFTLTmOBT03RU2FEU6xApaTplldFEiBXfxOK7gl9jy
         kepYtVvsZJmN9oV+4qOVsyha3J8OIhoyvrzO4u0z24PnP3DnVx4zvs6IhXfOI1dTsb/j
         jtmrPWawl5x8hyrY1T0rF11gO0YvIKFPP2hkl8SgfgpJiywX4msECWeuJQFFkuq8wi0j
         bklvyURZ41iFazXs91JTAi466cEQ6ubaEf8EYEIKR3WZwIW7rO4BF5C2CxJNAVPwVXmI
         Ul/1Y3rUhWhJrQt4OZ+S0qFtuAm2tANtKwoDSgb1gOr+QRFJmtCHYHqofmiMXh1FFCZ4
         9gOQ==
X-Gm-Message-State: AFq9FYK8/ZdCByxqhZNDkO+oEoUNtOAmHTyA1AeYEd1LdN26lCTlmHut
	k5u+u+xydiqPI9afmmavcyHcWtvMAlF8Y9IRf2wML2cTfyRIgM09BN5WVG5LziAmZy7SFpgKIle
	uEeG2xrHVW/eiKmQA8fEeUz60Y1cIIcrx7Cts0Z1jQFDMErZWux9HaN08kbzCoQuMOzHf
X-Gm-Gg: AYBFou3xdXB5UGlYnXqM64dhn31H248YIGrUw3QTEpf104K2OBREraV4EWNe5pVEPSv
	73vGMTBAJ1Z7UM2+uQJLf87uBnjBMLb6C8c4hvJdQ29cj6QnzNgyglEH8XchJcNc1sTWADu+W1c
	EejEbCdaRFn6eiyso0yRqYIkHcIwUzTaG3boNqyI0LT5pEcNyZpK1U3aRMrfJ2HaFMyeCqN47tF
	3r2DFM0+T/g0e4faDV0ZZzrVVYC2bFQGeQameOBwl0Ki+zrID41ZDrnIN0uTd3KL3V4GYAERJ9b
	CSTPS5w+BCyptRs1B5NP0bzkAbi0zB7VraWRUMo5XswU+DB+FO012cVkbeCN6mcNA3qXb6fXbRE
	Yatw9eCJdP8JY+tdfhaonDnsmmleShv67LZalqTCgc7p+OeeZutL6irfu2PG7bp05Qdbb0J8=
X-Received: by 2002:a05:620a:6d4d:b0:93f:211f:7ba4 with SMTP id af79cd13be357-94408d629aamr300071085a.5.1793190469745;
        Wed, 28 Oct 2026 05:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6d4d:b0:93f:211f:7ba4 with SMTP id af79cd13be357-94408d629aamr300065285a.5.1793190469165;
        Wed, 28 Oct 2026 05:27:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350b52sm594839066b.7.2026.10.28.05.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:27:46 -0700 (PDT)
Message-ID: <b4f6fe92-6d72-4987-8b87-b66e28e4678d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:27:42 +0100
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
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
 <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX26fy/p48F9dJ
 5qsz8p5hY1LpkBC4Sfvu4lBLzRPjmVxYBmO4x5/T3HbZkY4/Me7/3AJU+/+ZwmFzODQUJW8mm3x
 2cok7hCLfKPLPaBkt0HIWFkw5AlW5iz7j5DcbaYXJekUGZiVb8lWgP8asIlZN7BU5Sy2W5SAhkC
 USUhK8v8Eq997pMIykdG/v8OoTf3mDnnDJPMP7lItcZs+5SktlLMeyV15uERGCN4F9TmZs1OMYm
 s+hvn7XqXb8b0VnlzYBduDg4v9dW6jQiztshv6KNARr1kUPWeBcUcowdNKSv5ml8GxZDfXbhk1Y
 2LvcBnwOasGcEEUTsmKqNlITd6NDI68Q6Lgbi6iwFFrIFBSRYZlNOs3r7os1Hz/ExldVnuharRD
 FMDaOiUGf2EaqoiOSy6TWoyBU0jrIISgbDDHMhpMVuNAYDxiz80wyWfpZUhXd3PvLa0czjpPaaD
 2mAEHkR6PDsbdUkM+9w==
X-Proofpoint-ORIG-GUID: Zigw7FlvG57c1JZahZCUOoIveHocBn7g
X-Proofpoint-GUID: Zigw7FlvG57c1JZahZCUOoIveHocBn7g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX60hiTIPITMFM
 ywQv4czgF/e0P8gH9BzOErcBq7vMCPCviYK2rqHtrfxkNfY/TuEhALqLFcVyip31f7go2NlyQ5J
 2HbSOP2GqbBBc4eo/6lpCRSHYPuzH/o=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ea46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hjj8zCE6y8JCqPeTDGYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 1:24 PM, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
