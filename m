Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407344;
	b=pkqk9/lZxwgiCkaiL6bwX3yZwVAPXS9bhysFjdbGcE1/cn5N0IhrxwkkSdHH9eTmRxSf
	 1IZz/tTzCV0tkUW9jk7t6bmM3bDxGcQBinfo4kOf6KIfvLyJXmUJdKCsr3UnCNI3QP1ws
	 fiQ1uH312dVrOZ2gx0d6igZNTzYcB3a32btgnFHaHzaoXKZwI1v8bskuFwPnxFc8jd6gZ
	 f1UJgYjMcomC7xB75/M65kMp1IADUBEAoHhWyvv6vlFaq4c1yzImQlom6BZFuOZmQidsz
	 iIAPSli2a0l+/KHnU75uxz/fgvJrndIyqGXI5T9zdYgP9HYJ2TGyTdEiuEG1wnMqMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
	b=qR9hAgYZFvGJY2hm2Haotm+K1cDoTcxctBx8ynSPOZDLGcnw0j8O6nC61rnqkVFtUqcv
	 54l5RFJqJW9HPlf3wDXn1XWsFJbVAbWJSPkGmFwGQnjrYImhXJPpYQbf0zB7D55dZBLrZ
	 YQPFC+UH/9IgSZqScEwia6dddmpZya9t4lWUd1851TxpuabCRPerQTK1+SPxJpfOa57Oo
	 U30ElYVEKwFYXn5oNwV9hJKGIEJnuMFkRN5kUNJezyypJ87OHQ7GkNZwT94gHz2XpUpUJ
	 bQbCI8mXr8mAzs3JUDQV16IH0e/4Ni8qG416Ic3nqG9eoWWOsbqz+FhswYJOO3+Jo2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE71E606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE71E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJ6se3198588
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvLCFQbdJHdvS8TiMxoEDBC0
	gskgFKfqHEXYuNhy+a0=; b=JhrY4cSQYGOtqDcNJaKvvgLzaupKE1Ku3eDcqwyX
	QDHO1k0bvbgSW/KCwm/VFAc0rVHSknHxz36AL9C0b/BVHI7rPYMG1xi/XXGyGGXT
	PrfN2GlbXn6avqLd70EZi+lIlPlJH/3Fe1iplD+ubpTojdFgCluVGK20X6FIehYg
	GM76rfGBAk1oVVMVzlxUjBiOlRJyvhRd2GvUhw+MaJewvJQpIZK2IUF0G8+CediS
	h3rmQyhiPo63i0sCVwJlnKKIYY8TUo0Jque6Ys584O3MMvhhVpOrGoMtCSeBgpyB
	3cawDBTf/NEhweoavDi5an2wzlyvoOPwLoeASltoopFzFw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1501gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:29:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc36b97a77so719592137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407342; x=1795012142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=gYfYXp9OD7PM7oOU70POvyJhUdKhV7sHsZhU5aF2+qVWuiXwcMer4xyFEJTa/saBfL
         xd9QMrKc4X2rF6NFNxR9e50+Jh+dMXKMJQdCjRpRvbwtBvDhYHM3RCfaGZqYC3UXjCOR
         KFKZQaYtREBPRj2PRfqu1UcLa59rNA2izJ6poxC7c1WYiAtD+KRbDNtkEV1htHtcetRu
         LMdCe5C1e8uez0s8FlfrZW/CaSPA4C+I2/owbLLmqbQ9eXA3RDajw1ygWVBkZDDWDg7W
         HnOksA9Vyr0ix5MWUmPyokSBxc8bat7IQ3xwvciYNJqtBhfAGFVONNBQ+Ly1Lq3Vt6eK
         Q8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407342; x=1795012142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=ndD3Iscq4esA+lqvHVGuqgbbF+JWKOzK4+pz+L8vQfbIYbohp+3ZaNj9UPmOgCeqfh
         gqwJ+C4Jw/AEC8GMYROwaMpn6ZkbtSX+cElcZdw4BNczbhAmIsiXKgPd5yohhMkWqErB
         64mthyhEBKVk8ygI6ner8Fm3Itam6SLGVMjNo4TrJI2bSckJ/SiybWpisTA7FQGjbjVG
         VhjBl3itytxgQHq8358p8hWEu4BvCc0Ph03oBuJ8w9KjJgc88mOBOBhxHSLCNfkSS+U0
         /D8SmggZ3NlPHoQt2mTb4/12Bff4DJ7bJO23QWAXad8Rj9SWR6Ewzt7By6WPpxBODzZD
         oqOQ==
