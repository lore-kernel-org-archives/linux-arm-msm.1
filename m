Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216429;
	b=wC5g7p9aIKYxFaLH983T+jtC88PD2uk3xoRKObWbQbTL6CY3c23NsbKDyinBMz51uraN
	 iduFgLTdGLZV8s8Fq3LIhvOQCkbIUWb+4JC2zCR8ktkBXTwJyoTDS7mZhwJOH3myfUWsH
	 e8LXPoHXqxBHqioPEor3HUKYQssWj9UvzT80QPddSOFa/HKlZb/YHKByxF0q0Ye0VJZeG
	 Nycrdb3ejpIAX7SQKdWog7KzpI82OImpt46a8cd7A+pNWHVOzEbVFqmtXx5tJnMdWQvxV
	 29Y6xYf0QXWLkD4SqqRUgw6kQFDt52gEqnW6uOwaw9i5TAglpubL55Lkff2zr0TTH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
	b=VddW4Pe303qyahUDwvVQQyMW2m5LmyD8NjqCyFEqvOYbzkwelsAEmJ/wLb3zlsa6xKT2
	 7XkUk57Eb3lVgrFlgOtscy8ffXJnDNq8o+e7cF68Ov0Qs++ym82RBwE14qiM7eZOjwAxW
	 Fto2W6DOfbVViwZ4ooZMF62XNJDhCDxQVTb+rHm6kq2gbRoCTFeRWWb78QtQzuBDIBmSi
	 xDbuhAJxPEJpKG2DjfWpMyT0tTYvJOgQ/LX5VHLx5R+mIOSHLp2IsYN5Sxy/+9EVjaUYv
	 ohzyuGv50Mxw8mgk3SiGqYdPjLAG62pEoIqoBNCrO4rA25xYRqFRd/kG9Qb9QRStG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMQwUUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZX4p9zj9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D4606A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6D4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMQwUUU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZX4p9zj9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969pbX480719
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k98AldNnLDpToTE1usQ6ljOv
	dKlSyqcs1qtKA1cJ9KA=; b=gKMQwUUUEeo+I3aMqxy/wLQMDWMf3z2dG+pM9i+I
	V9+diFjLR/XeoZNRr3PTTXwE+xloGrPDuuhtRIEePQt3y5Tq92n6Z4K6PWB1wqYa
	NG/ieTLs4M0FJisJp79ntwFPFDLyfBsasZ8wYqZvsS8pdl6K+yYBLCApF/vf/lmt
	vluuc4pV2/bi0p1Fb1/AnqRXtODTQ5/TTZSLoPGNAaq1vIIf5Ue8syUDRdqXggZN
	SkCqZ/9YDkZxPyGmbrAAnRGS7Jq87wm1yrn5OQUS7NeLEoSe8CfFGN0KA5tXpTI3
	N5YDl3DxaQFfBXRDWnPlLZ8cVn2sI00GydtCUfFATo1dPA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsds3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:27:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso301826241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216427; x=1794821227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
        b=ZX4p9zj9dGXijH2AbxFDPHV1E0Xw4yktct2m+rawz7JVVFdm7A25Dng+dYruLytAVA
         53JRhw3GU5XNdtOUQDwzrkrGsdCdRWbU/dAam324fyR6V9zrl9uYNA6WImoRLS0ttglO
         kD2PbNfTXLr+RGy/mtSvb+nS/3H68tqgsjKC997fz3gX3C7RECjTqNudnButzc86cbgk
         BqlR5OTw8nLXzLruk5xkaSGGO8zdhcSUef2Xy4/LdODI3XUmjmfXc7iVSjcCcqakWFkY
         PmCtI9y3ejsiqJKZFBC8NkGsd0TYl2NIqOvjyHUwU3NiztFfQW3ku2MPsrRZ+0Kq0cCL
         NVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216427; x=1794821227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
        b=sq24SVefO8azFoei43Wk9NDmru8LtbLF2sCRWyHdAuNX2AebLfx717yXz8IbWiIG97
         WUXztNuTVolgkASr96OCejMXefxI95qOmo1GlCoDTUxWxCJKIXFuyYhb9ombJYDMGZWB
         K3p+3IKgABMZ6IWLDbQJOrQ/kl96Lq/KKjuHw0w+oWfwxxaSIG37q5sKUkhPi9gLVZ/C
         fA7YYM8Th4IbWesuaN4Uek30X2rPvH6H+IaFP1l3qhbvq+qsKx5y9UT3/zdWWyJG6Oxd
         OANVf35gonIWkr3oWvPn2RomxO+HB5rAnQKwWqBfJbXne81/oYG/LBEAPAqm5kZNHZ8o
         4ibA==
