Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C42428498
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147563; cv=none; b=r7aMnEczSFFo6KEcy0CMliZH2QAYzD85lplVWf/aKdeMsVslWxHhR6YqCRrvFaIPvoSrHEswt3zdyUy8EwSBJB8kSlvEm6Si2tyq1oAn+VYJAdZaD+hTjof7B+OJCJs8oJLFf2v4MUF9DlNk1a4awZ5bxJz+3ErnX86AJIra+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147563; c=relaxed/simple;
	bh=mRnDU11dT5vxr36UinnGYhY78N0KmEwfnFRcvyJODck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvFXgzYF+WBqBg3AJu+Xo9xyo3rxxSNT2TAp9ep2o1T+mHeA5/wwG4AyS0vLscK9BvCbqB9/VeTMzS9Nq2WYD/HSl+ETCyHNqtf03hjSVmFclNYptlyQgHDFgE53T3fb8HsHFWuGo/whON9c6uQHhenBEXoTK69f1g8JNSONGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnRRLQfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GclurnX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnRRLQfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GclurnX/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAMEX1403570
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=; b=KnRRLQfX+76yDvTu
	86kAqpsiWrf9wfhwsbmwhPJMWr/ZVO6EHvhsmW/+n2wyexRibcZgLsLFoJgjdSCA
	t4H6Nv0j6DzQyYymyxjWLVIAJ1qprt2eWCYCIX2SrZ9Z3B+SzUE6DLVESLVbsprU
	SL2DPPqNShZiDlQd/HNimBnFhlqa0bd5zj9n/6MtGmRLUCzIuPP6teX0UIfw57gP
	hIbEMrAR/4ghHe/wGk1FJAuCFrsZXctgz6r6Fge2wFjWvqFMv9dZZQaZ7VL+ixtJ
	IBoo77XzZlRcb+Jm/DF+t54UB3B6ogmE09iuzN9Yigz8LDf71JLM1iEDku5kXs46
	85kZsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seauxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:46:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso7324380a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147560; x=1792752360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=;
        b=GclurnX/rAD+7TRAOT+HzlaB7f87IIvZKuoN/3D41tX6jK8Vt1H1SmiDXbKa7qBe3p
         xGwpST2BgCdRf/pkpyJXG2VkOzvUvUJN5d+rfpfLcnxrzCS+cQtEOabm+FwwuMkwaiEj
         IPIgmvXYqnKThBqLyPIx1WYKDigeY6+/Q3WegZhwYztJqU5K5S/N8trJ3DWqqXGx9V1Z
         nDf2xTdGBu+r1gcb7Vimhr0naiC6QsJ1so32WF5T/Dwq6R9LxJZpvXIUQQfEvYfcF8O4
         0BQZVj0WnVYxu5LLeNC2kD2VjLTBdOp+8w0ArjkQdv+NCFVJt2N5EiEUmbUWP0e4VmQQ
         Urjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147560; x=1792752360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=;
        b=pLu8E4Ljalng9r929GBehE/jM7/VGYrPzKjzc43ietcoJjgOsjJSQSbnNRnInysNhL
         9+dVdDyGp45Zym0QzP8QrL19qPkYTbYWA+zqoJo+dUlRLMH1UxywI8qPWvLeIvGk9W1B
         5ATzPAhrTVsjxPiAQWXB5FlAkMmPklXCplDEn9OT8IP01gfuiGCMIEdabCaOe+Yz56XO
         cvu06J/pDvjuqDcayRA0dUkdwS4hIYwQz8udytH8S/9jnWP5QHMURRNJqQ1JjR0CkixH
         XTXB1w12TtuyL86I05xrtxg2h62T/QFEm3HNYY94qKBeaLfAMW/l9PdLkZYZc/Q1Ex85
         YTWA==
X-Forwarded-Encrypted: i=1; AKwUvBzKI2hsLROSEnp0d9ZXkfdmQVbq1RibLxa0LLxtfvdEDWlFOxGoIMBlMzu9TQNNHtJVP2kspPXyR9eSEa4T@vger.kernel.org
X-Gm-Message-State: AFq9FYIAaXw+KVDdldaqrw+5MyFzD9a4taKPDb2fneAC20e8G2PXvXsa
	VdriM64B6xOOvlje33yw1ezng0krOdQEVFtDuA0yOcrZLbUSRUAPT4I46NKS1bymv9wIx71bcku
	eNPoKbTFu5ShVTkoXKi58/vMmpnSluIaNiAAVbtvmgJ7/kbn2A+riWW8be92IGt/n4jQR
