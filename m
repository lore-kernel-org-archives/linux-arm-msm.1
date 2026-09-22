Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767853CA93
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078325; cv=none; b=L2MWgDLMaMhEdqYDLXaWKu21E4S1yfsI3vyARoYo7ehm4GfUFm8istw8xlcZxrJb3ab3nYZ0As/VuaQjU/RmIiVwOZ2ph5wXBEJZI+6wPEH8KvVRpe9PdEjdPJ91PJwVBG4CY5oDG16cIB8UXuivmqyo4Q8br3CY8ZG+eQ+6szQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078325; c=relaxed/simple;
	bh=w0szmDFYAAw/McVgBMAQwonoXjKCLezxEOAl5aSxZYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sY0k8699DZFkduUtMh6tafUVen5wvWDFEWzBXp5h6iiK+ThDDcmgnGi4xOYV6mBy1bJrrCFs892Secrrc/nQTMKWIAqMvW65c2v0waitBpLDgTMRoEaUMHV3McMlU9Pdcw+rBklF8aNW1VSyoyCwr7hzuK8yrzqSFgKk/lDCzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDoGcjox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gz15kbWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDoGcjox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gz15kbWE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPaMq269193
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6+Qtdb+PnVAFVBQZIIJ5o3YT
	xTJ1ZpFeynW9wYr7IjE=; b=lDoGcjoxYErJjEItZhADTDnb7Jnb6tyj4eNIz+fM
	VIjNvxje/O7btEJoKuk2DtetPoovhBOUkOOgzrwrNVeAeyfJLXtf97h1ZKn8LyPj
	NANALrLSNNvX34y2ex4Vpzbpf/vhn83k6zGlfvDG/n8yxKSoQPdKKak9cTJTrdbj
	bs1vtJ7VLTCFRuLKt04A7u7YK0yEHK8QUWzSjxiYzRe+PYkCmtK+GfAOooPydrgb
	qLvxGpwa+zjBKENBwrHlO1QKeamUPbckebhtjDUK9I3G/aty7IDGqtOmmC1/uPTD
	NIxNOa0sjIJvjpavZ3vopdUsvaokHs56mqWyoHvnwsaeCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbate9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:58:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso68353895ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078321; x=1790683121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+Qtdb+PnVAFVBQZIIJ5o3YTxTJ1ZpFeynW9wYr7IjE=;
        b=gz15kbWE8/dUavgWj+J+z1vU9rXaoCd65OfpDHTU+t1UuTl3NJSYRoE3gxlVEWwoPB
         HlVSJgFb4yxJnkWc+HXetVnP42Rk/KCkw3prAV7aawd3l7yaalk3pP14amEfDcGjE7x5
         txYXU0G9uBR7jz/dyrBSm9/q4NlNde6QDqFUeE1XZUQm0oquRKmjTZnIrUYON+RAaR/E
         6kI4MHg6VaE2asYjDsNuC8EPyw5MxRo3GA8Olv1poS+w8DqzOIGGu1VXd0Dst+trHMjD
         kTtceicdQIqvlE0Jy1IHdIGF8tJ7HmqY83vfFMOeqtxxYloh4rGr8pV/b832z3AM7SJO
         jL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078321; x=1790683121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+Qtdb+PnVAFVBQZIIJ5o3YTxTJ1ZpFeynW9wYr7IjE=;
        b=HNKRMgkvAJRkRVprq+GXzLGTK8WXnsISzc23va6DQyX/Ec9zpbrIiJOESveaL/ppXl
         c3SnIxDLmccPtdbM6U6TIa0/hlWiM8eQastqIM9BoAowu8GQ9FfbaI9VDwaYGZ1D9kl6
         Q6n1uu7tSzYkfn267T4A1BfUT3XBsEuS0Kow89pXncxKi8Vv75VQpU0IwvSDeRV/KU5C
         17hwIm09gIFuQuxpyABbTn77xxqqy1yYkkWg3/VBlI0Bc+jNkmZyqyMe1EwjRk7L2XSP
         4GaD1plI4G8MEAmA1TCpr5zGQdFCtPBc5uf10xBfzxndXjZrX83voEVvsE03AAsQ3cSB
         qhjA==
