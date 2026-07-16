Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDA37E5D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219102; cv=none; b=juolEYFh6YqEdEs1A0wz+yptfrYKSCJEXQft/h9TT+hob8xDuQXsGExJpL47Hd0VCPM/e5hoyz6CzshAu5n2QLJXkaKalNZNip1tmiBohy87rP2OI+4rtlr7W4K/LdncplcXgyDx1QNC2Au9ewLJbvYEnDYkHEEjRROnRCyR/nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219102; c=relaxed/simple;
	bh=d7dCxcL9JhaAlC63R8HLdTyMTbOhxi2OCb2JNOhGkdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl6Zx/l07+gpGYN79IUOL713JcsOeTBh/TLQwMAK6eg7R4+eQPkO6g93/YftMNSEw7pCXwIgHa5tUXsQR0cKd7NOpd1KhtRTlloFccfNuDnBi9+OaO9QmJhgXNW3yaGycknxrdoYX8mBff4BbBzIXs3uOW6rx3a4NZP5LWDa0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRGrwnk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flBsFKBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRGrwnk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flBsFKBW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJi0N2691725
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njruQ2oiekgsshQb81UK5X7MsN2R6Ye806z1jkXH6YE=; b=BRGrwnk/PPA6Rqga
	OOT+q2XVm78XVEubKT0wz/tArJilH+0ZcKuepMhqcXvbWccVYhU95vRuF522g75D
	mSDs7fwPgxzozjSgSaxMpZD5QRaxDwjqVBsva0cq9J45KMczih33R1Ezu0NHQJw+
	lI+JwXvhSp7y9FXtSA89acT5fQ8lfl/aGqAL43b6z+rEX/4HkyzqvAMu52S3X1Q6
	gT9ag0c9QPjfVHq4lXPWVwEyajSc3EiHFoKhHfq4fCN5BNjBoenrocpp4NrsjOgj
	ca04MdSKYiJsXnoiw5TkommLDueEmRmD2Mi1P/IMPhSVq+kdOtpklDHW1Qr2+LuT
	TsuGEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7tfkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:24:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so16672911cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219097; x=1784823897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njruQ2oiekgsshQb81UK5X7MsN2R6Ye806z1jkXH6YE=;
        b=flBsFKBWju12y7rPO7pqnhHjVv83geUQqrwZ/asH8PwY+mWq6DYRwV3UOjvN4I0rdn
         H944zTvvb6oUv7u85shiHNMiecS2dYtISAvrkJZMtGJLW30FdtevCrJkj/GlrEZCzdde
         1Mwqi3YUDOZSwTx/IK8pBbaXRo6NlzSRGYb/etShq+AMcmyUGAuwgE7Q26dHLWKVxWl+
         fy6URCoGB56tTWMqdWk3lBTcZv1Htvhc2855Ce6DLebFfYgHZ2OFc1DbaCCg2a7R+9hQ
         Ehb0tAUYovnwb77UHyymmrbQoyOSDQ/2D3OKuN+0xT4m4kY2uF0JGmYDV75lQ3FpcQl0
         pEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219097; x=1784823897;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njruQ2oiekgsshQb81UK5X7MsN2R6Ye806z1jkXH6YE=;
        b=UVrYmpLiFXwftP/kMi6pHzQfjdB4ebfSsEyEPgWPawm8HNFwvUD2F5+21uzj67GX9P
         xhL+Ic5m8aG7vRFBoH/sv53DFAkscN5ypPxkveMfeCNXd9Zw2g4Wi0Knz7QOjoSJ9iiK
         K9WCjYD+zfnKHJXRvocY3z4xU5OPOkYdhLa2vXmiy3BPnhf6cIvrltSvmIgFo6deToMw
         OqE5vb661+n/XWsvlpVp9Luj5oAKL0vML9LIKudFfxflrtrjVeJMKFzIv8yPAMKB+XZZ
         TCX2C2IPbwftmiPgzWSpvI3tKlR8P2jGBbr+8+AHXmHRF+L2F0zGZppeXKQgC3FqtvtR
         GqrQ==
X-Gm-Message-State: AOJu0Yxh8HYI2+Grm60Mu9hNw7iVBUrU93ZPJPK5WNxj5dsg1xv+fPYC
	PwEzZngqTNdvqWGLm+Evwxu7Lgz/OE6fxcDFzJu3gKBNCp8WQmllAFgYViVbtiE5f4lw0X2JOJ6
	fQ/0kRCVubJFYkefmaliiIFnC92c4MFI1dZhjwAhl5XMkt0dVOq3IuIr7Uc50iBS+pZFg
