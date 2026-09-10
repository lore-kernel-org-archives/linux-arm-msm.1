Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A92408602
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034819; cv=none; b=ViAoEBBNETpv3w1/gBdpSBAW2yrmTMfrZBHjcHJYe3VBeR2Q1Jdca/rdNtvoiwR4S08c6Fx2nN8c+vmTMNRNWQ/3YUlsmr+218f7n0MsRkSWqgQanp9QSjhYwIlsubuQ+wCn3YQTpbVDTl652HPeGAVW9JUDoh73WRdsqMB5cFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034819; c=relaxed/simple;
	bh=Lu+4YHeK869dlBqFjL2cKsywYYlR2fLA8uGutCF0fo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=undAVu0n8zat8T93UB0NMp+LwhzqCMDY6J5pE92jT3TzcrhtHmZN/xPbuaIPgyuCem4cDe7HMmRGhArZcY228TwLRbeQ83LmED3veQyHC9hjEUrEp5aEgUTKgDVOp/hcX/vXqfCce5A3Lp+I2wCo0XhBHssvrzvDtKAteukvfMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MduJzZBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwDKeeGE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MduJzZBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwDKeeGE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pqPj1000686
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 10:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=; b=MduJzZBuR4WoYLZe
	K3ACfyBachN01Nz//KQjBXdap9pw4dZ1/TiDtWBr9sD8g9C9GUJEXehopdN5Ulzf
	OjTawYnYSR0RpIcweJSAtqibfUCyYStMG3RWT8ZQRYnoq+Cqyy89fR3UrjlLgxBj
	v87Vpc4J1m6HsJ0pVVi5Hiddzl5LMF5T5JKNPz/I5NPfPavHqYMbYWI6tDjnHE04
	CqWGalcCXywY+w36mu5LMtzBTHc3aKEXoRWmzpaleddSilKbXuxSHSRcJiNCmFgG
	fFJyv9VqfrEez2hsVgy2BmhAPHTPEfueEtYnuO7R34jsdDR2j8861AFRa7gzjEvV
	iON1EQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvrqrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 10:06:40 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bcff1b9fafso2622716eaf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789034800; x=1789639600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=;
        b=UwDKeeGE3DT4gBhts0Z+t0T1OpZZ1yHsFFtEawEwBMclDbpGS5n1E5hpvLBq8rhOPB
         ITv8HoQzi+TyF2OGy2hK+81vcMdDmvt+X7xzvt7RH7W1K7JqVLSiPTeqQwcwML4wgXQe
         taQV+addTWi32B8Gq+8PfSf16xBMXiQxmndH0HnSRRXp6LnrsrDrpUShfrORepmBzp8f
         2Sueqz1s0QNKu5pcZgKGlk5R0OdYcNGkv0Y4S5mtF4W167xFktGK/4XiO0az9RiJ3MVf
         3qwiT1GIEJtDzpg0Gxn0avtk4ccs3EWlSaO3t8KEZTZtLAMOf0nGLzsONKbkpaUGj4Oo
         RakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034800; x=1789639600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=;
        b=nxkVdCP5DKzhuhtRcFmhWTVEFYs7DmhxC8B8SzepTyCJwOd0gb8IUGlQSlrQOpwWsa
         OnU1M/nAd0fJhwtlSmYTa4mPvXYHMiU75adVwPHQJpPU5WiJpHIzpia0cyN9WSbBLsnf
         /iXMI6eS0ZIWo+arwY20P/LaTKMBzCzNGQP6dteAzqqK8ofreJ0a1rORrYDEJoG55lus
         M/XKpe/JvTMVF7fQc32zzB7j++ZFyvhTdsHGn1yssArKdnBOexzfz9MTlujOH+UeTR8E
         i/lerFL3iC1jypHeximFjZ8ZiV79fI6lExjsfUyQbSoWIdbaV4i64FhC62qbWlz17Y/p
         7hsg==
X-Forwarded-Encrypted: i=1; AKwUvBxfIU4lIMDsOML5PRJMZgi1rIZnHv8X+ZZ1UOvWZickFgMmetaoaE0i3k14/ygY0KNwplS/byq01QOJk4xJ@vger.kernel.org
X-Gm-Message-State: AFuF++lISUzGIt1OEo744qiVH5QWj0pWHhIDaGiW7AtsAFHslmoVrVGo
	TE0dVIgOBUsh3NIV7hic2/7JLCMwXK+4lwZSQbMlymP059PkGpD2rr1ODYpnUH8tvLBfSQezrb9
	BCb4lEyGdhgq1HE6lwBmLvoklLFUrN+kov0mBGvgXb490uZiePNcuw/RTo0ONJcvS90fb
