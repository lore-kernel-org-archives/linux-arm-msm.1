Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878DF41D20B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531061; cv=none; b=bNimrtD8OMQBku/GC4WRBNHYFEbG2qgGF7qBeN9MeRnuMuQJqkEdOl/Pj6GPMHqL1PV2xkj6r4DQ91osNYVCAq57ECxFu4WHi5hONh5kLw0Dwn5Z3/I6e3aLavarTUEFWQxdFkEBQwUBiszJv2Q/NRQHrP2nhq3nKrIO/r8QLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531061; c=relaxed/simple;
	bh=H1vbsm+sOVsTnTKXHpuCSh0JcolkJp2LErhsArp4W3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avu8TC+ZVS8h2ccrkodvc355F728g9oVTXsUffX7UHeUYwXdhcGdK8KMJ0IymIct9r9oubToy2H49bZKJYwZYxCcVCeWZZon6kYckfsO2Qb5ngn8rx9l6o9tq+qy0Hlnvbq8iPR0nN0KP0QfjuhsZh25GleZdcqOgrvvqYvYfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/F5jOCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHGLoKgq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/F5jOCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHGLoKgq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fpl73357786
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQbVCQOcYgrMSuBnKgBrK2YJ
	3K9nf1TQYgF92UBdgus=; b=o/F5jOCWzMjvLf0L6B6UjJI9CV7JlTTqr3HF5gng
	NSzTG4Y2tF5byONpRsb7dH1tnOWma07TNDS25WiBglwViqEdwqjjJYCz2HUd0OEZ
	6E1krrd57VQUFDwID8s4+VX1vQkycz7ngQNlZB9qTVwfSEp9OfDYQUUeF4dCTXW3
	DxS1Am68GoPL4+UG+/3cpxjbpKCPVhSMFLn3t9M+URWGoiqysYKdSboYa0jD9wV6
	XPFdmu1LjpuCfHs4HM0+scRWkOM7nNbyF5AkJF6qOpFm1sFuF0FD9P9ebVUORzC+
	rNiOXUV1V1hWyo6NlHvkbRhZi+v6g1AYwR4PTi5UmJXMSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1hdkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:37:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so7141671cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786531058; x=1787135858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQbVCQOcYgrMSuBnKgBrK2YJ3K9nf1TQYgF92UBdgus=;
        b=LHGLoKgqmoHj1HoPdzW4FQHuEXsRXc9qryefauDrlbcoJUH1yQIn6/XcDJODE4R88f
         N9CvQD3aBAbMGvlPYf+7ft6a5bryQMwITQ5YfPHN2++Nlfsa7KARz2neNkccW8GhwWqx
         ssjS81rxtgYhmURUiJEsVSVGh2MZmu6tLlQi27f0ZSwCD4jffSemFy2ddyuBzDCqBqn5
         lmDsXBlxSWwUgLuo6DEELTGvWMFHO4+KSOZnkOUr6+VMJlCPTW6t+QQSeQWPE7JeWw5P
         6AhTpvOre7+cJz9ahu6n24FBv99y6qXq3nZX43u9b6Pxh9FG/6gF+5zDuoBRm8X6r+KD
         9OSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531058; x=1787135858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQbVCQOcYgrMSuBnKgBrK2YJ3K9nf1TQYgF92UBdgus=;
        b=jEHxw5qQMI0h1S+MArVUTI8JZ3yG3WIbBfzkhDHlIsbhuuAYf1H54HtOAxaEFlEQOM
         fBikAQ9SJhqLGLALRyzC//MF+FiCliTBXSx6nwBTguTzAhzaM/KUyAovCyh80KpR6Wbq
         bsrqZOmnU/EYm0KWDUKqoN7xazeDUfpoSqD8E0i0KfCXEOqI8qRpbntT9R0H2FtaQJrH
         TTvlEb2MGmVs5tbEbQ+IiTQanDuSD36qg/JOoIIewNLxYp1PuTD0VKp5vjePlieQbjnb
         erP9Ce+R/a5Gk4z3TDGXgwAqaw7m6/PWWKcSHB79lp3BGgIJ6u1J8jldccXJUV54U7VU
         Binw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0s8aqvAvg9fT5Ji01i1zCIMfs6GSY6CVlkX3ez2FqJnwLiHpfD6/8zCGdfqWOJWH8/mL6a4UsNQdFWRW9@vger.kernel.org
