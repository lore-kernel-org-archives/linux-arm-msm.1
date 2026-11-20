Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169046;
	b=AGjibRpO7o7zHF0GmPlrGOcr0qqGnSbwBKTejHrwP1kzOBwmnJUr3Ao35uK1W2Qsb6Cm
	 L/CO8fBjB5BuImr0OiB3LzvZyUtnd/bhYfdWq5ryN/YQM5viSaPCTijzEgNurpeJvdUI4
	 QH51kXbN5Wzjlcsb8U1uoz0sGV2GirXDgCs9DPl8XNLiXVcU/VFcUkTBdd5VdelvgJTxl
	 UsiyDjcBzzirkLU0So7FCb4PJ6dsJdPsB3XQOjnOAhnCCJYq3kjfiGWj5qNW9x+8f6mHM
	 AGPJU9RO5Op8WLVmb5nIp1uRyrb00YkW+ay+LB4/+97JR2BEl88FnaGqssYfqSTf14g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
	b=Nl66t5415m6z+3eCGgqeWBJYICyaZC+7WEDRhxO3xjx3uvb0sKDlg09aajyDd9fCRv0Y
	 6OFeeCpyi+BMwdkkO0mUxA02tKrtWk4Ubis9VI/vSLd46tTCWSJXOsDTyRYBYRjxgIxD3
	 GX5eKXd+2h27fn3x08GSTEf/nuspfhcXgUMskIdayFARA92DVapcCA08TCBTQWydAETlF
	 Z2VyH8fa4AWFnL3uSRoGA417qPIvXTOCLc0kscQt04egOFt/WqdyxvRc2aovlTL4eXzuz
	 e01HrYX5/PJx/aNQJR94dMraiYNHTZVaVX1/KQrcTgRSUywZqSxaYKXa65IMN9rUqWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVGSAI2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHj2y3RU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB740606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB740606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVGSAI2Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHj2y3RU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7er5m144592
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXNcxzw/XZ79aNJphecWCC2a
	iJVKnB4p3dOXUqbKOGM=; b=XVGSAI2Y9lu0xVYuUhtuwNE5yFeCuOpjrfxDpGQR
	Jr0yb/LpmIbzacgKDnFDaUoWzehuySC/rOqdRv7EFCTUguJ0K/KpTp1cOnPQYo+W
	4IyQjZ27SvSDfAi4EqprlOZW2Un6M4hwrt9qG9QGC+10wRSGeLIs0SEx+eKwCvxF
	yf32JVCWbvhPAdxPj16V/QeLqzEwNAHARx1VkIQBaCRGaMhr3o1L28et2yrp4tLH
	QdMAGsFCSW2VskIVolgZi6m8w/nKPDGWlqT7+ZaIu6mN8goNpcrFSdlojQuwMWtB
	p9rGR7mQZMiacyK6Mw7gKceeAgzvpkNsyWzBcf5TZbxR0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh6ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:04:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so79141385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169043; x=1795773843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
        b=jHj2y3RUqKEBd4XmzlMHklAh2e8sXGEG5i/dGI2P8aKJr8Rd7JmsUuQtPfG+Ot7PZx
         Erks4KA36xRu+wmF8oSKK2xc90AnNpklbaxsjpl1bow0dTusgOtT2cFsX/m1bYCZtdPM
         qZsAzj+pnHaiDKZ4zUbDhJSyBA9ZeFw1XIKEWoO9bilxXlOJa1Q1wJYuYWnyAQdULRba
         KE924JnA2yY8bkvO1J3gzGVNKvQQhzkW/q8aQJR0NZZ5CLMfp7bQHXYvoafoitQTH1Ia
         jLYlvJk3nkB9muwoqBKNN+pFqCm4Ytaz3p0IJytLKbXi7nZ3hAu3slY6fMDVAT9fqwYZ
         TOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169043; x=1795773843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
        b=dlgBtu783J7kZSk4kybsMPrm7fTwpDiSQLD8Q2AcSoOQaGzTO5C05i3PMLiJj+wo+X
         Aj8q3dfkCTjHsTfd2L2JXwDF1FYqPYB+lcufcuM3gDFuCm6+7Ry7CKqvQmza3DL0dn3m
         GI4leIeghxmqvRXVOUIE3kT30Xf18efOGnSvqPSMHeda5+TZITW1JSI58X/hzPFGBPk0
         5n+Z6FClgi4SjxgMd6Nz3VAP4kgyd3nGtdHtESnkAHNvMN6fBkW3m+esSvmcE9yo3BHo
         r/2dVTMa9/OoF7F7x+OO83gsCjjfIMkYM6oJyfprPAvy9VM0837T/4hF4XXgcgzhbKDW
         sktg==
