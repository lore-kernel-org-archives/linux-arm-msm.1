Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591605;
	b=3dAT7qHwPUwvdqNe5qwmc9By+P01GSMCUojEOJOphAIfl/k+LATyeLEhIzcTUTyXCExh
	 UnNb9wDJhGXqh2B8DspFSaFeOuI9ssmaxXN3O6tb5k+3a1Gc/fF/4HiRSeTweWdqV/Uma
	 OsuKhGUR0phmSwuN1XAnkpBk8+atzdoJflfoFoKRwoMOhLLOS9V1fQ5klTovD12RnrEHb
	 BKT3aUp8/xIxse6zxqbayifzN84rjWqlazxC+TXNbGFAcSN+Nznr6U+cuZiUyin8+OBCM
	 rtyc2AJVavC1rQAhSn1dgMO7sznA+FtKq/YFhkpGjABFv9khjlqGsPh1JtywS55fp6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
	b=DXtVb9ebN5gf9den+8rOxnInj8gl1rJhdBpdtPZGjZ90WB07vRoyhOeXJSuHZYXs5eeA
	 npRxReetTBg9PJ5p9QnLjK9Q9qHEdO15s5fA7dMO5UuDAo+dLOu2PUm/8x6/Fz0FAC6YT
	 WCc1m+vOFSjaMAio+krtpLx/ffel9kXRjJAc1puTPOkff0dKyKXP62ifBG39k9r/n8K+i
	 1b7ESBt0kOetXJJKrLzaIpvXguuIyYxNrCfC29fH6WxKWlMJkhBgELmCHCudO6K5PsVAo
	 2hbe/hq2Z3p2KujBfuYQEBCWIXvoK7SmhgdkDt7VeKS7yWFGTt2zwz6S9cz9XyRQW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Adlyp3EL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzWpeguv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D6606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Adlyp3EL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzWpeguv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfw7E1599787
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=; b=Adlyp3ELYkFxysWG
	3RVFTj5LBb8w4ZBV7I2s2yUeBtlczF6YuA0iNy87MMGeGqalnyv/IbYCWMB1vmkl
	Z/eLhtrOTtq5oMOBsTiCOfUwObu4cU7SerYsgb07VQC2w3JpOHqpgXR0y97LLHrI
	3cgKS2PwO/OHcIUnd2H7WPGsTagh02hD5bID4/pM2VhqhFAt1e6QTlXRCWP4q016
	KXZ4Z5jfBgXQh1rFW9xTPwyvtH8BIPGWmufEetif451xR5ax5d/h2+4ObDTmWSXH
	DxPbQT0K0Y44R9oXurNEkhbmqOk64/2IgtmPp3gKb26SfA9Y21eObX9B8TYy4MSW
	K9zmBw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuguk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:06:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988c723394dso19519241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591603; x=1793196403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
        b=UzWpeguv6FsfUh/0TnDvYebH1kzVmkID1zsEbawjqwJSvpcF+5h1dqSZmgKGfyOG7M
         j4mLmxhvDhxihQFfDcWFx7uWhluE/wxYQqWkTAdL7FbhRHw0s57vE/tZ7oiJDXRsyhop
         auichGK+GCAPCnEclqCip8gdpt+I4mar7UVxL83olscf3Oezn24S0oMyopQD1AGU6o3M
         ef3yS362X88I9Z/S3ieTnwBikKlz5cKbu0g2ufAbJH73vIRmJdHgPCROO+E5kLD10Non
         P3nq5BAOG5J0zZbE/a5xuTLc3j4Y44HuxcerJVn8DQOaO3fAdNWyEGloaQ7oYgUB2z75
         WZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591603; x=1793196403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cER6PZfE63ZfwyWNRlY05y67PyxrF7hthCCcku5wocM=;
        b=QAi16Q+5xPo5DkYh4seZmYxYuTTSxzAy9YK6P9NzQojEUz0Lm58UTSQSoxt9SwX6Ez
         ctJY2zJbOQWLxppU/+Ihj014+QXDiK18dZtNmSRwyjomic7BZafU6Vq452PGUaiyHhxM
         Cig+zRtHogkThmPCnMQEJFwYjvVBVK0Mx8xwOFCpxK+NTJVcWeDF2hE7SVBHzczEXjj6
         q11+RB2s259qRljq+8LWWFKPhYfRN6t9I+CWSie7asRfECIDqny6WAFlGtYb3G3L0z9X
         L7uz4Z6UQLMEhKQrmEdyqy8B6Z/Uk+2VkeR0w5laiqZNu4Y5E6jXK8Z2tYXHoFfodD6I
         F1Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxy8IywB2jMs+RiEbnfiMwKO8I9oO3CWVFStQicjhsAJN/OGGXlhJce4rL6cMrHB+KLUJFJCXEKbh0iasV1@vger.kernel.org
