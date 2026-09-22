Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BD94B95A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109681; cv=none; b=a83jtuXHZZGtgMCqGST2aVsS9/7a/w3KtC5nHTvniJpsq82pFHQYDE73dpjVBmE2/3TVyLemTnBn5XXeaPy25oYLOFm08/skhbWu8rKetgZt3BedhX8gyjQVRdbW95kA7LI6Xsfxvh1MnAZKFOksUZn68hWnUTXek7Y/NV852FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109681; c=relaxed/simple;
	bh=Was9xrJcKA0i5gWxWGN8G4b+EGFRxvYGC6c1tInqrrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC1Ps4gJnROPI1RhC9qSdbebJDeiSAmgqFDbjoCh+ey5DT6E8P6oGGuIMNUn+bIsI7aSiI0+0ohPnfJ+E20iQxNpI74k5gRei43WdRTKKBeAfXfOByuZwawgzxdvmd7oohA8X6CMrtNMg7+luswFImMeqh2EZZT8QOYpJEHw8a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE2AiTm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8UbU0rG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE2AiTm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8UbU0rG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXScf268429
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpSBu9jvqWp5KjJaZ47d6NVO
	S4pKiq3srWWOoTSWhdc=; b=JE2AiTm624Nz2B/YsNFX2W7LqpTQpX9Yh/3jJjfZ
	0CrqXl912W5uaWLr29JAO/zJsUKnuF4DQbqWjcWgv3kwUk7Us4iU4pFJdoomeNKO
	zd2LWkzp+i06V0/OumiOHxlYhUYcMYsYWqf9BeNk70yI+U0mEQSBtq9iLK8CzsGF
	jEs87pMVdRmTqRDCWqbAR1esY7Uf7NZQnXi0jZNE6u95J1Jact+xm9LjzP0SQE4t
	XWJ+dZ9hL3ciNsOtHJm+lrqtZpMXTKndWRIAJtmEFRFwGhJwhbMLYEY+N2AVJRaJ
	pGXWmLJ450mccGRVuQtYwf/Llx7bLwV9hBfqixEDxJbSiQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c0nn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:40:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79cdabf7d89so221787137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109659; x=1790714459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=f8UbU0rGAfened+Vhx9NFgFGtPe2KJ3E87RmiVCE/l5zN3Skca1vsoN1SmOt7twzn3
         1Nc3truS9Lz3tMu7NcVKat9Uij8TdVb/ShQtOrkk1q82aiZtXeZKmSr3SDCClR2qWVEG
         33SPZCjKQV4DvqvgGebuzmM3hUOAkGeYlrGZ5IRPHcQHsRXIqwMyXnXWUoYGJnPDx1LV
         qw7h/cRsLd3YkIBedzb8W4+Ag4SLZpsMjx6FqQO1Lg8lbXSNBAZMwDSc1afLApYCTGzR
         ij5sNJ0iJLhuWtWWzXrg2QXab1B0yyioohxFXpWuppllbx99sg+c9ROayhoa+KzSIfEZ
         P9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109659; x=1790714459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=Y3jJAU4La433LIP6oHUN5v9R3nd0qdFMAuvQQo5sjQ6MuEhTbxLK3YdPy1Lz76qi5b
         jnl1P8ppd9GeB2t0NPyjKENjtCFKwYW5aUP5zLXUSbC0tHQUqP5WAfeWRRB1/LAHI3GY
         7aTJ72KJTgWPh3h8ulSA1b75PAsBHdtNMAnkc/T0WCe8AhlpjD6IPxU7EzBlwLl0MNaj
         ceigU7riKI2muUzwEKvYY2LrcpX1xDfldpEroU6hCEMrxBqEm0ZhPYK9ZkWKcVL7WrMQ
         L9HMB4BaKMK8X04eZrwRpxyvsC11FJcnoVsrYOmBrQzA9vb1cUqNSr9CV9IRtYzqTFNR
         HD1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw752EGI3KueSsvOlCP2zTSPVu8guYTpmc3KLgEckm7BTtmUczO2kPS1kIz3hjYd1UQhvC/NaR2NYUynAq7@vger.kernel.org
X-Gm-Message-State: AFuF++ms8wtW5z8LVtz2FzaniY0+JxfkmrdZ9vavtElOUS0EfMK9wZn2
	iyQvZoI2dAj7BFSXLjabaijMkFwuskhtXwt/CxYfT5BziNn5SzcawmZ0TsgCcZAdQJhuWHlool4
	MwSjcTYzjrs5CRDBBVOW7/LRCha4nOfYeQqicyYAJvsh6dmYZhqrmcpUnuVW28fQmFNUB
X-Gm-Gg: AYBFou1hhjcizJGDas+AdS1iIHZpWLdpr7RVIwVAgmNNdvEuyki8DdCGgDPKIxwr1N9
	oOHsXp4w42i8voZSbxgwEC1onizcQ0Mg/2FrXo17UO6h9fp2fhPfpfidMBw20wRD7O/XhKOVVnB
	zDVO2KrhG7raeuo+JNjqsD5zysA4+4/0OK6Iy+P0gJ5GC+0GUSQiq9LFt2rHWA/vNZG8QrJNnYY
	vpmTC2zpaV8mLVwMUrGyDLgPB1MF7vGQZxpGLHkuPku+auAikLtexpeZ5QpIc+J20egGlcedI3E
	gDwEl7TOwQhjRt3L9ffy52auPV1lbH7F1SDQ0tc2Zm1R74Fwn18EPVMRHI0AuTnK/yLRVo0IdVk
	EGNBX8WHjzR7ohQ==
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771089137.35.1790109658727;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771060137.35.1790109658190;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e045dsm18896285e9.11.2026.09.22.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:40:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:40:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
Message-ID: <acfvnzzcwzqq2pcchzxkrnesdcpqthmucax4elht2xzw6kd767@yqium6n6lb3r>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: 0xfjs9P-B8i7Pu6TzxOnzxYMlMmVvtIe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX0QKZXsBtgjDh
 yjFv9XrmAPtjRfynPjrJYDP7fb0WO97o1Q0/ue2TMk2APPWILRV04GKf+Q5FNx43UsGxvz9VLMr
 tyOr/Sw37bt9Ga+QYI9QliUvi1Uu/0I=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab2e7db cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 0xfjs9P-B8i7Pu6TzxOnzxYMlMmVvtIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX5z8ID6xutz2X
 jWZFQbBrHGDW2nERuA3KkSVahGZ/NKi0HwpvxbwirAftAb7ih57zBOzqVWbB5ZxrvVckOAO3aox
 gJ4jzkah3aSgmV9AnDYEtCcX19mLUN4Lwd9H50OoLVk39LvkddP2djb+nJBavWwklN5CzzGyseG
 evt1+loUqbQMmuqED0O9fttphgDiwsSblgyAwq7Hc8wezPdksn3Ajg6tm84oqohkbV2rPuXkOos
 SDSq1Mi0/juLucqshGZEhnj4E8GCJeBta93avoZhFJwH37jgUyR1fHLAAbOp49hQpIrOch0nHGQ
 Z0OrLgMVAG0spJ6RRgvCtvor3H6VWGE5wnB306n1OTGPEXHZ5MHs4olorD/8XYwVJ2lnem0QfiR
 mIfzwUvFC7Y4dForMPCw7dJPVrjrO9BD1sXY2QsVwZdniwO90nBdDxT16xTbvCeBOCjqnfnvjb9
 FFDnYHd4tOYK/Pq23cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:24, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
