Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105895;
	b=fbuqRIXE6YgiwdUiygySzvhsKmHVHuEdURiUUUnd3qSZLkAS0Ldt4sq3fkWlLrZNJfts
	 +Sewg7y8io+GMlNaUDJdS3DY0CFu8ilrgaCzJlR7GtLJ7SbqXdz6cL7HZdRG1k6JJ4K1Y
	 x49dDN3gsK9T8NE2sDT0qLLi1Z01eVXzN13AYRHAy6jN15UgH8QGcGYsyG+V0NKCwMAQL
	 UUclfTS4teX+zullnp34wYoZHd8qnp7w6tQNBgAXuY1CU8OsRQHs/2QASI1cxAjReqVEC
	 aA6fBbJKUjUfYIkFC4v+ZbFwRCfKLNczr+p8JOybafNXQll6pfwxMGpJI1KY04I4dIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=;
	b=RoBr7MczPj+t9S+i1sCNjVzQpVS8afafEuv/yLpHSFfVNPVYfMw++sZdhfsuWl0zT9iq
	 nBV5N8T8Rno2zWYdJXEbVv1rEB8pNYWJrLKafaq3B8/X2OhlCxqefKferdYhnn8ttOIvi
	 wNRNJFex1yXZjHpI+e2E1R4/00FYRzqdMM3adWzYm4G8gaYuMwUcRogwpQj+bubEeMAQm
	 iNJ5zr5jxB3P8Ce86YvgRJvJbOZguhJXOtkPSq2J14Lfq3r8avxuRhMEaMPLLf6DS64Eh
	 3uJ9qqsU3EuTDAnSIKq8N6SwteaiSjjzpuMZ2I4S2cEHbOOrRJ6W4oJSP/H4MQyKHZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P9MA/qYH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RejKr7b/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C743606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C743606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9MA/qYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RejKr7b/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2sk1974129
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=; b=P9MA/qYHtdMXZDJX
	2SkRFZE5EdlMNrjSVoyL7HutQg5yIGTeT713yDq7POMHkuaauvnKGJC1m5l6GSUt
	3RHN4ItWo5rO6CYTONryUnhLbyN0vUiSB/65jNRgfI8ijqDxIs+CSf/NFkDEFcYC
	F9Yvqasjh+Gy40+FB13Ryr4uqQfol1iaFuie9bLfppyWire0rcL6/TH99trXnlBX
	6XM8OFjHars1Fn1l6esJ6L837/QvxP9qOc/r811zJBo7t5mR22q+xcY8+0p+ZWuI
	y2FIjHY2GfHQvNIf0h+7moWT9UbkBRkKOkKfwG9at17J6/ipYSXbcvIW2VqgaDtR
	NDbypg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gmyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:58:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so43199785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105893; x=1793710693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=;
        b=RejKr7b/O74kcCFPNXjqHJ/bgExN6ISGoHydm5FJTbTaa/Hzhs9I0sxVyRqGCBqxG7
         sNktFscAnwTRkWyuJnFMYBHVBoOQJpw4ie5d3q1sEBQ6PnWadk1B77oFKxgMvUqd51B/
         4aLlONFASZneVpTTZdQowMjHVL7J6D6OkjuyIjiOiOeeSPoWJKFfmWEtX26gpjj1BeYW
         VocZwxG4FFFJGwbYyklNTlFNq0+Mfx52jQaF6+pRvZCB/TXLFPJtOyZIUCQ11gonNfV2
         LBr2EZDpgbO85dWUVJ5lYjvDo+qIbxoWfr07kj110btdmQ8voAVe00M6W3D/EN6yli2K
         3rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105893; x=1793710693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=;
        b=ZLXZr+xPJrbnYAnyOTJIhSTXFCFmhSBHtoquS3CKmPF0oDfHbxS/784h5RBuI9bLIN
         a2wV8VgBbvpZgjKff8vLsoOc1b91AtZJ7vhyuyfu/j/c4nY5+Jaou0UjNhChTQ2PLnw9
         6X4pN9e5IZLQLIIhrymoP5zhr/3Z4NpuZ1MdEtXTKlBnL+A1KIb/FY45V5D5nXp47PwF
         fyLc14yeKDLE+9GxERCbfN2ddaVa0h0cXqy/+3nQusllUHVMN2h+8g+U8lO4OXU72ZDq
         SrNecRORYMDaX2dgCI1dPfVKb3WIKMrQ0jGC+9Iz1w0O13v1eMqlHX649L0CxXQiahWa
         BTpg==
