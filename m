Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601406;
	b=2q6X/XjTW8XUW0i4y1qh8DaJaSZO4OoNqhmK2lyp9LVQ0CSDiiCCsMCXmlJp4AX9Ban7
	 T35X48q/kAZfN7K2yknmHUfxGsLWnd1YnjAxeBgVgXEYlN0SU8M4DtJ9M0BbS/VgGZEIR
	 CJQvy2AbGnYr6EDMdtPCNtsIFcU/NuEHgkUE3ZYZsKr1aAnVpntxvm9zy8oa+hON2ib5r
	 eUEXTt5TcmYbXgUoA7qnQdX7EmDYFXtShmE4zVR+fqDGMW0bB8/fPyOO2J4vf2Dc9oOG+
	 JVy6s5TauHpl/LQOKyidMY31n60aXiuH0rR24o+Dyf79YxFzuwOqxG9yov3sU82KMZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
	b=x93j/nzEKVcqNJ+bsPOdhUn4IAFtPzIwEz1iww52YJ2c+Qn+rUZvueh9VN3FRtJLI8Ii
	 nF3CgRRN1akPBi5zVYG6xT6BhYcTHIAJpNn7NzDtgWQgS23k95AxKPgxBBSzX4zbfV0ls
	 gPewcv+WLsi5NsgO6uk7BgWD+G1UuX3ZeU01/A423f+O2uNsjIs6T1ySYBqygrSL/t43Y
	 GlF+FBajqVc/BjocEMbiT8MbyNQ8IRdYj4khowcRuoP+reqqoXUZPN2vcjVhliXS1ISfB
	 BPdHxPH+o0csYiQV4c6BBg04KetqGx8i0VYQLa0kKsbskqvxF50B7KpFXO0XG6wk2xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fS3u3tCB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNzFzGec;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74278606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74278606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fS3u3tCB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNzFzGec
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nkn91505215
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=; b=fS3u3tCBem8GE1mO
	zsb3vErqGs0SV7AlWHyuOCHCcD//RX8nP58id7K2s+ehYJex/U31fFH7d0kHa62U
	KkLVxXfyvK0nhEDJbZuJfrbHb+iGfODDtRlj6/CqMCs+WpUxYGSnonHaxU9pSK9i
	BJFtS3uBtSiVZqvQhWtfQe8Cbe29XpIvISv7l5qzJBX8Ld1CCEhckqSJ01Qy76hB
	10OTWRG8ALtwpT9tR4f1mqyfU+bbtQAOlPtJJawtlp/4HFGtXq+ti+pQz2UhhNQk
	A/JDmRhSvSDqdOjO5VV3QWlEQJAf6MVnnWLoU+I6tKWOnk9RUq7b4LsVMXEoHaBt
	Xi3gsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29pa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:10:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94993a54a73so50175985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601403; x=1796206203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
        b=CNzFzGecssVzC+6I2RGK7lhIART958EA+G7ZQ3YGvKrb8hxBeZYpWvCu35KeOCqZnn
         wZzruFiD0FDuoY7COPek/cSVhk0Si4T9fRtF/iG/ss2phXM1shjWKj2ApVBN/svjnU8t
         d0TNBwDIYnPyJ6wPizeSkkNitWFlP2QUkxeYGZDD7kcxn3suhZq2xP/Jz0s2n1lmf081
         BBrmPLqP2Dfattx8nPAsVHiOrx1Lz49v/QrnBpMMhT9MMxVu2cxWu1qPJlqRf3ZS92cZ
         PkvxGJeP0o5Uq0keUCJnKVdMqAEXtXI/WpjhkHCA8slesGFQJWmC+RCMEMLHIZBZ/x2u
         gu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601403; x=1796206203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
        b=1v6eTm9z0onzuqvmOIKlVpe5l2Qm0XSSpAnd7Mx428ySuB/vc20ILKRI6nAMaiUYTK
         YHJoE7eJV8nIxjqeIreJt4N1eOh3yae4riihNkTY9nA0X+7BeqPFqgCTcFJogC7ksFVW
         mWGYgf8hSVab3lMspxCFsFPRTkt9nyld69L+CRRJxwUojwMhO2QRIHmjoeqd3UOwjmQU
         y37zvRnW38V9UKrhZiL7DKdGYS3yDRFY3yeXx2U8845rIXeKsFBFE7FqVJ1O9mY0iYlT
         LVHJnoulR/ds3wGG0KjYMC0IVSMXW6ET5Jq08Fqb68M7NlpnO3jFaoaDUA3hqlioRw/R
         gBBA==
