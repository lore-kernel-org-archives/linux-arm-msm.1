Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22323C1D7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092874; cv=none; b=NAN8lXlipHJTki99ygWGvgoysko4epyZIdrUNKl3ZUA4E7nyA0euxhmn96DRSsaqgewHFt3bNGQ68WSf+Oo05WbpxPNsoxmRRxyKbUyp301XGMBf8vaW86iyKZnEnRmCN68m2vLx9F/a5zQ6GU2BfxzBAunCP3WWaEglVVpsmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092874; c=relaxed/simple;
	bh=LHDUfK5CwJ8lI9grWRG7EQmwkF5ujcavl1cQEzZTRu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5UXyrCaLtqmwPC7MuBVpvO82U6JUMo1R+rDVi0N+nJXgefgvoCCs5EEAM7+6CZL2avMBkFejbwrIhMiRDv44PdDCb9k7+1DcNhVDjHZstkXtqhw9w0TBc5Nbk72A2lmLBlFf/wvumsdABGMku+j5OXpKPMRagTpbc3h0aJQ1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+P9tur5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJ6OSGLK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+P9tur5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJ6OSGLK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjGS2449453
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=; b=g+P9tur5DcPeVXU1
	J/qxk7tS6vpW+LpaqIZgoV6OsWFqu+2NxYqnnsdLI6mW1cx3VKGG8SJm/0uF/RaH
	G/mGn++EQ+U2oA/9gnjpqjPM9jofVKRzAJDrqv8zmIdrTOjPlyhGk6ekhX9LvCDk
	Nw++VREeVpC3cEE9TUQLGN4XSN9d3svo2dJa7BamXRPvlqR3cEoz3qRe3qj/O3YB
	EZJEe7OUMobU9lEtDtnaOnnawZn74eHElJVtfa3GsJPnQE5rvo/WDHFuq2OyHOoN
	n3zAINhb+kxqhATK3AZHWtPqABhUM8wi9evV8ji9wA1reYgNB6FnilvZvO9la+IH
	7S54ZA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyt7w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-483ee5899ffso9983fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092867; x=1790697667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=OJ6OSGLKwgmrR2609CwYN85dvPyrBkAkKq5UlIw7ElQyg1/uLkAA4FJi6JP4tvZZ8z
         Pmw4w8woSA1ndcmkkXDsBv2A3FIxcLMtqvw978yLh1TWB2RBiVFOBNJBxY86kcgog7Ge
         Jk2Dx0ocRIGiRLQyPnzfMFxYDd1fWznWxmPajlvO1MACxxe1YDegvqMtl3dLMtUxRJl+
         05CHKk7Vi2p8WVGz/Nw/xb6bfUbUnpy9An8n2vkXDSFr0HqAuza0aFu8GJPy53MFDRtE
         xTkNq03RrF151CLvZMysh23W8iYoBKvy1qh9mAuFstftQOnc8DN1n9HfMS/FOD6ZZ37A
         S5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092867; x=1790697667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8ZoOpZLPLTN9GxMwfibhuWD6Q78yohDsw7Ophx9emI=;
        b=lDR45j29oXp1wfNdVEdLU0o0+A1b65FxjITawNsi7YHBiawgT09jaW1XOgg9SELITI
         YQG9wJzkLcO3gE6zJibl6hQZhWS2yAGUqrjG1Bla5Gzz6LxcRWDAVoiO6mRAsI0SeYvf
         13vlKCpSzQ17+nuStYyYCk8FyD1vrnBEAORilyt80mgsGo5sqG68paXUHiaeuBm7dJOd
         p63Y6fK+9eN3cocMHnvZZ3+7d2Nfq9yW1k5zfCDMzcnw6rj3AXg4Kl6EeMQQaqnBHQ7C
         5CB5DpFl4ADakj4GqMbSagYZFETCpZ0H2XTmKELR+NCfCQIJDGPi6O0tzPYGsxhLGlc+
         3Rmw==
