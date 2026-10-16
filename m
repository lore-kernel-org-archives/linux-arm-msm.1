Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D946C827
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144999; cv=none; b=WpQ0e+6ElhYW8NCD9uabUCuqZzNbn6FhOrI1GTH5Vicc56hQoNiT8osgJNl18bTiC/cllSNXBtNmANcA+Cte8sQEvZlO5VkePuiwEylZgRHpVKYuUUq252lOugdIYN1vS7p5DfcpVMiXdVkgd/KMu6OLc3gWdPdCmmTUQSeTERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144999; c=relaxed/simple;
	bh=P7x50y2utm76U0n+hMlHkQ5LOab9FHOLiRJBxiQp1MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cbuthug4gdZvXpJulPxysxWGZjOc36bshWxuUh0Myhs21VAd7mPFM1XXZF7R3PjfnlKIsz65Xth5qwjYC8uZBuPWOAX8ZBDVRpHp5Hgw+alDQmR776Gomav655N/5sLWZBChAaLvheGtIATNl/h7NnYw8XJ+hPoAuX3oacVgecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oALA3otZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFlnW8yD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oALA3otZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFlnW8yD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lf651218651
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFbHLAE9BiJ1N0vyGL3ie1gpBbVjTxSTc+KSkAOv1XM=; b=oALA3otZmDAlZdx4
	8iiKqi2IGmCVYLfr8WUIKUQhfvfm/S62TJlLEvGuMQY56ktIXK3X59POI3RyHroN
	6mha4cdVlbf2tIWM1FoxKSPcXMuuiPDMRDmUgz5FUQRjqJ5YKxN47WQ8ERJD9Cl8
	QMAlyfiKlvlDC2JvNbi35AXI8GwIPnyHIf65bDoVpRAFl+/dr5TlPdPApiqJlCep
	iEbJ1+GY7T9SuZpV+giKV7fkJ5V9tb+g1uKg9dx9cw4EPdcEqaIQDHPNz7aVChKh
	oFuB7M/Fa55EKDudMwhL1BBYQVFPsD8yU60K71kguD3A+jZOGWVjQm4j5Ik/mMBm
	5wuthw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seaq0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:03:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso14861516eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144994; x=1792749794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFbHLAE9BiJ1N0vyGL3ie1gpBbVjTxSTc+KSkAOv1XM=;
        b=QFlnW8yDIfe/OGuRWxk9cYI2aN7Z+hOwizTRz2DQohOPF9L0122n1gwzZIeqFThfUE
         JyHFXj16dTi5xxCDY4DDwqbggkNd8M2Q5o2XK97V+Dm8G2nO8pxkCBhUtGschA6XYaoI
         l7yeJx86fCiBnVCpwq9tw8YHFSylFO/B1rKxvtWQJ4z3G70lBTPCQNQL1hk0n3KCfdac
         p5mcIbzTGLkhsDzB87LP5jPkV4nLqXjPPT6EZjUIrGJM1795mFhmalc9qQHQ51an0BEY
         dI91Ut/HkisjCMPJlOREmjnw67y18YdF2m3wwtG82IKoUdWo5JLll82x+HOrfX/4Wm0W
         23Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144994; x=1792749794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFbHLAE9BiJ1N0vyGL3ie1gpBbVjTxSTc+KSkAOv1XM=;
        b=FUYAB0zZg6rpqjHrq0u+CEgMDgGAGgbCLOjCcmfFFPf6aFVeOmHf4WvfSKxMAf0qm3
         BjSXmDXUdDjQmXI2FFqAGbTYrxqMRsX/NM8EgxdhZaA0F0d/yluzsUhuRd0l1Xr7EEFx
         jm6HRQgZlKSLGf3QRaXOB/YgWDzXt4K5OSyVzLg8FMtPrc7kaxvqTedIzZTmBWqWqSFB
         doLm6/5AbCJpj8HO0ALVEwqRwgZhlQ8TglFMjLySENfpBEkeJBxDlGFwvyvm1tbFL7Yr
         /48W3Q91u8tqxIrGlmb8dHy8AYzja6IKE5CKHUrCS3gZshjLdc0/Ub3RLD+JYwqbvVrq
         tj0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxg3VXZ4g9S91G0CpMjA2omm9D1rm37KgrFt7fNywjoj3n0uAh7os1QrIUJZQgdWdGEVJ1xJOuI8IyEGZoX@vger.kernel.org
X-Gm-Message-State: AFq9FYLbiM3j++qFuhmVL7zZ/bYimLL9ozqJHK7q7u7iWAQsieprFnyv
	IWo58zknmuNC0ISDFGSl9OXTPx3eIZ+sw6qIrVQpz8TfVG741cyy/rFgKBciBxO9ekxp3/mzOqu
	CWalqCF/5Sx3BcpkW+f0Xga3aKhrn2FQZZCnWq4PzQPMORngofwMmeSvFsmtQeP4PPqhO
