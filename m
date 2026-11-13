Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557444;
	b=ZpMqza9Ckx/G10keQqM7aE5TjFlE1StQUHSl62usmO+oTPIboawbAQQoTZYEs4rlYQMj
	 JX5kThlypNZFtJN+fQbn7/XWrCl2GnDjQLS9tx4E6CZgVgSgg1bCCLLeLzZDFXMg/tt/g
	 7Z8N6DspHZTqaWpLPIJjj+k0PyM2AmH5uIaazKLhGTMidsQabFYluF4hG7kr6NfF+yube
	 GUqQQPeKxhR2wtcuBBZazFS4qW+6j3LbTpexP2cBCEgUVoE9bYyFVUvJzwlG1LM6tdC3E
	 1j4TraiMHmcE0QMzDz3UpHCIhIzl3QyzUyO+Kon5oaiZPK7/LzCrPExl75UpuczPeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=;
	b=lp+DMM+6x8BwtqY5CONdmAQhGTwEj9Ksw+XkO6O6EctjBL2K9R+BmoYWla0JE5yVzGeW
	 ZiVMjTjo9lNWZpfB7wPleJTW7iYhuXOONBbWbKB7yQy1zzSynIbKYBxcO0rkDgTY2N3Tj
	 CECICYuzuSlWI69/f1d83jXw8AwPb9gjsyASADJ9YPauQD8dUCmim6RgKgrAtOqDNDDH4
	 cdb/27rATZoczIjJGN2/CaCKzW2jvtKBiVSzOLVjFCJl924xJccL8o2N/xZwgYx6obdjX
	 eHgJmVO1r2tPnwQEQU1FE2yzZ62IYZ9V6QbZ2Nc9VWBoJ5PCLv+E85YjtesBMb2f6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clF4GZTS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivA3h2yo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C71606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clF4GZTS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivA3h2yo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576YX073403
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=; b=clF4GZTSQMnnnlHj
	rvaueyze+72YQs0su5P33jRNJaNbdBMJPymz3OMFesLqt4GddP6o7wyhaLG43wog
	h6hg2DA61yMeVm/+Ys2nqkZHilKvY4E3OyD1y74AcFI3e84YJ/ynvx3Foph6B6wX
	XvxhfhV/LS4otqw7WbWnsx7QCbr0OI29GhlFC+5XUnl/+e8QTDVskH/bxiSmlyek
	vMgw+1DKamWz6zmGXgtZ+ErL0iZ1K4FYbPZ5lPEo7ToanO+2veNf6rd93z5Klz2n
	AIdx7EoiEkBfsbctuxMuaewY6yXRunu4hk1PhmV400imBHRN4bw5MlhzD+J6IH5p
	IVC40g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs044w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:10:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso11791985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557442; x=1795162242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=;
        b=ivA3h2yoWFp61R1pRhCJK4apnjEQz7JYN2n9Ui3cbXv8oC/r8JKcDsbs5ZajB5MtkR
         LiBDKrWyMqoPSuaz7y1gjJ2tqslFiZGuT6Erf50aAtWjjzgtRH5T/Yp/Qp1pcGuBWytP
         VcsNYcYlklR4OJY5jFvXij+bsn3bNXCFsvj7IfPbn8EmC4KISgwp1JmfuYssF0v4s3Eq
         t2js+rZbINspFmNJVQfwj8VOaXP5Vy7qnJ3oeGTlhXIsZX1GUYDoWsyB1JuW8MtQce0/
         jg4lyWLUfnuhbJCBlwWOHP0BTS4Ce3DfJIREIzLSXnFDg5c9IUC+I2QfiZ8tIbePu0E4
         Sssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557442; x=1795162242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=;
        b=iq9RMMLXcUMTbeGMxbY4Fby4Yrn1R9Harehjtwltlqv1vfVprVnUo/Oyldu7ZGLU2/
         lP1MgeYSr1ysRQq82g0BPyLHAH/Op9fG2Su7dSc6jTM38qOQowqlkwPetity6CqYQIlJ
         DGNFhVd/jHvmB76Lk/j+GayUl3YkFU40jQJj33j7Y4THNY7GJP0m+J3xVlN0uxCeI1O8
         zWAG0GuB3G+cLUAiwPMoJT3yMxMDYVXeFqlqlW4u49EpET2J1nol07nL4RLOMXJ+XgGy
         aBB/cQwtkRkjHXeaQ8BwL4nD9/bM2uOb9Z14WrfymmzomA6tyT3pccmRf2jxU2CNQIT2
         P+7g==
