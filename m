Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E3389118
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376422; cv=none; b=e7YR/CMIV8vZXDj0EunGDVM3cr9aKloHT2i0MUi1AF4oM4gRLKUL9DIhl9XrXFasV6unbmCQzITe6Dn8LNX05uZN0Uzs93jd60RAZhHlMg+45FKAHbRn2Q6D7z0nm2jp2xC3Bb0PHORXsj5twHg1vpjW3TkVe5j7kyJmqI4BVe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376422; c=relaxed/simple;
	bh=HfYWMsh73JSum1E9ZEMttJhbkhJMHsC4TIgPRRw0ArA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARrjUWCKyRjgVpUqgm2NtNJ17FlTZBgBmT2DkQQE6THclaK0e7B9FzkAfvPgp50A2oV0dQ2HGzF7VK5/Xk+7fvTaeKYtB9n9U3+5Y0qzrFFyAuPU8n0IB130uLPZN6mJafUI3/uzEAc9HbLBVv1jhDcbm8/gwQU2I/FJsvz3rUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYsjriPY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j869+nt+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYsjriPY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j869+nt+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2Lk3902237
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=; b=kYsjriPYaxGJCaH5
	FL9ldMSdA0OecdkhiEF1wlTQWGZAr1ocSCDec0qLn2++lW5cFZwSc+Pw4CUXkITk
	IY7+xH4+ivz/rmB6XUMgAzNDZvMFNxhqqO4P1NVXJ+2ot2azOXME7yw2GDR491e4
	ly6YLMuS2YEj/EvoHPDEGaS7nGkGjflCEJ0dUmazOhnBQ4I47FbrXELySnuT9ltz
	wkm1pGLo4X+7nk7z8mzwe/QD14rGBJbhLohlQHCV2/xIzh/ljj4LbEk0Fq4CUKzV
	kDLFhp+R4NWjFSUwtpXqMV5P3SsAAJR7Mp1PQ39Nm6z+rsNasLo/AUWL8PFyGcRp
	ckxA6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5ty9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:00:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so52991385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376415; x=1789981215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=;
        b=j869+nt+itXomH+E3WT3NCG2rvjy5WkhRFvL9fBTA94CYEXfzQ7SMl4GKDqTVQpiha
         hMw7bmrQpOMoWlqo9fM3YhmiqahUcB/JdkOH/fW8DvjZOy4E48tZiL48i05tE0YC1PmB
         Rz9NXLhVumzbAFf+sJFEph+2OnomSXkfVs4bg+e4ks/POIN6/NLfn+mjxyxZ1nplEQba
         Y6QSvb+esZtKZ7sshR2dn0M7ui94eG1SoTEP5j8jc1/K4Ak4KTDafnnD9zTF4KxB3SP0
         ecKwNT7ersv4wdVwwKqj/NzpH1Vk+hJyT2sg1ZK2NPuW11G0C6RRtgBN2aW5g0o69yi+
         he0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376415; x=1789981215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=;
        b=e83LwY/DjkVBzw5bqgjZgD7hi+/ag9JwdiIwfjnFaxdmchL/CLDZa+wQq89hjwnh0O
         OENJUmgpT2QsMBKJ6nono9PhNs8IzOqsDgUSnMPQ7Jw+PdIyre1wj458ODf2BJNRUtK7
         bPmCszP1D++typP+ZPz48dpfXeBBKFimwMJmtWbnIB/AP9Zrf3rycQI0819Ce3Q1lcUz
         L/S5nACjbrzyUBbkEKf40EM9Cw1jMu2UBn0Dawd2Gs5lwxr3ZOFZR/VFzQGxysNF4l/F
         UonxDmejME15CPq8zcc6Cq3yVM3yx+lffIA/p/Lbaht0j7K8ybij5SFU/x+nzFL+vj58
         y93g==
