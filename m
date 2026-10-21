Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597949;
	b=K2OzUlOvZESrzwBdE8vuTTqRNKO2B5NmLuWbnroJAmgoG+d3q/a9OHftKew94xwPO/14
	 L8nx7WVxBB+zMIP3H3l2L02+QTeuBlGAU7Nr4MF3iXiRWLo6mBCyunHHIzICXuw3juYqb
	 eJU6SYyyconGfqf1SKSJVmmWkLxb0m19DNEINlLlPzQ64Vb+ZRIZhbzU+ab65VTClMFGY
	 54fhec32A+++oD2BwsSW2nWsz4276AY1jrCJz53X2xQndDNrIwQyDUcCt7bRxjvA/WdhG
	 vmfh8991Ly8umvtbsPVU3LiCKeMLVdrQzXc1uACNz4b5RN2bN64en0IICqiosbb7Exw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
	b=tGrXAQEv7AeHSgAd6SH+J784khkRGs9btotKDXbMOSgxo5MbEdPnrxMvbecBMYghYjWS
	 81WWV2Zk8GLGwtL6jsQudYea0hbOVbyMZ21499iwmwbhIdopg4wt2rY3y47kB+KUt/b4i
	 tD/rwhV90CQATwwXldQVGEXT2PrcBU5SCY15+8zEG6ozH2L55CWUjatKLA/5e/Mmcgvvr
	 uSiKyA8rr/46jGX3DRbp3AQKD0Yg3pGOqu9QxZmrE7Q6Wk6LpGhziW3FUOW3kOIIhKX+P
	 dk/5SjBMTa6ljANYosGpCj70GYiKfAZ2V+2jzfAVG02XS4a/KmDfTQnRDKUYIALgbsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59EA606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59EA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU3mp1046403
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=; b=X1JkZaaMrgTHS06M
	o7AuxubVAHNYAzDNoSeEZL7PJ8n7fdXBQFkiLgF7WtJ2/ov+PYwQneQBBkjh0NLC
	WfSNd8poJWwVZ56WkR2BJ45KPIORIWZS0/vfNsltIzvoPJNs/VfiNqPuH/zX6da4
	/48UV4Zar3SZ/QSaH6ySYnJdw50tmQf4tcpzsntlvEkD/tSp/RzyEi73Qyl8ZKbv
	Ic1Z7Ko783ll+iL6fmOlCCOtBIkmv4MvR0p3uY9ypvyBonzJxsZw7yuH2Sy3B1xy
	9oqq7kFjeAfSK0kndMy674r74DOW8SS5WZh2+3lgEEDFqDotzAsPcZTnldI6S7bH
	o7B8MA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj49jgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:52:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36696c9f55bso921248eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597947; x=1793202747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=NbdbjfEkAUJfnEOgZvzihS3FCsTQ/Eq5luqXC2kqzy8XSIUgB569FdxvJQSc4ZsqlE
         q7YhhPtgkLq5Q0x3tWf1iFCO5/pb7hZJqv+UpyH1EeNJ7PrZ1O6+Ah/6PeEDtAjGromG
         iJrVKqTQo7z8UfQ7A14Sih7KFs0twkd6oyiP5RjsKGnpTPye77eKNEVm8/qBvrJSd3LG
         5bLMnICoDn3WRFtnga56XiWB0lfVJ3BSm0fw41YAQfHDUu61T5kpwFBBln3jFBAn6uDu
         8ichDtqGCgcYloL3/2QLB0DRzdLqm1mz4Xj/6feijC8WD/8TFK5eVtk2dcV5jH05Fyhp
         kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597947; x=1793202747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=DMqHI8X1THBjCUDe6fDhhsp5NETjGjp7w1YnICXO/5IKk11gYDU1ohw3YoEzmHE899
         YCCIObnzV9ScUIkyeE67D66KR+RnejIryod0D7JMq0I/EwsU30NIRcWyeKu/dIk3U2nL
         pAGahtKHZa53Tzi5vuWT8mAd48isY63xjpVp8dLsFoYNloo6jNLBbg94SA+CdDEar+ay
         9bDUWI/3zw+eaGTtZPsYg6yzWk5fp2MLzaGDC6c2AWSNwA6nBX+VrtlNNXN1dy+ZIkti
         WeLZut/YHU11AibomCrtWvjkdvJEP/rPfs0/X6row9dw8eV3/F4qhWGPNA1bVvFnfdxQ
         rsgg==
X-Forwarded-Encrypted: i=1; AKwUvBywGCQKtxxvASTfjqnTtRS+vbLZd9hi9dAC0A7Yh3c2pp/CMXVVRkyyiDWusuybsucIwEdQEihc/PRia9JU@vger.kernel.org
X-Gm-Message-State: AFq9FYJLIoCJfOpEN695/YaKF+VMsEpHhOOvIlqNvAopH62gzW/dPl11
	+Vb6XCZmZgT8D8GpcHFva9rhJ8uzkU1w1wul8w2uANANnqQ8Oa92MjgTd2K8n6ew1H363f47ULa
	8whwJPaQZTaTL26NkWG+Lvu5MXD+jJcRkzJ6lBU/fQHSLwtzO+kZJdmUwPk95HSBLxrGY
