Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D2215075
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165108; cv=none; b=RzJ8IFxCvo1uZSngfyNkB26MqfMISRsxvuXJwVUmIg4onyYlimmMHd5NSL2Xx/GXkufO09NG6DqFpL+UYUQKkH8Y3RZzqpnbx0HKeBBYRGd36saqpniXq6K43JUBUzUvlFOBGLaSz9bhYw6nRKgAzQMRHBABxQjwsZIb6giWyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165108; c=relaxed/simple;
	bh=kuGr28k+G/FBXFkLTlJ5L7Pu7zIWGrw6d8n1l/enY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmPfM4vxbPioDrId44pA3QaEi583Wmu4xVKbcMQGE7mv7CizRqFYxVij6RklDwnDZE3GRGTQR9ln/byG3Wxvnm8TDs21MUPwmrS3SaMcEx5AITRIAh8+DldeH68wF1Srlo7buZXnOPArsAyteJHQlo4qRPJDLQ5JRAaeWWFSu34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX5oOxDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2YxBIPa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX5oOxDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2YxBIPa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xGxL2332506
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2QCQEBDofLGKNXUpm45l2aUm
	lkaV4PGy5uUSHzM9U1A=; b=OX5oOxDj4FcmW6h8vw8rNItai69Cg5+CeKG+/ufj
	yC5ij9l1jIdzBh1xHDVJvaxR4kDFQrKdXPH4IeNHvSPmZV1FtvIVVnm14eTtn/8H
	QbiAQN43faoQsghjYGkd/g6KpP9btqmAy4PdpBvwpWkxv2YM6cs1CfE3bqTiNJAC
	cIZFTaO1XtniBegkqhZEkwvYz4o5ZZIRuhjlct4tyDlSwtOG1zQ8wBj6T+lkQlAK
	pc0ZYs3jYCW/E8wTMaBC81Yhe13PV8u3j8/RudnHXr+pWsWG84DGBN5Tfs88dmbJ
	XHqCPJuaF0QIdYLbfZGlj76NqpN23XIf2U1mDkmAss7erw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq858xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:31:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso506161085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165104; x=1788769904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QCQEBDofLGKNXUpm45l2aUmlkaV4PGy5uUSHzM9U1A=;
        b=Z2YxBIPaRLf1v1CDmIZ5gC3ObzsKcEGnKhnMcYTXmJXXMmvVV9F5tBakG7OkRg+YtV
         3zUTJnef4pGsFRxfWgq2HHGocyEY1u7SAwAWkeMXoZUmYV2iXXcGYU7/q48kjxEGEN+l
         h8nZiFDhG1aEVIX8z2L0zbvwrvQyTP2GibRxG0U3LuXBpwUF7WXdsXIzkc8Vm5yYvGVz
         0Yl5zV65S60SE5fEU3urUx/m2rXNnhtY6ZTb0yaF2LSjTZ2rbgyu+BTY+6YbAnvfiEA6
         QL6nSU5i4RBn5XlgGI5q+0hHk8UCNyWP711cnJA1wTyt8t27z0Xqk+Mu6QzwNC83+WZ/
         lM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165104; x=1788769904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QCQEBDofLGKNXUpm45l2aUmlkaV4PGy5uUSHzM9U1A=;
        b=WAekkYzJQSzf6yHLNO4Kf+h5ckTConiAhHxMpMezoxa+wRwH6uo8GSAV7sReyFZiLc
         NaZ8MwUUNl9aqN36Ihb5FYKtQ6rKVJyvIl4N+fzXrQX3VmbQ+6DWJnXgaujCigj34M5d
         QRKa4NUJmIljYio7L/y+bqF0AOpVSsIwUFaKJFumTPCNrFwfkNUA8XPDGLyB/nwCeorq
         9R9MX2VivUTPuAWFc0PhoSeaMZ+gI9ElJI7o3yTARzCE4A8UYNDC4VDDQcsCPCI0BSC8
         57NAZMOYCpnCjw+ToPrXIEYJTesoK5MmyZz9BcHacwE0BAS6pXtaKYKhimNwMguUpgXY
         PDxw==
