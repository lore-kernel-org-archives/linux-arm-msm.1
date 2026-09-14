Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1685B3E3D9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371571; cv=none; b=CTJrVLcj4Nf3hkEKSg7/yFgu72TgTc82tPqzUPqrssJ7YFewxkbgrvaeOCoYFvoCKksKgo3ORTfSqjtgFw29/oSln6jULOB6TksTupx0k4k9O0dT/FXPbx0yjb5cbSz/OVD3XbMhTELhs6hYvd7pbhMewYsM2TaNBQGDjcux6H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371571; c=relaxed/simple;
	bh=+45AxSlhEZ22gOSJjZe4JD86VbvHcPcGnVduuHVO1qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWUFk0ikpohf2HKtYwavd0JTD7LUhqToxxvstLZvomLQt3ELNbJzDbMVciGzYHSkO5muG4SKKZLgpaYkqw1jmNNap15jR59CFJJZW+QMMxSsPbzggLtfka2wpr44ahrnJ20wiYuNfnuT2f6i67ScjkQDnAqRbaYYXihDYKmFNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsvsMdAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1gFG0PQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FsvsMdAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1gFG0PQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilxc3196488
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KS9bOyoJ1mlSi0Y0TDim8Esq
	aDPD9SDEMcYeUOECgx4=; b=FsvsMdAFDdDviKqbFzv3ULZ7ro/nj1oszNaXwRIY
	6AqG5HCIxPt/B+7bVIpRIFd3+g0CDCHLAdlM/KTcv/ewpPNP0AJ+sWeqAZZkDkFO
	p1rLT8Vhc/XHLVnpumj7FC8/54pgraABG07xx8SC+J7oFvPk34eapwAniXMwWSSL
	Pet3haSNz2iVfRgd6etx/qv6hkuMtsdiGUanbOYlE/4a+fdegI9+JPr38S+Tda3F
	+I5+bY6ueJyrF5xPIUmRqazaumWIacmezTyQENv9IhsPD8gmyrbRNoX3vLFNNvVW
	j+BgpQmN/oyj0BijXRU9rV1+fnjfKCvfvdIGcRyT4oaYyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so792175885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371568; x=1789976368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KS9bOyoJ1mlSi0Y0TDim8EsqaDPD9SDEMcYeUOECgx4=;
        b=I1gFG0PQmnH2Qo8zPwkq+/A5w6DK7F2e+YM2zQEwUgpAmr6/x18ueUd0fz8z0+5zyC
         gKld+G6BXF04imBFrfqN0LjwYr+nElcttmsElNyEu8MGmybwTl1vtCDT3P5gUR0DmJz6
         Qm9r0e/DM+vIzCpf4QGy7FelgSShGGZp/A7uvctMBtgCaT9kuf22wQ6gzkh0A9kICMBO
         12tCrnRaEsC9+sczFLdbkrEB1MZYlcAZcIOO9E/pT0LaDTxb2570leWL8sR6HV0x099G
         QeOqtdO3sF9AI7kIorTzG+s65gr1kkrswtwLZvRVP5mgwv3cWXJmM4IX8tg/QjEXMmSb
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371568; x=1789976368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS9bOyoJ1mlSi0Y0TDim8EsqaDPD9SDEMcYeUOECgx4=;
        b=clCE1eE9YyCwEQ7sfKLwZT5K/yANAdnL4ur6DQ4wawfW2rEVpIjN2lAlmRgFWMJdBM
         CsmdTQ2aDdiqyNBEXyWDz8xr7mvov4S//aHgk+Xno/NdNhQ3xv3wGlrKLsdb0569QgRn
         n0nD5ct/vNJ94y0lX0Ltm16YPLjpZZDpi/gM/oFYnRUZBoyxi6mcGEcY5BUxuLbmr/hc
         8mZ+aJ827BJRl2jNEM0p756v6UBp0fi8OXFdP7MvaLIaGRxxR6LlLIZvTx0dOsuFJ174
         upK9l6Yjy9DyFysmNoQPjec41E8ex3L6ttf1VuK+Ccs+ijmc6pFQxFY+FqiNg72GA/O1
         aX3Q==