X-Gm-Gg: AfdE7ck2X7y0JqdBwc+aPBMAAF5wMK8h6w+ar12BOEfk9d9OJiJ/oK6xdmYpSGtwyJS
	b4uLBwYxC9mX+SWsRhwWGP7xXPYRZ1cD67jgpuRZ4fzA4158zsg0T31fwjIw/09253VbxgOIqMb
	JVs/B34yTRiXjIR02hV/d1ZD9Q2/M+zPOhUSwolKlPjtfwd9Ttj8deKIkynPhlaRVDKJxqSsPRj
	bxkRlUa3G2LEkVSxPEGJr2yNXU5tx26+ExYjr7KoakASk424RuxiFxrhAn3swFCwBK1qakRJMbv
	vNlFEtvYaaKOL4UpqdMKAgQkGHqqc80nt6aY7IQC6K1P4Q4lwprwp152/hD1waKgngtfzdJCvEJ
	b2kksbx9GJxqpb/F7tt3/ahKL
X-Received: by 2002:a05:622a:e14c:20b0:51f:d4b:2116 with SMTP id d75a77b69052e-51f0d4b2ce9mr35737571cf.10.1784219096931;
        Thu, 16 Jul 2026 09:24:56 -0700 (PDT)
X-Received: by 2002:a05:622a:e14c:20b0:51f:d4b:2116 with SMTP id d75a77b69052e-51f0d4b2ce9mr35737391cf.10.1784219096470;
        Thu, 16 Jul 2026 09:24:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2878e74sm5128627a12.4.2026.07.16.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 09:24:55 -0700 (PDT)
Message-ID: <e3dc38a8-b2a3-437a-819b-924ab13136c6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:24:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: lemans: enable audio ML offload
 memory and SMMU mappings
To: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
 <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX6a2iBCArN7wv
 I0YNlPn1hl56ifd0bRk2ASBND2M7NXkz/+nzbwH8YZY3nc2v3y16SvVM/SVr+PnRUu537TvQ/LO
 mGIX9UNuTOQM/PKHeVFxrxX0uHDgouk=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a5905d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=IqayfNGWEjniyl6KuZYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfXzNQfnwpszttN
 dcf2y4FEAi305R2D3u2gnKwlSKTlXv8BEQtLvb8vC4Z4shviPpcni21RYCCGgUFR6rk6GelMubV
 PC19TsQsD9nV80E8n5LI3QuQfXeQMzFQ5mwwxI0bdzuiKM5+QiLmK3Bp4q6BMB/LntnLZPfmDDK
 C1bFm2zV0/P/shNN0Lqd24nylTpxGtlun3YB3+ZwFl7vttWYFnREA/rFOhDUAEnXNf69mk9FY15
 uuDEvs9vrXVpxgvU9JOmfO7s286zmt/L8quUrLZNKxPgyO2iW5A4nuaT/cTPB5dhDETlCiHCwg+
 jz9FTt416LZLF8zRHOMcXpE527RcNPK0rL87NxW2ufakekWcKmZlcw0nBQAW1c9xq+iKkqjKXtt
 Q/03uOvXjd2zPzXSFrTUVS/P+7S5kCMggrHM7/v8SCmzFeDJedvjy3eP7J7JgCiP591koVHf7Pv
 T5/aBt/6kUrn8LHwrxA==
X-Proofpoint-ORIG-GUID: r3QwJ4zBmJtTOzTtwF_c5YrKDMPYr-dz
X-Proofpoint-GUID: r3QwJ4zBmJtTOzTtwF_c5YrKDMPYr-dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160168

On 7/16/26 5:18 PM, Pratyush Meduri wrote:
> The audio ML (machine-learning) offload use case requires a contiguous,
> physically addressable buffer shared with the audio DSP/SPF, and issues
> DMA transactions through additional SMMU stream IDs that are not
> covered by the existing ADSP mapping.

[...]

>  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
>  arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> index 621ad930cf54..5b477346ef90 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> @@ -19,7 +19,9 @@ &iris {
>  };
>  
>  &remoteproc_adsp {
> -	iommus = <&apps_smmu 0x3000 0x0>;
> +	iommus = <&apps_smmu 0x3000 0x0>,
> +		<&apps_smmu 0x3060 0x9>,
> +		<&apps_smmu 0x3062 0x1>;

1. Does the Gunyah setup need any updates?
2. Are the existing SIDs wrong? Aren't they just used for other offloads
   usecases?
>  };
>  
>  &remoteproc_cdsp0 {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 3b0539e27b51..060565113784 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -624,6 +624,14 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		audio_cma_mem: qcom,audio-ml {

Node names *must not* contain commas and should be generic

> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Is the last byte forbidden on purpose?

Konrad
