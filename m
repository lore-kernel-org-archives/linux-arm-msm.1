Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57F0403B13
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911551; cv=none; b=hb2pUCMQMPbs8A6rNQl0+nCzLjPW41SM1EdiYE14CuqtKxZ4/ikzAExxxgyPiy/CLlvGwamEE9K4Ta3LmiTQQElTAXTynwFIe44tCldP26PwI1QnXTqTGz+o+EKJAxjXULdQvd7sb8eifphITrPaIs4tD945B58wprFivxm0pgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911551; c=relaxed/simple;
	bh=chbugp9BbdjYfMFORTUe3BmGD+r/f6qkAKRa0fMGPDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhazdHgk4zPwVPoAowtU5ekgOSod8Fo/nnGek2JuMDAU48TS9Idrss/EwSaGoS3bLWwthiQkQ7m4NoLyet8e2O4jGxcLhZ+DZWusukjDpdB5KJTUnihHTNeSjwdXxu3zk1WgmGXggiE6fp81Z3nvhLNaU3Hw67/VhG2cAWpFVLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of57f2HI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE4kE6P2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of57f2HI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE4kE6P2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S85MNf1894870
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVOYC82fg9l28N1uNBDOjP8bWaYLW8uYJ9iMd/8YFdU=; b=of57f2HINh60/VBL
	tPHwrRpmEjeJlkbgDo9ZRCcQ4DccLWpY+HyE5Lyr13ChZKmUlhQMz+4PxrR9QcAS
	5z2MrLwbtRlHTQjlT4VIjySIKRnpNGLnxxtMqv3+RsUZ5VLYGbY1mu6u0PRw66Jj
	TLudpj3bB43AWFOuWRnTTCIKtwdRP1swmOcOEuiqcDh1/Lye8i/8nATM8QYZ/C1Q
	FuJv8ZPM72+uhWdQqzXJ/GGruWc5PubLNyluaOjNOd0/YdS/AKyTxF1/D3aGE+m0
	gIPfks3jK8fxUiUgbgb3bHZ4eXY/xEaRLAgMv8zuUt5AdWljQ3t7Rz13z6bPbcQM
	BiaPyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h00f98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:05:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so1567161cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787911548; x=1788516348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVOYC82fg9l28N1uNBDOjP8bWaYLW8uYJ9iMd/8YFdU=;
        b=TE4kE6P25AUimivHoDPJkplDRisBFAMQLdpQ0ME38iL2Tez/7IYbpdCIjxAsN6Hjsj
         OwuFmG1xcnckatErXirGUUFzCrEC2fiWGWDpbF+0oNmDeCW5DFhtgBp4swCGsrJ/cJ1O
         mh79Fi335wqKcCciAd/HRgtA6XixnA6jpLVYYnES0b/JmYRRw/GI0P+8NllhsYdFfxqK
         w7dHzzzrWnnOCac5j+S7IpIQliYGE5AvZqP/ovJtiE56YgS3c+7evYEEnBTYtYAp88hQ
         RWCIedLjXoZkO8kCpNWjmn6u9+Km1mPcV5zKKA65GaZLCrlDjlO/8j/tw/AyOrJaaxgH
         AWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911548; x=1788516348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVOYC82fg9l28N1uNBDOjP8bWaYLW8uYJ9iMd/8YFdU=;
        b=EPLYPAqtAFRFAFrhfl9S+ab7KejW0JVuJdH6JUhNXJiOx7tJPOAMPzvdmtybhjWTlL
         KHUwZlRyitAMby7dW7W6rQIy0ZvcOOkzZRJ5j/+MATV9Kif4n33GsAW1lruJ+TAlyx2R
         ZEnayFJc3pR1iyNg6mNuHBCUZ6DfJ7Q8hYgGtthLbXNHZy6gOzJaCdkyDy+flojoYiqv
         Vve2txwcVXC3yk6IR7jj7RPx4dZ43qwEqunjocc2ZQq3OdSpC8qhY7smOPpAAtnN4b3p
         cbmFUUyUlfXAR/ZGFQNjKMIFYi+wlFLZV1rCQX2HYU9wzC603K5ZkCBF+UWE9+JWY1pf
         L9lw==
