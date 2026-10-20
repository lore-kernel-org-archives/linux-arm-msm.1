Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530284;
	b=gVLVzm1UN5a6FTs3bMsn26fRsyVKOFXiTu1ofxE7f4bzpgdPRtuswKdEWVy8f0n+SlFb
	 RQo0GzLG4Qp5iPQ6RMtBHbtZq0r4J2HaTcS4vy/NHOxX5gaoXoW8hftKprkvKifqy+fPM
	 6/PfJ/WMra/kQdM85fvlCBWZOC8OL1PHCDAIdKD08a8YhzBSGKcpKzHlnN374suuDMjgd
	 qiF3Zj6H+ROshLo69p/7e6usg3/z6slK2PJicZhOM8bxjll1cF4EB4CZT+OPJoVhoQszL
	 8cKjIwJEqWgE84PURiiCoVBTvVFMj1zk6oIQ5aRk4wA2Bo2xlXa+1xDEgTpqpPF6RfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
	b=xMR71BaoGNxiwnVXOdWvv/qfuo0MQ6u30GmLMDlPNxEWrevZvbU6ghtVHm9Vh+gyru2I
	 A4+L5FsKa/R6nfMccw4CmJu6Qd6uB1hjlzo68e5Dx6xxbiph2CbYIKrlEa+Ame2kneZwt
	 Imt02We19rXMrUWTeJt0NEYT7rSf5FrsQfyUhJyEE2a8nuAhfOc+/NKwYomCdb+okBHqa
	 8lvJRS9uoTNBlMdWzMyWeETXgjQaFG097X4hX/woSXrgJ2LbeiGYC0QnIKM1tKwMHgoNb
	 oSMiYxCrzVCOHCcZtuye2LctOuJo0Y0i9n2+FuGymk6A/EZ1f6lbnrEqzTSIfrjhYLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JBUDaYQ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E62606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E62606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JBUDaYQ/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKto7n2795597
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=; b=OdEK5b0uuDC4pl1H
	rNfBFMks4raI2FTAL83yd+QaQu12fO2psfxpI+toA/wXxROva9zEopDXmpWT5h/B
	78RDs+JmsgRaQIS+o1S07XMwyndu6UuJ8KTcYyn4TQ8/Tjj/Yi1GZD4qBEhnKxb2
	IhPHLAiB5/zjJi1btP/IkvZ7Pt832Jcixk8FSdC89XcekOjN5L+kaZWLy9L9GLiW
	F9FPWhPX+mbwURIA+levjeMClatWVGcyAHCI9htozT8qPM/7LGWy1VznoOeyiWLL
	rjllWMgN94URv029cnS5fN2dSdbK+mPghpjqX0Ol28T8QrUmIFN2qHkDY1rKZ1l6
	6a7nbw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a66r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:04:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7340462eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530283; x=1793135083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=JBUDaYQ/055iKTXH/cMyeAur64PaANtLKJOAUexn+Z7eIbYGq/AEJhW3K40RVUfQyg
         U+32qMtxHr1hXkCxfXCQkIV8cDgSJtEbfkqU5WHVkjBdGKGSk7seppH4WVXzF0bNC59m
         daoyWPTNNH1gsU0J7iWg/CDG+E/jjCoD4ktbgx3xHH6+x69nDPszbWj+fFnAagixW7RY
         8RPFMEBV8Qu37UiBxWMhKM7jAfq7HNSHdcYAjMcuCivIAT/VNbsNUZH+JwcwsS7oiqAo
         QOqgeqEgPEDNZPhSld5ze7ZnTBEQWdvTcYzGlHKepbv662rA1w9JbKt5kJmq5g7MMZtX
         7Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530283; x=1793135083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=GzWX16S80dI++keB/Z3IVOuWWhUpfN7ZAgtWn1/DKExQXjV2L2yzJVn+WvbTzNZoAK
         riyCqkgk9DSwEZcZeeW/BFhALUQCmImNk0e738SxX+HcogEzt3LSABzyYQBLCtrE+DMc
         o8gJekwx11VRmka8Ced0n0N7t3uFxmbLWEaRlbevE5bCzRW5CrMxjN5DwUN4DIIdhAPM
         Cc/hHvLIR1QT/guGi+U0Jzuuj4S06uyJNklTFH8C5FlXs8G+g2FEA+ZcoJyDyBFUTIZV
         IGEwh15D0uzwcCMRNarGtovms3fVOT7JrEcd2LfDLLLSvjS3TYQXMUh45VEFiULpS/63
         79gg==
