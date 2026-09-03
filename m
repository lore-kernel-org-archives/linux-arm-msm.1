Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7BD4A49B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440555; cv=none; b=nHXvTL+y4Og/ureaf0rfNQkxa+j5kXx6Xu2YW3QxxK0/4ea6v1PHZbl2NLLuVdT/fxW4YcR6f8gnfnbOVIRijMnXZQSb8J/3SOno4on4cFB0NAvld9qNlm9Z269ycx/VZzfda5mVP1IW9GFZ9vBI0KuFLhUhA79xV0Akhg4j3gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440555; c=relaxed/simple;
	bh=iNUyMqHvX3S8pNMhywE3RHDU4buVV5PMKqGs2Ue0/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PweTvtCQ5O4sz8zZvTmr+MGvIp4hctoolnxVRJR1sB4BsXV23XBnwMK80aKCJBCggXTs3kJQGtt/CdXcrn/MhXgSG0oqds0U+8RUpcxgB58n/8DFwtpoZue8iv/xkU/6Sac18Xt9gw2sMTpXQNkFtzzIEIjSiLLVfkpcJEu2oYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlDh2bxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grSE74ew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlDh2bxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grSE74ew"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHEtd162892
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RxbC8SJCtxAxQqyfjLxRAGHc
	UklS+ixE7pJvZTRJkeY=; b=RlDh2bxk5UMrd5AiBM0FL2s52PEI6s7AW0Qkt2+R
	zSA1ZYIUxF9V+kJqiXMtnxZLxlrlfpmVDCakGrKTSvFv4EyDamM7GyVmikD1/XUU
	0HPi7b0br90hsaLxTj7siq8cvw7ef1zO7Ca7PhxnGYoIkV3VPh50QF8YM//5mKvv
	vpFH+k0Lxa1drxGBn6J8hzEuMp23vzb0JL/5vodB/hQ6eHxFIPEofGK+amUIjD/T
	YLO/AmaqScrdPyKn0pDH0JZOu+h6+wi8qibqb6Ke5CY9Qg0wN/i7i5ibFsPsk2mL
	y4xS8dgisaA/7Tpy8AzgYDEZnzPk/8+U+nBEYHWvzinLeg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0mva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:02:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso471691137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440549; x=1789045349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=grSE74ewMvZy3QmmTWoxrhrwQ4pPPnXcUembWAh8yLS2c4Gu8hSflik3MuzBWgZJIM
         L0wu7CoSBgEKcfVsHIQzEDJMFEAG6L54JoqcpAXFXac1AGr/nXcc2Fe2I3rh2LvgbI/S
         yVx/OVlFpIZ+DMovnM15fsfdeZtfmUkoAirG2ffaL/3GLFbJHJNJO4If+15yqz8hbDgP
         /+JLNC/ZeXWgEhKlqTCc5s3TsdHoxWNcNFd6C7UWCP1TApnG7yWV3SZN6CkXR/DKKEHV
         vABtI542vf6yEYmK8LJ2x3HcFUei1z19Y8LmzIkm0JpktXOW3AvrI+dGwn+sAaBn/9H/
         fXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440549; x=1789045349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=pKXDYgzKunpHKPiEDIKsboemi05EmXHcsQoXEzb7pFO/FihJsvCsVbaKf/Q/YUqEhn
         3MM972EpLSW7JbF5vBJfKGFE0BM5WbOJdshAFAz5z/S3M5Af3wh6Bt3IjS1SUVg6hs0O
         ZpXQcxDeo+Z+YQ7QLd2aqvlwk+IabrAeklA8GGtvj46BkUF/pc+icp4EWMBupRsacEuX
         d1W1EIGrB8k+BBJ0dYAtlNEEpb8f/eZXOf/9XG17UiBi9pV4nVxv/R5PbG9MviO15TXW
         xrZNj172YiFc6dC0JRJpj4KEsnxyfY9FHrjzhxJa3VfvqJp75F1c9iJw6z93Jcf/hgfm
         nUGA==
