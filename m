Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163820;
	b=ARqwG1CMoPfY26iCBnxKUt9MMPYGvIhe0Vpr9eG/QAG+ToBDSDlMrPAr+V05GA1BI+4V
	 bzTjZyz90X67QELgG4GmM41G2p77liIWyBr0ovjkzgULIpcc8hwe5/WbggXkzw6mD11vn
	 l5ZTUM5h2ZPprzXZTZEVSu/r0RnUYtpKnmIkd8VtVJwlCm8V6rJMlsdg4Ho4ux2q4lqk4
	 EfqZ28O5nXZ2jf6hG+2BvYfk555FtQKRwnU8bJ5yQTEpatv93giWJKmYHDtuWYz8GteLx
	 rjT4qvIMQBgBE1gZ2qu6Abf3RcS/uSBYgxI+6MOLP1Woh9xoAFOOO8R5kTzfoa/dSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/LvAr3BbXaRFsNH7WIibnZuiPeBJRtU12clkeRljYRc=;
	b=wwqlxoSGfL2oNHfikSUE62MgcqnfEUVi4d02Rl446n0GNWnj7pJmrQXIoTLQ3qPwp055
	 o3vq/XjUYHFSC5/yGqtyI4aFeo7BgQQJxKUxLX6EA6z4oatL4PHYuKTJo37sq0YeS/Tgi
	 PWt3GoYYTPnUG0Q7rTQlCI4g2YA1gwTj1aveDDCn8ay+SPbVVsYbT0kHNoKKyfsCx8Qfw
	 T6H/TPlRq5r0/MebrKtPH3ce7w60M8pPz9sn7OAy0RzehTJooByccbgJ8uO30X6HlaiP5
	 0Ue/AG9+m3jjkDr/KwAmT3uhPUUQU1ZpRrsfYnrso7fM348tYLc5P59XcIDMdX7pXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uf1VTMux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KKx0/uLw";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C45606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C45606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uf1VTMux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKx0/uLw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etWF2019505
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/LvAr3BbXaRFsNH7WIibnZui
	PeBJRtU12clkeRljYRc=; b=Uf1VTMuxbK70bP3kiUk9/DfuxZ37IF0jt/l0lFQS
	QbsrruOofSPLVvwf9tahQbJxfXKVlxe4QtFonl+W+ssKVekQYO5bAl1b7wGz3jBO
	axsiMWgEGFHmRqvHiDal9bDbWzTSNXroqDbNImLiabiJ0aOX13SHE2lJ5+bq7zLP
	Na5y+zKWDLYEraejq5eqCoeKxqbDXIY7Cz4Ne+957a1stcjsz6pcwNDyEdltwI2G
	hIbmxwNJU4MYFuDj/lCALuRefnm8FlTSqK/v5AAd48TwDp6Gzdb2i7QK/h7DYQtO
	ViW4zXjlxskF25p/gM+SKrCoHS8YXCAQaR8fGbcd+n1Tlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj8uum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so123958285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163818; x=1795768618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LvAr3BbXaRFsNH7WIibnZuiPeBJRtU12clkeRljYRc=;
        b=KKx0/uLwEExofgAmGjFzKmYOBpVN/8jDfupIZ2biM9GgsQ+iDjCiW8+XihojIEo07f
         F5V0mxvE6ePXE/OWz9HuMsFO5LSE+ycjo3QjNL6Z1C5pScxgEfhA0taWafoiyQ+NwkOV
         OD5HkCzjJL7Zadi6E7MjCj1bLd0oJCy6/1GRam6qcZHZSaG+YnWTrOC7oJXZV4ykolZ4
         JIsZuMLTocByV90VcPDJZVSeEV7zg0mRKWTTrA8qHevcyQNQehr1rTiikl1HtflUUa9D
         szBEgL+NJ7IignTGAc3yazfjFfFCEWAiQoSty2GhwUnnbvW2IubP1aI1pGjFyTzitFMl
         n2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163818; x=1795768618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LvAr3BbXaRFsNH7WIibnZuiPeBJRtU12clkeRljYRc=;
        b=VcTym9nT37X3Ntb4p6BGg5DxEl2W4EB1m3Edo0bgYBlkmb9u+mQmpEa31LLMdzIX14
         +wtIcV2PC0VHOND5KNEJkIN4g5STBzdyOiy//aWNRtV+tZ0y0BDE7LHniJURZF9r/VYi
         Qby95iERhUPjPs0YcETAqdt4toarOG+DhQ4aOjFmCduJwVDeVRqKjmkXhgqSGkpQV/SZ
         WyPtM2p+4r+eOBAcDhyHy8ECnV/oqQUufF6dUei/4GhhJZGIs4mEdIFuTe6JfeEgpNho
         KLF7yuthqJi4SuohKtCCChbzTewWb20WrGHgwOXLW9yKxsB6yPkvrV/yQXogzZZ8mCBk
         yqxg==
