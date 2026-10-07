Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D533FE05
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358432; cv=none; b=oCfGz21EKGCEuZmfKpmMpvuKCctI0dRvVVEc1bJFJ79cVRSuQ7RGb6aMNWFF/YO/0MXTBd54fqAOCNj9WAn/LtloTabZD57PA3hf+889GeMgK1x2z1WiHHu8XQog5p9fseqm0JNT2JIrdFWcu4/vJfgUzokVqpSXaYH/IwGhIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358432; c=relaxed/simple;
	bh=8BG1CyAhRvkSeoBtEPpd7NDHD+8GQyPDM4By0RPJZVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+PprnmO9P0rRDFZAE+W10od8J2k44pRwOlpQdI9gkqmMYUiGiMbVkudh2bvsBi/oyr2IFG/nmxyGOOG1dP9hrvdOFdQvXmwVh55Qpr8bqB6yeEyCatzIboxnoR94P6PjpDp/jbYQUtxhA+IhXKTAPMhCQc0TmWU0hEaQ4rEsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V12pArqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vi+sdojc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V12pArqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vi+sdojc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6975NtvA1566965
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 07:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rIJHGqjJoOZNcEGSLMz1nXzXAIAcTzixe0BY7qUjfio=; b=V12pArqsr4RNULOK
	wyq4GTynyQhlmdWN1uVjneNDqP7Eisu5bYSCDIg5268U0hnzkttPMWb8JDX5up+R
	7uhWVXrLznkqu24uxxwt2E3vAVIz1VaZFuiNRJpOqKJFqwL8bOHEy5QYIrB40ddI
	V8Pn9190496/SxH7Lui7ScfY3Z1EXK3iuFeL3c7kM0VdX/UadMjdBrwLxS14CSLh
	LM7SDSBWr0872FpPXYsAdACSHmGuhhxth3554Cep8C1c4G5SVcSmSuC3nuflljux
	f6fx12C9D4ZHJMbRXNIihEQS8SR1RU2f7zKqzOiiGxKtkcIao0+5jEkhHwRvz1eX
	hlYNbQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rck0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 07:33:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so4263829a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791358430; x=1791963230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIJHGqjJoOZNcEGSLMz1nXzXAIAcTzixe0BY7qUjfio=;
        b=Vi+sdojcy1lx7zoFNm8ZVIPSL7ovDAwt+9gN16wzmaTiqDMhfmjwxpXF23xEnTDT/m
         LQ2UGtpUiAH3j+swEjLpaTt9OpD8pNgBz/FL9nrwQZzp+g14W/Rhe6aYSCoY1hs0FTOU
         C3z5HRkU1fAgAcwmQSFvQJCAk6E2yavB7HSXzBAB591lHUcoIEInz/A3rxnwZFVzxn0f
         xTEbvw5Uwy5diwn2SJjaDTLgjaZd7Ss9fDufAxHgUeyzDYuKCLz7vtRbQmgqUO4hRalr
         Ab6gNhNL3omlL43SAoZROfSF1V88oo7X82ezcdwJFnJSNARbFDwm/tTDdC8iZ+QjN6o0
         z7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358430; x=1791963230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIJHGqjJoOZNcEGSLMz1nXzXAIAcTzixe0BY7qUjfio=;
        b=qlwYtvAUZA5MHJm7+4fyuCyg+YeNbmBJx4Ul+NdpvyR4HOOATqv/SA3HLccQEZPpSX
         ctzmKF9D+GWX2BlviJUen2HBp5f3WA/teFkvdEM/y6HpMD07a79mjTSk9UpESkfM047j
         n7vhWv1lZe16VSj4kIijgtmAKhJvKpyWvk7MY2C9v7H8FOrn9q+jshuBvmJzUAR1bAqX
         ljqs7Y7IwuMF33nTsbUJ1mQ8bhtaTnjQEIRJtMt6WQv9Qinpzf5rM3cDDkBWslyHm4Zl
         axxUS7TdwerKJ7uh/MhzSqwuDdJr1OmPYV1ToMc+XBT06MFrnTwuvZn1QNI/SZra49BA
         A/7g==
X-Forwarded-Encrypted: i=1; AKwUvBz3lAW6xln0ONwCphyIlutSTXbCdA6QIHnLGPSTustMUFvbXBuRQknv+o+XGCWX11rNU/5NhlkOghuQtEUo@vger.kernel.org
X-Gm-Message-State: AFq9FYL7DUWB65FG1xlyPNwOX6KSMOwE7a5mNivjS3ReRn59xbuCaD73
	yff9BZ5ecfMYMedRHD9gI7iU+c6kHSFNUaUX8fXiIHDrBbRvnWtbYh8zwcoxZo+wxYuZvvNPGZm
	P6zwirT/e5A7+fYKLa/sWPMkVUqMfkK40vypjThtH+LnugUaamudmkKYZqjXZmA8YyknH
