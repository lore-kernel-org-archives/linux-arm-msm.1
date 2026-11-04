Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779190;
	b=cvxhKKXmRppKsCav+ndIy6SGedMawF/pF0OXp6hR3UU48Gatt1FRur8ULmOb5OGNuGwy
	 0PEJnray/Zlmjg0rB9gN5bv3oJYmd3jbHiCAL0/KeEoJaein9C8sc3JJs3sMdwTf09Sxp
	 i6FTCFn9kkpy/MYVeOepf2KbC3/gzG15ANr5HwBvz8LI/svOTlon8eh3jkcUW/YmZxM3O
	 nxd+KjGUgY2zTASP9+WO4IjsBLcnMQrOlHMuE5bCigdk6oEb/uWG/K3xSwdJDAT6tf/rx
	 7BKhREjniB4RxRhL7mIk3cdfeQWb9gsXXWiFV/h4mHgIq+X9U6EFoeJ4Y+fn41iI/5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
	b=qxF6/Eac/zYlu8nCuSzfgmQfKykbHxcfykkEDIMkRTKrcj1qLSVdyjWJAt4EMXdEQ9VK
	 fDvwRQu/tBxhzsLm/ydv2zI+g/vJPh5JjMVIknu306CW3wGMdpVhQCAa07UMe3cv5g3KH
	 HpjEiLW6j7bSnLTTiIk8olsA0zjr8Kw183sjMCw9NcnBkUwNj05nxiigRMbdSLU3bcLBx
	 n3Fly0xrANxtcrNUkSSO+nxVvMJ93otxNmL8Z6gTSW5ToPs9dIcYQt3HgjxnGCGo4EFz4
	 onJdxBX5Mxi/5NW0/MvckP7WGMJT8iSJUaT2kbyCbspJhNp450MZMPVn07fuZlnqWiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJTaQJ3z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MI6UlBCG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398A606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9398A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJTaQJ3z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MI6UlBCG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A475rM1193436
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 07:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQiyefZwh/K4SuzQ+nT14r/+
	BbPDDTBUa9cvkZOYWWg=; b=JJTaQJ3zlL8QjekIKvg70/vV8Z5AqeTkyn2YDPOr
	J1poufU/uBnFZFg3udEL+xL+3q9Ac7e91+KTVFdv3J49+s67njGSeh6OxHH/Ske1
	WS3LHthv4/lQryuq/aK7//1pWUCySYQGykCyc1WxyNWiygX7ZNOv5YfH6pYBe4Ya
	s8j1aEBNqFnqWHMdtvRnwq3Phqls1yEu8HIHmgxRK+SY2yTpqqPcdtR0FoA9NNGC
	BNTr8zqQoClwQ1rSoU2SrIZmcHfbhYMJbyWeR1/b9NBy4b25IHAZv82P81jd6/yl
	x1xw62UGLVe4UbQuh+y3gX4XiucjBP1w8FODeh+m1K4rRw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njpj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 07:59:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8aa185840bdso492145b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779188; x=1794383988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
        b=MI6UlBCGcCNqmhcf3SotAsKjIHBoWpZV/Ld6b/waj1XQLsR00tPyi51AZBxXKmMXA2
         hU+Nb53aRlmDtRnVzWsK/qXBySvcmGcdYlm2LxBwOdKASEBurHwbE1j9rI9k2zV6yh95
         WPRqL6KlHbjYZNJ4z5upyYwQt8VWJoQf+L5vCHl0TeRj9IS6si1fzKx0yg5yZJ4I+8Ii
         jdWUhCqVLkEpK8pwktqLOfH+Zduz5YUl1mUXKVSVoXg0Q1zvevbbuIlHGkSuXILRS1A3
         l5tHebfSixHSVdIsL1+BuyWyfPxNb4idzCS/VavffvcCGfIPjC23rh8N3T/1QTmdbbJW
         XuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779188; x=1794383988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
        b=SqOqDEN7WHUrr/MwQ+dA86H2jvnxOZC3Yq8600SRBeEpY66dCW4HergUvGbXNBVd8I
         UOobqDNe8h/yoiEvxZ5jZHqkssDsdpcbJP9sDBRs4UoW5p2D1ycH1re5QwyQnJsDasfe
         7sg8bwml3e5dNQ5cuL23KhL3JWY6KfVpRfH02hOnTUahey6YSoUs0VfDZLKNdlmGCu3r
         JWD7fpwVXV2mc7zjzjVYoCthj43b67ngWe1B6PT0ov2F8+3tfM2m0NihP3q+UnZPX6ZB
         mEYfioqgU1ou9cJXCibjcG9HHddu5gykaSCmZTsv2qXunad0QdA4/aEoxz7Xh+EwowCe
         GZZw==