X-Forwarded-Encrypted: i=1; AL+hErGaideUCSnGgHThm73XYrgLdbEFATnqUxb/aZoExSV2XEdQhLDN7Oqfju1Wy8jA5F6vhgmEzu4VPcYNSENP@vger.kernel.org
X-Gm-Message-State: APuU4Z9/SSAYSQ/cj73awYtVocLSUzx/lC6Y1S9lp1gKg43WGzHWX8LR
	IlG49CjejGqs3zuBo+F6Er0HA1yT8HLq0ua9Wu2FlzVLN5n7RJbZd/Z50eG5y21gezcUfQ4X0Ki
	eCixmPFhrSBGVbwPVG18wswmB4nqnM2MQqfHyOSEAQqJE9ibtRZlYXuna/nB7FFLvz0g0
X-Gm-Gg: AYBFou1GpBGx9/ea4cOHUIzNiRgZGC4Oiq4fLFinU31HVYJT4fr5/3SnXYd5JvKX7No
	iKX5qfkmdhc/KiXFDuOQsE++C4Xb8aBkt0T3xr9cLqydFJx6vn3fUmkcFNtZE9cY0zJXVF6npSZ
	H871ZN1A+DP9oiIHitrV/RA8d56fr5nF1pG/1Pq4xI2Q+ro/lFtB6X+7aU9qguGzsmxw6CibTHh
	3N17zaOHCBX5YamHF8ua2nuo1Z1JTC2L1UptN0cSVyMQkQzvwryqCMECstPG+9CK06y+YeB23HB
	eyoogZnpGSKKLTYK+2rG4v/2gPjj004+xAZtIemOqeu7Ffh0h467iiFV/4j6LuA8NEUTLaUDHxu
	xYWoDAhf+GUwG3oJn+/ryOXuP7i2k1tazEoWCHxtPFugQ6uHk7Pit0YibxZaLvt4=
X-Received: by 2002:a67:e702:0:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d2db13142fmr682428137.21.1794216427370;
        Mon, 09 Nov 2026 01:27:07 -0800 (PST)
X-Received: by 2002:a67:e702:0:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d2db13142fmr682404137.21.1794216426710;
        Mon, 09 Nov 2026 01:27:06 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8477370f8f.36.2026.11.09.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:27:05 -0800 (PST)
Date: Mon, 9 Nov 2026 11:27:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
Message-ID: <s5rb27nhurw7arvnem4yec3z65oscezjvlj7flmywcjfqjgyou@25v7efso7zf2>
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
 <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
 <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
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
In-Reply-To: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: F9s064ruMPv3_wItQUtknJEDrQvZZYLw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXxi+T2oC0eMSP
 Wq92FlY+U5a6LxL11I0LvV7sFJMArdXPPovCmJpRpBu4mXb8PH53j/Fn62G5qKQ4Px9xEsZ3Z60
 R9sg/1joT88iovBRrOlTn68F18A0vU4=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af191ec cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=n44UkhTd5bL0-s0LC_0A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX7mdbLu8qSNbw
 UTPvt2pU/a7btdD7onfEoRGEJcR/6AbEdWlaTnCG2v4qwOROt41EmJSit34lBXlP+sWsUQiNBL+
 /qSVBHs0FnH3WItWJGwScWtphWLLkmXFc2DlPJcszUREEgj1RnMvyWtIObUa5ziv8BpwnVzWv5W
 B5JqnvF5oD+uxo+ZV1/r6uoj8MS68HjSlnhH+4JW6X3ijgJPkAckcPe4wBysGyTsioJWdVzu6Kx
 YRITcP6/ToZNy2DHoc32aKUrQ3DFtie5sTAB1L27mlUMUR8QPjBXp8O1PGbGuK3udtWu/C/fKfO
 Pihky+DH1SH77LybFd+b6WKPUIdvtWiPOMl1ZS964jHCXynrpp22b/dVsSxzVAGdnLtV6LFlgqW
 xbf57Znf1iaJ2Gq2PYmBeJEBhgUTQ1XmAu+myvYBC7DplIwYp/OvUyhNkfQ1V9s1QoGVBJgndI/
 YHKJdM9XdvcbJcOMM3Q==
X-Proofpoint-GUID: F9s064ruMPv3_wItQUtknJEDrQvZZYLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 26-11-05 18:51:44, Andrew Gigena wrote:
> I understand, I'll keep that in mind for future patches. Should I
> release patch v3 removing the "Tested-By" now, or wait for other
> reviews?

OK, now you are top-posting.

Please read through this:

https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

You can send v3 now.