X-Forwarded-Encrypted: i=1; AL+hErEIvGKnFNIckH6kTCjfCKbK1fV5WRjXvyvvsfOTzvwZFTLm87Uv2JPjovD4vlsN3qDObVj+AP4N0awDrqlT@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hn31re8MAW1Z7Piv268+PdavSRNj1e2thqoOwyluaE7FnHLYZ
	KuLGhD+T2XN8bWDusvjpD66WrKHV/DOVuDw8aczi73xlWqGlctGZOXS75NrNsN1aAcDEjX1uHL+
	ojoQyQ0DpbX51vKscGou7/L/iHNvyuO3yVnpxjO/LmTj/jYV7GZcjR525X8NGoocJib9O
X-Gm-Gg: AYBFou27hUxqqbfaQkfqhjhRPUK7eONnogsZmu/12n4YLuRLNxsbIKvx2434mE1YPc/
	C8GCYdQmVESCXmDjwt91dPWdEA8RMGnWlCahiixzC0DAtbdThYpChLEbt8HLOoZLYZSbxNOOhvw
	mYaeP/zRskBcH2clsGTd7wxyenGmpQuVqpGgvaDJ5Fwznna9lOchIO/7aSbkKv6sm5qK3WBC2iA
	fsbNBxGFsiVCuP8rz2mPyf/hwOQN5cT4BRS2mDO42tXhxnunzebnWf3lkIDgvR7QRrfEjalM1Cb
	IT1y+we/M9DIbhDWSKfzp6l5zCV/uKozp39A28hHJqYA/GfYYVlLY2DhsqA6nTEGZ0lo0SdHblQ
	F1pTPVB30rt3b8Jl8A5INiPndiGoFepPoey99J3pP3D8W8bnt0NtlggfmjmQ4PXs7
X-Received: by 2002:a05:620a:28d6:b0:949:7656:ca0a with SMTP id af79cd13be357-949ba99ab2fmr411424485a.35.1795163817782;
        Fri, 20 Nov 2026 00:36:57 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:949:7656:ca0a with SMTP id af79cd13be357-949ba99ab2fmr411421985a.35.1795163817235;
        Fri, 20 Nov 2026 00:36:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm111410415e9.10.2026.11.20.00.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:36:56 -0800 (PST)
Date: Fri, 20 Nov 2026 10:36:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
Message-ID: <gdsrcec2y7vglhrwe3nf6oacvlxgkudu2fm55qnselrsgetihg@3a65cpxavzsl>
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
 <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
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
In-Reply-To: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b0006ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xToav2RPaKhFB7xxpWAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX6B+utUNi5gzt
 dksJhpHO1o2ycauYdpUj0F9/ZhqrJ7Jv8AuRwuNi5qPVwYoG1f5tCizxY7kwQE1Cev2I9ZF5JbW
 4AmeuDE+r6KwQ3bEHXxb6uIKyxXh398=
X-Proofpoint-ORIG-GUID: QfDmP4HnWQFH4vpxYfgfoTD8PMraPhbq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX1Ci4n/+YPWag
 AZX3oHwyuUOpyuVQEWvL3qaoMI+SjM2umAOwINJl5oWHzpW/GEawRYYH3Ibi6lizqlZm+1NM7Zl
 oY62rfL+2AbCsP9vvvvO3NyAR47uYyBdw3/VKVGDb27M6HM/Yw9A0mwsc8DuAMQW/TN2cgVznXK
 Vo0msyfhWFwx48MUAv0RQxrerqMzE5XPNDvs1ymO2krVnBz3WPZJbi15v05eUhM4euViM8ESGhj
 vZjI4MSIweO85oqxAVeUXTVLB68FkFQ5eFUgop3YNHiO27NZNevmFmJwpo14f058uhYjy2gqNaN
 UUAoCaakvpMW0IgKYUWmGuyUB75TNDM8MU/uWhs+NNap+JoYEbIUyzdFmTrGCu64L/UNzUIfiqy
 LxXV1g0Rk0++e5JDHVDs3jBrX3wRX4T8vUYDIo2hnlbLHsdZQWAiwUxmOX0O7R1RndeTGHVesKA
 Ani+97XNSE2Av5jL+mg==
X-Proofpoint-GUID: QfDmP4HnWQFH4vpxYfgfoTD8PMraPhbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

On 26-11-18 17:08:54, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Glymur QCB board.
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
