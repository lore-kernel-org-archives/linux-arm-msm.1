Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FF42122B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887261; cv=none; b=RYlgK4ttFe9bQxRxjXzBSvAj5lRqMTsbFOp7yJrOMKznADGN0Ee/4mtV0sNQ1FsHQDjPG+Jk7zD09s2FJBRUr2FQKHB7hpJfQemwextHrI5Y1Rg+7aKuf7IUCLnWyGPGNHBJn0jMXEjFggubbiot65XI+My+2DKNnZgLQiZIRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887261; c=relaxed/simple;
	bh=aCXyDm9lEfTI94fau2s9dkips7wr0P3WARp6z8OULJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2+8ODjKDNE+Wq5VuME/SVgrMh8OFHlTqBUAEW+W3yQ0JeVA2gdpfso2YWIlK/Kit0eMbMI/3daPlye+mZDPlyYe0gy39SyD1od03RNDK8/VCjCukmo4nWKiJsr2Fk7/BoepX4nSCCHnH9Vk2ShMSUNeZI6lU6VZU839gdJw6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDoecBCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW9qqTDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDoecBCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kW9qqTDY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D902KA791439
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGAQ+SPDmvHqJzwZscytDbFj
	nJRM1Cy8AUNB2ckczKY=; b=GDoecBCKYq1UclhMIzU6gAUGU4jyMdg/pjj7HFCh
	OSBVOjrQb/rnKJefWlP2oCTz5X84+x9Q6kLuzN/zBFUJwPFcm6MuYB7kHM0GrNrE
	1OBV4u+hpOsd45NiSUbyJv5UI8nocTMzwD6+5oNVw3FZbRWE+/J8OgwV0FOY1jqw
	DVEGmXldwF483UBV7CR6pX3Sv/qNnNOKuNLOKvbzPG5GoXntVR+9mfzaMhkG4NGZ
	g6SNw3HglhZj1u737cu+EbIsUj67YBzexyOPv30e2WECOTAa6KsLuLxcbXMKSLTZ
	OsVrTeHs+rllxvCsom40XvAwN+JGyK3hh8GQJt9Z4mZRuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrckc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so335789285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887257; x=1792492057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGAQ+SPDmvHqJzwZscytDbFjnJRM1Cy8AUNB2ckczKY=;
        b=kW9qqTDYif39DZnmcl8NLQEM3Xe+jeBHpkzZAf9V/p2eWQycbhh79fFA3ceNTLmFKY
         hx1ORkXhn6lDXeZJkVJDpSC7xxyqnkyCGBZsTk0Y9uerqI1gqrnDIhGwHpp5kS4lwkoR
         gDvqA0PqGWgJj9K4T7rgCBs9D8cmKV9oYC+wzIiZLs1xOLrZhwAnBROaMxsskU1Kh5ui
         Td1DtFkWO/2mR/E8gwxtXHkodT72PmGBZZgMEKdQJgfUg2thWlSi51g6virmd1E0AgLI
         v/c6PwakQzv9bHg+/bNlpq1O3xI2B7K2z6fmkujuQVou1QVwR2xCnTBVBwTvzMftaST0
         mH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887257; x=1792492057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGAQ+SPDmvHqJzwZscytDbFjnJRM1Cy8AUNB2ckczKY=;
        b=KTpzl05ufFI/8oe/vV32dobAx18PxKQkyXjlcwt1F545t+fmodvE3abDsDyM7Jnf78
         DCWmouMDLcVDgcN00ncGhryaRQnGxZA7JWZS6TUaW+ZRkMXr/32rNZ4iL3Fa+0lbILm4
         XXMD/qLkLNIm5VxUTKlLgGzP16bqPaDJsg1v9kDBLHojS3Iu0+luVxHpjnVxoEFWM+iY
         jgW6Hdxn7R3051Lc1bgqI7VbHaiXuMoH+zTQTHZlYJRtmC4SgdlRK/wzUp39JcwqlBQ3
         RlkTk0OfALz9JtrirRdgZwWsI8EZyr0UxANqWU7ygnu5O9W2Er8HmILGtpCcLUvBUsUK
         TJjw==
X-Forwarded-Encrypted: i=1; AKwUvBzniGmOemfMNVFYXWoTgceRz3dqckZZjsB0jypIhkTHSKyokZILU+pyCUmVD2onb0QkI+tCDBhepuDc/uDL@vger.kernel.org
X-Gm-Message-State: AFq9FYLzrFgwHIS1iZoQ8O13RKzaLGzdJJT7f10U61hDTLrtw5/OVW2A
	rLL1hFi2XQUK+hhCN7zvLWqy1qV9x0yhUSQHpTwMg5gmtduykP1Qxf8yhMoJj6tZlooB/f8BgDB
	erXGa9drKEAsi4bk399OmdHFJXOBV5qsqMYxaYs2P8UOb6W8fwLR/QHIVtNyidwlcCVJ+
X-Gm-Gg: AYBFou26kGS1yGQz1SRQx0k2lehX44zcq0datAMxsk57/zhEBYMXYNaq/E7IyYsi2yY
	zaVZaW5GMV5ow8x0jS82paJWnt3W3NOGhp3OXY7gK8GMZYeRMhLbRlSGsoubSVh+7vJhFlQjTaJ
	uDKOmqnNySsTOabOl74m6r+3M03Y9RuLSmI7xS279ykYLWtmw2NFNlgl5lEcfa8h3XtIo8pwABg
	18wbg55X4r7kmlEVcOCXtBJymItan90ueCTH81SO6r88RG9quB+LMBZ5WDaJfS9p9Wkr45U9jp4
	Pfkk8rTMcwMakZQC0xuPYsdAgAPQSVvlqSuiv8fmQQXwVhvAXlRq29HIgzDmjV0KnuHbSxCv6tO
	xXgicWtqon5lmJQxEoZ7+hvitmgxz7zBD3PFuq48ralFO6eS+8AoAeR8WBorg2FTUP0QnfeyotV
	p4Stqb4psIweKF
