Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A49A5452AF
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955492; cv=none; b=OjpoO9PcIdL8JrbsI4HqN4L6m3DW+YpdRFjg/QL9Y+VoaaPT7AvoEXfBoG9VxooOHhXw79CVmjsQFg5P8XbSorzQAgMZhry7yvIRVnFlxaTdsE7uDxqraWRkSQ2Nqqp9GXXCb1M+znOnpb4JtYVMbWdLCuRtk8ji3F82h9rt4kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955492; c=relaxed/simple;
	bh=WoXuufQJwpVROeBOuha7BT/MEfCYL7U8esxuxwmmdN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlGqhQdbBJAEnn4VQEE6sfpXlIu719fTNOEAzVA0ryRW1NHr/lneH1l5AuMd+oql1KMjdovKKaJRdZY270lhbLehOKp9njrg3//wvr70s3UgbpXhcgGNP+xYjgw63n8KqXcUEswA2xvFtbgbC964cQJxsK8Ia462++ybGPjGDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXbl6cvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkzsbaN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXbl6cvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkzsbaN2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUC2S1307946
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=; b=PXbl6cvGNavKubQJ
	c4VnYRAWsmmvPrHSLmAw0fki6H095cmYWz8SJTzpGNMr5kKfaNGmVx+YnAfp+JsM
	hIQ1jPH7IQYKxELp6akbl/ndotvOkUKeyl7Vm5vdYujrrjOuBNSnJn0DzMROcML9
	7L9CUzVidjfnWXtGYYnwdOv6rgMEmv6X1pPz/aXnZQju08O7cxYK0QJWbdEm4UCP
	eLTxw+2JQhtrOaLiBGMifaiwbmINoJ5ZoK768VgAlOPfC0PgIXZ2mjHKmuv7h/MB
	AuGzQR0DNxVIgwSk5iA+01Kt9903gmqJnnXEBhecALJRBBrfnlOLfvfLGgMNlSDy
	RrZfBg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstub3py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:04:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65af4082aso133201e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955487; x=1789560287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=;
        b=LkzsbaN22hCPVP4VbwUjbs2TvpBnN7IA/j9NMmK1ryJ43t/2MKUH39oK0FU7Jcuapv
         741JI2ojxzwa4ubrR7+pvhCdKhvGsIhYAGbts9eh+UCmlSGrc30/TsOBHNSDQmi0wP/5
         mC5/lRm553X7IxUvUR1VSeaauo+qSbdD/Q08Mh7ZI9eCbY2Z6a2MFczQdvTBDK00OuGj
         MqRVZnCziJKd5IO318dNurphNgSjn0/RXpRiZ7lC5bccJ1U30qzaTsrO/8zr8/nBtBEi
         ZdKVzcHnI5qG8ueP7aSYYBj7nXT7yQiIDD/zoYpaGYvwQaCg5KIAyVqYiSuKL1PxP3yp
         hF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955487; x=1789560287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=;
        b=iBSHHhJLs8rJwxibIApSJrUaGZqUOJl/PK9eF3hHWP+fYnuG8nRaT39mutXYb6MNBX
         vED57DNYpYi4gaIhQ/mh+ApYPAvq9hZHzDoGnUhts1g5bI5m5XDKJzpaR4kEwemnBWC+
         7BhzQ0VWosjLVf9vVl+qNJWsiUQcPJS4q7Pb1635H9eIGHXbb8MMyEKXeBUCIp3gioL8
         uCOXy95HlzCITbd3PIuNMw0pxFzffSInMyt1Tj9rizVAssQm+2SC2wxTq2anjcR0iJg5
         xMcI1QIMmT3u/Ii6OWa12G4ChLUkoCyG26R60BBpm+lSdMD+ptNXq/ModUekcEIo9bA4
         g97A==
X-Forwarded-Encrypted: i=1; AKwUvBw2i2pocUUtlPasMzBQBNPUAezsNGA54aOkaYft64k3uVFq/mILVWzaYJJrdLlC8xHekzSCl804S1YrW6AQ@vger.kernel.org
X-Gm-Message-State: AFuF++n66wZaW4Cj7X1UFD8AwE+epNc3UihSUJn+sN+ALVfk5Khd4994
	YtdS9Jm8veTuauqr3XLswWXc8eCEha2yheW1A/yBtEhVtJMLK5z4+ftY2QL2QcPQfWFxCyh9sL2
	FbmUNAsmGRMckxt3XREgYy7ugD6E+FnVVYIYCXJRIafDXdHE1qtiK6Qw1SMoTbBnMGqTH
