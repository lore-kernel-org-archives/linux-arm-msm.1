Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787B415F12
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764376; cv=none; b=ekYXGJapx/S4+KBAjnIjxnPyW2YP9+Os5W/atY1l3+sX5Qire1uRXfr9acagP6gkV4ZEzTrLnsjSOfwErINtdcLCg5vSl9KcBp7il6eMoJDXSt+u9HVLGj+Ko4loUYPnrqjNOsTdEsfKM9XA50wLu06EFChuFTteVNL++YxOWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764376; c=relaxed/simple;
	bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3BH/BSPVCMoGTa0AL3wJ9RU+C//YwRqdLl1gglEugXiG1oOCudvZKg6YIOtlKxPlOtuUpbVXxdjQlxCZpD6j0lN3oTWKFFFGPNGO2MgD0s6rsQzI5L6Fkg/ofglGs8ddy9z1X3xBlocx+Eh16oeg5jfROwlpz7y5zUHK6ie+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYmEqs9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WruygaGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYmEqs9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WruygaGA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7daGA3330390
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=; b=HYmEqs9WutxOa69a
	OmWATf9BkDwYYv4FkJDlY64AaUtirh84PFYtB+CNWdzGQcUhE7oi6tCqbiaXaqb+
	6r/Xc+L+lt5liw4SbqvkO5r+SSOsGmIghGx1H0xv6oxdeNOMZM/BiCWZISknnGv/
	gWdH+Qfj004GR6fOl7WaOGuIEHJy8ysn84IPJvVO4VP4QfIp4sV3izuSWCG0cP/X
	1LVXk1wBT6uianUh4/6lS66MH6B8QrVhYioNYoUC2ptvJWLXI8vG/A7S7igPK0Im
	yQZJtRCpvYyc/ivq1h0nRHQNiNUCFPbCTh/+0HU17sKCFjBpbCpak5cHDegT53kE
	7U+JcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3jvrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c9a1cec69so26815485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764371; x=1791369171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=WruygaGAb0DL8RpebvJBnFCq0p9dA2bvadk6O0890Q9Uta9mIR3iAK08j1u4BwNhHU
         BDhghA6ZgVr6gFrhSIELeJf1CxU266c+B5PzDLbGDb9I+vKwbVyFaibjvzILwRVMCLJH
         SebaqIXByd4/dmngAGrjS3+ClZMBnhSs1l4REtVLK0RxtmImRBXM6irA5sXxmlODyRnI
         L8pv+/1b+wCn9xEpr8Fl51889volJL5QD2bK4oN4Nuz7FsqcqXakFBvZ/jupAF+OqdMh
         OH1RvRGzV9jcx37IznOpelvntjB12Yy++lHywdxiWLpVTSY46Tnf3BDHSEtShMN9hB8n
         8dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764371; x=1791369171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=E2lsjvj76bAxvtIXJqWgueIt9Z36Gp4XmuVbT+ZEteLg/7trUWHEC8thrvJq6GwDCO
         cKHAzUkNBeilhmhhuH8AuhvQJ0ab4h8ogF4maqSRkamMJTgDFGZlVUnoyVWRPHukdtfW
         GvY/nGpCFH7KzuLDz6CATVeT62qNXdir+7H1fu5Yk1GaRLldfdB+sOduQptTSl9BlnBs
         sEUK88lAmPh48ocU5N3SGLL4Nt4E0HH3Z+wBdLRghMw/sLKIRqLCkgKMpVQJqNkiVigX
         12kzvCb3yjjZOYwh06rdxil0eWFXy6k4n8cDpBdmWBMJd6xiXIWrOoyeXGTVOgCj1XnS
         8kSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEKrhEFS3zC+LUFHxTyXpT1JnbgVVcRXngNVNJnJzIVkmCW+luKgvI1CnQVDMYsHhXDRVkYKAlLSz7LxzN@vger.kernel.org
X-Gm-Message-State: AFuF++kfKDSe4tX6xoKpDt01ett+DQ6N+hkfhbqSwAD0x35SnzzVj5mp
	S3KjpeRmjgzg/lU7OCsdoUwq6Ygc+mbDqJTpcxys8u4dGr9RNUozFOY1yF4/4V7AJf6iob8L8IP
	hpmOa0ZsLNfuJEzbr/YxqQUCw8VbwkmGmXowjXLCgnVSKs8+UHbX8fcoixSny4wNAX9nT
X-Gm-Gg: AYBFou0pD3mKs4c11xoSRGJbLzMsFJRf8bGF4hItvJPmI5FertnLs7Tbn4PHIzWrRo8
	iOYGoTdIebnmG9OR2ak9cpScmJknXel5VvJLSbdIwEwUsNEgH9nCkAUDybeP4ADPtVYXEHfZmHr
	uzHAPhtGv6IuKm2HDkpuEYfiYA+kt8eycYa1RnBrJt065n0xqmELDXVXt+GQtsEyhw9le4zIabd
	R11h2ysqBIcv39ojnD9AA2wwShQflFlKUBkOozFa6aiileIKVpM0JJFRE0ESTM+94QwAs6gL1Vj
	gaFtWKAa4AOW2JMkEqfa2+QxflJso4gB8REnlbhjUYaAFKH9gyhasWhH2CQpbjbKLyxHYM9cy0q
	hbNpFgIC4y5m1Khukrl4ulw==
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131779285a.0.1790764371097;
        Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131776485a.0.1790764370645;
        Wed, 30 Sep 2026 03:32:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:49 -0700 (PDT)
Message-ID: <543bd0a0-e0ee-4bc6-8988-00f595334167@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q9Gg6C-vYrPiT0PJqApmrAw0K3Mdg-ag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX6ATFDo5iVJFX
 epcgQZAzML5FOR5jKedydo4H2phAA4l31hoVBdxWFCKYTpOXTLI2ii7FnX6BsEpHyJsPyYNyymI
 WomfQMmYTKLDHSG+05eFYv4Te1Zdnp54vXdnr/a6tcitD102DmdsPuWQFntVTf4n9gM+5hRza6T
 XQ1xz0x8wszRmj9J5CzoLpyjy0Yj5UistheIB0tBUDUIt8JwnlKDcD35DQhaG79Mw4wy1T8zIyA
 2P5PPfd2cMFGCMA8Dl2IiYVGzzFKiUnp+HS2rHETLIZE1JIaUhVmePohdC1W1AByPu/Asmg1RLd
 Ld+vZjgNQLhcybjkbeCUDNzozwzX+Vbpo8cI5r0nKpjLvHbZdo0WJvWRot9fWcWi78GKv19ZD3e
 mzNhMhutowlQ+Z0FukZuezBfvzsvadMF0sGdTlCWhllwATDFvzkJbdn/zDV1JPSpd2Wq1Pjknfn
 QBBvzhjIiEGO6mQAQxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX6Kr8oP8PN5PC
 KxfZZ7Akp3sRHyf2bnsFhoZJPqljEn/0WBs4v49/CKZxnjQHIUkrYwVPIxn8nz3o6Bc1A3Z/SdX
 1tzmbDKz1J2XkckUA3ovjSkbZEM/FXk=
X-Proofpoint-GUID: Q9Gg6C-vYrPiT0PJqApmrAw0K3Mdg-ag
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abce553 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
