Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439187;
	b=eUQmmKojYV68l8oGWBj2yXEM+b5xY7Na+HyoTlJ53/BeE/CU5hZt9Uer/FrTtSq5vfaE
	 56jbJbfQ3/D2dmpYieCaHgzOAyNUHmHZWLZFpOz+YjOnGPtZFCei+Wg98kQK6tb6z2Lhw
	 sa0AuKLTTYjwc3GGTN2zDHd4k4BDUHnfdpX6BQLJFbPdceHBybE4b6ceFXpk8AZ7eKlkg
	 JFu8QG798BBWdW0tgF59L9U8y3ITDvdhy3p+p5SDDEljHKwoSc0qVN/w0JkCORsODfZVh
	 IFMeNP1TJnUY3DOHK3CvH6Ov8NYF56+BSgEHPp2ClU+rJHWJ2HqwkUn0r6G7c3r9CXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
	b=tb4v+KfbPsTZKqTzR2kT7ojN6jvdNmldCuz820O77onbzTchnJceFDhNz0qdJDY8/DLO
	 9vFUQIBXua4h5V8XBWyfskmqVGvFjJxSNG3aQSCG5qsnguQOLVduesotpNGUW7hUAADg7
	 joT+moTvQRO/PzERhZBwJwBIelDuyslXxXCHkvtzW2qWkNGogfe9i7CYwR4KYSxwmHIx5
	 3DfbZlZPGIwMZuKxPsU8DkKAIIUsTyUSzevSYBHjKXXzfYf9F1/RNkkdwidKFzaIjPXZj
	 llcXYM7ICLbgJovVLI6hP0qcu5qB3jHIiVMR6HM0HIIOZpJz+U9CS6qq8dREG9XfHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D5606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCG9202478555
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CYvomfEjy39LuVTvYKKSBWmO
	SbB1CxQU1hTSsCOWzQI=; b=mEIydQaCn0XOeUq26SvZH5rXZXsBnUtA86crINI3
	snB9cfnqZz4RfgGxGYq4Poscsyax+YyNHO5xdFGxn32s6EuXjwXX3Pd4298x9SRe
	ZvYiubIY4v+ozxCjCri5iJXj855ctOQJiNsspG+Z7Ir+U7ZeP6fn3c8oDaE2Zkp0
	rTDLlVzIFjHnEXtrKIj2E7200CXRM75WKB0cUaDl77xGecAysds7yOJfybEdl5P0
	X/p86r1LgtOjOVowX5l+S3VEUnI5FiedS9sKi+ScUyl92/bEsyORYUzzavHjkWL+
	UnhZD+SzRSRiLTP3VOmpXO0wY3svAF6k6U8u3c9283T+Bg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9g2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4137062eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795439186; x=1796043986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=I6XzR0nP8Wvn+QBoOYKjqtSj1mbkb1jTdnF+/ukuIz5rCVQxKGSaFN4lJOANWAYR3/
         eRU8qfozUtc6UeY3oNwEni2VOdLz18b0RQX4B9bhBMq0O07qJLZyQIqy9qg1PS8G0HiB
         +fHfXTHlmsRsCixXTeH2D99nRfEVhTop210guW2Z+6plUmJHZ/NwEMXohRa7stUjMThC
         hrYOaa+49s2mQEQR39F+rPlh1bw1/E0rlZBjpQg7c5GXk8GFO6b21/uyIEJLQMQXNQ2I
         Qw+D9w3NbqDN/toztQwhmpaZCJwocY3u9hqRyWG79q/fcnxd/PylfcOKttCpThjCA/5z
         cGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439186; x=1796043986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=ByKKoxEZNKcuvz3qeihKMQKwg5LQFlAzz03tBGFA+jkArS8mA88UoE4kmd5BzEHWxi
         Uth97HArRxMuCNPciXmH52s1Kefd25DlBLpYVIYFRBPZdDufuunCVqjt5T21OEUlS9Sc
         4MH95mBrbiSR5xjRGxHTAfg8K0Mp3apdUngpZg/DQY1u+9pQrXlz1nkHuuftkBbEf3yh
         /uLE+qrTdUTmqhZnuHBxh/9PEECitpbDgc0GCarbWf2BprD8/W1UvvkBpT9V+W6hyBZR
         wWNJbJ+OxL8gQiFM2FwRF+xWK6EQQczV9qn3z96Y5maIilvSlEQ6uZOjsw1FxgmxUU4n
         TTxw==
