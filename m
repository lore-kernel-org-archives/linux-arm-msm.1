Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516066;
	b=gpGwcbEVlne4Py9HCBeNgZPjltiWWWknpb2oXMTUCdW9+1tEzoS4Pcel/txKstivYYhH
	 8H8pIWtmOcd5AbL/88oRj3rLi/7p3az/btA9Tgp+fSRhW2H2VYZ7eTS1se//vSa5/5C40
	 i9VFqUAjjn9kb9mmH3a3zvzXcu3XmCj3cAv29Dx+hLExtqkNQPUzliz3GGLfasX2K5Y8+
	 SJYMy/aQn6KIBQXtae31OD3YIDE7uLJGSEbXxOnwYXDhkL2PzfXfmT1hRzDzX48Dl2XcG
	 Lqo3IS8MK4OnmOdj/tIQ/7anneME7j2fxN5Cg2yuaI9urLsPr8NA/XEC0TF12AOw9mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
	b=N02FZ+fFzSFXk5NNZSxF+uMN8fM+Pt/zRbhj4DGK9EvmNZ/nk86aEks4tFNsjEb+WEr+
	 E6wtPSJYPadY8GqhpnQfp/pATL/dDzC58S/YrJCLNtskWu76uK5lHd9cSvP3PTh02Klhn
	 0ce8y9wHUObaZx25l3ikhbU0lwmhhxCFrZ+0avqvn5oRz8zS8+MzBS0VYdZ8HjPvoh95E
	 mHn29bMle3hd2NEnoa82viTopQC7MkVoiRxIxqTgdX/KEspavdR+WLJsUBIcxsHb5P/r3
	 u8DwRdTuDh7zLBjszO1LcchqyPQHqqgivEhh7brS5I/zyLdzIR7lsMki1HhAiPC6RLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGCN7uqN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AK4Qhj/d";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CAD606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGCN7uqN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AK4Qhj/d
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8S9l5016819
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vcl5YiUrbFKyKkOQnxaMI+T4
	7Jq9o3luS62ccZg1YjY=; b=OGCN7uqN05tuOGacoC1593ZXu/H840KxnH4UJ6Zt
	NUsSLwJunItQqdz7vX1SttC39rEeMZ2dFc+S09B9W/R5PFaoTVFNJ6aT/rnSqSCl
	KIe/XrjD/ppEuI4rLTu/MTiL5Tpx7YhezQkkL8SVwHYxPVfCYW+bJsqGPzwn3kjK
	A7JsNx5M+b4AjFk88vjhdydgcDk0qLnocYhz6tyuMm4dGe9NDieu/IqmoocxkOyO
	fG8/e5HjHwuURIrzSjJa5+Fj7OZsQGPl9JKpueS5XG2WbLoqI2USbBF2xyYrSonr
	Fwv/PdZ7sq7+5oYSLa3tM/yOaTVdm2lp37Ha6g7CHe5tPQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nub12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:27:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b29df78132so3910829c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516064; x=1796120864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
        b=AK4Qhj/dBvYGgezfeuuAmX9FgHkw3wYkmnJGSx/tgYXCm5g+z/dX2iXGu+Dka15vD8
         PlIQlPiINrgMpX6Bi1SdHHyXJWpG7Z2PpF8oFLY5+aJ3T9scN+e3D1U9gCnv9qrpOZz/
         m7lgtzHiBhxIEfgCYj5KwnA15CydxsQLQrmJasfoCJYsEkUX7xRuLf7wb3yCCDuiC5x2
         +LA3B9tQYHb8J4i1RqwuO3+slCNKMDuCIGaw1fBoYcd1Zgs7tHbR1Pb+kMb1hoZaUfIK
         9Lp+E4ktbFYcP+pWhHR8fZN7+/PPBrK8dxV4oJJG/o/xPmW4Cf+Q4lPQN8+1tLMNMbOX
         m69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516064; x=1796120864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcl5YiUrbFKyKkOQnxaMI+T47Jq9o3luS62ccZg1YjY=;
        b=I+C2zo5rJMVL5j5Q1FbUORvUj5hDIFKKLGY0bzwHcvntAMu2c0lYTeN7iaJdpsWrmn
         GT+FNeR+PQshtqKPKXiq0JOJB6GW39BxJApHjrXKVIv3Fis4SRsZ0xoRgYJvNmjm3G3V
         QlOBHUHLElMRX6AgTSIyCx5GXO+MUJz15DMYVLaqEvCgzp57WP6C9gMZfOSZAUB0RFW0
         TO9eZSoEg8K8KvRam4oHM30l6n5v/uf8GpXCyL7El/nAhTpNbje5950yyqIKb2Qe6D4U
         2/nOuQFUAjnc+ljckynAL5Oi0DF2B/BXjOjMiFLAiwpQ2RRyCILnlOqpo8w/FJRwR7Tf
         ngSQ==
