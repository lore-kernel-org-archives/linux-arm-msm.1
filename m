Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483881;
	b=QIixsV38s0twX4HKIInfAAbImLJ7K6BG1uetKKhT+KPv4YiZxn99gucRcj/QUSFwlU8S
	 Z4hd6IWUvIb7+e59jyddx1dLCefkm370guKgV4XpTmMnlhIEsjAcxsTgFgkACHtd4Vyn+
	 AlFDXYPAe+nMH/cKExgnrU7iLhpDaf6qFiwpTUn3VYJotwq/Ee8fiQ6MNGV3hr7d7wd9I
	 1Va8K/0n80uAWo0KkF28uP+2Lh/moTsCA1KNyMEKTR15E0zidj9/NkF6ovkPDn8UekbCV
	 OuEp3+bUvaZJwSdbC3dIYWnhcMFn4HZiRKQ9kU3LeUiGw4tNN+16zLB1c4rgj5ati6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=;
	b=dBXUgnDs1Dd7sCJvCZFc+DlecI0ACePN3oYcZGuz7LdhqlQ4fLNEUBOK+HJthBblPReN
	 KfEK/F/7mVxq8JW+d1111IoCSIbaHw7QuwFdf7vdtrjhx3hOAvylzhX7LNFaL46r6lUpe
	 bIzpjyZbAOOdREeIvduQUK1JSJwECiISNnsLlmt/DiZv26AuPFoAFo8aq9v7wRArFma/f
	 gT1BF4Vb7mT0Hj4mK8cxFgjO6U8GDZIkcloOuptrYZUIBLjgayp23JoKXO0TM4HFTWVYH
	 3saLhxjT5rHLR7kEznpl9Fb3Tq2MRGc1yCfQQLvB23Bbd55irFa9Dj1JO54BaYNzHOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNuZAY2C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nempdmhd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8B606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNuZAY2C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nempdmhd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K65sL0803528
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=; b=RNuZAY2C6t0dngjN
	6QYzz+pUG8Zli4ytOvPQvGe/gaMR7MIQgQPz+JLRqjMnzL3FMoIhR7dr4FaBD9eG
	wQvbdRXfIEZh96c1Pb0j8Y63av3Lj5z2DBOzL0OUOreg1THuzQmWqVn44XxCUCng
	oL+OnIMwx2g1uxnQtyDtR8oSvxCiZ/4WRJaLvrhIUVJIDJIwV7ERJNvTScVItk2d
	nMprMny3uloY6BKYu8FEZBI7FUStiZ8S7qBy+XIhqQtapb8MepB+jTyH+p+0SkyJ
	adczw1VwvDCwfH6+X0RW50Vc3FojxrL789WoeRNmKcfrTw6lgTpWKhx/1a0nqFA0
	DqTKKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1jx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:11:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9bc964so8426486d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483879; x=1793088679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=;
        b=NempdmhduzKFP2EE+uxvztF1mqYRDRQN6RBl2SnhurJCxpCl2IrUfTprkvxpbSKQls
         g8h7/HaQJ0skxP9RQAl+ZkLzSAiOP8QJV7EfgavX1aBWLAVsej1E7ycAxffN7k+dHywM
         vilTmVMTy91fUjWvdr0IxVoxJCPuvuo6zPcGz0UmlDmD+AFVVVazAdvwmfJhUhodO6Dh
         ewKwYv/PWViYPv+EkJjs6JIwG8+g5RkyGfBnx0bRtNng82i2l55NvHbb8npjXue9tHSx
         dkprlhusITvsLz39D55t1W4TilgRafaEOfZYe9zMpl6SdW5282spwHV7d2k7awvSYt2w
         zh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483879; x=1793088679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=;
        b=JSUFEv/bJEyoVoqZ6DiLvLaCjcWCI240e8o01MDO+pH4OLRlnDdKYCNcswo/mSz0vR
         C/UQNtO7r5wrbHI8wccf5xvKmCIYZ5czLuWzyBO/fyHlk3rLfFV9FCD41RbRJ5q0eSb9
         YdN+KQKEStwmf1m4K1PEyZG22uTxRRo2eX4rN2bMFN9B85iGhE++gOsgT9hL8XXY8JDO
         cdlRY2D0AMjp5B0VoS43CwIa4jjswzGY2sn3VyyIOphCm/ac5jnz/uGP4kL4+GRMksvo
         fCRl+fXsN2C+Y00g7aYEPo8SL9yyO/U6OS9grkZXSDO2NYi+oBjjWeuN297DX5T5+DfM
         3xTQ==