X-Forwarded-Encrypted: i=1; AKwUvBynhrxAps7EoNHO80V4Ek71l4QMpzbgAYA3xl47rno2J7OMg9iYQ39tI4xTGJI7DWupx+IrPvVSxhiVcnwq@vger.kernel.org
X-Gm-Message-State: AFuF++klvCuB/oAhGH1t3uOpAzy40uQvz2UCDLjr9LXHc1H1+0AHr4/e
	4NsiCJ5/TqGvsEpcIzG4s4mGZ3T11mX0ZsmeZES7Vce1MY3WVJlVwqp90zeFwzekt9T6dw0EygR
	goPSdALlCcjcYlyBjPQzHUfzsOx6/fjexUwi+aDFoIDvWeafTQVerEkAq+MJ9PTMzH9TI
X-Gm-Gg: AYBFou3RjZYD4+/QPIIdK1np2TzYfcj1EgpiObyyawhlEGGiITjCG0hAf1kW8Q2ryAd
	LGTW/jWL1sJzY6LKcRWsoBoVVGbkjCo/6eq10QLBoORYVUE7uWG4parZ5GEuTwgcPuzf5VH9HmX
	yWMhn6H1tMsnFOTuyrQOeksXpIqS98JA9qETmijPqt66awo+gfLwRwtN4A736eTvZEQIWbr5dl8
	ICOEnOS1ZoO1RQEVPAMQE9wrtcfaV0+B/XqkgHvRX5OeW0Gld84IO7lDPlD2kGt8TEN8bwpiJ0h
	gNaCBdg4qk7mtOolfWXCvLD1pBNT67oWejXwOdcsE4bqirKQqHbkU7+4ipkPDodeTwl7WDQpD8H
	AwOodg0XkOYNronk=
X-Received: by 2002:a05:620a:4688:b0:939:707b:ec10 with SMTP id af79cd13be357-93a29c360f5mr175323785a.52.1789371568268;
        Mon, 14 Sep 2026 00:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4688:b0:939:707b:ec10 with SMTP id af79cd13be357-93a29c360f5mr175320485a.52.1789371567800;
        Mon, 14 Sep 2026 00:39:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm440910475e9.3.2026.09.14.00.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:26 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
Message-ID: <evo5r4og575lxcct47sx2cjylkya3lbjoyqjhithqdhzimdljj@lhx6r2b4xs4d>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: X5V4zcDemz6qsSRNgtoYINY8o0c8rxTJ
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a4b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX/Ht2c3KyEXuN
 n14G4P+8Hlxpq/33TGvr7OtUPlj/oXXIzNmtl5ca0S2OwXqXjhPnfrCroQR7uMgiItT/xJf4/wv
 tiVOhExAG1tz8Xz7D4fXiLzr6UuKxZw=
X-Proofpoint-ORIG-GUID: X5V4zcDemz6qsSRNgtoYINY8o0c8rxTJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXzHu3aB3VctXc
 SXHMe52vwJB9xtCHeyH+egNebc/qjftl/KCQZbvOirKG1qAlNjYVTjgywuTd2zKThzVbnlxyaka
 V+4BLxE2ClMFqKWvpQPuZWfhARfBkFOUGVhtsCrOJvLr4KeSoJ9aXEz4Bs1Nk/U9Jk7slbgdmo9
 7OGh88eEZwtrCvk+vpLkGXB9f4oCP0oAqYMFM0K26E69csjLXLw2V/edCxFZKvHHfnS/7VnKrOH
 JtYgMPDrW6OEBK7e/ssDFhKXbWO2szsz51ZphX4MrTprf2z59PoJQhQJWDEoXC1QCYp9I8puu96
 RK+wJ/JFzSS/yULeWKDzc7QvB+ZDu5LTQDsBx2748ZIW7+BQ5ow0tBTnCUFmqK4tBqcSvQ/AtwE
 OZeQt8acDnjx3r3fxXHjfVW7JAMBW2jhBtCCom9SgXQESZZ1VBtPzWrbpS7D7lyXkg0XYFMubs2
 eHi/rYtNhdKOSH9abfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:46, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
