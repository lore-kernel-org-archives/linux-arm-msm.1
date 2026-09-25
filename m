Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB23E3D93
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330252; cv=none; b=dwPaO0fgz8SWAJQTjFaJBJsrNTmzKp54YkPtNKN2LpwX1Xgb+wCMWb5488ljkRBjuzgXPqTG/gBa3W3uvZhNbR2BlD8TaAviinHlaHRUfzSNVasBPuMfGGumTTzAfqZIxGybX5Vk/F8E/xO8chgS2KK+vQ97qJXMKVMnhs0w+Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330252; c=relaxed/simple;
	bh=CPMAN8rLvPNAB9hxiHU+WCbw2Y33iCG6KeThPLTYFM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVWFgVX0I/lZPawmik1Pi0e2E3CUSYIhAwbCZ96Om0/LoxqDDqZ226yT/JPOjmRjvNKGK4k80rNGGv2Pj/SDxZj4/S1cH3aUaTAR+QTaBJn1zA8WqMLb/J3+gn/iIJ72bHRk7WWh9CsBNIqMA0Wa8H+bD0ggz1N/aGU3ROf3Ye8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJQD/4QR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW05qzYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJQD/4QR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LW05qzYa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z6hF1195003
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=; b=HJQD/4QRz7prCBkz
	CtOQEHS8DXsT+z613mTaH/ADpPVmnHoNEA+QlmqZSziTjJeMKjGJDfKQ/R0+ilhc
	2GObozO4ZD+WKNH5c5B9kH6XrKUX6Cjup4V2qsb0i4xZPJxuKrPxZ8dQkSyEOCG/
	AkghD/tWEH5gMAMRwzbVhsJXODbDenxSXDEGQEQjLjzW2kVhM5ALWBkzdUM23ePa
	Xi6S0mVZPK1BsLVsxprOEsg6W+g8UuyAWsVP7W2C6+WyDDOZIBgmk3lAWNt+iGei
	QwyQ7M1r4F52WFSsdnxPiFflvBl5y+8WlGH/DmtA2s74220v474McscKdo743yCV
	+5lCjQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jxsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:57:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so2819903eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330250; x=1790935050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=LW05qzYaDitrF9T3M9qHKb0qFFsOXb6jF9ByT67Z+Vd/WkesR627YNHqwu3gcaNRgy
         pv9JA/qBRivTfgHp/DMg3PnB+fsYnEXOzwFFe/AzDLjN+NdLSE8MSmXG4/T9u3MUiXmR
         akTiKRLIP6GBAt421nszfpAScLti/MGJbxo5+3OeZWoISYw193J9g1435hBFS8xYOZg6
         BdnH5mwj/qLbg6lwFg29DP+FjVqu+TiX6F1hTSfIW8pdWbVH95RHMHA7f9eOjxgXi/TG
         fPPSACr5OXlGiJ/MXTz93GQ/mJTCzDx8K4NFge94i9u1kr03F8LOGyNL8jpsBPTwdbzS
         2J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330250; x=1790935050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=yki/L2E/baLs5aPgErlB/reAjXjgcrsj4FwJeWB6prl24sIkfrhZqn5m+1LKtGiShA
         2+UmX5UGV7GhUO8sk7p1ck+amvi9N/SjxJcQShu3SHVGZwUIVFQ+eOSIqOOMPhBPIVZs
         obmeHx7XeDmhH94kZOR0YsV+7SBpMR2YY2FpZ7shpRUOUpXn3QSLXtaXX+zrjZC6W8ET
         7CoLpEHwMG6nxILHc/MmM8Fu17RbcMGxiFd694jmFspKXIR4Q8v1wyskghQxjXaGeWX0
         KqU4BSJarno36GXULl5vgqZ6hRgNv3piaBs7sJcivobhuvOoF8PEMhCNqgIIwcPjFDdj
         +p9g==
