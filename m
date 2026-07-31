Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2D3F6614
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498989; cv=none; b=OgM+ewe59lzKoPL/P3NpBX2B7h1l7WJWgMe/vZ+MbSmgfyt+BpKluuIRhAkjwWxHHbMjapcH1ulTAxULUXlgU00k9zh69oHhoaMm/HGDyIvzxZzMPyx/xshc6Cy/EjKpz1vqdttG5EeBgQd/GE+3KnzqCWa2MRAnkpqJkBeECYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498989; c=relaxed/simple;
	bh=ZztRHiIAVKF+8jEYaeYDQtQLDTlU9pwsjGZiENaMr94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImdXO/cEmqXs4c7Fn3qFhgF33l+0q6Y+aTGWVaBKaizvMnKqaWcboIuEqF/TD6yQxIbO6fUxA7nt1YL49EHgd/sGJycvent0LrddAhxybisu20Jqv3bKK3m/q3sKErI5/um3y5PAa7gSqJkrZhp+0jLjmXJtuX29KywXCFGSfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z80r+B/z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhMVXEaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z80r+B/z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhMVXEaI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBdBVs3371064
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A8A/dgkDSxTCKAo5zheB2WNS
	Qb/pN5sTWD9PkNiUW0g=; b=Z80r+B/zppKvvO1Ihb3XX5b4279Ww9NVcPaG+AIa
	JU4UOZHqS65mylLkVvQZktGNeFUyQiYPc/eIeaqeDMx7Y6cq68W0KBZsfzlJtk7T
	k85Ig6Xgf7olFoSCF48K8FloHKiQZkHb0Dp9p1K4qeEfVPOSfiu0E9hpbFn9q9aG
	70e4RjIE9D/6qFt8uYNmaFNCnLlqCmiOzkRyc3HPcwtrn/ZBVn6GRw4xyX45K1YE
	butLAR8QYmyowvmRTyVmXWF4iMU7/X57ALtNiA9OcVJRIT5BQW4MS8GdYlaNZvmD
	N30p3OfhfOynuzghKnDgw9keXWG+pBn7PCxMUa4YWnHYng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y01tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so9452161cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498984; x=1786103784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8A/dgkDSxTCKAo5zheB2WNSQb/pN5sTWD9PkNiUW0g=;
        b=XhMVXEaIQsXdujoO422JBpJmkAkAOFzLPm/2l7EbVqZlWQwyjMBcgcii/6pWr3RXhs
         eZcIwQLgI3wxsnP1y1IqcAiBEO83dwczcheGCGU5nGLLjQik7VYNU/DZN4eVMDQzr05y
         a7DD5pSrmMN5sAnjs6y2J0LmwMBJI9ZNpLMUEJrGKHWPpG1QMNKT50JU8+YfpXrcLQWm
         Lki7IQhKIh5Z4YWudtCUJCOxHLWPRIfjFOjHIo/UBHlwD1/hrg2R1HvarPeWlCjNWfNs
         ceoGQLR+rNA0vMh4os1T3JMHXecdRwGicDJtjUtc6HlXQu7au2fncRWzBGsIRcXMl3Im
         vLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498984; x=1786103784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8A/dgkDSxTCKAo5zheB2WNSQb/pN5sTWD9PkNiUW0g=;
        b=aodvEDZVxwPF5O4kYSlwIWhT6/oaglrubeFDQLg2uDIWizqATpGGCdRwDzyABXbCx7
         eBaJkD57MT6qQLuw1nJFbIFvlX4ofj7d25PfY3dbmosjzK902Sszwa+ZYhIGVe4xetUE
         oCUXczi7Skao/nomiqnx8DrrPCY7n11aG76zO0VixFlYTCCIWZtsyzuNsUdGNcI4qxdD
         GB2+fvfOc7ZJ9I2nd8RltjnxkgTJSDll9YWBbHpi/82eE7wlQWszK9TZaZaJ8++WY7d2
         DY5L/oUtugbL20NQnB7edOva9YyFEYuGCoJMrn4+1vxhXUUMArmvaNyMERLF0kz1X5sp
         Twzw==
