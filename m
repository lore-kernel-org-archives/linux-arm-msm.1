Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB454F4759
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554928; cv=none; b=E8xagV8Gak60pgeOVuWDqrXNng3hxzVeBxqD1uGwQz42M/yt1lmgQJs8I4qGGLYUx8ngjlbWIlDIOZa2bkihKC43Wafhl8yCg7TrPdAvdOg8thU0ZATivoDt97cZqmjH6bm+tv83wQISWrjf1Xw1r8NO99cX0c5rO9esznY3i7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554928; c=relaxed/simple;
	bh=rnKW4otznhYYxKyvoMqtArvWEdZaaE/10Lic7azmXbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp7rHu3s9nLDIDtOsqBwG4qy0V8Rk8xrrUbwMA1RMuuNARm+z8BSxX+2EHa3vloOuB5aP6lPCpBJs1iuSZb2XP3ASSnkVX4+YzCmAIfV3jhlnmk8ZHbUXLoJXSqm8CKDcUArIdMv0xkxCbPpomwCA3lC66H6u5e0DcrC8iv7DmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4izwLC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvBklJRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4izwLC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvBklJRH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934g62226509
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z55CMID7Tr3N5z1gzpPlBem0
	1Rigw5Xcv5g8Y6+kKC4=; b=p4izwLC1Kx8jEq827ruZiD1mS2WDTVlahRBffk0v
	EH4YSngSUcsZUkLBfZGxxpzHNDfNEZkqGehdW9//cS/M+6YN5ePq8kRYGtUHjY4/
	pT1REhit3JmjEFJ9fCcjlV5LZU2z7EjT2niwbrlsNTri6LHTDI2amcL57+pLUq+d
	RuW98k8bT23SaCiKSjF9ooMsiCU7OmRalKm9m+nf5sicecUaRn2jfc4ReF+Szft3
	eLQSFiTd63tB0X4oUvce/dUpUcvSoJsnK9xuTAORKE+/Jze5Zs31BgW5Hyn7262S
	SjnR8GVa2XfyqF2OVYPo7XhPz350UcDci5QzC1peeuNWWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9utq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:35:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a2d361e1aso19956685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554902; x=1790159702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z55CMID7Tr3N5z1gzpPlBem01Rigw5Xcv5g8Y6+kKC4=;
        b=MvBklJRHclXDCjuvZuHLOX1rNXuemhw1N8fvHX4RNGI5Ce9NyoX/Gtvv91pv+w4oX/
         Z+DolG3clpDZbgPvWv7dZdeBJjGLOY+J+BRIKt9+c5+7oacZGBRNK/TSN/VW+N8upDix
         bwWR0P8tdjMWAzuQroG8m0Y3a7RpfRoT1y/k3aK2S+r9lCpEYCd8el6IvN1PWvXP/Vjz
         /6vVNOURfeCiio+H1lPT4jRFCY/Q/ItoTesWP+zpKbbArw1otZ9VEnCUAMuxAO8+vZSU
         pKoJw5jlJuHvM2z5gP81FKV+JSCzi45JhEo0N5xnzgHIdKGbvaYYKj059sMzKmiHuzU6
         8IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554902; x=1790159702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z55CMID7Tr3N5z1gzpPlBem01Rigw5Xcv5g8Y6+kKC4=;
        b=IWN95JJM1OXOBjA9+nldgelvDCwr3duaPKKdLCcI/QPZkjU49oURa2/2Yyk8ODt/53
         0uyaYGaIw7OpVaQMGEsvNlX5igaYhX/9b6Ytrm3vBcCY7sW6u4Bx/s9sTa8Moitloktd
         eZ2G7W9rgoIj4rXPWv4xyyGWRAl/Vu60Z6TL3uQ4yiU9y5somNAsub//N9rRalzISj5Z
         Y2qLm9Ms8pS9EeHcLM+JtESvT4/mNd5qUg3EX+3R8NDCYrCDn1MYjzoDeAWwOPmegIiB
         yJjAaqvz0KK2owaLWg/CH4f4vTA+e67sFslSEKSvG70sI3ZF9VBeRln3hb+IoMT9h+mQ
         l+kg==
