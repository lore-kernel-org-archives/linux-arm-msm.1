Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F9411F85
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221809; cv=none; b=BZg2zZtd5dNATXA2Ll1WX8s9A1RiG+vewgQ4eQORl9tsw4V0qIA8UauKtHicr5iGlznJ5OcAEBXbWMPI1KtkFhmqAziJr7dxw3cV2cLglTA7YcfiGpWQ8KMROxCq7toVr6+ooJf1XFgG0JWzmRm90LpzpZ+PT2+qXWtSmJoZntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221809; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3U/x7gJQTuLL5wjvssRBv7I0e5YS7Lg6baHaNw3YbtZ5Kcvc3LDHjdclNisE5TU4tPykKKSOaqq35H65yliUFkv8O2r5wG0N6+FppWqv4i0wx1+ZlQhgdnmgw6hzsW8AT0vzBQIiaEBxg7Gyqas99/0UDQMav+ks3/zx19cq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjrgZFi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhSNAIra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjrgZFi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhSNAIra"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3JaZ3454879
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=hjrgZFi4/5qLwcbs
	D6O9i8Sq2uczkmXcdgXawPVqbN0C1T/xdpH41ADHqZtuAuZnxRhdRZvbe3FUs+QF
	/bU7DGp7Cx7D/m4vHIzzteNSOp6t+T3O53nPK3ixicPioENvVGayqmU6272rsJGu
	khEOVBQXq+Ks4ciUSuz0hmvafAxJFF0rezpHeHY/lpzSQvvKj2pQtSAd65Bx02xb
	gQOyWMiUkr3wVqEQqdjFpiCjeD8PbktYq+jxP486eu0IMLxqxGyG1rhYXwPFd547
	Z4o48D1iNCCw3QVZrHqKO8lzWa+0b+aNXCs3snVaF1zC7dpUAwhXGksyyQwRcx0t
	B6hCxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg883ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso6511385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221805; x=1787826605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=QhSNAIraNCJWSBIim4EpQbd6bervgZa2lxx0iMkoWgZigrjwbLDfbOmZsq/5gML88K
         GdJQaKqD4gLMjAA5VUTGmY00x56P7bftYKNBbtD5sisuYmIjR3ZD94sjH+KBd+4eksJL
         ZGxU96Q8PYui0JZWPoOLaVynorP/XYsQdCqwjHYFct8ssNVhVaN03Uyd/iohCMUojtpq
         oEmt2w/LoAlrIZGXqE3uQBfF45OpWJeLhPzYy1FsNFgkNGp3EIf0zNQxMSH2fzmduqpS
         FYJ14eI3QaWF2AWREaiCA/cqJxKLUwUTLAgpy6qO6+BhXoHe6SY8fuamTN+xN7FgQOJN
         xRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221805; x=1787826605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=FydZyKLJx7/cYsw2aDso6GsQ0VE5AaEBTxo4FFhEgXwj0mSaAfdFom17Fl1HR5r/Et
         TCoK0NxBOf/HRBL5ChnsNADdyvU2rocUPT3+4OjIEEcqJvu1KFRL8w4eRMkpE/6iVGuu
         WguCojtSNHokYLmaG2G2Qyb9AAO+Y+a70TPVlJf2lMcxsLIH83kzO4AGBDZfsAV1Z4WP
         /0UM2q6Vsvq8Mrd/QW+qI6Wy38P7uUY0YykrcEDX7LSrPKB5x4IST3rfrJ9iBOS8L0Ku
         f2e5tMvaxZAfQ0z1RWHmiMVg1okRPhSNMAI4R4KX4RmMVEbk20RNLCapgLfDnQLRIQE+
         Ab1w==
X-Gm-Message-State: AOJu0Yx7ubh1h1utGNFicEiLr/0UBHK1mcCmYWUEz7o4qc7/jAvjgWnV
	w1RwUw5RwoTNnVtdcTc8c3TXQg/UbVoDgD+1vQPq2g9+uyAcCUSFWlrAGVJCVcLT4h6E64tW8SZ
	RT90Sh9LiUb4VrnM0fS2KsJVw23+c3WPmRmNVXC1nx+X0FLl59KWaWBlHG7kJ6UMa6vfQ
X-Gm-Gg: AR+sD10F3BuI2AWiwn6VO3Oakf8aTIA6GLVRHuBGxQvMAM/iVLYCpvpkCH6LFholGD8
	eTNQaPCCQAeW98U/ONrwPavQPTYeGuR0zORGJwt/WmIAUopOILNLMrR4RVI1XIGRcXmcfkj4m6S
	7XqSI4f15J11+l2cYIx3KOKml5WZfOwx6TcHPQdjEC/KqBePcd9J+EtbFR2GwA8yyySSypEcLMf
	qL7jQTOM7ILsWoTQEseLGRB7oAtzk9YgktIGLfI7fmTBTIATKPZBIh+Ja76tUX+Tv7UMO2YczWm
	ysl3MZso47G8RG4aSuq9GYur7G1sBrBiRA+2kj3QQ9mX5hyeXyvziF48DKpsujwbTO/EJlIqzIt
	ft4jwEWRNaxGV3wp2wHaVx17P
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr771159185a.0.1787221805180;
        Thu, 20 Aug 2026 03:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr771155085a.0.1787221804799;
        Thu, 20 Aug 2026 03:30:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:03 -0700 (PDT)
Message-ID: <86062063-4909-47a5-9279-e1b9ca8892eb@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] clk: qcom: gcc-sm8650: Tie the CX power domain
 to controller
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
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXwi+RPGZdeyCk
 idEoMKHpgHIc8IxGZfKqmneFELrWOZyfNU+Ft74gYIwatB8KGotHKxASPbi5qP6TsqxeBOiOcz8
 Uqwfvty9BmNG92ilcTB0bBSMpZf/7Lw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX7hZ+3o/XvWyz
 96FqBEUWLJ0dpG0G0sp4pwcIQRce3jGGb/H8L46zGcWjNvs6qEhvqWMq2ZAE5c15NwkJQSDQvY3
 kUKg3VDfwUkFaB5Wo9+y7TBJqPsrJWqfO9AVR8T6oIo8hPL9HZHum17Dl4SNksnSxYVBaMcYptf
 jNJnX8PVVrKB0tTbQIlRHRFPBsi2cPOY8viBJr9Emac4jxaaZn9GAnJ90grdg/CSlEtx/Iquy82
 g6mFdXHY6IzXWTtZraSWL0zTIxowOY4RLc2J+LVTBeCUHsA4QfO/VJcsLN3cFahyDczJD1IfANh
 L/XB+/MzB+0FykXYEgarrB/MlsDReJi1XXyIZd+X57w88I3zPAl60zkrC7jVV6uEDXsyBe+lb+o
 c5Mnp0iPOsfTV4Bepcnpf0cUbjDnxqYatf5l+a1xFT4X1zMVDzZ9uumFBPPOYJO2U2UMoocxzge
 S41RpavlulDJVJITvTg==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d72e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: B63YDCmZ3-cg65pCdC46lwivKJ0sCKXi
X-Proofpoint-ORIG-GUID: B63YDCmZ3-cg65pCdC46lwivKJ0sCKXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
