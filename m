Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36134749C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394663; cv=none; b=ZfAP6MUFeecjt3TrqEb7azwxYKuxNzqG6ymjdXqBJrWjXuq9aq0Nta7WFkvyzZG8Q9nj1WagkB6s72k88kpkx5/t9IdCcgFqM2qLoaC0UtGL52J3zp67KLHsHrdtAdAYNs2y3mqLlquOBoTOjg5MmSGMtbV9q8eq7bqwi2LlVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394663; c=relaxed/simple;
	bh=7ZtG51IZLTdydGNYwr+Us4eISfQlEChsCDkVgTU/X2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjMceuGG5UM07+LyeYergFg6nw3YI3wOlggAuH34rLXo07kDUMLvmIzwanycHMDTySe0Yh1kK3CnSq0FGBjnvvd0CqGo2AUEbKN8ldkIXukQWlB+8xNVC7HdU9Qmo97h0lUCyR8Zzfw+oFP3MX5BF1zZdQ4+WRjen37qf+S7K/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFWvsc0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY8d8+KH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFWvsc0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CY8d8+KH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Xsx3588180
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m52tvn6ZedywlQd/Yfs9lprE
	IgWgSZuxsJ69OVTJm1U=; b=IFWvsc0mzlwWF5IldLivUWX4/QycfW+J/kxGMwsk
	Cp4cX1phyY6ZIt9AFxgzrblrJDbnVSRSMe+DB/MEFir9AqJE9aihU/peJ6+KMIt4
	87P2qaT5RJDDK1rqSlkUsD4Z777oRrqjO7JJK/oLoM0NlBEW7/HrxA+uQ+muSB6l
	kGQXfn46i3t5N58AsUiTBPH3ljiYYnFINCfKsPcrATIaWQ6XLMxug0AKRJJ7XwXe
	u2gdQIT2/hU0nNuMdiP1QlgdwF50StV5l8zyv6ZPHaT+Gcdyxy43ZMon7Eo+gSDD
	dWYTIEV6mlxDxouO99Di2TRloskrmtbcotahqJJwPoU8PA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8yw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:04:20 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c153bab4c3so3132401eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394659; x=1789999459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m52tvn6ZedywlQd/Yfs9lprEIgWgSZuxsJ69OVTJm1U=;
        b=CY8d8+KHl1aTJc2Z7o96s2YdKnaA2kKZVnVMCGbRGMfGhkOTXhx0JRButtPnl0YjQe
         cy82IkI8hZb4JOZwHGvJTjPui8LNMhdrRsB/jEcDqHiBuuZlUbDZAtIleBgzqfJSByrS
         c0fXoKRfAAzBoNhm04bdk1upbby3jifgKzUwTQjb2Q/O5MtdQKwt0WhO5ogNoV6YodfT
         e9odX/Atl7fFvP9ygGF8c4sSUcTsKgYLl0jgxYHeWhd2PIMcOZYn0fgZUU8jEOzOu50Z
         BapWCFWgeDYcNJI6R+N+4ggjtmaj05FA1EqryHX7NUfoe2HNJcOg0u0P3poGGHpUM3pa
         VLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394659; x=1789999459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m52tvn6ZedywlQd/Yfs9lprEIgWgSZuxsJ69OVTJm1U=;
        b=cnMqi2GBqMkFdnAGgcDinYf5QGK/AilbZjkN2X2UDEj0ym+1Y/MdJRrJbsoxorpxH/
         /Q0u0jScUs1IEqu+X7E+ZbAb1Qpdd8xByxaET4l+CD6a5WTY0wQG2ZuQv8FcHYmKNfwz
         f4YzS/f4PH/ldpFSmwLnQqEAsk1rDl+fsDTZBMTW2+MpdT/yOWslH3JjXuc4s+GB3LTA
         YrDQu/e2lcGTwkREJ5BUdQTBnjwNw7xcckxP7N0iYEPCyKMuG1VXHitJYP1EXbPjnebS
         Pk9fSmNZezv4msZvVlT1xYqjVFjAhpIU4GgKHDNGtCw5ICfJDdXpHj7QB09C9ekoXb0f
         df+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzb2oIRoc7o5MAjebgnA+X4lsop3758ts2pI3dx7Uv1/wdNPDsJkhBAeqzGvD4CLYvGqCzEJhLiGtuTz/Fi@vger.kernel.org
