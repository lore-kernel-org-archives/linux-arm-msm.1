Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC163CFF5C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767926; cv=none; b=jT7BPQAQrKSt2c6W5xLjFgog4+UQjovcr9kQ8RdRAnDKgena7ihWMdcbo4w29Y6F2qAC18xBwH4ypqSie8EDbJ+KuAyVdUh+7Bfr7BV9AiBr9ndhfCY7TdbK7hB1W/qm1EVluTiaDGzdKEb+4zuZZXa98IciL2Sv7Zwx+dyhLP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767926; c=relaxed/simple;
	bh=jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1CQmbdKWSC2fPZLBv0Qso8tbavPrI8m6wADHggmAu1OZaquN6eLXYhYx9ckfaSoEg/RQospgV38SWHO0qMX/9Zz4aS3cjaIk/ISnfF4VxsPYhkfgN0offbOO03R8G3GHK/v66Qa+ADoYbPdBbXShPisRfLYnfUB5cCYf6247ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK6Jt41p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc68eTSV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK6Jt41p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hc68eTSV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777im43269835
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=; b=SK6Jt41peFnEKklZ
	MZIfxW83AXd4tDGM/eGeoAVKYkx18F6RuWpl/6H6xJmBCVa65ChCm1DB5zjT5PPA
	BeNr00BsxHkuUrb0YXqE0WIwsVpdTGTqyjuKHzbfMR91CSTIyB51WhLhxmznhTiR
	k32xORYaQc4cLmcWyge4Og+Z494LGL+bxH9ABTHR9vLWBe+l0LWj1JcRZPhNW/NM
	62y1fUoaaH9PmCvuqEBHzrixuX8Hs5MYigNzBPd4my6R7HiIKhtZevIz+Vg4GuYZ
	p+H12KsorqBQlJmhA696cpob40Oy4Cb8ej4WdctFAtXt8VsRyu48KvJRU0Z3PnFD
	vv6JPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhnueu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:58:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso6048371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767922; x=1789372722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=;
        b=hc68eTSVByMcEH2YjuUGjbI/7m4Eldmg78GwRdoH5uBrAHzu3riNn+ozFsPhjHd5o4
         usX7cYIgbEVkYlCgqkqnZoUQrUL4QlJG/rAwvMEE6Y30rBNBUJCM1lDIBsZMGbCzhR+X
         HNwbTwoR9x5A521Dxo6X6a+6pjTYCyAqufYg2kziDi9/6XTze3RODOH/HjKbVsXWHT7R
         /FoEKDX5erQWyV6/qvhmuYT9N7O6GVsmdElrUmDlqaLTU6U+YMsxXfzdUYVCPFm7fb96
         at00q3BeOcEeh3LP4CZ3NDqxMs1TxVO9urc7y3IYHV1V2LDFbwGdd1t/ss6WDVfON9mQ
         2q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767922; x=1789372722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=;
        b=jZ/bBMhvFqNxJ/GOZT6IZvRX2tLuyrBx2E4Jpwno0iBmDOjjHWZu/vlesYZxpuIck/
         WSnjcqaVV/i6+vD4jevAmZBf0q8rkd1rRmnk8a/iqAz8mviI0+4v9GyN7VehIbd4f4K6
         0Xkp0clvnA4hBmjNmQMMHBbLVs+sRrlr/Cypd4iDp0XDLvfFoEMEAhboOTrtO4YN1x32
         zdeQbk2X5q/SsIVPaAvtjx72+qvEO0s4t8UXDhPeFV8q/Ok4rDszmNWLsWVTZseuATWn
         +Wut7bnqgoavTjB0IRxMIiosM62rfNnoJU4fsIhz/Pcy7fREVSkrQOBPaZb3x4r6XInv
         bNIg==
X-Gm-Message-State: AFuF++lWP0wJHO9l28gUZJ1keAhwEyP/tLEUAa/PvN2s1V9+uBB9/SSL
	epeRsjvOe08ssiMG3yRrHgSNbrvAPA2k/wMylfvG3DS+vpjuW/zPwz+GJJApghYNzy+W42w1ntU
	gflpX0Eh6V7lvzyLT2mTrgZhmoDJ1stOuBVLNTXT5OKqgMJHXWnmGEZpLLvaoydxDzhm4
X-Gm-Gg: AYBFou14OM5OzHPg1Bcbqsmj660B2199HoDLXQDeBi0uxihZp4/mOkobpRxgJDUw9Ws
	NKeqtKGrULRAhROSgcw1meQ3n1tR1HpQ4Qy6jfOlMPNpHMCuvSNOykoPBgltG0iEPFYV2fXbIXa
	PYt7ZmpzjqiLbsu7M4tCzIi74LN5t6zg6+JrsOMXNNSwlVjUrE37wPaJ/vGdHL0O1k3/qVRvbla
	2xU6HwVJ5STuKX7t34VZlubVRfQTQ6+OidfvtbcrkQ92j9LNiuREBCGjl7FMl6vFQpls1vuAn0p
	5eb02UUT3ImIWDzJzhca0HKhazD7ShpGLV11Qh5LWH5GEgYeFhyYtFx3Uc3xKH3hh4ETJp8K2PI
	D3uwOEQBJu7jzKbBLn0UtXA==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1143696385a.2.1788767921951;
        Mon, 07 Sep 2026 00:58:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1143692585a.2.1788767921300;
        Mon, 07 Sep 2026 00:58:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2637005036sm231540366b.20.2026.09.07.00.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:58:40 -0700 (PDT)
Message-ID: <16ec601e-68a2-4793-8639-b899f31ff819@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _GtWyQ7bgUZ4RKK937Cd3DL0EnqG2uis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX7T9siWZb0HKX
 jBjdbylWlBqU0o3ymr3P7qfZmusHGlXWHdZPbmaDO4C26/xuZyQKh3iQgRrH25NFp16OWoSeHL1
 3BTj4qFcUZ/06wA6WwOdVYpQv+BGqmQHffwgJjqlxo4jnBmbRt2DiuKkSKzgkQaOsB0RFPEbFIy
 PuRNB7jK6Wj/st+PnMaaqEET/UmW6FdaFL4EPQKXiEPCENaENyGn+BaPnuDGxfPMfmF9NjUEUoV
 NarLwW+TU+0A0uTGeUGwanmw65oeiTwaCI3Knxy8y3elmftY2RbwoXV1yySq4rtjtQ9enAECxrN
 JuZswI3lvjXUd2Qb0pTZhmt5HkN8mY7DUY3l7avSRQhALVKbN55sHFBFn2dzKrRwduXC3fXiPQN
 STwiru/n4yzP5m5EAmPcIcpTjXJ4UpIW8OFOa168GjzZ6dvBLnfKK9SNehB040Wx3ccrDAJ1AjT
 uVnafB0I//BU/I/4c9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfXz7v3LkNPBHr4
 UEF4s7Bmm9NQKHmp74rOO7IRv3CuGZ6/vfiD6ryvbk2v35sN1IGyT91KKtXodzU8cpwoq29XZyr
 SUvwx8xN8ff98UYZaxroNjmOWjU0mnU=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e6eb2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IufcnN8YJO9jMoX16S4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _GtWyQ7bgUZ4RKK937Cd3DL0EnqG2uis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070085

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
> to reference the shared clkref on Qualcomm Glymur platform.

If it's the same clock, then just pass it directly where it belongs
and leave a comment to clarify it's intentional

Konrad
