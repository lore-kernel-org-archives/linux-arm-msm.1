Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447399;
	b=5QeCXuDAxUfjQCyxLLFlD8pnS6aKw2B1MP5earG92gqGWWUuuhsD4rvD5aoCqajwOEab
	 Xwsf/bEm+Cqn9iNkjCaovFsahPIdwV5jVqq8l4ZIu8ThlC3xd8H0t5aHo0s60klmP5FGg
	 Q1Nt6vpEoOnji8J4x+bdLlcbgulgn56NZJCfvZgRvXOble49KaS4mrONLntzhkiWuThMn
	 X0RcbdVEaMa6it+XS98UY2fhe+/Xkit4cRVnIwkPfiTBQrRvfRqeJQLjMsLabJXPFdLPW
	 9oeYsB5oEPNtv2fidkr6YeXNfyCIvN0vQq+2oK43b3Kp9GtqRx1a5rA72Ys8oeIsD4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
	b=FSYoaUeMmaFnZ5OISEpgtotixLUj1zhAhT2sTc3N4mpzKW0R2Z67XCZYaD6l9MNUOFOp
	 M3YTxigByPy5rgY0Zxq8AYQK8bSs5tBJ47LFagQx/WmfrjffL0lYbTzyxTDrWwDclgTAx
	 yMUQE6o35fg7A//f9eAHj115NRT8w0+SigI9jIlr0VLi+hnJzXxxqs7A2uYZbyAjplXJ5
	 U7TYaoBRP9cpJsjIeEqVqYpawPLmvReemZXbvOfM5CSPh0wpzcHFrh7mhv1McbJCWvsPp
	 W45p3YQWIatJcP49dlVJ89Vrb30bf27lU32FjDBtFAoiHRNCZRVv6xK389ocKyW1gxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mGWlM/ip";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvMxHDmC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D45B606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D45B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGWlM/ip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvMxHDmC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKvOu3329315
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=; b=mGWlM/iphsIpsRJC
	BcX6tCQe7ZorvtRP0AOhW4gcjfHcYZ0JBdt3CEu1UQ5Cs/H3I/m+yCDNgGGuQ3nV
	k+IbOXudP9tQYOrgbY19ZVum5Y//wqcG4zmu1usxUxw8b57rPwWZLwEeOoO49qYE
	Z1XVgWDtwAT4KPk0E7tx1TE6QB+5WqnAIJiZIBLb1Kl9V80fU3Tx44/ULGrzOMQj
	rYcEiN7zRL3eVaKnHxzRIO4WTiHC8TTdp5ndTNt80y52bMyAH2R96sqvmgyPGInf
	pd5/63oRX1Qo8Hv/PUstT+kJc6rp+5dVc6aLnb4/jB+D9cX8NhoLr57lK7eRr6OD
	9EdKsg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd22cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d659d9d106so144903137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447398; x=1796052198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
        b=fvMxHDmCwHered/RPNTurJygkLN8Hh507+G33kgBcktZiJcYrJY1dexfGv386hlUcc
         UIlrkSdB0cum5Y5STJWHYrV88EccM6x1IF42bk90w0i2RrY8dht8YmlQ9tESPb/CQU51
         f3p9lVg9wbXDsrk5FFtJGYxNeMTzlmIRlxXrk42RpI1uhaGLAk/JZWfP7g1YuHaaYD9V
         EebOQN0skwjZA/p6aqcabjhzRRK34BIBGMbgFFS1FC12PAacZf79hYQMkAhLAGzTfeM1
         Ez0VdPdAe3g+TqTDFraeAXPtsP+tHX2+IeL+fEupRurCee+VYG6WijgiFKJAGFE01g1h
         l28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447398; x=1796052198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
        b=OlW2TmXe6xpIiixt7XBGjOBxVhhtRXb6kqW+z7FABAg+ecTF8GeYnGlyNpttRZTthz
         2YUKei8Urvb/Y3Ndlz3+uLkwLLQFwezvGUafFI15A887QgcAYR9+QFS5iSMTAa55eD3b
         p7mFBJQKilumEHU47oMIuSXYECHT7rgBLLcRxtvIaFKZZXSItL6Ub3UNZ5QFHWZz1Y0p
         Mk0pDubG84evUBNwSAo6b6z+n9iU2l6Tsl8wjm8nQ7MRwWYuvRFXRETWWIphuzrePavT
         peQG0DoZtlVPxmxsf6yLBywclXgtevH5Eryg3GiYPsl/pKstbv5XrVYco+rssVPRFlYo
         LC6A==
