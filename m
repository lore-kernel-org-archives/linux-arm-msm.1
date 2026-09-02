Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ADA43A7FF
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344345; cv=none; b=M3FvpPGe3FijPAjE3vB7QpsmmOy1GFXtHUWytwWwmdSLPk++fVvGvrIF3wAnzDKgzfMMpyRoBXjk2wK4W0of9wL7/3FJhVEGJ9lgIyuzE81TmOegSxruLJT6VdpuAaMc7uxE4AwBhTnSaujH1cFT608k43EtixIiyG2n/iaoNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344345; c=relaxed/simple;
	bh=9vMnaYYXwgmlr6LeOgseKM/hj4llNkR4VX3Uph3TBcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkcr+VLqXDG5dGKDBe3WfP0jcOH46zQKlaxxGjkESYJzyHcD+gUZ2QKRdSit27pQQp8o/joZGtVMWySs+J8hdaTAOTNiOhvQ3ZMm0zMiG9xGLOzP8qG8x8MrAM3lKgqfBtsn35ooNjziAPVyZP8G7THzHYnzPOmh2BiS0zBJERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhIV1m1v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSv6qmPO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhIV1m1v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSv6qmPO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829Mtb34141319
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gTiCzv3zvd/vBxiup9r8p45zBvqIEwioYb96j/Z4UM=; b=AhIV1m1vzEpXbxwg
	JJvQLKVeiBVVvl1382fV6QDrX+c1qgIuvnO7HKrF6pdZ948I2tVR9dBc7BoHUllS
	IYGnU1buZ1mW9e5Sbn0+rFdjWn+E7hiPDP4wUaH2ve93bWZnfPYngxHg2NtDDC0o
	y1Lx70RGzHh79yX9jZSCxodQ2MjalaYly1LYazZVGU2+ikVl9BNHt/LzfTV5z0G2
	cTZ7z7TARUcwHjkEPZJVH3XNMugf/tIs4k2iPyqtoyvk5dOZHK8JWWR+/WcRPTLp
	ued/frzgTtWWZCg1ywfTQX97OnUtEnZVc4Q6mrsBUxMHCqxkIFjIYT9OANcu9rjs
	VH0uSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ckbjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:19:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so22571885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344342; x=1788949142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gTiCzv3zvd/vBxiup9r8p45zBvqIEwioYb96j/Z4UM=;
        b=RSv6qmPO7Q5D2SLtjPu7rB7nbNRi4GwPnBA+Ytq9fJf+pbznlPvKRxOvhV1Fi8MAFM
         4Q/G1WOLAMaSCJgffawCfIrGhtki/dYWJtjdkAw3QD7ZFwHhRyqqqpEHH+2rHV4BY1Wx
         sB0udENdcwx0fWF08r8nFj/eMD8V8ZIuA2HBrzuuz+96eud321e4Ij0v8lPyKM81uDST
         uXMhOkwDe8jXDQDJVyDqwBDZjWwIlJh1lFksvmnGPI9GhAf9wWYrA4dXMplZBMx8ot6J
         /XzO9OwXoeETQKcGmXdF+Sb415e6HGRlxMNsNX+MD8dvU3QSF3KAkVhEd901vjmfJHAG
         eqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344342; x=1788949142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gTiCzv3zvd/vBxiup9r8p45zBvqIEwioYb96j/Z4UM=;
        b=BsmVrnNlnPhSIeQwvZPnvn2X12htPeldH0UQjIU6PUVbeEylQCiaeHewyzlNGV3XPv
         HiVLtNWE4T+NxtIRT+Ipzc3dCI0ac8Kqcn374pScOn5jopXMLPybWCbsSrp13KMYeGow
         yAnplV0r2BJd9XmbLGLO3Stk3KgjVcK6D0DiwC1wq/hG7YdmLuH2CPdBa1enPPYcRk/4
         JVcOKCvAPYbZpsWt73uGVMz7bMfacNQrMBH8i+rDuXW+nyyDDzVsHEPhPqv4q8y8L44f
         RiLUXuIJ8T9XGZ5g/xLs7sXr52R7gISgtbX4Sdtm27mEoMVWHulBknbUpNsuo9vWAgM5
         4BVw==
