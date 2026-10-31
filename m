Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437251;
	b=xifSsBf8/L+W5Il5hUfhdY0ROX0fjAW8FsWAeNstV2Fpd3EckRKBXXOw/p7tBTlENARy
	 iFnz/uwxT+3d3c5aIjvet/NUoFjuTA8dMujjtpd5jh5PjzxqVhA+5syD5y3vVS/83Ica/
	 bTtOKmp+PP/oOf2goTJxqdYcMkHEAvKvJhkzIiwKczPdz3u2bH9fLPupvp6fZoYoL0sZq
	 84SBJ/0euYvzHO1uW0CBfK6SPqCBuLPpMi/9ho/bynB3lslcCucnFFa/LLsJNH/bjf4Vi
	 bYXr8Ab3fGQ1GGVhhgJfOZ72hORvn/eipb1bXekunLmnUI1iQOW/zRHedky6vaCkPeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
	b=2kVI13+zHp+ACGK17ZKNlBVwZ0spwk0EDXp7UW6Htge4eLrZN3JsO3j57ugKfmwzWrbL
	 h0fJp2Adg59v+hyewhRp0OHf1iso9meRKuGAJaB75TpFBus36X46wbB6y8qm96sa9v/AE
	 Lfr3eMhu9h3dUaPEytZEqhFGHBSNDkTvg2JLxJNO4b+Fu19G71cSEpgkpKkkiveZADnfu
	 nFlgahIwKoGCyQiBR8HDLgjfb/ZuElIxz/CpSGBelWK/9vAqnwff173EI/qiIRYxKM0qB
	 8in+KBpo/AYSf3It2NZRupheEBIqeCtAGr7xE8jgP8lxBSAKl6SageFnUogTZwGf0IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTEaXROH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LE92xQ/w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0D606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C0D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTEaXROH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LE92xQ/w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4lp0j227250
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hEBW3LH4sOgJCtCxVxcQeurZ
	55QVpzO3dxYT1b7yId4=; b=pTEaXROHxaEJuVLIa8+QCUI9rfTd001z1ZdX+N7q
	GsbISwdcTtepdCjg1lb946VR6cl/Ilqpcf+XyN+eIBGgEqcFDCg56brsi7dpLh0K
	iGnkdiTq1k16T51BJCgUCUKtHQEeaZVtJ/5utoTVSbdNPc0YIkdCyjFwDoWPBCLd
	76u7QTLCycONR6dWlS4Kbk6ELMMHrm5eSPmNWumt8WTIOvvj9QCpnrZyHDymyXMJ
	z50wJcNfnJL+zcu+Ui2kCIcNoVHsAtcOUU5JbZYiTsAZiIQkzcyZfsLl+RFYQVBo
	ueeC5/Dm+/qMssHNYS8J0yWfip6a0X8TUdSxjX3VUar2Bg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98hvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso4140300eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437249; x=1794042049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
        b=LE92xQ/w18R1PWG3hE5olTjWIpG9qa2JlaGU39E5BlRmixusUGK/lV+B/l5Xw2qB2U
         jR/xe+dRZ5tEqxfioR1HLt9VR/nffboe5HIvthkAhJiW92mARQX9xxIQwNzJvA3/YR7H
         GZd93CL0WlsThiyhAiK//hoyUPHDdzQfmBSZqDIrCwQhosdaDJduGIOtOB5igmNP1I3J
         yQoepOORu3Yxc76ip3sxiGwzCkvNlb6En19WS74cT9hTK5nG3CIDlhcyit8rVKt4e0pn
         7vjmck7mvZpBWDNYGrCqZeaz1Mxn2DvDvE5XuW3mpVaW7QmGmw/c0Au7JOZGrf5ZB5eQ
         0JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437249; x=1794042049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
        b=g9zJAzSrUO8bQU767M+LDlypr88KGcJqlRKvg8jL8sO9Lks/aUcHNL9A8P1UzreWBK
         vUpJROFYjEm5UqDUueuCjySDQjYN81LHBWvaT7J/1tRPrV1C1ad3M/WmIt2v2NQLSASz
         I4asgfhCbC82XoseAbmsPQfUztXj6BTMnOFpN8SNI6AFZz00+oSZQo0gHxNWsivYxlFg
         izhLkixM4fnfNXa9luhFvBIYETjD9RiypTdZcguy4bc3XjhyYmqzvNVTDgsDUJpe/B+7
         2LnfNBQLt/m2a66lD0cDJ0RwnifMDqReghwXuEIKMxWX3A9j7owtE1s9HZQ5PVJvdxSO
         mjkw==
