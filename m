Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5331E848
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215023; cv=none; b=DDz3pruWBn1MTxRjxCRotXN9H8hNeiSiLnz4MyMtxrXBg/oqDBhAWYee3z+82+oG/+1BARGZuouGpBwvP1lV17pLxiMdENGtzUgVgbINNHpifQWhq5j8fDa/S5W5weXr69g93g+TfHGQYlqqLlTSCCxAFQziA5TLB1o+UQsb0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215023; c=relaxed/simple;
	bh=Kt0kHWeOa2pc6HHNAuTm5CmqSOse/qvukTWTXllpwys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwjSPZ0jWftKnPUe/qG9G9US9TiTgcQhzMF/5NZg7MLKJ5ASUm1FqUKVK5M84Bvbr63ePwBv1Et828PAB/I/6gLyMgjtWBxaN4vjRkhT2Rznp87OI1IqP2YGm7rdP4RJxiPXAe19XRQEhVylWxrEwKofcseuESE8GV62pinBrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIsG68q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwGRm2Eu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIsG68q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwGRm2Eu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJr2A2691984
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=; b=BIsG68q3sOPos8S7
	4l+qmzIBNZrp/ZOfLZUOu3sWF0E7t85dkMttaOR/Ubd8NVZNJHKJHYlIMlBSFJAb
	5MeTcJdgJH8LoXJLFS5T1yqlG2v6kEJC7TNc8rmaLfbWIn9cQVYe5YSwntKWrflA
	Z5Sd2owNJRjU9Pkz3p+kUhLT+A+0E1acYQZaUsjf7yCcr2i2ai2yJlUZ0ZT/o2LI
	lbATLjetmPPEycnvVXGuNmU892C6K//rRhToC6FfDLSmZMykev56ViSh0+6sgyGQ
	Ahx9+lnxEQ0o4I8Di8mWhI5SMM/TJV2pS/hKBJRRe0y5ELBnZjTazIAhRHpxDa/0
	n80WLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7t56k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:17:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e57e56ce9so129790885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215020; x=1784819820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=;
        b=JwGRm2Eu8+LXTs+AATtPnecJ0Ah6LnhFftnK1KNuQh49HBbUtJPb298ISrA9ro9BzB
         pUQxfRa9Cj89B27Bc5Ld+E2xj+R5saQZThEEIMg5uPX8bKFhUoYns9zxfYX+fEZp2PVu
         2Qx0xYOyE9abn7D9bmtYiucif9dcFRZ+UpgFPf/Ep+DFX0nDisCOsvx09VHeGkz47xnG
         PvTc7Uurf/enFZAxspu5tyD41+9SJr72kYdtuz/V8zDf1b1uEWWFybMBUhd3AGhhVMFc
         A8iGO4rJPCvxlSs+oUFLbH60d7NchzdXJixLxb1sR4J+k2r6N3p3D+jXMP6BTH+1dSQq
         VDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215020; x=1784819820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=;
        b=NbXW8SIo3jS4j/6YLH75qIpdkAaIxmiNSzQDlA7ogYpSnapzvsIBFTj2Kg7k+TPIsA
         PamyAu7ysNWaX6Q86us7G8eoJi8VjVuIUwYBFPB9v0JIBATbrkKk6+GkGfcMuQB2v1Xk
         vi6j5egEAN1juLtC9/fQvpaC9cjryIhzcb9gtFQEN9MRKfi0rcmUJkWtBe7oodMm6ZTb
         TnrDbmZzTN4JPxSYE+nOnHp0q67vjL0EvHfNv5dlH7RCVbySuoBUj2or39xreNVMq7Bw
         eUILEgX+QJcauOF+2yUzOR+rGyuENzHx/7XpKRj6aeS/4WUhh0A7/PUfep/jOTjGqCEt
         fo1Q==
