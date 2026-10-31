Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437379;
	b=vnbmcn5s4ABxXeludLibZ9i7wLpaCVMCCoNSMj0f9EGCxplhdeSPPU/btvrLuZPoC2HX
	 R1cVyiqDZmTJ2PxfkMtM2rmfgwSl+QugkwfAvhTXtq6SAaFM47HxPmWUShy7Ydwya13Bg
	 pLVr1Td8LrFMTChazCZegZ7vpSqXm0P3evcnSWjVogoQ93jUW64J+5ottrDb7O3dQmZLO
	 rIMf8d9jwgOy/53ndAPqkor9az96y4aJtEm18tG4iOE5ozlsK9Z17zwEBeQZIptyj6+XX
	 lHA/K89llgE5d8upCc0ci1fjW6Msk2OBDB0Rn0oEUFSMUhtltib9YbqdG6GP2TdaF6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
	b=FzmJZSqb3m5K0K8PWwwhnTvTyJmGtyiATLISKru5OFgmyCA/vAOJpKetCnmOUHiBddbI
	 +DCDEKjZ4II1cxrvWU+vwNdm2cImtmwptR3sRhm8/hi8ksJdm/GR6M5dKKJKRUVx8rMcO
	 F36na4XSTXZ2E1T9szhJG6q5VJL818cPOivJCXPo76kbotUehfi2CYjRZBCCKqED4/y8V
	 vZBC9uE8Wfk6Nd+Lu9eVWyXitHKRdrO3/CrQX6yyPFoeEjp8OCbhfXvsTfKaWKGbaXYIO
	 GzsilEzyrnjjyDbUKM8gA3hyyCCOGwOpSSjk7nu899APSFhgDzu0DUjlqr6SMVsv6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ia00+gGJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC1iyak1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC2606A324
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FC2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ia00+gGJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC1iyak1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a9S31175397
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DWUarRjMNL3pk4YmHhale63C
	h3og1P+0l0Zj6olN36A=; b=ia00+gGJlTW3tAOaqlOsRCW65H7GMogwxwemGvMT
	WN3XceUXJ3fun+/RFk7atu0Vp9dW+E/IM2acFHcRlaa0wQ8RPk0R7rPSjNAlum+A
	0mbvo0LmBMsByjxP/s5ukiERLdBe0WT60u63rdlmwYjOAT6+MM64wZdxBRoPNQFp
	fn1AReoJZNSOG+Llb3kI6YSGPc5eXjFjpjc7gj1l+IonPhSFG4fn3EKG6BeYLDT9
	CosRiKAeQjBSUwnDEz1+7F4SZOnUO1Jjo/XMI/zHMknbKhfBsWd67BVIy3Wn7OFo
	9mUA6RjFAXkTGYFbay5dfLJzEx6emE3oJXPrhyr32CIUEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkh2wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:02:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a223755e4so6011442eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437376; x=1794042176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
        b=VC1iyak1+LaYgB+s/LlJmDYNbv4gBWfqwyKTzEBLm4Ol/loWh3g6kIK7Gyv8GX2eeS
         Ne+Qo8UJbws3+lM87i2cd+RUdjL2DkjrUG4ujBYjVSzJHqR4ViXheLjo6FrdqiARnPQz
         VsT+Y67KLF3URLqH4kd/kN/b2MHFGrSuFHP4xaZIlyEXRMwn/aMFFydMUgks5KcWW/nk
         utfMNfujhhqMUiHACYX35WOtHIkc7vO4leB8qXvo6zQLZAbHf2TfdDFMeYU1AZODafzY
         lBhwieS5SlpPC6XzZROwT3hCubBjxgMX/RYqJM+h6B+RtiHwQl3A7G65scuHw1HnGzix
         ceLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437376; x=1794042176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
        b=B9dpA+DKXmuPAwgTEeJN7GD1ajhU5+oaY/h9rIBrQm4AxIrn28klvCod1ljLND7gOM
         Y3TBfCB6n3ulqsxTfL5ejqo8/PhGtPjG6ymo88QXR5yx5IIyw0FVGtNoCZBTVXQ1kTzI
         YUJRp62S3z2C2zfB3rUEzZ5qiJDbqAxmEHjxAnH+nl3X0mfGys3hFzw6waqjkB+KSrfQ
         VuA0IBLx1wcq7BWKs7GAF5RfWC5TrppFM1DDhfeUNV7dDKwsOWPSNJs2cHB39gh19LO5
         TDQilbBlNZbt1szFvMDjwc2peFv54yfK05HqbeD2EA6+pTWqVN1Ji5rTc+QrYTG1XP+a
         eCBg==
