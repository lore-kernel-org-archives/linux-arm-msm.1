Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE59476CD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465278; cv=none; b=GvBQW7AtQF+KzeAtmsdYugfOy6rYS6WzHBofOvE0/EkG3AmNpOW6OiTpKblN+EGMNwumhfX8MsgmwE51vTlo10Z1aBs+Pczc7BuR6BwrvfMMErg2rPg4uQ3WgVXqYrlcQbJNNlPYg8DySykzpoAWR4BW0roLuFp1oaEPFlzkihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465278; c=relaxed/simple;
	bh=q3zQSp8R5ThK+kuHcvCcKCWpGwONhQglnuUhseaqY3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXDzoUd3DdnUodK9Ki0wHlCRTxRqurm/dqhn0FaFcvX0S0zbZcR+E9CAHuW7QBRh8u/Sql1eKHamkha1ovfYRd6P/BrTAZutzcPRsTfmHaxiJeKUfZAMlozZn1z4JnzL8yR3SozQCj9Tr3TyeFcSEBxj6Tf/DIzZQHqtEz9cp1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhDqY1vY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITneMNXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhDqY1vY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITneMNXY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z3QZ3486821
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AKPLf5lF4h3WJ97ZL0JL3uGK
	N0ClGEh5Ox38KSn5et8=; b=WhDqY1vYS97v04zv2GsHbPxjzeUMoJ4CAofPD/ra
	FGDTnn3/mThnJgHVy1jP4oDm+TyxE4gwH+tpiwt32sg+0sM4wTQ92e4MwrlZ8rta
	7FSBacv2UGwZBkgL8JdlmEMHRAJVxbgs0KBH/3pRNLRdW5PApsE5HYtl9WxLJvfR
	n+YxFof9hq7YsmL2xP5Y3w8JUGvECcILK7NKxO2nH+Y6fTyIt8JiVb5jnb0Zi+wN
	tMMdDJasxqkVkwLY3mfvv56oflucAVUe78S285hQc98qQWG/9UtKuDlX8+Xoq5s2
	bZjwyCXEXb7rNtLLel/aZpQQksygXCi8unNJVyOy1d9aqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jeruuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:41:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso686847785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465275; x=1790070075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKPLf5lF4h3WJ97ZL0JL3uGKN0ClGEh5Ox38KSn5et8=;
        b=ITneMNXYPnnt29rmkA5UvdZBK0mHPWWgKbj/u/Z07xjgeYXbWvULzdnY0VEIT2U+gh
         Nu/4uEE7bvu/ORer2Fwjf20amK68eWtxvr0/GDaqKAhd3TSsKH7lBUiS7cTxpaZqS+Ex
         Dp2m72cBlYhKf1BkaDxCGhg4s7r5a/DwDnJ7eDvN+pAWuGjoVhJQ0KKpf1ssa7iIdUL8
         a+qYgq141CduYzbCSe84QC1ULr4yyqXCFf1SNGSILcZnefCNJuKbEdCI7l9A3CUh7AOr
         R8ngEkRvJ+WTfqtYndHFeIIgN077su4Ysy2Sn+tEZXN8r9O15NOXTOChCQaFDb2r+9g4
         Oy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465275; x=1790070075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKPLf5lF4h3WJ97ZL0JL3uGKN0ClGEh5Ox38KSn5et8=;
        b=oEPajT+cNEMlqAiIjn+6ToQqHr5b/SA5hvU8tEP0JaT22B4ilOnJ00zFbibcjOarDZ
         5DV9cLP2pRe9RHuhKA8g3EbPx9HdmcDKva97JqfxS9oVxYCQD9+eqHCiOA/EZoC9odok
         iuQ2la5zBs8sDwcU2wAu1YcWVHoSbNq67pkX+5IFtJTjkVCNb/vc8PfioQbvdKz12tkZ
         xqBwx2CQH3uDnUNDegbgHLxWvx6EoEoZ5aoJdA1VA6+IBy8oDUHySWOU0F4mg9Dv2Fs7
         +0cqTZc1A95MPbKmtoaDXuZib4beYVCAGhEe5y/uaUMCun0KWJK9uGZ3C3UXz8L35j8s
         mq4w==
