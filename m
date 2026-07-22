Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201D538737A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687859; cv=none; b=isQ8aSbZku/31tuonQcWAg776f4q5OawN6PtNjVLnK4KtHgF8DxN5SM6VG5gh/Ygi7NnAXrHrE7eD7ywdk0v3wWqjnQDD3psGkaDxRm8sP+dp/xLY7WcXB1xvD+qi0F9t8Fn9LGvN+lIeqvo1vAoCFpC3jLOVHHMKC+NJnW3bok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687859; c=relaxed/simple;
	bh=I72I6aBNbNx5LLSbB2IurvJXHEQjlREB5X6pHjEvasQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjwzdY4I6c8isslV2Q8nGBwL/nCEkUhId+RETVZsxd7I4MKG15nqBR7xhKYqpAeD164iS6iDpr/C85PQWOpmFLXdpN9EakMApN+VXDZT5csBLMKiBio4HuxS4W37PzGg7XEuZKaiDZcUqJ8HOLVPwJcsjEXxe1EXv8kP7XajVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkGDu+HJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKDFxovZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkGDu+HJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKDFxovZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CCPI3650241
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVQKsYN3qgUZiEdfZG6Dl2bU
	NyFkjoaZvW8jdv3e/ow=; b=IkGDu+HJk64knardp5jZcVuTTVp4WaJDOIBrRgzj
	wBiyAscWR7qEjCOWxsCgvv53ClTgBGdx3uwBdQmloijHIdKbkVKo6YGYme7rNlyN
	LmInbmnb1n1usUPXHB3U6b8s37Sj/dVx+NOw7E8prcc83HzCmT04vJTZxHcdcZmK
	xlwPTc7rtzUXW4D0PzJm0bMKfefI88KtlxlqT+RWvJWBY94nOqgP9aFowpGDCDhw
	U1akqMrLwIhmdRciOcaE9+0yVvbrgmKcOn9Mgm3T/kU/jBN6BNWjrvb6mKBxNCdb
	p1pBUsE01PFCCmhuYfI5JXwxVEog7IRR1g+oMY0p0uDmcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3kw71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:37:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7049fa552so2555768a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 19:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687856; x=1785292656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVQKsYN3qgUZiEdfZG6Dl2bUNyFkjoaZvW8jdv3e/ow=;
        b=DKDFxovZAjA93mSwARWEwKK4x+Qr++Fc96g5FGyJR4rItXpAVSNuNRMtII9Y11VqeV
         C4hyqHG+f2JNUnO7GQErBRFpapq7Ce8NbW75GQeef0hSuMqSba647CGgZRJovu80NIJL
         ca95U1f54zIksCS9eTsocEee9CYx51IlTgjVaAADvSYqDYIWPPn5wL0e108joFs/egva
         KxgUhenRYci20yXOHQcoxCwx4hRkmTbz/sTWwPrgijCSlaOfkbBuLpk8sCd1fRmoHOVf
         dvyqKf20ZTXso7oGCU73Lh2Y3yavbjp7TP2aphnpLj6N9rKHND+yc0ZInVblUjoi2+9I
         7LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687856; x=1785292656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVQKsYN3qgUZiEdfZG6Dl2bUNyFkjoaZvW8jdv3e/ow=;
        b=Hu0WDFDwnhtFwPE4sg9P8GftrbTgDEFhDOhDcuU6uKwxgCUHQffDIY0TNBx9R3aY6+
         SSDBC793piwMFpIGwXSNJeXzdirx5UOL3cyMhNuybM5p+yRQgr3qBEpQ+WDHDQ/xuCqd
         qpNYTvpf4Occop8TsbzanNiC3l/VYtD7eN3JvvUCxSLfQGU5zz+cWUjQnX4zutjkOP8T
         rYimHHn2LF1wTGjZQgD3gBPATYCSw1e1Ajhxlrela1awjeb59LNw9RCPrM5TaF9WJnR7
         Y+6qcyq+B67gkr4x/S27TEgOIdddxWuXir4DASztLSgO/JOeC7JKU+vuuXP+ZPhd48E9
         Snsg==
