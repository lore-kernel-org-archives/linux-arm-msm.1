Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C75D3E0255
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052449; cv=none; b=QGHYkia5UGX5FU6bv1Ifm74g1mzMzYVrhEBg3tV09GWRBsbFKFDHzctmnpoKBfGEU7cDsyoPqhRIbBBjgaHulPT/T1+itoFO6Ii+fx4j9SQYcXD9J13ymvDEvZBNXxwulruTuzlqUJRYNLS9aadsyO3NqBIjlcCjd5ATBghnz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052449; c=relaxed/simple;
	bh=1GYpsHv8UX5mbzbIEJoMPzYfbm0qNSMJKqm57K7UISU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4YU8E++KxbAqHvrer2vrSquxxAJFgaFZ1tgO0txHnwHUx8cg8kyxTMoxl0b/lgcSO+hvfWS/w/dYYdmqgjkpUXpLiyMCGQfez1v8Gn+rsMhgi5IFKky8/4s9Fhy2eMIOIiuKNnnmAHDzrHeFU/61e7ePk94WCQhsw2QFP6n2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/IlP01Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEIcgB2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/IlP01Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEIcgB2x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABbif3979153
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnGJcFsPiscDtlVa50dVE0Fk
	eIL36dVjzA8lZXEnLkE=; b=M/IlP01ZHzsIyEY6wZQ9AFxA0N2MhjHH7ZL/cV/h
	q190hfzvcipRNNrMOlD9rKgWxCVwxWpLGnTrIfD4By44EzeHSO7W8C6E3X9CvTha
	j3N5JDt9k6bdLWZFcwlj1CQ4MDmsiLjES4lgyY2zYOyXUNJoYflJk5zHomEclkXR
	tQSsRtkqWAi9yisiuHKhQNEh8loYekXZQIwVqqxQ4VOr8sRsHnXp3MqYIq08cL1V
	QXAE+QlyAc0sR8cRL1nDBwNvyuH1uGokG+9zdddRgC7RFndzxQLs2YF5WGFcRl+j
	sZeQSkR7hTPY92wN+Ibq8YI65o8sy/SQAxCfhCpxMuvKtg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:27:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so104294585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052447; x=1787657247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnGJcFsPiscDtlVa50dVE0FkeIL36dVjzA8lZXEnLkE=;
        b=cEIcgB2xIdy+770Mo+ESod8kQfbuBSVgPpDbwp2y6YY4UvVTcFVC9QDZ71VYP99HDn
         GTlyVhikAn4vVs1i0gaQx9S3c04fF9ZjGeiL7W44QHmXfNdSRNV7Zo+r0BTADasJ2zHK
         jtsL30vZU44dSRz3pxWn6yZDse3YGv+V+9FMC4viNNJtviEKFmHOtK+iMDjaRNhvd4Ks
         zbOLbGMc3oJ/9igf3w1NS81gQLLP2GY633jdQ2JfLAskzH3lffEoiUO8jufYQ3i3e7dQ
         ros/wswlBWq04Z8Dx2eDq4QdsoPspH4hFH8rVxVsdb4Z+JKi1Ow4d1hH2ENafw2hc9Th
         sAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052447; x=1787657247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnGJcFsPiscDtlVa50dVE0FkeIL36dVjzA8lZXEnLkE=;
        b=fnZyDibTMJgBmXo3ev5u5wJ/SuOjhDrXy5T/9XGizDlZ8KuOJd9BlG4t1m5eUk+Bcs
         dez8Lf8eRjj8L+fzv4i5uaB4TCNqi+jgtFI1QvLRvdHzIdHhRYoq2eukuMxZU0oFUdwu
         X1tReLcD33FpFD+3ysqCO/w7MbIiuAoMvf2A0mdVgs80STsoA80Y/naw7KAGBDlsGwxL
         1eNSSxl1Bol+cfrdeddmYWA+/vcMD4KMBOukNRlZvfAo5k6h7+nTg/FNiFh4uqjL9Fb+
         PO90htqR46/pFbSzJ/vnrNO3/foRZsZOHXGEZzHjt25k8K6StyfBjSblQf1SYMCqxbEO
         I5fA==
