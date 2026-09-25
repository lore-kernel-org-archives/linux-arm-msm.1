Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409242EEA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319307; cv=none; b=aT1H7trzqUx7X0vGvKiihoRkcdY94OkBcTJRDKG0Ya8II/IgMssIzxCHwQcnzcTlYl0/yGuzrWAvqbxxme6efTNNR8gzpJ59yB3bmMlV2W2abnlf85rRZnrIbqP4V4e0qG2UjQdOe1fMkJWtFIqiFP5JE9/5T4kkSbNNX0wUmGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319307; c=relaxed/simple;
	bh=urC2V/TROHH3jZ8x2AUGfzXDJkIFKGZjenmPfOmGKt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0MGf91dvBqoIZ5o4nP3EGI/mL6ECbBJSQqPEJIHQAh7pAsZBvycgyGIOM/T5sApnaDaQlXD7nlA29CI0fMrB5VwItSItUqIcTN3f3C8SY+SbLgIbT99a6A4xD3UlhY/zTxrnrrdik2yZluDbhg0y8Ev48DYs7+69biQBTFeN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQ2qN2QL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjZHKLFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQ2qN2QL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjZHKLFq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yam52911753
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+i1Ci6ISaO9TjrU3L28qZpsn
	0dc7H439NZYktOph74M=; b=YQ2qN2QL4ch+FFUMrykQD8VJoAsp2wPwT+vbL051
	SakrRUbrAj+MRM1ZDd6IsMWtYrLsU4X7AugsmsPUmm/NGVV/1fsWX4V4mWcSSPfm
	SeFW6J5Huo06U7B4YQHZGUWCAI+rDAlDDGPxZEVKg/qjYeUZNYT2aEgWvOQ9TJUk
	v9TqU9GhcTxojaTv5+TaX5Gifi/q5wwZsGzHq6yve601VFNHTSmN+jvv9gZjV6EU
	eStxYCoNBARgVYwzZE+GKpx5gxfXwhKraEU/4+PnV6O4sfS0oNVr0X0vLpWcGE7r
	m31xSnkxvrVar84RG6iJBAmpb/nvfv/POqE9k2zO3GeppA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm50f8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:55:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342217d8d53so61585eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790319305; x=1790924105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+i1Ci6ISaO9TjrU3L28qZpsn0dc7H439NZYktOph74M=;
        b=MjZHKLFq80Nn6RtAd0v3HFSsfC8UxtBmPuj9VLSJB1IBVTmWBV4BE7y+yJR31gTlI2
         zF4tZF3jIXUaIHFN8jNu898yE1F0v6I4QPp95rgfpDLR1U0iCYU937vQiBAZKuObvJCZ
         BHUZRheMIgU3wY2MvvMVyiMt/152BIMIJeRvJg4s/FvI8FaaFybgKGciWaykJfWRWzHr
         k23HvHC5Dp9JVfrKd+IEZslZcKQCztzmymHQdrl3RvuBt4P0H8FX7I7uUFApMUhtG9Ju
         rMuU/1k8YfyJTpLC3+ZD8b9Pp0GnAqgjLET4SRVnHUaY88Tz5/0D7QrfUOaJAo/AwlXI
         WMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319305; x=1790924105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i1Ci6ISaO9TjrU3L28qZpsn0dc7H439NZYktOph74M=;
        b=li+cpnOpb2Djv1Vq98ecPj3YHoInj/K1g1Vt6FZ5YPLZCAgbDH5Wuis5EVaKmGvRH4
         An2oUYPKEbyKySyBPag2Dx5SdjCow/1rn4BrsBIrl/S/pFaSOhc5MqdLNqYHCQEYcDIG
         lzwU1FC9FxdiMpo0lhKZu2F4WmpeD7Fbd1LlTVxnnPcl4B8voaSV5Htqj82bXeligv1J
         TA4VOnp4ENLpgSMGrWFj2E3Hhf1HZnvIfVLo7kaZV9E3djwtFmO1q9fB7RcMEt66yUG5
         +1IoyPQIQk5C0rsIOgydOG0Olr8srx4eaMiLGy9BxxyX9xHZc9SRnzrjCOUauzR27GSc
         j8YQ==