X-Forwarded-Encrypted: i=1; AKwUvBw2aeWmJ1jlY5e38DGgF2FZlRIGKJkTxpoFkOFK9uqe8hKquw4YTQUDFpTC9A4A6da5gSQorOdJE4oFYTsO@vger.kernel.org
X-Gm-Message-State: AFuF++mDZzc3daQYQpQ3QomN4yCGrwb45qvH5R6R/7LezIq/cC32PojF
	Jhbymw1dgwvWzb7GOFyybFty/LFtN+nQtHq3inn5NC33XNvvGoqVuDx5zPiUad0X2TEULmIo6P4
	2whfCShfS8BsvVHhO6gBn8rAB6kHaJHDlPSiNxc25n23XaZyfazyYerisTLs0k9+hP70u
X-Gm-Gg: AYBFou06qok1RSSVglaIZ9xxlkPUTc/H1g6UNxXSwBYlllaWUZnxXhixgiAPnTLwTrj
	JusRZ1bYj7kCbY/eVlFvCNwO5X2b/fVZWF9tzt4PHQwNyNbMqjfcagGI6pq3h0DQW+FVjBFLtkA
	uQOuSrTCmHVksaOq58ZlphH/7wAipDsfJOmV3cLcfO8fOdLFkMoD+dL75DKHgFw16YSZ5cLklv1
	i/GiU32NZLLXxxMChDHg60MQUAu8i9X1gxGha1Z1g1UCTj7M5x8OATPOfSgPgDgfH0vcteo1st/
	En3kFYWWE1nL1/rouHtByYKupm5Exqiac97BVkXVEJJiVICjYeOEpB1QiKxQBYiR2EVP7JyKGv0
	yesbLA41dZx01z7I=
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr891549785a.2.1789465269946;
        Tue, 15 Sep 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr891544885a.2.1789465269342;
        Tue, 15 Sep 2026 02:41:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm30667278f8f.36.2026.09.15.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:41:08 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:41:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
Message-ID: <tal2rc67ojk6bcc2rz3shogvhg6c2j2fngsjsgpow3okidkbaz@mesni6h4gggj>
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXxzOzY1rKWkoj
 CiCsnpJW6phHmT1+rys0kSLJ/CHZMXCJGR54U2ZhY1U+5up3C+TwjW9blw9JMt7H+WPuiYHQb40
 /ScBoD4O5gErYUKkEtNOIbeIi/nXosk=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa912bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Y1tYvCCEkdZ76wmRb80A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hCplIYRiMyvBRGUSdt1jW4D0ZOqyN2X6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX+S/z26kxgGKM
 n0RfOfdk00HNLMFTqCVlHbu8e4pyy8OIMxLmvLuuxI1wn8tksXsXTUuxT0KY0HwVqCg1MOBQ7je
 ijLhhSbbwUCTnqPSm4svVBLAH/WPygI0Qnrhe7UtrNR0mQoscDkjv6pfDRUb//e6o5sG+omAcjz
 d7c3JLue3KhRL14QiLplmTr2W+gkTn+cBxVNSbnTXlDcSyfHUdz3OUByShFXEQvWfbuIXsDG7iT
 TfsngZmHVEqHOlu4e/CDRUi6qLkJaVkHdiGXqKzBhBt5I0Wli0C8nWY3tzz+rN3+q6Q8YCS03AH
 V+Zdv9iq6NU+o7S17mErwbSDS85cTCLylH+cyCi1OHVw1keJN7yq2zmpenP/vjIQPfACWAKRrIm
 b8E2aYbaow9Rjz9F0UWN3iI27UqlBuwDbevI71L2BJdZ478YTuHQfOOqCq35Q/N84K85aKH3GCS
 yaHLN1ts6PG1wpEb+6Q==
X-Proofpoint-ORIG-GUID: hCplIYRiMyvBRGUSdt1jW4D0ZOqyN2X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150137

On 26-09-15 12:28:22, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
