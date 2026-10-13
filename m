Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB5329E79
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895756; cv=none; b=t2v4Oc/MTzby+5mvsyagblEMGa3qxoZTpEf4cqtETTEg8oJGK1sXyrfyjYjEGJb6oIVd3U2Gi1u+xMUPRkRBoTVW24XFFNROk3acR2DtRtczt0esiAqSxKT07TWp9Be1ht6buSljdRvzwt2MvmzEOxSSzbN7mIMGgNX+0Bke/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895756; c=relaxed/simple;
	bh=Y2nhOCq3e5obtIKrWFEWNJ3Z3gLydgJkCSXS6s/8lrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj24BRTppuv6k8XM2UkrsvWfHSBzwI0AJFP7CYh/+9t1Oj8PEeCeTQVf1mqpHn9iaexBCzzWzeDEb5BopSAO/TVaE3XbcMeOM3e2fbi4KbTiAOG2u+2LPdei02VE9dJqQRgrEGjOIt7YeKpVrvRKCHRmRC/OQ/9MxcnuOJBW5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9SWrRSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOSXIIcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9SWrRSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOSXIIcp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HC4j3908182
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=; b=j9SWrRSfeCHX1JMO
	Z0ondfYsY+pNvVh1XN4AXYK60rGASjVkCkI2Y5/vDCgYzp2CF5HTRHbGy6ypINKP
	OSD28RaH8KtrutYeLdNlRmRzngfCH4FMBS09OSm4ZQFmBLAaCgMoL5qT3p9/F59S
	U1JElEXcRbTMDsm1e0jpNMjKN2pnDYuLVUXm0sjzuouA9l6xfULu71x8p/ltx7DL
	7pG6u2RpeRs38gJTCiOx2/2lgVyHqdyGVec7jkiDqctPrjuPu7nCqoD9iCb9kFdb
	ebtE5mMe1I3xCJV87plIz1m6aKAsQHXKkbjXFTcWj5Tck23idbOEVjvwQurg9v5+
	gMYdzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xquk7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5352eb4510cso4667931cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895754; x=1792500554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=;
        b=FOSXIIcpPCTA66CKqasA5/ViGfWv9o/t/6EsCWyXgv0qOU/vHWgMlOJZ2Zjr8UEXuH
         ooh0gBTSxJu6nS+wLXiaD9p4Ldf5SxkT04FSDuMaysT1bGIU8H6ketIVmZByo8YjPfTw
         hTR3Qgj1eIvkYKZ3lMMA7Nt4VH+T1F1Z/KvQhUdMNn7SSs2f0aw2Ns8BMbEm9Pif7cWL
         2HmzK4X/40qTToLzvsSWl4AjxyPzFS3dBQxVxQm7BYSr2GoHryr5huNutkKXIH6iVaUC
         6/yQCNcYmZ2iJ6LmvoL1OJsJQUbyLOmlPQKHmg/o4Sy94ZJ12kAZgtbZ0MGiVfOi+sSn
         lqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895754; x=1792500554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=;
        b=qB2CJEXhm3TIxjtaPvmeWqp00HVqTtiKIbYEE78Fkra7uXNWqATvogdYb7CrjIJgOc
         BvymCHMaYh3845KTAYatJbmQPFtqAxeZxcS+XaLIaFSYAoR21N2HDnWxdGHED7sUd0rU
         jI4Kp/qEIg5mvHRnWRCgJuuBjiXuv3uzuXeRP05wOLIjpsANWSvWgufQ1n5paU0c/fqA
         lC65PFPiRWvd7uD4xKAS02ln05/NeSgj9RWIr+dueQ8A5Fp4MSLqg3XGlFWD1m3djjhu
         AyubyaOC4ZIbe1whSq3bgsSr5oviW4TijotEeD/PdCkyUm8MFWcbZH1+HLX7ZoMSj436
         H9Jg==