X-Forwarded-Encrypted: i=1; AL+hErH4HVKiuCDr33JqBaaKYEr47wxf9uKwHen/PaXi8xdYXiisxCkiOAI0i0OqEshWwOF2BavTtDR4LaiswAY2@vger.kernel.org
X-Gm-Message-State: APuU4Z/y+a//yKx2Ewt3wymkLNHnLTKxaLOjuk0HBpL7ktAB2844pb9f
	DoNYb6naA+MbyptOcWo5ehcoGj1rhf6ncOvT7WLXGpkpCou8INQFKCN+TpqKAJ8OOghBPM6dm7p
	kBmtbydep29rmfeBzj9ocdrxvO1yvOCBByMSG+Y5KNFTqNgLYjN8PVNPH4BMsxwsuwPeg
X-Gm-Gg: AZFdTZesbLgmA9n6uJKuyHpl6f8onksP4/+JloFya1FFU0cjyPM91iHPO3i+fOuH5mx
	HGxYK4fn67o9KCDTzh4aOZDkE/7OpmIInn91BpWxKggF2XqXeaTyU5QKk9rtyb/pVqkKNBaOxXI
	sa3cFoEywQzlytMEIPBHRKTDwI8f0kn0L3hhM6s3BUoSANiDYyf83RxD265zQRT5xB53OYnSibM
	V01tJgnLdBXvL2aopWYPR/0BdlC88UjNLKwNlwbsAI/weytWXa9EVrb4H6mHPyee0VZw+r70Kpk
	fQJauli6OUX48M5z5OUDxOohIXv4GNoYWe8dgazT59qnHp8aiYB5u1419HxC/TKXi47v5UTTWo+
	sjHKIhUVqlK7aDMMA+8Hp5wixpRsyJ3gec9tnpD/w1bhqkm5SF0jvdWrBiUpf2XRawzdWMiM=
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6972863e0c.1.1795447397502;
        Mon, 23 Nov 2026 07:23:17 -0800 (PST)
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6972787e0c.1.1795447396812;
        Mon, 23 Nov 2026 07:23:16 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:16 -0800 (PST)
Message-ID: <6b036f68-e2aa-44e8-a606-e4c334587666@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:13 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tkV3bVlPiSWlLigrlf4jz-YY1_Sn969L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX/tPl8xc+Rj8N
 AaDBgAQ806EXShb+t0tROmFJVtyJztfVsajojpwOVImS7qcEsbBDEOoDlDWGdCcpJsbc0NkzZ54
 NZkRcOjQvXWKXVf2uDU98QDoHh6UzQPcERrFtYRjDNT3odG9+aItbr5+05kU+sQpwMH4GgC94dd
 /0R4pG2BE/nondwBEBPu67gTABQontfUFyaIut8S8YWxrp5+z6Vl6pkKxNzq4rOFL81878VlCPR
 3MnxLzh5/qFwx1VKmBe7TnuMOZcVPfTsdbalJknKKQW86oGdlSrGmK5wKy7EoTUC2DMJ9M7tEW9
 HvRUos3W0QyQ8CpemVUOGbc9a4ibEXK3o0oXnDsAsWIAlciF8LicDWJGluDxwZ7rdXdcBojJflI
 9dPmd62UgUyPidKbTmyCzLvX/A2VZIwUt3NKZZaQGLD8TZrF1dblO1eV73J5DL8z1jPyjJxUORb
 ZELYUUDScS9f5rbAwLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX/CzpAGNS80ty
 2uop2R2mJLT5P4q/lPViNzU2MSksdtv447CJyq6RMv1dw/eSQjbhh6kFPqEk+TIllWDKHJudKFj
 ehEj8+IcpcVdVB77wp3Tw+uOdFALUjo=
X-Proofpoint-GUID: tkV3bVlPiSWlLigrlf4jz-YY1_Sn969L
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045a66 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OlIfnwjDZ2IE61P4k3wA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> The violations are seen when Linux runs at EL2 (KVM with VHE), where
> there is no stage-2 translation and the write-combined mapping takes
> effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
> as Device memory at stage-2, and the stricter stage-2 memory type
> applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
