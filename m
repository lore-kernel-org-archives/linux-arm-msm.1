Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1474457A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317712; cv=none; b=gTqng6RHjxmcFT1N5v3GWphkXLK2fhsf/ZYeG3XgwyKgHLYJxRUyYpxcHl0j1D0ttQepnzt6nmuqqHkMFoQAHvAmQxnUFMRORfLn6b/0tOkHRLPG02i76+DdQ3ZxZ4d1OACuGZIXD3nt5UzWx/M7za3aNTu+CbC7sRzN8TpDrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317712; c=relaxed/simple;
	bh=gUAg+DD0KaHOsFRq4/7kFj5VC/oamgCFk3ts8c7doFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5/WxyEKWIRVXO3WX9p2KP3t3ROo/EbaYGZWf9+qg8MZxBe02y3J3MsFi/R638jDEtSiLlQJSMuD9STkY3u3Hcn6LWoNDCaByryIr8qcK29zriYnoj4EdIeBL3hAyoEst5m7pbFpUTJD7aDgUrT43APBI0lBzvaP0BzUVV4UPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHVBdnyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajZdl+DV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHVBdnyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajZdl+DV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fTKY2327966
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSTtkZvwveJDCCpOzg4zgb4mS/QvLkyal6y+qXozD2Y=; b=fHVBdnyCizBDqg8A
	ujQEp4EBS3XyFM35mlNNmZvPzWc8t9H17BRb/JCM/7sqSaFTnS/kJr+tZ5sNvbfc
	3KRT5qBXBuIXztRdFAGQsNz8HGqrsFQ+MpAStlMM3y8fKkh6S04KT+luE3Gw6RKF
	VJC0LP5zrIdO2TBzBYbly01Tp41xNMiArWh92TJMNFd7xmfh06K4E73yeul210VP
	PTpYA8VwkolQ2vkllJHaINmmIxRv7U0YrHWL3Dvl2lkC50y8u2pTv14a7gvwumkJ
	5QmMOePHWTG0NfPNLQtrPpbNaTHN1IAUYQTFpTu3pSfcNZ98m/dTeO1wJRQuaGlb
	MRz1Cg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1gx52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso2198771cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317709; x=1785922509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSTtkZvwveJDCCpOzg4zgb4mS/QvLkyal6y+qXozD2Y=;
        b=ajZdl+DVwOdYVXBoB1TkcF6Z29nTc20ViPkuRg7aUaiLsYhYOAKRZr52LNxCleYzpe
         KnwU5bj5/ZrxzGPyV3in0th9921ABOkSDq6lMKTxE/FzKBgJmImxBRr79pmt0iENRQC3
         msCkgbda8UZYkQB96CtdELoPLSqY4aS3U3xIVozvYPfdffa6tu85Hbxh1+XXS2tEnkZj
         amfNrJ6SmIzzTtSuKlfQij7K3y7+Vee7+hO5XuZ2u8Hiy/AvSRbOybR8IKHNXr5I2dnq
         Ls6lQRaxxEVCguAH9cDgxoT5gThbhcLqpury+47AyUmBE0j2m2mV9fPUMolYfnj2LwaC
         gEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317709; x=1785922509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSTtkZvwveJDCCpOzg4zgb4mS/QvLkyal6y+qXozD2Y=;
        b=Lmdmf9quNT08+QWxGGFeE1Xnb4YRWzKTfdlKhRsj18zOsW8V4H++/1CMEDNqZjOlmM
         wNsYiLjY6COyEB0DD3FTTDTxFj3/m4dpLVpyJZhgBzk+aRlxgmycR1ZGPtGXMXe/bdv9
         5u95tuBNFPRSlq4EJGWOpmd2rrR3mUrShNJ6MKvKlkucVr6stwCg6IPrTCr/1hhFbfHq
         fHh833xP3+hiZ/6V5usDwM8+vDoob0h9CxlrEwLluVKwqx9T1XeU34DM0u1s8SMG9zl2
         2/arzsoMknEDrdneM7JtQYdoGqjabJoKTNFAe/nH9nnPZfh9GG9POkNpT9r3D9QiGMSK
         DICg==