X-Forwarded-Encrypted: i=1; AKwUvBwVRhBtm/f4X+I44rNzR2nMDZi+xsph3H1FVj1mqbsTewPnTEQ9xN/T4sIIzHCmCYj93NdOMAglLx0XfJvj@vger.kernel.org
X-Gm-Message-State: AFuF++nQP5knfgooQ5qVLDZ04dX8YIlXVDwZCIaX9ahBBrRNfnIao+Lm
	OIIMqlVl7iAij5uI1feZeOJ2ciYXaBAP05nBvu4b0BMXBOApTHW5VIuAUumJG6zkXhJf4ZV3NuT
	MYohaawuuRMiHDwRCmtgbUY6Kc22jPmSiIzqdLuYVsyjpaa4Q0lPOlulNKXCU9JxgnKe7
X-Gm-Gg: AYBFou0GQgNfwrTG5/iZBndXqmziJTuv1qa1CSYXnAunDxJpXrHrtjdslE3XB35licp
	bzztb+U6XrCzNDpVqbd9IylVuFIEdclDafYrd4TmBYvGxuTd/ywMEZ0dmBgdiY2NQUNt6K/k8yQ
	7VvFsotJUvK7fEFyOR1ej5n3VvnbMFhNXhFiRnpya1MTCvOE7X3PB/ZAkD0oC7r0uqG2wWxTfZA
	xVAkHvMgmXhRFdi/v2/+nHcO12hqB1yLrEmJwR7ba/6PdzL1DvHYo6O/RGYbVzI7VJyWLaLwkKQ
	f7C7C4kzTo67vSM3pRwbs1iDVa9UNNaGAecpAM9KkvXBmohWMdNvp6CGC8j5aiHeGwTAMtImz3u
	IzdbakF+kQnF4kIUfZ7OBlw==
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165045eaf.2.1790092866704;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6820:e137:b0:6b3:6535:22e4 with SMTP id 006d021491bc7-6cb2e0d7dd3mr10165001eaf.2.1790092866108;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c430a09sm110972866b.5.2026.09.22.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:05 -0700 (PDT)
Message-ID: <03f5dc64-c631-41c1-9ab3-d28a867aadb2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:01:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: shikra: Add gpr node
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r52As28OqXcKNvlaLHgA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfXxWzSH4rk21+o
 b+F6Zv64A/r6JtOLiOyBwIYlw9UU5thXIZeXZV/sA5n10zfpb78ZWBqXVyrzz8fiEN04A9bqgSn
 fAF3NogL2QD7ji2NYfRa6zpkmoTdPogG7Yea+EbKb5oUos3P0pLqM+fE1ujlnrjSGq8j6u0bc7y
 EZBvr0uvWS730ADKZG4je7wUnVoAVCeWC2R0Jgf6CvCxZPVbE9PH59Rf/A0z6NBv9IxiBUvi4/+
 mXrgDEJS2Wbe10rZSbJwJXcTasUXrsTc3t/2wGJfsujRB2uPhKVKRAfRO+PHTlipGB0pElHn6n/
 T/+a9zOmOJ57FO07MO9w7wIlYaIqstrVt7WtQZPzklYhFtE1xQC/JxXPfeGXfOlVGW0dOBKBlgB
 0GG1VgGc/JBPfUYWZmyHGgJiBFylng==
X-Proofpoint-GUID: HUa35cy_rB5HRwcoebGRIVXXSfT1L_p6
X-Proofpoint-ORIG-GUID: HUa35cy_rB5HRwcoebGRIVXXSfT1L_p6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX5w21KdyzuSb5
 UqznFlpEi8Vx4zl57PuP1HSXv49H2cSzTfIxb42Fb8Orfan5ZBmvxBS5Z+a4fDn1bX67zFgJK6N
 YyOlIBGIytX6TXSmQpV93zGlC8DJBvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add GPR (Generic Packet Router) node along with APM (Audio Process
> Manager) and PRM (Proxy Resource Manager) audio services.
> 
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