X-Forwarded-Encrypted: i=1; AKwUvBxGHkN7itFljdrE0/C30yY6hp3xT41Rj+rzuxg8LXEzBUtnl5Fjz5E0ZCkOp1Eg/pL3FicPmjMmmskVcT+h@vger.kernel.org
X-Gm-Message-State: AFq9FYKAw2snV1JOXVgAg3OiT47mcNU0hBwCrX9BWYNxPSOTeOuUtsnA
	blxBhpcs1JZenlEwTWKVWa+bbYSvIhJvdONwFubW+O7wftWkOkEMkhf1kT+60rRkTTz+Yq1Sdwr
	EgCxL8DXf1DRgEBrI9906lcnKRPMXv+60IQF4H945x/KnaFIhorZn8z0NMuKjBm0hoNm+
X-Gm-Gg: AYBFou0jixSWDQT4QCSQXGKq/R0cg50/i2jQBT4NOdpG4k5U/Qy7qul643RenS3I9ze
	NMNPPLGfBehGSCaRV7mScleDeyQRJChZDB6yTPPTRhSu5nAXsvdu/30x5PXBxZ44OO21ijVmZ27
	Hi5/GqAKXI6y9eXLnVbEpBsW9v1Ukmhw6u0uyJnXta/sPKF2iZfR2mICZQ2Gd2ZgPU8UqusWLh9
	XSomZpqOPbmccvzB744b5tq3S/1yVo/AN9YBb7cjLfq/FNJhAfNrxdQVfSYgXgnWUYKPPbhjHqT
	TRCNmx17aY/r8prt8gXvfd3sMMbGsBWguAfXP6iYnI7E8CLVHKwBfxIFfZdgmFOfxsGh0MtpknT
	Yg0eLJsd3LHrBs28meDXG1KDGY+gdpzVeh1i5OAn5Sbu/xU0HzJIra2Jsrw==
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60051c88.25.1792530283103;
        Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60003c88.25.1792530282524;
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm1009238c88.22.2026.10.20.14.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Message-ID: <0c6b0b6f-af1d-4b7f-8494-01b1990b2d52@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:04:41 -0700
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
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>
 <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SCJXug8U6PsfrxB1yKspCfqeZJ4AKrkr
X-Proofpoint-ORIG-GUID: SCJXug8U6PsfrxB1yKspCfqeZJ4AKrkr
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d76b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Xvw101RpNOGDi7fnrawA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX1h/x5IEjsYLp
 yyvNPUtjpL2TYQif6xGlPjdN4XDpCENNp73s4xmKQ7n0o5rntdqpN7L82UHEofLUHMM9Sq8XWHH
 /DfCLrfhIercpXQkfHZ4g3O4hb11uHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX7yIU4plilSid
 wGIciBXUNKgxGS4AOSsF4bWRmuwGEpQXBclChb16rAOoBw1bbUiYbVt/RoV0UI7VRkdPrKwQ5on
 pqOzHO5CRuorchTFUzDLNP+216IFJKoxPY6ttyoFPW5zBLDqycybXsH+4Hc7ubiWRJlTJQi659G
 jXZlFezKtgfpUBixTBlwdDChRYb5jJgGWTC8Da1mJNsRZCfGgQFSPBJPwIGQIh7NNnVOcA4LqGy
 L0PvlxtXGUC3m6uhWF5T+pmQeRZfWuzK58NWLH4JuwtP3dFbsEj83tlaE/tzTAyryaKNa7c1Y5t
 RB0vNyqXxAfnyIdphzGLf+jSdMD7dcjcqFcrwjTHBEFCypm0DUADdJwuVFvB3gN8UjuDXVtqX7R
 ihuqymzeEdVoRiPrpl2bh11EiuVdCD+3GSL1t11V48F3ardg6UwbKhRKHsy3WFq1dPmx+/pw3M2
 MxxAZNdnffjDMSk01GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200084

Hi Krzysztof,

I can drop this file if there is a generic yaml file.

Best Regards,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:54:58PM -0700, Anusha Arun Nandi wrote:
>> QCS8300 uses the same MIPI CSI2 CSIPHY as SA8775P --
>> identical D-PHY register layout, common-control offset and clock set.
>> Add "qcom,qcs8300-csi2-phy" as a second enum value in the existing
>> schema rather than duplicating it, and generalise the title/description
>> to cover both SoCs.
> 
> Just squash the patch.
> 
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> index b66ec2f14189..8e60ef0714bc 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> @@ -5,18 +5,21 @@
>>  $id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm SA8775P CSI2 PHY
>> +title: Qualcomm SA8775P / QCS8300 CSI2 PHY
>>  
>>  maintainers:
>>    - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>>  
>>  description:
>>    Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
>> -  CSI Decoder on the SA8775P (lemans) SoC.
> 
> You just added this line. Changing something you added means previous
> patch is not correct.
> 
> Best regards,
> Krzysztof

