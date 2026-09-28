Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD51C84A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558618; cv=none; b=TNVCg0P4FqFBysBTNJmkyb+nMX3vPPYC4AbxlBJrKbPr20Gz/m01wjLyLYpGm3z2j6XSfkvZt3OCEit9dFH6SBvP4iIo3RJ4tl1JDFEETmFM8cYfrj3jmgoCIIwom3wfC9Y00Vb6d8o7tO/HCsSC7TMd0S5KM9j7pFms2CoUEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558618; c=relaxed/simple;
	bh=rlU8MJoKFwEj7TyI1+k4wCrAAdEifzHXOnp3hjdwys8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRESEdWS4VMqqFJW3BRo5N5NHoSEAzv9on1uRWqyxqpBCLuz5txhioXUdb5JLtD2OgQ68xtokxZPJJvlLZ3Ro9ij4xeRCQeZ47gktjl0HAZSdkCeUQi7Sk4RBvgW39k6zrC6WwxYGgaVFj5QCeiBW6flsqH6aGlJ1JK3RIvFAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/xqR/rS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToOie8jk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/xqR/rS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToOie8jk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RN38LZ2083722
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f9YQvTKqFZSuamKQeg6Fv5je
	yjb7KS6ZvU+IaaOa62U=; b=g/xqR/rSZxs/Xgx+quFtEB1CyhYChdAmycoz3OvL
	da6JauSe73ThYbM6ML9jyGbHN9tBv0lbrHH0DQyH+TSmk3ji/MF8qb2A1l8Vhk2j
	6DQeLfAh7MV9xZh7w7X0UCvltI6EV93dk+p3zkSxe8KWXIdFD5iYA2A9LPCF3F4t
	lV6ydV2vgnzTr5wLmjCNY86wAIjTuI4cOT0B0BCh4x9uRLTI63TTOIv3mcF1yAAA
	oOPDk0PytByMCzQj5UT4qbjjsjMWr32/2Y/0FbSBENdcEDbEUjZT0hguwfq5y9Jm
	S0Up0wU82Vk4UFmQINihpGtlqCUtkGrxDf+b8k+WQwX9qw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfvc9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:23:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34318e88ba2so436646eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 18:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790558616; x=1791163416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9YQvTKqFZSuamKQeg6Fv5jeyjb7KS6ZvU+IaaOa62U=;
        b=ToOie8jkgV8tbb9iAspAGa0Szcl5XizW5C3xNg5gHesqe2NAJJKwIMe6Qolq93kfgk
         t6mN49xo44OLAbpXWK5lnjA1LewPc2qY3c69OU3Jc6V3g7hsne3th9smXaFdNeRM11dV
         xBlhKhWFlU8gaFjfql8AXliDaoNp6WHP8YyKDhAMozuGGguFGPKtJfAw/bieUbs9G0Iz
         iieiznhplk+2IjoQHQk2FU/REi17c5zJsqLiWimfTSMQD700qjtVElgKXABqKuryHtYQ
         GZYJ8ywcpbp0fgiRRJlj8otvtRAnLNdXaskQEYzGqbLbadYE6m7+sWkjalCtpjfeM8g9
         02AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558616; x=1791163416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9YQvTKqFZSuamKQeg6Fv5jeyjb7KS6ZvU+IaaOa62U=;
        b=QNdjH6Se6Rwl0qd19G5RkWtJy8TlOpeLm/dRaqQZ0x9DRpTV+4JKroh615EK14K4C7
         RKdVXVl+2Or2GnqPv4PwJUVfvywOUucuYqFoujtl3xuH+SyOEgTFHf3K41gv/1vLshYc
         8J2/m2Nz/Turqvr61p1c7Z9YKLdioPDKL6kPx7gnGKUme/IelUl8jtfFSezE8sMPR+Zp
         lUwOvChn4sElztVv6TRiMQ4BJhcEulVGkEGoZwDk5Jd+ydvZ8rE4wEozoCVeRufuwDFh
         cvtkvp2RXXtGTkGO47ycLFcdDfxdWEDjyzTE+DqOIm/8KBhG8S2uueEzHPDmATZgiJsJ
         SHuw==
X-Forwarded-Encrypted: i=1; AKwUvBzs1vt+Dg1VInAPwVz44KdJie5rTLMoIBXCr66vMTM07UQe2ssU346MnH8fqJ6DmIPAs6GuSnjsV8qItCN0@vger.kernel.org
X-Gm-Message-State: AFuF++mVf916yl1kShmZQ9wb5fEBV1hVn8d+PYRPSDnF7rcNPBD/27V1
	pLYM7cmr32PhpJ38Ib7a+CnNJkUhhVRHavDQvziqyqlKIe5QcpQ8dehK+oKs+H7oyDGAZzv/Z4/
	PIZL/3vozmP5JyUSb+n7Y4BsHFwKwn5Pxnl3KVtoWe21cUEFWdTE9FCThLaqZl1GDI6sG