X-Forwarded-Encrypted: i=1; AHgh+RpzuM2nM2/D36aLZpIsrQ23RuLk4YbnJjQWJawloob8tfl8ehd6TZcHW9t6gAZKdz+nmUgQZFjwdhFP4yPe@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+tb7jWK8SXXJk/4Mgz9/hAt4eFU88GJ8t6I5/JvfpR8xs9bH
	xYRSSc63uVaR8hwuYk59jiHGmdnr4WtkGqgzNrB3cQetvB16saFli9Xtq+Qc+dH7iHaV1xA1B0n
	ZusrNSK47yR4mNFUMIaP7m1pv7knm/giwk/Ws6OaQcLagO/zXQib4wcYRuZ9gKLhscS5WCjZJ/F
	E7
X-Gm-Gg: AR+sD103GhhWb/u6c3rUQ6TiqPNx1Y7n6U7mdIQrik8o+YtNuxDMrF/QqwOo/RL/60N
	3lTQFylIBoFvhASZaRQlsCUXlWGed0uUDRj3Wio5aG0hw4rZVp++6Uk3nt44bsRLcjbIopWYHb9
	ub2Q8Uv9J3qXCIOPD6IV4Dcs8y0HiUnCqZzpMWZmuXNH5v1kJ3LHXpThrmCBc+EVWKtrK1acJYT
	AzECES2pypWz46PPuaR9rxeo6HGU/iLkjoUCz4BjKXPCMck0hsefj8SxoWDXtQHyt2rW2k43zgQ
	Vi2yrvQXzWhEePhMn0rJy+5AYZdqt99TGEhtjkmugGcXehd8vo1IISzpT0+5PnfxmeqWQaU3pgy
	r4rSblXEDmHHeZDpLAsfTOJneVSPzgOYLqc879/5J9LA=
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr22467244637.65.1784687856646;
        Tue, 21 Jul 2026 19:37:36 -0700 (PDT)
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr22467214637.65.1784687856177;
        Tue, 21 Jul 2026 19:37:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm1768920c88.2.2026.07.21.19.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:37:35 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:37:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Message-ID: <amAs6TieGdZwtxyN@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMiBTYWx0ZWRfXyluG7PZPy7Ou
 h8f4LorFPZ4ANcgsJpjIO0lUsI4A+DETUfEbqs4SwuNWTgkyPIG1lshJ3Mb6UBCwkBLPk0sVfq3
 XWeJQ1u1dWKksolAv/K0jkuwLrHZhoVRinryG6C4Dpi25Urlut/nDEZY3O+5UUW2guEDOCf+HIg
 w+S+UgkZoF0/53AnCrj2y7HrfRvpdUqgFfohNfiH7rPbBU3Tv6U2L7bG8JyUihvabtQ+g2yJEdA
 e8J+PYh65RipoYIu6/4zkDOSYT9rN0xPvgR4iwnUqdCme2fUuJ5Lvf2Bpft70K8ZOdC1VFFA3Ck
 dgAAqwzZF7zUG3d4TBfm5vipefts7g//nFDO9sec/BtfAvMs1BlL/KOZlxSEltf/KMqnXZo7fct
 HrbPFyijPboN03Yx7hWafp1f869Br6mXEiG5XDfX/BZ8g3PaBwm9D9rAFJDrGxItmRTlbPYxQtp
 H8xvfWfd/JfJzrkxEoA==
X-Proofpoint-ORIG-GUID: 09x9E7sBiKxyuorG2rBz-bFyna6NTjHn
X-Proofpoint-GUID: 09x9E7sBiKxyuorG2rBz-bFyna6NTjHn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMiBTYWx0ZWRfX9edFxDwulrez
 Cbtgf5/Usz4YmWc45lYlM2MZRnxdLjQ2ijfBNP11NoSJJTZzkBvgs9ybnHOemzpWb8fndwRgh48
 p6SPGfPIYE25TuBsMVhWE7PnfWqs0v8=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a602cf1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FJTKRu6q7fTA15dSFXUA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220022

On Tue, Jul 21, 2026 at 12:37:20PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPUCC2. Document the compatible strings for both controllers.

Nit: s/GPUCC2/GPU2CC to be consistent with code?

Other than that,

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

