Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54422399011
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857109; cv=none; b=A8QrAr/VcghpLCVQcgY292wSpJjPwsZZfjXEuZ0QxCe6sTUv3AuDmu5ZBrpBodN8+L7rn20lFX6Tov/WQqIslh536dFHGibJe89spcwWXduHzyl8rljM/AgYjsZjPCbdqfheUL0EY42V/A7tOeuvRfMsjvnMOcjWncxpyaAMVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857109; c=relaxed/simple;
	bh=rqQzBkXLE1s3C9fDauqcJQsG/1ffI62DmHui3HpO/0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tePONtW0cbaHEQ2zzbu14+7OFxeNjieTyalTmyxqc/V8oXgjoBbV3hILlzuW+TiozYswcP18RIXhZeFNplkSvwVk/2jz37g5+mjBxGeoKH4scZiNh1wvjuS72iFApmmQBFePR2wikk5dmI6nWc1xCgpGm/GFD0Ye9SlXV2d2KAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqLGz+Tw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYaBKazs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqLGz+Tw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYaBKazs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6888cDGt2380656
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=; b=kqLGz+TwQMzOjLKa
	ulg1wd0+6WRqw9I2yLN8Cx/GeMqcY/unL0U6eYe2ge1X6HySWplgTgqYlJen88Cj
	5Qpyf1T/b05cs+mFFPAJleKMR7/U5DJ3j4onKe1y6Xq5FNgcpUljlSUY8m+afler
	MUu3mqv7IbG9nD8mC3OtFBOs7LAGkXStthIwcqMpGr1WIq4+LSv/onKlo4HAyqlV
	nw6LLt1FLilemW3Jaggw5+lvdqaMEMFCcymOtXbBUMvJF8FBaHEOwGfKHBBlbDaU
	+DCZJ6LVztiGZtho6HCkVvLnFESIMwik/5+ZFcGcQ2gCyBuugY3z7hVV6bds3MEL
	wCmL2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1cg0wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:45:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53088a3939aso28501291cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788857106; x=1789461906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=;
        b=IYaBKazsibwSYAdAvUmKzD1Sfsh581Ws7v7L49K7cpX5Tq4qdVYBCO5c7VVrU5JiE0
         UWJ8x7hq/2oiL0jI89hfs+jqt9o0zpYGU4lPuc5oG4SoVzrpxXkjmsJO9AHjVpltJ0ZZ
         AWHoPEiLsX8ykOIcO4FDCRBQdsOM1dKIRWH3E1PLGdiam0oatpWWuBKcFLLiS4yeOBzO
         9i+ESEinhdnLgFlPr2jneydGvsyiSCIUGsOhxy58ZyJHTx9lBg7VFASa4KEqD9d0QNyF
         aOK402pZmzoYa5JDlyj+RxlxpKRgKofOAkl6Qdjx6Kl5YZSfhB/wflP5e68VM3gqvLlI
         IRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857106; x=1789461906;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=;
        b=NuFvwSKssl1NFv+eZP2XB9CjDaWGb7W8IHSC4CIkA6W+UA59TD1UPRkIBKF/EvFM2a
         g3GwzK8ZActiDR3m+NIYvMdtWFz/5MnSVlmaNNc94DVyh4rCOtEUMjorD3WlmT+MRXYi
         FZvaOY1FOo3aCv98gaCS9MizqVKZugtdoOutBp2hygDTMRCksHElZo6DGk9DtpHkIS2j
         7NvxTdZuA/9if4LW14vhOiL1GOUYuE7gLYX/DiQBeNJjDPFSk9288zAtZui7aSxM6aWl
         pn3XlBY54pw/AtiJWegA8ckSBxvuLtZNuaJD7U1BtuFykn632PS+3ajveTYp9lev01Qz
         vmJQ==
