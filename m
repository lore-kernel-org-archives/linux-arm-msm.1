Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1423BB4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153066; cv=none; b=Hp87EgYyt/CsGGkQm47LWjvNgydTtitNQxC4spXSvVekoyR7s8b5pmL9Btj71lUCo1iCrhJNvPSonxh4yb3mopQzTWRA4Ur+g9ce4YNKTQ4BMo0UX7a0SR2Uf/h+Y7sA/JSxwk6o7BSgBRhb5bzYu8S32rRNks50nrXpiDIpdxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153066; c=relaxed/simple;
	bh=YpDQ3XhvVhvfLRLZsEXlRguGWgNjVmr6l41P8oPhHPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/X+i6Dkk0/Kzhjmtj629J3RTcfVEvLpNrMZ5yJp9c2yAan7ZPf8qnHp9OgxPqh6lH6q8MGG2mD7X7gSHcbSkO82QS3FIOp1uF/t0HdEPfARyg4GYrHix8G1pemW2s8p+DieYwQBZC39AmDmzBFiDwzKt73AKchdqaeUuqsMoaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hov1pXeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYHm7a1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hov1pXeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYHm7a1X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMBZW3427654
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y8z0/88PklANFKMJObONxxs3
	TUqqUnk3xNy9wPUf43o=; b=Hov1pXeWN06cXiXx+XMKhwdXLpBzk1vRvVnGVRNw
	F0nvVvKfkkxM8GYVm7hFKSErYBNWLqPwp+F4yA35fcALTdapWFkhhgD/D2izbbiu
	3s9uvgwNOKDXHkQgp+ZrRCdbTy2QJNvHfAsL/J1JBBniaqpW5J7woPivqwEOjymI
	c3/pWCYvRToWBhUuSHfc8fTBGd++iIaEIVPQ1mP40y95RsvaoPp+3lqcjG3dEQO1
	KOkcGlck05JuLVFhvJVnh2UvP6yCz8r7EKiWKCdfgO05La+UyA900aRfqPYiw7qZ
	t33LWdyRU5j57zgjnty33p1OwFj/W85HhaN9EpvenVvHLw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2d9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:51:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1960234a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785153063; x=1785757863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y8z0/88PklANFKMJObONxxs3TUqqUnk3xNy9wPUf43o=;
        b=JYHm7a1X6dSQHp6eHii2ya57fAP5vRqu9m3cfECdY3vFqJDqwE//eyoL/FIVR6cOpO
         J3tzIuyDfAtFztfppDnW1MmXsr7Fjfg9lKxqFOH+aFtP0BcvMT6pxOpdG7+Osfk+8ppe
         o4cOMkTuHEiGsOfCRhkzMHebTIYJ+bYfL4hsRXjYqfIp/IDelo30GygX/scDhJHW8690
         KMAhnDoRVXIAfYXevxg/SVb9NgyyDhCePag7U6qSciAg5ozUxv7e3I7Rrga3KU2VjqgV
         cltOmshS3tE5YhGtwjp+7Z5lPcx6M1mJ7Sct/0oOfI7k/ep5bTIiWHIuH4TgCCwDg0wX
         q1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785153063; x=1785757863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8z0/88PklANFKMJObONxxs3TUqqUnk3xNy9wPUf43o=;
        b=h0OD3bwCw82EBpr6A0ekza01xP7QP12dF3sA1fuFyDug0a83LeufAycl1M5rxaitLC
         hUYDoGL78c9zyuudxVH0ZgrTSk9ZYEhl42RONesKqC0OrFFsD5qdvH/f5dNHYN0z9Wrd
         0+pwR8Iq1JYIeiqSuGKrnXY9+6d+ugUvClx+rccZ5EImVDHDcNS4IL0sT0rsoaN6iTwR
         XFknlkCuwKqQafV/5hBldeQBD5FDywILWsHADG3BmSlRzBMD3pIzJOQQVIdhUuPz5gPM
         kBFI0abSDACje5ZkXB/hQlnbRgYGbAsBOdkwOvX8NN0J62x8sNoTA4UqVgwywB0g6cHQ
         q61Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6MTQC1ob3DYZCfhTZYWkZINk6Nv+JQ/HEz9vvmoNJHngGLb3W6qVhjvz24/sUZKzuXsE5ODyaYX4Jq0R0@vger.kernel.org
X-Gm-Message-State: AOJu0YyadIeQBVQogFbp+IF6u6W/xH2DP6hwUsbZPRohTI2weRWnBVTP
	am6rjrP/sQYPK00taXeSRLq3+xPpFf68fiL6JH8M6wMUXUoIAHgJA46yRyivoFVan8N55A8fdK1
	rml6fhLdYd6EtxFpSwf6HmPZQA61aQ93ulbZmeOdYvidh1ojT1oXmVZ4s3aEokLXWfijLVFuFy1
	aF
