Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556334;
	b=L5V1ruk71fwt1+p9Il1Czy8JyZ8ZNeXxJh1QuMSh3+HLbjCROAtUWSHPMmdNLYVG1Vtm
	 Di6XUXiDnmjb3lygBcUIMwPS2eKfRZknxh5GBIoD0z6Do7r/9ZXb4qrtz0e051ZAy0gbl
	 MVuiMiulFLYQGAblTDpxuQkhIRhEe054Vwta1NTahVrjp/ygv0zV5nVZlpQvpbPZ3iYLN
	 OxT9deS+NnaeeSHw8ZH+8mpOH5SvCz8wgqINFI07V5lp6cOx+mfTx15PGAyanYfTi0w3F
	 recZDY90Cn/78G4npbZ6VRX+dmeUTInf5KwKUCko5Bts1cJdtQiBDff15vIQlrlX+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
	b=V/lgJde0h9q8a1mPAIJ+ASrYKrZMMIFZNuFxqqJPoOZvOl+q9zXbVo61jbdTF4C1XPCa
	 Vplmx6ChGt7325HRNP27vgCjSYs2GVhjNEKsjgiZupyDAP99rw+rpYWWwnpD57kUy8Nqx
	 N01dbi3HRI24twzH2SMum9ipRyjWdm4PL9PPAKE8CfMq+BfsWJtT+Q+QFSwueCFC0x9DP
	 CmRWt/qWFHqndxkv+U+JQE6wPjBTGFwCKzFdxA8NA/jBuS9LKrm9SpNHXqVegyldDAYdz
	 Dx0CIFwTvWXK27gBLMi1jsjR8dS2i4hOI61x+ykuhPlqGzMngo1m47Bgg+2z7VkTjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeMbwW9p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21345606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 07:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21345606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeMbwW9p
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56vdO2618498
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=; b=MZuOW4sg5PQHC5L2
	4VDBN9eTZKi8L74ybienDF5TNJYsIHiHGcUYzmDmJ/npqbJLtLd+yWLbWxc9qfE2
	1BnXTMbpxk4+SGrznbWAdDAzTZxA9/EQbO2GjkPP5oMgfXDW66ah6F5t3EcDnL1v
	eY15eOIMffTxDHq4/8sM8L7HrCM2KO9YreYQ1vs6t2YydhbsDYNIiEZdCo81NPeF
	+5tneyhCZWgyz/GpPSJrDyIahyK6n4lfcWwyLcqYRLKLfZI/W99PEBvAVNEVHDof
	06v7fWDexadkbKXZL25ieiexSxIowDHbmg+aNLi5UCeG3AnLGMyqz5tcMQbxwaG1
	VUaf0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mrs2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso1625061cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 23:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556332; x=1795161132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=ZeMbwW9pA1nkAHS75gmmJ1IYp6Wu+u7m38yLOoDJ6IbLa2fS2Nj+H1AkBmAavGn852
         VQ0u2H5Gh2e+Y50DbyOQ0fh5bx9jRbyfGkm+seu1vj4VR2Z+MOzwlr6QEGgX4zoKI31X
         hzYv0/596cL63L4I6vQMHy5xe9Oph/BsHIQJz1/4G8AlxGXrWLd2NNbVll5naEIuE/YG
         gtLmdNWlTlkpnI1h+mSfE07g8DjaYHJEjAwa+Ftic8Fh5+kLmfgUUVCtpmbFrT2cYocV
         91HV12TytzsprRLcUYmYth1S/PVSdsC47FBveYUpxZmpd/tjFF67YL80b23nse4XGgIZ
         LhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556332; x=1795161132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=VxFQvKDDn1ecGkGfRKi1cGY2QvxXwIhSE+HfzgB7uzlkDO4VZ+irlYdQDl8osyC+Pw
         WX1KSJmcJQC5/PHWxvn+ictDuKD7zSe2G8szC73E9D7tjTJsSORjk8Ua8IMO0d9uMgSd
         MqvnE0nBo/G/T/1Nz6q7GnZRL+twyVpILZTWn1gK497720qZknnbtE279IglYQWgwH7Y
         Veo5QI/kZGEX6RZi9YUkig6oILl4dfwj3ASNwOGjy1Kkg5XzpSK/pxibAxWKJIe5Fg4z
         QpMrPllvFxyDg12je7+eJvDY6pBAULTgVZhEUhOcJMMWG9ebSAVw+JzZXibOko+ZIWYz
         PA7Q==
