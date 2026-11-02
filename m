Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632292;
	b=cuMGJaaXpE67f/o3syjriCjVWXUyK+9Ilqp0ZxmAFvC959kJ9Kg2xKFmCxGyHUfyA7Bg
	 hf6caimuoIut5AUZtpLA1ibr0oQCoWHXSptOlnKUY1VtMNJdHPak9WwdmPIKrpwH9hNrf
	 DMSxYWw0TMPb/QRBR5MecVo8JwgtQH+wlK0y4VpCuk7F4YgXcjl+TL6L9EkE+eTK8bvn7
	 4Lzja89r9IInkO/yMNJ+HO5dRyRbjAZUkghXhDV1IEIm91MxdT4N5yoPMn5kjOUh9qYdy
	 q6zZYGuCYH2GMy1Rb+fxRjrD3C/2bduZ0BJfwEwpeXVdncZN9dlDEyJWrIBx0TC1nSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
	b=iVL6DV0N/OPcPZd56FhX8I4L+F7SiuJmLm8b8M/gLBJCvi9V+tNRNh5r7rVzWmPA0ABL
	 shUNFkG+M1R940ZgIKNMl9R0NZxPdqI2lETt4pVOuL42xUy7XCp19ROS0w3czGhiJUPiZ
	 0O1ny9XWEM17jNIBJQTN4Vu1xLQUWMh2tSPmGQDv7O2dNMjTkOWcpfOZ7jdzQ2QGDgBAW
	 dZ8DSPGwrwhdSA3l1+QsWEc5iYvJzyWnjkkwEjWO2T0LYfT+6NXfi4Gvz0qP1gUe5dwph
	 zPllRyDzWbJnl8Clr7hP1WwCF6VKMeGueUCWshSpZ/JShTNEPF8Gxlj7cIwwbTGO09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBfs3lE2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A09NWiOz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDBC6091544
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDBC6091544
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBfs3lE2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A09NWiOz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpKN94061996
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=; b=TBfs3lE2P90N+Km1
	czkS7Ppdxyazmbpd8rBJm8hVRNzXd97F9kKDAAhOf/T3UiaMV2bfSRscnwsCGO90
	qKdjJ8KrGqvR9c4aT3t/9Rcw4ynUDSw8uB7nIj05qgoOuWlij3vE0MOEk9FZRaXL
	/6FL0V6zCj7bUeqpZviAX0TOWrtBGIbcaIr7kf/RIXZQbudaR8JR2N0aX6RUF1BD
	ZTtjiJoX5n55myL1S1XCEWKetJnk3WJQv9q1Zm3Ze9KV2f3T/EKOytfLGdN7zw/J
	nuffWBFwVxGq5uJE448Sqhj6qd/ECF6J1oL5VpVMtRlxT9VE8aohpRcxHdZ6b6l3
	HZkkFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmeswax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:11:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so4298595eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632290; x=1794237090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
        b=A09NWiOzLAm4AndA+KA2rVrCJvIdXKS02rfCvnkuGHDUi2CCYHJ6Apnqoyn+TVmPRD
         B09jUWYtEuU0zEAn3auwt3ED5mY2zZ1BdSTaM1lRMDWGH0b+wWAmXK5C/oP7/sw+UgK0
         VCix8kYLLDc3vrS7OKyUDZrt+rq8eeyjEZje+V0oEUJWgQ1IKru2nNVsv5zjts/lmglV
         diu8C9hJ1/0Ci281Ibtldh2nlpnZuOu+9CMsopB/ie+x0dcCYBDKwg1ujXXpLIlw2rym
         u0ArxFoSh81pJv664aSvmwjrqnCuhQS93W/sYIEyYaqJ/owSiOfsI5GS2jb3FF/t6u4d
         QgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632290; x=1794237090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
        b=VdhwzJiWQ/YlTt8JE2jYP3cY264/qHT/7rEE5mrOKOMG6Lbil/O7cfp49RI96t9Dj+
         giEyZg8aSL49wlXG2pdw3zctAeTsqXfS0ASIsmaXqQS3qJRb+vLmhIGrXF/8eG/2Qo0a
         6I3BJgXGcubPqlgqCra89FjEmaSCQrEFqu6FVIcaFRaM389NEhzAVhbEG+J0fHskxzIR
         w5OPpDhrF4Bw0ur6zxUiccTFBYER+CEmi+nPDtSUHMQZrfATT2KMrEWDB20oDotD5fKh
         keg94ucLntnqazIzCooL+3cf0575znMO7XWNq7R39eaT02U6J6X51SE5oWi+zuBDCr53
         oGMw==