X-Gm-Message-State: AFuF++ljMJrWG5tEDA7727uSgxgz5RVU9T1qLMETgg0BJ9X0hAJAc0vx
	liKQkzsLeiEinJPhppH/htIJCFeeaslE4/NQJq30lHlA9R2xeV2E8qjydjtXy74AcKe473cskHd
	0Oom+c1JjEJx8ufiAL4KFllT/KKett3qmkGGhvnW93HtwRAohKhdS/o0PHyaS4+U+5pk8
X-Gm-Gg: AYBFou1xQGmjaG8xa1Sz1DSkR3XKvpsuAdb06KSb/EzcmgzsIY2h3bCGT9KgR0GKpaH
	aWkb/h2UgxasO29PzBeh361LUbtxKOD131y+n208NNwH4aDmOenw5tR0DAYz0QCpKPmPUJGn4xC
	ny23hn4CEZtDzXCHKJLwGwwHGFiNGSvIuyPXQLHUB/6NNAj762gQTYfFhTyaMpF0TiQb9wWWBVu
	xL5TWz3xIwQh6lxM6xuPKCH4L/riYjAaJjdu5Al2yXtVG3n+XySgYFAXZY/iedibV07BkiCJ9On
	SU5DgrVrBPgiUfa6K0vu6RqcFfh5V+sm7/mfZWs0KU6SYuYTv/Z6sJduhmQ9+K7tdd1v/6pvwPZ
	a48B5Z5U9K7ImoMqJYmVwGhrhbDei/DedZwS1mTC98bJkc2zGjxWKLC6RYvgXdco=
X-Received: by 2002:a05:622a:1f0d:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530549ce605mr345337421cf.34.1788857106002;
        Tue, 08 Sep 2026 01:45:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530549ce605mr345336831cf.34.1788857105476;
        Tue, 08 Sep 2026 01:45:05 -0700 (PDT)
Received: from [10.38.244.120] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm107174381cf.11.2026.09.08.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:45:04 -0700 (PDT)
Message-ID: <82b7c6f2-a45a-44b5-919e-ea448a3387f6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:44:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/13] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6a9fcb12 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=72T5t8mROkFztkF13RwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: StDcdE_AR6LDNQJHQAAxb37qaaSn17Fg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MSBTYWx0ZWRfX2pjmVs5ayvLn
 pnKkb78QHKi1Ta7gbw1FuvQEUkyjkrkztN6dOBXztgyAYhdQ51Yk3l2g9HNTkv4zHOq3rtoLnAa
 M9sM4m9uzQRsHkqh7mHus8sNze3kNZ8=
X-Proofpoint-GUID: StDcdE_AR6LDNQJHQAAxb37qaaSn17Fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MSBTYWx0ZWRfX4o+8j7bpYiOv
 JZbZoiLWWugkB5i1D98/MonQaWC3NICMpdUt1o7tcOo9JW78sZdZRqlnuco3/pOEwuyCIvHHNpV
 ITrd3ulixp1z7ul1GYasnOuvhgQry651sBZPNJPgYZ88VZmc06fcdmm3YI0aDLY46ynQ7Qiyuls
 AeNmpQXFnwwmkTGNWkcJVudOIoTIAbD83PehmogPNWPE3mahBQSYBV01ipDJ9CMpVTMSelguIjq
 p0Leaxls0mFsQunEDrlFnjIwUEg4gqZ/yq/kQwhym96gDRkBNzGKmLpHBDoxrpXlH+2DuZW+dBa
 YBtlo10rWYbmCmCXpCN8Y4pKQLWdXSHal21l6F1QFw9zmydMHAixjGDbYOYZt9EB2tT3aG9Zndi
 G9xXX7nuFPGcr6UX6oEg4LcgHhOJnI7m83V5FZJvOUc1XlgYiBGfHWZwinDyPStUhhA/YWaB0/U
 GpdYI4TDzf2LtUkTFYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080091



On 9/6/2026 10:20 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4ba751a65142b..9a8d6f020a391 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>   #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

Hi Bryan,

The latest code already includes this change, so please drop it in the 
next version.

Thanks,
Wenmeng
