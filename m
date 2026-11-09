Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213809;
	b=zWh0yDkTlhA38mu+jlHuEZggydhtRs4Jzibu8bqkCsoeJMHcAUyeMc2lABqVjVDCk1Lk
	 tQ/RDHEwdvy+P7UsQGaUwGZ2QE9HkKAnbgmgjAxn4cZy9JO1d4DNmGLxCGp9fAVmdWlwp
	 Q7WsJvcZL4NGG/eA6zTJWR7iEt7OwzTVezvG+tbQveSmlABSTdA4k0XhfXxuPdBKM7zKr
	 uyHeMYjIMRKNfPHLNKfDwLAvEA3zuoIC1eWugzjytUp6e1Io/Tjazp7aXtWqC/h02W8XB
	 zslU6c9OZZhbaeYrzSWDT78GAvibA2TSz8XxVcWKoGnm6+iRoRvZPQPR07X8WnkEVIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
	b=2ze4MNfp3Lw4/MlUBR5byKXERspuZ9wTSzJfV78rdk5//0MXkUbqgTIdrBevPGkJjqJ0
	 UYpJLq758OSWuqrfbf8klHC3ISpfX57/ZKz3KffEoSsmlLcsMoVIlsaYtaRoY3QYooKEJ
	 By81eUFI+HoylCfohmhzSoHT+1E6WZXtmGPKZ+Gn/9GkdYcMG89R6hSjrvM5sT6x9WUVQ
	 JZHUx8fse/wVHKZojYkdxObWZsxOV5ZujVom3FyRUGWLW5HAwnQsTBZfTfJ4yno9YkXoz
	 iXf54AYfl2/c3O2m61RWsTsxvyMh7zYYWIH3hwW/5DANVOvtK3Y386GB50kw8j0xfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOfghSB0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrQEXIHt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D22E606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D22E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOfghSB0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrQEXIHt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A4pw2540097
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e+emj+6qiNrOat6TM8hv2pRr
	M0n+mR0YQ4yCLVvt6qk=; b=GOfghSB0/R60EzbDLySz6wvf+BFuGwqObvUm/K1B
	jjtXCbBTpoPoGnz4urnxpY4KQPwKrKeNKzzzuhMNFjnRRwIP5fbNJbNUPxsuX0yN
	LbU8HCjYzOUJ1BHRQgeddyUjwCE/GEcCbs/cuUQLJtmrgmbfUSoW6/uUTQfuGJwG
	N9/vjz+8AJQnQP9IrC7toRsMMuUOuEB1kziydvF7UzIJ0SCguBrXgoXSnBW6ODxC
	2E4omYL+JZTEktsv45YeL/oa04f5We2TZXeTfC54cHC8gn7TwtxZ9tgdSjnqrJES
	ySaf11LBx21aUbSKeLmsJkdTVgrUrysoiXlBJWvaHlEFmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6ne9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:43:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1293901eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213807; x=1794818607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
        b=MrQEXIHtZKClR55jtt83FOeFas7Mkczfn507RQUbBimJc2NHuAIcizsmlYZIv3+Dh0
         5iX44Yk5BbvJfDwrwF2oP9yq+kCcG9zVnoPiUMKKxnPpTBRSvRBHlHfe8LT0TFdUXIls
         tFeb6zDIwBaOtrxms+W42SVqhbYdABuCM8Q5MShUk3FqSWUmIp8+O2ya/wMA2PsrESzx
         anyxjhXyeSoxKb3hno77dNYftdZvmX/6yfoxn0RMwkr85dp5c/EOQr7OcNaliWx0+xrj
         02D9qWq78udH7taFc3pg/iYcj5QlmHfHz+sAU5qgqK8T6qWLQgtBxITUElM4MxEQz0GR
         SiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213807; x=1794818607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
        b=M9rn1mipcxi4wFdbwpxfFWDfxtYDZgpCyEacpDMnfumnkpQLlvP1IDj7lQsx4MlAj3
         q0ZDTECmCSqIp6MmJiAud8+S91lTW4FEY9wOwz0ry+zE9LLvpzpANuy4PEfi/p+ur3i+
         oGOHr7nkz7tpLZX0QBIn4klhrildajizTjFSpmOifXn8RfpA6ijTdtr5CH469zOeO2y6
         9PqPno0Lcnf7MsSPFBbr3iQs3iKwd2IK3fQnJEXgClVQTxTzA0D5gwu40S41Fo4F2S/Y
         6M0R/DJzreqJzHBSvGqFRWSxU2N/wlVQc+oM+ixhrgUud83R4a8AeLWkahdNdUKKpsgM
         l6eQ==
X-Forwarded-Encrypted: i=1; AL+hErEGM2RuHhCkLuqxxWW4ABwguf5iYFx6CHMwVfi7YfahkIkUfOHGPibWoyHG8lkQqQQYlzig8v9g3DWrE7HN@vger.kernel.org
X-Gm-Message-State: APuU4Z+PHnVVKMQfHooaOc5Fvb2asRvO3PIuie226CJobuHqYHjs0YtC
	7mO9Ao6Cn9Tl6TvJJScfkLAxFTANmNNIRFcaBQmn0XCVdyToGkxVi6ogC77jzva54okXhatcE7N
	wNkI8Nlk3WhCFZP5kglfWiViUdkeZpR1R4TsifDcN9EG8FTT+GE34YGkoiKIDVgnEevgW