X-Gm-Message-State: APuU4Z8ohrYxOT9xhM81K6bOg8dQk6MiEHPjHdss/qmRbaaU2vuUBkEt
	Zi+NgQDBtTbzlJAROEvxAW4uPQlocKCJ+SiGmS9YUHRu//nwcnd+w6rL0plRY4Dc3SVNujAk8ND
	NgSz8ERUPfUyrChBvZeOibEjkxJzzJ/KXaVAY91NcYArWxAW2K3GCJ3FxNMNuyKTh5NI/
X-Gm-Gg: AYBFou0118Xnf0m94FR8OFir5AIm6QAhWLjdnGqJgSafOWAeh7rFLedNE+y1pRxL8rk
	VkTABtjFvuvVSMqsbfRlRQPzJY4DQ9NvvPUi+8KLlJUKux1sbQJkRuUlT4JndnDPOE4y7OYx2el
	c/Z7YAFEqozyMVg+G4s8MmhqNBGv73bpgH7j/K/ZODrrdMOz7jI8ilTW29seEqN1R1Xrpxmh336
	sdFCfCkqUMhoP1Hdd4mcUvnjdemIq71ty14TZpupflUdb9igdE8qJ7I3NHPLElmhffWHZUUnZwR
	YOXBU/KA5BWlEG1VYFeSsxuKaAEy7do+Eizmbl0BZ3TbVBps8wjiWl3sgVFuxW2Ss0Dpis5B1lR
	PjBnV9wqOjCyZ5+XfSYv/tMyYsiU9qkWvrNdSeQ0RbvpFfSrxP2Qhdh0sVHdB8XmJeGGIt9U=
X-Received: by 2002:a05:620a:a901:b0:940:f21a:eb64 with SMTP id af79cd13be357-9494bbc9f5fmr311190385a.5.1794557441728;
        Fri, 13 Nov 2026 00:10:41 -0800 (PST)
X-Received: by 2002:a05:620a:a901:b0:940:f21a:eb64 with SMTP id af79cd13be357-9494bbc9f5fmr311188285a.5.1794557441277;
        Fri, 13 Nov 2026 00:10:41 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm665856a12.9.2026.11.13.00.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:10:40 -0800 (PST)
Message-ID: <49cb1c4f-b3ab-4eeb-a5ca-156174b47e3b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:10:37 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
 <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfXwXoFMeWUt1ea
 WSZufIMcoN2NyJ6ZwIfUh8bahAzXWbXKQpLZkVmYr2LYZ7KVRWunXUFCGjVB4AeK/G3mQTLdBZ+
 qL6bOO3XL8/7hAx+ydUywu8r8hjgmNnbcyJQTivvfFxaHd0kWguGs76hI0i153F8HvA4UCoDJAf
 2b8CTzJa4AoZ3IgkxuMnzCokCBTEQEjEm8V+xfOttiQUsM+aXr8IKmD1LNsx4yad2LomeP8CFZO
 M6cG+nQxSZ7HA5xeifUf5ABotmuuXqhADXeYxYjsOWfRqfhPkCIt13+A+bfNtwxklcimYCfimhm
 zqAmJsEq4nINjt/od6XtsStQC5wbtXuwj75N75pzJWiwipThUVMQ6bO41a6r/CSbUgyMcMGVbjA
 WPMR02FnEahrzOAnOWkVLU1uAUac1Y7CWPqvIBZsY0eleh7WSMeAFjc0LQ9xNiJR8DPSwmr0M0H
 /0/JuskiNhzMkMBfkfQ==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6c602 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4f6XPtioFS1sYp0_hX4A:9 a=QEXdDO2ut3YA:10
 a=V6H6X79w_kwA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX6YwDeCuDMJCg
 VRHGBntJWgtJAFiDXm15Cs2DClTNK/FcKU6icpxDbLT00qldPtb8WTCekyKYyfE8DlO/7PJaoud
 +/CX9ZibBA+Jfiog9xuWCMOz48+cNSI=
X-Proofpoint-GUID: 59CaAkMTJoJwgIkosfdYANFHEBSMsF7l
X-Proofpoint-ORIG-GUID: 59CaAkMTJoJwgIkosfdYANFHEBSMsF7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/8/26 6:54 AM, Stanislav Aleksandrov wrote:
> Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
