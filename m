Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5D3CEB9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164227; cv=none; b=dHZX4+im1oNCFDkFPUyNP1CLq3s4VdTrjk6smp/htRkAvgWMr1oPgStXvkAhbEr4UgYPOz6MLREHmTaKclYBSH0rzHsTxhZRIrHzL3Yd2jZiBrXBDZOYEFhE4aIlQUUTN7qAbfIT6/EnJ6hXYsJcpReufBk/h4n9MXRYmzWnHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164227; c=relaxed/simple;
	bh=WXjSjOxe3vtjSAPiOCN2Y3FCXm/CUp+X9sB7J8Z9MG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnHY7vllxlkBVJqAWCDg9ga9ML8x/ojSvN+2NQXdkcnCUg68oW2u0KaGqePUN1Ahmy90WfInY8lzqzMWY0gN4RSoUHgnx9hyChvgXfHe/HrfYgdUUtn7a3HJUqwAt4S8Q6h7bSkTRgi+MjKahYMZzyYWkBNyP4CjG5utTtUQheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTD/9Sw8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ry+z5umb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTD/9Sw8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ry+z5umb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNU03018234
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W8UKaoXLjx4+ZXFYWlnQX6j9
	wxIaBVA5kfkRlMlNbpI=; b=JTD/9Sw8on2zFdHQU0ONFcw3jXFg2SkDf0QiG0VM
	dUetswLlQ+Yu6JhPERoPr5/Es4e8pMRkBDhclaTtftQ1yy56/cN6xNK7WpyVjA1g
	D/ocB2wQOihn7SltjbR0a4jtcFC1E0xukCzr7oawaq8FLG2Y8iq33YSI+W8hDaRE
	fLGmiqN2PMJ6JsZNY7CTdDeT3avj3/6QPL1v0fYAVMy4CnRsEMiRsKOsGPDSsDMB
	OCgfpSxlxDhi3+4yf/sMvMKSI5d1P5d7euviBHOcp5FZHPtQqBZgzxFPXc77K/D8
	8kJ9vbwUdjP25F/4ijOzrG2qi5McJa35K+71/fiB8JkHsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:17:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so451200585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164225; x=1788769025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8UKaoXLjx4+ZXFYWlnQX6j9wxIaBVA5kfkRlMlNbpI=;
        b=Ry+z5umbQwA+F/y+ESZEAbgO/GXnHELbX8MD298tSjqIziWmE8suZYxDcSd+/7iGGs
         0P0VG77nOLiFJ21gLUcot0JmZLcAvpr4HVBTRt2TfAAMVJALZdqGibMM85kMrs9/3mO7
         aN5XAm28DsogptnPaD8UXcdW+QmlAf6M4i9RdnkvmGBjO/AsG5h/HgA9E0iWHQCIhKh8
         Ywmndq7kMkR4su/a6IIm6XzMzx8e9xVVW+Yz4/lBKebPNBGvXj/lMmrJEFlvhaAqaVHa
         /E0Qj7o2DCdIIfx9ZVR/rg3bz/3vjPc48ol/4E9I34NP3oVSNBu073/JHZjH1EqDAczd
         AHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164225; x=1788769025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8UKaoXLjx4+ZXFYWlnQX6j9wxIaBVA5kfkRlMlNbpI=;
        b=B+FEWhBx0naEihjZuRNcKTrLFs3lkvxgV9MbwsTxEM8DOrIxPRbe7736vw3eH3946W
         4rB35rVKMNNrtdOVq8yLUHhlrG1mxsOPMvYJ5A51aU7XPgo38TKfNc08H1PahFP2SIff
         4UZCYfENrFnbAEhTPisEzAsX1B+/re7T5kqUg3zueOlRy65YkbkxdQss8b487NKiaUfs
         p8X6Q68aGOYrmyWQ8sX8xe60C8HSDQnXvWeEVOJB/eMQ282dkjBJngtGBm0ijr7cDPEL
         ljYT26kTrHJYTRXFWGa17Hm1YKOGHgtDd+r7VDIPoVPsXfWW6CDPtLUNsPm2ZTt9wu7A
         zZqA==
