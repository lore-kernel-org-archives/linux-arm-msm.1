Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578869;
	b=oEjBb24Oxg0lA5xK09iKG37Rh/5xsNC9BGvsS3GMwgylyMko+pZTb2b3VWt0wx155RbW
	 eR7IlfIeE8BOMQwNSXr/wqSuy3qlqA8crDq5iCRPcHlEcmRaH1oHGZQLmc6htGF47Hp4M
	 6ySK5XjaXub+clLzYokTgRttKA0y9d0iziDrQoRtAVGv1VapsEKJaQPBncASfAGry7Z67
	 c0CCOoYrCoJHGwfSTKrjElA+ZyP49rpKlb6+UNFJJq6zSqjaeyTxMsbRZMfyL+szkZTZy
	 HCz846XdhBwNwe3+XiNt0KS7V+4r8Zr5K/+nxmNgYIugdQfpxgmfN376chvSv0Y/UrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K2/rXHmCPqE90Kar2gFfKfylVcffvSB40DaENFVBwj4=;
	b=w81JhPxyBdb9NGOqTBM+CjRrQoSJiw4Js5EPwGTg5212G7PPz12HlOBv5cYJMsy0Unau
	 YmPo+7D/ZrY8tGhyV5UpTpes9VwkXdiQ/xXU0yM8coNvr8v2aV+Z0wz5LmCLyUEKUSuzx
	 deR+4RvIRpTWi7gnqXedoyR7xLARFFzDoFK6u10kwMQMcwmy5KMi0crwzpNITLr2cxxKo
	 MWJ9NJOhLwJQtWKMldBcJPoXID1ZPNSvjmdXi9i50rJXNBYXhIwdoSeMWRrlR44UenRmN
	 ut+mPERBeeWQNRMnz0SclT3r536qGmk8xmca3PYnkdlGki73iiVPVCXIzsSYtjuVqcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1B0Y2lb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRriEjlz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A99D606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A99D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1B0Y2lb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRriEjlz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5h7K1356974
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K2/rXHmCPqE90Kar2gFfKfyl
	VcffvSB40DaENFVBwj4=; b=W1B0Y2lbYE9sJ9jRxV/kZ4q9XaE7uyRIY+ueVaDG
	OKVdKxpRsM0b4JgnhldeNYguzW3ULCihI4iAngbiNirdGZiZmZ5l64+2rW8i0vb5
	XoKIlYGBsV4UKT1SbhWPUzMzii73usQPH9SZasel5qdtyZ8P1MkRoZSeXF+urKDx
	CGfDdO/UkU+nOGTlV/ibFuRXHsRk9chzEij6SRCqIOOdGQjbFhmzGWHZFgb8VjN7
	KU9Mjn5ANZLSZ48THgScotNKjwWkqkKRmZ5CF+ZlzbmCyRrMszmecivB/MSxRm2L
	aIFn586eF/awuqxAsb0T4oEWWrkxmLiGFzIYUkRwPe/eUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ufc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so187162585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578867; x=1793183667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2/rXHmCPqE90Kar2gFfKfylVcffvSB40DaENFVBwj4=;
        b=FRriEjlzhrmIXund81cxFFf1zqZB4lqF4+Z/Mxt+S9dkNdvzN2hbDYfc+1nVpu9plh
         G6WC3CZeJnkMsRNLmYHb8STNqIybhP7KM+mo4wgL8T3jcHFf53M6VYsDOYWExczjwAD4
         7YmV8tovVQgEg/apU8v5r731ZIIOHKxtZiKOmnSeAtM813rmOKryI8H3kE3VMxdwjk+d
         NEL0QPd/kE71o+hTJCYFxuPD+fPRhslQh2OxC/VZDclrZJxKEQeBNQhxHGKP06vyZwL+
         oyQ0G/oUumGaVLBPCZaCmTVyVntiEmBZbgTWyuEs2FzJypgD1bE/GCN9Rh1WzFzBLQlr
         jSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578867; x=1793183667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2/rXHmCPqE90Kar2gFfKfylVcffvSB40DaENFVBwj4=;
        b=kiVgaPZLsp4ywggYtUFoXPpJkQdELf7vAwBk48qyAF6ijffjL9ErU4nx0N9Bbg4rZC
         m/SYvVNxIKKVrQGJbaMNau/yCUXQWJCElaYeYiJ5iVYexI8kPo3+j6UF+sl+tM8ixD5h
         elXPLYQtMM/Ds2VnZo1kZiLmwgac1XlyEkgaTrrEkNVtpu0eTPCl89OgrSsV6wh1OVfI
         YiGmFx7eKDPTVJKaP2SzbsL+YkJYxqOw8pTkmJh1qLZNKlZwoWBIWn/Rdea68491hd/M
         HZ0dHP+lhDsiVbOHWpiS6NFOZF7zLUNwZHWb6kuUUFar6y13lQXcHtPRqyRDIoQ4X907
         PQDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2fGOSbXLbjCjb2UGc0vc8wJn2v3eGaM2qn7uyAwgJij29g7UU5x5AgOxeiOnAAHI/+jb1TCVlppNjRXbq@vger.kernel.org
