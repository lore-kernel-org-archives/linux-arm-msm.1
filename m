Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610125;
	b=I6ZCkGj0EetxqbQBeJZonnNZEYUAt+9Daxy+oUF8HGpZz8/pdFHNPqf7eg3r2TFAKbVq
	 LC3yaLmojYEyOQ5NmX0IeG6xvoTVjKcHsFXO8D29MlluWpyab/0g7TKDejLfhMJk3XKXs
	 HZ0SRFW+u6sEN/vr3OjrLd7ABhs7YT90MIpEEf8eaBjoeqfQo2C8IcKo32e8zqugFVplc
	 TmYN/UMkQNWNU4li2mjgPHn9AvBt5bbKzD7PDImLXmNKYZK/7ufVkjFmVnvSdEfkRwrfQ
	 N7vIkRn0FpogFTJbMoYZ6gIffad21soh36Q5pmQbypHngERieJNQkt7zeise5/pwNqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7gCWm5f0fW+q26OPY8/fXasB7P14OVIPDrLLral8tUw=;
	b=rOIOkyYvhbXa8cDlIUgfmCijuUWh0YzOAT6o9VMM4EeW99PoASDwYV1hYxA40NXZkTgd
	 AscjJ6zdlGMiusbQ8lm0JkK/h0kGaSgEOdQ8SwLnjoVoN6lReLX1c5AL+/MqIXnTHrsrh
	 5la1Kep5n1USYFd8IpNU3IFzX6bdXVnjcIke/j5RTGwkuzbCuNn4sIXqkAHO7C2jk991a
	 7f0hVnEjm6VMUBJQv1ESuSS0DwbVyQ5ZI0HQibVnoxK4E1tux+h4+T1J5d6xg46fmUsqX
	 W94xpedSl9IzFA2k1nruh5ROqlezcS/7SM2W4bCUPpCDKCM5Gt8752gOXnsBIzmxBIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dy48WX7r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BBC9h/Cq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2E606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A2E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dy48WX7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBC9h/Cq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mi7k3642178
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7gCWm5f0fW+
	q26OPY8/fXasB7P14OVIPDrLLral8tUw=; b=Dy48WX7rv3vTqORDur6yYnutQxA
	Y26RUD7aZsx2TqWGe7DHrzftE7gpmM5fDLnaWRlNcSDAJ8x2dgOdtOPL14HEiv0n
	sQxIGa3FZnvqD3qifZW+OG8QwB7NX1DIvgUHKxeGuw6MGNu9CdJ5h1Ejz+/vyTe8
	zDMT7TT6ufSyLPPyIZsgL3muvmskAl1Bdsq9n2LTRIcDOtCczSKkRvlAoDn33x01
	yBleK08wnT/AFWNQ7Nq3kLTKkeWmxvfwbMb9qQPe/fLulV+xc/PPr70h3h8tC4KH
	ji3RGFbwlEvozhohO+uPpber7PC99KTJPo8CM/RScgJy5mh1Yn8cm8N15FQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aujk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:35:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so6181377c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795610119; x=1796214919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gCWm5f0fW+q26OPY8/fXasB7P14OVIPDrLLral8tUw=;
        b=BBC9h/Cq7h7B/PE7l/MXSTe7eYD69cqrN8BlkwiUXtKcFBeN6FU3XhwHprZ1BcRNuI
         AKvbIYslQ+FYAWaqCdBunddQLVHFd71LFNDX/e5L+g5i7nZ3WjgFPSopbGVvdghIHBQB
         yHT19MYfpXSpKTGTyOtEtUXlYaBk6nXbxh+rj9OQMIXL15c/VkTbUxR0pbfyQXVqvCVT
         iPKo+8agSfPKgf45XSbPaJkgB5jNBLSbxdU/F4PpZA7ufoS3aAg3kf+Zs/vuYMcKjHp3
         xXE5R+pHxU1nWrK6x//pqvIE18JMuD05ZBCpqmLeez6iUrslSmKntpC027lfy5D+DDk0
         kAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610119; x=1796214919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gCWm5f0fW+q26OPY8/fXasB7P14OVIPDrLLral8tUw=;
        b=eNDZFxRmNMcIiHKWWQDOpo2WoZElYbdk8a9T2CzrHS0di+ksi6NDLItZOEajKiOpf8
         vY2vRCJpTfHqTdHnNZ3cwYXYCfLTPzjSeVI1pSeijJGDBICdIzaMoadoe+FNCItD7Hzf
         wor5QIFFu7nIB64kUBdl7FizNH1ywfKZHb9Zal1WVvXQtzEfhhdCL27N1LVBJaDAH+v4
         fHupeF2BBQ94rFOogIrIJ/Ld+6h5e6fCpqRWchRGejxwHF7z8BuAy+5MS8hA1GMqR64O
         mFQmEHHweqmdD44DmFuALrWuOKVIzvYQYHx9d0fjZ7U4PAsd0OLlQW3GlT+hx+QqZiWb
         LnQA==