X-Forwarded-Encrypted: i=1; AKwUvBygoymyxK/KSbnquf+Zpgv0vIRzkdn3/cL3Of0ggjQ56W858R/890s8CLU5/HZSEjXCSs0zZef6hNhKwiS4@vger.kernel.org
X-Gm-Message-State: APuU4Z9vPAOAXc+mhYewzgun8NB43U94e9FadJP6+fPzcRrSixUmlpFP
	Qazy/BYYowz/ISj+XgRjYCJuktmmErRfVS8MJFn5VP81AREx1hVXZgmD1dvEbuhgkrLzENU4EF/
	/YMmdyFrQ7Kxzn70HegpY1z3q1kv7e2UyjlJnGB0A7JbAT3LAqnsui3zXzIUAjXUHI95x
X-Gm-Gg: AYBFou0O6z1vnbrhUwmQxDq/swWjJJnzvZnjFYU2GW6zai9l7iTUv8s8AEreTAznRSt
	JfgZ/dKRcsslKA+1ISybl8jAqPjUIThBDsNLFNEDcYHhlGpRsKmKEnccUlaMs/3WxYROuji6IK0
	xiovIMEopJMZROqNolRhVlkyHx+3y6E9+S2UJ+Kukkx0IucMFg2JIgxoD3O2xG5dCmrOtEQosVA
	GHxAT7iy20fS0t+MMmdoHFZm7mWkUFBe0dEmOAiooS0NocvwJ1VMkaOMovHxY49FMr0gf2uJhqU
	JH8H3VOCFXgCtF5tSg/w6dH+JBkKS3TV6ZLrsSQU98PqRZTEz/vN2K8sUUL2/LB38Q8XfhI1deg
	MyFd6dM6wLUGXbiP1SHdV4//ZbJN3unUPLzaT3uBBbDdgXuu7yrbJ3qULf1s8wYExQT35bA==
X-Received: by 2002:a05:693c:87cd:20b0:366:fbdb:2070 with SMTP id 5a478bee46e88-36a424de53amr17249113eec.34.1793632289698;
        Mon, 02 Nov 2026 07:11:29 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:20b0:366:fbdb:2070 with SMTP id 5a478bee46e88-36a424de53amr17249058eec.34.1793632289035;
        Mon, 02 Nov 2026 07:11:29 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm38816044eec.21.2026.11.02.07.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:11:28 -0800 (PST)
Message-ID: <a11e2565-3885-4476-b399-2f62c390b483@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 20:41:23 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
To: =?UTF-8?Q?Lukas_M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8a822 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=+m4bPbj4bahp+20XAXQLFw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpWDcApjDx3U_qUmb_gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX1YMIC2XBQhfr
 HVQPtJmHLpuHu7ONjK92PaJEI5CCgOd41gLIY4ZILz0HXeg+shx+FBBjQuFgS+UKEKDyBX45rOu
 Epw2sISjhrxPsQPg8C+XF3I0usE+lNkL4WBS8otywbuPRJ02FYVhz0bUXSk4mdKL6+YmquY7O7x
 sU1He+/GYx/CtrF2yDRKsyMBlQ90EQtW7a3jsw4KjAthZkCpx7a4tnAbZejD4yfvq/MashVpecY
 IwOS0rn9La67HnSjXhVY6Th5xqeFTaIXau7urV09MJoX2q1EM7qpJgvRIjpwdLeq0m5xlSmVVt2
 nRT3ktRZMCbw0sFJpod2xy5aiO1rzpClGLK9r6wnDG2oHxTpV4bVYlsy4mqMoUPfrf7J72Tv0a/
 wmNRfcWw/LouRHhinUioFpP3i9yeFRS1FUVA9hW7/LHr3/H+9ZDR8xh+mhX86AtOJp/P1RaSzuy
 VFVXADqmqwrPk071vBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXze0atPjtOreV
 TAUa3ytCI41JRGs1KaD3phJQYGbhSl/ClFPf6FYrk+I2+sXEpDiW4TtRWrTKfOYAcVvxMLUG0jx
 hYHO/XDVMmfAtE7IhKEZLBkRaWtw8bQ=
X-Proofpoint-ORIG-GUID: vPT4sPOsgN_Pq3ERBGHIzV9bN5oooqxB
X-Proofpoint-GUID: vPT4sPOsgN_Pq3ERBGHIzV9bN5oooqxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020060



On 11/2/2026 7:58 PM, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
> 
>  .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 255857cda9b..189dc3fe542 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
>  
> -/* GPU/GMU not fully functional yet on this platform. */
> -&gmu {
> -	status = "disabled";
> -};
> -
> -&gpu {
> -	status = "disabled";
> -};
> -
>  &i2c0 {
>  	clock-frequency = <400000>;
>  

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

