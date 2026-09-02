Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D04A8429
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364217; cv=none; b=SRpzl424Xm6NcEeJGsx83NflLIjJhjaYDuYFuRPwH0AlxHsl6RohpgxBmdxwP8gxTdIn5CVwWddvXtOxR3BvQK/NH9+V6RmFtf7+5PbOlFwnJSLsuYW07isWhnHJeIZ+1Ot0qye5cp4OHnxLTYdZ2HDQMBZW4EsAI/cGiJAoILI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364217; c=relaxed/simple;
	bh=zSyQRSX/ch71m5kpxscJdEN70k7ztZ1cUr6oUxNbrTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4hDF4cV7d2qfSeEgxPzMoP/9CKjqDLNA1R6T5FQ7F6FGDLIevE1sXW0uPE900DvpYjBJQMyF0QC7ySloR4vKKzQ4cL4HE2f/4dwt69pJ5UtzphofOX4oOGgezjUy3SpOujdW0AETAv7LefGiTlj5ZvAIDwtAztuEfv4DX1PVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghB5WyEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZ2dd1eq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghB5WyEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZ2dd1eq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZgrY1409650
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=; b=ghB5WyEbrgwoWyVW
	gnV8u9oMY9eXCGCAhl8yU7grN+3/nO/HcKf6hDOgG+N5tyLZ3mdd2ukesqiLet6M
	QWR8S7W9bBwFwkMJ4UA1cV99YUbLVXjDVcsbJx1555+J0louMojpIrkNAUjzxxfv
	y5KZULp6Ln1czahpc1RL1daLRFSdkvZVClgYPNJ7nhW/9wl459YaKzcjtU25Hbwj
	5sohs7qWHsqwux53Dy/eSbId5GMnixJ+YkbLjWCkgDjzcBGDblZl+jXUGRETZG3H
	s+NLO4URGrKxlMzPFdlmC1UDz/LxVxn/2Nbj6NXwuj31T74GMfpOkGKX0yLlGW2k
	1oI1tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce8p0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:50:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso28720985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364213; x=1788969013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=;
        b=dZ2dd1eq+jJxJfislKi4fVUPLYuc4lN81UAAmZ+TrFd0Lz7HMHfBPlkKmCTgd1Kk97
         LSHOtpXmjbM8Ke7sK+gHijqplr+72WqbTX07dWFgyG+K11eEEj1bPVq3MF1ogJhE55bE
         6u8JhsaU8UL+A0hYl9LrF2hWdq7SjJ308CeLjvqUVnCV/WQDM7ujwSutzIKJz7dd7k0k
         zn0DXnZgLZIv7Y0HTrvLihFeTDP9kqdKbj/+A4Y+oD4TTwrTDGNyAglFlG3c4aoKa2ec
         6pn4Sica65by0hMpuPlYq0tWB4+r96s6DnjMll7Es3W5rWv26ZM8oLqs7yoSl1OWK7VQ
         m8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364213; x=1788969013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=;
        b=W+yc7Xz/VbVYPNNTa7Avu+Qt5tcOlmznEzshcacbJvOFzzjl3fTw507j+V949hzD8k
         D4BdU/1J2rj2s8adyd2j7BoHh7aNcfXbozOeV2+YDy/bp6L/hfL2+o4E7q3GlDmrsFnj
         Lp+a8JVfHEDbEXz1OByDsfB5jp7n4CacG0V6fO7gY4U/hsWSA9u+zu9SP/Ge0lVrDUDl
         oMCXaTGdXr/a8xrWcbssptoHLCuBIh/1KTdDnK98Uqz5xcV16dqsgZYTWwnPkH9Pz6oF
         GgqdVmNFNYw6QQ0jtAqIbsa4Ts702QTlt6LsZZtpH+cbNykIjui1EY1sl5jRPRFn56Zv
         GjYw==