X-Gm-Gg: AYBFou3KSR8OpQ8LGczrMfBnsE0SuEux1Nsddx+I9/y9x0eV7Rith4yWWSqseq3gyXC
	DNh9YV06R6ftxiMaiqI4c+sqDCwdVZ0VTqvpiLBnRKeU6Bw0yEvTUzYfkinoJ8PIrY9r0GJkVuc
	vWfmODq+glx/6s6m5Tv+tcJV35XgDbdXoay9W7T10JZuO+J/C/oZU2mdQ4HSeSeCOAbbAYQO1dF
	VQjimr6bE59WLiaawJ2lPBa9+lNEIh3SK0gfUnhT1Tdo54oh06K9zTj27iMQ8A2SEyUPp7zVGfV
	Wqw9r0g1bAhKz+oikm7B2zK1ex0mgbtOGNHg2imGOCtKKyu8dQ0OpYbGX3euRPSBj/LxFovGJXs
	i781ufh8PP0+mVxR9/Akj48HpYXo=
X-Received: by 2002:a05:6820:178a:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6bee57a3e81mr3549603eaf.22.1789034800190;
        Thu, 10 Sep 2026 03:06:40 -0700 (PDT)
X-Received: by 2002:a05:6820:178a:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6bee57a3e81mr3549585eaf.22.1789034799830;
        Thu, 10 Sep 2026 03:06:39 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm79725666eec.16.2026.09.10.03.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:06:39 -0700 (PDT)
Message-ID: <21cc9c5a-aabf-4ab7-8f2a-e8f90d5fb2f3@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:36:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for
 usb master clocks
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
        Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa28130 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EvhtOw30TdCrwUAivPwA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExNiBTYWx0ZWRfXxRfK49p9U1Q2
 ZpLFM77JY6CKQwMRFNXgDs8U4tRBIpqDH1i5G3FHdmQ2TJ1E6qwDQrl/Z4t3JbxqffmC13uAH7t
 lkcVRCPsJBzUbikOxiwRIDPNRFrNkeJh8dleEAIIUYASHxah1B8/w+DypvijklzBbYVYN0sBPam
 b8WrrL4eA3nhTrTTjBZw6mg6A9M8WRvRNaCmdNsYhVFqmU8nu38WYryjFr514n0gJkfEjgOLWRy
 qOXFzL50q4gbUtIxFSuuB36TWW/nh+35eAtmSReNPqn8V4LXgTQ5vJsRYzSrxxK8+s9eftZhLOj
 Rsz4RQxX2NODTTznHqlm+Nx2hnO3ELnUDBlF4RjX0uiRp7lhmboQY4YIiiJ3lxHDE4xcIeFXQEa
 Uz/wtgb7YZ4kLkosttuzBuBUyYS6Tx1gTgDWthxhv2gXjmV2qmd2KMWNm14PPxpFlik1tUWIcws
 Kf+Dgq89dN+uIG6xzAg==
X-Proofpoint-ORIG-GUID: SnozSYgJCpm_qu41swhGLE7T6jKzGZI3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExNiBTYWx0ZWRfX6O1X2KnlCOOL
 ECqYLyz9shnqctXzpKgkiNgMKOKayzX2VDAf+4seycNAfaqQqw1Dw2CBmxkgKs3JP5x9ORjtWq0
 SU+LrsxX1L7jrh9NGF1HPWEuooSrIJ4=
X-Proofpoint-GUID: SnozSYgJCpm_qu41swhGLE7T6jKzGZI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100116



On 9/10/2026 3:30 PM, Chukun Pan wrote:
> Currently, on some boards with older versions of U-Boot, attempting
> to disable usb master clocks results in a "stuck at on" warning:
> 
> [    3.005088] gcc_usb1_master_clk status stuck at 'on'
> [    3.187119] gcc_usb0_master_clk status stuck at 'on'
> 
> The USB master clocks of IPQ5332 and IPQ5424 have the BRANCH_HALT_VOTED
> flag set, so let's do the same to fix the issue.
> 

Fixes tag?

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> These boards run a vendor-specific version of U-Boot, and upgrading to
> a newer version could brick the device. Therefore, I think this should
> be fixed within the Linux kernel.
> ---
>  drivers/clk/qcom/gcc-ipq8074.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> index 1329ea28d703..10bd2f80010c 100644
> --- a/drivers/clk/qcom/gcc-ipq8074.c
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> @@ -2612,6 +2612,7 @@ static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
>  
>  static struct clk_branch gcc_usb0_master_clk = {
>  	.halt_reg = 0x3e000,
> +	.halt_check = BRANCH_HALT_VOTED,

BRANCH_HALT didn't work?

>  	.clkr = {
>  		.enable_reg = 0x3e000,
>  		.enable_mask = BIT(0),
> @@ -2725,6 +2726,7 @@ static struct clk_branch gcc_sys_noc_usb1_axi_clk = {
>  
>  static struct clk_branch gcc_usb1_master_clk = {
>  	.halt_reg = 0x3f000,
> +	.halt_check = BRANCH_HALT_VOTED,

BRANCH_HALT didn't work?

>  	.clkr = {
>  		.enable_reg = 0x3f000,
>  		.enable_mask = BIT(0),

-- 
Thanks,
Taniya Das

