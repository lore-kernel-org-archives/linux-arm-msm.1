Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B02331EC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377279; cv=none; b=k/dlUBgA1qmWo7TXeXQDQbFSQ2O/gzVsa7WIg/b0d9y/FZNxyjSupYnw476Lwp6zjLyOmR/R8stuH2P92XLmLj2D6xgLE+BMztNQ1ZY2h4BPNQ86+1FZMhDNPArIR1sq0L/aJ1Ub8MGGqu2rYtV+o4pTgLuWY+LDVGcG8WSOA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377279; c=relaxed/simple;
	bh=5UMPd77YYaMzlyCdkt2wpYn7O9XfHpcJHpQhBTQ53Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/fLqLDaVcvIXtQY128AT5n/bTrh5dK24H8VKsU9VPWJ9nlRMwV1fzIdMsbGOTw6nMutZFnMcZ8nyu4XfN3ukofSD0MMs67G6dZgJ2hKmwOIRhJGaGFGUjTjpwEWsdJbbbXdyX5KHHPil3Jmu89cpVbbuZ/pSosaZo4Jj60elhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M19LdAge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJ/nPFVY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M19LdAge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJ/nPFVY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2O33902237
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apiWvG/cVrKbyxPjcX7GS2bKLCGReZfKKJQBHctENrg=; b=M19LdAgePLsZdUaK
	opzsXgh4h+5ZMcsGZ7O4Bt4OVn3Ka4VZpUPBxdarzu35WQ+fp0aNzNPNOqs4ljwe
	vulXr9ttHkE8R6eDV6XqqVMqPnI7xnX03dX6wm7fVg+GmrgcBsVyy0DLsSLSZkT9
	/2mB3AnxuBh5psVifZHwnZXfEm17wSd2sGLmMCZziuxq9X8iDDwFtbuypi82oPHh
	i0A3VHjNuhev/PrDd3xvmd38ZbpxhEw95EFauqiPy5yau+kcvbf6k7LeZqbMNZrU
	OM+ER/NouQW19n93wQIGFprUNEENpZ3J7HBttUb5GF0MycyH0pO+Sf1iFiMTSc+o
	o78QzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5vqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:14:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so50502685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789377276; x=1789982076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apiWvG/cVrKbyxPjcX7GS2bKLCGReZfKKJQBHctENrg=;
        b=bJ/nPFVYkYx5dC3X3G/HWuBLYNFLI4fTWsV1bQiJLKIr/SvdpOUfm8c8X6Z6zBVXfc
         t7ff2G8yE3ybHiO/8bMK533kyKnY7UHOGTxorQmqQCWX5lvKsLuvX6BSPCqv6YEDjkl6
         Midit+DdmkOV4iSahNHZD9WKGv6JPP5CuxjCDwQ82t46GvWme9w9ZcZy2H/C63BAhAUI
         VV4JwrfwCuCMs39Q5SOnrMafDLJQqc/sR/3VwZcV0lXrsl6nWWS+ZXlXyTZjTKMROR3p
         pYl8LZxRKdnrR2C3D6X70L3nWW8JjJK+jPrNFOnPmC4zgEEDqwrVdaOAvnBKX1Au5Am6
         0BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377276; x=1789982076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apiWvG/cVrKbyxPjcX7GS2bKLCGReZfKKJQBHctENrg=;
        b=kgvxHm5cCWeZjJeStN3SI2RB8dLooQtHK+FswjekG0V+UwmEbvb9tfWR43BdSeHIyl
         SW5YSB6GQEtbhCMhVBLw6afQS9MTfxlrp0rzbu5c0u7YL3DU6popO2dnyq/1tkOE1N0D
         td+xMnGzCsk3fHX5aQGqATNMQjgCC8trzxPA2PbT3fwJnj62+ZkA1POQyUHH3mNdq4M+
         aOpr8Adci+aZI40L7H/W5X6mh6InOZT+rKuKtImz/OnAvl0D4Wky/PQT4enH8L+Cz8AK
         LGI6SXSrdzeTXU8APqrZLGAPPFRf75q93E5rCAoAvTLBElQhFkqYXOF1yKNJs5eqSIYC
         W1iQ==