X-Gm-Message-State: AFuF++lFDNwNqFxBmyh+G/x/ynF7JFXI+v/IeN0TEmCMsXJ1Tel5hpoI
	dX7gmqiFb4FIphDUgNKRSeppUwkpO55cUDtH3Ro0GpVFLO0bfDTJOcoqzOrkbyhRwHr9Ds9dfRP
	52unAipi4xBF2bwQgKSXU+pXw5ZatUvYDKJEc0kvazq5APCqzDoVsHRpFWnrJpK1Xmz1I
X-Gm-Gg: AR+sD13AXiUdnKfiSJIKOZbc0xbj7qGXYjDyl8zy0epI4wmWRvY9cW+Pvk+/gyv9dxh
	SyC8/M+pkqk4MjbLBI8lrGAYsfpmziLdzxeO3ODkG1RgueWYwOd/5uXqsc9xsyP/EXRYeuz7hSE
	Mi9VXMDUHI2DpHx0bIKJPZDBmf5bMjcfDme3nhw2VGPffc5hfjOuav5Z/yPd8U4uPii/feN4TXw
	fJzK6cfZtJGnJFprXQ6T+eInTzWbOx6AQ613pBNFlXN44/r50ByQ5OGUuV3kQAg1MHIeISbPe/l
	kMQtLu6zln97w4kQzIUTKWvjF5DTSRq0TOtyHNWd8bFi23tizBTbIwobD3/4H6yS9B8lmNXPNai
	Vo0R5MIq7fY9CfqLVdM8Zzw==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr431906285a.2.1788364212847;
        Wed, 02 Sep 2026 08:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr431885285a.2.1788364211128;
        Wed, 02 Sep 2026 08:50:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm1336976a12.13.2026.09.02.08.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:50:10 -0700 (PDT)
Message-ID: <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:50:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the EC
 reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzOSBTYWx0ZWRfXyuansCDiURpQ
 BvJWhbxYFIcjYc5sc7G9X5Ja6Ky8VOkc9J81FMBzalRiX/VQGx07AT8SWLkcMZBO9z32l9sSlJB
 GJr3mltZd65Fq7T4OmEpQ3tEB0j1h3tqHv8L+6KR2Xp124fVX0tY/ztEM/YRnoHmwXLv0QsecpF
 d4AkK4KyoCtgsi9tvohS1V1SicaF6ISLHHhHy6Bum/Rzz0fjScg9x6OJsv3DnIOBkkafZabAvTO
 EC0v/C9DxVcP5D5IZ94JV8YxCPtykFTNBAeM6vcWhN/myoWfUmASePCY5XdI6B9MM1BsjFs1rSI
 KXaorIa9rv7+3e5VxTFe3WiRG4ClvuwShaFX/d/9B06CUOcaMzf1IMCTtOXwSWYtLbIIlY221Yw
 PHLg6tEWD1B2stc15tvWc+LiW3vWksVV3YV5yeru6TZ/7SfwPZRmkYyhH3muyePdRHQWb16+B6R
 WvISyAmN+3nDaqfxIJA==
X-Proofpoint-ORIG-GUID: pWa2ehOoVpA-4OH5biv-SL549M8310fL
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a9845b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Wad5cFZijfJPr_ZhbakA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: pWa2ehOoVpA-4OH5biv-SL549M8310fL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzOSBTYWx0ZWRfX4zLM24/CGl2u
 yDEhHQM0g7GTDJXkQbn4JnNiI6DxXh7wxJFSEQJxMT+53Z0+5OCHUQ/b1eQKbkpGC54qw+gNj1J
 mYsIXHjWCIQQqFr9HbiZcDQUnL8BbyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020139

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 13d0f09e0c2a..bc684c295b89 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */
>  			       <238 1>; /* UFS Reset */

On this device, GPIO_65 is an enable pin for the touchpad regulator
(or something else that is a pre-requisite of the touchpad working)

Konrad
