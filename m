Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1F411FB2
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372824; cv=none; b=efwHqBYmn4gVZ00sZKP5RXL9IvzLRLfRrCZHuDZxPawf0Ft5tTNHzjF5EgUJUjYdDYNlYUEKKOxQX/eE70kc0dUEf7RH2MVkl8zwF5+zzCUMSyANgRUnIDuVuH/sx7ndqHEGhU0pl9h6RVpe1ZtVUxB58ZiNN0d0Rkgm+rXllYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372824; c=relaxed/simple;
	bh=dJRew0RCqMZrsYX/336mtM66FOjge+oEkiH4dzIm7gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR+t2YzFDF6hpUqrWpB/+pKnOV9jqafpM5MXBMhVRXZsVVPe+gNsxXGpLm4LjJ9uoRTXcjZkjzmF9oqSiBunIdYmfUhyeKTx35zxH++DhGV8muJ/aE7lX/1mudSaRp8rb8J/q/j6+tGbeetesRh+R8UGvieBsPMMcWA8WoLVhSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIPME/+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4QBIZQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIPME/+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4QBIZQ+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVBQq3198230
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=; b=bIPME/+yaFa5Wgzk
	TUcNEiMvX+kYVG1Ym02c7L5TxxWdyXt6yXweG3dSfvGbt360GtTNOoFu6Y1UJc5B
	co4tADcrkp6gJAf0d2Yo7u6nVm0uXNGYeE1rn22g9IGpq3rUD/aDAJhnQuIoDU4G
	s6dJDANvoLDtJBJtx2eSmCWQDl1onJlMlCkN7IKhzP+t6g9osbAAhB3/a0O2og4b
	2bdgXQkd09fsLdlhHkP1b+9YT7Jecqxk/s3oiE/24jzh6zNs4gvk2bNznFd0u/qj
	uiKvVDXciTyJ4BcjJMCZG6QFDUYD28MktAf/VNWvtUGrJOyGvGy/uUt2kCKW2lOr
	FrGptw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1vtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:33:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8881a7875e5so3034724b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372794; x=1791977594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=;
        b=J4QBIZQ+2Lt4hRxL05gK0bsu9/XFTaDz0ofeY6t/0u0EeI57xUPwYT0SmZMN5OOYMx
         /8gcTZFPRqUOep8HnxeTzA+VjxyuGSdxm7Gtv3pTpomJHJACyA70YHfx/Tcgu+hCUXW+
         b1Q86qigjCUeBRDzX8XiOYLYgcFhTZ1t9vi+lL2m1p8LISopOC+adCpcrMMPkfTzjesL
         gDTg1yyTDOR9cg5RCLfQ+nKSgrELxHCoPdL+afd0Oq8FcT/6BIQPk9SGJ2LAWPizAY/k
         9doJ3C3V9mXSOBcuWvxaQuDdrH3z6pimbzqIA4JmsEqPxX/HVQQo6TTfdNKvRTbKLeSf
         0eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372794; x=1791977594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=;
        b=wYy4qn7hVP8lSe7HTdoo9OzvXl81HDtSEHaGDk740R2toEgPeWt8520z37n3HyV6zl
         12Jk3rerCwNaH4L4RTpxjc75m3hjV6c+EMSQEsHqKggeRv6Dz3qG/gbvLRJWrxN+sYar
         62V8X2wrWr/nRHTnq5albTCSlztLzBryBVumaH6s5fvsjUCkr+echO9x78ArQdjd9SqP
         MHwMno/jmRcmMdgbisodiztE1TcVbqGaRjJClpynxcbhuVWhi3BReqPynyII53pr7KGv
         goefA3P9AF1SxwLV2YAYMUU1SwQLBOrE8g/IXFD8ea7NoucLti0/+CiXY4akTNitRfvP
         aXeg==
