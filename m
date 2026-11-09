Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231165;
	b=RDEf1nQgOsAFacBpUcYShWy210ZTCPeH2Ee/8Y98IE2jPKWK0V/HKlb5PHRRes1Pn7vM
	 R3vdp+5fpyjqGHclDZCofEk6RabhghY5NiZEot2kNkEp2WpsYeGxYwrgEvLRA8VLhqG+1
	 1mi5b2B8M/7sOvbaMXrS/wpjgn2qT0tnb4GzKnjnQndZ6yhtPgLMxpvmdP/FxXxJC3+i9
	 THBSyFLcEpmuJW/60kNA31IOojL8XZ/p+//3+IGu358oRAro/G3cVvmrBxsUbtbeKeFlk
	 fk2ETJg9ixiYAkY+laEpkNnkBZo50z+h9GY9/Q+iOn8WR3o219HkXFZu1VYaQX9YfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
	b=K/yFWTXvqGxZ5Yy5BTlbxHI/N9syAbZUYlF67UCvX9gP93WLRl/NFVRe2dEC56W4kkCh
	 W0yySZDwTtBTZiS6688eUunY/g5t8vtaMHC8LMUH9y1Y+7XfnNp7jykgj+x9OYxy7LDHT
	 WoG75p40lcVhJyAi8vsWQy54D+4svshXMuI9GmWZ4GolrRJUGGolIYHlbTzz+0DGvrrLx
	 /h6Afa4Ton+JGyKjAdqVi+dci3paBwzetPyOTaYZCEnXRvOdS6hB6ggLXETsiyTbXYC91
	 VYM3LJiQbiEp+CeKKNZGPil9Zr5/szvV1RfmasqwrmaW5yh3PBagUHz/6fJhKTI1ZiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuIEAf33;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni3Rxsls;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B444606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B444606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuIEAf33;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni3Rxsls
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF2ID022633
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=; b=AuIEAf33+rrs+pto
	WYdMtA6ypYrroU5H+DcPWPiCxEkisy9TOauID34IJjIyEr1IcFCDznV+xp97ZBg0
	cenaQyHSTchsakwuhzyQFi+RsWZQAX2qIoLOn5mHQEHZLd2D+td42zrAjlWYMM8B
	Zm1TkyYfQZ05g32+LqpoBSCx4Rr/Dal6yDMp4UnWzTtvXpAEM/cFxS3TR7AiIwle
	k1tZ8oePfEtXHnffTZ+3q+63WJCUSHva8/dJWcmo4pZGMHWdDf9Z3ugTvmVYbpFb
	ZBCDbLVPn+Y6Lo8Bxhz0dPFb3OmasektxfwVEdWjvj0u513EONjM8yrqwo9GIRAB
	afBi8A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydggv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:32:44 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso31136e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231163; x=1794835963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
        b=Ni3Rxsls+XypYtn4S3ryGuFw1JmPGo13e/OTqhNLz3IQkNzIGusUOxKQApqlnJc9uJ
         VHJLAFwF4mDXOcXoGtA/6UDqbRozjQfXri8+h/f6zWr0bA43bO+nm/p32VXwi03TuAiO
         vJMbibwIn4b20RlOvVE/JIsAZbnNLhGmxPGQX6IY3lGR/kpjvVu1i3ravjeiBEPCGBme
         sAo/Ahajc0Jt31ErIKAAbGWwYOIcmLy7ZMqqHoe5FqDSfWQ//CwYH8xfLnFSdId/ieNL
         lSqiaUbUIbAc3+NU/bR2hJSxVnrd4JaMAvhhi43nGkMf5sxAUdGT4/NGGTaE1OT563th
         aZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231163; x=1794835963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
        b=ehfInSKCquhHK5MhKUVFI1Ah4c36rJM+ftVC2g75ShVxS737JetxgufiX+zlWaUF27
         GBZ/RPx3S0X8akz+L4oMIBO+YSv723fFGuwgTBIrLvniPnjUh7RJWQ2m/V8zlspIF96r
         aGPA04ggCsxbFkzqWq6eZOsM8/WCLoHxrtgdLZMDooPeFsNM7EKfh5o40gvz+btp4Bpk
         rBiIzCeQBt4TGe4GQiBUVstov8OWhN21Ifms+JsPJ6vTN9M4nv56uHpd2ei/hJWAafwk
         jGan5I2+jPKLgpWNvU7EngBHBP4cY92x16F2iS6KLm09FCd1RgRIGG8eiQNSEKprw50v
         Lm0Q==
