Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8C353A7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395015; cv=none; b=KlGKp+5G9FpdvUAsg2Iu9LpRukRKPdFAevFfa2Ew5vBHm2EUZVEnivl5InjFLZJJHfpbcekp9musvEvxU4U4U6F6BUNS4cEsgqbOrnMAlGh1Gs/u618P3pK/QWDTKFB5hBlzTyy0/CCmtKWr9ozVVufJPnUQqWUd7Jbmp34dt5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395015; c=relaxed/simple;
	bh=G3NamduHy9LjRWPDnNrXLCYeu2wlpG74gsLOfOvCg6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bM9aY3LyqYrd5zMJ8IdFuWuHA/ZGtnarhQ1yHwcek/YoijSIjdXhAL8fBDmr9pZI/HN0u3G/3vwxE66FeeNziGaQo4jlW+5v6YVxao8iSJjW/ighmRyNPburyO+TEH5TBxFQLqIfTAPNb95xtYht39f73gZ4qKoRmMXOMWJd26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZqk5gYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TafEGr62; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZqk5gYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TafEGr62"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0ZGH1025903
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=; b=SZqk5gYk539fJVBk
	0iuYGl6Hah0hZ3CVAwTO9KhYpoX49iXXrnMm2wW4iT6NPO6iSMCyNyNsjzuVjHjn
	j4W/NA3LG5eZ7TFWuwasSDC+azfxjsvGPn9K5g1Z3nYPwjq6pKWT5atnNfuUf0vp
	zeBwSZI456Yohbi/a1wGm3Qg8UobzGXthbzxBfvenoyM/5uyP88wjVtnqN7OMFsH
	j9WpXyQYgBR+DN73f1V12vnHYbchsyWElwV6CLCd5G8RtxbDZnfxnMq6wkEMIgyn
	wQef/Crp4VsRXJoXRVMHy5yLJTJqfnAgFgQYzu29V8nDePW22+bgkOsc3BzQZWdT
	bvV8jQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5s930-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:10:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so71243e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395009; x=1789999809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=;
        b=TafEGr62lFhkUO7o2mANMLPP1KCUcRCWKbHmpgRDaXPx/q89SePv7xJRjDj1JOviQA
         KsWRnYCXXwf460xB/yyGcHBB4m4mrzsAszqBwjXu5HFFmpytCs2qKpnhxMgWfcMwVw9O
         +Hc2h6Rw9KnyjfTvnMMVXGeBdZDRLAxBbI+DGkzHrvgsuC9EujAo0KBvJWE12zVaDdx0
         4A9VvtzoEGaEiBb7e37UVUvK6nyNAfknAu3tv2/AeRKB3GG+84AJ+ZpDwZiex7R+tbrp
         RaPMC8O+FXH7UUHPeO206LU2S3cQRk+utg5qX9Ti0YGSfQoFR1w9o2NWcyd8AzqJAUGd
         zbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395009; x=1789999809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=;
        b=bomjVDHQDVy7OUfw7D7YOnwNo5zIAOLZ+j7UiDJOlKK6ypI5v/llZBhNcsqWNxYF+/
         EW8nI6Ya8784mo8NS9MLMAj/HRCXZ+KHHE0E5x6OSaPf9vRIMDFBfWnBHgvlDZwKWX2q
         Z7JQPvhGTK/t3Z7uGPTPF6NgjE9gEknY8Cx1ex3A0t+gf4dvpT6+0SNy+ZIwJjT6qH9u
         t/daXi89mhPrxoGyuP0H1BirZtgceeVgR5i6MfWHWv2evHZeY8sF/OCsiSee1271yV20
         Nbket+J97ej9m1MMPKJ+csZFrupUuYcR5Sn3EYqaXvRDW3e5J0WXUHfSjA7AEfZ032BW
         gQFg==
X-Gm-Message-State: AFuF++l2QlEZKLE3nD8OGzfRQFxjg6onMHegytdudUKMPx9dhKtEUjIY
	Or6z7K6X2REELeM5zaaAV7TIY1lfdcrxnGLpVmJrCPk7laVyrQl0h8NOxZmNhIfDjvV/alyPmF5
	YoLt6nYsg+9zV5s92iT/3ZJKazCg/I6BWIWCgqFc1YLNnzNqagKp7C2JRIPbHXCh7kjgW
