Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102247;
	b=B7Cpuh9g/ZT77Fz1LKHtTyU8IVzavmRQfp6idGiL3ErW4cdATT0fQWcWKYVS78co6bgL
	 iGM30FtLcjAa3CErblrk2ZU+SkmC9Y7btlLdDkCsAXPZwfldUSAjhTYf5jQS+VM9kVSHx
	 NHJa+mesrY3uKqeORGEPP36Tx9wBmMrb9t0bE9/CyV7OHTv9dO1QWFTFx/RZfdGSAnc3O
	 xbvwZfC461cLMK3sIiehatT6EZ/HQfw9Ahf8ZTgF0tVaG4PxHUCGRNrk9fGtt64SszULx
	 cN/qazSCGajoouUAJcdpCS5InzVzWRg1qxEtqKdpH4x/fP0ieC2pdnOvKVFLlq9wAnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
	b=ok4MNykEfJoMgxsbBq1aQC4LFk7EQw9F02leEaknh6QK8tn5pzhqHNxvhn2oe4jTTZwQ
	 hCRy69e0ysT3qGgk8XhQopKUCpu0Hf2JjP+R+7JRPLAa7DTbyR9vI2aO/ngDscCnajcPq
	 W0tNIDo1UVIPyHCpI/rBdHTLc1DoBEwrhLdV8sgADQGWiHEdgod+jfDYtZSSTRLeIErEg
	 JCbL+vnb8Cldk3RJ59sqgEskruVUFpvukMgud69WQ4+CKMnh/QX6BukN18AQr3mriUVCs
	 dFcZb47IanmKFXvYo+/EtTez6DVozWGnBZdX1NkW+k65gg2fuIQ7qCWO4OOVuusloAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdR0S3NP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djj2hMfo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AD60A2603
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314AD60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdR0S3NP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djj2hMfo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6T4Q1145634
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JDnpOn5OCiSx6f0pLbaz7y7d
	NDOSBAwzbbFSOhKoCsM=; b=jdR0S3NP3CDw2weUvX+xbH+OzPbLEO+EoQtdhVMv
	fCqCk+8HQmsCRIB6pZV59ZHjFwvwx35kbo0A+FJGYN60TfB6JtZPDzDptfFPjF64
	tNbutxnk/dUFOtDtJFNePcT2NGY1kWGouZJgUomFy/D0NxIuabI4Vn4LfKEbGAvi
	f5WuCnfAKn+S6AayrKejqaDS2KCNDGcrBl+D3WxfSPh0ahKocX+pyL+inC+Labmk
	XIqQ5HbDSAJspyIKHw7RRAtZR9GYW46R5nyqgmqqiJq7TNNme5h7KZfMBhrbm3Lg
	jz6p74AxwuQ5nNoO2tj2oDp8rmBIlY8A9a5JwCLKVjEV+g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x709gyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:30:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so651635e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795102245; x=1795707045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
        b=djj2hMfoc+MAoyITPNWb9uoUa6mFaXQaZzyFAaB1YOumWQHY8ALSaA95RGQabh/Cle
         O5D0BtIfUsxdPlRwRM4yh4JKPHmbHWTxciS7q4O4H5XgOeAV/iTitBtkXCxfKSwOax40
         Kcr3pYFUDsk3K/E/Xs6efIM6793RlM682EJWNC2fEmn6k1zEbXAaSsJ0gWn/eAtwwRF5
         tHrgTHiaDiOs0/6mIeCkmVL6c3wecX8WCAZB+3JkM8+XuX5kX6jaSh0omYpMsz0rl82e
         6Tx0W+iRi5KMPKhLRHuTrtADohaegZvWvCknY/78nCleslqktu4voOAwrkHIeS9mNs47
         Lekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102245; x=1795707045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDnpOn5OCiSx6f0pLbaz7y7dNDOSBAwzbbFSOhKoCsM=;
        b=MsnhVgITU6yUhN4udE/DFGnnQ1ZJIQUbrBX2kxVG8zjKiz6avf7ImLdvWKoIIlkAta
         080RK7Brr2gCmf+OKdBhPfC1GMe6qZ3sosQGOPtF7OFxMOtAtjqSJ1Uhtd9o0baud7u7
         vdlKE83dNroMrw3TIExVPgIoZjWqAre9a+f2MFjA4gEqmen6aDT3jaJGlx2wXUs7DjtP
         FZuv5s6/B6NAG4+mRSNsqqOV714kI/KdyqHDJB1og5oQsM36jHdVVB0wLSc8Ibjzfn40
         AoDuSJ3f8JAh375GRtMIXANU4W6GWhlR+qkxjiWR8znP6F6ZA3ISmRljgKxhMrOYICCg
         VSSQ==