X-Gm-Message-State: AFuF++kxtYjhY4VQp7EPBMrVLFdcyK+oa2uMLGBvLBbImY7oQiduhhf3
	B7OkkKHQRggdHTy7KxKkVr702YVMrcEmutbgO76C3kX4DjMscO8TlH5KAYmiqK0wZq10BFOPYoh
	oCvUspSiwQ67cN9ZbtZPr9510K+nAwuDVC3uyy5ZIHIwletQvXfWcZV1Looz4NxkQiCK0
X-Gm-Gg: AYBFou07MYz7kb7jCsyKMr+XZlsiuQiQN28BDl9H2hVEh4uCHPgWhVGLrgBnoVmUSJK
	x28XRDaJC4od3dG8ImGUU8Iy6AJU0ghBAE4RCon0Megn73wR3fapXqXSWicdE0WxISgKuB6pVh2
	Gz9KTfFrMqjBAMjVrbsVfO7T8ZzG1ffLXmrmr1IdVslyBnX4TEqc3s/vUEJh6bOii3jEFYi0DOO
	i3omnSRbo2m3vr3d28/7LzDjfu5edYlnG0Z7lBGljH2r+TmvbIZttRk1uxTgbGT3miCBwTs8VQs
	6u72hiSEMvdysF/ws9ZgYF8+Mf8qYedlPEHdotNUoaKVW7KowVIrK+VFWt6TR7/iJjnHD1puG3g
	w4MLZFPotnZCBrpytJ+jtIQ==
X-Received: by 2002:a05:620a:8394:b0:939:eb09:4458 with SMTP id af79cd13be357-93a29bad63cmr164414285a.3.1789377276428;
        Mon, 14 Sep 2026 02:14:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:939:eb09:4458 with SMTP id af79cd13be357-93a29bad63cmr164409485a.3.1789377275991;
        Mon, 14 Sep 2026 02:14:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5960c17sm3831428a12.27.2026.09.14.02.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:14:35 -0700 (PDT)
Message-ID: <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfX7Pf7gMtr7vd+
 2wJkUNnlwpukfZE38YqS7dur5hu0dQnPaSd2q6NT6yjow2lDtp/DRWsMr/WWVR47LODbm/MPz3L
 H1sCldk5sRC5C/e0E3Gr0KpfKICNo3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfXziFLUTyO3NE+
 wXr3tksw7U6gCMoQvD+H/GAowRd7IpeMyHCuEGh8Lw2WWW4cViVTCqFaQGgvqOVu1xPb4hMaNkK
 lf6ac4tJpzA34H8/bqAe9t/SNaVbONR/4rsltJtIIGhcHcWqsRXkk0PaWsWGRXDyqTnAb0nyWd5
 b+6ft2Zg95p6RY1wGqYyAG0WAK9VHLQekl2/UAJvjL1fTo62Q52ylIuQ6X5FqyHCYbSYPev92o8
 hyZ12DCtWDFgguuqbAYkU9z2Xp/FQ8NQXbOSMzGdBQkU20eyTfVohHaG0RiK1s+ll/qq0iygTYj
 2abspNKCrDJAK4mVeiJo8SbxzOD/0TGu96S4bG5GixX0SNwRKSrXfQURpWlt5Ul3RXhPHigSDUZ
 3w6TdkKLTtVaJONocxIJkrmZgXdPoIHnSXDgfyrFWDpDktzwf1f+rH6Rk+t0sO2cz7UNndFVjgX
 Qtgyli4Vf9mZ0cfBo6g==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7bafd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IZYJNoHwoc_Ow-rSWkcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: msvee958xO8MY9LI6A1vqktwMwUkAoUc
X-Proofpoint-GUID: msvee958xO8MY9LI6A1vqktwMwUkAoUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140131

On 9/11/26 6:47 PM, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> index 17d8ff3aed23..b6e384024dff 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
> @@ -697,3 +697,21 @@ bluetooth {
>  		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>  	};
>  };
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {

Please keep the label references sorted alphabetically

Konrad

> +	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_e0_2p4>;
> +	vcc-max-microamp = <1200000>;
> +	vccq-supply = <&vreg_l12b_e0_1p14>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> 
