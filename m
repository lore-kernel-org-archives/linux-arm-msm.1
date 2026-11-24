Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537089;
	b=Rrpb9EpDk9SgJcp8sR6T5dErSnTKKFFhF3pGOS1VowxJwe7yCSUUdqcZxd8WPdDBsSh5
	 HD+uKc3iiGyTU+zx3GZKYifbWDacXK/BxVJUV7JtvEgFuh6oS0qHW16JfZiuWzdznjYh+
	 DcmPyq73GDS9ceWQsur8UzaIbrv/N1Jyn4nmAX/2ue0zlRFIo5fzF8IrK1ubCdWPO5omP
	 oA4PvJw5YAcxSsTawFJAx/IH2M/7Z2GICN88C5nVT/bUBWwi05c7K9GXy/v+p3xBOjkmb
	 qSC1+H5OF9ebo+pBc6/THnKEDLial3qfvA+Xu33l99kKzOtMwRWpNm6/twMP3j6cubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
	b=XgI2sm/ebLa/111NvzpLBGLOgNMmGDj3n4bK7RaVUInsllpncPg9vGsqUIfxyx78J0fz
	 qyIlvy2E4ORsLNPgqzdSFSWbQvfdkiQnzioFJKsOd0KZOJOISfJ9hl57btDt4kqPNrzWN
	 Ha2jOIXBbpEfMrFJPf8EThV53ZzcnExTvCrhMKB8xE32KolaKD5MGJNwx+NhfRBTxWg7u
	 WOfk4AuW/JodA6McdJq9wazviaE60zHmyok11lItQPc9dCh3cQprAYfx0j/43XW1mycU3
	 z4/KDjRmxcJYEEJWfYv5frufUa/RPCEoFntCyXlIliWq243ztERxeVDIIjCi6SRj/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1zxCyTG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPNn0e7i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E25606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E25606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1zxCyTG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPNn0e7i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLIN63878762
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=; b=Y1zxCyTGpAvkZ6NB
	xly8DrIW5LJjXev3qtS2NiGeIjjmoVTHcPTjAvLPJNiUDTUKMtL4h5jmBnBcA60S
	+UoIMuTMTLAs8SA10xb2pgX71vUHZqrC1zGkyLpTjZpwrmyP6mrURDicTTvEI9cY
	uheYfkwHhs9xWxsY0bbwjPfKhSWT383YS+0Um9mGomRiuZl+H34+pgfDRdNTksKz
	M+2JpjkUGcxEFVbLEUw8eEyMuWjqwq2mY17exIE4eX8W/jJqXlaFICAsgNzyizZZ
	lwhZNKoDNXpv8I3rDtkSg3tTb3ZfWTJAD7vZZ2xD/SqVt1/mKCXr0x/iNqCfrxhy
	y3HLlQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy13sfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:18:07 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4e8af48c8so64483247b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795537087; x=1796141887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
        b=UPNn0e7iXFww84wu5/gMpinOU/gTOsk4g7GNXMgY2zxy+JN8DBqMuyO3ZTHZPiMCIy
         4zqs6t46U8+ayDhnlpe/2o48qErfVe8tsIS4xOSQQDiYeCmtpbNyN/CO0M3QlRcN4BVo
         CRKRLtLg8+Mdc0wu4o0ini7OrIxD6fthYm012jgdvx7+NyBonGchVvk+AR29Mjr+yDHt
         0s4y9/zVKr51jZhss8WDWsHQtvxMR6H9txoOrj3X5l4uwWbFJLa5+tsdJLB4/mOADel4
         2C+EMm9Ep/RijmyS+Sbkhpb/8uRoxGU7POQj09FTxeJT4MgvYjWFVMngXyKuBCZk737s
         ZRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537087; x=1796141887;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
        b=lL1XsoV3oh+/Owr9fFJlKnCqbhM5dRtbpSq37YyAU+gS0kX2FPcRpwWv+PZlEcJLOk
         Vxrhp9vkfEjIze4QIsNUTNAFXjEugeU+M/I4E/N6cQAgoUG3+k+I/P60o/kW2VR//GR4
         ToPVy7qsjOs9M/BBWv89qDEq/bIUbnXaMwyfqiDnXCiEmqtlFXaNDbR2O0VzbDNBdhtU
         ZhRLNEZ+4WwhA/NFzCDYzX7/zXEwNSfjtTW1i6AkdxKl5U/V5xU8HyyxBbBJqKA2gMdQ
         Dqp8ck1KECyNG+EpiAT2/z/eT/jE7/HPFTmNubu/N0kLuIbtYY3BwsvfPlleUAzbGsmp
         65GA==