X-Gm-Gg: AR+sD139ojD9Pok3BGKnTaQPjNvkl61MRqwpytu66FQgLppI/e7eoE+LSqYqZ2TdffZ
	+2TslCt0E7goUmyGQZtkymvvLrFD20BivbuFFs28dy2df6yPnECUGlYNip0GlMPWl2UdN0fuepL
	gdaLkkqvmXTDAv1K/Z/Jxvc2kkbN4J1eqJnhb0xtwo1ygmTP1uYogTgFPy3XYjtLC97F1iBMMm1
	xzaXj4QEwZnRN1KSNvaQoV7e+ixzjXUKl2l+mlRZU1ekR2qUfHc1s93LXmj2g6qB/LXkKGdcZRz
	GsOzZ/ckj7tKgDYLaI81ZnGb7TvopvZArUhUzkxa19nmGpih+3C4amesLTGoPwdfC8WKGZKrNb2
	bMC3zfTtwI6fOR6GzAZCZQJdkKpU=
X-Received: by 2002:a05:6a20:7486:b0:3bf:b68f:4685 with SMTP id adf61e73a8af0-3c67d9d5751mr8221550637.23.1785153062519;
        Mon, 27 Jul 2026 04:51:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:7486:b0:3bf:b68f:4685 with SMTP id adf61e73a8af0-3c67d9d5751mr8221482637.23.1785153061766;
        Mon, 27 Jul 2026 04:51:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b282asm3228707a12.18.2026.07.27.04.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:51:01 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:20:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, broonie@kernel.org,
        stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: Add missing <linux/bitfield.h> include
Message-ID: <20260727115054.phunth7apgfnzm3e@hu-mojha-hyd.qualcomm.com>
References: <20260727050238.323039-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727050238.323039-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNiBTYWx0ZWRfXy88wDuIEdJxB
 T8gZlpxc3o9iVGdja8LPsaSm9gOL30eIDQlE+ovh2eTNyi/LkqI7c55AAojPCjpcn/L774bak4L
 uuTrpUYM/lIozDi7gjwQtSJH/wPMpM92RY6kqVpvLtobDCCIgjaKPKDBvbQQ6dvmJwW5j5qYNrK
 QTZy0q67Hqc6wJXvfVvYDsxha0kOcDNrkmJRMeCK17WlSrvlMD/Iv0KzbXyLsQ30HxKl15nvQbE
 /KlZTw3F/SO2+aZUNgtSS83Wg7cJ9IZy0d5yTmYTjCHEBwUl/i+fvArtnuMCkSL297zwbgpGUUi
 2eZQEds+Cgm5GJbOW8ZiZ6OGoSWEszDAZGab2PId96IKjWQnCbX3pKQSB5qZD0LGDD1EbsmRFSL
 mG85YpS5JOeeJi4a1lUZy94qqnYxjfe/DaM+Z8UThT6oC7ObRG6zbPjuVCL0yKugEq1Se/P1VL1
 2vtlGRfpxcyCdazvJVQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a674627 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jv8Fol6KuoA9TJbqEcgA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Vdvu5sfuWacrZsf5ZyDfA7U9d38GsNg7
X-Proofpoint-GUID: Vdvu5sfuWacrZsf5ZyDfA7U9d38GsNg7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNiBTYWx0ZWRfX49wTwVBVrE+8
 1nA63ENPUkqAAKzkPHbrUrKIDfBH+fxg6J4yvqmzy3ADCUE/Pd79usq9SwLIujm2E0ezFldZBC9
 g+XqcelUHKlgLPJciuKCDVfSMVWpt+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270116

On Mon, Jul 27, 2026 at 10:32:38AM +0530, Ekansh Gupta wrote:
> Commit 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with
> GENMASK") introduced uses of FIELD_GET() and FIELD_PREP() but omitted
> the header that defines them.  This causes build failures on x86_64
> allmodconfig:
> 
>   drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_GET'
>   drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_PREP'
> 
> The missing declaration also causes a secondary -Wformat error because
> the compiler treats the implicit FIELD_GET() as returning int, which
> mismatches the %llx format specifier used in the dev_dbg() call.
> 
> Fix by adding #include <linux/bitfield.h>.
> 
> Fixes: 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with GENMASK")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

It should not have stable tag, as it has not made to any stable tree..
May be it can be fixed inline in Srini tree itself.

Anyway,

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
-- 
-Mukesh Ojha