X-Forwarded-Encrypted: i=1; AKwUvBwxUMFOJFoj4rQGhlC2JKODE5TOJzlq/7XlCeo9KsIqJ+5l1gylm7jw/YpteYS4YQRQWbDwXNu+J5xPP2l9@vger.kernel.org
X-Gm-Message-State: AFuF++kD1CTbia8Gsk67jWQamEE5rtNRatJPzFoOqjCXqJ52W8KLG8Jo
	c5kO3KzMeXAjfUmM697BXZPOxOrvCziOtzJnQQtyc+pDWAdp1cP3hzGta2Ew7dadQvZM/vThMXh
	yNVPNddylVR216b7gIF9tT4OmfyJNuw4sHJMfXotQ6l1QuoTmYes4k3u1TMIXfKTBaSZs
X-Gm-Gg: AYBFou2fHwQ/7VCd+hP/OTSZ8Og0EU28jd+d4XKkB8vI7/K5xdqLnEo0LN2aG9uJDSb
	8qexQidnEVb+okNPoyiDhxVYUpo9jefscF95xW1wzM2TkH3O/vCJruYyDkc3WBRDry98XO2BAaz
	2UwikWd1Dl0frHE/zy2uQgDUkRk5xb2xyepqLlANVdCW+SkgEqZyksLUvLttPuEncTzXlrD2kyP
	mh+8J88MfLZNKqz1uKkOQP8llZmBLvhjvKLsDbBuHjLNQQ3IrHZYkqI4JGt+s9IrICD5uTYuLsE
	6t9uOM98Ie7RJjEI+LDZHgAx1jK8bs3qru3FrKEoOOKqUsN7XK9X/SFWuC5qXUj1cmJI+Yf1LJw
	NEtRzcFt4iRjOegNLNdiReg==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr179417185a.5.1789376415222;
        Mon, 14 Sep 2026 02:00:15 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr179409185a.5.1789376414497;
        Mon, 14 Sep 2026 02:00:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b75sm397728866b.29.2026.09.14.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:00:13 -0700 (PDT)
Message-ID: <376996a2-358e-439f-8461-1981c43df671@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:00:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: nord: Add gpr node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX7+nqKX+Yol2F
 uVrFkhWixybnmq3GnAjEWlR2pNsBwoyZC3oKPBfGTrIdcT4YKakaTTT4jTt08n7zH7mrQau6uMz
 agwOg3ma4K8xy/c/nx3pyNa4g5pTP44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfXwJB1twXpFTPz
 +1MnYA1qtIDHH0R8N3+/f5ZANYocFV73gDPCqBPoBvOPolv+vj3v5yBAPc5f+hdkM3f3OXG45cj
 7dpIQG3Q9ahYQHKjRMuknTgTIqCsOFRObFkqCKbnjdGvbfsivHxyCZTC1bzNZwgwEUzz9UqVcE4
 jiqe/rRC4sCRTX9rK0EZAi6oToDxvART3rRczDIT8LmuGsQpIlxPGvPDAibJJ9W0fW3fVMOVYEA
 fYqi2bY43wHuI6YuRo68UZGEapwfc8DLlF1/bZDKm3jCn3pBZIHmLM4euopRhSweulWK6XyWYjK
 wjg3H2xf52zXOOOwwqulVgis2yl3LpW8emSxgZbY58r3rGpDUw5GpxA3JyEIxQ+bxrZSkm/dO8k
 XnJy6ZwCThusHOZq3QYUGaL1H1PfiV1UQH29tLpxCtklo2rCaO/5MdxK7qbIWucmbMMlxIOxJPy
 UEA6w3iRyeAzVYF1QWQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7b7a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CE-yOWVe1Lv3fcLDAawA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tm2O6GKJdCfgOG25qxYsQ7sYxIeYwQuk
X-Proofpoint-GUID: tm2O6GKJdCfgOG25qxYsQ7sYxIeYwQuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140128

On 9/14/26 4:40 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.

[...]

> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu_0 0x09E1 0x0400>;

Please consistently use lowercase hex

Konrad
