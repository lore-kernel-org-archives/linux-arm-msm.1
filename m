Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605214;
	b=DyKFASp5R7hhzapj4aDb2k15QmNwFpF3Gzzqor+j4iwgLVLSSGG3Mpb7uZePbxTPgW/p
	 GRrKVBAQKJMDs3k42iu/In3HcJUM+/ZLG2+EdPUupHJPQXeueD/S0sFlGs4BybEgeVVDj
	 Xs8pLq54xq8sVZnhotpVIGfV85YL69dZF4JFdxfnXUG6bMU+pIAFww/4XukRpFUWuR+Ks
	 HplBJTv8U8GsPlf19UekYrqD4T8jDbWW3/3xwbRL0O5fRuk6zj5q/Y14XBZv6QIWL4LXn
	 NlnZSfDJBjyDccXzLM02jLQ3Cqq2mMVQqbeANGcYSbFwKRXeEFGwLooYST3OuOpekoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=;
	b=4mC8XBIA8bp8BbWXUUjaLai709ptuoIMjc9J4btRSiUd9SNRzRfnlv0pHljzxmVcy+cF
	 6p9LCkfIeApNTGDyF0krhOF8Wvn83RxPyxY/35/19/ks+XVERuGrOCYh0rVgdTq0JhkpM
	 orEpBXDpq/7CPgx/anIk/Ym6jsnmd4ov9LCZLbybaibr75vgWOAuDEjAivJygYtfXy0B/
	 V8no0M1YfaBBU6sIfzhAA2GKx0fYfNlKUVspHMW6upk7GXPKljs+2R7SmJPgVt86xUwXZ
	 pRZXeyGPcuzinrVgCApj/Ciw48W9Vd6dfFxnlSgninOnBzpnYdZ03bBAkYVGhTpZjbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o9MBqwBO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h6ZbwCHi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E7606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837E7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o9MBqwBO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h6ZbwCHi
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHmg3126575
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=; b=o9MBqwBOu3LAk3Ql
	kluDjP24AD5Fne6UqAfHIGo4aXZyOPqqNhGWSMuLNOSzZjicR5UqeSWaXbzQRXpC
	3S3swPaoOA2/2pfeLK9d2q60YA6NW3o3k2M7kqjahCRwHEdXGu2VXsKVK1N3XgsZ
	GksJF0GKZyCRJ4lZx4U1z6Z1+Ow8Q527VpGzEaa9uz5cHC3dp/nR+xbu2dNLJlY5
	FCGD5GihpERpZoM47wKRHcbqGFn2tMDIVhD9Sx1KWJROBzqzDOxGvGsuq+J6CfMk
	o0mkvgLk1sjDO6DsCgr3DhlD4tNBN24Fob5Y9fb9gNq6l5d4gdTozjxZ5YTltUDq
	VexuVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbv0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:13:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53635fe2335so8476411cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605212; x=1796210012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=;
        b=h6ZbwCHibim5dZLdQTk/KVIK7DHkQFXs5f9wRPTh96Muk4tbeCJJqgCHL7Z/e0Jedc
         TekoU1O25P/yI1+9qVgzPaqcMKSHASm1kZZu2T7j/Eno9s7aaumrfCs5aEv+nXoVygI8
         adNWrRp3i1xX2Gi62yz1ksyqUkOeeVkOrpfy98JV5lh/Fd4MU9rbRy3KkykFP6uYnXJI
         6fEThBtu4ZqXOlvdhyYeoPD/xjATetEUqCMjMfECyvva6EeGe8SfOH5/qF/zCFrmrcP/
         cjhgLkvK79I/HsPFV2tvbY9i2USI+TIP7h0hNlEJ44lBZc5aBvGuUNybglgNFByMPiRD
         5/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605212; x=1796210012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=;
        b=0yHPpryFCYpbhrZlei4bM06lCln0bG4zrxVjEGQrutafcBNSzDNW8KAAGQtIoEtSd3
         mWAdkhyFeV9eRQW7bViSELowqjo3GDBdqE4e4nK8TD3z9BGVzv4Uh/fG+5bVDq36ECnz
         bWjhMOYvcr+q+w5VLpmqVMvOa+ePptRhQ//4gzYvv3GUeZxCT74zL5a+EtPeDVz6Kfv2
         z9lpGheUl36wQls/VLHChle0eANnLQvR5x5YLN3vcnfxe0FDq5LZk3fafSMSgIGBTuV+
         1BfnEeXjpEdG766yW8do0JSFfuVF3QFEQVjkxUG4N+fP4C3vPlfuYvrqZz2EbPjR83o7
         PNtg==
