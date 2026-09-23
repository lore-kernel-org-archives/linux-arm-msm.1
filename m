Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB252F275
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169830; cv=none; b=T/KS3yS7VEvD7M1rrApv6z+XkW5xu9k10qpRrvY/RoqyaSK7JRqkMcsQ8TBhJo7643Ki4I1pdIsfL/T2ws9Aaes5LKluBoXv+16yaOWZnKZyXdlHZrgOtKDj4IzB3yuRrXo3Dc2wmpkKCFwTOzlMGo67mkLcR1BuiHs/eMSkKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169830; c=relaxed/simple;
	bh=vrbjCTtsJyzwtHuyaf91WcAhXyYix8svgAK1qoMzsKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwx6hQNk44NwOT5RXr9gEuqaBoeDMIvGPyeC+64gtUf0jg1BtUURKKUSH4k0B+Gue+KCK8gj2E622fZreZUQj8T0KQUpk5a0ZyaRSlez/IL7+VHg15+g3ety3dphBCYUbO8JUZM0JOGyOY+1M74aeNgyaY0W8SK9+oqIS+AQvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJ/GfdNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFzUniUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJ/GfdNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFzUniUa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbU582443305
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=; b=SJ/GfdNvpBe4wTkT
	S1mXf1SgvWRVx7plQgwMrWgIYlNvgoqCHBexV3CFDcics1ykZdqJp4GWOnIufIAu
	xzAllA8gYDUM26ua3NS2ayqtDWF3cHqXmNUoqbpjFP4fp5IAgFFo1+Y3UeyWQv+n
	HxA85LZLFSuojbNHlqKvUh7v9bvcD7sMG0WavXFhIKX5jKqgBhko+uZ9Y+Pf0JKH
	i4b+uPFGeWhBqT3QnKYqBWCxm6lWNVTJ9p91WjDICDILVUkGBpg1NoOW8d/b6psm
	a3WkcNZ7KP0o53mPbD+LQ33XoRoiFxSpzQn1SPsRB6/JzUbfKsgfjuRWCEANVgGg
	JtJY4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gyrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-532ecee0d5cso1173551cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790169825; x=1790774625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=KFzUniUaOQLhI/TMpgnijlKixE6TW0Mt7UrnrYubGwTP4oqT9HNB30mzlWp7QpsfWU
         l1G6mIW5K73tSFPNPRt6CkubtO0KmNH+SHBXp7446MVLnr4ZNUVJbuo4W1f9QknS4ulr
         w6nnEf2k3BKu+t3MMfYbRbPZHI2B9zFuhcn11HkcVm7qRDwTF2IGN1R2WcJS4iySfweB
         qhbmSrQ4M6BLpP3Uc+tAGEVf4h7yZwhMSXgpfHEabyP4Nle7WXR7t00HHiFYpppvn044
         0f5BpGCCqsoLkpu0srADWQ/IQc8haRlrBgLAcpJk00Mh15A1NrF2l4EWSumC1we+xrhA
         vRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169825; x=1790774625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=bLUii/sCqBKo2M4pdqd/eQeGk3sPnOTcJX1BU8aVDmt4yaZ6aGN1eCRO5bVk6dfipz
         fFr1fJOYMdj2+62RXpl9b3MnBdiXdI/Pg4IamT12VvkJu0TSUE/cLYbPEYMaj0bFpVR9
         Y1AogCiyu9rM+Zj8OHpw5FkVNlpmoHbUOTHh6rIuReXCaSquRRm6a3RrUg4lv49SWseL
         jRkONaMA3OupOAe1699Sy+P/11O+yJFUtYGSdRSDUxuac6bp/JOccC2HoOJMReRQX99w
         8TbbKSDTOKfvxmwSjeQDfGT7MZAu8P48OwTNGNV8bSOXIbnvl5rQRxYfaKmUWLUzMS97
         f2iQ==
X-Gm-Message-State: AFuF++lXH/JpZVyVWGbmC/O7UAfQ/X66Ih5x/MyazQxLqPEtKwS3Tond
	gGGcQOuT4mCJKeU80L9RKLohfdGXGbXefbWiVmKEVWaKXQD7M5p44GueFliRF/nojI1g7Y/4hL4
	/p/c0dRKE+NwF6FdJLanq6ua295/rWPFII9ua9LamAaYAfGVO/cthb+CwEq9HwoDntwng
X-Gm-Gg: AYBFou02kiv171xaVyJT5u2kHA4LN1agL5NoYII32A04ey76/JfA15pkMYYeFTGUAl6
	8lZ0tHU7ckVxXmo/MAk7AVgrWZKp7p1i6ZWO5mSdJyDxSOZEvScZKuIhWvINmeOBuvAn7+600iR
	d6i0jaZ9if2NosFZXAbf7cudm1OERQRTFuclnxpCCnwyFx7csREd6e+FNiBcSlxyhbeTJdlDtvV
	T/61s/j6QB+xjr1BvBLIq2r8Dh4wxPk8VuirCbVa3Ea7cKGMcpaAGrjmAXn+SOZYNE1h9jjh1Sf
	+gXNmuF6M19/NEe88f+t1aFGJRlK03Rzr5dIKeO11XZxaEjxF/sZMK46FHAi3vdeWr/pXuv6eGf
	agb7NZphPfvJj3vLCVdb9hA==
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926621cf.2.1790169824689;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926131cf.2.1790169824160;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f5139e2sm7037091fa.26.2026.09.23.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:23:43 -0700 (PDT)
Message-ID: <a41366e9-2bd7-4a5c-bbc6-e5cc28acca0d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:23:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for camera clock controller
 on Maili
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
 <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GwiQarGifHGyAFdPhAt0haw3rqokoQee
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3d2e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX6ofM9JDscXo+
 FspMsOAmW4/C3EfrsfKazchhDI79il6DSkMx6yoB5cxnjPO740TvtIQLqEqI3CcU8wi1xYgtqwj
 TmAZ4zOJhXi/2K2+L96RTXcD6sCTku6jIvLCBSjO8sVDtcYcvozb/+PP++d5DHpNhM7Hqbx0iA/
 ahePh5yk5hnRor7hbLLa21OyCOyBxIhyFQ446S7xUhaflv8wJcuCdWctsyk1v7sm9ecW6ucgcU0
 Y1Dx3KCGxdrFZgLaHme4gjVUzsTGuWW0N5LlweqNz4NCFUlY8kvTgpDeoQ7B4uSFvxS935pjePb
 g+4htorrF5+QdKqOfpPQ4txhptosZ0x9+JaB/d/BYpHCFNXb+gb0SG9Fquqt0SGZ+qz4RWxU3KT
 fAluBE37TOFUGEWwHxcFHw8DRUnK7wT87V+c7ieSqgHn2UCDX/nQ0C9PtSF+nkw9+SMv12ksRZC
 tGddR1FBG6yHmYcNj9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfXwB4wIg+mJMKb
 YU5A9+ldUfUzkw0jumYgOKbpyE3ZIfJXR3/6RHhQp7RCY1OXBh3s0Vcl1miGkyr4ZFqJfuAtt9l
 qWp5WM+bx8nUbbTSP2xFJxsMWCo17I8=
X-Proofpoint-GUID: GwiQarGifHGyAFdPhAt0haw3rqokoQee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

On 9/21/26 6:40 PM, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