X-Gm-Gg: AYBFou1RRPKfIHkTnSq9kbkNC1XGkNIjE7/OoQ25ZIJMhkXNgPFR+cYQF6cJQ8eUs2v
	oLjNAMZIAObcbclfzYRdFqkqgwxCSqKbIo0RTlXcStBQdOeJopwCQhzydxZTLw2xhT/y3sC70fe
	LoaIJDWLH+UaRGQNGl0iFDvPa1LT1J58IxxjXPaBJ/UZ62ZPDT2R9/OrbL3RMlPljmXowI3ITaC
	1xd6t4LmxpZqXUVs0R6PIFJWExKfz33yj2KUfuvIIdbREsODoUtUjgX8wo6HFBOL014ywfKupXy
	JUkFABa2ZbAu54LC2zTTASCST/FAq7TUVhiV5Osnvpg1dgjGgRCh6UvaQwm/4GPTxuz85wO5pNJ
	lAf+clHTzN0AhdHncCXcBcXmPCNDt
X-Received: by 2002:a17:90a:e704:b0:3a8:d1c:8e67 with SMTP id 98e67ed59e1d1-3a8a0e097f0mr1239289a91.35.1791358429786;
        Wed, 07 Oct 2026 00:33:49 -0700 (PDT)
X-Received: by 2002:a17:90a:e704:b0:3a8:d1c:8e67 with SMTP id 98e67ed59e1d1-3a8a0e097f0mr1239245a91.35.1791358429295;
        Wed, 07 Oct 2026 00:33:49 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm8776843a91.0.2026.10.07.00.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:33:45 -0700 (PDT)
Message-ID: <896dc089-b3be-4bad-872a-906deaa97071@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:03:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] phy: qcom: edp: Add Nord PLL configuration callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-14-e25c073cf1b6@oss.qualcomm.com>
 <nv5ij423d4rbwpnhexj6yv2qgasrb7k3wzoo7o6vx5kg3vc3n7@6u4rln5ltbsv>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <nv5ij423d4rbwpnhexj6yv2qgasrb7k3wzoo7o6vx5kg3vc3n7@6u4rln5ltbsv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX3aw2Thrhzn2J
 adFujjC+du88k7dd5MCr32wHpdYPeHb2qEJz+Vx/W1atSG3wKaOQESswl+mrD32n3ahBzxU0GMN
 9ZyGwHKXM7gYicF4oFaovmUiw2PASO0=
X-Proofpoint-ORIG-GUID: JLzFyz3uo5AC-P1oovKK605iQnGqv0QI
X-Proofpoint-GUID: JLzFyz3uo5AC-P1oovKK605iQnGqv0QI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfXztq5NlK/N77T
 myLoLTvv/MUBYjh0oOrDhpc10dTuGqGTkyGOwWlHB55ooQNpboRJ55phP8FeYNNKWuN83XEMXop
 bx0ANfKcYtXh7txnsCID0tY9snOJ93lkcPFAi2AWBfYlUPVeKpuiVejhQJqfVF49PU5MXVp7WlF
 RelKr0qpkrf/+5Jvwrc2CwLMDs5o4+SDxcMktkOekExG6SluSTzojrQQkJFBtd9hxzt7YHavE8d
 pRXwf6so0sP466mFLBSvDoCuWhLJriI5VGNF8CSy3wpQDvpHnWMVFKNHBwllYdagT5W/5dCGA03
 iowcAu+YhJoIXave3deOzjTyBzVIcNUnh7MwBoswpLFGuOFCloLSszFHvjr2gnUF0O+F7zYKtrD
 Xln2RZ1X7NQ2NLeEbc1EEfjmPrDZdRSwU0DAG8D92ZEujuDxXtm3Y0IR16CUFIwO7646HjaL9SD
 EL9e//68AOX61F4hGvA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac5f5de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UbSN2h5EAu2IQE0OKKEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028


