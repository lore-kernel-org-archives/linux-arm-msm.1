Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4437649B443
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818533; cv=none; b=d7xVN4jRjIvBQFzz0q68ZotseLNRgf7g1QajmMr/K4Ks3UxJxn1lvbxhIoJJUtCZT7rFfr+UPV3lfTcFmiEp5GSksPLQPgLuZpnmCV+TlthD3Z3a2iQQsEL19dGWxgDFSt+gzOxemCxZzWG6xMx0z3l+sKj8oyeJ+qWGvgUSM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818533; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSCV9bKq2obMO1BtyJwk/l07lkoEAc2knlW260jLeKT4/hpHPKwpL3fiv+Uv/DnCz6hZXXc5z8/MKY9pdWjdMo7008i3JI4vaWIe7J+bihef5qp86ywQLUQnaPFVWikrdJZb7qmcc4ARZNxLGWic7ZhpT85EVfTQE2ms+hIpyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7F0DrT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0ctDeiM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7F0DrT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0ctDeiM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Au63292357
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=h7F0DrT8M9BWmZVq
	03NmCIdq00IQ82UOes3tXhmMdgcYRyXxUg+QgKkfEJNLgFzfB4Y6X1gJpPMlxUiF
	dl6rXBbm6sLlO/CoWPY/q1iCkp6Z8mIiGrj/0iB1axoeMR07SUNdAoJmR0Hmnc+8
	Qys5Bg2CFpNLJXgtQQ91TGAyMUzlHXgs+KwFKtMg0hgjanwLkjKoYzBXHeVYp/hV
	JlTFvZTae3hL2sBVvsapw3o4Iigp8aTrnv/O3T1It3xukVF7pAaYXDNASe+xLSAM
	44vEaMoFTLrImOPIe0d3i50uaaxBOO2k/ZJNbl7nutFcnSlFbQyYFsMQ3lHbR9PU
	OwZEpQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so34457e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818530; x=1792423330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=W0ctDeiMCiEG1VTUFYAAOdNh6jPAqQRS9HAFSGKlVszrFG8sUO7VqfVC687WltOIYG
         951JWkf9XYCrJOsAZzRSOa4n5dK4jM4IFHP1ZNMIbrfPtU4h6pSF7b2XVQT5j8zdntEa
         yYe253B/O9GckT7gXFxLnc8bPKRtqBhcdQjpMhf1xwzwnRjBLKBeTFYhuNIu3lbjSIua
         UNvfDgvxozxf4Usvjhdq+exZPPMTSTrxjxBRVAGGpeq6D40QOiitT7fqs1+j9KwX9Bpf
         jW/bPZfg+9krPjmNvr4NfeTBvaCyyBiKocKo+dAWFLBDnVbXWG9VA3VyBsNVnUpn8hrG
         HGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818530; x=1792423330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=jwgGNWnDCtuUD6wa1ZbTjM2Wwr86kRM4OhDIEZZWO8sLachFkFgUzR22SzC6hcL2NT
         1Gz/ShRMZeJR0vDZ5Pew35/GaiaNM/sQ7RCePlHVLKczs4Bh9aA5ZoaWN51l/Klr/GHA
         qUx1YYEBUFSf6OHhgNnB2TxOH++kGW8iJtKkyM3oz9OIGG9wXKvAVPI+caHuh8dGxxG7
         WBTSklcLiQpsCctqaCAO7stFP1yBAng5Sb3WmlMmOU1IURM+ruGuJunzHiHsIc/tKRDR
         mK8bLKQsb8vfIuEPsqee5ecbqbH+PsPLSCriS6HKCzjhfPdFjygMaUuEjjaJmSLnzckI
         VObg==
X-Forwarded-Encrypted: i=1; AKwUvBxGy15+ULHNbIDf8lJ8XuG+jF6xfm2+kHkXuKpa3P4zBNSdHYQLJAYtmf/0OilM9deIg39i5hhECEOq4UK5@vger.kernel.org
X-Gm-Message-State: AFq9FYLAjIW9/PMhHXyeeLz6uE6x2SygVJm0bhg7wfNF0gQEjH0f54mW
	WUDeYHQMsCqB5J23jE3ZK8v/eaWg9oZ4blZASEu5W6eVY+trl2qyuWtJN6Mcsu4TBQhhXqgi29/
	n22ZZPosUqkcMU8BqKbnKQr7n2OGIG/1jI6vpdk1sdbDwvCMRiEBEDayuWrZ3Lth8I6dj
X-Gm-Gg: AYBFou39ggUSfsMWo5DZVCuXWXfNQN2lq44IiVBHMAriXlBZKOiupL4l0Ci1pkMcG+U
	+9cXEDQ/iRL3Xve5Aj640280nJevXh7W0hMLdv4wAh+MXMSy0O8TWt3WwT8ukB/HCzp57qvl5Sf
	MoiN5Vrc2gHH3UlBaPvB9LqU61ItLelR2cD9+6ZLCcvc5HhoqwU6M7gxQDenBZRYnBNeBjtNas3
	emYJfXl+wPGpeN2BJooc4I3aBKliIkKwE4Hmm9FvW8+q8cKLFp1B1jcwYLq9uW4dG0TJEa1os+N
	IOkPKGKhveePSQ7ebOzrDseKrBKohlUKFJuBUYMFiM+f9qQD1aNhAFl8trwKO/02lZHGm7rzUOs
	G3gDl0TDyzPs3QUUNSm0qeg==
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2105795e0c.2.1791818530352;
        Mon, 12 Oct 2026 08:22:10 -0700 (PDT)
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2105770e0c.2.1791818529874;
        Mon, 12 Oct 2026 08:22:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:09 -0700 (PDT)
Message-ID: <96c79d79-328a-4174-b0df-4e3212d5d3da@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/38] arm: dts: qcom: pm8226: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX04jlHftaKnHE
 pNoDH33+P3E3tTlO0lT4JV0lDOZFiN7IyNsiwTWEXkJYDGJAIvBVvMWhgBL8L0S8zbEPorCNNHk
 lzGXfXlJjLLvwKPymleu9cc7bEUb/XjtbJ+oaFKr9DBDNOg4s2SBmCGu8tXsq+CPzPObZb7L7Tz
 WKYD+GX9r621ENLN6QttQUr/51fJNJQXVfgScNg6sGrWH3OeAHWjNAxVPb61MKxl4DYxQH2W5FK
 2nN+lKPTxlLiJMedm9W7syV5lC8e7KDXfgkeEzD+fxYAGDxHgHQ+61C22IyYBjVnfL/+nxJ7Nz8
 K9A1rJrCewzC7+3qRSom9oEyU9SSuBbyRkj2htkcifJfG7XfC08Bmc/JDMKSpxRdT7ODUao5LBI
 c9/PkxVAyM/SzxQsG/KQTazwW/JeHUcExHK3N+JShphmb0UgNMyrhPbENw50/9O/sP1b/5R/XiA
 45yfKjbimkN68MNibxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxN7YUW3hWtFq
 KiYQQkc3Bu1rJ8i6Thk+esDkD15QCvONuE39PKU4xO1RNvQMF7vUk+M0vutpiVQYMzoK8TrfQxm
 JTOLbaDA0a4IE5e5hqQ+IMJqC+HJMQw=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfb23 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=hhpmQAJR8DioWGSBphRh:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 1TGw5kREkaAStG7tU-64HFa5WnoaszJJ
X-Proofpoint-GUID: 1TGw5kREkaAStG7tU-64HFa5WnoaszJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
