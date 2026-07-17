Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2FD34B1A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784263817; cv=none; b=aJqjKJ2O5NdnpPLzl7LIFpQWgeWMVRABk4bRfWD6KaTNgshipFRYxmAIjHirWLeauw0m+W8x8kiLdHun2ScvOGEEN4XsAII5r3oaL5DBjFfG/h4lBgVgJcnRcgjWFOIfwN7HXfihilveKFsMEkTkzWHOdPS8/Bx7dCJ1Z43euMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784263817; c=relaxed/simple;
	bh=wegNo8nVQQHvJX2jvTfyunU2PslvpToIjVqkca5C45c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEldUs6d39ELoBi6073bUZgBNNVT1rruZ11gOl3nrujikpO0TLRHMEnlmGTfH5jOK0jU/l84ECnsLz7pywY2moG5yD1ZCtljYLY74K1CYutjHLDOX1i6VXYj3Q+Ri3DdA8JVG8RhIJwZgH7x642ARU6mhAAxSWDTYxJjjW5pt/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJeouIH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUfSnsZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJeouIH6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUfSnsZV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33uqE496423
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pS3hGNdU3fs5am1KSoTDnSdOUbpCQRoLxtrURiIei5E=; b=MJeouIH63+2BbAMa
	PoU1abc7u2+QA+fNvfYM7GSLQyGPBOZL24El5Pvd5NY2BXTZYRLFgmJsMo1Mbryk
	8o4aLC09ayGSB4ELB/biiJtkt9hUH+DRnXuO7KU1ttI+A4XaG+d1vxvRVKpNNNKv
	8jVwl7UbRtJl/mKttHqjtdEOyYbyeC7t1TvytavPXcaZdBcI8cAAwo/g/0WxmnUu
	Zsg+egrp75GeMd4rNeyZqXoqbP57tQGt7BhcpuB4coGNz8sdP0kPRlYaZwK35Zga
	cpzc2ZJwRHNIBd75b8bbi0hF4n+Dgls2s/L8e9CFyezxDmuc+RWNaTKCj74EpvZ6
	/Vm0Ow==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex4mh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:50:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca124bf0189so732825a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 21:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784263814; x=1784868614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pS3hGNdU3fs5am1KSoTDnSdOUbpCQRoLxtrURiIei5E=;
        b=HUfSnsZV9F6xDxNFWZI4KwsIPVI5/d+lHfdpvx38vQfaheasQ++BX2sTewvvLpmlLV
         aLBhRjKLThcE07n8/kddXctALmg0CrsopE+zbvZHOmK2UARtzaPlLohC5Ld2yPZjPKtd
         PF6OuVRtSJBzkagPgBr6eAtaTG4F6qUtPu58/CAxAbhVTufMQFXFjK+O0koR5dJFL2dr
         FFDay5tXBoeQcZH7bdSEtCFj7ZjmbTLpF1AZEzb75ZXGaP+Fb135S1k3lREsc2uUZOny
         xNTACmEHBHR5b/u3/NWqTFKTepD6bzHISpP4AxvwayvUS4FdesYpgbhsgYmiKU4cD+ML
         qnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784263814; x=1784868614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pS3hGNdU3fs5am1KSoTDnSdOUbpCQRoLxtrURiIei5E=;
        b=NkegzkQzuuXFshJz27wbcLuNsO6CKDSf2fQCCxQPEHIwxd7vltd+IihPa8x3fjWwl3
         uvwA7LR+4ihMVEx/WBI7rbdW2tjTsRfwB1p7UEg6+ZQ4TD1ntRsDzwac3nrZks7pQ1dC
         +6fJXOE1Xryv7sHV96oIC58GktBK6nle6Xx91DENZbgAUipukii2YHwn715rVDDO7Eu4
         tp/srzAoX1/Qd+k0kljxBIuFY4ywliW+W+UYdW9Qjyc1EXm+BMFvGB34EKodPBXcW5Vh
         9Nhk0y6sz7xWKDQXMQlB4oBXMSLr8NeohWx0khmCZ+biChf1lzCLHaBC9QA5z+k3enkH
         E7OQ==
X-Gm-Message-State: AOJu0YwZfp9mvJwFY0kXL4utmmKfcZenv4WLobGHkJINedBkCHrs7hnV
	rm/YP1KAuisOV71zqQSSBY9XC03M2LrkdGF0UFMskCgH1dqS6ElYPrH5aa59TBvfXypSDvmPYh6
	24e6rZXzIMLXrQlwuc6hY1KgRixU61MqBdliWbcYfmsGjvCusWX9zsqgWt25n10Jgd0lv