X-Forwarded-Encrypted: i=1; AL+hErECPL8V/y4aSUS7Ad++WTY73QhIC1kQBlUFTSQ+WiltyuF2jS6DEIm44avKdeOT0rkPnnhcD9Ar+yJl9OnX@vger.kernel.org
X-Gm-Message-State: APuU4Z9fquB/IKjjWfta7Qt7WMFb0Zbvd7kIHV2fpQbB6CcYE5RJ0PB8
	KcW+yMmo+eNwpajhwnoV8de1G9rihWK/3RoE+4i0QjqID05S52kLcIKr6WUL2v1McecauLyo+mf
	OjiTYWAlpk9rc+g5978gOrrhgfYDPfkYCNwzBA3wPWUZIvyzeL/0/hkINd9JS5SKNqgGxZQBn99
	nF
X-Gm-Gg: AZFdTZcXCLNLUCSZcQHRX034K/okPyGfWKJloRflL7tLqqhrDPabBz1nbNSbKPy15iP
	UQ3d1VbS6HBrow+36ius+6X4z8TI3NCkL0cqNUqLQVngJqQyS5N/YYIzkog69fQgPtJVpfbTurG
	VA78QTShsTbo9gPvoEM1i71OddMfAy9ftwSH3OmH72HF1DLdx81X4hNWUYCawvNE5B/zpxfwuoH
	+t1oK+7aRxUt+X0G+z9jwstVyt1hGlSASIBUEdpwk5VZHo+dyQlgdtB6/HumM2YxeRZkLS5VLO+
	Rr2kZQyH9RB+HKui4JD1gtsEaMzHU5bnD3dpzEplQi8Upp/zj2muS6NxbXJh6byQz44YcC7xBs0
	O0x+fDbj9WehQSTEqLti5yy81iiD0PK+Keb2wy+QokdvWusVo9rJO5XwKXN8pX/iW2Kjw4IlRv1
	pZEtWzD608GYgFuohm3tKkUWbCu0mQtAB8xEBhfUjygtQY
X-Received: by 2002:a05:690c:3347:b0:8b4:da4e:ef09 with SMTP id 00721157ae682-8b520325401mr74603847b3.1.1795537086946;
        Tue, 24 Nov 2026 08:18:06 -0800 (PST)
X-Received: by 2002:a05:690c:3347:b0:8b4:da4e:ef09 with SMTP id 00721157ae682-8b520325401mr74603667b3.1.1795537086440;
        Tue, 24 Nov 2026 08:18:06 -0800 (PST)
Received: from x2e.localdomain (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm58578567b3.34.2026.11.24.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:18:05 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
In-Reply-To: =?utf-8?q?=3Cd92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28=2E1795517?=
 =?utf-8?q?711=2Egit=2Eyadu=2Emg=40oss=2Equalcomm=2Ecom=3E?=
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> =?utf-8?q?=3Cd92?=
 =?utf-8?q?391a0b2ec19bd4d8ec0c4eb988cb0c8176b28=2E1795517711=2Egit=2Eyadu?=
 =?utf-8?q?=2Emg=40oss=2Equalcomm=2Ecom=3E?=
Date: Tue, 24 Nov 2026 16:18:04 -0000
Message-ID: <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: _ZjaJ1dil4sfTr0LAl9HySqvWb0eiKFT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX33Fb7TWfbFcV
 yKkaHyHCbunQeWTgYLXpmo7ww1XCV8z8djmwFaOTzSDZWqM6UXW2DaH+b7jPfXMYfYLGeqGR5Mr
 iQZIYJ0StsugUJ6XalfH7XjwSeLhIEU=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05b8bf cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fLBBdKZWtF1Qa5PrkOoA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXzsjjuzvXey8f
 3rW/7pogHCXTMWsrDeBJB7D7GUrMUXdwpckQLfLMH77XMS6/+qFE+3bQd3XjnH3ubty+XxU6NyC
 QYRVT3TwO/yp1plXu0f0RnbgCiDSKZIsz4VgKsYEunIo5Hn9chPJGeCRRnmqnpg0srF5XbtO+KS
 BYeok9b1sOg/MOcEL1yd1S+M0jwPZqocSXErdkoDCRD/darxbvPEfqK+QwbUhtCJ5+ucpvUNQmw
 HK82YQ5MAqpCiF/WfBYJ6fbkqkqWjMCkhO5dXuSlfhafHvd5IhZYNDKBTZXK8EWF1gtmX07oCw9
 ZNr+iypziDpFKmUoLRjPr93nb2ZBED9C6guDo9KkDqKxw35SRtESYlMZ+hVx0a5yasN5QnC7bxR
 4vifh1j7q8WuXseHDGWEH2pX8/OAc7sRq9cM5OBhYPrVAZgQ+OluJmrO/xADK61LjxGHVLHyfM2
 nI3/V0RPXmFile669og==
X-Proofpoint-GUID: _ZjaJ1dil4sfTr0LAl9HySqvWb0eiKFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063

> +				arm,psci-suspend-param = <0x0200c353>;

On Seca Ride SX with stock firmware (UEFI 2.5.5-00052) this resets
the board ~2 s into boot, on the first few requests for the state.
0x02000153 works; the firmware rejects the other variants.
The downstream Android kernel boots with cpuidle.off=1, so it never
hits this.

Is 0x0200c353 supported for the OS here? If not, use 0x02000153.
