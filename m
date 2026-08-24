Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF439EF25
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558741; cv=none; b=OxHFJmOxeN1wtqRDyH5yPTppbQCn3IzEkBsOsnvNrrE0pycJfSM9YYGBXU0+AJGWi1ThWoya/ebibYX2Da7cMFpj58VUFYumdiFr13cxpkgVqZV28bdoCW5EWEz7tIhp56XDlqHBnOioCSO2Yz0OXNwuZhyQGJbI1fT/HHFy0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558741; c=relaxed/simple;
	bh=t1Q5l7E2NYA9ruZLWO4AvWE7k4IA7tU8aqEhVm7aL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk46nSvkFdwQp3sYMbI6hmIwl5nIqmvpF3FUGXsT6K0vl5v8279xTBxTgmw+AqX4Ic5Ti8WeP2FTp8F56pk7VeDIio6V9UH/Ts/SdU7XZOKefNXL2F5Vm6k8mNF0cu/6hW8ySSuekFiwFMJhWmBlZOReN/pJUlbELZMqrM2nUCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ+irut3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjTBMApy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ+irut3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjTBMApy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7j2Nw1184562
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HO6pzy8hdqwatnNdzVyG4rmy
	PCjNL3yeag8ExcEKy7g=; b=BJ+irut3ccBgSn9wUrIC8NiLjx7J+5GHz2zCyAfg
	A2OvEI5Q3CevhJ44/P0AC4Jz1rM1QpE6XZjwDbKvDNmxxw9xhTvYbcU8X6gE94Qf
	mWEnUDu5yrN3oKpK9CRiDwIGrUia9s0SZ+vcuw2U6i8w2lvw15RIo6gTG0Tzi+Cr
	+0fb7zkrlJ8tPuedh3pz1nIFcri8F8i8+/2GuiPZ2Vqz+sbqa1jMBNKM1K/Fwn0P
	t9+xZhLQ4K1/iPFGgJwPv0WS2mwX+268KJKgCH15hgXf69o6GlB1U27jAKU8CA5s
	buPRDVD189ykC7yT2EOTNRVO/szpXkxePWJilRKqVFkLog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf02nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:05:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so68509691cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558738; x=1788163538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HO6pzy8hdqwatnNdzVyG4rmyPCjNL3yeag8ExcEKy7g=;
        b=XjTBMApyb9gtgEJaJh+1p1yvlAsu6RD9Bp66iKklAxeRSgL8lrxCvdfYI+sRtyx+39
         TLthtbfdsltmxtH5oW+MZrruMqnsNY7vUeLfjiNEDL8ykjhsvW0YSqgtL1gMjgdFZgMU
         8MJnt17ShFbhvmgFux+DWRAjwAqwbW6LGZqxqk1VFx9qLLJqRUpg2yzvjyzMPjOWQuYb
         yXkVvrWy4xRmLdizVnx3zPoT64mnR8T2qlR35LoVsAOLwAJzWugz4MH9U3ziEXRaxAnJ
         KBYHnsenGr1+sSuTbF/H8YYRXTYBAwmL81gg1nICRom03DcngM5Ey/Q7Aiuf7v4qmzRX
         lPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558738; x=1788163538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO6pzy8hdqwatnNdzVyG4rmyPCjNL3yeag8ExcEKy7g=;
        b=bh10DS/XKhfHsoL4/3JZZvv2F6BUx4Kwzk5LX7U2gIxwT8S5GtCbo/dZZ0sHEpET3K
         XitlFWZkJ6+AyWCsLBzj4T+LIMhVw3DBK2n+Azcz0hmnUtAhHFHHb8CcCmA58BQdW17K
         ZED+EjfQ9hphsmf+O4a5yCrnAV8vMZWvaLD4llB4sNsxXnqnyJe+N7uBSs66s7rdF6IW
         RwcnFq6OJJfuashgn8hyzKYS3kud04b3bbRVg8F1f6EONAZnOyeI/IRJFxp2ZvoE7tVT
         3xsnK1CqkePT/XxDVmG50X+GyufzURIYvn87G3/2IKh8ftBMW4clO8nn/Wueq3T/GeiY
         cZ4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrmq2SkovDxVbZpY/cXf5/uYLxN5jAivPP/iPGfyawEaZUG/2xE82wErWvcPZU2ynHyULGcg0OQbXypX6YB@vger.kernel.org