X-Gm-Gg: AYBFou0ZT2TRA0ErBIVyobKl6219SSw5Sy5B99JpEZxS/GGTH+jNgIInGJG5nFEk9ew
	jerX4bJpeutnznvIm7Eq+VORBpczEc+DtyIfydzG6MpcpW5jqeoADWiHg6C6btPhZeqAEwJx/Ki
	eJVP2BOCydPcscmRUzY0fVvUUy+dgFAE0zOIsUnbYbw6tyM698KFhjWT63WCMURdl0+aFsLaGpC
	fS3dxKJoU2Ce9tbAeksCTniq5ZeM/Y9lJr039ab8s1mJohS6BS4SwixbtPkfK0TvTH5fdTJCoHt
	UrRU1IUiLmVmra7i/lFqKuLbXznF/NHLtRwbiGqaa2V2B92kCRFchjjnwfqkD6GHrVrit2vbEU0
	S8pB1vWCwxNsz1GqWhQSPDGVO+kIv+stqy7GsE45zWw==
X-Received: by 2002:a05:7301:52c1:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34271a8da39mr7821604eec.20.1790558615510;
        Sun, 27 Sep 2026 18:23:35 -0700 (PDT)
X-Received: by 2002:a05:7301:52c1:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34271a8da39mr7821550eec.20.1790558613844;
        Sun, 27 Sep 2026 18:23:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm25487284eec.1.2026.09.27.18.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:23:33 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:23:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Message-ID: <arnBj2WlZrg25LeT@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAwNSBTYWx0ZWRfX8hO+q9qlDjOY
 zAlpNPu7fCChURFjWJrb3NI1/zKjAXFZh1JidaZ9dn07OEHaCc7Mg02Bu/Uwf4ZPy9nTXInH+sz
 oB5M+MMk9Ps8dxjZc7TPPBi4/rp9mdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAwNSBTYWx0ZWRfX+99fvV1SCYdG
 b9zYek0KW4w66escewg+cAVOdqpyqZvF/2r6cY1hwdZcxd/+vfZ/Abr3DQJ0SlVExwzct9su8EO
 dOPIhHjk1F0jRjgq7sZdXS1iesnHivrW3Jphu6N/I6lHnags1yHgNwojImDWLq4A6NT50ImMLAz
 z3xmnkOtgAf3/Vv9UJPUbsJv+fsqA45GWjfAxM2+7Zefd5VJ3RGp+oiTMIJKq9sdXHOu4fNHorN
 e72oR3wIEgNNfL92KgwryD4IqqoJ5z2Jm/eZIvKXIdDzIPwnFAUXPBgtVbA/2HgqRmqrxKM9pDx
 1h6RxcPbVeqJ84NQs8K5VhaI/1zY/oSPRmm6FVkecq/h8Z2jpzZ1NLaZ544jl10bk+9dfNDrJkM
 21MyOD2uxq+gPrkqR6W3C1rSRAmgnZAZFp+zILjcMNFRlOVjwV8kc2mgl71wG+GO9coel13spns
 YVkK4TTQ3fc9vfKE8qQ==
X-Proofpoint-GUID: gTdjCdnYLg0fIBN8GPl_LHtZ9odOtsEL
X-Proofpoint-ORIG-GUID: gTdjCdnYLg0fIBN8GPl_LHtZ9odOtsEL
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab9c198 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MvHJX41Kz9pwvTpm7VEA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280005

On Sun, Sep 20, 2026 at 04:49:16PM +0800, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 3673003c8b21..e4c3aee441c2 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -393,6 +393,41 @@ &qupv3_2 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/nord/adsp.mbn",
> +			"qcom/nord/adsp_dtbs.elf";

I will need to update firmware-name to align with what we have in
linux-firmware repository.

Shawn

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp0 {
> +	firmware-name = "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp1 {
> +	firmware-name = "qcom/nord/cdsp1.mbn",
> +			"qcom/nord/cdsp1_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp2 {
> +	firmware-name = "qcom/nord/cdsp2.mbn",
> +			"qcom/nord/cdsp2_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp3 {
> +	firmware-name = "qcom/nord/cdsp3.mbn",
> +			"qcom/nord/cdsp3_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
>  &spi16 {
>  	status = "okay";
>  };
> -- 
> 2.43.0
> 