X-Gm-Gg: AYBFou0HKujpyoIk+fYvW0x/HrLszZzE2npX7M86Q0Ci6uhFPogi+y7nTSV+S2d7JRt
	Y+gLxBGIxNeRgHDQxhoRL12k0sm6/NEnDODbOOJCuJqibSxrAuoj1vhYwj0GwPAXnoKeTajT/nn
	nAHNT94PiGdxM0May5nLmzprSJt34N+fkmPxvGeRN9JtrUZbEyRnYUItVFGSknXw2IssSgVmelB
	R2c2AqJY+rnyH3kfB9BNSPWFFqecVoD5OoUCflUVVSuhUahN8gezW9tEflZQLN9ZfIkPjZfvtM8
	ikNjUAB0KsKg8eIYzRjtGI+QgebgVHJDqbOrKkwp/a8aDur3uDcAYJeHohLStfwkljXhwhPcvjt
	whCrPhyOoigWuPD67537f5LB24JGaAZqk97fR5nOSj0z4oUIEFpXs+F3i9ozz7djnWBAum8Ex0B
	QfgUwAqA3yH4bmR/tqSApSmYS/SuI=
X-Received: by 2002:a17:90b:4a81:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ac9d15035cmr4991599a91.35.1792147560195;
        Fri, 16 Oct 2026 03:46:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4a81:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ac9d15035cmr4991569a91.35.1792147559753;
        Fri, 16 Oct 2026 03:45:59 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm8694482a91.0.2026.10.16.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:45:59 -0700 (PDT)
Message-ID: <05680cf9-eb58-417c-b976-027fb6267609@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] arm64: dts: qcom: Add Kalambo SoC and CRD
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX1NNTdFYwDG8f
 WeSRMK048bzM4XrrOeefPzrH0imIPW2CWO7+SIkEDH4ctUo3dFKen/eJOnC+zV+YqfK43EcIB/h
 pwxJLgQvxvBaHhqqKVrcMUSMwcG+OVo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfXzLRzua5Er5qn
 pPiHvtyj5nCWNPafuAcRs/VsdA5B4Vo16fyUiTZ8e/3weoyD+bEarRh2h605DkLlfNL4KQE5nXu
 xIEPt6EjfXjRlOoCkD8ugspUu2VGCd31SlzQ4L+Iyxp7AiyuJUTCfw9ynlaKin4nUm0ApRzgztg
 MVvihoXrm3ZPTBu1+I1kUd1EdxkSbL0XbY23I4LY6QN5LqP+maI7OnOyoHIRMvg1oHmfp6aTdTd
 DS/VF+euSRR0OIPHDigrM2m9k4oyqovPiffEV37MK+R49spzcRfZeyJMmhfelZmG6MuPo5PrIDj
 oK5R9Fi/UA6I1G9af0VWYcAeYf0lvPFY2+5gTHVt46XCEs1CQ5SequDiu3JsIK3viy4JHEHowCX
 wKDHlnC7zfLEb2uT9MuVCJYJoIsx/Mx0T8tz0ujyqGqInTpNhZil5k0eWBLjmMzjbQiO9lE/Qfu
 4KdK8Jk+5JLP+Z7bh3Q==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad20068 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=94Q9wnbR4VJZ0VN6m9AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Tqdy9adeTr34pPGgWu59ciYrq2I6JcJ2
X-Proofpoint-GUID: Tqdy9adeTr34pPGgWu59ciYrq2I6JcJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160042


On 10/16/2026 4:00 PM, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
> removed, leaving only cluster 1 present.
> 
> This series documents the board compatibles and adds the SoC and
> Compute Reference Device (CRD) device trees.
> 
> ---
> Changes in v8:
> - Rebased on next-20261015.
> - Dropped the DT binding, SCM, and UBWC patches already landed in linux-next.
> - Retained the Kalambo SoC and CRD DTS patches.
> - Disabled the unused bwmon_cluster0 while keeping its shared OPP table for bwmon_cluster1.
> - Link to v7: https://patch.msgid.link/20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com
> [...]

Sorry, this series was mistakenly sent with a v9 prefix; it is intended
to be v8, so please disregard the v9 label.

Thanks,
Gopikrishna