X-Forwarded-Encrypted: i=1; AL+hErGY6KOlQk1Uqzh0eR+w8on0bIr2kcTl/XKW2l5Ht4+K/fvfcSs3ldOHaoG+Oxsdgi+Uqt84xhYC+3nLXr/N@vger.kernel.org
X-Gm-Message-State: APuU4Z/P83U2IF7efA5viKwmczIITabSyVZ2ah1hAStxuLCMbYDn2odU
	izZDK5cA3CsC0Sw2PQaH1PUo0nQ5EzwEWaSwk0HPs93FT30GOknHfKSbKM32BMODYxR4adej+hl
	Ptysx25Syb6RPbjFz99DWrnuJ1dUJFAqKYQB862VIeg5Txl453mk9orB7byBgiKxAbitV
X-Gm-Gg: AZFdTZeLH8d2xbH3uKXaPSamR8HOGAwEcoXoBmEvge9DwUNcfzZtR4Fpe59K0CE4n2f
	c8POLT1VIZHt/BEmeaE+EcPz7NjOtmu4FyLNHhNn6evHKFHPAgqoSsdgxUa/DuSeJw/OYQ93QrV
	qY1WnHA6Y2xWgY4xQSlFolcsbKZPcNzRpLWFXSWkcoWg7FLz87KxehLVsQMXHGz23Mz/GZRAPOk
	0+UPzcXwLY21ipJx3zAO9DygiDjUD+7IroN8orXbRp6wV5I+UV6yyFqr4H2GNykHf0ifWytsmZO
	GZaJWkkVGPp9I4Ame6GpJTWTHgng6dxa81DF93FpCT631ARGYislInXXqaKbYgNtphiqvDbjrRF
	ayLqv1Q+/48SQq2Z/z/cCnMk9oNGW1HMkJMzU6QvtOpKSobmuZOW/toMswq0qm+0pyweNYGPmyj
	9LcFEgXiRjLslA8MaSEE8VCM9h+jW19CABjvY9Aj+iyPALoE9AukmSGfo=
X-Received: by 2002:a05:701b:2508:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b5568f03abmr16213737c88.36.1795610118674;
        Wed, 25 Nov 2026 04:35:18 -0800 (PST)
X-Received: by 2002:a05:701b:2508:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b5568f03abmr16213718c88.36.1795610118165;
        Wed, 25 Nov 2026 04:35:18 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm66856523eec.5.2026.11.25.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:35:17 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spi: Add compatible for Qualcomm Seca SoC
Date: Wed, 25 Nov 2026 18:05:11 +0530
Message-ID: <20261125123511.401747-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <04e8a33a-ad20-4f2d-845e-1c0b13984a69@sirena.org.uk>
References: <358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com> <04e8a33a-ad20-4f2d-845e-1c0b13984a69@sirena.org.uk>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06d60b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=38CvgGhHUT3NM48cmdEA:9
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: aQlIvDC9pEYUhpNilBOtLNagunpSsvIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfX0Bec+CkGeOcX
 zJFpzU/OOatS0/0eckXCmDjKA1q3EAW9MGesDBMUB2QTfa7O+xkGHlUkV6iJPcbeJ1daoCHHt4l
 h5OEfV6eX5sfjDMN5PS4qGKFkhOssf+PaSL2o4zxtuODAZsLHdPAkLBJjtK5bjAlvW+VvBDI6E5
 +H/hrkPbMfoHBz8e21GxAJjx2fRgg8Cq8bctr2fpe9MqAMZtdo9FpDDCwVRqtxPKnYkyigjcfT3
 ZpT6M1f3ggAGzrIZ2rsivhJSuB5e7TL/ObqmIgZ7IS8MaYX077GP6I03gtX0OWlSPgGqNZR/uwW
 OB6BEqlVfksXEysYxkWQFI8hUg8UAwoEgXH+WXpa1W/iX+mPc/jbSUpj4tRA+OGc8EJhK/l+PQW
 MF2ovIHERpl6hNqKlgV6kkXPq+tmYbqfb+z0t2xx1GyyEHb5XXkTM0tgNQ6TIjOn7ARFJXGjGwA
 NbQR/cY+WAq79unT9+Q==
X-Proofpoint-ORIG-GUID: aQlIvDC9pEYUhpNilBOtLNagunpSsvIO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfX2jJdaXt1abMv
 QGRai87IB4ZXgA8t3WjWFhb3WRh1C8ONxhJhqJ+iOooWYBAbEXhVt6dK2HL0mF7pz+raaLcIikj
 l7cycGJ2JDMqXtMbOK9R0fNndWxILcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250049

On Tue, Nov 24, 2026 at 11:35:53AM +0000, Mark Brown wrote:
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.

Noted. v2 will use "spi: dt-bindings: qcom,sa8255p-geni-spi: ..." to
match the existing commits for this binding.

Yadu