X-Forwarded-Encrypted: i=1; AL+hErFYgYviSg82sq8cjdF74FO6gfYO9QNpcqfWJ7oKG+iiotI//q/LYVp0VBlvuOUGw/oFU+vLOzKuiLgu4uI5@vger.kernel.org
X-Gm-Message-State: APuU4Z+VOTJV0Qi3CdFKJeFyBgxgM3OPa82YURUh80atAm+ud/pLS1q2
	dAU4BV9XtyQ7F7lw7JVDM+y3pevnOKgzaQj+aPs+MS39qozumjw1w30QCzDXBbIqF95F/Ex07n1
	S4NPQUaJ4Vb3j2GFVNXcZ9TT4R+B206Ywth/OYTmW2O7GFxLUpZBv1l0bAv9UKOtw4nDMzSLFOh
	cf
X-Gm-Gg: AYBFou1b6fnYSL2PThuqshUCdkVjjCuWHox7EvJy/xdtLE72TiZiBzbJg1fSxXYHDtF
	j/G+1V5n1FUTPY5snZ3z+rT1Pl4PLWkXNp63KNTP7qlBVLyrUv8Vx8CItqxXD1cIP1EOALP49iG
	25kFnWIrJkV/AlZJr0NfGaL4C+lIGKvEVUeaeAoH5Emnz9ZfQACLrSxI89wWYx+bnRxZmWIjjMA
	PHqClZvHdXSk4cfimI6eVoXdsW8Z9DG0dwmKVt4UiHHxiEmanTRJlUEHoXgPxgqJE0N7ChItVfh
	ciVvVNtK/Y9I64opSJ63N9fyaofUK4tdlqq/dIy6/6bWna1x4qX+pE1Z3jX4kYsQ55AKnKc7VeF
	kHRg9lRFqcygOc8yNMD/ZYSIt0MAhu9r95Ml0rzys8EQtV7u0QwFJob1tEv0rsoX+
X-Received: by 2002:a05:620a:2401:10b0:949:c503:ce40 with SMTP id af79cd13be357-949c503d18cmr51905285a.56.1795169043220;
        Fri, 20 Nov 2026 02:04:03 -0800 (PST)
X-Received: by 2002:a05:620a:2401:10b0:949:c503:ce40 with SMTP id af79cd13be357-949c503d18cmr51901785a.56.1795169042588;
        Fri, 20 Nov 2026 02:04:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm107120085e9.15.2026.11.20.02.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:01 -0800 (PST)
Date: Fri, 20 Nov 2026 12:03:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] soc: qcom: pd-mapper: Add support for Molokai
Message-ID: <prbf6six5jwxdyz6nz2qvtvgbmrpo3wgalzxxskq6542mi7aea@fxd2xclmjgwp>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
 <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
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
In-Reply-To: <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX/ydpv8gIOJMz
 wQuWTjckZ/4C7kGbm0LoNNLD6vyk92/470HfreyvrmJviaIaRgPpd/xabNCUIGuuodezKh4Csb3
 8t+pYQgEEU38LYC7AlMjAetCehxnT5UaphaT/q0qlaTdtkb7d1t8xj5DAa9/vdZ8adnKhl3L6Ve
 ML9c9PG0zngI8vfYRKLyDcAfzIGeueAeExaRyLRF5zD3ZxBO9edJsEKJrM5Bsx/Kg63hT95MMTw
 AcLwPmBBWsdLJ/x5Qw92F6CML6bd1SBeiJmSzmrDgWroKoCfcss9gNztLEVbEZQgnrcKhBHd+I1
 AugAfP9e6whVeFmDA7rPzHxa7grsPezxOKnUfrxopJ93QMXoST0ACnG2VeYtpnmM/wXi/FdL7p8
 EjKB2CYQFkrye9H+FO+pp9mThTLBgDCxJ3Z0q3t1skAuVb+7c1eD2rd4vWdcBuuB+9AJp/gDBrK
 zcts0t/UDfuyImdrYWQ==
X-Proofpoint-GUID: 9d-EpH4VL70D60-bRRGawPU01Y65P8pC
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b001b14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1uJLEA4eyktsYfoyBTQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9d-EpH4VL70D60-bRRGawPU01Y65P8pC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXy/h884XFx5kZ
 W+5ghyj24QIyvy00zVPRfBzsqJIcPyHemt76aXQ5M0CR0KhTl1mxJ2fbt8f12zmsvLZDj1yRaPP
 mLxzvrQQu5YWOScQ4XdFP7Ia9SX7UV4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200039

On 26-11-16 13:10:03, Venkat Yadlapati wrote:
> Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.
> 
> An LLM was used to help write this commit message.

So a single line was written by LLM and then another line tells us that.

IMO, the second line is should be dropped.