X-Forwarded-Encrypted: i=1; AL+hErECS9dCjJk2xqHCtSAQfbAttl2ZSUR+XkrkYAUuTfzjcMe2pC/OiHudXO82kIkofmXjQ4qMBaP6saenApod@vger.kernel.org
X-Gm-Message-State: APuU4Z/X50pq5vKUEqFHWboVcvoGwZP11NTMpXgy8javGJP+4w+OMSi0
	kFQ9hjYx1enfwgsbAZd0UnH8SSAxQ4iHv0yFNCAjB+7zgVItK4njzR4xyaUqc7sTqr+7aHzu/9K
	PNUJmC7t3rqF5/BJsghhmeWmqxmohwVZMhh8uiShFRXUf0GiT8NjBATqR4Cp6ubwMaRsL
X-Gm-Gg: AZFdTZeeW9ul9gzPwlNNjTmjxC1OtgQECpVv/Vo/ZKMFaj6yMJTPl/EgZdVKG1mJh/S
	9YmyBCAj32WFIHY0/SAxvWxP7o3vomer8S9l5lCca7R81g+Bo0RcL0ohd9/RAJFdrVf17FHm00D
	5SiJgE5hwqSe8+Ogqc895pHg5Ila/xRqLytRn3lXbCzr//iec+EDZvAbJ2vjGCCAYz+QHZPv4zc
	C1ibW9wEU8A+X0B3WgyoX/va4GLpvrdBNzRhHjhcxAKNfdrs9oMBv/gGGkbReCqoWmRg1l1vOv/
	mZisJRu/pqJepBvlhTGpgGLU8S2buWabbfl5a8nkt6MV4kMwiEWBinA0M5TZPFG/HTmWFNQGzVF
	1qH4emvT8mX2jrDUakwI9V4l14vwh3CFZ4NSTt+gUVDp4XZonDFkqCMIydrbRyLoRK2wgTPKh/N
	wWeJ4qyrU9xZVigpM=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11689006eec.41.1795439185707;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11688972eec.41.1795439185184;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm37649809eec.12.2026.11.23.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:06:24 -0800 (PST)
Date: Mon, 23 Nov 2026 21:06:17 +0800
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
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Drop DT bindings with IDs
Message-ID: <awQ6SS1GVPz-QUYb@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-GUID: SdZfj9A_BHim-KUkZNF6rmij-gJBWJVH
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b043a52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xlrlT0MJ9oWSHFZ2GFAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfXwL/BXp/lrjVn
 M2wVcynBe8Z96V/Ex4IbO1u7IrmMBffsDPWwvF2emXiHy4N8LAHq1FN7bHD1+RHauMKN/BRWb7p
 OjJzRYvQ32pwC2ZoKNvetRapO+wjy8M=
X-Proofpoint-ORIG-GUID: SdZfj9A_BHim-KUkZNF6rmij-gJBWJVH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX7mzlS0vCWSW/
 P1gVxs0DKgMXffxmiW0W54fo3zGkHj9cvnNgiGkgBpCFomCo41HEa1kr+/wi0+daoYSH0+IpWse
 BZu17vkScTPNS308hH4eyPgg5vmE22AIZil37wQ1plrYErsMixrUY6A8X2o1YH30oz8nqj58lbn
 EG8ZcjGrxXDuQIMZciILecJzmAi+dhJU4gnE1FgShztrToEdmQyS2AlpCzAaBfvrQx03xfI1XNc
 IPmZFylqgPisfrI4VyLMOHVBB/PGCla1Zx7IWFwoCbIPuLfEDl+FtfKh78mL/EEsz2420r1J760
 giVeQZkJbuh2lVos0T04mcgt+8TboGHkSvw1SVYnKKbugYS1na41Qm7xfUwXP4fby+zvxjaKDTB
 xA3YEJTcvcaR9uf+iigL2fP/s6lqQMFUzMWdkYPbLhLutcsP/IZg59CMQt5XRtCZbTUhnpjAi2a
 b1RBAtwGwWRTKMm/auw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230052

On Sun, Nov 22, 2026 at 06:46:19PM +0100, Krzysztof Kozlowski wrote:
> It turns out that people add SoC IDs as Devicetree bindings, thus ABI,
> and then want to change them, for example because whatever
> renaming/marketing happened.  Well, that makes little sense - either
> this is ABI and cannot be changed, or is not an ABI and can be changed.

I like this cleanup. Keeping ABI as necessary as possible makes sense to
me.

Shawn

> 
> https://lore.kernel.org/all/9eda2209-d64a-4a1c-915d-4415ac47df45@kernel.org/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (2):
>       soc: qcom: socinfo: Copy new SoC IDs from bindings
>       dt-bindings: qcom: qcom,ids: Remove unneeded ID constants
> 
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/dt-bindings/arm/qcom,ids.h   | 93 +----------------------------------
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+), 93 deletions(-)
> ---
> base-commit: 74ceacafec02465d922ad68dce9498c8f50e5f5d
> change-id: 20261122-qcom-socinfo-id-dt-bindings-e6fe815b4480
> 
> Best regards,
> --  
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