X-Forwarded-Encrypted: i=1; AL+hErEmC4+HRf7mp7K4Go9rwuVMwQ4KcwuNSGPoX/zMtJ3F1+o6fWhaLYvwfjI5srz5R4UxZ2Mi9ZduSbRMd274@vger.kernel.org
X-Gm-Message-State: APuU4Z/2RWQP5m2eaEa9VyKxwPJ6j6M068wIin5sORIaRK8iU8iMRYcY
	PGyqcV/FEPBXaBsJ6cKmiEJGaRB0KitpnGYclqOHro+bzijeWssC/exfGqhJeVjEuM024SP8EE/
	gS6g1RubmnU0r68g3emN8OXV//M2PsjV1dc2yAd/G9uxmQSE0rzFcJvEs7WNGJpBt79xg
X-Gm-Gg: AZFdTZdp5eAO9Lzq0rSr2tUA/VYk6c6Bf4JADZ1d/U7EQl8fbTl1FZa2cTYcBHVmdny
	4pLJmDX538DDsp4fJpIEyXhWDHlPYWuapw5qKAowksHRJYTBJxVetaEL8GvACo2T3XSqPp27sJd
	ycU1rNCV19gjeiET6VvLT+gGfSrfeha++Amhk7gdviFVjrB5lg61bTP2fB/LhZ5Tw7XQkuX1rJ0
	mj7yeM7v3X3sjdcRWODN0FTNH0Dt5O3pmcski7vPHZScaxzxIm1xLnOV88VhTzJS/eVRNdFJ1El
	r36GiHo2voMGol/OcLYjfhMPJZaJ5xueMX1MgEQZRTANYFYHFJH9SFyifXXXAbKb1vXek9kXzqD
	5QBTSJaKoOpXLSOXJwtODTWIhiSplDZAcfeA34YcSivJSraucoLP+d5AKPyKPiYPQMn6dTPwL1s
	FZ
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr12874033c88.12.1795516063656;
        Tue, 24 Nov 2026 02:27:43 -0800 (PST)
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr12874001c88.12.1795516063089;
        Tue, 24 Nov 2026 02:27:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm49238690c88.14.2026.11.24.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:27:42 -0800 (PST)
Date: Tue, 24 Nov 2026 15:57:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <20261124102734.7hf4s5nf5kpkw64y@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXxG45H120Qz7J
 RHdZioIrpqJhp2VD4yRSnN9AzoZk5K0iCVYDzpcOTJhB/bcoZ5y+H3xD+QzhYGxy429gbzNKomk
 viie+DC/iDVDIJPOFljpi8Gk7pT2Z2wep4Z22emEQo6tfJPlfcqWy3ohSvX4W1Lo/k3Bk2qHFv1
 3fshahgeWBQHLiJ1kOwqWFW4T+ii8qRWBOt6IYpBzlMKdln9GlwK91G44hUpvohzhTa0Wwz7ldI
 PGk3/HvDMEW0w+smu/KxMGjjAuMHqGLBb+kRJ2XVmj+Z8GXB9SCwCt6516yVWInE/j1oiIu2zVA
 ibCiv29vQepT+uU9p+lwZ6YMc2/ikJ7BbPNG0dsKh67kf1oKnYtYrpK9r4x4rVt17U2QzcNk7k0
 aO2KN0u/tBvtZBdo/IGxjRh4aNht+PiclyTLpLqFg9VBoazIY2DuS8Ni47QIpPGVTXjKtzENa77
 D994zDp/C02g9EUEaqA==
X-Proofpoint-GUID: mGC0DBK8cV1IoNNCFY0XRGyO-2L2Re5v
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b0566a0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: mGC0DBK8cV1IoNNCFY0XRGyO-2L2Re5v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX27RzgPTB6aWf
 ByIGedjPeR9rlh3zmBMamTswocmhofly+uSrBWZl3/7CZg6GeWru+tvoy4Zg6vTOer35rGESUjH
 ZLnSrgMihgYgSGY0sxhStfMjReeOzgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:53PM +0530, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