X-Gm-Message-State: AFuF++lVda2d42GxzqOUWVR1DQKIriHLdnEe5AfMoWxCpzIjIjO9/01x
	NVYUo0L9iZySpFY5HXoM9UaMdNY+a84wdJDOs7hLwUzcS1RwJ5/26UBfZn/9SaGYyrJnTvtoz6c
	WfmQzcYnfvsWsSRXElGdMoMziV4KKNCZ9q6cMWzpW9qPzUbCqevnR55ngvfkDGekyIkg7K1r3bg
	8y
X-Gm-Gg: AR+sD101coHt5vPWoOjQJyn6HxdOjTYEv6uJeb9TwgUR+rHv5NfQOMwvEJwA3qIGSCB
	fzJeHhTNouGpvOHxe0PeKnySscGAcPY9OvfeYEg1SNUTFtfnFxN2xP8Vh6autMVfiXxNLXlwj+T
	mP2nHXsGK/be0HGDz9/blKdMdvZJiknjqp1MPI7CgF3ZZNRMmpbkeNDDtxqEFWckc8LKI5pN8CK
	rhkrPNi7O+EYyWIyDTQQy8YyuAVD8gVQg5GqKppRQAfiOqoI/RDMrGXLFk/8biUur/SM6j/buYo
	7WF+L52Q0SuT/PMti+3AYZV9rdh8o7gZ5uhFvk6CnpNFdBqRLPETXq/6FSYVqKIz5H4VFbcz4bj
	Kjez/U2RdXEZRE7rEj8aB2A==
X-Received: by 2002:a05:620a:6501:b0:92e:6485:f640 with SMTP id af79cd13be357-9396101bfa1mr220042785a.4.1788344342529;
        Wed, 02 Sep 2026 03:19:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:92e:6485:f640 with SMTP id af79cd13be357-9396101bfa1mr220039385a.4.1788344342101;
        Wed, 02 Sep 2026 03:19:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041d4a8sm107060266b.54.2026.09.02.03.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:19:01 -0700 (PDT)
Message-ID: <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:18:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Talos Lyra EVK SoM platform
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97f817 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3T-LA-ZRmt1pDai6GWAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Yhk6IV09tRubkza8ea8OrQckJufjnTDp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX0MjDGlymuYPf
 hmTbc3hGdurPBzBSRR8kdjsVsHFPkIR3j3qPcJLXFVYxEX02E2O90ssQ+1esy9I3ZUvlKZqecgY
 lNqvUD+UqC9+64UE6/EE26Ti6lP51J4=
X-Proofpoint-GUID: Yhk6IV09tRubkza8ea8OrQckJufjnTDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX6ZHKQDI3DhNV
 TMz44tjIaxM6qbM8IROnEC/r825dPLtW5CRnK8KM1wNW70sh5stNhAs+LZOfYjFjXd1NEdTJeFB
 3808cwn4tjVylT2X2p8gqp+7uGKDCPav7k5lRmDdv3a0PtVNGFU7uHy4m0ylOdw4vEppaS3cQ3k
 W/Vkdocq5E3vVi0lL3ucfhVcTwzWRI/tNlH41JAwP7eq+y6UqwKfTrB2OzLWOlnuq1bEr0mvFMh
 gmKhTPa6+ZPYFxKeStzcECoSrc8PDHOlH4fzFed1DBZzF+LV2dzZ8DhGYFW1sn7oCkUzuYRWQYZ
 tcbPQ76HMGMMggx7paUWUEphnH9rQS1g/nHaVcdI/cm02HJ+uQq9k7hygoNbc+fqSnHDmWS9DDn
 YgxzTpzr9taaOgsiK8yULFmyeif5cS0KvWuhT1a4wTNf/MkN4Pr4f5z31r+cNdPY11EpgricRt2
 r4j+FXfv/fWDMHUOV4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020090

On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
> Lyra EVK SoM a compact compute module integrating the QCS615 SoC,
> PMIC, and essential connectivity, designed to mount on carrier boards.

[...]

> +&gcc {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
> +		 <&rpmhcc RPMH_CXO_CLK_A>,
> +		 <&sleep_clk>;
> +};

This is a NOP override

[...]

> +&rpmhcc {
> +	clocks = <&xo_board_clk>;
> +};

Likewise

Konrad