X-Gm-Message-State: AOJu0YycSF5GMynivF3jjvlmg6fzM279s+NDDE275gnqQl0Aw4ww8ufb
	XtwnRjWgG9lxLnK+Cd33UoHhN7gEvXIPD1Jd3G7yQRp0tauKAcgpCBg8wNrjcgZhMcWs07QHHH+
	QThoGBsu/OCm+2B4YFuzCdk0TauThUZRRLGHLbikdlsNjhA0NHD7ePX1h6IjwoqX3MVdO
X-Gm-Gg: AfdE7cmMKqRc6SHg/iA3S+kHM2nNZH/fuDuY/SK0wknKxra+sR4STusB/q8YZo1WgFJ
	W8+BxGLDcVMprrUFwdzJRCqVh+k2JW0JLZwraBobhylQvk/9wDqEmA4mB0M5Z7fUNfuxqBsOxDL
	fBcPzTc4DasK207GDFU/z6aOipWv1aU8J5WrkM6v0so1FV1FnZdQEvnM2TQdJbyMeJa02UCOnQJ
	+yVW50Yah6GjiNPZmuUSf3qNhiKN0R5mQthqnXipZ8FxOQ9lMP/ZHXNxirGWnGi7LacQsNOjJNO
	niETR6ZWHmI9vRJvNaVtbuDkDS0Knxmfe9rkriG+64pxYlXsWU6bRstztuwr02t3h0N544wVV5i
	05/ScERcWPiZaYfn43NyWJfyR
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr1865662185a.7.1784215019513;
        Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr1865658885a.7.1784215019078;
        Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871264basm238140066b.7.2026.07.16.08.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 08:16:58 -0700 (PDT)
Message-ID: <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX8NGtKx3gJy5/
 lSeT6JS4Ec/mSWABqLauEVpyCUn8MHVaK8M8TALFTFnrp+laf8HHpLMqmhwTXGTX1iPYsv/Rs8w
 hh8+UTUjqLe5y6Lo/WTXoOvyjvxe9cw=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58f5ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5FnEwOx_HHoQhKJlLkoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX0i4e0LoCuycN
 xf3HPIqJjeBz1eQputTXe4PdmFuS7NICAnnwf6outDCnXiOt2qXw1bs6Yd7fPAfoSgjTWyq24tL
 O0lCF9H/mrnZg8RLUegltlHFvj+khYWlloOefrYZQ8cELaJkS7phC2lNrTbrSpvHJ2pmvzoNii8
 oNA/fFY1fPAdCF59YBIXef+HILCJJJrAkQB8GLShLGCmdPcsGz8sYN+6zqlTn/f97kSSaZq8tw8
 iWZFj5dXgxfw/T8nQA2K7PBY1TEt9PZHFFrhbRla9Xow+hVSmc0Ngu2GbGm9IhNEKe77Z/iEYHC
 8JXPRu6L/s5+YaD5h/68F0SBsdUj0rnKNf10pgQcGjWl83GvTXWclHc5X9254QVU9VCoIM7eZoM
 cXQYx9JviBjYaWH1/NcvkbzmOdb4i7Bwq8zvZM1C/UuY7dIUwd64oP0puuw4BzudGSikejjGYJ4
 B2RH12HBqHT4GIyburA==
X-Proofpoint-ORIG-GUID: bUNnXLrPpyKsAUFojl_1Y4cqqpel3juv
X-Proofpoint-GUID: bUNnXLrPpyKsAUFojl_1Y4cqqpel3juv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160156

On 7/7/26 12:12 PM, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..9ec7c256b80a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
>  			no-map;
>  		};
>  
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg = <0x0 0x892e0000 0x0 0x20000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg = <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		soccp_mem: soccp@89300000 {
> -			reg = <0x0 0x89300000 0x0 0x400000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};

The updated regions point to "SOCCP Boot [DTB]", whereas the old
regions point to "SOCCP [DTB]". I'm assuming HLOS potentially loading
FW to the boot regions is fine?

Konrad