X-Forwarded-Encrypted: i=1; AHgh+RokhzWJyriDe8NmFI8BXunNb/REzdsjBm0xadnaApmdoU9Yy/+7X9oB0JzlhvVHgNdabXO+NcjrZyausZTO@vger.kernel.org
X-Gm-Message-State: AFuF++kSHjKFGb4VXlGxYlQhsPwZcq1eI3sGnE+2e1DtIKFx3+OURi+s
	8USODyPuD/dNU9zsKtY9FCw3mx8WMyUDUTJzNbMG22sPxPIZbif+o6/JfB6dtO2AnZO0tfc5ekj
	c0CgOdp6KBuu413uatMATPx2m6RYsAmb2gEkpAtzn0X03ZOUJ7U0/9IadIoetdrfYsQ6G
X-Gm-Gg: AR+sD11ez6Ln0eoxMbCN67997MXVN43C0YewLS+DoNN5S74flejk7JZ04qpk2oPape8
	0hHSzaTHu6qo7WamalH0MlnwcjhDOTn1kRc8L2mZwxo3LSOL9icspAtIVSc23y1UNP5N/0BfltC
	LLIB+tFXKpUobnSY1Z1wnkkVxcy596lsErGPjWp1Q24MVznufXZfvNQkDW001YruO1DWWbf1ESd
	YGqap7zBhqBSptOtOtDKtjB1SrZjqie8FOYZu8sSS2WFFqx6ykUBqFQVkTCnq1reiKI8/NzijhS
	V6+FpcK+4oM7Xm32mrAXgcUN+14BeVUtpSuYLm/99uUIsWbbAOKJGGAA3hmTO832t/Yk8Z12swP
	7rRyIFwuHlny6hZROhv+P3/I=
X-Received: by 2002:ac8:5e08:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52fb9659843mr39871711cf.4.1787911547773;
        Fri, 28 Aug 2026 03:05:47 -0700 (PDT)
X-Received: by 2002:ac8:5e08:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52fb9659843mr39871071cf.4.1787911547200;
        Fri, 28 Aug 2026 03:05:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c3f7sm403382a12.6.2026.08.28.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:05:45 -0700 (PDT)
Message-ID: <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Lh1mEuyaGBzxKY1Yitc9t1CASRy4QW0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfXxJt8C4ev7MO9
 m0mB65sGcB6k3hRXWzzfNQy528KNXBSaQ4nldIcK4TOd67DmasiEDgVGdvFYXOnSCdQgYh3Kztz
 d3ng4xy4Ag2xyTAyARyGWLQycyjmSi8=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a915d7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p0WdMEafAAAA:8 a=G7tyanHNxTnsMBuu9n8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5Lh1mEuyaGBzxKY1Yitc9t1CASRy4QW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX4ZLsVO0uFEp0
 6BTIsehN5Dva0fPmfChH18LS2bAR1lJccwc9rlJhuYzuqOBcd5Ga0iqjYn/6w//lrUeMDFioNmA
 dzXsQaaXCOe5xU7yJ+wyJtuHX4f6AFWVJl9l8Zpjqe0K7MEq592tLYHrvqOAmTIT4gIDrBexqgn
 HeojxbJBHUNxwbslUINr/D4eJ/7u1I2iADIs8C/rSZp6VcNqY77+ocgrfd86IAw/s+Kr303iD9D
 +lhCyH7qGa1mgj1BjG6kwUnziAzvGdvTA6sXHYAU3Mxg+TaT23MLTAdjxaWePc3WRs44s9eJpah
 XwY4wYRcVhiagwjtYs6/Po5NqCAN5w9MCPj6fAe6IJEwhJg5350warX24K0tnmU3F6nNFB9M9kj
 elWuZnHLMogZeCZxW6/RJLx0ddHV1PhMIlfETZZwcUC52iPq/fkMkDWSiLQt4vlO0x1VlNkePTV
 mNoIQNifKQ+hN0oGBWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280086

On 8/27/26 1:38 AM, Rinat Muhamedgaliev wrote:
> The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
> DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.
> 
> Binding it as bq27411 selects the wrong register map and produces
> invalid voltage, state-of-charge, and temperature readings. Use the
> bq27541 compatible and rename the shared label along with its fajita
> and enchilada consumers.
> 
> Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
> built the DTB, booted it once with fastboot boot, then installed a
> locally built postmarketOS kernel package. Before the change, readings
> included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
> bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
> 33.3 C.
> 
> Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
> Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
> Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148

If I'm reading that thread right, this IC is on the battery itself (?)
and it seems to differ across different units / suppliers, would that
be a good interpretation?

Konrad