X-Forwarded-Encrypted: i=1; AKwUvBxIbzn+ls6wtRrRt+8nZA/nvaiZAKjSBxQ6GJkDoPiC7dez//NbdaZU3YtZ0499KpKBG3hVslonLx+ezOBu@vger.kernel.org
X-Gm-Message-State: APuU4Z8fltj1SDnB+P5epzub0FQpEOQWOHnGVMjctEbXibCoIvOehSqU
	lDRHemq3xGU+ymM+C40OcMHGuz4ITm5m47mkptW/dbXh1BJbbCkoRthM+nnGO2E+8U8NCcXHu6r
	Kr2fjU3zUWeSvHpnWh2dau266b8TdjKBdXlb65xIw1T6hJQoqI5Zl14xE7WodYPr2GX2p
X-Gm-Gg: AYBFou36UsYeD84ABa32CIn6Ee7su3nVFNkrngXvKOK1hly473YlkIRivnqgOiCOtKS
	adP5Y5nfj6IR7DTnMJa1JiSxuLrvOh9SeL33GhXuM4eZalpeb+tFpGI1pr5ER0RoAfnMEnlWXHu
	6KCYgwPjG0HmsAtU0+q8Dp2gZY9X0cKkix3Q1Eq8zorEPLaUlEZSstSm8LGgBfQt+cEp9KoEIoc
	a0V80wSJkb4pVf/uUVOU234Sz1Jn3FXe1AIXyTCwijitmXk9pvWb4wV8abCOrdIBEd1pbjMRIPq
	BMPus7y2rWQ66zhDG3gb4oVT71XcpqbgLguDRV1qxdkWqhQqVeZGKwLZOnAr17sogoQqkKEEtaJ
	KEJffOBTe+ukg+3LHBqeCZFWRKSVCfXfT43Vvj/utt5HyLkvv+SlRKVVZLNR0Yds/iOQnrUlJ9o
	7w19h+RhQ/ene1/w==
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr13298024b3a.31.1793779188063;
        Tue, 03 Nov 2026 23:59:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr13297996b3a.31.1793779187555;
        Tue, 03 Nov 2026 23:59:47 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af91781sm566203b3a.24.2026.11.03.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:59:47 -0800 (PST)
Date: Wed, 4 Nov 2026 15:59:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
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
In-Reply-To: <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXyLTSbaRvfv9S
 ro62p8XQeI2cudQuTKkLQG+OLydqFqKWQRLB0oBOLc2B/DAO3BZ0OnEEhrHMPb9FSQJilgO0e8n
 HEzmnlTgdeE/Xx3Cdk/s6XB+RKRYIW2BvTi2npJ86Aa0gBoBEJhA6TTfQSeYamG2rFvSli6ExPN
 C8Y7/MgzVb6JsO9ufMMXngdx2xYG/G/WOrtNaM0G1KXQVYhsxfQyV7LmFVdEz3Fc/NPPTLQnWza
 RbSw2wskDpkB/7HsM60SCvgMo4yQJDYrsMo3tE6vgFqdoJLrdslbOnTe4PhpBH/As4oECDNCURZ
 JDnuzwuTpVIkMHt9el4XMzl1UMVXbrvSYmx1vsc4iORFoGDsvDkdpE9mGro1QE5PwkBeLI+97Sj
 /gjvNv5beVxKHACWZ+ZMT0vIuThWUXH8n99+z1SpbJETQRFAOA+0JMWGm0mA58rzNhQlQUVXnt/
 Gh4kbLCqOndDFUFCSVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX3PsH9VZL5UZ7
 f6tv/8h9pr6zo1Glq1rcYUqtM7xrZ7JFiiG7wyjgXzjIvWhh40IHAfCy2u3nkTqVUOiICDPmHuK
 O25HDXvg66+R11ae+hR/mAmxYSxeSDU=
X-Proofpoint-GUID: UQaCkrPn7B5Nn9CBy2m1utztSkxzsRnL
X-Proofpoint-ORIG-GUID: UQaCkrPn7B5Nn9CBy2m1utztSkxzsRnL
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeae5f4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SSptHCAamaIDb59YXrMA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> On 11/1/26 9:04 AM, Shawn Guo wrote:
> > From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > 
> > Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> > SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> > and DMA queues.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	phys = <&serdes0>;
> > +	phy-names = "serdes";
> 
> I believe this holds for both GearVM and embedded, so you can move
> it to the common DTSI

No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
PLL/RX/TX programming driven by an SCMI perf domain whose level is
the link speed.

Shawn
