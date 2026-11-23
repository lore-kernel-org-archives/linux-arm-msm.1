Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440644;
	b=XXSv3BiKcIvug5hPFBICQL5NL69sf8XOJIH7H/mD/JFn8zYI/rTofq94Acb0TuXFc+5l
	 1I1fMlVVsHJv0ZEtOi1sQ6IARjLP0KgFafJj4zxunuck/ZRmr/flkprxjrgMtXCs5Q5zz
	 LdQ7XSkHuu7fnb6P4MMXal0gxsVmlzdPWFkRjYgHRd7iOhQ+rlLjdG8OXPdDaNQvIw+jz
	 Bv35cjrDBXOyupx8gyRuoaRGjDt6au8dQFFHMlWay+xQaTK6RWOkwU0EfcuMPW10hDuq1
	 SnVIay5USH7g+RMjhfEEnakWjJeBnc7FWB5suUrVdBMdiyiDBDsjuHabx5EE5vb+2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
	b=EVsIeAUof9ErdK09LCvd/3GamArQmVWn3IR/fJo3D4rs5tI73pKYZkJoLk9sg3exgGvO
	 Kgn+5IWF8z15vnsVqeuJpmp4Mhm2tTZVBTvAhyjf2VKI49NhnzNNznUt5WALTNn1+zQdI
	 1b4EOhIldmuyz1booNjxwh/fKBzaoW0fPjcCGtNpk0p44yA7+iOUDnlaG1NcTaM00umWo
	 EA6AQbXEt6EA/0aZn9b2/S2Zhn8k3Ax+WY9UhSXr6DzXctW7i2u2HjSipMWaqfdcCeb3y
	 R6WA+HWohv4QIGtvPeRBNLoUjXkErfUZvzJuQlwRtE7EcN4fcPJm8HK6OkjH0T5DyyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gEn7+k0A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB6606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10FB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gEn7+k0A
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL20v3072544
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GW16cYLEXbLEKRxCLcZ/hm1
	ouVgqsdPZ8UneMsZf6M=; b=c6TAGOg6zi0O5kcLuEuN/zocBSDmqajGdyt5ZKdp
	JFQcnRh4jGqIi+JgJm8LtbWG776NhXnFYt8IBDEHEWhlq8tGnCAvG7N4gjx/fs0g
	RwHLHAQ0AzKISsPBHeN+T7sgGPzfp8mpNfUmyAahFVHjGEuOHoNy3R93Ypgji/1x
	n4pNZrIEt+skItajBuFA0fLd6AE16jE4U/KuS3s5WAa8MHKNEOwVSL6qotCUiUp3
	3+dwTPk3RXdaFMfmjEmBqkTy8QrljLtE7P+E4n+wCKsGj1qZTeLYJd9iiTnTunK+
	jzcavvfDiGJ0pRTcooPH0jqLoiD8wvpfK4VnnCpM48Fu8A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7s6fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:30:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2ec691518so2996610137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440641; x=1796045441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=gEn7+k0Ajaze1vGjd+9YvxrKbxZoK7CwlUziaxShMn1c1qP+qCqUtb/j1rm28nqQwA
         Y9G5KJT2NfLeCAnij2TdjEKJIlympH/oaHji3lp8qBvgVuVYWyChaRLZx3sgT9b/PTxc
         p8bet/RyeZCRyBoQfYzzX3DqVwMXDZem3ZR5VwaUFIOZrvkY/hFrNuGiwU2M2wVKEbI4
         wbiBBMC1OHIN9icmt0OZTzInNPheC04yokttgfMsx8FMab8/NfGzDw1lhVN2Xcg0uLJe
         xfggIo2sp9rX4uqV5FsyOO/MC8rRRT+p1B0R+FAdNWA5HjiqZ0ahuRMDE0XMy4DBiuxa
         i9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440641; x=1796045441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=raPcnSIakyuue3qmn40tiusiTCMLrq8iNBNrIz1smC5Qyc4iXowPwmy4VXCoPgXagK
         uv6LtdO/dUebj/l2Bpi3R1ZvC7cDZoUq4wEiy3Z0eu6NYc0+s4I8TiagQHuEU+CNMeCh
         093GrMdngXkiNVbZt+WGh8IaDFtPDYhO0UI6t5ZSxZ5+AGsdKALZ/BR2lswd1Dk0jREL
         ZasByJ8JSEqo/gizmFRbQfiWGfsdXJW6dd9nryKo6dJ7/tjMw6WojREz9TUDIinwKwye
         AT94GitEPhj2iq6o5yUUiCqmxTsVmgXBLSEX3zsWLy0X/1wIYFThgjJOMGP3Kzm9gB6f
         y+NA==
X-Forwarded-Encrypted: i=1; AL+hErGnC5o1+dN2iX6Trz2Ovmd5pH/EhVP9KOGFXtHwBNx1FO7kUML92AXg3dicC+OdWkOf/+8rDZx9BzTVCii+@vger.kernel.org
X-Gm-Message-State: APuU4Z9AinFf/CROYhF4gOtQiy/vKL1aYjGjGo9tiK+CjWAo0Rc2JreU
	Rv0Jv049e8kDaxg5dS0xpkGbR8dCJmVFRuOUDedW7qfR9qxm4+mrcRszYiSX8y/6FUarToP4rhy
	3mL3hCrOQvX7tGT/Iy2PdpJgNTW9D9SNmomRXf6ITYrnnFhBxcck9KfstLfNjiM4Ql2Bz
