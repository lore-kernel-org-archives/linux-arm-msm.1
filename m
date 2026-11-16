Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796700;
	b=qDyQAe//yDmeg5E1au9mt3rjf+6mop8I8E0cetFkmBhBCx2oM5Q9VA7zb/zKq3DAHdjX
	 v1LyZu3NdTNrdKA7z9a7GlHfW8vyc17MRcKeWGMTDur+TOE05X2CERn5lVGtVfbIlxRiy
	 2XYY7f0NuXOONGi7wsAq1W4tCPkTC1q7888UstPOIINEIYX04a/ZbSRfsJ+bOUDxJuDD1
	 tEfo8ydI0mX5gwIO8xeNuzX3nNkQFAXNgDGK1iQmMcPHr7mcKtAITDS+qVuTrcwQv7rYZ
	 4N2IIIHssEGai8oLuV1EeynHyhkR+SMeNCkl7hEiOj/9vMfvYpsHosXNop/GKcbXzgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
	b=1XcpINVg+fVvP5BYx99Y3YLqhSJIuvyUx/0Aa7KbzwGLd8JCy2PgaO4TUG4LrfQEAVbV
	 Z6eIK54TrzQEfFgSZNwQeZZ3jXvBbVPyig6bFGq8eYyiQ7X6aCuCSijpOFGn9+3ECxIwK
	 dKCd4UNCQf9L6uxUKMZmAP2z8AQcNDeBVO3BJH4BB8SluDpJvGWFtrZGtiE8VHGSHXjCC
	 RBPd02Mc/WrP5BgKJSJ3+lCynUTaXHAqpGc8AK7kIPMKYiYRexOa58KRtnA0MMth7lR6q
	 e3MMISchQJUEa163cXCZo9YmzJ77H7L3ScSumRJqw5vLOa7cQtLlgbWpAgtl9tmz+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39F606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C39F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L5xq074075
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=; b=WJrJOScFWbmhsj6y
	AXFvn9SBm43IzYWGZMwIAmxaGxjIXxdlt9wkxfaTSbQ7E07Q0BxLROlUAfuguA80
	EmRTzEg/vKjuBQwh6zpA3hekDlZWsN4v97sul0/C/d3k+hiHtr6ZpjPb5W7rnR9h
	cnJr2qP0IUs0zf5SZEytlzqfqrfUp5LKlRQXplO16NMFIyoV72mI7tBcyJ+9Kzsh
	XCez1LSHjOKwOQr/TscCiudCBtJdt903ne639VG+gBHMZ4Z2RAuB4fmBINzLHpvQ
	ivVLHIJWMnuTCc+nVuR4SNNNoosywSJYae8TVupwaAtor8SM22VnlQjRgUUtsf+1
	OH+qUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjvfhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so519172885a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 18:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796698; x=1795401498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=L2MJ+PvCZq5kFb18qBpX7JTf0iQ8hVlYPEUP3yAq2FqFXfkLwDPiclDCRp6/QN6zhv
         ZEUK0xDimgat9/EIfD91bkycRHWIboTNAspoit94Oyrb3aWc3UTfVXQvZ623C4ywwLCr
         Q+ESN0ac8BwAafWDY6zl+TUr0PZ3Bz7FcGjs2yi6WnYGyzvMi0OMa3K3XP8SCv2MctlS
         yyGmsPxn3HBJVR90AvfjECN9HgIooxR2mqDHg1JORqCX3z3s1RNFP8XTNjIr1Bkvqk4z
         B3c4IXsVnuHIMiU2K256jDt6IRChLUxFFD0Edjxi/RHx3SnNN3oVsh60CY9jfpXzfD/J
         VL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796698; x=1795401498;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=ExaOwAcXJIZ7RuOBnF7mjIeHOjkBQiMzA2T+H31T+IrTOwH52TH9TXSuWRzaAknM6s
         WMBmwbfcdkDe7VNuYHT35ioA8ZXgaS8QyQ6qDfSu+r/IK4ZrJ98AK+Y6s89nYBOKntgC
         kJYG0an7IU7TGXQOlJhhGe5iiU/ijtWamjPUsRyWvIlhVQq6cevyxmtktWzstPVQIq0P
         wV3TWSSVwl/Mbb7Avkh6CsjHlZSmdzhTQoYM84UMgSK210Sv5WIcxPYosH9yng1GE8Zp
         HJm6jr4H5lRZFuCLLLJsQNRgbPDgC4k9oqcRb5J08PB/nRNqZRxIFIbgPUj5vLv7NmRJ
         mMgA==