X-Forwarded-Encrypted: i=1; AL+hErELGJ5s7xRZhZmG6sGNcPaipYeGE5vGwLi7xwnuxUXEoVmggbJ4yvay3jyqSZ9p/eUnql2FU6aNUeOI8X33@vger.kernel.org
X-Gm-Message-State: APuU4Z/8pvY/Cdz+c1Urb5IO32w3B1ijLORj4PI0aRlI09ooqAdVDQib
	ozHwj3FIIvwhC+V6jqppFeSqAS5gRyUawd55P5uv5FyRjXb268S7Qc4jRa/d/2gsSfDgGl8thWx
	RJOH5RT4y1pk6vbHtdmFdNeJ3TvPuKtl5q4/38MsM8nfNvBmPKDZ2YU2XICpl3Yjj3yZq
X-Gm-Gg: AYBFou3WKzZNSBJgBa4sADxfwipHIDcUjUC0SQHF96xPfUdnInt00IV0D/TV1z4K/UO
	+BxdG/Cr12YH1xPUS911eOUhiwR6uKRrtbN02qcq90tyqWVDYqkyFiXwg0I7fVxHiTMIOHdqfhs
	uHDxOY9VA3WnxORwBRiQcZgjSo2udff9fkzavVJWPnDwMJRd11h03JiksMrieX0UTm5dM+/eseB
	xm6+UKfX+ZHowZTy+zfCZDd+1AhDvz84syFCOqGGmJCkCYvVDmXFFQHwJ54TgczjbRz66bZ5Qqp
	zYfRIzcdFR6j2By1cclxqteK00mBJi5lTaz37CcDd5kGze/6q0kuVVcWdS/YF9zzytt1LSbsbwX
	pJefUaalGgcSIGM3xz+GuFtPXXprqZTreNrHZ+Z4EkdffD7kT/1u7HKMgk3ZtZmyjw91Icw==
X-Received: by 2002:a05:6122:1c9:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ece7165ea6mr965342e0c.2.1794231163484;
        Mon, 09 Nov 2026 05:32:43 -0800 (PST)
X-Received: by 2002:a05:6122:1c9:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ece7165ea6mr965320e0c.2.1794231162971;
        Mon, 09 Nov 2026 05:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm169621466b.83.2026.11.09.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:32:41 -0800 (PST)
Message-ID: <480582fe-27ff-4d14-b0c3-deab365a1225@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:32:39 +0100
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
Subject: Re: [PATCH v2 1/4] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
To: James Hilliard <james.hilliard1@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
 <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX6otRPGbxGJH7
 nA8+4Wi+ri5uz9WOhVJMdiQ2gJnVkS8nwfXzmnJVQ0MFftJquJlEVTTCm4KzWXcgVF+ihZDw1Mn
 asavKXI79Q0qRyowYzCBmH+GKBaW9Q8=
X-Proofpoint-GUID: KGdwWy0fRYoZPv_HUMgiOr4en0yTHavO
X-Proofpoint-ORIG-GUID: KGdwWy0fRYoZPv_HUMgiOr4en0yTHavO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXzr5Ted6Hns4p
 qxfVbltYtZub+ql80IIn3BFs2jV8u1XcUeWnyY7VsBAW3tepcG1ffeerzBpjnDOflGXW7hlitlO
 zM5NzTGkas4R0zQYJtksnHG+8EXDoilJsVjYAWK4p0XMO8uhD8A+eYLFGxQLd78dPHlJz4ng4d0
 2d3SxDn6PEci4jNS3ljiitsUqoTzHzqSmPq60hDajGyaF6u2685sDaMPbar1h9Dxjjnlv50HJVG
 Q3nWMf+1SpgZZQBgwTWfLsHYgiRAY+kXNHHUCvqBf9qV6Sh9b3YYJ6fdyTDp5X1C/DG+uZ6h6NC
 G+uBI3ACiXmtfX7j3aK9nDZYDkKS9y56RgdjapgrvuDwWNcZ9aX571QR26EZyjbVNhfXPW6Pt2M
 rsIsPbG9oS7t3AXlkhbY2KW4VGYXXbidHzPF1xESxVHnQmA8KDWuqTmKVO5mnb0k7M9TE3lRpSJ
 iX34GdG4I0Clc9d4aRg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1cb7c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=X9yRgxbac6UzRlJmAAEA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090053

On 11/8/26 11:42 PM, James Hilliard wrote:
> A boot-partition parsing error currently calls nand_cleanup() after the
> MTD device has already been registered, leaving a published device backed
> by freed chip resources. Registration can also invoke consumers before
> the boot-partition layout is available.
> 
> Parse that layout after nand_scan() supplies the geometry but before
> publishing the device. All failures then reach cleanup without leaving a
> registered MTD behind.
> 
> Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