X-Gm-Gg: AYBFou11Bm8nuMiPjwyzvfUKGJwEvChCSTrj3iE+qoiuuR6mCf3gM9AWOuZdAv0aUcx
	BZG40dR6qrZmUODfQNivKgMsxDxgtl1nB6pXHzdsxpXHd/+xZ8OJk5iof3+rTu28UUJ7KhMt2p5
	QcYWcvZctWFOShWS9VrsXsqxA+kfNkctgzQGFbYQA1kdGMtn83CGgokkDXOuSjbonzGyMiJsJ5y
	fO/MmzHDnsM8BYmry0yGnXw/7jGrykAH4qFJiJ+pK2FZ3lkjmbIlz5EuUNyTdUwMz7l4s9NXQt2
	AqyYMysCw6RQQW/jQnZrzApLbPmhokO4+9g/4ZtnxYJ7G1AJ5MkVywtRKsj7Z9LUvwnMbYJMRSf
	/sR6JhJ5ykVs3RCkIvHQk7I+qGf2giDjCeH9lQVryQnWUdKArqV2xF3kif8jnav6mb3BAKfL5mU
	TfP6ERvvXpt3Jzgw==
X-Received: by 2002:a05:693c:864b:10b0:36e:c213:e03a with SMTP id 5a478bee46e88-372573d242amr7233349eec.10.1794213806934;
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
X-Received: by 2002:a05:693c:864b:10b0:36e:c213:e03a with SMTP id 5a478bee46e88-372573d242amr7233312eec.10.1794213806393;
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265d05514sm11077499eec.15.2026.11.09.00.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
Date: Mon, 9 Nov 2026 16:43:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
Message-ID: <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
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
In-Reply-To: <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3ADZFhg97l+U
 UhVywlakSfmaX+VNd9wLP5fPHXNfpktk+WjHac9yxc6VCBtwX3N9iNAWCQpKiEuJlV9SZfs50sf
 Ej9ESObWeBzBzB2d7NcJz6MnvC7F5llIxyaeph5gPEb/sgvVIWs3Qw60nDrxxw6WKEUIMqA4ip7
 CFQGjNeDge92jPFwsoymwiya9ORxvvJr5ioHBxjEWw8a5xEhkRrF/p6YSxQsXrLRuqlA0955Yg0
 POSgXCVzvqWzwQuREMKF9XNQ6OS2fZpcJQV4QJQVV8yRWQgJFbMwVBbBvLjQevhldmWTSD/OulS
 gTKo4uoZ0ERjTnHtac5l3GbV7FWpg6zX2mdn+/79XaUKUj3jtR9n5uFf4pCvcViSi1Xl7op7YyK
 A+8goUaKRLzKVUBiEyKNdHSkajAi5ubBrT7TXZIhbVjUd/29qiqsTCULRJOQwwnRzmgjQWmTBGH
 xtLxtPNZrASSKpYGC7A==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af187b0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fam-3tgAAb8rIOWbl-AA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX2nXSQpZqO81N
 PxJe7QHDtim25cy+nd46if5KF5CIRY6JSv78utvdguv1w+7K5TIeU+OZUJlEV0brGpLwjUnwPjj
 QKQX1FLWAZIBB1WKoDnvQHEV4RgqPfw=
X-Proofpoint-ORIG-GUID: i_RDJXg-c8ZWtx3ZUlrwTkMp4UxMeh9v
X-Proofpoint-GUID: i_RDJXg-c8ZWtx3ZUlrwTkMp4UxMeh9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On Sun, Nov 08, 2026 at 06:48:31PM +0530, Imran Shaik wrote:
> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
> SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..1d5f27336f73 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	ptp@1c80000 {
> +		compatible = "qcom,nord-tscss";
> +		reg = <0x0 0x01c80000 0x0 0x2000>;
> +		reg-names = "tsc";

The node should probably go to nord.dtsi with nord-embedded.dtsi
supplementing Embedded specific resources like clocks.

Shawn

> +
> +		clocks = <&segcc SE_GCC_TSCSS_AHB_CLK>,
> +			 <&segcc SE_GCC_TSCSS_CNTR_CLK>,
> +			 <&segcc SE_GCC_TSCSS_ETU_CLK>;
> +		clock-names = "ahb", "cntr", "etu";
> +
> +		assigned-clocks = <&segcc SE_GCC_TSCSS_CNTR_CLK>;
> +		assigned-clock-rates = <250000000>;
> +	};
> +
>  	ufs_mem_phy: phy@1d40000 {
>  		compatible = "qcom,nord-qmp-ufs-phy",
>  			     "qcom,sm8650-qmp-ufs-phy";
> 
> -- 
> 2.34.1
> 
> 