X-Forwarded-Encrypted: i=1; AL+hErF5xNj5TQuuxuQorIWrvMzy81WXvhCG5fbFBuOBwv8wbqiamLnj9eaE28ovNnpWJIm0Vbgpf4bpRk62+yp3@vger.kernel.org
X-Gm-Message-State: APuU4Z+0MmrmEkky1uwNmMvGW3bmbFFKudx0fAEtqLjTVP2htqg64Ndp
	uLzio4jVq33ZVV+4waqpaL8RWatlTZSmTS9xiuVwf/LwBW4f9sjXdEiQIn2ehhJso4LLTyMkXG0
	U5XcAJ6a0XdLixFQGf9WlT4yof3FY6qtqBQoCbIOdpnixfIBnVVo8JGOHrag3tF+Ktksu
X-Gm-Gg: AYBFou2ThGjJq3QNkUISuytz7aiSh2Uzlje7Z6vzL346XzMo7mcWj66Yq2JmiIFKfQ/
	Ct2yrFGnv6h6VatXnogUWliYM1NcioFC0rnuYtdU5OrXLfXouusGBpQ4HnXTS8mqtp9pdzwTZA4
	+9kLT8NMb5ADa0Td/5V9B/sd6inAxa5YXY3EK6WX02IOzftzs6omThlFKrhMvYFo5DSG48TkL8W
	5kqu4eY+iV4lRuLK/dd6VUgX+6Yp7NP3OOl+V/Eu5Ezb+fUqemJ8lZcCrPsb4OATIddJzQpwDk0
	PyotPFNoIgz6dEwIQUJAxufX2oJCgTre+lMNfBwIWmGTYZZHrNNd6FwaNc6+BKa2/6VFeN3rdOJ
	80N+TTs/qZPXP5sBQgNyImZaC0yUWC3IkVKeC6ciJV0xR47K2oKtpMKVPpRI7gD6ozhrjPAHJCi
	/cjAfouh7iPYuckOuM5RicuWNmNIAUsJ6NYw==
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471815885a.56.1794796698138;
        Sun, 15 Nov 2026 18:38:18 -0800 (PST)
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471814785a.56.1794796697746;
        Sun, 15 Nov 2026 18:38:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9497a4f1bccsm186560185a.36.2026.11.15.18.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:38:16 -0800 (PST)
Message-ID: <d784b5e9-af98-40a2-8670-6c12208983dd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:38:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <20261114-voracious-capable-guan-99cacf@quoll>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261114-voracious-capable-guan-99cacf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX9HZCwgYMRBQI
 nPZPdQC/DzIqOZpmEscJjuDWheNm6ZjiRIzTb0moVO5sEqytoySXrnT6xlS8QuG+A0KKVmRqDHT
 TChCMm//k509Hz1jykbhAxpXAIvaw5/6PE/YSaQhtxuzlq0QF55weJqTMzmyp5tc2hq9h+aVu6f
 HjrX5pTy9UDfKb3Wg7H0dGOvYbx7t3E6KF3t4fDPKlAbLqfIZ+/LL+YhD+alqldMeDH4X+qvsvN
 dvwD1v01Yy52nTrZfMaid5U0zUwvBnGos5/StKbVGl/qEBFPTJATZiR1moaxeIdeLnkzKFdPHoq
 XbVng50BcidWqKDkwzf44qF/JT6kcTBznz8bTpnUsPdCsp1lyyi3DJQd9ZS3GBLolG72nqZJSTE
 1eMaX/fzDfqsqq1MHAd3h7/QtXD4c19o3st2jd0qgb8IkRWJj+78suCrYqJ8Nt39UOjHzg0/m23
 3pAhs58Jkkm7fY7/SsQ==
X-Proofpoint-ORIG-GUID: OVa_okhXql4BswUA2ISRn_y2v469AHlP
X-Proofpoint-GUID: OVa_okhXql4BswUA2ISRn_y2v469AHlP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX69+o+JlZEPO4
 P8/ZIxLsRrbRfMHiPVrGcUCp6WwdKfY1ukWSlyNpABTNc0pGRGZRk4XibX1pSOPIJ4e26QDxu1U
 9JR7XtX853j8WYaLuE3Ag5oXTyJn7oY=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa6c9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4xkCrKK1q9XhPcYNJToA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Krzysztof,

On 11/15/2026 2:11 AM, Krzysztof Kozlowski wrote:
> On Sat, Nov 14, 2026 at 07:29:18PM +0800, Wenmeng Liu wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Does not apply, so should be squashed with dependency. Why having it
> separate?

Since Bryan is about to apply the dependent bindings and driver changes, 
I kept them separate rather than squashing them into this series. I'll 
rebase this series once the KNP series has been applied.

Thanks,
Wenmeng

> 
> Best regards,
> Krzysztof