X-Gm-Message-State: AFq9FYK2Kf54wHn4BuC0hXKEQ9aWguhND13C9Fq6enSYw+rNztYHG+Ii
	zbgmoeYemWVnzXSQ0DCeKMg3uqSW8sbvx7gB86ugdZ6nrX0+1qkCDztAlttUVy90XexWXanuSTd
	zYo7PwkfTebJ8lVvLgdY9IM3R+CPERZkGSj528DJtfDdpz0RElfaos5ZS1h+yLNSRAyhH
X-Gm-Gg: AYBFou0XA305VtUriad20nKDyiVsiXXJO1dDx+GcSoXHNmn73rVL+PAbcr3vZaCIPzP
	q4HRZJ5KRktH15Q8bYvtQWpJ65Epw3TPXTOYMiHEg9s2xH33Imgx3T8ByQYNfiftltRp8DXs5Ro
	Vm79TwQJRSJBpcRGoEmLwCRfuZ7kGF4NeXpIuBOlU83J8lvpdu7gQF+Mppb/h/BR6yQY6Y47RoM
	VZ4sb+8wm7lhdktzvnLcM53LPJOFsFeRWwx6Z11wBrCvFx6hRWwsuu1/3T2mySsBMIljZOV/fw9
	zfQOwlHgwRSarpO981RLMKlFoxx9aHJcliV5oB0AlpvBWij7mvRkhyZ6iCvpFdVGdffiUnJPgok
	rrrkDQZqC+U8oIu5wUqWIpA==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1501400585a.0.1793105893010;
        Tue, 27 Oct 2026 05:58:13 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1501395585a.0.1793105892437;
        Tue, 27 Oct 2026 05:58:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm448250266b.64.2026.10.27.05.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:58:11 -0700 (PDT)
Message-ID: <5b229052-ebe5-496b-a21b-974d7bf3c5f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:58:09 +0100
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
Subject: Re: [PATCH v4 3/4] soc: qcom: smem: validate private item payloads
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-3-b0baf39c6e01@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-port-smem-v4-3-b0baf39c6e01@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae09fe6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jyy8ADtZjKfwQqIx334A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: m7cnzvx3cExEt13gpNvh0cRuZTgcOSvY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX+OrIl7MPID2K
 AeaBwLzV3JMcXHxh9+tNmLLCP8mEnPLNMeicX2cxyBzs5NMBmoegCGHTEiUrKsAnavYXQxG/y2e
 kaCrOuV1xKtjgvFswYpSAc8GkKWqKTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXxbWBBsyZAUrK
 G5ntRtcLbm8Rxh8AxOgvE3quYc3OLte9a0DoFnDYmMSkOuFLkF043MLvLgjuzEfRAKSkSeULm4O
 OJRZlJG97mWQIQI7lFYmLYbt/yGRNnK1ya17GhxsYbpeW88KQjaqEsBhmFNJAenC92ykTeI6/S9
 dlSIi3AFKsio/a6kJpJLo/n18RMDRA+MVza+O0k0zgLjKPtpfzfGPbh0ZNWbHCwaesmzHXM8/E0
 OuA9c3bRsja/idoDCYLyUhGi6WrhSOkpOF0uYjf87z0KHyfIKe/B1zgXkxnu+CbFBzxaBWuT01A
 J6vLirwq4lS1NWzRTyJY5wSS4i6+0n8OrIFKErNF60PRpXkhZCZ07Q5HQ1CkutKdO5Csy2rlcJJ
 qExAZXx5XrVW3bKt/DXOhN88xsdAE8ANFpVJZW9AHIGp5ojxqjc6wYmjynMYKw1dtpIcdp3ozcl
 6koeyo31Z+8LrA1wVJQ==
X-Proofpoint-GUID: m7cnzvx3cExEt13gpNvh0cRuZTgcOSvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270051

On 10/22/26 11:47 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Validate a matching entry's size and padding even when the caller does
> not request the length, and check that the payload stays inside the
> same region as the header.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

The commit message should probably mention that zero-length
payloads are now considered invalid (but I think there aren't
any valid ZLPs). I think we can also keep the WARN_ON() for the
bad padding_data

Konrad
