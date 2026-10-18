Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B86849B1E1
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327768; cv=none; b=Kbn384BvEB54LY1VBpPkkZ4g3i4syH6nxRklp8d4NczqLyK3Wh7tRrWo3vltk5O/n6IWBQ70df+yqD2AMxwTn/rjCouDrC+NdzBclQ3+AAAWBVhiXvzn+odJoj1yuMh5ystsFDRRL8LCzhbLepGZJsfXrG2pnGNVXxCm0W3f4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327768; c=relaxed/simple;
	bh=3H5WDrbLsyNmUMdQMd7cl7iVv73It2xWoc2XO457wBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPAAT2XTUmVxzwcfQhk8IWXeEvMHR/q7wfHSzdPvNu40HrhIA1AzUILRlIgFnLVqe6j5lxzN5jAYSHYTn5KavaEbk8ngPdKavGZAB9BgwY5r70ZJJLLCayYd0TKbWHa3SDAS7aedBiLA4uIJdwTFfGXTmPnzh2X2OJQMowOh38o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIglB1Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrNTyPCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIglB1Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrNTyPCQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tCKN3683718
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oR0xHgOBXTHB3mbB2fYrEG1u
	zN9XOep8KCEuy/4J+/Q=; b=XIglB1JoNlxqpHbbQJLWsKmbWDv1IVt+GHEjmKz6
	14M0m+PoTeHRkHuE3wjjUUZ87BF2hKQdDAim0Fjp0ebnVYlK5KcoStz6hymnVwIw
	rOcAhqmMtDqKPcGhQ6z5Cfp76BiELLZ2Nx9xRiFhboApVbYKqA45ffM5Ay615FK9
	Dl8Js+9gcX7v3cdkr9LkRUW/sV9CYQdXREJpcXMn8Fleh8xvL0T9tQknBHZsv7uZ
	pCoOlh2hgFVILJhGnZ8tIX/cHuGCc6FbN7Qwjl57Yqs6gUUcGg5TcCLWXILZsxHF
	VHEXQzDwBRpXwAsvAq2HCjb5BK9vaMkzuhDgMvM/Aia13A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxk3qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 12:49:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so5488221c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792327764; x=1792932564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oR0xHgOBXTHB3mbB2fYrEG1uzN9XOep8KCEuy/4J+/Q=;
        b=PrNTyPCQPcjwXfGCZF1gPLJwicrGr+Rh/KEddUJOw9ejpfPrJagiwNLI5IxNAestY/
         zATXEyBcLkO+YiocX7maUuq3Npq0UD0HR45xJxzU5PZqlkhrvohvf/WKAWacf5HAvD+x
         LNt9PPpr0N0iEmg5cd6XU6bfxK9IVAfaB1drVtzdq7NJhQ8HzRRNKyc1Bu+g5QWXoD+N
         i58pZDzVmsblJLjsDJGTgcHwDutwrz3uYGR2lbvxtT48rir0YPmxqf98gDfziLk7IBo/
         hUuX0yuryk/UOxswAJqG3BX10RZmTrrz/3pvCGg9ie/cNI0CqlKAQBZu4DRG8gYU+PKT
         W2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327764; x=1792932564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR0xHgOBXTHB3mbB2fYrEG1uzN9XOep8KCEuy/4J+/Q=;
        b=Ejw/hXGq8adZItoe4nQVSzKfyxON1B+fLy9Bj+Q1CAzTGcahqtdAFl+d8AbG7b3Nc9
         OQzSS9fCpwkvrUKTu8P9SFJJQWc0sfm1brvCKBd8Df5yY2IDnzC46vIB0TWSWDhHNQiU
         f1Q1A0jzKPShxRkWHcW/IbzMawQ7c1Ev6xgRrfnOaoxLrsIs1+FejuC6dZtsqjJdgRKb
         lV7dOXpiXwQ+pVXe9X4I9SSbODvTDnnzV8AiV2rSQv/lUcDhLIdhQtAAAe3zQ9FeejB9
         +jOFnne7Jo8zsvHhRQvXd7qHl4dia+kkJei3X/zE119Ymh7yISfYrPDi7x7LCw3eXusV
         RRZg==
