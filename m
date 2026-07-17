Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC53F12CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287283; cv=none; b=sRtkUZyY01sq8IYZmiaNd7jzdVM9v0dy3fgjVgOPdDwJwmbdm3vqspT5iO2FkkLu599rnNw1SANFJkCj00aDRKLutEXaNe/rF5GgIZi+kUDg4ff1XOaR74m2tzcvLYXp+03Uyr1wsxEr2Vi13rUw+ybJaTFraec+YSUNde92Jsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287283; c=relaxed/simple;
	bh=iqpOIrvf1/AYDcZd+jy1J9GwVJaYJ+8HlZKlo7iiIfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Az8ecS3hZqIfQ+uLUDO8IDfGBCP+ycDGkH8byqTLxQcXXkpQ00oP6KPBtf7kSuPzD9iCjomRbDpo0XgX7p4qbIWTJsKWX2EOlWuA2swfhuF+rwsqxQ8ZnjuAkf2MSQHvbV6LHwC4J8sbgQGVfn0eoCK/nZArEFLD9sDJdbylp1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWXkK6hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6nCS7Ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWXkK6hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6nCS7Ic"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASlgp2634652
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8pzbcnonnfSYtaHaFkzFDz5W4k5Z1JCVBdf54V9yvA=; b=bWXkK6hLCJC5o4mj
	zVsOOOFADXkVa7QEql72ZntBww1L68pJz2Vm3ziufB49Z9/5OZylYYZIK807u3DL
	KVSATuOI+eMHD/gmli6xm5RWN3PbgtGPxxhMLwT4PoiBFNgjh4OR8mLBx1lw085m
	050ctqSUyQ9bR4qxmbiJ4OpBXkHUoe823el+47t7AIItZZ+VeNJC759ZOkUmIv6v
	Hy3cmzDJuTr5PJ2/CmAMHq1wckhj8FSmQEdXxEout2cnRTgM6sy97kkLzvR3ZXBt
	42BKW/3gYw28NyA1hljnqtBK2zwUJkTBbl1UjIn4sX8ihPIJQ+SBNasKdpCYdJpm
	VASFIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6kes3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:21:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so186844485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287275; x=1784892075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8pzbcnonnfSYtaHaFkzFDz5W4k5Z1JCVBdf54V9yvA=;
        b=C6nCS7IcBh95L/p21dnY6mlAgSfOhCINwAyrILhPv7gXid30UIBaQHgVD1A8YC5PhM
         abMN0+dcA5sBItzmGXmQKC4qGWPaRcTbnnSQQSjh6DgYwu89U0G9kxwPh/+KMXqqhViE
         OU0nUMZYmIscy+R0c+V9f/mGcv6c/rvkO1gbUi+wCHBM4kshozLilHqO6AoBwfIR9I47
         FRtrhwIoUHaTVgE1x/fzMABp1et33RQda2xMjblyvmWGp/8A85sZs/fj9cMdP08OYqcP
         IAAj2F520NolWtyhDYNlWwiNxvlaoXmrQsp/ZtPVHWS5DehSMNPt9PxpG3T+baNbqpes
         sEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287275; x=1784892075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8pzbcnonnfSYtaHaFkzFDz5W4k5Z1JCVBdf54V9yvA=;
        b=kHK6Qn6h83iUiqePLhFF9yhW1/TWIoI/Nj4IsUxXmhpQ0Bm6bHohe3HceST3GQjve/
         x7ZMQnVLbHzV4PEGgHsfBzZG8qs477vMgI7KdAdYXxHDuq7Kw1yX/tyV5L8NiuDQ8blT
         vpiUc7i7ADbwIkp4A+pq9praBTuV5G2Zh4/tquM2fUfOHubpzy6WeGQGWq9gNPfBU+VP
         ScyLHr8db76u0AhHoPJqXg6uJDf5Ak1OEXGXGtGKNxJ7jlmn+3gPnRNibBppUJupRlQ8
         XiZWLY1osBkh1jREpqHNQfamgmcKuu2iXWWQUhjX0wwrx6vCIf4JQgeZn9vuw6CcgMKX
         QDJQ==