X-Gm-Gg: AfdE7ckOwvrqnR3ViLk2jwPjw5lJxfxEDMbzdxtGqX7r7ykt12GwNrf8y5uXafbf3kW
	EIiIbNPFiG7HLSENxeFtXfeF6qREDAJt+7xUacKL7Fj3E+wXLDnNtokvgfpRg5E5jNYq7dc5O0J
	OQPHDEv/JSLZAp8W657DIzUePBpvh99tqx44tT1rWbM4izREsmimJoj8Ac770+TPFauXUG8g806
	UYgUuCcD5zq+9SemN9iKvl5VrnZvodu6vAQs/8nX8FUXBzIjNjTGq1lHpLymC+bYpBtMvSCUFBn
	/WHQpSG2DstGb58XAO6pV3fbMoE+UDulqt3QE6F4i2XpFSqFtwM/h3aitWRmQ/21kAPidN47v4K
	7vO+JjIOqqu2MV19IiT5v3bW1810Z4ruUD8KHBKo=
X-Received: by 2002:a05:6a20:da08:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c38db3187cmr5683890637.22.1784263814030;
        Thu, 16 Jul 2026 21:50:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:da08:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c38db3187cmr5683864637.22.1784263813529;
        Thu, 16 Jul 2026 21:50:13 -0700 (PDT)
Received: from [192.168.1.16] ([27.34.253.228])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm1090614c88.8.2026.07.16.21.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:50:13 -0700 (PDT)
Message-ID: <1498c6f4-e23a-403e-b5c2-883c0ef5a671@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:20:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: smb2370: Disable SMB2370_2 by
 default
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
 <20260716-topic-smb2370_port2-v1-1-83d02b2ba4b0@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260716-topic-smb2370_port2-v1-1-83d02b2ba4b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a59b487 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=EFAlAs44/J+PPaf1aCL80Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BB0AK1rG8zphIdw4350A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZYO9uePOt61Ox5vA22EO-ymFDHhjsNIK
X-Proofpoint-GUID: ZYO9uePOt61Ox5vA22EO-ymFDHhjsNIK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0NCBTYWx0ZWRfX5So7qOP+QV+A
 GVeJNA46zp6es40pYEkyU2m9mjnLVff7AG3EQ4LgUCTUy/WIOkteDmuP3E+swFZb4B6SYGOCug8
 vS7OqqdGb8THVXrzJggekW1pfJPOonM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0NCBTYWx0ZWRfX5ptJzNqJEwAa
 SoIFjyD1nkMyO2jZ+DlBUEJUiJsEJ/MFNxGLT6X9yv4n77IP1xEedo5MoPEfhLef4vy0+1RF3bb
 ha2jO7o2a0pjKkxBht15TYRSzWXGmnAZrYKQG5Ur+BpOqliWL+KAOqB8RrB5OCzddV1B6fk/Wju
 iCRqOTd2AeO3/dvMOq9uY/utUunkZJHrjEAx3cVclC4oHTKnlFHmb8/dYnoGSMRiaJhi8pCP6BS
 OtzdzrwVs7DCJ/mSdTISlhpnV2kS7Dtq/qoKFPKG7P1F3WXQUk7vRLa7ieqKvKiaoP+EZOdpuDP
 PyR4m4U3RKbklda0zRggwD/aEtILVbu8q/gcyT/DzREtrF6+VvTDySmimKMDCJ8ORkXPtzbe1Vp
 LEfqbIXaiGKtJvypq2IGti1ABqRXLsk+31sIdLMq1OI5H7/4AzKzsqAHIE/o/7Lb1FXZfJddrna
 ldKnWJFLRq+NMI7nb5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170044



On 7/16/2026 11:03 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's absent on laptops that only have 2 type-C ports (the majority so
> far, including the CRD). Keep it disabled by default, following
> established practice from the previous generation.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 80f3fdae5705..1e02578e4ee3 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -36,6 +36,8 @@ smb2370_l_e2: pmic@b {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		status = "disabled";
> +
>   		smb2370_l_e2_eusb2_repeater: phy@fd00 {
>   			compatible = "qcom,smb2370-eusb2-repeater";
>   			reg = <0xfd00>;
> 
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