X-Forwarded-Encrypted: i=1; AL+hErFyFsV3cAz+Kfc7YmPq7dNR656GxGtMGeO9ppyBas94FzGOrghis04WjE1VTztEGx30S28KLpGea5z2eEWn@vger.kernel.org
X-Gm-Message-State: APuU4Z+HuOgFmbJIEcDUYp0X2A0OeCtkwqMU+If+j5inKkcsbe1U/SBe
	ak16Ul8X4ns2Cy8UtsqtHY119PVknY2s7sTGGhrAUmaEPP8Z9yKfoeZyN+JA/sSLMI4P2XNd7zo
	CdiJteqfp5j0RLzND7vH5jXCu1A1/ZmgalVfLRvrlNdQufkzSjqB1o84KE+ciivZeof3y
X-Gm-Gg: AYBFou1PSwveOgq3TdLPn7V467iEOguywH+PAw+ScHgSXVp0R0yDZnurEeIQQDz4rtM
	eKI/kCs5SvcsjmyhqeZK4olytSgbmlHvYoQnXLpBOgYoyqUl5pcshiOvxT3ZN8lyGNXiRYltU40
	/HyX/ITUplH9WrSlpt1U49oIvOj2YIPFCBZNlMImYkEHcTNQ8iZJcEYdWxxS1Z9+bax8p+Szzjd
	Si1CnDNWe5wMns6fMo+BBDZIWkFZAbQTCBTPzQ90NeNWyP3Yi2cgNsHSOGsdFE76UseqhL2z3HM
	t98naL3qUphldCV9ZV9lbUnCuoSDV8aanPh+isTUgXZv11AFbCpbSO99730kbbcW1S4hmbG+jiT
	nfNX6HaCcYKFp4Pa/nLmEy8UCOTedrs+HeXhMYprdQCQQ15e+YqwsAiB5lteABi5H2NZZ7LQ=
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539491cf.3.1794556332232;
        Thu, 12 Nov 2026 23:52:12 -0800 (PST)
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539171cf.3.1794556331625;
        Thu, 12 Nov 2026 23:52:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236a6sm61945566b.28.2026.11.12.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:52:10 -0800 (PST)
Message-ID: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 08:52:08 +0100
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
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L2OP5kLoiehzbEmC8y71Ik4O0e7SZraA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX2VBHTcyKT9kD
 IIW55eOw0pPDvtiwqAUkPiyLJKpY61EfHLGLpdSMJDs7NQiwGQBqiBIY/5L17FgBVD5imjKEiLL
 g9o4u+h9Pra6Aniy0JcSZkPjHOcgZVOiIq29ueYJCYt2AppPMDCfFc0uO29o5/g2N9IdutrTnbq
 B6ff608+k0C+Ciwf7AQX7ig4v6pw4mcEQ//kP4TJE/c36ublO36a29B0TcgDjTY3jvgkBy81qKp
 jetEOaB5uQRsJ/1f0QxjG8en6MGJQ1XLIzPTdJcxa48dKiN45Bb90ZUEk15LieMtDCgYMcaT4Pj
 X1OmKnk4rAKlSnYOWQOo3hIspKGUMsupHlhvAiWvGLqD/LMw8llOFNlT0/D98hjvpFjWNLRfLpB
 7K3EzwZLkci1EZ1TQ2eM1M1Xjy4hAN3jrR4gUu7jAH6svpJPi7WaxQvYYhFDMj8MiID0TdQueTy
 dLEiL3BLmG6K2BXpbGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXzMrkpj8ywDSa
 6Tr7wCIXF0ARwYHkjR3ykKpKXum3PsPtFOUHciaDuNICzl/n/ouPDwgu8Wj96SxOKzv5aexXSvr
 n5kDgwIXdhFa5lC3LoNXoBn8oP/Rqj8=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6c1ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KM__OpKlO_rSzR-_7FQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: L2OP5kLoiehzbEmC8y71Ik4O0e7SZraA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles, but the 
> MSM8996 SAW3 nodes are lacking one. This series adds one.
> 
> The binding should be applied with the dts changes to avoid new 
> warnings.
> 
> Rob

I know this has been a thorn in our side for a long long time.

I believe +Dmitry had recently come up with some patches to describe
it "properly" - are they any different from this series, Dmitry?

Konrad