X-Received: by 2002:a05:620a:2691:b0:93b:d7a2:dd2c with SMTP id af79cd13be357-93ebd2823e2mr1854076885a.60.1791887257367;
        Tue, 13 Oct 2026 03:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93b:d7a2:dd2c with SMTP id af79cd13be357-93ebd2823e2mr1854072785a.60.1791887256775;
        Tue, 13 Oct 2026 03:27:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bce8aecad1sm2774560e87.8.2026.10.13.03.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:27:35 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:27:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/13] phy: qcom: edp: Add Nord voltage-swing and
 pre-emphasis tables
Message-ID: <ftif4r4l4orj7zgvssjqdtmkfj4kfahbxjx6kh4fo2dve6o33j@johl5kwn7cuz>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX9GFnN34qeCyf
 tyn7Kh3MoVo3P/Q2+Gdfa3W1LJBjkEcs5kUa+bL6vMscuLa4sJchNywP37uE5oEoNRMVRykkk8d
 ql94YfLZjBjhHkwfJbQBzUgeEI0Lm+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXz8qhzfdbwXUB
 Z+F6m8rc5mXoIK+rsy4Z6uhrpeZHulKbC3OSWs4Lg8ezP+mlf0xqhTry9aJhmEtKVawhIJQenJj
 jbonBp3aV7OOAawC77J1IeTWPGbPQWYNOA9YpD0regFXLFGAFFVo3463n/o43asSLXNt9Wzmk51
 EBuwmT5fTKzjR5DAh/HFxxrFfHxCp2CQYtj3gPGc9MGzYhO3Thyo1ZssROtDtpcM1gEcFmF9bfN
 l8JGixs1tIBd5EavK2QJ9XrtaStHE2TdTbjPYDpwJsRzzxhBrBuKs3cBQrjUSYajg1xSu00WA9S
 CJHUmEGnF8ll2WsvztJegSMgzwbF9xzQQ02/HRmTZ7M+SMaNX3TWjvn6ZPIHGcuN4envSBJdXI3
 Yi4gyQkqDyvazV1ZioPuY8A1T2CQPYwgnQhb8YIcNMZoOC4EXRlG5LeC8hXRuHSBivxF/ZUJD1l
 uE1rTWZTlexxVxBieNg==
X-Proofpoint-ORIG-GUID: fqLpTgtHukM5jclB8dIlaq-nLCap1laU
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace079a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=HDF95dwk5MVqU-wvWFsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: fqLpTgtHukM5jclB8dIlaq-nLCap1laU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:19PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different TX voltage-swing and pre-emphasis levels for
> both eDP and DP modes.  Add four pairs of 4x4 tables covering
> RBR/HBR and HBR2/HBR3 for each mode, sourced from HPG Tables 2-2,
> 2-4, 2-6-a and 2-6-b, and wrap them in qcom_edp_swing_pre_emph_cfg
> descriptors.  The eDP RBR/HBR swing table reuses the existing
> edp_swing_hbr_rbr directly; all other tables are new.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 64 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index c5df1086607f..c63f721702b1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1538,6 +1538,70 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static const u8 nord_edp_pre_emp_hbr_rbr[4][4] = {
> +	{ 0x05, 0x11, 0x17, 0x1d },
> +	{ 0x05, 0x11, 0x18, 0xff },
> +	{ 0x06, 0x11, 0xff, 0xff },
> +	{ 0x00, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_edp_swing_hbr2_hbr3[4][4] = {
> +	{ 0x0b, 0x11, 0x17, 0x1c },
> +	{ 0x10, 0x19, 0x1f, 0xff },
> +	{ 0x19, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_edp_pre_emp_hbr2_hbr3[4][4] = {
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x0b, 0x15, 0x19, 0xff },
> +	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff },
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg nord_edp_swing_pre_emph_cfg = {
> +	.swing_hbr_rbr		= &edp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2	= &nord_edp_swing_hbr2_hbr3,
> +	.pre_emphasis_hbr_rbr	= &nord_edp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2	= &nord_edp_pre_emp_hbr2_hbr3,
> +};
> +
> +static const u8 nord_dp_swing_hbr2_hbr3[4][4] = {
> +	{ 0x02, 0x12, 0x16, 0x1a },
> +	{ 0x09, 0x19, 0x1f, 0xff },
> +	{ 0x10, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_dp_pre_emp_hbr2_hbr3[4][4] = {
> +	{ 0x00, 0x0c, 0x15, 0x1b },
> +	{ 0x02, 0x0e, 0x16, 0xff },
> +	{ 0x02, 0x11, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_dp_swing_hbr_rbr[4][4] = {
> +	{ 0x07, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x16, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_dp_pre_emp_hbr_rbr[4][4] = {
> +	{ 0x00, 0x0e, 0x15, 0x1a },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x02, 0xff, 0xff, 0xff },
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
> +	.swing_hbr_rbr		= &nord_dp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2	= &nord_dp_swing_hbr2_hbr3,
> +	.pre_emphasis_hbr_rbr	= &nord_dp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2	= &nord_dp_pre_emp_hbr2_hbr3,
> +};
> +
> +

Double empty line. But also these tables are unused at this point. Why
do you need to split the commit into multiple? You have performed
refactoring in a separate commit, that's good, now just add support for
Nord, squashing all "add Nord foo" commits.

>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
