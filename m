Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704760;
	b=L5+cnQ+ncddw7EeraXpAyfiV9eI+rvw1H+huxECLEdX19XycAQdGRt5Fr1BUZByI5QHV
	 IAq3mKB4Hh69lofcty8rWj9Vn7+gL2RBdcXTXQICw18e0hOzkqNmM7N6bnMHWJ5wJulAp
	 jve0VpQ3wjhORXTW3XPpxa3Eh4VEC8QJbsW6J5LGkSBcbegdS3sYHYUZCKIk3+itXW0Jj
	 5n0eLrooU8OGIk1IU53fiYOS5gjL7OnTdIaJHw4kU74kZcRpYOCV66q2jlsbphhA6bexz
	 tBqd+hJ6GZVlZ6ay2XJ8IQFlvWy/Ye51l2ywSQ1tft5m3CwkkJshC72UwGct4WtFeKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
	b=U4k8MTV0XGwJFC/6VsF8k8X4VyrmevVoiu3ZBpI4WIf/8vtSRt01YEZuHJxAkyWXRIY4
	 hZAeQgq93bxKpcGKiJaCjgYI2AuBjY7dGizhpVkpFx/MqceICPnJAPKRnZ+uxiLm5M1na
	 Tnd+5488Px0nQYd3RF0k+MHpRY454R1REuiUsH3XFY8lEM9QEJKaW7a0devu249/TP5/6
	 HkNZEeCbC9u03owwZYkf81j046TKedfqU4wjG9bJCYtShyJBqOIREgVDSDTw1579Xpui7
	 LwpTD8dOQkgtFtU22uBXQ+pLrha/EPSvASI5sNGIErj9pvn31rfhHBZYWrPQYRCL2TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AI3Bw4np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fso5GcE4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14511606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14511606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AI3Bw4np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fso5GcE4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV9GT3664924
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=; b=AI3Bw4npSU2oaWtt
	G55jW4G6xRjVrK9rstWXiuIUDUWauueM1cSfY7lyiPftN9OdUiTlFa5ameJvY80B
	+B32cV1RFuzvNm6ve4tBQ//4bD+in7UN29gTT8qbqkv+Gw4D89J2lk6J5I+jXxo+
	olo+Qkdy6vkXPVD7Ek4oKSM/iSTx0nTfRh3ld6+h6U3UhtsI4gZYCjqVkFVKtilh
	N5okf8CBNbF6FRaXv9nTh07Y5jU3VGFYcJT6PU4ol2wlJ2cz/6+TlBdVD06txpr2
	hiErXVOpOATPSNjGUSr8ekNfGxJVnQIeCyLV09X3ceSjTyGW9bFbBoX8YxZnDWnM
	UnVGjw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9cgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so258694e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704758; x=1796309558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
        b=fso5GcE4xDq7wrTe7F1sR0CT17LTvMyniyT4w2Ftcv36mZBxfdGSyI84DuGs/fBNKJ
         YJRudVYzmKlNagJ4VjGJzPJSPLPvSMEcyaxKE7mc7TfL7N8GYvsjC8Xh6nnM7KLWNelh
         eWfvdKhrqPWgoIk42VF+qEnF5SfzPRjjP79p4LNtlNB83qgv3zhg7ickXstmuw4F2nhn
         GfxGAjSYVmB+q+3YRE+CFoEZwtvKj1SsxtJAZ3jeUhGzDw1xKCaZ1im3bgqJ3+8SFbA8
         r92ybdb3OkjlwYYIgNDJU5alVbUQ9257a/MdK9eCRBxNgk+Z08CnG//5Dm+Hn3NlUqcd
         NNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704758; x=1796309558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf3LEdO0EiNsvgxXyr5imDF61aHJP1VjThmwM4QJGPY=;
        b=yQX1+tfY8V85vONC+CK+FH7ez8kecFGyMjXby+38vks2HoBU6bVp3KWxBnYsmsnPov
         EonxI+HHch1qyPpcXZX/YSbdY+UQwT6b04UvYsax6VR8h23/6407rGB7ysD840//tG6X
         q3lG8zxmYHyNPAs3FDlFcPvtVuxhSeY4+YFdkJc4IwM/Eql2kG1ZN9wmuV6KoJxUtvlX
         mCKn8oM4VJu2zSio5KlyYuNCtoLpMsFKn+jnL3KejHQBSRGTU55U6Cx3EQMZNvojKAuV
         33jju4lCyFOhgQYRPBqKu1FaDIXIBZJD7HfAXvfdlIYhiixIui8r/lTTeRrB7sbEbDUi
         ti3g==