X-Gm-Message-State: APuU4Z8jp5/hyeOfXg/QVsL8jJyngEFoyRJQKcIWe3/KFtwjsCZJjAwS
	Fp4yWwmfXLXtmZe2HDfKmIqswMqKlsEgZ6aNRvnxfJJtEsJ+Ehdw/sJR8Nc5died59tI7by/vzq
	LtH7nv3OOp5wxnNlaYsVyFE1X7NS0tcAZGCst24f/gLf87kmwiSs38lst0EIN/WoivBio
X-Gm-Gg: AZFdTZc6i/+4CFwDeo0PKmGBIphp6hSdK6ntk99zv7s0nWymIrDIMif5+mU2F4Ig7tj
	WTyFlNkvMVQ+OO3Wp9XhaKZ2U5OJgO9tutZGCNBe9+B4CaD56/e6/KzbfPnWywh9hRHcLtWu2nV
	49MqbYrPXT/GLnputQX2tUphtozk0rs0PNY4iZPtzDnRYeCLBhTF8+iD2rSwkPqjx12Q09nP7pP
	tAvkWFleZjB3jJZ5ibumGarJP2Rb2rxN4QDt0R4MTOFZ2u/haVp3ffe5LUCvVyf342iJUETBnDb
	W31CcbVIKtBbRhCfQpKNnWVHlq8X4XJt+r15O31KExwTgp4TpZwayBvC9Juw20k/ruMq2oQtzcZ
	56WW0Nzlc0PAwHEBY96ouTnQpxzNUXo19DTr+q7UrvHMav6mYvmAZon7WZ/Oqn4Vcx7ikij8=
X-Received: by 2002:a05:620a:8b8b:b0:949:5a32:af48 with SMTP id af79cd13be357-949ba96eaf6mr2467778485a.3.1795601403655;
        Wed, 25 Nov 2026 02:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:8b8b:b0:949:5a32:af48 with SMTP id af79cd13be357-949ba96eaf6mr2467773485a.3.1795601403027;
        Wed, 25 Nov 2026 02:10:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb34386705sm167817a12.35.2026.11.25.02.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:10:02 -0800 (PST)
Message-ID: <3051b140-e9e6-4513-a400-d4d58be8be34@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:59 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2m5XdJ4Bipe5UfA21WHIXgTpitsGi3SM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX1LwVFMbvJFoM
 vgwXC808HY05K/qtdSHSsggd27tLHotS2sukPff4brArcEIrGn+cUYMwo+hztvkb7aZmwzk2sK8
 H/ZLbNR0J02szVXLacj54cziNqYGSj4=
X-Proofpoint-GUID: 2m5XdJ4Bipe5UfA21WHIXgTpitsGi3SM
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06b3fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rNxy-IUp7fSqA_O6V1UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX05vGyjiEtHPZ
 KuAUbNeTyxYeBt/GPesumi8bywC2/L0JD/9+74N1G4Nq06uzVmYA89VLWlqFBiILf5eEcy+Wewr
 1h8F+OuENRBEI8jZtZxgx23J3+8mc/AUf5wC9rVpj/VKarMbagVR5tg/BazfsS4938Xm+FLG+uG
 M+jxSyME5nVcZ+xi5wNVanF2XYFzH/a60RD+NN1w5UMHgwIkxhN2dfFLYTew4br0Hoa9RZjdll2
 T1SWjOHHOuSKaWhYxucLgz6FzL+Xg1Y0ESjZpUyeOU+LMxT0jT7XD6/q/YQQkae/AOHTy0wj459
 JqclxJ1aqf1VF1iN7siN86W3IR0lAJJ/DWsp6jsG0gzpnGDcax/lAN/NxTys5/zP3Ya9JbtP1PB
 foVvnOusNH+8nNXnFThrfU/XZB/ScG9vjkGpKDPHgtbRajZ1/D0GFPUsUkRruxx6VLICm+CM9XG
 oD2CWj4D4ljbR0fbtGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> Switch the node to "qcom,coresight-tnoc", "arm,primecell" so it is
> described as the Aggregator TNOC it is and is assigned a system trace ID.
> Rename the node to "tn" and use the "apb_pclk" clock name as required by
> the Aggregator TNOC binding.
> 
> The Component ID returned by the hardware is 0x00000000 instead of a
> valid AMBA Component ID, which would make the AMBA probe fail, so also add
> the "arm,primecell-periphid" property to have the AMBA bus use the
> specified peripheral ID instead of reading it from the device.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