X-Gm-Message-State: AOJu0YzHQEos74MS7WH1qxxuoDC2YCZ/ltD4nlwDxKHYpzmdsoFnBOJ1
	RrNlu+zWvfXHePJOcV9prF1jL7qgF6G/Kms3icnmklsC/JBQ3ApwZJjbtz9yJgWUDlHyVTTM7AC
	hFYIPqwH5m0OmwQZLk60MR2hADy4hY4Ds2oMtP6hFCso4jS6d866ny2f9fn3/cdN+yoYS
X-Gm-Gg: AR+sD11xIp5lCyBQm0L73mKUCKrXmT0KpFjyrenUXKkFNKqHoyf1iOSAHQa6vnXCg0W
	OV9PupbdPXZl/IdHAC6DSUk0kuOJbkpwW070PoKQ1oBVuCI3mo87v9xj4+0dnkPi0iH/yK/Z2+8
	nHIqLUx7RA2DgdCwU6fyJEF7qO6nNXLInuNFZQNxs0vNjHlZPUfQyhhfBAYMHhV4Ya8dS0Xie14
	50eO6qbX32ylYm/FwEr3NdpsoHuOAqNIckWajNtlKszyOt37MdjFUEqakLsew9DWLHuRHFWqUcy
	6N5IF5G/y5YbzGrKs05crdBIY6EAH6rqEojxZ8F1iCe2kaNTSNgHRtuLZKZcgGlbUDjRi0LBsfd
	o5QjK+QxGEAme0Fv3d6KIpr1X
X-Received: by 2002:a05:620a:a21c:b0:931:10e:befe with SMTP id af79cd13be357-933024869bamr417313885a.0.1785317708786;
        Wed, 29 Jul 2026 02:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:a21c:b0:931:10e:befe with SMTP id af79cd13be357-933024869bamr417309785a.0.1785317708225;
        Wed, 29 Jul 2026 02:35:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fabc2fsm87620566b.50.2026.07.29.02.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:35:07 -0700 (PDT)
Message-ID: <bb3ff752-7e85-40c2-b9ae-4f32469f1c48@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:35:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
 <20260723121516.2341900-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723121516.2341900-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX8i41EkJDTGVs
 iekONLwpNMLZsu0wNDqvOB5lLKJGff2JEjvLFbpeqLUqS9ZnskLxewDckvcMfFQ8zFohqdMXqeD
 z3vnxnwMH2VGM5r4Yc2lWeaJM6HV0nb9VlSYU5TVAb46q4nCf8d8GQRbQs7hPZgK6kUxkdaU8Bz
 X1aLDbiXRkZDtdXTefPOnxYbfkJzNSSytyS0iIWrlOzs8OL7AlZy3fm+NW6N1Y4vnL9fGO1fYmD
 gSsOTpo6rE8p3YmZ7OaPiC0aATf7NvtNeRM8q+SoLHFiuLKbbF7jppJgphZaBEYimSOaou2cf2s
 8Lxb2H1kE/ITjHoPvdX5AhpmtRtWq5dmj7VEaypJ2YlGt6b9GkmVHWKtuacwwt7Zt2Hbbc5XmHc
 xaqd+BhVMi1E9PyzOTrOEd3nnVDce8KVaoxqPDmfK18Rkkt2ekyD/S95IiFQvJetqd3EI4AmoNo
 Aiev2KofR+xVst0Pi8A==
X-Proofpoint-GUID: datgA1H2k-4JiMTairn_Qb6utGvNMuo9
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69c94d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i1AF-yj2SoNdfRuAw8sA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: datgA1H2k-4JiMTairn_Qb6utGvNMuo9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX2DW06DZmQYyx
 /9vYr1tqfJBYul1mDJYsbFY3OuBwXH/XHlMDMBcxKukvdKuc8HhY7YFp+Uv7lDfivT13jWnvEjB
 EOQ+nKtV9uhC45EfDF+vMhD/KofHQpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290078

On 7/23/26 2:15 PM, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
> 
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