X-Forwarded-Encrypted: i=1; AL+hErHgrS1+zjvChvTZGeGMtwJTQivxvlRU4Ik+hysgf4u1EzVr1lG2y+bCnAr7LUK8BsnLMZOAFT7W75MrXhIf@vger.kernel.org
X-Gm-Message-State: APuU4Z/2FZyQemIiQcieaVRdzGVIavlH0x0ahTxjS76gniNdQ5HaZZlu
	HGZdCZBLjNs+09Ra5rSRYpX5YZL1vjg8L7F2s0iUJ5aBDJ6+f+9DHDxbOCO/OiOx7f3BdfEIQ8C
	zPQjCMGImnhZUR21qDVdLOhJjSUVqECF6MAA2nKVypp6v+H0Q5/uWKZ5wcH6jGL6UdPpl
X-Gm-Gg: AYBFou0ZQLDHEEQ5OyLCx81NQ4Bi3QI+k0s6zwyjSus4kVzeJSMvC/8smYBeLK65quL
	BfP6Y9jsppDwPZcYGhN2OOUOUmnh9iMqttfL79Ev080Z+v6GYwMIAhiifaaVsRSzQQsypbc6RR+
	8C8iIou7EGytBQDe+QUtfZznY0y1ouah8xqdpAcsZQUJMt/sW9NfacbvO8yAWa4YF+1LDF625xv
	c+ZhG8h75/UOf2jmpSDK0IKIR1uIbtGSQoL8sIPHez/ITudrUMXJmVAQTyGwAPTYYWMwL+4mZ8i
	70Rxyjl6s9M09qbYS0dpEBUWMYq1IMJRtirgBW1keAQDowZcRekg+9QY9/3fasw+5sgs2Djaq/Z
	yX4wtpeFJjobCQwjETi0oPDcij4YtIkvSgwmfThNLgqrkSvQFMSMzNcwNI9rzR2stjkGr79fEQV
	8n9bCxO//Nljk=
X-Received: by 2002:a05:6122:e243:b0:5ea:de2e:545f with SMTP id 71dfb90a1353d-5ee8aea6c15mr5869e0c.8.1795102244738;
        Thu, 19 Nov 2026 07:30:44 -0800 (PST)
X-Received: by 2002:a05:6122:e243:b0:5ea:de2e:545f with SMTP id 71dfb90a1353d-5ee8aea6c15mr5775e0c.8.1795102244005;
        Thu, 19 Nov 2026 07:30:44 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm75672515e9.2.2026.11.19.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:30:43 -0800 (PST)
Date: Thu, 19 Nov 2026 16:30:41 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI
 engines
Message-ID: <av8WIZjPgnS8qWNt@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
 <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5poepxkppbiyfxz2dxkjm7p7xiq4ndoltsnnbqlp5rdasbvrxr@p2ocx5b3kubj>
X-Proofpoint-ORIG-GUID: _Afgh89sScKUrg6yDomd7vPHVqONfR_3
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff1625 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bQRtwVpyhJfczlGs_sgA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX0OVry9aqt8rT
 Dc08wD/XlRYAfiB/99HXNzz/NALNBw0xwrcEhUl7tYR5XrDuQ8Ey/brikGt3kabPbmKBRB2rXlJ
 gqtik/u+PjSVxzRupePFsNo2Vh03y/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfXzmKGcgF82spr
 aCCiPIl/rYushLhV/IOX1c1+/GhIgvdmPMRtZVQ+D5Ez6BXqu2TvaWs0K+5eROKumwmLLEqilfB
 bJn5cul7JL/MDdfi0ozeN5etlHwJOPWTzFdgSB1nCyGSSYC3LSx+c/Um/x+Tngr4kr4VDei4sIQ
 +PkyWlJH2KafXHge8lvVOYyrlkYVdaM9yxXDZOLhsVKf+/awDSprKaoAYmiT6agVDsHyN/0QZ94
 ShiRtmg/3gABAe8VVuEbQ7i7lig+naObmaMwKySIha0clKZpr3HFuGyX+dudYPpm5KEsBaOZMee
 efRTHSiGZ1dECRJGPAiUhHdXU9+1AyOUG0EPrAOabZAoOGfiEwyRX3mfNRcJi8p3+ON/4CJzsqQ
 Sr8eMA6sGh9DAJ7FuDGnbDkKjyvisN7N/tjkT1dZsVz4w9SeDmcOXAgBg3Tpf6GqGRFYdLSy8nk
 a4/5s8zk5uBsXrKUiOQ==
X-Proofpoint-GUID: _Afgh89sScKUrg6yDomd7vPHVqONfR_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190061

On Thu, Nov 19, 2026 at 03:04:11PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 18, 2026 at 12:24:07PM +0100, Shawn Guo wrote:
> > Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
> > I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
> > and 12 into the uartN nodes instead of their spiN siblings, and left
> > spi4 and spi14..spi19 without any. The UART nodes now carry dmas
> > properties the GENI UART binding doesn't allow, and 15 of 18 SPI
> > engines can't use GPI DMA.
> > 
> > Move the channels from the UART nodes to the SPI nodes, and add the
> > missing ones for spi4 and spi14..spi19.
> > 
> > Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Eek! Thanks. I think the comment from sashiko needs to be addresed
> though.

I think sashiko got confused, no?

Shawn