X-Gm-Message-State: AFq9FYKS9bIDpvq2n5d1j9pK1C5D8n7bgtLX49GP3jNBILZ+jENYjRv4
	ghyiRkhvBLxLsPDt3tfgxl0nqUM6T83lLJXDYnqaOV511QB0Hihpb71fiYrl4ZdkfMvOXFVmM5X
	+W0ru+cSkLGxwHlt3n4ZvE4bFekRRxZmBAluV42mHsTEyCzNXGoYMeTxwvwoPox8zCu8H
X-Gm-Gg: AYBFou3cTxhdLhKR91tedPbGcEeQVm8uREi9/1k9f3LCWZGnZ56CGHjTohcl6VqT1JN
	z1h2tM+ZZhwe7s8z5IRAG4jlWJKXGz5q0kD29Odba2tTluu3LKNPUiAxf670j7XI4GewibyZpjA
	w/0GdRg1TNr0prfZITXJq94c7WyZ8EsG32X2RleWYPZrw0b6Ml8YBgXTjtPnIGp4+Ww/AtuVvS4
	AoQ55QrQ3LFcbuRmDQLBNITjjVeBNe62GtPrBMJqr0+LGTKn35qIa8p6BhqhUdcRfzejS7OzXZd
	4QGcQ3Bp7Rjyx4NsOF4gjuCYpyjWf9GMBk9mUnm7q3sx+CztfcvQ+GhWRMmWVPzSbv+ho1pc4ac
	u7Rni9VVueTjeCxZZIx6XDQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2434244685a.2.1791895753488;
        Tue, 13 Oct 2026 05:49:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2434219585a.2.1791895749845;
        Tue, 13 Oct 2026 05:49:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34722912a8sm272313266b.34.2026.10.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:49:08 -0700 (PDT)
Message-ID: <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfXwIbAbTANevB4
 X7Kh49zjNAM6VFbG89H/tVg4obncBfudZgwc2k8AguB/DzlCX1A3DTIlXBJaCOjurS2qyNQBZwW
 WVM1BR4ZX99gyT3uoOpHoeM2IUJBSoMsflinIHTflwCGr+Wg41h+ynjxGv/BswL9E0IajhyfaCn
 HM27Qq70oq2C/aBxbWTwgYJWNYhooM6S9ijZC27za+1scX27/P9gPc6Jb75/UyBg9X07UuX+889
 0YTAOazgGGIrNvSTk23l+/YdsnBZ/nfxEwkQ9PdJqnGQF3w9DNe3fVe6rq1RclTLS2ujG+xtArG
 HMOtoh2Fle6V7C56j3tI4LTJdY3wXGvfaCzq6mISE+PP8KMiPBfWsFaCNLyGToA1QNiqxwSMV9N
 5KpNJQkD+hA1sAKlgjgplu8E6blpTZd4lo9y9XPIMrcSGEWKhkao4igCt41BzzM7cjw2eMh96pU
 h9GGkSjivZLejmeux1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX1c2Ph8BNX+ev
 nyxIHkVHWSet//5bJNk/DThdcLI5CcYzfDUlriUtgVD1I59kuNIKt7xCAB+ywiNU/eewCsz3aFC
 MbHEralUW+AT2Kgq1DzVv/7YNPUyLzc=
X-Proofpoint-ORIG-GUID: 8hkv20XNZgZP7xva551C1-5ZK0x_qR3p
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace28ca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uzhSaxHqr0uYvXhH--oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8hkv20XNZgZP7xva551C1-5ZK0x_qR3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 12:35 PM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETE,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
> ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated always-on
> rail. Add a power-domains property referencing the cluster_pd domain to
> each of these nodes, so their power state is tied to the CPU cluster
> domain and the runtime PM core can power the domain on before the
> devices are accessed and let it be powered off otherwise.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
>  1 file changed, 567 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..d9313de53ee5 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>  		};
>  	};
>  
> +	ete-0 {
> +		compatible = "arm,embedded-trace-extension";

No power-domains for these too?

[...]

> +		tmc@1d029000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d029000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster_pd>;

Is there only being a single cluster_pd a mistake on kaanapali?

The CPUs have a different Aff1 value in the MPIDR register, so one
would think there's 2 (also according to the cpu-map)

Konrad