X-Forwarded-Encrypted: i=1; AHgh+Rox5ttsWYu0ZGQKHP6SoNWowcGbCgZCa6xpVJJmVEDtal7BUX7AqVVvyGToVgezPeYSzEhm2lUe+hlTcvPd@vger.kernel.org
X-Gm-Message-State: AFuF++mw7SqZ5SiiPjsWM3IX6II+dqcJYQLg58IZ1bZnYhWtQpnfShPX
	da6hkYCOC3LF0xS9jq3zu6ZcnjLWsH9oz72usC+VaMfmekHq6eRk609ICcxaX+O+2hVK57ybwvu
	uuJsMwS2A03zxPTjLVGhDG2gzN8nWGqtKpYodkaTRJ4r+ba8aJYsgo1j6kR9DnTtZP6kU
X-Gm-Gg: AR+sD13uJRwibsTIU54muAfBGFgMJbAiXep/emn14cvqkoGE5UexWsAEJI6tauX4EcA
	cC+FKnvk25PP3JXqJ/XXMWGhjIbwjLEC6zMYEud/H3TNaY3sFV7K+q3tZS3JhsVA/vvEdkgyY2Q
	IbbQ9DRXZ3AO18VvOU0e3eKn9nn7dght+mSabch+hsL+zACtiZ/t1NXOkIKMUccuhvD64wz5JxA
	0Tds41av3IX1JWhXkQN9/00FhL8WEfBP3h5A3CxzQrK3QDErkq3g1MlPTD4qxLfPPWi03oXtys/
	oiYZE+Wxsc/CmvmD7+AxH1NRXZvnvrQfBif2wuPP47UjDu3g5++SI+6CboyxAbARmXFXB1ELifq
	/bYoLkVl4bKY6
X-Received: by 2002:a05:620a:1d9e:b0:936:78c8:e286 with SMTP id af79cd13be357-93913909f14mr2166924685a.25.1788165104088;
        Mon, 31 Aug 2026 01:31:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1d9e:b0:936:78c8:e286 with SMTP id af79cd13be357-93913909f14mr2166921885a.25.1788165103674;
        Mon, 31 Aug 2026 01:31:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9617179asm123518505e9.2.2026.08.31.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:31:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:31:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Message-ID: <svh7vbt5wzojs7xv6on2sfrdvutkigsptskvrjg3h5u3s7hqqj@orqs2wfmyzhh>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-GUID: aLbeqOKjCSSdBzDgD7cYWoHhYeWsqKf9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXyruoyTrqkrS6
 EPxKpOYIPW3gEnrnHvTa+Km9v912wzAGGbvmF594L+V3mDU+LnpF7cr7/dpe8U9y02oJDTX23+n
 4iKl0MKOMdHFzjS/znzWmoKso3yUZVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXzjKWPps6RnZP
 6Kh7oWidvNyH8KJWmSIjS8/DpSxjxs9ULWda7147bDD1Y8BMugPqdQa3gmlYdhDDfK1L+kOFfO2
 qaoQ9dp2EUIWSkqDhqy6aKqtLXQJHxGyscvtuQJ0pFJVzxlw7xGNByIP3O2lOaJ5s0b4B8vV/2O
 C2G826uLrhow0B5jTwAxlsbfM8BV9Yuvpe/WBJ4833jVflJlrKzgCpR3rDFx6axentDNj7Zl11p
 bgzKnBP3X4EuSEnNKGiKkxUhfg0x7PdISqOo9BVzhtAMoy4SJBitQ0Rn9dLDSCM8/8zsebW9z/P
 rvmiNhta1KIE/nsFtkvPrcXqQa4OfaTx+byx//gDz5e+3neK9IvSk8V+dBONRkZqIxlSCWuUeft
 kS3r1QwjPwPiahdk+CrRPCRI+BqVfIwZaJ5GHf3hifL4f6Jbpb7YLNNeZCf6nQsqBciys3N4Qwn
 s8F+lTQodo8DxJdC8OQ==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a953bf1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FBXW8Om8NeiFsvgFa2AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aLbeqOKjCSSdBzDgD7cYWoHhYeWsqKf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

On 26-08-30 21:02:04, Bjorn Andersson wrote:
> All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
> measuring temperature across the system.
> 
> Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
> enable these use cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