X-Forwarded-Encrypted: i=1; AHgh+Rqmh6T3O9HbqK8ZIiy8qZwlKRSpy7cdEbXNL50m1NmtPp7aw/gAexjGZtl96BsKzVqv1ikH3NilfMWZuF5z@vger.kernel.org
X-Gm-Message-State: AFuF++m8HWYmQ9vThC/nevIbb2THBin+uv2CgV9R94sbuprZvJmamNVl
	GRB8Xtox7Ayx7NF+7dqUaIjIbu5GEq894UFcr1O30i+0pTMh2b2pKk2nTuTgRw0ESaQf/NmVF9L
	CT/KAWQ6ANUzm+mdCWWzeJ3Q581i5h4kSW2hWWGdfMkO8cHg2KH3T6XgwKREVFTJXlnDb
X-Gm-Gg: AR+sD135z7kDTko0gVChM9MRjJR/QzZmYq7Y9UZ9wlTDZnr69B6Y+pJh79S3W2Bk2Pg
	2Hyw6LMttdCpZIm8A47qP4I3tjyo3UqnqusHbA5qLVN+lVp53XIfvNAZHAmgTDQnafXNZbFxG7+
	nnjWuOFjOtP/hXfmvx2IO+r8kTHZqSTwvYDYKGHQ5wAI1h1MxCn9sPs5DzystgYKuVkYcy0KFUC
	MuNpj6hJ6Y10IlSVaVdlTMDQOIeQ6oF9P3ovzboDlErkOqBVfkcM6DxdvAj9rJrXv9A6X89d2qV
	a73tGeRcp6W2aD5kOwErAWm6utHhr5e/VQYfkqiIqSYj6h+/XV9GgAVg2DviUOYoUX0WPQeJXlP
	ln3rO4gX7nA7XkQ==
X-Received: by 2002:a05:620a:4691:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939138d817amr2706638185a.21.1788164224571;
        Mon, 31 Aug 2026 01:17:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939138d817amr2706633485a.21.1788164223956;
        Mon, 31 Aug 2026 01:17:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm291111315e9.11.2026.08.31.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:17:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Message-ID: <ywkrf4rui35u3fuqzxmuyocskwrf7w62lcgnhbxcjch34vsvww@olvgcxp3yaa4>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5YDZKWjt2mhN93yvebwBLrGLsfPojuos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX97XoEvu5MBJu
 qLsmV3sm55/L2p2S87v3IHD/VzD/8TbhB8OSh18O/H5HNWWhFRqBRGQgRFccvFgeisyHRJHr1hO
 bg2LYlAXbf8P2I3jhN1tk4dbwy2yKjA0RhFVweIa0LuUNh9TENlWDQ/znDdHNL8Ak7E96ET6dti
 AM4ev8UCevM56o5v3pAghIc4sACtyFZypOzNim6GuqarJAaOLGvKlZtHcXT1w0bIxv1pIU0/Le0
 0WUWNe36Jj3qZPK/2Vbyy3bAYfSiFjgfZKYsKmkjru/hG0uJSpPl5mq0gZssHdh7b53+ue4zwSw
 OZOMdjd3AfoLit/Of5ktVY8llVuDIeJu8+AXx+j/DSbqi6V6OEinGE69/rJyMR1nSihU3RA3yGC
 OUQhY7iYM+KV0Sgn3hhMj1pbxwXLsDsE6UttV9LvSgGycdZYsI2hzYjApwqxAVfmvxldA4gs8QJ
 j8fDsQix8SdsK3htQaA==
X-Proofpoint-GUID: 5YDZKWjt2mhN93yvebwBLrGLsfPojuos
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX0kkeTR2xZSvY
 6vLVqjInqaMLhyBa66AK6zjuE6mOytQGD5N/7eESmD74G2OHv0yRogFsA5wTD2FBvBzyduFQQ2W
 EN8kuWAED6cSe5WhansnK4JM05ZZc8U=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a953881 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1Jmwf9m3hYnSCzCNOYgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

On 26-08-31 11:20:59, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