X-Gm-Gg: AYBFou265Hwzi3W4ssim+Aj/N4aujjaH5kx08HXF4uKfzWQyhmoWc3gIe2Fkgxen8t/
	zPnlvBIi2HdxbCST2Xe0iAA2oWWiTk4Z2I+u8ohjoD78IHdIgIIsSTlg4K7UY1yyZzopr/6wiJa
	Y4QLU7g/8fypcEwekEKFe6+mSiWX/2Gat2vSjCItH6Z7LjozywPlyf9bfUnQLKGSESnUw4DP/Tq
	5jfoD41mGZdZqqSo1JmKORRjFd5dKdMvPEFfSqBfIZXOAL6caV+qcBpGcC/ct8lR/2Gsy6cmqZ+
	Ki2Rdd0VB5c+OLPguIgCXhxsaOTlCS2dtPNsP86vDXBwVQrSo7rd8OIKMlY5oF5udWlfSb+Lk4o
	T4TRL8zTQKoi5zLyRjy6i9gFyIllQWdExIFpEdd4Ul6QR
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3320997eec.10.1792597947081;
        Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3320967eec.10.1792597946485;
        Wed, 21 Oct 2026 08:52:26 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm9445801eec.25.2026.10.21.08.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:52:25 -0700 (PDT)
Message-ID: <d163db9d-5b0e-4bee-aef1-3fe8b7f1fc08@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:22:18 +0530
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
Subject: Re: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650
 apss clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
 <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hrgJQXgb54eRXqfg9kfvCm24yaN3hbq4
X-Proofpoint-GUID: hrgJQXgb54eRXqfg9kfvCm24yaN3hbq4
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8dfbb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mdBYyscGZtZr9QMU3J0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXyYg7uA0oSX6f
 gTC/22Dq2yjrPykaIEhK5t2B7kdgwxSq4mQR4ibDrvKf2pGA/3Gruci6FETBxjJAjO6qecKuQTK
 oe93K/H/wAtvfbdrw0lLYztdSTjwouEDw52x0s27Iwt7iWQ9KwfAmsfZBfh1GWyQA54a58v7zij
 l+UiddvekiraiPPNsdkj0tLh8D+AB25yLM41KXjI7CxW5ZU830YgX0WmGFmzkOaeLWRgSGX6A/f
 qpHCwDMMr3+njONRRwBB1N5HzCjFaMPOj/KudVMcSMA3shWfrqyOpKL/k7TwEgJyKjN54K1oWt3
 xZHt3+8/Q5HKebr1j1V/shs7hUuKM2aNWGzfOvB9TJ0CSMqBp+NuuWopi6o6XnOkXzCVq5xMOhe
 tH2h5ar9+oYecR4JOTP4BNcHTjPjRxrKOXSSWWtnIxCxlqUdFNRVQoVQFriA2NMzUQLkiyPfqOI
 XA0X+rcfWkMdkv90cIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX5DGEWSJHHZNk
 xCcYl2vr4lbenc1xuDJrxR6PnE/2Z3v7FPw4ZymwLVKmHR+GIehDL7xCNGDdJNJ56OqqXr6UTSi
 Hd9UIUI5WEf+nZ97HsTTXOenqE1U0+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/13/2026 12:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 12:20:46PM +0530, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
>> has a register space separate from the GCC. The four Cortex-A55 cores,
>> the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
>> selected through a glitch-free mux whose parents are XO, GPLL0 and the
>> corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
>> controller is also an interconnect provider.
>>
>> Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
>> the shared APSS header, and the interconnect IDs for the CPU and L3
>> nodes.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
>>   include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
>>   3 files changed, 67 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> new file mode 100644
>> index 000000000000..6b47183edd56
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm APSS IPQ9650 Clock Controller
>> +
>> +maintainers:
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description:
>> +  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
>> +  has a register space separate from the GCC. The four Cortex-A55 cores,
>> +  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
>> +  Each clock is selected through a glitch-free mux (GFM) whose parents are
>> +  XO, GPLL0 and the corresponding PLL.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9650-apss-clk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Reference to the XO clock.
>> +      - description: Reference to the GPLL0 clock.
> Why do you need a new file? Looks exactly the same as existing
> ipq5424-apss-clk.

I kept it separate because the IPQ9650 block uses a GFM instead of an 
RCG, but that's internal to the controller and the compatible covers it. 
The binding interface is the same, so I'll add qcom,ipq9650-apss-clk to 
qcom,ipq5424-apss-clk.yaml in v2.

>
>
> Best regards,
> Krzysztof
>