X-Gm-Gg: AYBFou3loUeqUnejKALW4uTexHolXhrRQA+U/5W2TLK6NVzyLmUHLijTG//NpgoJ5UU
	tDDdLQSV2UNQ6GHukNa3QMw9RL5XMsIeZZMn14H+OlEnTNbZ6SWo/fntfammnH3RZ47WiXFqwbh
	IMPvn3XmLVUgCohZIosbBfQaZbmzwtEcRKT3Ft9rKy+2+kx7UZNY620J4NCTTVBCNmVUAcGeM8v
	vaj2bhQa4OX2XffG7+N66l+1HJKhp6kT1nEQFWVRuEitvoJjArDZuOGrApKAiQuBiigX7CWxtGe
	80twgncjtKt7K/P+He8vsuna55O/UAZJ1g3n06GDAB4SHbsvAW+JviiUXl8V00CqBx+fWSPQ1Vd
	5YZ8X9KW/Or36rJvpB04G2xk9wGXz
X-Received: by 2002:a05:701b:451c:20b0:14a:5d07:9b with SMTP id a92af1059eb24-16a5ea5d851mr27453564c88.28.1792144993506;
        Fri, 16 Oct 2026 03:03:13 -0700 (PDT)
X-Received: by 2002:a05:701b:451c:20b0:14a:5d07:9b with SMTP id a92af1059eb24-16a5ea5d851mr27453539c88.28.1792144992946;
        Fri, 16 Oct 2026 03:03:12 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm6054155c88.6.2026.10.16.03.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:03:12 -0700 (PDT)
Message-ID: <9043efbb-7883-43cd-a09e-28fc5304457b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX8u+FRpVU1aCx
 4r6VkULOU+QnRBC2U/dUPXIy/jaOfwP1A/geHts6jD+PN54O5WKbjWstjkvRG45yNjT2IetaK1q
 cognd/zwC7pY6W91Ks1aBK19BPew+xs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX741wjVrxDeTs
 wK8wM4XMck1j0Mjup7LK7/J7pEts6BgQV7/TblTYwrnSJ5CKD9dEpiUlxtPpzfFWJjPNbwNa4Ni
 YmeoNNUeekxAXaRHEcww7vvLvwtGoEPOk3erfZmgA+3wao0mTwtdRr82rbPdj9Hz/srLUcKBvAs
 XdZW9475T0Hl2S9y84BhF9i7jFNBCyq/4AJgxhmFyBFaguco/iowSA9sg5UAAtGkOggs7nnWb9/
 bnv7wY1QuQEEMEKziXc24DIZoeAgqpAUkIteyzlrIHig/TKtjPCXf+eOyjIJP/EfxgZQ/MEOpHu
 TdoeupHuBNwdhVeUcjkvaylg6sHKAUO25ZGdQl09CMNcvXnqj70TPJTPkZxhZ8/KfVxdSFu7L+o
 XSFffHPjJs21AIAnmUIOa//p+3eK6jgKCXgH2t4bbnS7444mgPpI+ruNDvDs8yHr1kV95RT9tgy
 fD2COHrMTSJu7uz9eFA==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1f662 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vC5WxkcjHSV_sht6c60A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: jL5xnNuVeZ4J2XAdQQEZ27MTsDLMWxEK
X-Proofpoint-GUID: jL5xnNuVeZ4J2XAdQQEZ27MTsDLMWxEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 16-10-2026 10:50, Abhinav Parihar wrote:
> Context bank 9 is reserved for secure use cases and must not be exposed
> as a FastRPC compute context bank for non-secure offloading.
>  
> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
can you add Fixes: tag as well?> Signed-off-by: Abhinav Parihar
<abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
>  arch/arm64/boot/dts/qcom/monaco.dtsi |  7 -------
separate the patch both different platforms, also please include other
applicable platforms in your next spin>  2 files changed, 23 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 695eae1b7256..5481dfb73454 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -7861,14 +7861,6 @@ compute-cb@8 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&apps_smmu 0x2149 0x04a0>,
> -							 <&apps_smmu 0x2189 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@11 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <11>;
> @@ -8000,14 +7992,6 @@ compute-cb@8 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&apps_smmu 0x2949 0x04a0>,
> -							 <&apps_smmu 0x2989 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@10 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <10>;
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index cfe39f923224..e73a735f2f13 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -7822,13 +7822,6 @@ compute-cb@8 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&apps_smmu 0x19c9 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@11 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <0xb>;

