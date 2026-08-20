Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F363D88E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214333; cv=none; b=nlebbHeHq/Ep8mf21jHPJa4q3+OAwMTrjslYELaKX4Jzf6hQ8FoQOe/g5bDK3psMTJzMDoDhUqujCnMEIRg/Tw8bbm+zvyZso6JkWbxXHMDxBuY8l6XY7oKWGLjoAj7akJHPwxgLP4RNk9F8rCx56ld1BtRZsJSwbASjH9RqrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214333; c=relaxed/simple;
	bh=YYyZ53DbcXWDtn7UM44D2X5nsQp3/Oxu5WxxX3MnfSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wsp+jDEAnwnYRO9JPuZuROBlfabzi2KtlLOk/z2lN3tkP4VHkinfir6PEOg1KtCvV7Wgoe0qtRt/iJ2ad1sOcV83uO7He40tQ3OZQs4dq+FvDc869ZIK+EdvR4+ZRLURfMb3PjrMxKxc7GU+gysy9Tx0Y0JzCmslN214LWzSpCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiWaisKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWtL2g7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiWaisKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWtL2g7i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PEit2465472
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=223qQlWuY3f+8iK33zdbyvUr
	oKwN1OIa3V2war/hhpk=; b=ZiWaisKmLP4/ZEJAJktEotllGzVr3U9erUWQesZl
	K9FWNzrFitsgOv6Tqy2u/RoBU0vmvgBAAWV0qUVjj4fbb5mNS22zZ6Ltq59ujyvq
	skSRP4q5QmNngi4tpckc/lplVOF/Ars/V3+mmJ5KbPPTZMQU89j2nKl26o4dRT2v
	QnzLii5ZsTZ4SVlcXiCZQursU0D2osCO42AkdU0YAE9GTpnKreQZxOX2zDDhLHiY
	/55OidG8lVxkQgmV17BO7GIFO1TibLDYVKvBh7/qcbwFuP8jS0KL/36JGU9rNw/E
	vA0Okrpm0kegm5P3LzfUtSWFVHUGcNdlRPn4u0EZFoBwHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29g020-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:25:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so248808685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214330; x=1787819130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=223qQlWuY3f+8iK33zdbyvUroKwN1OIa3V2war/hhpk=;
        b=TWtL2g7iV44SnfmO9G+xE2uwiiGK4WFmu14YVID4x0/JyBxWx3izjWLT+CQScEr9ZM
         ixrxtEXR8OiCiJ1xwZ0xZknQ7fz2JKYehOX41UBJ0G1GMx9YuwdvqaG7OZJ2/uJfiuCg
         dAfCImWOWi+J8D3zZDk7ZiNY6jKPDzaNTpY6sB15qX3w4OHCDMkKMLBZJ6KyNYOMhkhO
         V38J+Mbnt32Tdikm32EXJh7PO0z0hPdIZl8DxsSIiv4YmNqsZEREBYsU3yWdTFGIVhbP
         4BnRU4zUddQppee/yKRXr7HjIb69XdG8babh0+vBv1zLO4VA7UwkbnnuxWzZ3Itz48Eq
         oXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214330; x=1787819130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=223qQlWuY3f+8iK33zdbyvUroKwN1OIa3V2war/hhpk=;
        b=W2xhQd15Cn4tGNbs4UsEOPyDcP/Bgs80Jb5Zue9DaOPLhpin/g+g+J/BK5tmTLbUf0
         qrs1IcQJ79yYo1xPG2ZRkYFOBiMWHx5ggdi7vUg+VC8O+KMgoKGyxBXMt6svKou4U+s3
         UovzYpzAU8NyHnhrzL++tgO2vo4/XD+H7uGANMwhZ5hC9Z2OiZvq+49OXlYOm68VB2JS
         k820O96StxfLOxA8TCrRmBGUIQIYVQt8kcMUk4UcSbBXZa5GHKQUQXniaKJRHM50FHf+
         Loo4lvj+BPatFUUKEI56OTMlouchDrrcl8xzFs/tsAVUHPK6c3vG9rXOKtGZJNkJDlLD
         hytQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxWmzD2Fmzp/rkPa3nF1SulYtyZQsjKyLEe7hIcQfEoRpqiGVLnlVaICeZlYsQBvgy/Nn++WbrH8/pC3UH@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhAJehkTtUEuA7wHRSGNSo72XOQfEOcm8imx+YX/9J8ZL+mQM
	Fl1jRDdmcv5jbLJIzgYjdEhEOIZcTGrT7eBaVMho6y7o0jWetfm3NVQgwkHLo/i+kW/Aqnhyb4v
	6vY5qFycnyGMRnB3M8AaVpG3Gm5Syv205FgOBvFSCZ26UVKDXNpj7Ym5i3kMIbk1JgRjf
