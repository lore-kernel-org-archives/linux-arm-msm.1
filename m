Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463037;
	b=cEa4vTx21rrTXVKp3mu98RVhTUeDSBS+kmiTBcwuPxfDceKVScmdL1ZjPMLAh54sz7GA
	 AVx7sjKO/lDnAJQHi2nok48/brPEVGe/PPC/Ddi3imu4NeZh94hxIR33VKm9YGPVlzGG/
	 JjWaMeJDxHpiUpT0T6oIhJcDl7/fif2r5TDCUicnUxmJ2oo+gYtBPInWn+wgz7wccpLM9
	 mlsIq/GQOxCNgvnbJuXhOBM20iW0ntatE980Ifl0ZTIjYA3mILGNcAS2Q31pRkf3TEoak
	 O5ROKG/7yr4YZvZ0WvRcicgdbzK6jZ89TfiteVJDooQoC7ke57sB3GoyQ4mMkm8eBmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
	b=HY5hjpajwFdZgpePnapBClaZ+6nkcB1OdQeEngL29FAT9XvlxnI7hbv0ahgPH+t47ZKJ
	 qpOV+PD6bGKpnf7yJ2hYkhrdoBW9WtATsoVhda5K3wYzw699yAMahmH+CgeiLn7glqfKO
	 yQKJEdpNYpTfY0PzqaGQrpgDJG2GNFlfSGbq29NHITRKf2BHttU8+sH59O3dwbUfMtPYm
	 F/y9BHdV/80KhecSUOVCDOMBAQyyiv0gh8KsYBj864F+fNI7aZAAHNifaksfRgZEQCaxO
	 iuXGzXRH3JYnQ8kmCqCmwDzxTs3QciKCloli5lWiTqbaeL3YSYOJXVAVT81MwhJy38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDa5qWFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68133606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68133606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jlR2J6Ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDa5qWFy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGugX2486557
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcrUVABBd5BeMh3yq/6enDr0
	xTKRX2RD7vMv5/wMSTg=; b=jlR2J6GeUOvDnOTPhh3wO8ea+tdICFP0OpQ2btOC
	O5un9FGL2kd6S+hOypQb7vGG18+TcYQvUp5jr03s57D2m47fW/1Q6hYTr14jEcAF
	Gj6Rh9x3xtTdw2PteX7tjHkeWGXAPZHW+Dw4NexuvA9hhYmO5033Kwdq2KVL+K2u
	Ns6ja+cE08Q9ygOHZ74KsGKHFtVYNxvwHbjtIgcZOmeQBXK23gNCajT18NHaeHY9
	f3ZpkRiJf4RTGA6IDuWEPG3Jt1MQIK6AVBjnQG3uyYvwHSn15O/O2rGFrIx9LRTd
	SLfth1XV7FJADTB6bqovH0S3yNW79HiHeOl+oAf5OCC4iA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy036th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:43:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so739427285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463035; x=1796067835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=iDa5qWFyJj3qwAhJCC0v5x5b4M+NIgVjV6kQjYL3NWhfYYc1UfxmNzaJCdOZoPkoL9
         jTGCJg/lMQoyFvAjIUNgMiPdRmFBMweeqDnYDzFIOvKsYRmZPfA6Txr7N7QkEZmMdT7b
         RrjL0OUUTOmFYPYY2pA4802adfZ7QadeH9LOrl/23pGAcKTw5vyg8v8lUdsIqf/I/01T
         71bBIyINshwONZL2SeF6faqfTZ6Oivu6VmZfEVCPoKmqaEEexOs+SfLdF/FXHbkKY7O6
         8GnThM3WcuTflRjCVDmgwUv5XtN3tYeFQ3A60BZuccKzeBCeHFQcEEDluIvTlneH7yBW
         8u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463035; x=1796067835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcrUVABBd5BeMh3yq/6enDr0xTKRX2RD7vMv5/wMSTg=;
        b=oE7xdalf6UVj0tqHH12FA5LY6Js5VXw6qr6GIQweXCgIBMU1jb3pvg7Y+vpbaI8Tcj
         vQflBj2kaKPEFycFQt3aEQ5QtJ65aLzXqYpao2rZ8jH+4HTT1eu9NEoI0iiF9jOHsl7r
         W0BFb2HCuB8yAPenEu0qgJI8QuACqrpQpkbdx58h3gJDfJPGBhlmo4x4Y5q/5dHXEzSw
         sGWFlcnaqYRe6lhBL09qCB+Cw5PK8AazEexfV53I4HMKvALGeXVXjCL2XUfiaA/DXpQ+
         evjI+gAmktiO3US8Wf6Mz0/xuxvVGraNaNshVyDa+hocfKPZCS5/IWA0bExg/4wnXyV6
         I4Rw==