X-Forwarded-Encrypted: i=1; AL+hErERwZvsIgTQErKlFDWKyjQd5QSJiM3X7T4KlXJI0/UHowLC3QF7Qta38pDyWEg9SzF0V0iNgaJ/+ylaoy8/@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZloAUZUoQ2mtvlOnAiotNeh05IOKeukhMlaFDNb9S4Wbs9BaA
	inUOMwpRTspwLUlsA1T7WmbEQ7pgnqXuAPriqGmzAFhVsz3YmCavdH/kk5rFgD0D8Ijk0mIIb6V
	/vCcafyx+n4moY0blneV2P7ODb1lfSf+PDIScFITj8qCA6ebfWIYX1ufIEMr0i1JL35ljlaS6cF
	aE
X-Gm-Gg: AZFdTZe1yz7C21vQg2XCejcu6KVsSj/4IdGiX0W0dewuBltmRjsqqsL7wfbI6jd6xqt
	arj+/RFP1210fs0be2KGkUUFmhAchNPDTpbOYsCwXQkII4WzzHfCM2an3Z+AnvIwdAnao+HmjxW
	Zhd9Ykl8oEW3Wyor6uctNUyg3hg7Z5Hh+VEwonLRN8/heW6yosr01cLVvY+kBSG6OoxEw1vhtNF
	gqT/DZf3e9p1RV8GsELFoBTQHCo6nTNt29DTPThhc9Q2DHnAgEQnBfintcIamEkQUQxF6lFwzAj
	x6z6XL8z9jhffs0GlEOqlRuKu/Qdw9aQ0Hsjr+Mu2bPgA4ElFtOZTA5WdsNDtlN8FpnwgKuKN78
	X8052apl0nRrfOqps2k82uvEVqTmivo80bI+0NZlA78fO+qic/4r1OXmUjRchZtdnQpTQvEI=
X-Received: by 2002:a05:622b:57:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-55d76a6b28dmr296719671cf.5.1795605211544;
        Wed, 25 Nov 2026 03:13:31 -0800 (PST)
X-Received: by 2002:a05:622b:57:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-55d76a6b28dmr296719371cf.5.1795605211141;
        Wed, 25 Nov 2026 03:13:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35641sm8146988a12.1.2026.11.25.03.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:13:30 -0800 (PST)
Message-ID: <e3add71f-8624-457b-a304-d5791015bae1@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:13:26 +0100
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: glymur-crd: Describe the PCIe
 M.2 Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
 <20261122-pcie6_fix-v2-3-2e0fe615d90b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-3-2e0fe615d90b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX8FfAyH/28ft9
 nCmMWBKiHAQO53NJErVvT//CixBZ04qpAvaElZz+lcEPkT4GNA40DEO6R9t3tdffS88TylZ3NFr
 56kmBdqyWutGrVjkeftm+CgjXf6jq18=
X-Proofpoint-ORIG-GUID: v4LkVP0U0WM-v3xG38wlsCuPW9bPncHi
X-Proofpoint-GUID: v4LkVP0U0WM-v3xG38wlsCuPW9bPncHi
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06c2dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+GsPojjzNOLO
 iVsKfbBcnQktII9+P78ua3gCRAyMKbR9VFLlKMUyVQF/4zq3WIuZh7efWluFTxQMs9awHe/meJG
 Wb7CTHHO1V+Gpr68cuyUApEuDAqvkpkbmJFaA32at66WgFvFdK44NYse3lYu+cIl8neAey4CvXs
 w3Dn+7/tZ+Kgru+jRJ9jI7++VmMuKvwUCqf8GvkbFKWNw+rsDvimpSswwV/kb1R2OOtTN4DzTba
 d5Z6NsWNZ3zpBvdO3OuRLCJm3mhWgZeN4cOARZohjWPUKXpy8cJmUp31ANbW2IU7H4k7w91yhQy
 oNSnLxjboyO8cUsL+hB5wXFsglBRaOYMApBOOTYIcFaIrLFyuOtLBvc72BCNhc5CS4LBmKWP3M/
 W3YXg1FJUItDOSjCxThpM2UhzGg8+ePjXIWfgRA/MHmn55Z36PxRuHVqdoJv7Shkrhq+614lxLb
 7lrDjpuNhplzHR2dA9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 11/22/26 7:45 AM, Krishna Chaitanya Chundru wrote:
> The Glymur CRD has a WWAN M.2 slot connected to PCIe6, whose vreg_wwan
> supply is described on the PCIe6 Root Port. Describe the slot as a PCIe
> M.2 Mechanical Key B connector that owns the supply, so that the slot
> power is controlled through the pwrseq-pcie-m2 driver and the PCI
> pwrctrl framework, like the other M.2 connectors on this platform.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b..a66ba8c0ac8c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -230,6 +230,27 @@ vreg_wwan: regulator-wwan {
>  		pinctrl-names = "default";
>  	};
>  
> +	wwan-connector {
> +		compatible = "pcie-m2-b-connector";
> +		vpcie3v3-supply = <&vreg_wwan>;

On the schematic I have, it also routes FULL_CARD_POWER_OFF_N,
DISABLE_N, GPS_DISABLE_N, 2 UART ports (one muxed down the line),
and a USB port (also muxed down the line), plus of course the
m.2 config pins

Konrad