X-Gm-Gg: AR+sD12CphbhoOlbzYAcHqgBSCf5RitEkRPFVUZHAKxBh9yDaID4wZ5p8sBQ3d2Icq3
	Mqoj0ka5JgcOpYtpTRsjqqiuW5JtV1r1JulLtdgzXB0HnjGIYpMa/5Volpylt8PX3NsBVTGMTO8
	J9P4HGuNfL2Dtf9NVVABDxVgoW/iJilKJ3fxQv1QbKVeCpu8UOmQmnGpRnbmq5urSbXR7TtrWsB
	LJhetwbQXDBFx+4Qc1/WwH8K35rRPBN6COc1RPEoh8JVA4i01leMnPFE+Ri3i7z93DXhDb3P6y+
	qc3CUFziBYdgSOZ/dwcKJp5Bgl2EAbrzRRKkybLAPUQ3gq2F9NMm2x4wMEeRMx1FXU11VPuvjzB
	S8OnxL5czV1+aJKY=
X-Received: by 2002:a05:620a:171f:b0:92e:46e5:8f12 with SMTP id af79cd13be357-9371e2ffd67mr946977785a.30.1787214329891;
        Thu, 20 Aug 2026 01:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:92e:46e5:8f12 with SMTP id af79cd13be357-9371e2ffd67mr946974785a.30.1787214329361;
        Thu, 20 Aug 2026 01:25:29 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm11809010f8f.10.2026.08.20.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:25:28 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:25:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB
 controller
Message-ID: <oocip6a35iv7wsxtiudapckeklgv34d3cigftdc76jinixxy37@qdd7xsjxvkjf>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e45ZN78LwOdmC02Kgu7MNBAJlhoU2Bc0
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86b9fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GX6hXX8UDECmu-q5ZscA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX0rbPMM8u2K/n
 U/vgjARWYppAOYDUYW4/2WoeBiGP/Co1oqU4YexsUdth8YFg5yMZFy6fzoGeqsxegrxSesNpSp5
 DXvbuZmyReh1Y1Tbqjhor/BHkFFReC/wzg0pQw0FjawLPw9okIZQLSZr5ZujSRqlQ4DY7AEUGrH
 rHjpfKvLXCl7h0zoSZ0stfOBLQN/z8NH1bQVq5wndOi7sKzWF1x5o39L/1Cu0MjmYCNmfwwnYIV
 yZh/oR0ZxiQZ5l4If7J57DQpZ+l4lHyfaaXJnPbvmy3pTbO8/0dsY86JXuDbvySRRuakKu/1HTZ
 pVBeIuYuZuostttUNDDLMtkUWo3OfKo6MR6jP6abHJn0IZ9B6qjznSMvD+ex0kTwn2ARQ2vZHcE
 fUrny8ltzHXbQqa5JNExWc0+6FArSYlNhkCghw3kHjOvdghH80I1U6rYbwRvZzF9vnxK62tXNXr
 wjGnjfDQ7z/qy76d+2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX/np0onIzt3r8
 EuWZpo5j3CXNhFQVkhsWEP3uuztk/GBArsivUE+BrM2fP5o9nmeDXufdtT1GCEvsit2QYxMULnN
 iKb94TH3Z2RWecEAAIxyBQTTn1T6vxI=
X-Proofpoint-GUID: e45ZN78LwOdmC02Kgu7MNBAJlhoU2Bc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200059

On 26-08-10 18:42:13, Dmitry Baryshkov wrote:
> The MSM8974 HSIC USB host - a third Chipidea controller with a
> dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
> described, leaving boards with HSIC-attached hubs or modems without
> upstream support.
> 
> Add the controller and PHY nodes. The PHY is a ULPI bus driver present
> inside the ulpi subnode.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