X-Forwarded-Encrypted: i=1; AL+hErE+VCIrhP0YX45bzK7rCXGpF+Gzd87/EZL5oWG68CPsJxjJlH6Tr8Ov3qGcNQk53PCvoxF6dkUzZNKmp2LU@vger.kernel.org
X-Gm-Message-State: APuU4Z9N8lFG4HgBDG/p9UBhz6xPIk45kD6MtVGWQmqrqoY6FJrwOc7U
	cHcIXG+Ft1MeHdPxJe3Ub2uO4jtqI683r8L7GITF36C4eYqDU0Q1NJ2jHZytBqDdiMiygmbpXYA
	Ouq/S0+wQeUjgSzzp/6y1KTjSyk/M99Cu2uX4DCNxHKwgrQeWxKM4nvTDL1oP3DR+HaOJ
X-Gm-Gg: AYBFou01wQY+jPaFUwDup9Lj/BQiwucc7t/rTgBN8mViCmZZKPL+vL4C9r57Lr79Exn
	6n4VQB9d0EcWRL1SRJdXYL3rRzwi6UK295QA04NBz6DXsfI5IGRo1431TcpJdcdjyNGbIfnFmkq
	9M2Z31U1lK8Ii2qFY4+Ym4CZIGGdd8iHHuXszc2eVf0oGVJLLvIU0Cjl+RP2U2QtEF8M07rtV1H
	L317C38GrrR+h0+5NGiDrzNWnCJXngSa9USxnDDkL8H+ww02KgoRblx8y6JUVMfipI3wWnvsDTH
	EQcK/4TS8BtYY5IQgmchZ2wj6MR23E42wUN3YnPFc65ikVfBgutwbAAOq5DElUY3X8YANfTNuCg
	rYBCdsvUFYAr9Bzvkfupku44R0u7f1IOfGIZMYev0BU0ppC/0fgZ16IsjCnhea82p
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784584137.19.1794407341931;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784569137.19.1794407341298;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm12553846f8f.42.2026.11.11.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:29:00 -0800 (PST)
Date: Wed, 11 Nov 2026 16:28:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock support
Message-ID: <25wbcmrhttoceflek62nu3e53xzb2jnaamawpyd4skiwnmmpjb@252s6ee2f5ol>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
 <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
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
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX6T5KSB/+uH0y
 ghtMUeUEKBFwmeaJTfpPMbTSzF40C+HyIXRGD8qk3E+leSxHZRShd3liG00cY36c/C2CDoxgGrr
 HpkKI75JiouZXw3fk4MweyK12J6zIrY=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af47bae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OnpAFzfR-JcWsVFUPsAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 0p3J-FvzAyVfS4z4KeIYzFEqJmjc9Oqo
X-Proofpoint-ORIG-GUID: 0p3J-FvzAyVfS4z4KeIYzFEqJmjc9Oqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX2ZWEk3LVAk6I
 NAy6ymbbBP36cmeqOvbXlGZ6+SHFr+uDrbFZuyKDDmSgGXl6f6B0BgiYqDFb3MqscgXg3nn28TJ
 ctpFvdCiKaF6Q2s2jsBVa8ZRlSWKyn9/v4ZhBV6C0/614oa3sGhYDLE0cTCa+zhsv2kZRhnDCym
 3sUEeVhZcwmuyY3zr4CdMmaWsLunLlbXLzVvqGSOvqh+3CyIdoph+5H3EFRmXiEdVZddFcIPwWL
 nplq7LdMVMrzaRiNpmgmIed3iJ2c41VPDHDzLYAth5d7wS66GgRv60+i8/FtEXTdsjPnpVqWaH8
 qTSqrLHiRILUx7boJwDCYnhgoJFy0KZkiK+NN6n2F9x1DDQMyoPpIqxCRkCIhr8gOBoEZjeNqmY
 FjmSrsbsqnzf9P75e28AEggZYvyyrqSp02g2hAvNBBZ4TDC2iqbNwOjIvIhXvyf0PdMI017Px9v
 N7bOs301NC38H46BcZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-07 23:36:37, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