X-Forwarded-Encrypted: i=1; AKwUvBzzhqnkVBTvAy5lk3RYWBROMgGIX4ReBBiNk21DhmcPktLCoowvXJLnNlBtEUTBqlN3HS+1lI78Ezd9x377@vger.kernel.org
X-Gm-Message-State: AFq9FYL1bhLw19A7V+ncuu4nx2E95nvmw3iymeIdocvEzWyT7izcP5sJ
	tThSN02HWRCMuAJihp35MdwpoC6Qs0WScbPvO+3V/Flchg9yDIyWmFA7YkHNwMODAJGgBORxULu
	xK0sdp2ejXtEyoYbzSX4xeeCMwpxTvi8i4MjO2xyzcSb9rZ07Sd8s3ChklUUwhTZdizYr
X-Gm-Gg: AYBFou2XSt/9piY10eOMm5B1bW97HB4IgCxrfUn0e1ioGQWtBS4W1lpx1OVSl/IMQxJ
	nAFPGSq1koX4FcptrtHlR7jrudIUT4srl1AbEaYAygucK459zgyIZKknrQy4uRgtuHUeIbBTDgH
	GeT0T4MoHrhzHm7+EDyGglOdDsTYPv42cLsSDdXfBSBVu8BpBzCQPF2JDeplTcyYod3DVF0rp2b
	GwUrMT7phbHrxIOlbGnASfFyidj/LlATN5jnDssqg3ZtwTp1IP59FJt+9Pat+tiQ1/sj96s/F0c
	icd9THUaf1c091IWoJJlIlY8WAjP6GxpXH2LTORixoAOlbxgg6aIYw5WBKddc9x+dXR1vs0Kp3B
	YR6OaOl8Vn9famXgmGCShxQy2/FUvUFtxq1FlN+zQTxGNh4CsAyryJYW5DS9dI82MzVMwUo2AIT
	1ya81MNhGOm39zvcE=
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr11293416eec.21.1793437249109;
        Sat, 31 Oct 2026 02:00:49 -0700 (PDT)
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr11293357eec.21.1793437248425;
        Sat, 31 Oct 2026 02:00:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm14573186eec.6.2026.10.31.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:00:48 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:00:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWuOmzGjuT9Zjmd@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RJfKTarAzN08SEe07fvKh3pCXZPtXpRO
X-Proofpoint-GUID: RJfKTarAzN08SEe07fvKh3pCXZPtXpRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXyp02rNHW7+OQ
 RqnuY2a+oKixAUYFkBqfBEqDLylRRjAPTRGssAsowh4owqY5BsGU1ccPxWllhA/kgQAcKBRywKF
 RNuhTBNYMO2zZzIyCirWd8ctKh/xVWIYprGbClUNeejyNliRiTxbzkFybQ4ree6NjJ3Cg9iboEV
 8Pwads4j97pLpx+JpGdQJNVgtJc5EaqjWyTkbxjUJu+Fr28W415PthtbawM3xlYEkSslqSwtg9U
 M2zOgVldYI887XXN+5eOfLIp6uGBIoIkUMBSabEbpYX+gpJl3OowCuXb/k4nVnNRsVcwNOgICns
 QQpdP9wE1RMz9X05v8LQkD/YGNg0SH9ucq5UiVOBzrZs7LRJX0Z7zTbgYeq9oOpaOqyEQp6GpMy
 xV0Esd3O+JNvcuGQePKL+ezfQJUbyCj0msDR5dTXgd3QOgNCYeyexU3wpQWxa1TZhrIh+8Wm9m0
 QMEtsEEx0/dg4QrSzoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXy/u+Ko1j44O3
 DjKlM2IIeEYA71ioIdRv5z9L9wEMevWTAf7s1Nf4+tMYFdwD66Bmw9S1MCT3XlzG7oX2BXiY0T6
 DpR5GjUpKuH6LpwOBwQMPat/9gilZvM=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5ae42 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ht1BiLNV8k9JpZ-vTNMA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Tue, Oct 20, 2026 at 02:14:46PM +0200, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> 
> [...]
> 
> > +&firmware {
> > +	scm {
> > +		memory-region = <&tz_ffi_mem>;
> > +	};
> 
> SCM should have its own label since it's an existing node
> 
> [...]
> 
> > +&qupv3_id_0 {
> > +	compatible = "qcom,sa8255p-geni-se-qup";
> > +
> > +	i2c0: i2c@980000 {
> 
> Likewise all of these

Yes, I should have done it like what we did on Nord.

> 
> [...]
> 
> > +	cma: linux,cma {
> > +		compatible = "shared-dma-pool";
> > +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> > +		reusable;
> > +		alignment = <0x0 0x400000>;
> > +		size = <0x0 0x2000000>;
> > +		linux,cma-default;
> 
> What's the nonobvious reason for this?

I will drop it.

Shawn