X-Forwarded-Encrypted: i=1; AKwUvBxbIfGEKR0yBpH1GvZqXmI4e+fqw9DCFlXLdlvUhTpdoE+ke1evSvz2Dif0CXDgcBK5xyYDgBvTF9Q43Gio@vger.kernel.org
X-Gm-Message-State: AFuF++mpyR92lTf9cryEimEkaR2DwA60Qg83JBMyG8LPi1bymgROuyCU
	2TFKE1HSkmhwvdtP8K3CRSJmxsn/DmXKKmIV3M9MMKu/8ZjcRd7nT7JynYsruHuwQ20ibXBBbm4
	aJOrRUMzVZXonneSw4B6a92Yp5L8qqQA1ErI8k/FjpbjAZJdDfcDrOgHDlZ15DKRhCN9zQbugsU
	/7
X-Gm-Gg: AYBFou36LN33O8Y+5bznoP2kGjKphSfvdD619OMq3hOT9SmRBvy641gQPuC67wBDbZA
	EHBNtQezVi9Cglkk2FdHkGgBHYh90bhU5mfeBm+FMpYwv5c4CA5zEj3jw8cCaNbcy/8X21hFc1a
	MjE6eJI0jSKr5Wm3Jkm7CYHdGJ/GZyTlzmhTAy7v598xyDbGTTcBIa/Nk8Npcho7oExIYmJ49II
	2Q51FpHvg5tlBsvwVByZZ6MiIOv/XcE5rLNb8BjepinLWu5WLX8erHiXpxU93VzT65kyzxGGc9b
	GjT9n1io2k5V3c3CqXN4BSR8I4ITJN87PIfTcdcst/gT595IZxThLJW8cOY8yqR6PjtdcQZxXRX
	2tgnct6xCQRe01g==
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308851137.7.1788440548319;
        Thu, 03 Sep 2026 06:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308818137.7.1788440547636;
        Thu, 03 Sep 2026 06:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm68179745e9.7.2026.09.03.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:02:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:02:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Message-ID: <yfvkgixouxknoc24eg53wgluzh5jufx6hcodqx2hci73puqqab@fqkut4o2yktz>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
X-Proofpoint-GUID: PIRLW98tTWwrwu6YdBCj6vG7WjZe-7IT
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a996fe5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: PIRLW98tTWwrwu6YdBCj6vG7WjZe-7IT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXxus/YHyoEGbL
 ujN7i5/ovR+slrlBbXYbP8ICPow/1wU9zZ1eno5UOVJ/75MYW1CJx/8Fo6S6tzHM1rLevLFuvnq
 zU9XwVhwku94nYEO0agH5ApSVaMy124maICKq/u2qAomL686jKAPkZhoAaobQnAqBYG8pVc2Wqm
 NA3ljCe5gYDNWuBXvOBDxlL7Llsb3godjV8k5JnKOxiAc1iUaktGESK2OrWXJX7lA4+vaKV9dz3
 u+qX9DjMu/AtXo5zmxi0NsSs/WmWd51//g8m8RM9+uTY7W6dYvJaXVXest/kdRTn/aQjcbcJmJO
 eSiU+5K0XphX+TwCczB/rZBb00gZyuRysXbQ16cUPUJFnVm72xhT9brLLvkQU0AISVct43e/0CN
 WPG18l7rgA57FNDWKpiqNRbNoK5iAGwvKvMhVPidD0YnyX5bDlscPHhu2j5HDW48dYBrUl/kqYj
 6iKk61a1HQEufjjFFhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXzkst1siGgaQD
 nuWsF0F9XjchYrLhEp3cEXx8As07YDSmaStOUzhdwjeTh2LiY8o78f+GJAaXfyMQxAGp5hEYZD2
 EO7fizCFz+b8IxbTluSaPEeUvffNMMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:11, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