X-Gm-Message-State: AOJu0Yz8oyMNcSBfMxYjwyGb64NnBeZs38HKW9xmCZ/kYQyvwxM2Kl9C
	d9k+YSciYhffo6XxsOGm6qN2bu2OoRNqDs2OQdZHcQXMHShVlAtf4NnDF0Mw0J5wkkLGDEC1MzA
	W4svj4PXxRNpDO272g2mDIMBkDQ+QAeRcoTAZQo/+dWB7LfwlwDhzkD9bkHm4fcbpQcKX
X-Gm-Gg: AfdE7clKTOjfQWvli/KK2xWKjhbm8oFdCVGKwjZenfiL9KZCV88e+fr3Pibgm4Oy8UV
	AbnL3U7O8zjtg8XBsrgJwSxo3XZsBak6280C43gpvM9KPmuWbDlEtRy7IFxWxyVnG4HhQZBZ2ZM
	RIsMIGYPyl0UfZh0R4ORdWx4TpNPfQ4XsPncQ5YKM96+3YS6ojpVFrZxUJF6l8dxnpBe8ntNWDG
	6vavg7qH0APvsFVb2D6ThfsrW1t/3LWKt1AYIDgYsGGjv5xobJiLqAFYurueImosFrfyHP685pr
	D6LXzKI5JfXAAkEveLvEDSmYuHnRDinJai/hUJU3Ql2vYjvFC2KdqwG1uLogqR1z18U+Lb3kL7a
	JH/B6CvY9dF2KTvCRP8EhXYyV
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr192962285a.2.1784287275597;
        Fri, 17 Jul 2026 04:21:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr192958285a.2.1784287274849;
        Fri, 17 Jul 2026 04:21:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fefdd4dsm512093a12.11.2026.07.17.04.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:21:14 -0700 (PDT)
Message-ID: <a9e75dcc-6895-41a9-ba0c-1d3e86a421d2@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:21:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
 <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNCBTYWx0ZWRfX58eM9LXPSMrg
 fH3KTIZOLm9QMl5L1Gi3kQnLnpt3Ey3qp2KVV1DqjhvzpYK5EVAhFA0UUFG+NKYBDh4wCiKsiRL
 73sDpWIXBVoMLIJX3yeZDYLThcJugAPf/TuNgNItgM3wmky5BK971pQTjEwSyfJyI22rst6HpLC
 gvws8KixhnqSXo8A41WK4icYJgw1x9nMN3MyPbPKkMO1wqfTA2LyPeiI9cjqxf/ZHRQhDG6Tka2
 Xjebwm+cZ5g1uqU0H+KlSPZmkzTLrlr2PBeihX4Fw7y3HfWrKBO7CwEYIi76IAezRIBCCUZzVOW
 r5663YIcJE85qp3rW4zurr1LVL3rjxtRYmGrg+zmQ8FDPpznJBh2O0Hm4S03TqDuNOFkLiKX/AB
 8CNfVxjdfTwP+hKDk6RQw4KsOpAxMiPqyCgXrPnLbdCzkdgo9L35S11dk0Nui3sG6JFJfV/M8Oa
 FtD4I8I4KjoE2FHh/Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNCBTYWx0ZWRfX+UcUVIFidgt4
 5AIZKnPiEDIIuZ49tqf4z4nhFnDDLsEaGVYitt0GvI1+s+xibNOQsZC6vAsL14h6Ta0ORZdeir5
 Lu0yGFfO4Nklbf0xWv794r+l/zonPPc=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5a102c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f-AdFH0jOpSPBr_pIgEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HfAwXcemqxOxY__94ZsiHziTh25mtWRB
X-Proofpoint-ORIG-GUID: HfAwXcemqxOxY__94ZsiHziTh25mtWRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170114

On 7/8/26 2:44 AM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