On 9/14/2026 5:42 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 11, 2026 at 09:06:45PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord uses a 38.4 MHz CXO reference with a different QSERDES v8 COM
>> register layout and PLL coefficients.  Add
>> qcom_edp_com_configure_pll_nord() which programs all QSERDES COM PLL
>> registers with link-rate-dependent values for RBR, HBR, HBR2 and
>> HBR3, per HPG Table 2-1-d.
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 112 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 112 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index a0f4b12e561e..4d1b2c81d956 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -1688,6 +1688,118 @@ static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
>>   }
>>   
>>   
>> +/*
>> + * Nord PLL configuration per HPG Table 2-1-d, CXO = 38.4 MHz.
>> + * Supported link rates: 1.62 Gbps (RBR), 2.7 Gbps (HBR),
>> + * 5.4 Gbps (HBR2), 8.1 Gbps (HBR3).
>> + */
>> +static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
>> +{
>> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>> +	u32 div_frac_start1_mode0;
>> +	u32 div_frac_start2_mode0;
>> +	u32 div_frac_start3_mode0;
>> +	u32 dec_start_mode0;
>> +	u32 lock_cmp1_mode0;
>> +	u32 lock_cmp2_mode0;
>> +	u32 lock_cmp_en;
>> +	u32 hsclk_sel;
>> +	u32 code1_mode0;
>> +	u32 code2_mode0;
>> +	u32 core_clk_div_mode0 = 0x14;
>> +
>> +	switch (dp_opts->link_rate) {
>> +	case 1620:
>> +		hsclk_sel		= 0x0c;
>> +		dec_start_mode0		= 0x54;
>> +		div_frac_start1_mode0	= 0x00;
>> +		div_frac_start2_mode0	= 0x00;
>> +		div_frac_start3_mode0	= 0x06;
>> +		lock_cmp1_mode0		= 0x37;
>> +		lock_cmp2_mode0		= 0x04;
>> +		lock_cmp_en		= 0x04;
>> +		code1_mode0		= 0x8d;
>> +		code2_mode0		= 0x27;
> No extra alignment, please.
Ack
>
>> +		break;
>> +
>> +	case 2700:
>> +		hsclk_sel		= 0x04;
>> +		dec_start_mode0		= 0x46;
>> +		div_frac_start1_mode0	= 0x00;
>> +		div_frac_start2_mode0	= 0x00;
>> +		div_frac_start3_mode0	= 0x05;
>> +		lock_cmp1_mode0		= 0x07;
>> +		lock_cmp2_mode0		= 0x07;
>> +		lock_cmp_en		= 0x08;
>> +		code1_mode0		= 0xf6;
>> +		code2_mode0		= 0x20;
>> +		break;
>> +
>> +	case 5400:
>> +		hsclk_sel		= 0x01;
>> +		dec_start_mode0		= 0x46;
>> +		div_frac_start1_mode0	= 0x00;
>> +		div_frac_start2_mode0	= 0x00;
>> +		div_frac_start3_mode0	= 0x05;
>> +		lock_cmp1_mode0		= 0x0f;
>> +		lock_cmp2_mode0		= 0x0e;
>> +		lock_cmp_en		= 0x08;
>> +		code1_mode0		= 0xf6;
>> +		code2_mode0		= 0x20;
>> +		break;
>> +
>> +	case 8100:
>> +		hsclk_sel		= 0x03;
>> +		dec_start_mode0		= 0x4f;
>> +		div_frac_start1_mode0	= 0x00;
>> +		div_frac_start2_mode0	= 0xa0;
>> +		div_frac_start3_mode0	= 0x01;
>> +		lock_cmp1_mode0		= 0x17;
>> +		lock_cmp2_mode0		= 0x15;
>> +		lock_cmp_en		= 0x08;
>> +		code1_mode0		= 0x14;
>> +		code2_mode0		= 0x25;
>> +		core_clk_div_mode0	= 0x0a;
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD);
>> +	writel(0x0b, edp->pll + DP_QSERDES_V8_COM_SYSCLK_EN_SEL);
>> +	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SYS_CLK_CTRL);
>> +	writel(0x0c, edp->pll + DP_QSERDES_V8_COM_CLK_ENABLE1);
>> +	writel(0x06, edp->pll + DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE);
>> +	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
>> +	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
>> +	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
>> +	writel(lock_cmp_en, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
>> +	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
>> +	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
>> +	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
>> +	writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
>> +	writel(div_frac_start1_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
> Always 0x00
Ack, This value is always 0x00 will update this in next revision.
>
>> +	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
>> +	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
>> +	writel(0x12, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
>> +	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
>> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
>> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
>> +	writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
>> +	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
>> +	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
>> +	writel(core_clk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
>> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
>> +	writel(0x1d, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
> Not 0x1f?
Ack, This should be 0x1f. I will update in next revision.
>
>> +	writel(0x0f, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
> No DP_QSERDES_V8_COM_VCO_TUNE1_MODE0 /
> DP_QSERDES_V8_COM_VCO_TUNE2_MODE0?

As per HPG, We dont need to programmed these for Nord.

Thanks,

Nabige

>> +	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
>> +	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
>> +
>> +	return 0;
>> +}
>> +
>> +
>>   static const struct of_device_id qcom_edp_phy_match_table[] = {
>>   	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>>   	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>>
>> -- 
>> 2.34.1
>>