X-Forwarded-Encrypted: i=1; AKwUvBzU7mZP/p8idnDQ9FT1m+0VgqCytZWy2SXY6TJcs0CV0wzk4B+JJ7KYzfQAxpdGuYdhOPiXoI6yomsvZRDc@vger.kernel.org
X-Gm-Message-State: AFuF++lnv+trIhrfTCfOUpJdQwCJi99xAfMuDPhZHZngy0Z22X00DFPN
	hGxGTn2L5EAocbsUcbnD6Hg4dxn/Kp7V8i9sj+ZuAzYz+gtP4fDS6IX2PYVyN0SNqP+BBV3NIE8
	6Kogvaqyl4ZgpyMLwMSajKHWIbtSoNHdKvk8NhW4UD5aTQTdnVs1Tc+xUBTNxW0I0nShx
X-Gm-Gg: AYBFou0r+ye+rzbqpQOLs87ZPP8l3zK0yGLMR8qhmGzXnYo7nlozOgxlFDXRq+Eda6C
	jRXCMsX2GiZT4LDcenaSEREYPNSQA+cV2ZENwqAUsJVppFYFlFTePPRVmLZobEDic+sUutCtLx6
	KgfYvmhqDo8R6MwFnNv+vNoeWUawCvB/GjsLFPn1M+7xLrW4kI9Xc1UY3DpP+t3G8Se7P4k3BRB
	z4jIsBE9WLypRIZJUkTZF3dFngG+DO0iRIok6x0unCveWnExw9C6fxTr1SukzeurmSksAcQjg7E
	YUVxGps+WyTQiUoeWuEnghJqXa+8D6VYqTsQqkGvP8SpOpKv19ibGqhlY+GqLDYNUJeVsYfAxTb
	HB27AIDv/hv3HmUeWcjPgvEngY/crlDNR/fFAgw==
X-Received: by 2002:a05:6a00:2188:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-891b0c83960mr1586044b3a.9.1791372793131;
        Wed, 07 Oct 2026 04:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2188:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-891b0c83960mr1586011b3a.9.1791372792597;
        Wed, 07 Oct 2026 04:33:12 -0700 (PDT)
Received: from [10.218.41.37] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188914299sm1203497b3a.15.2026.10.07.04.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:33:12 -0700 (PDT)
Message-ID: <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:03:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _XA7e5djC0kyyqizPZqLuJroMwIP-_3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXyOUbfUNbKPEJ
 m6/bKqAa53wIFICQE46uww8MqRo6c71CanMCj1oM249XUO+BeWdDdXfwHu7ZROezb0lsO2AdIYj
 roK7+gLqHKHA/hDqWvj8aTMgQL5KuHJO2RV30rikx0siM/ip3GeORiPye5MW7r9nO9LAYh6fM10
 g5WUEKtLUEIySwvafpm1Gxg7lWF02KvAYtmxpEHyP9praOCZg0uPuGt3VfD3i7exWEk3YDzzFGo
 SRpHRGD1UkbxsRYBwWHzidZ1tKOoX/q8ILzaLFhlyaqATnDAN43HsoAVXTB+EbpIeH4yIGKR+Yj
 eLtV9PqbaMwDKVRLIYVNswPSxCOZYZhcDandfBGtWBM/9QpnmTQojJZNfd4I4EjwpdX98w/rxpQ
 nsGDUERLizLJDJL9NmLjTic36GFu0dDhKMAKabrAQU61Lozw3QgpV+FU3rcuyChaPOJvan8OqW6
 DbyEV5eYs452eFrTXBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX7yDYOA+tthWg
 9szdUS1m4uKmiNoRlPgg7mp4Q2vpxSUuU0TdhRLl1ddGtCeH52vFNM44/GHzmb+oLBIV1rnoqN4
 xcmVNSmSMVEFZkmeB5nTLsuZ2kRsDMI=
X-Proofpoint-GUID: _XA7e5djC0kyyqizPZqLuJroMwIP-_3b
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac62dfa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FIX8ga0CBHvb0ZQaSzQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045



On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>>  1 file changed, 99 insertions(+)
>>
>> +	.offsets		= &qmp_ufs_offsets_v6,
> 
> So, is it a PHY using v6 offsets, but v7 registers inside?
> 
The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).

>> +	.max_supported_gear	= UFS_HS_G5,
>> +
>> +	.vreg_list		= glymur_ufsphy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
>> +	.regs			= ufsphy_v6_regs_layout,
> 
> v7
> 
>> +};
>> +
>>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>>  	.lanes			= 2,
>>  
> 