X-Gm-Message-State: AFq9FYL6AO85BsG5jluBlA1LT44TTHVaPRdxDTXh6kcjO3uWY47oC4C9
	cx+v6udIsUcunXxsMRFDcPV5vuEWJuKHJrp6OPvdmenZm282+dWW39FSroBTDgvHAOKnp7V3J00
	x0v7xn6CpXF5j0WI8FQP/aXidPWopr2Qj2xFmjMgeRM1vx8Yt+Fb9RQ3XJoC2gAsYW4jE
X-Gm-Gg: AYBFou13Q1QUJ06u5kdLc1oDuur4rxg/eqVo5DUQm3lLO+x/1toJ1uu2KB1/LBlYdFi
	sE3NyqUrsGjWNwJNJptdjitqMhda0dg4pOvKZBt7Yk6XTnPNwLMoZraeTSZasHi0X6PVRQsbGLg
	t+SE4tISX7MBLf92o/0Mb/qOHu57I0Hifu7JCJ6UypEnBAE5rWeKHbyyigBwr7WOYqlHO5NK9yd
	J0ADQNsmlFSGIrj7TGawERgnfMllDkSk+YlZF/db6aE/KAalNO2qYFgBcfBEyQM1NiZ6VWjgEj1
	nanhGJpgDsMjgqorfYRSFlcIuPLvKyP6sSn1B3KCPxawgRdZ1450zu1UXgW2mlkpaeLaXE9/c3t
	PMtjC7bVAoR6c3MOrP0nY+Q==
X-Received: by 2002:a05:6102:2d0d:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc9244d5f4mr680877137.1.1792591602760;
        Wed, 21 Oct 2026 07:06:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0d:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc9244d5f4mr680854137.1.1792591602276;
        Wed, 21 Oct 2026 07:06:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59ac2csm7665066b.51.2026.10.21.07.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:06:41 -0700 (PDT)
Message-ID: <5d3de423-e5e0-41b6-be5e-c1a46e53d570@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:06:39 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Describe the PCIe M.2
 Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
 <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8c6f3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WydMKwGuG-e24Vm_Hi4A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX0vWBOXOqqm3S
 5A7LLFsj4gzWkAm87zDKg9XO6GDVc/3Js5Q6rXNFVgQegkKlxAP8zNH8ZBQuu7Jga/f3qwh8LTq
 wH+wOpS4ctux4+UF9Lp+OI7lqvtpa/w=
X-Proofpoint-GUID: vecTpGJgKPaBjWeVrcdiCkj9ODM6yXm8
X-Proofpoint-ORIG-GUID: vecTpGJgKPaBjWeVrcdiCkj9ODM6yXm8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX0vxZuPRFt2V1
 G4jo92RnOS/3DCZbWLYLNlne5QTNxFhyBNLbkyV/z+gyXLC5slMzQLMAjAsnMrp4/yw6nknB4qu
 2B/gKYDxJLj7xfRIOKpS9MbAvx20ybU8nTVdJDTMeybYUwxXZ+h5Yw/+Lct24Js+ApK5maoWb+M
 YYif35K8WojPB6Qx7VJ6JIn3Y1mzN88UtVpdW+v87E5SiwUkEBUj0rhzOcliWxSWhVxTTd7UUcQ
 ecJw5QNp5YE0yztqvl4K3vGFZ8IyRIGZJOFp+Pfo146tuilbDXc1Jm/knmvW3tPg3R7TcDhElL4
 jPdZsYmGUy81zmFxeALbNUAEdhrBloS4ilubF+WSuU5ge0I8Q1SGIDlpUzEX1LgdYl5Q1SfMHnM
 VA01srjeIUSBFGd4mjbTMGiqk7B+Ltsnil/PPi8vClwj/PPSpIv+0laqTbKxM35ILgeKdF3tZvy
 AmqqNPERwbIaXkrhNFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210056

On 10/21/26 3:51 PM, Krishna Chaitanya Chundru wrote:
> The Glymur CRD has a WWAN M.2 slot connected to PCIe6. Currently the
> vreg_wwan supply is described directly on the PCIe6 host bridge. As a
> result, the supply follows the PCIe controller power state and is turned
> off when the controller is powered down, regardless of the requirements
> of the device connected to the slot.

[...]

>  &pcie6 {
> -	vddpe-3v3-supply = <&vreg_wwan>;
> -
>  	pinctrl-0 = <&pcie6_default>;
>  	pinctrl-names = "default";
>  
> @@ -828,6 +847,12 @@ &pcie6_phy {
>  &pcie6_port0 {
>  	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie6_port0_ep: endpoint {
> +			remote-endpoint = <&wwan_m2_pcie_ep>;
> +		};
> +	};

This is already defined in glymur.dtsi, just reference it
directly as &pcie6_port0_ep {}

Konrad
