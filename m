Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109D2C21ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126151; cv=none; b=OkfXEv2I8OThuYMRngeX4Mk2FrymdFtCt7Ix+02wRS1xE3ztUC9ifwIuDG9Red/2QHe4tUxHObljZCkEjc4yXNigKPdoIviAxLv71ar96nk1wdsSd+ZyZvQdITGMuxfinZW3XX+ICAKUBD1fUTx+eZyoEKmicPvKlVDvjXjzm10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126151; c=relaxed/simple;
	bh=VhOJygrLbJVu1QiAay9j6a3lqhd3vK1xPCERfvkhOKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1hcl/uLq0orwVyJaVaUbTGUhlM6SuNqHrK2sUnTlKVnarGwdLJrRJueRNWFPDk65qqSoToyvrGkJG42VSnbqoosIVT9yySmWSbDo0U07Sxv7LY1jW8Eu4i81uDgBrCC5aHvUaVc7B0OeGEW20zViBJQZXcrLMVo+ZPncvegphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STu/2qjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4R+u38w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STu/2qjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4R+u38w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2vRuJ3902505
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdWvKoNv/zR1uInkMslEraEnYwrLaVPBTjCpwAlZcKg=; b=STu/2qjWYM2tNdxI
	7bXh00GpabQ8v1nWR2gQMIHPOEo7uE7SQnGO8FmAsWo4+lUeg0eB+pBf53IKLHZi
	gas9iuLjcL6/7vZinSVhbg1ODGryEisOhEp3S3ZWKTgMQnzXuaMsVyQ6GPg3KTi2
	fCNT9cDjNznpMgxmSsqmMF+ETUZITAfnwLlCj/cnvBCrl8DAtDjhTjGGSr/NgL5p
	eQtJbGJ077779GqbX3UnbMMC0NqU46msrRTItVzih9t3YpRo0wEOMfxxp8GnXnjs
	MB2kzKkY0Oi/t5nDx9LtKl//Hhn1TlnAXkg53rmfKZ+kI9P6xOtiiteLFEQbUcty
	+pR71g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3set234-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:49:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so7214324eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126148; x=1792730948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdWvKoNv/zR1uInkMslEraEnYwrLaVPBTjCpwAlZcKg=;
        b=e4R+u38wKfL5z189gWd/Eq1m4EpYMqH4vih+5xkb+hxNLn2fCw2IamlRXW+xqAqG2G
         nsMPts7U0ivbmTjUe/T4672nByF9DRH34xPtLUhsqkMNxzABGYfCJapEi+v4LVMfkogW
         LpRwqQSEpDJhlBHuxtgzJln/Q0SftMMYUDe9Keejs/ByukKMu309g/Yi1Vk4+kl3nvPr
         WCGb6RrFu5aHjkRJcEr314drC2P19VQeWoFcd5lu6oOImqtbAV1VM34l62PA8wJFuHxd
         FqWrUi/Fb4EpBwFAbT0y1QPHABsx68Qn78Olu5l0aUJSdoLcAoy7Haq4lM6gkLAOiuJX
         ogQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126148; x=1792730948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdWvKoNv/zR1uInkMslEraEnYwrLaVPBTjCpwAlZcKg=;
        b=BhUdP8F0cpSQ2pG7Dueby5xX5PfCxi64tP4eOecDzUn7EdIjebZh8bntMnLCVeLdWp
         Au7WXg+F1omhMs8dRug7hQPSBdhtESIvJpZlWxhPKRItA+NDQdPPxsN3xnXKGHTJB6g8
         hvdDO2ad3Dvwo9ro6E0QS2QhiW05KVOD0JD8IEAEQL15Q76BXHuMFsHDRmMM4PirNaxT
         9MhVvIvcXnIi6yBTo/lSnXaDnNFTryLhtSclBV+LZURQzkvv7n7GRL4HdfwiSA1AdtXx
         EA4tnSJW6OmnrUAlf5GtIlMcPbKYIGrRBbhP8tamCnvvGwY9aKwHExNdM1wxXxwCrtx/
         7tlA==