X-Forwarded-Encrypted: i=1; AKwUvBzy+vq+chyPfcI7LE7ol3T7khUbVt4Q2wY7ECful5Q+reUOOKaqrcH7zKP8qiwCeXqXvm8ga5A3RIx0kX47@vger.kernel.org
X-Gm-Message-State: AFuF++lRyKy1UjpSOg3oodDnH3pDUWqn4ZClU0otANEve5iSDoBh/6hz
	327K1vIb9IeopL9pAOMhrOyHZqMM7O4hgLdMGM30Pfn4VyzJsa78lfW4jfCNFYbGlATCuXy1GfL
	PA3aLoMs5+Gai0EXOHxqYrCEwHI6Id5KeY70iEMz9mYypmFuWeGMYeZDCcmNIxZAModqk
X-Gm-Gg: AYBFou3Hao336G5DVYoutBlyraT+mPJEJoJI9Y3JW9s9ObZf9HQ/VonHq9X8rweJWRf
	7hmPyN6lDiUu4VziAjm5ROXMT3WQiTq2x6vo5YfU+NqhDhTlVAnkpYzroAaQoRSY6+JJJBNS9Mx
	cyJ6PxzLekzraiHRfohSvZ0U3HOY2b+ELz54sOROqZ1g72tOAeusBp4braB3cMwKi7m8oV+nSZ9
	+5oFu+3rdup7N9P2BmVnQeybwBshAIK+phgNeoSgErL3sP6p1t8ppG37T7/I31jkwMrpz4C/YM7
	ElzEsw+qbsJPu+qML2J1RUbQs3yq+ogyKvB+zcEyHCMiDJsc13iZok2omZ7LD8ANGQGlISsgXOt
	3VeyEUUVAWRNpds0=
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5160046c88.18.1790330250155;
        Fri, 25 Sep 2026 02:57:30 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5159934c88.18.1790330247829;
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm6475668c88.14.2026.09.25.02.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Message-ID: <69d69906-eb85-4fdc-ab53-1828984dbf07@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:27:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Nt2W6Uv7HtzLEHt8NyvfOzdAjqZm6jHU
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab6458a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX17L2GWrgVLdJ
 NCS/7NzQit9PaRDSqrq7cDUOrouRYx4HcEGWUL7Wt5Z66T0DDMF4/hfowuyEadI1WdMYvpahdoP
 f5zHuXD4uvCwJI81v5W6ALy629xI42ekCVVf9QAH22MSpecnVdRcIWYc5+Z/bUdmnxMCn1v5/9Z
 g+1WiNmcfRNpyCiSDdeDXLsfC4wEwSkZc46bMiZrLemfCz2qUfr06u8fCc+bXYB5S/5bi16ROjI
 qtGJmQGlLNoiSPfMJPxY6yDurjJOCwgIT//6/1C0tVfFHrqz3u8k46rwMTQAQVf5oIzHJb1zg5Q
 6DUIhtv2rcQP+lgePgav0CNl79O6Nk1nPiEbNgu2Ero15p3U9Buq6VyDae3dCXdvlQb6IkYUs14
 cXLX9etuRVC7TAJ6mA7M0lxx6bLZ0cU1jzJ9fVdkSue1zoTEeCrKCJhxjxSHwkPKhU/NvcmMrD6
 j4ff3D3oCzDzePpkz5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX+C/p4pvpPeCS
 CAqGkN+ZYNi1hfJTrxbYLj7StIhAeYL7zzTA0cQzhV8EnTjb4vI24ACa4fSDNcSe2PSxlYw2c76
 quB7zLRUhA9NUk4zVLGYv3SCzaqVKyQ=
X-Proofpoint-GUID: Nt2W6Uv7HtzLEHt8NyvfOzdAjqZm6jHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 802987da3cfd..6e0b7a54523f 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -415,6 +415,12 @@ rtc@32 {
>  	};
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

