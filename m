Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E5388E72
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163281; cv=none; b=reGufIYHUcuPy9rCbqzXZgcWlYPJ4TWVgeYmXF/qzwkzXdj65AEJv9q7s7AXQSicQFp5VwCEiTMwSmzYHRhrLLFJbFDmhU1hBFZRrIfkGwt8bs8LRFtsJ/xt/dOjYYd9P8zH5jVRR4rKTyxefGCcQFqe+iYHCSjDFCjQYtvWcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163281; c=relaxed/simple;
	bh=5md6KuDV9zKp8xQjKCQNmMUhPxeLSlGVAcREBRwuPlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/iP8qddQsWjMd0FFS9hfiSM2GSpiLhx2a106llLTMnTvViLvnFDPd3yT64icDpn7UA7Xa8B4VG6MsLumtaYEQeMakp+Vg3296JEZ4KVNUFLww/wypjA4zsoFI1cWG99TTohy+tuJUBEQGWCzrnrGhllOpFxIGHkNTcLIw3nOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nefTiTcg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpIVQCky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nefTiTcg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpIVQCky"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlXfv3895525
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66BWVdedUAV3Y/tDnbicjHtC
	ixDv18yVw6FXtU6dtBI=; b=nefTiTcgTxVRQ3xozYEtBHE391F2NsFXTrk0AB24
	c0qqy76qEOcNMbs/V/NxsCHRpaubvBh6kvOjyz110AE7uj/yKOOCJCqMb9LSuHur
	sK42CewYJBv3NQRh3qu1iAdTom5wzlkaImrDDRnXwdUBzP/f6UxYyEBwERNCp6VS
	cuY5PqPsc8ilr57EtmqEieg2YVYuLxtW3xC3EagJVfrmvVhDEudALj7wYHa/Ssa8
	RpO9zs9awX/KT6K6RWslkXJc2tPeRtG1upaKug1DOBEl09iM61aMczF03EHX0Lk4
	EOtQief8Ed15SIfzvJ5XjUAK6spos/KZQjjUQsPzWcWh+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs32ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:41:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5304338a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163275; x=1785768075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66BWVdedUAV3Y/tDnbicjHtCixDv18yVw6FXtU6dtBI=;
        b=KpIVQCkysmqcEWhW1xx1intvVSc0d67Gy0Z8UPJV5Au2BHOVFUIsT9uy/Y0ycmOr2Q
         mSWyKZGH5KafXbfSfVwuetSuw7ANkCoXMrLnOIm1CahjBfV6JtSUkHpA+wlSR12AfELL
         p/azexzju4KiuQ7LBBZtfW7BrdpFQtoY28QD165QFStcwSpXMjsW6/fL4+N2PSthgYlZ
         o6Fogd+HY7wDxF4iqFMTxqI/xENPs0dKwdezYV1waE1n5qx5Z//Uo0SSuM1H9vq9pd59
         rM31gev07B0b859St2vJ2Zz197HwsLCP0c/u1rufAWkGGGrOPLggEn8aoglRAx/zBa9X
         KwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163275; x=1785768075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66BWVdedUAV3Y/tDnbicjHtCixDv18yVw6FXtU6dtBI=;
        b=tXbM7z0+am1RpN9PVeJQWU6bYsFWiPzWU9ybnbebFe1jeMP9BlDC/7nZkTOZxa+MkE
         7KlcR0t7BcC0JpK6KaZaQ6M4OnOy9+oe/0fnN0DJVLeJmcYQyBNEkdVa79Ha4oz5QRLJ
         pTYpCQ9ZiLkHlB1rNea7sz3n8I2kLGC4+4Zs292uRbXE8mkHzcsCn59yofqSmwWZq6Zg
         y72q1oulhlmxTvjoKPN1FfPTieqgjzk9jViyD0RIJRbeA8lE9U+cupgB4do71iiMW3BP
         lrPO+sdd7+vN7l763jl/nKwXojFVbF01UGLNzeddd6kfydGMvl7SSvXQTV/5nXAk1hW0
         eS/g==