X-Forwarded-Encrypted: i=1; AKwUvBxnDn877VNy6V8KzJKMJom4W8ZWnGlbuKMEkUdHtCh9vl41Ww/6/1VwXizPU5pSBAX4AbXenAR0watEFJdc@vger.kernel.org
X-Gm-Message-State: AFuF++kH7xpj4GnDVrp5FUqQRH5z0Hf1R0VfXJpQWW340R3PJPYj5ioa
	l7N0zVI+EYtGb4vzMyMQeDDZt6ZXPcrlLK9iN2mcrSe+ymjG24XEpfm/QEbeqHlWllK/m1xZ2Uv
	69OPDExTP0nZJSwFou0oNwEPTAhaEzzjHu3NWr0f599aVAJP2nr3cdWuMlNmH1GZ1vluh
X-Gm-Gg: AYBFou3dRGBmy8Av6/kOLlwa3JTXBbyVqBhbHBz52iLsd3x94V6gYvqVM77bH5w3N6W
	7z1EMvlmQHWdHNyL9PjpN2HdfTg2oZ9LReNhRRhN0/3MpX67Zwoos48ZLS6BG897EGiQBMO6Dl+
	qDRGTZdR9+hAyfg9kPjA/REe/k/r3BLFNmnfi054iNc3+09scDFPVUc9cSC63/jR6V+SBgZatlq
	/OP5wI4l/bTJSC19hUf0NSudUvRBJj5akKxKBQcC/BfeBpy0gOCVbAZaJ3wSp/dDuksjfAMdJCZ
	zebJU6sadtk5xRC1bB/HWjzlkOPdUIGPYz+/2aJ2iZ4BHCu4kliCGqqTNX/7up3UcPBS5xOG49x
	tSARrac6E4hDVl2/tDLj5FDVZK2IsOIbQIzXdyr4Mrw==
X-Received: by 2002:a17:903:230c:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2df609abc79mr11643855ad.9.1790078321470;
        Tue, 22 Sep 2026 04:58:41 -0700 (PDT)
X-Received: by 2002:a17:903:230c:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2df609abc79mr11643425ad.9.1790078320871;
        Tue, 22 Sep 2026 04:58:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129a33esm5665322eec.14.2026.09.22.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:58:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:58:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: nord-ride-embedded: Enable camss
 support
Message-ID: <arJtaiNMPmnNzEhE@QCOM-aGQu4IUr3Y>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
 <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3MiBTYWx0ZWRfXyh+gUBDVnEqp
 zCE6yHPZyhoL0qHmzU4O+4kmkD+QZ5AQoFALcjpSyCCqM1E7w2A81lEUaaVhdg52lFJFaP6YP3W
 OYuPy+FgltrBGjFnID2gv8qJliGfoZou28z9gRq99W2fJSGJiRDmWzdrez6tVAqs0ubwcBWnKqn
 85UbH97Tw8yBXqy8vW2ftXEcPRUcA167lOhFFdfdWJdk2khhUvDsEnV3/KUx8SgC9RIh6hMvQXu
 UQzVonF64jinrB3KzmMvMbTBdM0BCK+R+MjhCqFnzkWqoIF/ekSuMV4NZxxkDzXF9nkxTF5doNj
 kuHolaSOAE/dvdiB40SheoLyg14GVanh31ZdDSPoblZfPkpvlN1c6GvSR6D7Lx9KtznugbCH5VE
 9RI9APlUEjNhxx8TnXE1B80jwjaBrWcHR2R4LGw3z+poQJEEjNBwF61zZLpC+lDD0ErpBmz4cld
 9/74P6+tnL6WLb5jLZg==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab26d72 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=E4mMBdOhJyD3lkwEI3YA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3MiBTYWx0ZWRfX84yEzzBjMUbC
 cJlseZuGtzE27PIjKEjzOTSA0trtDGHKVqBkIxvxipf8Mb8geWZhAyhkhkRDmSuBzWNCkPsNUpw
 D0av3+BN3akiNMVt9jC08oJtKgl83L8=
X-Proofpoint-ORIG-GUID: YGL5s9X_bLZR4FPFvk5LOYXFf7wWR6gp
X-Proofpoint-GUID: YGL5s9X_bLZR4FPFvk5LOYXFf7wWR6gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220172

On Sun, Sep 20, 2026 at 05:10:53PM +0800, Shawn Guo wrote:
> Enable camss support on the Nord Ride Embedded board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 09ee525764ef..674e2093f806 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&camss {
> +	status = "okay";
> +};
> +

It breaks alphabetic order. Will send v2.

Shawn

>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  
> -- 
> 2.43.0
> 