X-Forwarded-Encrypted: i=1; AHgh+Rpf6wimZtLFxGeygtlaqptOXc2EzslZizWM/R3mw6XR+fQNjfAW5/bQRdMwaI8YEv/IwMO6p47Ln2bwj784@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5pS3ho7eftM0PWwiEQMpS54j+4jFATUhept8WVSCBF+jCmzK+
	HFcz77dlsM4mBa3z/1av3/zSNPWPOQO2ehWzQbztURuJjf1g5j7OZfZ1x89PcAAkWobu1PKMk8s
	H+aknBgA4ISnIg1n1vNG1qhNnW8ZOY5zzEULhEIWyrkbRXoQTpK0w9OhgMVfpyOD5fd5k
X-Gm-Gg: AR+sD12GIhHUKDbphzIe+6lG9L9JZYuV87ElTkqYvPzzTZsrgk++SDh0Qm7cy2C+aKC
	ALfCBYCjFgYXbO+C7qLWlG1Sm/aXnydJKTF+mDKjVTiOO9V+y4DcMEju2RXHldPshv25YUtM1l3
	be8SddUfb9CkYtIfF+0MsE5I/BBSQN30ncPehPP6K0dNIe2APko6nyAXc6UQK3evTCCRNbRYLPd
	yV4T/8PkQX5NRCAEkgBsxXTjUNq19PKrxVZGXi972bI0AxH3QWEHUKW4rW3e3ykxUnGzLnEJV1A
	CteT0SO/26yKnMvS9zXpa/9pKaWW4HVlKJNI5OCbAIYAO9ULF+l7lb9l9Y79KWNUAfRweSyUrqi
	N6+zd0spWMArSozU=
X-Received: by 2002:a05:622a:4105:b0:51c:a7b:f730 with SMTP id d75a77b69052e-52b4afaf495mr23885231cf.33.1785498983640;
        Fri, 31 Jul 2026 04:56:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4105:b0:51c:a7b:f730 with SMTP id d75a77b69052e-52b4afaf495mr23884711cf.33.1785498983165;
        Fri, 31 Jul 2026 04:56:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm4055437f8f.22.2026.07.31.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:56:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:56:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <ln5gd3zo33z3l2xsnciq2kxpxc5pqkfeltleyucv4iktdlta4j@tp6y5lttmfhy>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX0N1iBtEORKYg
 ddPLXfYoVF2Z9mwfAVBIyNW9emxrrWPy0+UBC0m+S3fhofrrKYBrS1eaOaO+BR2hYsXpFQmW6dk
 RVAeaWvzSNYKiC1m8YYcGzBG5vtkmfA=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6c8d68 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pZ6eNVg1DDkEi6vEKfoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX+N2sCXUlOfGv
 5xsm+ytxzyYnp5PxBtRZ/8PrIMoTfEAQ5n95mYX2MG41sDeY2CJJd2EBA6Jx+wERUKlW8TsnahC
 uFKfaK/wVCJeweUMrbLll01gEuiJTHWqNOPk2AFg5tJKNHzjAsiGcPsgGvWaQZVbfJzPDzE73AP
 mDPfuVHkoDl7bkJjXpdm9jUUgUsQX4YDgYrGN80V7mFQUBn9MM2uhHEt15f3KgLoVQFms/VnFCn
 zjWX+WO9SkQfAkvb0mvs6k10DEbR/ltIgKw/LVK0I3aoMYMiy0qDrjj2IO3xaMLjNrP2Rkb6gQD
 JWQii5CglKyZCWIIkNHvBMSn46lW88uHkvPHb+ryiadLXqt27p7l7qM/hvCl0gSrd/Sas6sXMXH
 /dlj6Z+y5epqBC6uzRRuZ0Lfd3LHLZuqYZRav8uPkRUmcF/MgKxyc8zIwfWnI0GJxZbMy3mexOs
 eoAX8wS5dwFNqPOm1Og==
X-Proofpoint-ORIG-GUID: Dhl_ku02zN19y8ZVbEQzDM2xHDZRPKDV
X-Proofpoint-GUID: Dhl_ku02zN19y8ZVbEQzDM2xHDZRPKDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 26-07-24 03:01:22, Qiang Yu wrote:
> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