X-Forwarded-Encrypted: i=1; AHgh+RoTdt0phJLoSQMyuAeM8ypuIVVlQBMmzfPzZyF05Cakf3XJVSJeLbYrJ7X0Gd5AEkR0a79dx37vxfr3ioLP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NE3G8vyNt1pl6uk9+5WHoBiKquZT+rteCo6Sxy0xW3iYw1zX
	5d8lJmV/+3a6YxNdQrsY08V3TyOJFDYLO9Uy6Yh88n6TvtCUzlpBrzYnKxHXesTNF8w/I+Gc/Pj
	nvONc5JH8RstBKvVxIP9Ls0nNYHQjPytdStTqqnArHse54kCYjN+4+QKsQH9MQe+8Jm4a
X-Gm-Gg: AR+sD13+FWSxNunTWjblMvYmzg0IY6t+a/IPI08JNPkUeDayx4nQmj6HrUW33AZkpk/
	VHccIull425xlTb0o3WMJrszFP19yKkxeYtVnKr5K3n/Uv5Zk2IdcXsq6ZHcGHsspx7GyLlGU38
	EUY7bDXGBm/ID7Vo0cN4UWcdHEHYoqwOrU4AvEDIJ1RjNQNFh8LCftL+tlZh7wfOmm8iaQ4/7d7
	yW8/hXQzvI5DJT9qwT9rN81dBSaryHBwitt5JkK/EfQH32tvC+DFVs1gf5GEIP9HZFRgU3+3K3Q
	sERVOWICw3+5As+Ds8ag+JiTG8+u68nD49CUSVSOwz1W4VG8fx/ZIBEaXBlioxA8puvu4AQdP5/
	3P5PlGk+LNOXBsU+H8vQTGoyRQKc=
X-Received: by 2002:a17:90b:2689:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-38f293cfd0bmr7865357a91.3.1785163275071;
        Mon, 27 Jul 2026 07:41:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-38f293cfd0bmr7865327a91.3.1785163274477;
        Mon, 27 Jul 2026 07:41:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm94957307c88.2.2026.07.27.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:41:14 -0700 (PDT)
Date: Mon, 27 Jul 2026 20:11:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-dmux
 subnode
Message-ID: <20260727144105.t2yz4jpkuiykem3a@hu-mojha-hyd.qualcomm.com>
References: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX74U69hl2KY1W
 Ds7S5UDYozKDX6h8KtCMJUzYUnjMXvsyDBY6Px1R7IjwLzxMyxnL7YNy3Z4nS57S/X33T6qDvUc
 YLcf2cVczwqsXNO4LFAxzl/sw+BYnyv5shk5EmErV6xHu2wew2af/4yKw3v0mT2V7TWbtW5HQRj
 mJnlmt073I1f+rIAjMi/KQWZEYgJiYkhoXo2yyNOxnXVdGjwHaF3X2fpzBbEy24XLSaU0y7Oo1G
 2DGpC87BwKvxgHm6laq5IxeKdbAAr5BSAnP3ZUEWEsQgZN/udFJtCj4viRGETlophGh4QoetXwg
 //IdGmeZfncfTD9K7Yo4yfCq3Gpne5BPFW3vPnti6SAs+iFJtRiG7Y+PuoBIMAOGVZ6Hv3BwsaC
 RRtB4Mxlt5gA8k53sYCvhXwW3AU7Nx4E51LQ2nb7ZioAs4j7aumkNQwFPt4SKCyxOWmZ6em4ul0
 XSHWAV1pJ9hwAGFaj5Q==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a676e0c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=84DI8ZDaYnnr_gmyIqIA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 9FlMlYiu9iGaWlZBzUJHhvbBrkww4TwE
X-Proofpoint-GUID: 9FlMlYiu9iGaWlZBzUJHhvbBrkww4TwE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX2nXzrQPa/ZsQ
 PUUZ0OdSI36pNTT2wflxS6sDQHTiRcz3axnNcQ07K8vG0z527VVBIU8ZfTaxc+vy+xTMEWsuHsp
 YfKaWZ472S9Ai72EwV0jxO6E2l+Fg2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270138

On Mon, Jul 27, 2026 at 07:47:33PM +0530, Vishnu Santhosh wrote:
> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
> does not list bam-dmux, so any DT adding this subnode fails schema
> validation.
> 
> Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
> mirroring qcom,msm8916-mss-pil.yaml.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 253b14eb2b598f0ca91854c8ff4d0b785090e621..17461d92165b26eb669809ed7dcdf029530c9223 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -44,6 +44,11 @@ properties:
>        - description: Firmware name of the Hexagon core
>        - description: Firmware name of the Hexagon Devicetree
>  
> +  bam-dmux:
> +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> +    description:
> +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
> +
>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