X-Gm-Gg: AYBFou0GwE4gILfyEeAmRahEgNVN65wrIso6P/g12WJ3ugC04OK7iVUApCswgu0p41r
	4XzOTPuQV6xcblSFyrjDUq/C8KRmDes/rWOj4WubczPgDBY42ryEUR8EQkFyd0WHU2tScqwXTr2
	Ue4nebTDhFF4aHi1xQISuSaAGhI7rSzDeasu4wEyHSyqA0Z2cgZDejmHdChMKrM2s6kjrkhKPeu
	0SOpot358ZIryykaw/Txxq6qy0a+kFQwq5KfzHazmAnto8B38pi4DyVdkcmVMPdXfoQAsE2zZts
	+OVt6f8837YX1VqfZANHyaagV1zFULEhQEHONaJErsQA059ZJK1WfWfLe0O30KMJJYaPpAG0lwu
	DALJqKNDHg6E8n234xYYhXw==
X-Received: by 2002:a05:6122:6b8a:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c981880ad0mr550767e0c.0.1789395009242;
        Mon, 14 Sep 2026 07:10:09 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8a:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c981880ad0mr550685e0c.0.1789395008214;
        Mon, 14 Sep 2026 07:10:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5960c17sm4318072a12.27.2026.09.14.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:10:06 -0700 (PDT)
Message-ID: <1e303381-9f3f-481d-bd4b-9424942b5932@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 16:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes
 for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX81C5VB7l+4Xn
 dGteSzMOGuA1lqyOSZEvjr7GcblWRmKtnQd+UgIAh13izXIUmRJu6kqoOjYhoCu7dcjbYekefpi
 Ap71UTdUTBJJnLK/W1DsO0JFsGZ7pCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfXwKFiowSZzXDB
 +M2cBav/II68TU0VYFtYAIO5R9FRzwxQ0EyW3Sm5LJuB/UUq+7iINpR8hv6MV5ob/ejF8blzln3
 h0FaYOLE0fpqlfYmE0VUdEw2J5xIFLuWE7b1/72XWDlcUIoi9kTynQOzOGseF+56yYGGlRD6l2e
 F1hOtYy2OIXMQdQy3mMO/CTa6BjsrHVPMyUR+UP5I8cdSTiqP1TLLJQuiJycBszE6ZbUEXBToEs
 V5oXlMm7iBPeU1vVzPPGYMW1bdeInqzD+ptfy5ziJxh3DjtuYOuRg3YjfjEN2qS1Ci8RDb39YNC
 IhUrhHHjaT4U7pJrTze+gavKVzev1/1r5i6ugSALymKxHHQtO34gX64EkTyIIVYE07gBONiQ3Vn
 DetF+86r8hckXAXn5HBJt3gpUP176Oa8PiOv8SW8XNmT3Ww8dmLHT0MD+8ab/p+ggS3T7c/1x9s
 s5bqXzvOuLjGt5eta5g==
X-Proofpoint-GUID: LnERlswCEVXBQYpgehs3bCtNdOg_jQ-S
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa80042 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TmAJPP8FuOU3jFEyuIoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: LnERlswCEVXBQYpgehs3bCtNdOg_jQ-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140203

On 9/7/26 12:07 PM, Nihal Kumar Gupta wrote:
> Glymur shares the same IP as X1E80100, with three CSIPHYs that use
> the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
> on Glymur.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
> +	csiphy_mxa_opp_table: opp-table-mxa {

Nodes without a unit address should be sorted alphabetically

[...]

> +		camss: isp@acb6000 {

This needs to be sorted based on the address (it currently seems
sorted, but is off by a zero)

[...]

> +		csiphy0: phy@ace4000 {
> +			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
> +			reg = <0x0 0x0ace4000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;

nit: please move operating-points-v2 to before status

otherwise

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16

Konrad