X-Forwarded-Encrypted: i=1; AL+hErHp2izXIrmXAoLZF5hjPqNK2gZtW0g0+TrXukLmv8eZe0jzPbE3uBvHm/Acrj53xby4jj9zoewIR8GvoQxJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+/RRzGyBuq6wIPl1rzpLKSk9U3xY7+9VfN/joIAT7loE91+Sa5
	P5+tzG8OZWhQMwvs+r2fJ5JX7VVTmZVEZVhb8QTAeYrGUyt1IG29zy5wJTLZk2v/jpSSLz3pYON
	kl6pg1wwO4rS3PHJjqib9brN9eD3LH9pDyz6PqemW9G2peALzr/cO5bHJ2B+Cq9EDCVgk
X-Gm-Gg: AZFdTZc4//u8LSvOgSOec9K5X7eCV4YXHoVZzddG0hgh6ZieLStLA1ykl4KuSeSxbFL
	CEQsAvY9LTkSR7QwPTsr6ZxT1ez7l/lOpYOIAuGZylkVeeCsM2SeCJetLZYww3PtuA81zMmWbWi
	XxRGNvCGz7OCemtsSur2B24O4cfkPr10lt5d/5vjKmtjkmcyHsj4FmKHdEBtZs5l0FjuC02ijiX
	HcaK0F2ytQ+jFAywgzLoyPtwI6PMx4uQQQZWso1kYV4BAcoKBlN9dCKST7+1UIRw1M34LurEbTn
	36V3HQU1yqOHDYSsFfjRshx6UN6M1fC8kaihQ+gIoExdj9gED6q+JRmAWO2VgAd0I3JGmANTYzW
	raOrF4QG0bI6ZHrGUW4Opnx6S1W3Zn8F5s8OvHD4LnQQ7q8kYK+t5cNidWhY/39k7
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013018285a.22.1795463034435;
        Mon, 23 Nov 2026 11:43:54 -0800 (PST)
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id af79cd13be357-949ba95dfc3mr2013012885a.22.1795463033726;
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23340306f8f.20.2026.11.23.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:43:53 -0800 (PST)
Date: Mon, 23 Nov 2026 21:43:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <6yjftfrc3e5xsxqpzpab53x745utqey7ivz3hws3l34qmlxdho@jbcmzbhdq4aj>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxnb/+dCUvQJK
 ECiAXG0tCRTpJGOzrAu/KuOXNcEF42HNxdY++tFrlVyIEoLT4A3iQAlifLzAb/kaRjj0FVZzb2g
 /Z69cxsQW0FytGM7tCOj9h/VbvQeUEgFxcWGw6mFhgSKKT1s7U57uTggIM3iQBD7JP9I8tx0GMV
 GjWYTzGGWtHXAFV0ihnBEX5JGLBSe5AChnpOzRTAYIob7GiuQEC1kTvA7nWooGuMqwOje7rxE74
 kKD7RGuFyx8E/8x2Iek7/4g0A/sZRAP3rrj7/i3IPqrPTP8JLcRrJ31iJBCsSeL3oRgL0i48ID8
 Cor0ieCg+fq/N/5+cN3fYUGMcfwbazZzT5IqADlymG1gizaTS+/3cyeZNFfUYAnEEdBUVNu8HB7
 9l4FP4Pviysy4GW2uuHedHi+RkXs8Gpm3jW6NpUAlWcnYNs+EGNHEzTgEJ9aoylR8mYvEATiock
 IYnX+GDDg+o9z8PhKHg==
X-Proofpoint-ORIG-GUID: aQbmOPLkBTXRRMxpRvJ7eJe7taJ6xiGv
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04977b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aQbmOPLkBTXRRMxpRvJ7eJe7taJ6xiGv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX2G8LDa95q7bZ
 dLo8ePbj/9RlKXV9jY1ux5oszWsf7MGNJA69i6Sm8ltoo5zl5uMexkFVqB5qQ5Cfh6IbinJ0WLd
 rGtHvrZd6c89u1ipc28914wWyc091P8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:50, Bibek Kumar Patro wrote:
> On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

BTW, can you please check Eliza SoC as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