X-Gm-Gg: AZFdTZdpMgUmZwPWslR1HdwUzjfeFZfuCzG/r863ojjEiB/H/foljpEpzlxUcF4UFzK
	vGCWHkLNhWr6k1Wio/3BFAGZxQHokKaAjtpHVDQMbReVPn9YXLjNZjfc9drF9kpW2i/rudLN1si
	HuZkWGFGtxtKe9wjeLhNLSOCLnycTzWNGY198Rf953FfxOzojuLurcHDTZvs1iMlusTZWzDHnCQ
	q4qVUBvQJ1vK9hzQP+eMy+KUbWnHAy347dLZ3M09lsWRk9dhFEi0lxUOYxlWd63aEJyzMU3ZBFb
	0YDc1S62rFwb62mjWxrHU1mE5Mh+SyCnLZP1SpjHkEoe5bN3IQnWCa1/NzrW0fkiE9kaeX2UOSD
	wtg9xKmXyBAP3t1HcuehZ2qDHHL4T1mkRNIGEnmbB5ePohvItqkfWffhhPQohDaq97KTFN9b5cg
	YkcYwm4uKCayv/xFU=
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388878137.13.1795440641094;
        Mon, 23 Nov 2026 05:30:41 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388860137.13.1795440640566;
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7fa0467sm11903416137.6.2026.11.23.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Date: Mon, 23 Nov 2026 21:30:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
Message-ID: <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b044001 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=votV42V3uHCFBabA7mkA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX8j4sxYXwoSP7
 Sc+Y3qUtndvGeur5FFa7v7Wkf/iWj6E/H/0SotxFugxhTaWcX0S61zWWlkd3+cjZ+BTLTyi1ZRW
 i4G1rO0dF2zXKx2IWY25AEbx+jhpvVs8UpJjrDngGdRmtdOYDHX222wz4t/NAKG40PokdiqlAg/
 JLtoXqX8y7WyQBaQPyVVKq7k8uAD5Kun74L6H/Yc/p0ndneaIFt2LjTPRfwfvoYxbu6K4/VDk/m
 j3fp/7abZ3QXk1EaANW1LqiHIhGANYufF3JVJv60OuDvu1VKqlGsHwjC0XtetrFP5xE4OJ4joLB
 iIeCYbZeNEi4Kv7KvprAAj+NkzLajW6vgiDpCmNWA9WNTKCM4mlcbF9mKnmPzO8wn659qxqfqlr
 WEeVvITemplXBSv3P2Wz2qrm5DJDO7Xd6n3vq6mO82Hi6iMQhczfV4UIuyhZLwJF+iSAgSD1QHT
 q8CrcsPNRQGLGrmQ9RA==
X-Proofpoint-GUID: t2j7py-4j7HSSTSGg6d0XjpVMlgmhH4K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX2nWPF6PwrsOY
 GQC5Sdanbih6TrfbUkjr6itYdz2B8Xd64Ti3iTQh03aw60xfkXBYNoggeuPWHsqwXE1oBIVM7Co
 e9wwfTGgO0jDb7nt0rWhn5c4yvggKd8=
X-Proofpoint-ORIG-GUID: t2j7py-4j7HSSTSGg6d0XjpVMlgmhH4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:20PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

s/should no/should be no/

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.

Not quite true for the start of the range. The constants themselves
are not referenced, but the values are used as raw numbers in
qcom,msm-id:

  qrb5165-rb5.dts:                    qcom,msm-id = <455 0x20001>;
  sm7225-fairphone-fp4.dts:           qcom,msm-id = <459 0x10000>;
  sm6350-sony-xperia-lena-pdx213.dts: qcom,msm-id = <434 0x10000>, <459 0x10000>;

So QRB5165 and SM7225 are still consumed by bootloaders through DTS,
which is the same category as the older IDs you keep.

> Copy arbitrarily chosen newer SoC IDs from DT bindings to the regular
> header of socinfo driver and use it when needed, so later they could be
> removed from the bindings.

I would suggest converting the boards above to QCOM_ID_QRB5165 and
QCOM_ID_SM7225, and keeping those two IDs in the bindings. Then
the in-tree DTS users become visible, and the cut is no longer arbitrary:
everything left in qcom,ids.h is an ID actually used by DTS.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)

[...]

> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index ba823a0013c5..cd2e8eddf3b5 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -112,4 +112,98 @@ enum qcom_socinfo_feature_code {
>  #define SOCINFO_PCn(n)			((n) + 1)
>  #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
>  
> +/* SoC IDs */
> +#define QCOM_ID_QRB5165			455
> +#define QCOM_ID_SM8450			457
> +#define QCOM_ID_SM7225			459
> +#define QCOM_ID_SA8295P			460
> +#define QCOM_ID_SA8540P			461
> +#define QCOM_ID_QCM4290			469
> +#define QCOM_ID_QCS4290			470
> +#define QCOM_ID_SM7325			475

[...]

> +#define QCOM_ID_IPQ5404			671
> +#define QCOM_ID_QCS9100			667

Since the list is being moved anyway, this might be a good moment to
fix the ordering.

Also, drivers/clk/qcom/apss-ipq5424.c includes qcom,ids.h without using
any QCOM_ID_* constant, so the include could be dropped while at it.

Shawn