X-Forwarded-Encrypted: i=1; AKwUvByIO6kE9ME3tKjDicvdkSIBDXQRRmjvqnZAZAzR9P3aMBCraKXTTtApD2Rk3z6hLlkxcFoYt6VSQpNjIW+g@vger.kernel.org
X-Gm-Message-State: AFq9FYIzLsINeW24XqNzeeHTotGJl9AAj/4Tt232s/9/1dYvf+idtEcc
	nnhhGybBcz9h7nkr3UV7AxvJzBzyX24qT87sYtk5zwSwF8CHFrgUAsPWG6FFaqfEgz8aKHpEZCp
	IRjoawOjbaqMuJU2HyeyFKquG4WrNY9xWmEtefje1YIo0ImmODBDMo4mR2VOoiT1rQUykZ2/+oA
	qmCoM=
X-Gm-Gg: AYBFou0HitOyZW9DJGksxPy/BV5ByrC1wHmccmta/qQZ7KPgDgy0ljC4FxzVpr0ekGa
	p+4VggCqHw/vnys1i3DTryfMQzTc0lb2sVgt/EeLRB08r+BWSBFIIGyTIQEnQIEyZZRmawwdKrx
	rIhkqN5/2EJbE48seNSI9Ff9aCLb85f06mABJEBKnVIoxIlxK/QV6CZ/IVcUXMx2kNY8tGbGaFe
	aHzZMrxT9aJws9oAQBQlJkeE/H1k1tAdK2f0t8Cd6cHW/BTZ6+MA7/EcodgBkq5kVUSahRH7dtz
	aB+C2YeW+pyB9NepC/lalHmW8KdsNRjvy6ch180bDfZqOAXBExh8kaYK+X6u0SszWKQZwhiBgX7
	Q1uX8FCeNM4MFvas7elqYmZBQme1NyUAr/r5thyf2Og==
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr11330676c88.15.1792327764257;
        Sun, 18 Oct 2026 05:49:24 -0700 (PDT)
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr11330594c88.15.1792327763450;
        Sun, 18 Oct 2026 05:49:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm21496025c88.2.2026.10.18.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:49:22 -0700 (PDT)
Date: Sun, 18 Oct 2026 20:49:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA1MCBTYWx0ZWRfXwUT6Nvk7hCsw
 V2/9L+xVtd1O8mXbY0BRNOKGJ7R90Rp9SgcFhBA1Jy4Rm4Nq3RbMc3WohBAMCdAwowFsxqBZJl4
 jnWWQcZYSuJfG4ES9+HlxTy0PW4l0UA=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad4c055 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BAA5RAoUlf9vgojSqUoA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA1MCBTYWx0ZWRfXw8SdHJRVNhmb
 bJz2tAWtMoREMpcueL1dDjLWI7jY4QZeAatLclASznbjl+RZ+zR+ZIC0tZFfo/fvJqtxXnFQamG
 xidKRVSCdjjmiehf6+hcCojvftj3Ju70ynwe+8R/b43SEENaEkypSAsz76AUK0+WkWHA3iFZlWH
 F83huLIiOIvf88WB0gN/5sNwr891OZ4usK1gSKgDAGqjPaMNkaVLt9InzNPJiZryQENHXrDl+bY
 Wgim2rtiaeEKuud6LGsDTMYgORBVdhjdGS7Ag5aW7KyroOUo+8A2oaaklXwrTan92zndaNpFVL6
 K+nM6XKkS01y5C39OrPRX5NTvBH6plnsADHt/zkRa+7/HfDNhRjmHrpbjxkv/wS3IAnT+SICe1e
 WCbjH5xuKnDc8qrFk1TOr+DVAqzgTTBJxU3LPVJ6PJM5t8OUSUrGSUlvVTNIKRSi4PLZgPGsDP6
 pgWq1ZLaUVXwjGfIKmA==
X-Proofpoint-ORIG-GUID: hGobG-WuTR1dHswZPwomMsYSSKFyHG-L
X-Proofpoint-GUID: hGobG-WuTR1dHswZPwomMsYSSKFyHG-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180050

On Sun, Oct 18, 2026 at 12:46:47PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 47978df0af92..89f8d36ed812 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -434,6 +434,10 @@ &spi16 {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp {

In alphabetical order, I think it should go right after remoteproc_cdsp3
rather than spi16.

Shawn

> +	firmware-name = "qcom/nord/soccp.mbn";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
> -- 
> 2.43.0
> 