X-Gm-Message-State: AOJu0YzOBtN/9Yjh1zIG4A03QPOHX4dPX0eDKeeAEZvD3UY1p61SCC5Z
	RB60lv+0npsrQlLRtesZEeyfTxibU8cZmXG7vk9/GMlOiyTlWEmDmNK3TwHaHj0P1l2A2m4ljb8
	ONnaJ1S8xqVr1CbZceoVQnwiv4nAYpZyPHT2W7mHEsvzAOeiR3zInorHRunz3Y0dElAIg
X-Gm-Gg: AR+sD11v49njM5FD1oyENwBJWE9LkG/kQh0Evft/981DFJKyKBxRdi/e25ckYvR/9Z3
	rH8JfvxIgguoYalDUGvrFldGS5I3ktqyLSJphu/f1dVclHDk0zW/xxfrhaCLR4XMOWP5Pxf/0jj
	pFHNCCrKlA0vEoBRPpKPYRuj9OYIYJoB6PbHGV8p/AmVBs28ljRd7UIH3qkessXzV4VIdEpPjRi
	K5fRSHQmg+gRWd5euv3Ni9W6//0EX3Z2qvFsaB0S24bOJp0f0h4Cz8L+aYRaox4P5lVM+4pFd26
	OuZVkBusqr42EEzMbJFEN9QfQaHhe+BvBtRd4G8cDJj8zPt75TxCGUoK43kYhM0aE3CcCixXCDJ
	gv8FbN74egswcLyU=
X-Received: by 2002:a05:622a:4189:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d6470814emr31453421cf.16.1786531053472;
        Wed, 12 Aug 2026 03:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4189:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d6470814emr31452941cf.16.1786531052930;
        Wed, 12 Aug 2026 03:37:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6345991f8f.34.2026.08.12.03.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:37:32 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:37:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Message-ID: <wxo7xxafymokwrkxra6l6umqiayrjdbmxb2sfqe7n2pi6mvm34@6tj64tveexum>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-5-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722142342.990384-5-mchunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: COJo-rLSsqMZexqmfBPI23_TstgxExFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfXx6KuDSQZXxrU
 O6dobokRXbApq3OwVtwNEs/ddkFuhVx6oRJb9qJa9zRGVniQ9mHa/fEPXb0qEvnSlKjQJrBXdfc
 qjOTSXVkUKfOLE/MP+u365KNzuyxlmp6nmoiIAiHWnd8hHYH6rysAGogMssb0jx+brWaDJOf8wv
 /wH0ncPHigsgtRELe07eaoVXfU402FCoCXMkTmdBBBYTK43UfQigMN91ob047xAsW9fFEY7KskO
 kB7MuT/N13vldCK8lUIWnVUF4ws4VYP/PaGeZJSD0Q5RCuce4rJJ6T10jrfMugsjU+VSgGV3bQv
 P6jc+eEZEg+jcoiGbjTxqDwnOnH6mGgGhzOblTAonRfYJO5vIYJXyu5ijS/IKFZj05rm3vh+N2j
 0qmyDXpQ5W9adgwTkoPl5/83GfBkf8/yfQNR/Cvq4G5B75B2vTiWeP+xVsIwGUEIpn5Lkf4aCXx
 AOqupGRbaN9ssPAfCGQ==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c4cf3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: COJo-rLSsqMZexqmfBPI23_TstgxExFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX+4udaIIFuHCH
 oKr/JlHhx4O+1UULaDtHDtZBrVH7yaaUwhXjg0ziK0esYWsp8EUQtKzPin7viBysf5T7L6Ie5TR
 kd+S57vcBWSCwLpcbiQpJ6x0FHG0Bec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120085

On 26-07-22 19:53:42, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