X-Gm-Message-State: APuU4Z9DxRtzXZmb0BgZZ46agNzXfVeJHVyjpAY95Yda3ngh7g1COBoP
	F9qrVlIi0tVF9Q8hAZwAF65DCUmSI903qNgHgOLVrqB2p2XxnXUsdORhJSl/E0W/EKd8YXx1Kdk
	Y1N1hITwvMJz1a9Q///c9yPmxS+U6i6vsUQvcxiNEQRekYZJrEnR6bH70PXdQaSTs1mUJ
X-Gm-Gg: AZFdTZdCXDfmFv6k8M7XWOLA862Th08BFGI+xctTyrEqflLy1u8Nxa7oIcRHuvl3VGh
	V4zA/34LsuHzxsq9rd5NP3p+oSD1FZMnGN6tUxIEPsQf5NB2LPgxHWqG59ONvPqOET2Nrn/uzGM
	UdqSNkBuElxgxwoHHVKZ1y36Fh63cQrqLZFKh10CnfnJTHqcwm+bWZpy+ZYxgevnRTw0W6G8R0M
	s4l4fQGdhGrDQnY238so12n43gy6mQdv2nlpf2gZsPpOV4XpsuYnk5QjasThZ1ZKhJiJeCGNMi7
	4/L51uFVRThYbiVOTKcogNXjpDLgB7X08x17DIYnkAljdh8wJI6LaYv+WXSfE+U85JSwKNi0QCm
	Q5PVlWli1NBZMRsOGxWR+PMY7wyoaGGgnGUf30ElaKkFzxsTgZidq3cnmqLNAD7M4V75fxLs=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr18380996e0c.2.1795704758315;
        Thu, 26 Nov 2026 06:52:38 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr18380954e0c.2.1795704757878;
        Thu, 26 Nov 2026 06:52:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm9871519a12.28.2026.11.26.06.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:36 -0800 (PST)
Message-ID: <0caa0ffa-edcc-44a1-94e4-cd5ad52eb80b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:34 +0100
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add rear
 flash LED
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-3-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L_7N3KALa30yKC8I46eL0UNArKZcvUPC
X-Proofpoint-GUID: L_7N3KALa30yKC8I46eL0UNArKZcvUPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX2YrMAuZ7KbNC
 bMI7QaFEmf5857erNmjTki+9zBxaiJwm8l7ziRoL0TvKaMNeNKCgLXP6XYWPjWPj/yLW0dGcriR
 ZClTqfD221Lfymp+p+RiTLKkpB/DbOMY0rbkFFlRj6J/7mfX0gss7jRx2RGRETFRRG7qIbMZ0Zw
 8ANQn/zpFiRrKgb3Y3ulsya3B05Dy07eyAMaRhBZfPJRkeN0VnhZijzmngyXEqHfzn2kt33xA6a
 wObm6rVXRT6IzlwU/gBF41oKMPzwmOKPvfXJ2IP8xgq3aRLUDcljquIGA4IlGFkP18Rmx/wcmsv
 MkexssCjhqCZhOPvuRmr8U4PSk+wbo7TaOySog25IenSmQu5HnUqlLx7BlwHq2RR6CzF7px/2H5
 hh4DgiNM0hCHmJeazFiz3hsjaWD5h032yUYafIKi61wfxIeZRpZY69oZKv1YbUm4b+IwYUQBhG2
 T9BNMdHfEecbo4JCLsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX1pGTl3YfOA3a
 QXeQiDB/M46R6CA9HR8XY6RT+oZedy0akQToXdjkVJOFzFlcS1FvmXPhw51ZRl0yMgRGJmgsbw+
 w+i2FccyaZSYUrPK8++aloiochCfvdY=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0847b6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The rear flash is a white LED driven by the first two channels of the
> PM8550 flash module. The flash current and timeout limits are those of
> the vendor kernel, and the torch current is limited to 500 mA as on
> SM8550 QRD and Xperia 1 V.

This comes from the hw spec of the connected LED. Please consult
your downstream DTS to prevent potential damage.

Konrad