X-Forwarded-Encrypted: i=1; AKwUvByjB9dDaFeVhrkpTUAnkPo/pF3Pomn/SGlfMC0IiT/BuWJfN/Qb0bPeY+wb/rHa5aeNIquVt2n0M9JP5sh4@vger.kernel.org
X-Gm-Message-State: AFuF++m4NeAAHJUk/R/r4RBdhXbQIxzADV8Y8MgvJyNyxMk/2KElh5Tl
	hw3xYP6dctCISumXrbfllGVIvzcTVKz2jBN5mPO04XaZA7S44eY/+kmLcszvyr14axvkwSDiADM
	JPYqT20VLHvRrQZlo9ayiRVX4OcCPVMMaumnq+pn8xcOZkBUqAJtzMr5+CUvxSPRMOzc0
X-Gm-Gg: AYBFou2iTHZq6FTX8U3sJTyBY1V6U6yQwh7SiADG9Y9A11f/CFpHqMntAwCwqiZ3r8N
	5wB3+gpqEW78ovHWzWEWTaiLsq9A6vSCN16RyIVmoaskoxEmfDG3O4gMzJXXnn1U6fitsN+YRVW
	IOY3bIgS+6SY5ETSaC2oRYZwick1BWwgT+em2vK0yP21EBQ/uuyvGgnKzkQZk/gLZxwIrkErWz6
	yvZZ3E6KUYS+9gC+5lE1/cWWoaMP2VkugZbVU534xkxSLdouvLbw5jfrAYgwmUb5ZK7l1DsIf/6
	YxCPISKFRPxQAS0qVQd2MPEluy+iHNeXBQEZMmKtjDyLVnYGUlu5RJ0QFYTeG0D9+7Imo08BDv9
	Nqt5KAgh9qz6wy08=
X-Received: by 2002:a05:620a:172c:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93bb76c24damr299727085a.1.1789554901756;
        Wed, 16 Sep 2026 03:35:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93bb76c24damr299721885a.1.1789554901212;
        Wed, 16 Sep 2026 03:35:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf413dcsm6116706f8f.31.2026.09.16.03.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:34:59 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:34:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't poll the status bit of
 GCC_USB4_n_SYS_CLK
Message-ID: <l5uzxnxbhmnmnsutvtfkaoz26t3el3vy2vsylx5dtkwaunfgt2@kk3ky7qb3f2k>
References: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa70d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iflI50pWzB_WzTeptnUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Z8IE6ymRRa-kCoiSuOug9U-BxTwLT_tN
X-Proofpoint-GUID: Z8IE6ymRRa-kCoiSuOug9U-BxTwLT_tN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzOSBTYWx0ZWRfX60g3Jm9SDNAz
 SFayJRpQ8pJGVdOa3pBqX+0KtBlu/AGKezY0HRN9L8aEGGaTLnC+I+Gg5B8sXnvvjr8ZL9mrYE5
 ARhQJEo1CKxS9M3Jz4anEUIjQ7s1U6+Jl8WZVPJ3C2HJmfMS5qHzCRTE844qj41mjZwbjRWI3KD
 Im2sbBU2FC/+/qfucX/cJfVW1bU18F4YMcVf8vZDlkfZbf4HlCPr+Cf/LmWoiE24hEJ4i2vViiP
 P6O4oec1CecEI9F09ds+JkA79li0ZK2ni5/jH8sBkz45OFvvQSZh7UGMHv/vh/bWov+dnUTkJ4l
 jH+Z1cqwVAxgkH5k5MwIkS8I3aUxl6lXJnjOnuVOSp4Y4nI8TYYrxhqKX0AXfm+Ml36XuG6gtbJ
 1taSGuVEVbkl4/OiO5fADgZBbe2vkcWPkx2vT9csJAujmeQ85GTfvfzqdX5dZoqLHEZQLioZkYx
 r/Wl4XEK/P8qk5XLFxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzOSBTYWx0ZWRfX6bPon0VWwaCP
 F4f/2EVjT2hO3/kmVAogEzVrBYQz28Aqne2AmdBs8BCNmG2gWx9huGAScYj2tSKAIvs8Wd2EYeQ
 om2QAI6wKTGJUe+W1XZttAGFB1ugHHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160139

On 26-09-15 21:18:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These clocks are PHY-sourced and their halt bits seem not to update
> reliably. Ignore it to prevent spurious warnings.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