X-Gm-Message-State: AFuF++mrwK0TI5WW/t+bWaBvaKYZHyzgeDE2GJGNZ92AVXMN25Apt2RG
	QfTXMUR+yJxaWlAE55GfLRcY1rjO5dTGmutxcg4kXsNySimvSvr/gCd2sEw8p3QhH7EXYmAtpo9
	OsrF7EYd2saHZSaoPd6z5ngg6ypIYmB0Eo73UNxq98sTStC4/FuyhByEN5CRTPIJmY7qz
X-Gm-Gg: AYBFou3jz+5pG0g1AEjPAzZbpVQlCC4qRH/Lj1kqpVjVgs7RUcpluAXEazoTBQdSXP+
	XByzc23SYxLgKUdZvb0whkGT/kLGL5ABrzVQpP/bz4bHLXByKdX9ELaC7qD27oMELIAeuhKd1rj
	j8yHG2M1Lhe7G4aNqOkI3/KZ469WWFiWd4U8bLEMFeGlvj7NhjS80yuL1ZIGVSaxYf3GoXmWR07
	4OavgfFt3VAUrlVP3kPO80tU8wL/9/yWVDJa7xNNCb8iITZJF9uaBfkPgrOn185MC3gJJIkasbL
	09bVUeXE8ASVWKkd8aZhG5sv4cQIzpp0CZRywzkVP2IBEzvYSn5GCDzL7V9n4k4OMz9HAMA+C43
	rAQce6OZQ7mZWqw==
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id 006d021491bc7-6c54203f16amr1477386eaf.41.1789394659333;
        Mon, 14 Sep 2026 07:04:19 -0700 (PDT)
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id 006d021491bc7-6c54203f16amr1477303eaf.41.1789394658737;
        Mon, 14 Sep 2026 07:04:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm5983725e9.3.2026.09.14.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:04:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:04:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
Message-ID: <pngfa3stqy5jelag52kmu2qrzbg2lojrmnuuz6nc5lvfvbdagi@ta4pz4idnu4a>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7fee4 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Uuv_azA6OBGcZ0en5L0A:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: x7WIu7vERvGPEruPC1nYg_uledIBgCWR
X-Proofpoint-ORIG-GUID: x7WIu7vERvGPEruPC1nYg_uledIBgCWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX4KFv2oCMoir/
 qM2ejIh4IljZ36/VZV+Q/3y+jq6vGkEP32awFAm4BMI5jyykkjcuDWASy7rH5HqpfdRAgEg0W3/
 FXBSMMCDLJt1csb9ahfR5G2lXhCxHWWewFCBXMldOm7wdMdMznj/Vosw9qNo6xA/nA7Nj9cPTXZ
 AEPDvgEn2mwRgums2efO6pXM9dMLqficbPk+lRMY8BvyAjv41VmZ2xxSzLhBgNtKX/ITZCKzAAW
 +3AIySwzMNupX9hXE04vLsJJOKU/MJnbbtl0+nkVR6BQouPPwVxAwc0jw8Ij2RTvTqaHPn1OSrf
 jW2B65DFvBvtclXcK4Tw5BdCcHkCY6B6rEg6p2RFQEV/4vbtmK+fvDMVIK2tvDcHNZkCDHPXC78
 KEooD9oGmIR3oMkwXYtvz01QBtCUOr4pWmWeJvzUFGd023Xzxiux04y1sjbf9QwLDbEkte1RTDi
 1iwh/D8KPxciYKO9NQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfXwWTIHt/dmyPK
 IR2MkLo3wuPx+iRn52eBTNZ2vKyaGqnXxtGTrRyW1AvEJ7x3tiVnJ+5KxGXfMyJ1YIyeGrehmy7
 PH9nQXW3e0WHm0Hb8b++6QIcDtB1E54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140202

On 26-09-11 22:17:08, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

With Konrad's comment addressed, LGTM so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