X-Gm-Message-State: AFq9FYJ8fmLt0VDRdkV8J2ol3OV6PpSB6sNiDexzEsHhHbpgs8DmPBrU
	Fo2Ib0XyVCuAFV1Wuux2sGSKA+CJ5unR3uk/kemfsbuSEiRt0a59b8bk2WZvhZprhClOCsYbIoa
	MO96Ys0MNrOSrSm/oJcKnAg+HyJch6Qt8RWO88LY9RZivvGVH2pYM0eKRqY44d/SdGPWx
X-Gm-Gg: AYBFou3ANL3jA6FuBvVIL4WmIzuljTM916gB7QDRjVjsLpFLEouwoBqB2zjsiaYBeZr
	KYkcgV2crVROp7aH/2DuOZ0ehYb4nH/JYrBNUub1QBN+QjLYqLaUhliQ1NCjmR881DY9porub2s
	5VIyXQ3DNUlS3zLRGJ4JfXlXebM3d4nE2gGAnHZvm9gIF0UdC6klLpflCtuMKniVnQ0IpT4iFqz
	nzGKyNv18DyC/oT3sWSdWuEU6bJKl9piqa6Hya78fkY4QLXHg0ISidvydvLuPWS/6FF8PNv4EMR
	M3mD4Kyp9uS4+2rpU/Lhv6BJi+ZhOOY/XySQiOuy3HJyfCC7oHtzcdibZ6Pvtc/XGmcCykWWXg8
	do6URvRKLzH8Lbb2LAN5FqA==
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr177951841cf.5.1792483879020;
        Tue, 20 Oct 2026 01:11:19 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr177951731cf.5.1792483878612;
        Tue, 20 Oct 2026 01:11:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm461340166b.61.2026.10.20.01.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:11:17 -0700 (PDT)
Message-ID: <40ca2a9c-55c0-43bb-bfa2-f6f94f35dbac@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:11:15 +0200
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
 <20260905-hamoa-sys-therm-v2-2-1cb8c958c981@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-hamoa-sys-therm-v2-2-1cb8c958c981@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JQli3BViYc20BJIzKI8isgNdNwoRpetd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX5fQEisvn1rPG
 eQPNRslmSu1ghAMCg09tjory9Y2rhO8vxOSBtGgDyiirqvttNWEu6uucTPxgZtLq6vLTxJYtvMX
 GxQ0qolKiX1Ps1zk7Kk9nLlBT9jKZp0=
X-Proofpoint-ORIG-GUID: JQli3BViYc20BJIzKI8isgNdNwoRpetd
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad72227 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4__AJpt3kqbA7IiQeHIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX11xQLKzax/NS
 26ljyI5VwjOYyex2RZosu3PT5fhIXMtFHm19agmBGXcSSud7sbx1Fo5gmX6CnU6fDiPnfUE8BGO
 k1D77OIoaUH6kewFNFJ2dQb87BXs2UbjBLOCRfNlVamDYjt3adWktNBFaDfqHrYcCKq/w4gqC3X
 39/15QSMOaTkfxijc/xSMLLk8JZ3T7wXhaey1fQQxrUzAbhukkoL1zlS/knWCPRzelDCk3CMafl
 nnAzIrrJUtCVGxhoYmCLhWWJ1eV4HzSI8MRDfm8l9/M9YO0f6nYUPx43QvVwAkB44x/el3ei1Q9
 Zu0NEyLnuodrNU1Y4kPFqQ1Z1/ICxuf/NHfjhMOUTWwPJQyIKlpcIDMOwdVthQOY+kJIK0g5Mvl
 jVcaXI9PdsL7LEzElKbQ3I/b84m6o6zHwbS/nI+H77OV0gOHgaajgtLiA/v0W3VsHgMUdN4sUPx
 8sK9WSwO9m0nSvVnbXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/5/26 5:05 AM, Bjorn Andersson wrote:
> The "limits" hardware performs rapid thermal management of the CPU
> cores, but during prolonged CPU usage the system's overall temperature
> need to be further managed by software.
> 
> The reference design provides seven "system thermistors", connected to
> the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> thermistor", which is wired up to sys_therm1.
> 
> Use this to throttle the CPUs, in the same way that we're throttling
> previous generation laptops based on "skin-temp". The trips are chosen
> from those existing examples, but are comparable with the ACPI thermal
> policy.
> 
> While not used for cooling/throttling, also add the other thermal zones
> for temperature reporting purposes.
> 
> Enable thermal-monitor mode for all 7 channels in the ADC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

A good start!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