X-Gm-Gg: AYBFou1NTnUqmC+TXj2SV7TDEqewH/ila28lXD3dqMeXXt2GYl8SbWssKpIByaLWjTP
	MxwphV0rAcyIC2+gOSPSB7gJytwS4B17xsgUj8Dz45Dt6YSvhceRFnLgg0nbX0MHolvGl/6H3mX
	JhMltyQIfE85NPwH7a9rpM9EhYSACX28mwf7pFPZqndRhEWRvi2DXhcDlvctvgs2OEevAQJU0NN
	TOz2xWcFQKP+zA++QzRRETM0O4VHRwq/bgKcNo5ZI+Rqull6vhODh7m/3N2Wf2QM0nzcpt+zquw
	C39e/WGD8RIaFBpmAcswzON/BtAOAbApFB8tlYNJnXBgOFrolc1NT6+BRpC04Tp8hQ86+tprzwh
	VLXLVgcGMOttnP+2OIwtRng==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr289498137.0.1788955487425;
        Wed, 09 Sep 2026 05:04:47 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr289479137.0.1788955486951;
        Wed, 09 Sep 2026 05:04:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c398sm745510466b.31.2026.09.09.05.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:04:45 -0700 (PDT)
Message-ID: <24e9c518-fcab-4743-8f17-e0f3d10ea64e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-tama: enable SLPI and
 IPA
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa14b60 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9qnw-8MMG8a7AGiJb7cA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX698avptWGfuc
 vs/ELzYCR3Y77kPMPt6pPCVi1qauWOAy1MhdRkYl1sLwHKMFOSLqTem6vsT/xx5NEmIdEyiZae4
 FzP+Zmx30TNIeQHj4g/GNAvgZqfDlok=
X-Proofpoint-ORIG-GUID: t7lfC07O-LxN9lJsaZdAEwb3NoMDWEdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfXyoucLfo92mbX
 iuEVCf4ruTZrYl4vEI1cW4Jm7CCOqki9zZsCHZyDeTz6RV2f2CppL2YtGu1ZdMQTUikfDhqaUk3
 npLLFzWBUuoZy3ZQn4Ac5vAYd6KC3x11W9vMmIv/CbYMskmSA1Yq2R5qFEdpTx+4GmXTSRXa6ER
 xS8Jb4wcds/6Nrc59y+TuM4pb96vrDO4t7rlLRRu5H+F8krqUERbe2xlMOpiR2KG7HvksKPkaDo
 469cxjQJswibU6KVNowMm1qCe+BonbC4wPnPOmUxeApWq3m04UuxAhzXPXtiH2a5huiKDH3M7Zg
 RzdPdQP5zie4WFJfe4mL2S0sgNToE5mBduAlYRkCvhYmnhgvmc0ONu7BtWivBJUZr3lm28EtYSg
 ZU+yTQsbegFKqAOGEp13GrYvFT0lATH9zNJWRCnooljHi7qAF9lcWZ16jQ72FZmOxEbRBrqhS2/
 H+FqxR5AVTOFI1B59vw==
X-Proofpoint-GUID: t7lfC07O-LxN9lJsaZdAEwb3NoMDWEdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090134

On 9/8/26 3:16 AM, Shujath Mohd wrote:
> Enable the SLPI and IPA subsystems on Sony Xperia TAMA devices and
> provide their firmware paths.
> 
> Configure IPA to use the self GSI loader and the existing IPA firmware
> reserved-memory region.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---
>  .../arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index e34c1dc35a05..1c61a274604f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -403,6 +403,18 @@ vreg_s3c_0p6: smps3 {
>  	};
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/Sony/tama/slpi.mbn";
> +	status = "okay";
> +};

Please keep the label references sorted alphabetically

> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

These two properties are there in sdm845.dtsi already

I think patches 1 and 2 make more sense when squashed together,
especially since IPA without modem is not particularly useful

Konrad