X-Gm-Message-State: AFq9FYKtk3f60wifvIO967NlK2ckLOc5d0rolVOuVLEbQoFQQp8hLaI3
	09WBUVFob2Ows3f1+wOSJJ86Sf/XapxBpv6RSEapv+ORCVS83BvGZI9tT0pZRFXXd9vL83v8y5x
	iRS4F9ZpHGcWza0DVZoVgAdIEOMXGbmApbGUvfLUSYBjllVswLfbP654ssXq/TR674X/u
X-Gm-Gg: AYBFou2Ys5b0fjh2+ZUTIq/qQcryLhfgKQx0tmeHNI/MgYiDJ4VB32EeTJSwDiM/7sU
	1GisKc+rqzsE/0srVixa60WRXADNmr33X6+flAACuDwHJdmNzBnQ7WpWkCvNGYSDtQ7HSSqAAGY
	KVN/sj8i7TKczNO8lULZLsaaVD/O8l+Ey/r8qs94LqPLl7IXoOa2mZwSXVZa5m/48wQFk08x86q
	JuWMf7nOFk7JRtHefsWNfFx/HtVyihsZNJzaTvinAx9xug12sNSDJ01eLDMJhdNSQa70NiVJWAa
	SxoTPiECq5hXoeoEEL1UpZ0dFA51UuyW/rrkgzraDVuXG5fAILzzUdRlHAoMcB0BFdb+b2QtY2W
	4aBSX8FG1e/35sZml
X-Received: by 2002:a05:620a:6509:b0:93e:6865:7e3a with SMTP id af79cd13be357-93f57f76b95mr292123685a.55.1792578867227;
        Wed, 21 Oct 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6509:b0:93e:6865:7e3a with SMTP id af79cd13be357-93f57f76b95mr292120685a.55.1792578866672;
        Wed, 21 Oct 2026 03:34:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm130087465e9.6.2026.10.21.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:34:25 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:34:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config
 arrays
Message-ID: <ds6oh34jzvkuyyt5jzocvy5g2euiplcvb2fpr4cdjng7qf23dv@vnly65vgdwmi>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
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
In-Reply-To: <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3peBi2J0XS0FpOQohA7hkg4rCQj_QZNu
X-Proofpoint-GUID: 3peBi2J0XS0FpOQohA7hkg4rCQj_QZNu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfXzS3XsS/gEdDW
 +zPPk3AjCgYZYi1NMocvzEmDZc4a3pi0HhkfR4C4Ovl6mNDOKco7phqJrwfl8j1mz/uxYQGanMb
 5CpD8AZdMa+pM15AMxR+d6NCX2/dnI8=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad89534 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SbMn-8PG_jNgW46L1lQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfXy/g3994zSgFU
 sCaBfnNk9YyL6MIe5RORV38Nork1gPnWklcQiuajpGQJTMW7/yBNbGMJfehDbvK7isj69swe3EK
 bpvXKNNXiZ6Ja3VwoXl/gVw4EWN7p478VFMexy3xaSKO7ZCXbg7cgDWUbaaFEYycdylH95pq9dU
 S4YZQPQOmuaAFBOYo7E+Bkkw7odA3ymOYS9jdmVlZfJRl+Sjm8PoJuV2lCsEEuExPPd8HDhz8Ki
 lMauxKGfoHaGQ2iVSUykxiJpmFbn1f/9onyMytDqR2kTFg+xYBrykBjcmrS38zG2LfZ6jJForA4
 fkSLYv4npuh2RoqLmUiXsXaflQQt9pV+ZGDaY3oyTkE+Qww0hcUirumjS/JldkH6PMcZS22myaa
 ajoZnog+4rYmylcZQQ4Vmp72sVduWwYVWtjYUd1g8K5xBIHB88sFUoixa0gM6OIUN9DEDzJnYpP
 1GnMFGhm3tker7vPMPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 26-10-20 22:24:51, Kathiravan Thirumoorthy wrote:
> Some slice configuration arrays use two spaces before the opening brace.
> Also, sdm845_data has the first element's opening brace on the same line
> as the array declaration.
> 
> Use a single space before the opening brace and move the first element's
> opening brace to a new line to match the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