X-Gm-Message-State: AFuF++kuRkvYOSJY3WUPUbM3BCD23lvI3dKGLW82n3tfunBE7rtkJsQm
	0XKjCj9frxsGFkLL6+aotJNBZQNDQBd1GlRfEqSZ3wbzBMm/SbmgDpEmQ2Almd0MKjeRpyZnwXF
	3P21oVNym8jXwo+rJ69q+0B0yn9wccxhIcZDFrjIlc+y4tT4XV5HBR1eKMvdmlhV6qjpn
X-Gm-Gg: AR+sD13CbYhaJxG5dcNhrr5bQcI/zByxpxkvbvx9hP436VYcOVoOW0mo+bY8dbOWxvN
	4p4IMv2y5jMfpsEHiFxaTqRo43FdaUM4Md8QDYP8XCdIM/hsYlQLJjpvP4iNSE07ms5p0EyxP5g
	rkbEsheupkq76WAis3nT6sUT9C3GHfWfKkBQEv0vOCzuPfPCM7Fi2ciHb4p2vfTjfsxtXb0QG2P
	6SDxDQeAmbrcqQbMmMlD1uRB2VGMfDjoBYajJDDYWgPTflQC6Ss6ICe2VhqSPa8Y8kBVcK9BcmO
	k8veWHLnAmYjfmm2OyfLPW5yB5kKTqUyBHH8kn9xuAMFoiztG06GImhk78gijTdjd94etTdf5/U
	chbqsEGEC2Gb+X7U=
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr169365451cf.18.1787558738052;
        Mon, 24 Aug 2026 01:05:38 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr169364541cf.18.1787558736879;
        Mon, 24 Aug 2026 01:05:36 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1739877966b.28.2026.08.24.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:05:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:05:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
Message-ID: <snkzt5xwhkm7lueb5vp5bqjr2b7devmh4mnawlbjptl2gcuq6b@khutwr5w2zdn>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfX9MGc8kCj7a8/
 PR32HHD6WCBlJvwsqKJ5AsFr/Hddk2uqpVsFNGrm17726d0sPbof1FkySkTkOpzN8Qjxy3eRWnX
 ny/kKXFzw3gbMGUme8eZCvU2NS/4nGE=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8bfb52 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NRsfW3TrJ5DpF7k1lDTIfESWnTAzc6t6
X-Proofpoint-GUID: NRsfW3TrJ5DpF7k1lDTIfESWnTAzc6t6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfXzu5iZ4kczVWR
 NfR72cSW33xnGpGZpMc//pcPgNqI2a3cC+HYQpQof5EbwAmlDvJJdk87ZJVbu8wfqiRy2m6/KxC
 UMG7F747REUWT9M8HRlM9QO1E6Sbq/r/vNiqL86766xLHu7j41rCuFYIWH/9wsYTQ/w2iJPG9uE
 1ZYICLpEKCvRMQWNzqzJjUp5aWXgmS9uyWixHkre49RoxZrKcYSpXlPtHmLsKDaTt7yhkUINvsw
 /828QjMkNjAPvymh5KRQIGHpAe2xbhqwtsR4Qv78hGD8SIweueb2xhxDV8umcVLPEtIrFhiPrJj
 j/gv0vr1IYFoVnBpEQy+gX25HftrNUy+aa/eLOIv8jQE4dKhkMwvDozwjRDkE6Gz0IroN2l9IYH
 fWrn9gtjhYfGs+LbXSN5F6XC2oNvdxM5oUIaN2TSwKzHFRfHxlXW5PlGaNaiIxc1TzMJ7yHzalz
 IrlceM8BM60CAdWjkFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240070

On 26-08-24 01:17:42, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