X-Forwarded-Encrypted: i=1; AKwUvByuMwqRhvmfDAiTEGO1YC+VFu+REOeue9BoPYxmGU4bE4uyK5U45AYSNEGhwHRJpQ5HVzqPuxZKV3Xer88o@vger.kernel.org
X-Gm-Message-State: AFuF++k7eQyS7ZxECDgKCQOoK/r3EMf6mnUR61h6yaCFVuRDTKfoB0IB
	GEoXqX366P9jIxiChLkXsDQTap1ZyzUbnksWRGK3Ba1pzy8A6zpnBTGHGcYqdwco8PxXMmHLB6u
	thbHQiAZVL2ex+rOhwfoxzYpHbWCsZ7IlUmLqB+kea+AomAyFtqNJ6EhX/NWOX2YhY3nK
X-Gm-Gg: AYBFou2JhpHhYoE5E17R9ZAEohCtsAktlb3Qi3Z8zTQrFmyNSDkwk9vGSuA2iX2MjVP
	sTzujKb+nwkQWk1C7663UX1nHqHUSn1hZe9zVUTFdxdoC+eks6EdbEl3itbtKNox5TOzqGoW1qL
	L93c00bcjA2mE8cyVVdd0IST/W2bPxyFYM6Ztn39qT+I8BKcvuNxWY31H7a5inYPaH7bJ+EG1Zo
	KIvVHIHfKrOZyWKfa1H3GiS0k1g0xZ3KIhLE6rngdwwqVikDYMqlPBaY+PdeoSU9I8/Gj3hSB65
	nlkuaVg1NXp+VRPBo7kB/tEMXa84AsXW5ripk7H4yY5qq3cO0mlhbMPsDQeAAQn0K3AkQYIJmiH
	AnbXgmVf5uWJeoAZVyt3i/+5anlheE/z+7PMA6rWz/g==
X-Received: by 2002:a05:693c:638e:10b0:33c:1bd2:1d96 with SMTP id 5a478bee46e88-33ffe33ab58mr3783057eec.0.1790319304642;
        Thu, 24 Sep 2026 23:55:04 -0700 (PDT)
X-Received: by 2002:a05:693c:638e:10b0:33c:1bd2:1d96 with SMTP id 5a478bee46e88-33ffe33ab58mr3783035eec.0.1790319304006;
        Thu, 24 Sep 2026 23:55:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm4130176eec.16.2026.09.24.23.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:55:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:54:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add EMAC CNOC APB clocks for Nord SoC
Message-ID: <arYawDgjni-nMfjt@QCOM-aGQu4IUr3Y>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
X-Proofpoint-GUID: aUmtXA6UxgFgZkBW-55avEivspmuPeSe
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab61ac9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rzbz_-ElnrvAUyxyaKAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNyBTYWx0ZWRfX+Zf8WX9V47sw
 YkzrUd+ZstzYDABoIaiWMRGrDnRwc0IEpWvb62WMqFxWI4AE2pVv0ZGiinFMPUNSqcTwTISqL0V
 mtSABTT0XE5xY1mfLnG5FcNw8VCy4VeYwMPAYMI+mbkJQZR2wRs23MOXR3AQmsQaysfhjpl5EJI
 nWqkksKdwIwlYO8z4fv7idq5tLs5iCfcW2Kn8K/6yOkBS1L0j6mpZAQxGvZEatAJTOefz/cOZS+
 vPOwrUwC1T61hdgKdHQZFbln28v1TigZCB2rborvMwYdM2d+X2DPZMEtWG6T4vAi2kljEesUYhA
 ua3AdZztGfPNHATlQuvQ1e0IWSKkfLqdwAZSi6E783BGV8jShbfy+Z0YZYt15lWQkm09TjDo5fl
 SDwvh1ua7u50eceHy740oEf7Xquh/i8Ei3jCgRa/dGZJn10dnEJlqkooKPHC1UyYWdCDSokKS+w
 hyFUgps1nPs9OMXQkFw==
X-Proofpoint-ORIG-GUID: aUmtXA6UxgFgZkBW-55avEivspmuPeSe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNyBTYWx0ZWRfX43luYZZQ/tch
 Ko9vKaYNbbUujr7EiXX88FvKbDk3sC/kjk9JgkdGskAtmlx25Pa7JEhs/wO+YDWVu0zA52d/7Ig
 CP8IMgFs+/5Y8svBNR6jz3GIOftO8xc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250027

On Mon, Aug 24, 2026 at 12:23:28PM +0530, Taniya Das wrote:
> Add support for the EMAC0 and EMAC1 config NoC (CNOC) APB clocks in the
> SE_GCC clock controller on the Qualcomm Nord SoC. These branch clocks
> gate the config NoC APB access path to the two EMAC (Ethernet MAC)
> controllers and must be enabled for register access to the Ethernet
> MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (2):
>       dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
>       clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC

For the series, with Nord Ethernet related patches:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