X-Forwarded-Encrypted: i=1; AKwUvBwMDExB8BX48mKV8lJznKAUwdMDARiDAAz9UMLQ1pi8s0OuHyFG1tcsDcQV6pIr9omxr0csSq/J5S8UztjG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6I6y/YFs+3TdlISd2ZlA6ry7aTGwxh6U1vLDl3u7zAN5etl35
	7mr6G8wuDBQOOKf6gbRz3XUIe00ERnSVS3W70Sbl8kwQzmcOrOlomjHExoBMaZ8sbQOFQZKfv4W
	IO/Oxy67oNNKFZAWR/+3Jr/nNskAJnJX/HV+s84qzPnk00oex6Pb+Cw7csPoWbQwqoMrc
X-Gm-Gg: AYBFou0x7HROKxVpT4+zl6XqIYrY+C9nEvLQ7TyATOeFKI5mkUB21AWU84nn5XsgPGL
	clsdl16dA8HMZ8ZT8T/DbJhmohZ00sDavP9iN5GQVLQfJwUKOlZwnXOINkY2ve92qT4UaXNgllF
	6mI5uOIM2UfXslAtC97tMHsNVEkeeVXbD2b1nBb1eQnWYv0FYHuvfNoKZmA3Xg8l8eS/8dMC2VC
	MVImpLmtJmAxyydslrzRHaAjMl2Tg/iczAao4728iS58n8PdsGQCFFHLpoBHfL8jQWRTIXnRjKa
	5i/dFyti3MWVrbliNcpOeY+tlpHxbv7A5IcqElwrMkfx12IgEIlZYH9KVfpVxCkAzZfF4MWL7E2
	laMfHYPsiJdV2mPSyroKGZJuAlEptY8kEQ1R8bu9OwUL930d7at2WI3XTkSttTBS3VQQuoEIe9D
	wcBjpBvIOADXLwXyc=
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr6600210eec.26.1793437375520;
        Sat, 31 Oct 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr6600187eec.26.1793437374972;
        Sat, 31 Oct 2026 02:02:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm13711825eec.12.2026.10.31.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:02:54 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:02:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWuuRmTrK_h17nE@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
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
In-Reply-To: <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
X-Proofpoint-GUID: 1_CGkK4vnUMl-MAgRs1D06rypX2NMU0s
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae5aec0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=3ylGVn1-VvHPnHraYRkA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX5/7Elz7aOKgU
 26HD5wz9A/OMdqDB82PwlyrEGKj4pT2sodbVPlDJZSFqSp7+rAbaTzWikU0kw+e5pJWqCNOlaq7
 qQqn0lyqNzEbnp9tXJVtnjhrWqwgB7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXz/9RI3KjPZc1
 RSHnMDdaHda8/F620ppfedKmqqOSAwigSBegjCIIoao9PxwcJRO2HCR1IXRjL21SolNn528XgE2
 mgbXdnO1i6kGWQudWe7iTBW9aC/HoocfvgMmCDa0djSD5LFweJikk0Yjd+AkZ4UBaCHzaDmjQZI
 pyWlUg1jrShiveEJQNNHQw3agNJZjYj3r8SJeEv2HpC8vADch0oqtg9g9xJYtbelBNHtNV9HMDb
 ecuyKsOc01x//AhLvK4clDQaYMIeTos/EVVgnV7JwjDbzSGvUBvtIM2bFUeMpd9gJNqVc5kL/1l
 HNNeCiWkfBBs8rb6dr4wjvFD2gPYU9nsmRoilUddFyG3P8Ql6YCXegFPEGayAtgopO9+cQAmq2J
 x9CN564Kiu8e/GVtrkRDictFhCON4C5x0zSgIKhh+1f96fW/L6oT2Q8fiRP4RkjQ67pSefexrhv
 4quMV0Pg/veesZZJmCQ==
X-Proofpoint-ORIG-GUID: 1_CGkK4vnUMl-MAgRs1D06rypX2NMU0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310035

On Wed, Oct 21, 2026 at 02:17:40PM +0530, Shazad Hussain wrote:
> Hi Shawn,
> 
> On 10/15/2026 8:07 AM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> > 
> > Group resource operations to improve abstraction and reduce the number of
> > SCMI requests.  Follow the SCMI-based resource management approach
> > demonstrated by Qualcomm at Linaro Connect 2024 [1].
> > 
> > [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

[...]

> > +&qupv3_id_0 {
> > +	compatible = "qcom,sa8255p-geni-se-qup";
> > +
> > +	i2c0: i2c@980000 {
> > +		compatible = "qcom,sa8255p-geni-i2c";
> > +		power-domains = <&scmi11_pd 0>,
> > +				<&scmi11_dvfs 0>;
> 
> For I2C power domain should be scmi9_pd and all below I2C's.
> 
> > +		power-domain-names = "power",
> > +				     "perf";
> > +	};
> > +
> > +	spi0: spi@980000 {
> > +		compatible = "qcom,sa8255p-geni-spi";
> > +		power-domains = <&scmi11_pd 0>,
> > +				<&scmi11_dvfs 0>;
> 
> 
> For SPI power domain should be scmi10_pd and all below SPI's.

Thanks for pointing these out, Shazad! I will fix in v3.

Shawn

> 
> > +		power-domain-names = "power",
> > +				     "perf";
> > +	};