X-Forwarded-Encrypted: i=1; AKwUvBybMplIusu6rI8ZWwq4vUd8Kzcfxd5vKhX0In5/zLxqMZIRigjYglTDIoJ/KSsN1Jv8kNjqJbVTMqiPLgak@vger.kernel.org
X-Gm-Message-State: AFq9FYKlMSLgh+glA6OXQTbrFoXOhOYM4c5GrkZzQLi0QXD7b+lXJoRm
	elsvBsZXO2N8FG/k/8MJSDwV6qnCbLd7s7nwvjNMW1c+iPDQHZV7LtKAnYKp5qm2bWqVFlVtbc7
	EqWF441szxNmsyLvfkHX0WKnFZ2i7CAd6H3LSvygunYufKofeStAJRcJjShQOSnM8A2Uq
X-Gm-Gg: AYBFou0xAyXP5qrRbyzhSIUV0ENdPNbkO6Ix9YA28LSDVApsw56+FzMcPX8KYrYT6Na
	lVmzvr2RMnL4EpWuJW/dJyN4faoZqYJoZ1FkTFj5B03YaWdqhQEImrC8wMjAyHBFVvLnSFkaBtK
	TdVXN6mQrqB6JYAvMkh9RA6qKqyFEjHmzdQVQ3+Z6cwz41yUMir5uM+bMC4QwEMyT2SLhCcTfSU
	3zGICtvOhhSgAUFVy2Mii/YSzuwPwATpMwV7F1FwbY5kvKzdghjh6x0seTOlWggHZBn0eIotvGm
	QuQk3J3zrDu7T//T22UHsoV08nnHfUU+B0L6ClpKqFMHpFmJ+RiLB7GG5Nat+Cvd+ITeI8IT71b
	E3q+GYrrutGhp9UgZ0A+rBFVG46qxuw==
X-Received: by 2002:a05:7022:283:20b0:179:b953:a14e with SMTP id a92af1059eb24-179b953ad1emr13247053c88.45.1792126147818;
        Thu, 15 Oct 2026 21:49:07 -0700 (PDT)
X-Received: by 2002:a05:7022:283:20b0:179:b953:a14e with SMTP id a92af1059eb24-179b953ad1emr13247032c88.45.1792126147295;
        Thu, 15 Oct 2026 21:49:07 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm2900617c88.13.2026.10.15.21.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:49:06 -0700 (PDT)
Message-ID: <88c9d069-b6df-4a32-b8c0-75a182ef26f9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:19:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pNCsxfKucyR_uqjKKPdabYfcl6795MT3
X-Proofpoint-GUID: pNCsxfKucyR_uqjKKPdabYfcl6795MT3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX8brg2hksVG/L
 w8YHj8p72jSh+v5vUgGU2c/ezAe0H0sjzMNTyMBx/drBhFuoDjj65mJkHAkCVPCbKFgV26VDUs3
 BBQur9ODKitXrpup8ltIrDBLGatcDP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX7faKniqTvhET
 xpCZuaPusYi/DsgvSySUZ30IS45LBGUj5Gu/khCyJaE8pMphoJc5jxjziFn+G+kfc4GKeGe01wO
 D0nT5/EcMcCqp8KvWKRIbkQ8x23CM97mXxD3WccyVAg64QJSBr5gfvERjOJPpaObZui4E/AfOjU
 N6JOG224scahd/cUfVpjsorgGCsWoqcj/GYcPWmvnw9TN54nzlbBGnx0vJDM5WETouqVo8ShlYf
 wKy8XuIEXF993p66DvjuLPUXQyYYzbzv/zpohJQME4JejBMcMLL+wg2F31D29FXlAS7Ifx7jwO1
 BpU7h+zOPasAyD6yp3FDahT0l+r1aKQyPbtj2ExMC6/euHx9512xXDQifYelS5VdG/Nh0bzfpYH
 m0YI0gme5muIsSX56viV08rxKmlMkEyA6kYMrdS2UPh8wSJs7pMmqVu/agUjNnCjvVZeuMaQuCF
 bHLTvbRMmY8ZH1ZmEIg==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1acc4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP during probe without allocating
> the pages from CMA. This allows movable HLOS allocations to use pages
> within the region after HLOS access permissions have been revoked,
> potentially causing synchronous external aborts.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 531ce288b6dd4 ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260619-sm8250-audio-
> v1-1-8a76e033e209@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