X-Forwarded-Encrypted: i=1; AHgh+RoR+L2cj3fyvdGDGbcBIpkhrkthlI0f8UawJfoPdeG14i59d5y7PPf0FES02qiiOxRT3ycPCQ0zaOUjEFrg@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaoyfHAQhO+qrgQeizCRNCKJ0woc2PJRLHj0btEqoyGwU71aK
	zr3ZIVVUPzFo1WsY6FqCdIsS9LDY6QGrcJ+Lp67SV7TfHqLiZv8jT14UWncGlvA/TIAsLLVpHnC
	ws/g5QAJkEabZGcXK+P8+u434JTPEkMX9mz0NnpJNvIK5H/XGnxtG8X+yc3iAp4esN+vg
X-Gm-Gg: AR+sD12FrFKx+mkecp7X2w728bm4OeXYFQYjQJQjFmqljAflKMoeiyGDRY/OJnyG22J
	cN24ACkRTXTxy81qT1PG6gTVqpe5D8pEPiF8p3GQ1M1/YpkkLrHuBop9loy6olbgNG9WFNFvkBU
	YcjAz48WeciNnCNQDNIU6t+18E7j9N4s6wdEZOJXe+2YYThL2ywfry5EWJ6zrUA6jvbAor66UbA
	+w1Jb+3HBiSKXyZPNZ7vBaDsICgYNEtUn9K710ecoH5Ntts6+ITAu3ljGyT9uqv+Og7PguHbfW6
	V+FIDgH8ChVZv8zdFJE0QZpC6Qq8Tj12xWSakK5M4Fcc75rZcTpxpvEAnXnNOU/0s0mECbIAwx+
	ZI6n/jmEMw3Wyyl1Q+dRmpzKdpi1L5EdkiYFw1wyb57C6gQhSJl5SBKPUijlijW0RAh5i6mvxLn
	Ie9EKzJeBvC5K6
X-Received: by 2002:a05:620a:a2cc:20b0:934:b798:c245 with SMTP id af79cd13be357-9370667ddaamr427163085a.16.1787052446874;
        Tue, 18 Aug 2026 04:27:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cc:20b0:934:b798:c245 with SMTP id af79cd13be357-9370667ddaamr427158785a.16.1787052446452;
        Tue, 18 Aug 2026 04:27:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e1f18sm12120781fa.12.2026.08.18.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:27:25 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:27:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Message-ID: <4kerzsphzdl3e3bciiss66uvwodtkh4xhuyfirpdxbh3b7pzmu@ta3mq75jecor>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-3-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-3-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: mmxt7k8xmtyjJvKfg7NHUm0ORRc6wv6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NCBTYWx0ZWRfX4b3L44dcgssh
 ltRSVEdNrneWomjCTiYj2NZlZu3rLHf7WqvoIW40vov2eqqEfNwVHbDaWk3zyXwPprVMsXQcTih
 vi6YY4aYkpqf9KxIVb5PMkV1CEk5Py60Jox5qMMFblf/9Z9Xr1iPLNNt+K8xyHeAGp1Bitx1Wvb
 N4ROnpMONUujQnj4c8y+Yw+Qt/EkSOWuQrPQTHiYcnocie/kVrMxVjumixXFBuPnKHRTVrm8Lsr
 t6BTNvFX1rvigS8AvRIV3pLsmQYRF0yO+PA3ORNv4cLT4cNdiN3vqSpoDLiDtydQ8VNPlMBHLnJ
 VK/EcJI/fniXKO0OF+g6+3r50GNCiaUog9QySqdvN/2qGwuTJbokGmpdWg6Am1MjX5dduj101F+
 nNMmE8G251BVV8IlQ8qv0RR8eBKrUF4pR+xMXhMaE4w3OUl4crU7ouyYC9uIkRXAnPBn1c9uyiZ
 BS+ASTxG5do0vywPh3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NCBTYWx0ZWRfX5acwLzvJpzGo
 MrtgTrpaD0+W/HnShb/4LJcgoqDyaRB1vuybzng+3FU/Zo7m+agC+Ap5MFTFhPq5uOXJ9XZvmPx
 xANodY/srr77vAIUfn3XPUOmzQmYkGI=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a84419f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=sRjO5Q5YVjkkE11Nc-YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mmxt7k8xmtyjJvKfg7NHUm0ORRc6wv6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180084

On Tue, Aug 18, 2026 at 08:07:44AM +0000, Sreeshankar K wrote:
> Add SoC ID for Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
